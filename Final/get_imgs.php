<?php
include 'db_connect.php';

if (isset($_GET['category_id'])) {
    $categoryId = intval($_GET['category_id']);

    // Truy vấn hình ảnh theo danh mục
    $sql = "SELECT * FROM images WHERE category_id = $categoryId"; // Thay 'images' bằng tên bảng của bạn
    $result = $conn->query($sql);

    $images = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $images[] = $row; // Lưu từng hình ảnh vào mảng
        }
    }

    // Trả về kết quả dưới dạng JSON
    echo json_encode($images);
}

$conn->close();
?>
