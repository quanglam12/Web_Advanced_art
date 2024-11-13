<?php
include "auto_login.php";
$user = autoLogin($conn);
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả tìm kiếm</title>
    <link rel="stylesheet" href="css/css.css">
    <link rel="stylesheet" href="css/search.css">
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
    <div class="search-image">
        <?php
        require 'db_connect.php';

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $keyword = trim($_POST['keyword']);

            $sql = "SELECT * FROM images WHERE name LIKE ? OR description LIKE ? OR artist LIKE ? ORDER BY uploaded_at DESC";
            $stmt = $conn->prepare($sql);
            $keyword_param = "%" . $keyword . "%";
            $stmt->bind_param("sss", $keyword_param, $keyword_param, $keyword_param);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo '<div>';
                    echo '<img src="' . $row['path'] . '" alt="' . $row['name'] . '">';
                    echo '<p>' . $row['name'] . '</p>';
                    echo '<a href="' . $row['artist_url'] . '"><p>' . $row['artist'] . '</p></a>';
                    echo '<p>' . $row['description'] . '</p>';
                    echo '</div>';
                }
            } else {
                echo "Không tìm thấy kết quả nào.";
            }

            $stmt->close();
        }
        $conn->close();
        ?>
    </div>
</body>