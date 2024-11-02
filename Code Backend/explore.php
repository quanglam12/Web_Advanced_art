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
            <input type="text" placeholder="Tìm kiếm ý tưởng của bạn">
            <button type="button">🔍</button>
        </div>
        <button class="btn">Tạo ảnh</button>
        <button class="btn">Thanh công cụ</button>
    </div>

    <div class="tags-container">
        <?php
        include 'db_connect.php';

        $categorySql = "SELECT * FROM categories";
        $categoryResult = $conn->query($categorySql);

        if ($categoryResult->num_rows > 0) {
            while ($categoryRow = $categoryResult->fetch_assoc()) {
                echo "<button class='tag' data-category-id='" . $categoryRow['id'] . "'>" . $categoryRow['category_name'] . "</button>";
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