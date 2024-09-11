<?php
require 'db_connect.php';
include 'auto_login.php';
$user = autoLogin($conn);
$sql = "SELECT * FROM images";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $imgs = $result->fetch_assoc();
        }