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
    echo "ID hoặc Username không tồn tại.";
}
