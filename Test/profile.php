<?php
require 'db_connect.php'; 
include 'auto_login.php';
$user = autoLogin($conn);

?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thông tin người dùng</title>
</head>
<body>
    <h2>Thông tin người dùng</h2>
    <form action="update_profile.php" method="POST" enctype="multipart/form-data">
        <label for="avatar">Ảnh đại diện:</label><br>
        <img src="<?php echo htmlspecialchars($user['profile_picture']); ?>" alt="Avatar" style="width:100px;height:100px;"><br>
        <input type="file" name="avatar" id="avatar" accept="image/*"><br>
        <img id="preview" src="#" alt="Xem trước ảnh" style="display:none; width:100px; height:100px; margin-top:10px;"><br>
        <p id="error-message" class="error"></p>

        <label for="fullname">Họ và tên:</label><br>
        <input type="text" name="fullname" id="fullname" value="<?php echo htmlspecialchars($user['fullname']); ?>"><br>

        <label for="email">Email:</label><br>
        <input type="email" name="email" id="email" value="<?php echo htmlspecialchars($user['email']); ?>"><br>

        <label for="phone">Số điện thoại:</label><br>
        <input type="text" name="phone" id="phone" value="<?php echo htmlspecialchars($user['phone_number']); ?>"><br>

        <label for="dob">Ngày sinh:</label><br>
        <input type="date" name="dob" id="dob" value="<?php echo htmlspecialchars($user['date_of_birth']); ?>"><br>

        <label for="address">Địa chỉ:</label><br>
        <input type="text" name="address" id="address" value="<?php echo htmlspecialchars($user['address']); ?>"><br>

        <label for="gender">Giới tính:</label><br>
        <select name="gender" id="gender">
            <option value="Male" <?php echo ($user['gender'] == 'Male') ? 'selected' : ''; ?>>Nam</option>
            <option value="Female" <?php echo ($user['gender'] == 'Female') ? 'selected' : ''; ?>>Nữ</option>
            <option value="Other" <?php echo ($user['gender'] == 'Other') ? 'selected' : ''; ?>>Khác</option>
        </select><br>

        <input type="submit" value="Cập nhật thông tin">
    </form>
    <script>
     document.getElementById('avatar').addEventListener('change', function(event) {
            const file = event.target.files[0]
            const errorMessage = document.getElementById('error-message');
            
            errorMessage.textContent = ''

            if (file) {
                const fileType = file.type;
                const allowedTypes = ['image/jpeg', 'image/png', 'image/jpg'];
                if (!allowedTypes.includes(fileType)) {
                    const img = document.getElementById('preview')
                    img.style.display = 'none'
                    errorMessage.textContent = 'Chỉ chấp nhận các định dạng JPG, PNG, JPEG.'
                    event.target.value = ''
                    return;
                }

                if (file.size > 5000000) {
                    const img = document.getElementById('preview')
                    img.style.display = 'none'
                    errorMessage.textContent = 'File của bạn quá lớn. Giới hạn là 5MB.'
                    event.target.value = ''
                    return;
                }

                const reader = new FileReader()
                reader.onload = function(e) {
                    const img = document.getElementById('preview')
                    img.src = e.target.result
                    img.style.display = 'block'
                    preview.appendChild(img)
                }
                reader.readAsDataURL(file)
            }
        });
    </script>
</body>
</html>