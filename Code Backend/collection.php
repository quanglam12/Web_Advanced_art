<?php
require 'db_connect.php';
require 'auto_login.php';
$user = autoLogin($conn);
if ($user) {
} else {
    header('Location: LoginRequired.php');
    exit;
}

$sql = "SELECT * FROM images JOIN categories ON images.category_id = categories.cat_id WHERE artist_id = ?";
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
    <link rel="stylesheet" type="text/css" href="css/update.css">
</head>

<body>
    <div class="header">
        <h1>Bộ Sưu Tập Của Tôi</h1>
        <a href="upload.php" class="upload-btn">Tải Ảnh Lên</a>
    </div>

    <div class="image-collection">
        <?php
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<div class='image-item'>";
                echo "<img src='" . $row['path'] . "' alt='" . $row['name'] . "' class='thumbnail' data-id='" . $row['id'] . "'>";
                echo "<p class='image-name'>" . htmlspecialchars($row['name']) . "</p>";
                echo "<p class='image-date'>" .'Ngày tải lên: ' . $row['uploaded_at'] . "</p>";
                echo "<p class='image-category'>" .'Danh mục: ' . $row['category_name'] . "</p>";
                echo "<p class='image-tags'>" .'Tags: ' . $row['tags'] . "</p>";
                echo "<p class='image-description'>" .'Mô tả: ' . $row['description'] . "</p>";
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
        <h2>Chỉnh sửa Thông Tin Ảnh</h2>
        <form id="edit-form">
            <input type="hidden" name="image_id" id="image_id">

            <label for="image_preview">Hình Ảnh:</label>
            <img id="image_preview" src="" alt="Image Preview" style="max-width: 100%; margin-bottom: 10px;">

            <label for="name">Tên Ảnh:</label>
            <input type="text" name="name" id="name" required>

            <label for="description">Mô Tả:</label>
            <textarea name="description" id="description"></textarea>

            <label for="category">Danh Mục:</label>
            <select name="category" id="category" required>
                <option value="">Chọn Danh Mục</option>
                <?php foreach ($categories as $category): ?>
                    <option value="<?php echo $category['cat_id']; ?>"><?php echo htmlspecialchars($category['category_name']); ?></option>
                <?php endforeach; ?>
            </select>

            <label for="tags">Tags:</label>
            <input type="text" name="tags" id="tags" placeholder="Nhập các tag, phân cách bằng dấu phẩy">

            <button type="submit" class="save-btn">Lưu Thay Đổi</button>
            <button type="button" class="cancel-btn">Hủy Bỏ</button>
        </form>
    </div>
</div>

    <script>
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
