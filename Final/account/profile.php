<?php
require '../db_connect.php';
include '../auto_login.php';
$user = autoLogin($conn);

if (isset($_GET['id']) && isset($_GET['username'])) {
    $id = $_GET['id'];
    $username = $_GET['username'];
    $sql = "SELECT * FROM user_account WHERE user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $profile = $result->fetch_assoc();
    }

} else {
    echo "Tài khoản không tồn tại.";
}

$images_sql = "SELECT * FROM images WHERE artist_id = ?";
$images_stmt = $conn->prepare($images_sql);
$images_stmt->bind_param("i", $id);
$images_stmt->execute();
$images_result = $images_stmt->get_result();

$conn->close();
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="/dashboard/Web_art/css/css.css">
    <link rel="stylesheet" type="text/css" href="/dashboard/Web_art/css/userprofile.css">
    <title>Trang Cá Nhân - <?php echo htmlspecialchars($profile['username']); ?></title>
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
                <img src="<?php echo "/dashboard/Web_art/" . htmlspecialchars($user['profile_picture']); ?>" alt="Avatar" width="50" height="50">
                <div class="user-menu-content">
                    <a href="/dashboard/Web_art/collection.php">
                        <div class="menu-item">Bộ sưu tập</div>
                    </a>
                    <a href="/dashboard/Web_art/profile.php">
                        <div class="menu-item">Cài đặt</div>
                    </a>
                    <a href="/dashboard/Web_art/logout.php">
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
    <div class="profile-header">
        <img src="/dashboard/Web_art<?php echo htmlspecialchars($profile['profile_picture']); ?>" alt="Profile Picture"
            class="profile-picture">
        <h1><?php echo htmlspecialchars($profile['fullname']); ?></h1>
        <p>Email: <?php echo htmlspecialchars($profile['email']); ?></p>
        <p>Số điện thoại: <?php echo htmlspecialchars($profile['phone_number']); ?></p>
        <p>Giới tính: <?php echo htmlspecialchars($profile['gender']); ?></p>
        <p>Ngày sinh: <?php echo htmlspecialchars($profile['date_of_birth']); ?></p>
        <p>Địa chỉ: <?php echo htmlspecialchars($profile['address']); ?></p>
    </div>

    <div class="image-gallery">
        <h2>Ảnh Đã Đăng</h2>
        <?php
        if ($images_result->num_rows > 0) {
            while ($image = $images_result->fetch_assoc()) {
                echo "<div class='image-item'>";
                echo "<img src='dashboard/Web_art" . htmlspecialchars($image['path']) . "' alt='" . htmlspecialchars($image['name']) . "' class='thumbnail'>";
                echo "<p class='image-name'>" . htmlspecialchars($image['name']) . "</p>";
                echo "<p class='image-date'>Ngày tải lên: " . $image['uploaded_at'] . "</p>";
                echo "<p class='image-description'>" . htmlspecialchars($image['description']) . "</p>";
                echo "</div>";
            }
        } else {
            echo "<p>Chưa có ảnh nào được đăng.</p>";
        }
        ?>
    </div>
</body>

</html>