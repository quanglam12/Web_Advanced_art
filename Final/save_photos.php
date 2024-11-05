<?php
require 'db_connect.php';
include 'auto_login.php';
$user = autoLogin($conn);
if ($user) {
} else {
    header('Location: auth.php');
}
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Đăng tải thành công</title>
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/css.css">
    <link rel="stylesheet" type="text/css" href="css/save_photos.css">
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
    <div class="button-container"> <button onclick="location.href='Home.php'">Trang chủ</button> <button
            onclick="location.href='collection.php'">Bộ sưu tập</button> <button
            onclick="location.href='upload_photos.php'">Đăng tải hình ảnh</button> </div>
    <div class="upload-messages">

        <?php

        if (isset($_POST['upload'])) {
            $imageNames = $_FILES['images']['name'];
            $imageTmpNames = $_FILES['images']['tmp_name'];
            $imageSizes = $_FILES['images']['size'];
            $imageErrors = $_FILES['images']['error'];
            $names = $_POST['names'];
            $descriptions = $_POST['descriptions'];
            $categories = $_POST['categories'];
            $tags = $_POST['tags'];

            $condition = "";
            $token_id = "";
            $type = "";

            if (isset($_COOKIE['token'])) {
                $condition = "session_token = ?";
                $token_id = $_COOKIE['token'];
                $type = "s";
            } elseif (isset($_SESSION['user_id'])) {
                $condition = "user_id = ?";
                $token_id = $_SESSION['user_id'];
                $type = "i";
            }

            $query = "SELECT username, fullname, user_id FROM user_account WHERE " . $condition;
            $stmtquery = $conn->prepare($query);
            if ($stmtquery === false) {
                die('Prepare failed: ' . htmlspecialchars($conn->error));
            }
            $stmtquery->bind_param($type, $token_id);
            $stmtquery->execute();
            $result = $stmtquery->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $userID = $row['user_id'];
                $username = $row['username'];
                $fullname = $row['fullname'];
                $userURL = '/' . $userID . '-' . $username;

                foreach ($imageNames as $index => $imageName) {
                    if ($imageErrors[$index] == 0) {
                        $imageTmpName = $imageTmpNames[$index];
                        $size = $imageSizes[$index];
                        $filetype = pathinfo($imageName, PATHINFO_EXTENSION);
                        $uniqueImageName = $userID . '-' . uniqid('', true) . '.' . $filetype;
                        $imagePath = './uploads/' . $uniqueImageName;

                        if (move_uploaded_file($imageTmpName, $imagePath)) {
                            $name = $conn->real_escape_string($names[$index]);
                            $description = $conn->real_escape_string($descriptions[$index]);
                            $category = $conn->real_escape_string($categories[$index]);
                            $tag = $conn->real_escape_string($tags[$index]);

                            $sql = "INSERT INTO images (name, alt_text, title, path, size, mime_type, description, artist, artist_url, artist_id, category_id, tags) 
                            VALUES ('$name','$name', '$name', '$imagePath', '$size', '$filetype', '$description', '$fullname', '$userURL', '$userID', '$category','$tag')";

                            if ($conn->query($sql) === TRUE) {
                                echo "<p>Hình ảnh '$name' đã được tải lên!</p>";
                            } else {
                                echo "<p>Lỗi: " . $sql . "</p>" . $conn->error;
                            }
                        } else {
                            echo "<p>Tải hình ảnh '$imageName' thất bại.</p>";
                        }
                    } else {
                        echo "<p>Không có tập tin hoặc có lỗi tải lên '$imageName'.</p>";
                    }
                }
            }
        }

        $conn->close();
        ?>
    </div>
</body>

</html>