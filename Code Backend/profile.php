<?php
require 'db_connect.php';
include 'auto_login.php';
$user = autoLogin($conn);
if ($user) {
}
else {
    header('Location: auth.php');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fullname = $_POST['fullname'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $dob = $_POST['dob'];
    $address = $_POST['address'];
    $gender = $_POST['gender'];

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

    if (isset($_FILES['avatar']) && $_FILES['avatar']['error'] === UPLOAD_ERR_OK) {
        $query = "SELECT user_id, profile_picture, created_at FROM user_account WHERE " . $condition;
        $stmtquery = $conn->prepare($query);
        $stmtquery->bind_param($type, $token_id);
        $stmtquery->execute();
        $result = $stmtquery->get_result();
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $existingAvatarPath = $row['profile_picture'];
        
            if (file_exists($existingAvatarPath)) {
                if (!unlink($existingAvatarPath)) {
                    die("Không thể xóa file avatar cũ.");
                }
            }
            
        $fileTmpPath = $_FILES['avatar']['tmp_name'];
        $fileName = $_FILES['avatar']['name'];
        $fileSize = $_FILES['avatar']['size'];
        $fileType = $_FILES['avatar']['type'];
        $fileExtension = pathinfo($fileName, PATHINFO_EXTENSION);
        $newFileName = md5($row['created_at']) . $row['user_id'] . '.' . $fileExtension;
        $dest_file_path = './avata/' . $newFileName;
        $allowedTypes = ['jpg', 'jpeg', 'png', 'gif'];
        if (!in_array($fileExtension, $allowedTypes)) {
            die('Chỉ chấp nhận các định dạng JPG, JPEG, PNG, GIF.');
        }
        if ($fileSize > 5000000) {
            die('File của bạn quá lớn. Giới hạn là 5MB.');
        }
        if (!move_uploaded_file($fileTmpPath, $dest_file_path)) {
            die('Không thể lưu file. Vui lòng thử lại.');
        }
        $avatarPath = $dest_file_path;
        }
        
    } else {
        $avatarPath = null;
    }

    $sql = "UPDATE user_account SET fullname = ?, email = ?, phone_number = ?, date_of_birth = ?, address = ?, gender = ?, profile_picture = ? WHERE " . $condition;
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die('Lỗi khi chuẩn bị câu lệnh: ' . $conn->error . "+" . $condition . $_SESSION['user_id']);
    }
    $stmt->bind_param("sssssss".$type, $fullname, $email, $phone, $dob, $address, $gender, $avatarPath, $token_id);

    if ($stmt->execute()) {
        echo 'Thông tin đã được cập nhật thành công.';
        header('Location: loadimg.php');
    } else {
        echo 'Lỗi: ' . $stmt->error;
    }

    $stmt->close();
}
$conn->close();
?>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Thông tin người dùng</title>
</head>

<body>
    <h2>Thông tin người dùng</h2>
    <form action="" method="POST" enctype="multipart/form-data">
        <label for="avatar">Ảnh đại diện:</label><br>
        <img src="<?php echo htmlspecialchars($user['profile_picture'] ?? ''); ?>" alt="Avatar"
            style="width:100px;height:100px;"><br>
        <input type="file" name="avatar" id="avatar" accept="image/*"><br>
        <img id="preview" src="#" alt="Xem trước ảnh"
            style="display:none; width:100px; height:100px; margin-top:10px;"><br>
        <p id="error-message" class="error"></p>

        <label for="fullname">Họ và tên:</label><br>
        <input type="text" name="fullname" id="fullname" value="<?php echo htmlspecialchars($user['fullname'] ?? ''); ?>" required><br>

        <label for="email">Email:</label><br>
        <input type="email" name="email" id="email" value="<?php echo htmlspecialchars($user['email'] ?? ''); ?>" required><br>

        <label for="phone">Số điện thoại:</label><br>
        <input type="text" name="phone" id="phone" value="<?php echo htmlspecialchars($user['phone_number'] ?? ''); ?>" required><br>

        <label for="dob">Ngày sinh:</label><br>
        <input type="date" name="dob" id="dob" value="<?php echo htmlspecialchars($user['date_of_birth'] ?? ''); ?>" required><br>

        <label for="address">Địa chỉ:</label><br>
        <input type="text" name="address" id="address" value="<?php echo htmlspecialchars($user['address'] ?? ''); ?>"><br>

        <label for="gender">Giới tính:</label><br>
        <select name="gender" id="gender">
            <option value="Male" <?php echo (($user['gender'] ?? '') == 'Male') ? 'selected' : ''; ?>>Nam</option>
            <option value="Female" <?php echo (($user['gender'] ?? '') == 'Female') ? 'selected' : ''; ?>>Nữ</option>
            <option value="Other" <?php echo (($user['gender'] ?? '') == 'Other') ? 'selected' : ''; ?>>Khác</option>
        </select><br>

        <input type="submit" value="Cập nhật thông tin">
    </form>
    <script>
        document.getElementById('avatar').addEventListener('change', function (event) {
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
                reader.onload = function (e) {
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