<?php
include 'auto_login.php';
require 'db_connect.php';
$user = autoLogin($conn);
if ($user == null) {
    header('Location: auth.php');
}

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_FILES['image']) && isset($_POST['name']) && isset($_POST['size']) && isset($_POST['format'])) {

    $userID = $user['user_id'];
    $username = $user['username'];
    $fullname = $user['fullname'];
    $userURL = '/' . $userID . '-' . $username;

    $name = $_POST['name'];
    $size = $_POST['size'];
    $format = $_POST['format'];
    $imageData = $_FILES['image'];
    $catid = 63;

    $uniqueImageName = $userID . '-' . uniqid('', true) . '.' . $format;
    $imagePath = './imgFilerobotEditor/' . $uniqueImageName;

    if (move_uploaded_file($imageData['tmp_name'], $imagePath)) {

        $sql = "INSERT INTO images (name, path, size, mime_type, artist, artist_url, artist_id, category_id) 
        VALUES ('$name', '$imagePath', '$size', '$format', '$fullname', '$userURL', '$userID', '$catid')";

        if ($conn->query($sql) === TRUE) {
            echo "Image uploaded and data saved successfully.";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } else {
        echo "Error uploading the image.";
    }
} else {
    echo "Missing required fields.";
}

$conn->close();