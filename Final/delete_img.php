<?php
include 'auto_login.php';
require 'db_connect.php';

$user = autoLogin($conn);
if ($user == null) {
  header('Location: LoginRequired.php');
  exit();
}

if (isset($_GET['id'])) {
    $imageId = $_GET['id'];

    $sql = "SELECT artist_id, path FROM images WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $imageId);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($artist_id, $path);
    
    if ($stmt->fetch()) {
        if ($artist_id != $user['user_id']) {
            echo 'error: You do not have permission to delete this image.';
            $stmt->close();
            $conn->close();
            exit();
        }
        
        if (file_exists($path)) {
            unlink($path);
        } else {
            echo 'error: Image file not found.';
            $stmt->close();
            $conn->close();
            exit();
        }

        $sqlDelete = "DELETE FROM images WHERE id = ?";
        $stmtDelete = $conn->prepare($sqlDelete);
        $stmtDelete->bind_param("i", $imageId);

        if ($stmtDelete->execute()) {
            echo 'success';
        } else {
            echo 'error: Unable to delete image from database.';
        }

        $stmtDelete->close();
    } else {
        echo 'error: Image not found.';
    }

    $stmt->close();
}

$conn->close();
?>
