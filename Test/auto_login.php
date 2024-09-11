<?php
require 'db_connect.php'; 
session_start();
function autoLogin($conn) {
    if (isset($_COOKIE['token'])) {
        $token = $_COOKIE['token'];
        $sql = "SELECT * FROM user_account WHERE session_token = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $token);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            return $user;
        }
    } elseif (isset($_SESSION['user_id'])) {
        $user_id = $_SESSION['user_id'];
        $sql = "SELECT * FROM user_account WHERE user_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            return $user;
        }
    }
    return null;
}