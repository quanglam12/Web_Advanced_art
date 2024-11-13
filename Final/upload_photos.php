<?php
include 'db_connect.php';
include 'auto_login.php';
$user = autoLogin($conn);
if ($user) {
} else {
    header('Location: LoginRequired.php');
}
$sql = "SELECT cat_id, category_name FROM categories";
$result = $conn->query($sql);
$categoriesOptions = '';

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $categoriesOptions .= '<option value="' . $row['cat_id'] . '">' . htmlspecialchars($row['category_name']) . '</option>';
    }
}
$conn->close();
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Đăng tải hình ảnh</title>
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/css.css">
    <link rel="stylesheet" href="css/upload.css">
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
                    <a href='editImg.php'>
                        <button class="explore-item">Chỉnh sửa ảnh</button>
                    </a>
                </div>
            </div>
        <?php else: ?>
            <div class="auth">
                <a href="auth.php">Đăng nhập</a>
            </div>
        <?php endif; ?>
    </div>
    <h2>Đăng tải hình ảnh</h2>
    <form action="save_photos.php" method="POST" enctype="multipart/form-data" id="uploadForm">
        <input type="file" name="images[]" id="imageInput" accept="image/*" multiple required>
        <div class="image-preview" id="imagePreview"></div>
        <button type="submit" name="upload">Upload</button>
    </form>

    <script>
        const categoriesOptions = `<?php echo $categoriesOptions; ?>`;

        document.getElementById('imageInput').addEventListener('change', async function (event) {
            const files = Array.from(event.target.files);
            const imagePreview = document.getElementById('imagePreview');
            imagePreview.innerHTML = '';

            for (let index = 0; index < files.length; index++) {
                const file = files[index];
                const reader = new FileReader();

                await new Promise(resolve => {
                    reader.onload = function (e) {
                        const div = document.createElement('div');
                        div.classList.add('image-item');
                        div.innerHTML = `
                    <img src="${e.target.result}" alt="Image Preview">
                    <button type="button" class="remove-btn" data-index="${index}">&times;</button>
                    <input type="text" name="names[]" placeholder="Enter name" required>
                    <textarea name="descriptions[]" placeholder="Enter description"></textarea>
                    <select name="categories[]" required>
                        <option value="">Select Category</option>
                        ${categoriesOptions}
                    </select>
                    <input type="text" name="tags[]" placeholder="Enter tags (comma-separated)">
                `;
                        imagePreview.appendChild(div);

                        div.querySelector('.remove-btn').addEventListener('click', function () {
                            files.splice(index, 1);
                            div.remove();

                            const updatedFiles = new DataTransfer();
                            files.forEach(f => updatedFiles.items.add(f));
                            document.getElementById('imageInput').files = updatedFiles.files;
                        });
                        resolve();
                    };
                    reader.readAsDataURL(file);
                });
            }
        });

    </script>
</body>

</html>