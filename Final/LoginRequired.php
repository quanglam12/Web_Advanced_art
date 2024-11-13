<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/css.css">
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
    <title>Thông báo</title>
    <style>
        .container {
            text-align: center;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .button:hover {
            background-color: #0056b3;
        }
    </style>
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

    </div>
    <div class="container">
        <h2>Bạn cần đăng nhập để thực hiện chức năng này</h2>
        <a href="Home.php" class="button">Trang chủ</a>
        <a href="auth.php" class="button">Đăng nhập / Đăng ký</a>
    </div>
</body>

</html>