<?php
require 'db_connect.php';

$data = json_decode(file_get_contents("php://input"), true);

if (isset($data['id'], $data['name'], $data['category'], $data['tags'], $data['description'])) {
    $id = $data['id'];
    $name = $data['name'];
    $category = $data['category'];
    $tags = $data['tags'];
    $description = $data['description'];

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
