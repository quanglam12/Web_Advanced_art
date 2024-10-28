<?php
$servername = "localhost";
$dbUsername = "root"; 
$dbPassword = "";  
$dbname = "data_web_art";

$conn = new mysqli($servername, $dbUsername, $dbPassword,$dbname);
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}
$db_exists_query = "SHOW DATABASES LIKE '$dbname'";
$result = $conn->query($db_exists_query);
if ($result->num_rows == 0) {
    $create_db_query = "CREATE DATABASE $dbname";
    if ($conn->query($create_db_query) === TRUE) {
        echo "Cơ sở dữ liệu '$dbname' đã được tạo thành công.";
    } else {
        echo "Lỗi khi tạo cơ sở dữ liệu: " . $conn->error;
    }
} else {
    echo "Cơ sở dữ liệu '$dbname' đã tồn tại.";
}

$conn->close();