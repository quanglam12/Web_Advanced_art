<?php
require 'db_connect.php';

if (isset($_POST['image_id'], $_POST['name'], $_POST['category'], $_POST['tags'], $_POST['description'])) {
    $id = $_POST['image_id'];
    $name = $_POST['name'];
    $category = $_POST['category'];
    $tags = $_POST['tags'];
    $description = $_POST['description'];

    $sql = "UPDATE images SET name = ?, category_id = ?, tags = ?, description = ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssi", $name, $category, $tags, $description, $id);

    if ($stmt->execute()) {
        echo 'success';
    } else {
        echo 'error';
    }

    $stmt->close();
}

$conn->close();

