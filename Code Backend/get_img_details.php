<?php
include 'db_connect.php';

header('Content-Type: application/json');
$image_id = $_GET['id']; 

$sql = "SELECT * FROM images JOIN categories ON images.category_id = categories.cat_id WHERE images.id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $image_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $row['size'] = formatSize($row['size']);
    echo json_encode($row); 
} else {
    echo json_encode(['error' => 'Không tìm thấy hình ảnh.']);
}

$stmt->close();
$conn->close();
function formatSize($bytes) {
    if ($bytes <= 0) return '0 B';
    $units = array('B', 'KB', 'MB', 'GB', 'TB');
    $factor = floor((strlen($bytes) - 1) / 3);
    return sprintf("%.2f", $bytes / pow(1024, $factor)) . ' ' . $units[$factor];
}
