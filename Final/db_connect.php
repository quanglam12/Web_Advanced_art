<?php
$servername = "localhost";
$dbUsername = "root"; 
$dbPassword = "";  
$dbname = "data_web_art";

$conn = new mysqli($servername, $dbUsername, $dbPassword, $dbname);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

$conn->set_charset("utf8");

