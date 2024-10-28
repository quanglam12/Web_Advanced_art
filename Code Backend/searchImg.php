
<form method="POST" action="">
    <input type="text" name="keyword" placeholder="Nhập từ khóa tìm kiếm...">
    <button type="submit">Tìm kiếm</button>
</form>
<?php
require 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $keyword = $_POST['keyword'];

    $sql = "SELECT * FROM images WHERE name LIKE ? OR description LIKE ?";
    $stmt = $conn->prepare($sql);
    $keyword_param = "%" . $keyword . "%";
    $stmt->bind_param("ss", $keyword_param, $keyword_param);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo '<div>';
            echo '<img src="' . $row['path'] . '" alt="' . $row['name'] . '">';
            echo '<p>' . $row['name'] . '</p>';
            echo '<p>' . $row['description'] . '</p>';
            echo '</div>';
        }
    } else {
        echo "Không tìm thấy kết quả nào.";
    }

    $stmt->close();
}
$conn->close();
?>
