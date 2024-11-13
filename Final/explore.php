<?php
include "auto_login.php";
$user = autoLogin($conn);
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khám Phá Hình Ảnh</title>
    <link rel="stylesheet" href="css/css.css">
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
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

    <div class="tags-container">
        <?php
        include 'db_connect.php';

        $categorySql = "SELECT * FROM categories";
        $categoryResult = $conn->query($categorySql);

        if ($categoryResult->num_rows > 0) {
            while ($categoryRow = $categoryResult->fetch_assoc()) {
                echo "<button class='tag' data-category-id='" . $categoryRow['cat_id'] . "'>" . $categoryRow['category_name'] . "</button>";
            }
        } else {
            echo "<p>Không có danh mục nào.</p>";
        }
        ?>
    </div>

    <div class="image-gallery">
    </div>
    <div class="modal" id="modal" style="display:none;">
        <span class="close" id="close">&times;</span>
        <img class="modal-content" id="modal-image">
        <div class="modal-details">
            <h2 id="modal-name"></h2>
            <p><strong>Tác giả:</strong> <span id="modal-artist"></span></p>
            <p><strong>Kích thước:</strong> <span id="modal-size"></span></p>
            <p><strong>Danh mục:</strong> <span id="modal-category"></span></p>
            <p><strong>Mô tả:</strong> <span id="modal-description"></span></p>
            <p><strong>Tags:</strong> <span id="modal-tags"></span></p>
            <a id="download-link" href="#" download class="download-btn">Tải xuống</a>
        </div>
    </div>

    <script src="js/display_detail_img.js"></script>
    <script src="js/display_img_explore.js"></script>

</body>

</html>