<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giao Diện</title>
    <link rel="stylesheet" href="css/css.css">
    <link rel="icon" href="../favicon.ico" type="image/x-icon">

</head>

<body>
    <div class="toolbar">
        <img src="../favicon.ico" alt="Logo" class="logo">
        <div class="search-bar">
            <input type="text" placeholder="Tìm kiếm ý tưởng của bạn">
            <button type="button">🔍</button>
        </div>
        <button class="btn">Tạo ảnh</button>
        <button class="btn">Thanh công cụ</button>
    </div>
    <div class="explore-section">
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
        </div>
    </div>
    <div class="tags-container">
        <button class="tag" data-category-id='30'>AI</button>
        <button class="tag" data-category-id='62'>Anime</button>
        <button class="tag" data-category-id='16'>Nature</button>
        <button class="tag" data-category-id='14'>Travel Photos</button>
        <button class="tag" data-category-id='60'>Festival</button>
        <button class="tag" data-category-id='52'>People</button>

    </div>
    <div class="image-gallery">
        <?php
        include 'db_connect.php';

        $sql = "SELECT * FROM images";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<div>";
                echo "<img src='" . $row['path'] . "' alt='" . $row['name'] . "' class='thumbnail' data-id='" . $row['id'] . "' data-category-id='" . $row['category_id'] . "'>";
                echo "<p class='imgname'>" . $row['name'] . "</p>";
                echo "<p class='imgartist' > <a href='" . $row['artist_url'] . "'>" . 'Tác giả: ' . $row['artist'] . "</a></p>";
                echo "</div>";
            }
        }

        $conn->close();
        ?>
    </div>

    <div class="modal" id="modal">
        <span class="close" id="close">&times;</span>
        <img class="modal-content" id="modal-image">
        <div class="modal-details">
            <h2 id="modal-name"></h2>
            <p><strong>Tác giả:</strong> <span id="modal-artist"></span></p>
            <p><strong>Kích thước:</strong> <span id="modal-size"></span></p>
            <p><strong>Danh mục</strong> <span id="modal-category"></span></p>
            <p><strong>Mô tả:</strong> <span id="modal-description"></span></p>
            <p><strong>Tags:</strong> <span id="modal-tags"></span></p>
            <a id="download-link" href="#" download class="download-btn">Tải xuống</a>
        </div>
    </div>


    <script src='js/display_detail_img.js'></script>
    <script src='js/filter_img.js'></script>

</body>

</html>