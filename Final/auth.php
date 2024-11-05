<?php
require 'db_connect.php';
require 'auto_login.php';

$user = autoLogin($conn);

if ($user) {
    header('Location: Home.php');
    exit;
}


?>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký & Đăng Nhập</title>
    <link rel="stylesheet" href="css/register.css">
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
</head>

    <div class="toolbar">
        <img src="../favicon.ico" alt="Logo" class="logo">
    </div>
    <div class="form-container">
        <div class="login-form" id="loginForm">
            <h2>Đăng Nhập</h2>
            <form action="auth.php" method="POST">
                <input type="hidden" name="action" value="login">
                <label for="username">Username hoặc Email:</label>
                <input type="text" id="usernameLogin" name="username" required><br>

                <label for="password">Password:</label>
                <input type="password" id="passwordLogin" name="password" required><br>
                <label>
                    <input type="checkbox" name="remember_me"> Lưu đăng nhập
                </label><br>
                <button type="submit">Đăng Nhập</button>
            </form>
            <p>Chưa có tài khoản? <a href="#" onclick="showRegisterForm()" class="auth-link">Đăng ký ngay</a></p>
        </div>

        <div class="registration-form" id="registerForm" style="display: none;">
            <h2>Đăng Ký Tài Khoản</h2>
            <form action="auth.php" method="POST">
                <input type="hidden" name="action" value="register">
                <label for="username">Username hoặc Email:</label>
                <input type="text" id="usernameRegister" name="username" required><br>

                <label for="password">Password:</label>
                <input type="password" id="passwordRegister" name="password" required><br>

                <label for="confirm_password">Nhập lại Password:</label>
                <input type="password" id="confirm_password" name="confirm_password" required><br>

                <button type="submit">Đăng Ký</button>
            </form>
            <p>Đã có tài khoản? <a href="#" onclick="showLoginForm()" class="auth-link">Đăng nhập ngay</a></p>
        </div>
    </div>

    <?php
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
    
            $checkExist = $conn->prepare("SELECT * FROM user_account WHERE username = ?");
            $checkExist->bind_param("s", $username);
            $checkExist->execute();
            $result = $checkExist->get_result();
    
            if ($result->num_rows > 0) {
                echo "Username hoặc Email đã tồn tại!";
            } else {
                $avt_default = "./avata/avatar-default.jpg";
                $sql = "INSERT INTO user_account (username, email, password, profile_picture) VALUES (?, ?, ?, ?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("ssss", $username, $email, $hashedPassword, $avt_default);
    
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
    <script>

        function showLoginForm() {
            document.getElementById('registerForm').style.display = 'none';
            document.getElementById('loginForm').style.display = 'block';
        }

        function showRegisterForm() {
            document.getElementById('loginForm').style.display = 'none';
            document.getElementById('registerForm').style.display = 'block';
        }
    </script>
</body>

</html>