<?php
require 'db_connect.php';
require 'auto_login.php';

$user = autoLogin($conn);

if ($user) {
    header('Location: Home.php');
    exit;
}


if (isset($_POST['action']) && $_POST['action'] == 'register') {
    $userInput = $_POST['username'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirm_password'];

    if ($password !== $confirmPassword) {
        echo "Mật khẩu nhập lại không khớp!";
    } else {
        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

        if (filter_var($userInput, FILTER_VALIDATE_EMAIL)) {
            $email = $userInput;
            $username = $userInput;
        } else {
            $username = $userInput;
            $email = '';
        }

        $checkExist = $conn->prepare("SELECT * FROM user_account WHERE username = ? OR email = ?");
        $checkExist->bind_param("ss", $username, $email);
        $checkExist->execute();
        $result = $checkExist->get_result();

        if ($result->num_rows > 0) {
            echo "Username hoặc Email đã tồn tại!";
        } else {
            $sql = "INSERT INTO user_account (username, email, password) VALUES (?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sss", $username, $email, $hashedPassword);

            if ($stmt->execute() === TRUE) {
                $user_id = $conn->insert_id;
                session_regenerate_id(true);
                $_SESSION['user_id'] = $user_id;
                $_SESSION['login_time'] = time();
                header('Location: profile.php');
            } else {
                echo "Lỗi: " . $conn->error;
            }

            $stmt->close();
        }
    }
}

if (isset($_POST['action']) && $_POST['action'] == 'login') {
    $userInput = $_POST['username'];
    $password = $_POST['password'];
    $rememberMe = isset($_POST['remember_me']);

    if (filter_var($userInput, FILTER_VALIDATE_EMAIL)) {
        $sql = "SELECT * FROM user_account WHERE email = ?";
    } else {
        $sql = "SELECT * FROM user_account WHERE username = ?";
    }

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $userInput);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        if (password_verify($password, $user['password'])) {
            $_SESSION['user_id'] = $user['user_id'];

            if ($rememberMe) {
                $token = bin2hex(random_bytes(16));

                $sqlUpdate = "UPDATE user_account SET session_token = ? WHERE user_id = ?";
                $stmtUpdate = $conn->prepare($sqlUpdate);
                $stmtUpdate->bind_param("si", $token, $user['user_id']);
                $stmtUpdate->execute();

                setcookie('token', $token, time() + (30 * 24 * 60 * 60), "/");
            } else {
                session_regenerate_id(true);
                $_SESSION['user_id'] = $user['user_id'];
                $_SESSION['login_time'] = time();
            }
            header('Location: Home.php');
        } else {
            echo "Mật khẩu không chính xác!";
        }
    } else {
        echo "Username hoặc Email không tồn tại!";
    }
}


$conn->close();
?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Đăng Ký & Đăng Nhập</title>
</head>

<body>
<!--
    <h2>Đăng Ký</h2>
    <form action="auth.php" method="POST">
        <input type="hidden" name="action" value="register">
        <label for="username">Username hoặc Email:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <label for="confirm_password">Nhập lại Password:</label>
        <input type="password" id="confirm_password" name="confirm_password" required><br>

        <button type="submit">Đăng Ký</button>
    </form>

-->
    <h2>Đăng Nhập</h2>
    <form action="auth.php" method="POST">
        <input type="hidden" name="action" value="login">
        <label for="username">Username hoặc Email:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <label>
            <input type="checkbox" name="remember_me"> Lưu đăng nhập
        </label><br>
        <button type="submit">Đăng Nhập</button>
    </form>
</body>

</html>