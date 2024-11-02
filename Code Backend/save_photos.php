<?php
require 'db_connect.php';

if (isset($_POST['upload'])) {
    $imageNames = $_FILES['images']['name'];
    $imageTmpNames = $_FILES['images']['tmp_name'];
    $imageSizes = $_FILES['images']['size'];
    $imageErrors = $_FILES['images']['error'];
    $names = $_POST['names'];
    $descriptions = $_POST['descriptions'];
    $categories = $_POST['categories'];
    $tags = $_POST['tags'];

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

    $query = "SELECT username, fullname, user_id FROM user_account WHERE " . $condition;
    $stmtquery = $conn->prepare($query);
    $stmtquery->bind_param($type, $token_id);
    $stmtquery->execute();
    $result = $stmtquery->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $userID = $row['user_id'];
        $username = $row['username'];
        $fullname = $row['fullname'];
        $userURL = '/' . $userID . '-' . $username;

        foreach ($imageNames as $index => $imageName) {
            if ($imageErrors[$index] == 0) {
                $imageTmpName = $imageTmpNames[$index];
                $size = $imageSizes[$index];
                $filetype = pathinfo($imageName, PATHINFO_EXTENSION);
                $uniqueImageName = $userID . '-' . uniqid('', true) . '.' . $filetype;
                $imagePath = './uploads/' . $uniqueImageName;

                if (move_uploaded_file($imageTmpName, $imagePath)) {
                    $name = $conn->real_escape_string($names[$index]);
                    $description = $conn->real_escape_string($descriptions[$index]);
                    $category = $conn->real_escape_string($categories[$index]);
                    $tag = $conn->real_escape_string($tags[$index]);

                    $sql = "INSERT INTO images (name, alt_text, title, path, size, mime_type, description, artist, artist_url, artist_id, category_id, tags) 
                            VALUES ('$name','$name', '$name', '$imagePath', '$size', '$filetype', '$description', '$fullname', '$userURL', '$userID', '$category','$tag')";

                    if ($conn->query($sql) === TRUE) {
                        echo "Hình ảnh '$name' đã được tải lên!<br>";
                    } else {
                        echo "Lỗi: " . $sql . "<br>" . $conn->error;
                    }
                } else {
                    echo "Tải hình ảnh '$imageName' thất bại.<br>";
                }
            } else {
                echo "Không có tập tin hoặc có lỗi tải lên '$imageName'.<br>";
            }
        }
    }
}

$conn->close();
