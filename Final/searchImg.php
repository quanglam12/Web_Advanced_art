<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả tìm kiếm</title>
    <link rel="stylesheet" href="css/search.css">
    <link rel="icon" href="../favicon.ico" type="image/x-icon">

</head>

<body>
    <div class="toolbar">
        <a href="Home.php">
            <img src="../favicon.ico" alt="Logo" class="logo">
        </a>
        <button class="btn">Thanh công cụ</button>
    </div>
    <?php
    require 'db_connect.php';

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $keyword = trim($_POST['keyword']);

        $sql = "SELECT * FROM images WHERE name LIKE ? OR description LIKE ? OR artist LIKE ?";
        $stmt = $conn->prepare($sql);
        $keyword_param = "%" . $keyword . "%";
        $stmt->bind_param("sss", $keyword_param, $keyword_param, $keyword_param);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<div>';
                echo '<img src="' . $row['path'] . '" alt="' . $row['name'] . '">';
                echo '<p>' . $row['name'] . '</p>';
                echo '<a href="' . $row['artist_url'] . '"><p>' . $row['artist'] . '</p></a>';
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

</body>