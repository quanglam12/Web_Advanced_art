<?php
require 'db_connect.php';
require 'auto_login.php';
$user = autoLogin($conn);
if ($user) {
} else {
    header('Location: LoginRequired.php');
    exit;
}

$sql = "SELECT * FROM images JOIN categories ON images.category_id = categories.cat_id WHERE artist_id = ? ORDER BY uploaded_at DESC";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user['user_id']);
$stmt->execute();
$result = $stmt->get_result();

$categorySql = "SELECT * FROM categories";
$categoryResult = $conn->query($categorySql);
$categories = [];
if ($categoryResult->num_rows > 0) {
    while ($categoryRow = $categoryResult->fetch_assoc()) {
        $categories[] = $categoryRow;
    }
}
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bộ Sưu Tập</title>
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="css/css.css">
    <link rel="stylesheet" type="text/css" href="css/update.css">
</head>

<body>
    <div class="toolbar">
        <a href="Home.php">
            <img src="../favicon.ico" alt="Logo" class="logo">
        </a>
        <div class="search-bar">
            <form id="search-form" action="searchImg.php" method="POST">
                <input type="text" name="keyword" placeholder="Tìm kiếm ý tưởng của bạn">
                <button type="submit">🔍</button>
            </form>
        </div>

        <div class="explore-items">
            <a href="explore.php">
                <button class="explore-item">Khám phá</button>
            </a>
            <a href='upload_photos.php'>
                <button class="explore-item">
                    Đăng tải hình ảnh
                </button>
            </a>
            <a href='createimgAI.php'>
                <button class="explore-item">Tạo ảnh bằng AI</button>
            </a>
            <a href='editImg.php'>
                <button class="explore-item">Chỉnh sửa ảnh</button>
            </a>
        </div>

        <?php if ($user): ?>
            <div class="user-menu">
                <img src="<?php echo htmlspecialchars($user['profile_picture']); ?>" alt="Avatar" width="50" height="50">
                <div class="user-menu-content">
                    <a href="collection.php">
                        <div class="menu-item">Bộ sưu tập</div>
                    </a>
                    <a href="profile.php">
                        <div class="menu-item">Cài đặt</div>
                    </a>
                    <a href="logout.php">
                        <div class="menu-item">Đăng xuất</div>
                    </a>
                </div>
            </div>
        <?php else: ?>
            <div class="auth">
                <a href="auth.php">Đăng nhập</a>
            </div>
        <?php endif; ?>
    </div>
    <div class="image-avatar">
        <img src="<?php echo htmlspecialchars($user['profile_picture']) ?>" alt="Avatar">
    </div>
    <h1 class="collection">Bộ Sưu Tập Của Tôi</h1>
    <div class="tags-container">
        <button class="tag"><a href="upload_photos.php">Tải Ảnh Lên</a></button>
    </div>

    <div class="image-gallery">
        <?php
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<div class='image-item'>";
                echo "<img src='" . $row['path'] . "' alt='" . $row['name'] . "' class='thumbnail' data-id='" . $row['id'] . "'>";
                echo "<p class='image-name'>" . htmlspecialchars($row['name']) . "</p>";
                echo "<p class='image-date'>" . 'Ngày tải lên: ' . $row['uploaded_at'] . "</p>";
                echo "<p class='image-category'>" . 'Danh mục: ' . $row['category_name'] . "</p>";
                echo "<p class='image-tags'>" . 'Tags: ' . $row['tags'] . "</p>";
                echo "<p class='image-description'>" . 'Mô tả: ' . $row['description'] . "</p>";
                echo "<button class='edit-btn' data-id='" . $row['id'] . "'>Chỉnh sửa</button>";
                echo "<button class='delete-btn' data-id='" . $row['id'] . "'>Xóa</button>";
                echo "</div>";
            }
        } else {
            echo "<p>Chưa có ảnh nào được tải lên.</p>";
        }
        ?>
    </div>

    <div id="editImageModal" class="modal">
        <div class="modal-content">
            <span class="close-btn">&times;</span>
            <div class="modal-body">
                <div class="image-section">
                    <img id="image_preview" src="" alt="Image Preview">
                </div>
                <div class="form-section">
                    <h2>Chỉnh sửa Thông Tin Ảnh</h2>
                    <form id="edit-form">
                        <input type="hidden" name="image_id" id="image_id">

                        <label for="name">Tên Ảnh:</label>
                        <input type="text" name="name" id="name" required>

                        <label for="description">Mô Tả:</label>
                        <textarea name="description" id="description"></textarea>

                        <label for="category">Danh Mục:</label>
                        <select name="category" id="category" required>
                            <option value="">Chọn Danh Mục</option>
                            <?php foreach ($categories as $category): ?>
                                <option value="<?php echo $category['cat_id']; ?>">
                                    <?php echo htmlspecialchars($category['category_name']); ?>
                                </option>
                            <?php endforeach; ?>
                        </select>

                        <label for="tags">Tags:</label>
                        <input type="text" name="tags" id="tags" placeholder="Nhập các tag, phân cách bằng dấu phẩy">

                        <button type="submit" class="save-btn">Lưu Thay Đổi</button>
                        <button type="button" class="cancel-btn">Hủy Bỏ</button>
                        <button type="button" class="editfilerobot" onclick="rederect2EditImg()">Filerobot Editor</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function rederect2EditImg(){
            const idImg =document.getElementById("image_id").value;
            window.open("./editImg.php?id=" + idImg);
        }
        const deleteButtons = document.querySelectorAll('.delete-btn');

        deleteButtons.forEach(button => {
            button.addEventListener('click', () => {
                const imageId = button.dataset.id;
                if (confirm("Bạn có chắc chắn muốn xóa ảnh này?")) {
                    fetch(`delete_img.php?id=${imageId}`, { method: 'GET' })
                        .then(response => response.text())
                        .then(data => {
                            if (data === 'success') {
                                button.parentElement.remove();
                                alert("Ảnh đã được xóa thành công.");
                            } else {
                                alert("Xóa ảnh thất bại. Vui lòng thử lại.");
                            }
                        })
                        .catch(error => {
                            console.error('Lỗi:', error);
                        });
                }
            });
        });
    </script>
    <script src="js/update_img.js"></script>
</body>

</html>