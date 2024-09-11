<?php
require 'db_connect.php';

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
    $stmt->bind_param("sssssss".$type, $fullname, $email, $phone, $dob, $address, $gender, $avatarPath, $token_id);

    if ($stmt->execute()) {
        echo 'Thông tin đã được cập nhật thành công.';
    } else {
        echo 'Lỗi: ' . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
