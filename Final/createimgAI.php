<?php
require 'db_connect.php';
include 'auto_login.php';
$user = autoLogin($conn);
if ($user == null) {
  header('Location: auth.php');
}

?>

<!DOCTYPE html>
<html lang="vi">
<meta charset="UTF-8">
<title>Image Generation</title>
<link rel="icon" href="../favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" type="text/css" href="css/createAI.css">
<script
  src="https://scaleflex.cloudimg.io/v7/plugins/filerobot-image-editor/4.8.1/filerobot-image-editor.min.js"></script>
</head>

<body>
  <div class="toolbar">
    <a href="Home.php">
      <img src="../favicon.ico" alt="Logo" class="logo">
    </a>
    <div class="search-bar">
      <form id="search-form" action="searchImg.php" method="POST">
        <input type="text" name="keyword" placeholder="Tìm kiếm ý tưởng của bạn">
        <button type="submit">🔍</button>
      </form>
    </div>

    <div class="explore-items">
      <a href="explore.php">
        <button class="explore-item">Khám phá</button>
      </a>
      <a href='upload_photos.php'>
        <button class="explore-item">
          Đăng tải hình ảnh
        </button>
      </a>
      <a href='createimgAI.php'>
        <button class="explore-item">Tạo ảnh bằng AI</button>
      </a>
      <a href='editImg.php'>
        <button class="explore-item">Chỉnh sửa ảnh</button>
      </a>
    </div>

    <?php if ($user): ?>
      <div class="user-menu">
        <img src="<?php echo htmlspecialchars($user['profile_picture']); ?>" alt="Avatar" width="50" height="50">
        <div class="user-menu-content">
          <a href="collection.php">
            <div class="menu-item">Bộ sưu tập</div>
          </a>
          <a href="profile.php">
            <div class="menu-item">Cài đặt</div>
          </a>
          <a href="logout.php">
            <div class="menu-item">Đăng xuất</div>
          </a>
        </div>
      </div>
    <?php else: ?>
      <div class="auth">
        <a href="auth.php">Đăng nhập</a>
      </div>
    <?php endif; ?>
  </div>
  <h1>Tạo Ảnh với DALL-E</h1>
  <div class="AI-generation">
    <form class="imgpromt" method="post">
      <label for="image_prompt">Nhập nội dung để tạo ảnh:</label>
      <input type="text" id="image_prompt" name="image_prompt" required>
      <button type="submit" name="generate_image">Tạo</button>
    </form>
    <div class="imageGeneration">
      <?php
      if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['generate_image'])) {
        $sql = "SELECT cat_id, category_name FROM categories";
        $result = $conn->query($sql);
        $default_category_id = 30;
        $prompt = $_POST['image_prompt'];
        $url = "https://api.openai.com/v1/images/generations";

        $apiKey = getenv('API_KEY');

        $data = [
          "model" => "dall-e-3",
          "prompt" => $prompt,
          "n" => 1,
          "size" => "1024x1024"
        ];

        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, [
          "Content-Type: application/json",
          "Authorization: Bearer $apiKey"
        ]);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));

        $response = curl_exec($curl);

        if ($response === false) {
          echo "cURL Error: " . curl_error($curl);
        } else {
          $decodedResponse = json_decode($response, true);
          if (isset($decodedResponse['data'][0]['url'])) {
            $imageUrl = $decodedResponse['data'][0]['url'];

            echo "<img src='$imageUrl' alt='Generated Image' id='generatedImage' data='not'><br>";
            echo "<script>
                  document.getElementById('generatedImage').onload = function() {
                  document.getElementById('generatedImage').this.scrollIntoView({ behavior: 'smooth', block: 'end' });
                  };
                  </script>";
            echo "
              <form method='post' class='image-details-form'>
                  <input type='hidden' name='image_url' value='$imageUrl'>
                  <input type='text' name='name' placeholder='Enter name' value='Ảnh AI' required>
                  <textarea name='descriptions' placeholder='Enter description'>$prompt</textarea>
                  <select name='categories' required>";
            if ($result && mysqli_num_rows($result) > 0) {
              while ($row = mysqli_fetch_assoc($result)) {
                $cat_id = $row['cat_id'];
                $category_name = $row['category_name'];
                $selected = ($cat_id == $default_category_id) ? 'selected' : '';
                echo "<option value='$cat_id' $selected>$category_name</option>";
              }
            } else {
              echo "<option value=''>Không có danh mục nào</option>";
            }
            echo "
                  </select>
                  <input type='text' name='tags' placeholder='Enter tags (comma-separated)'>
                  <button type='submit' name='save_image'>Lưu</button>
              </form>";
          } else {
            echo "No image URL found in the response.";
          }
        }

        curl_close($curl);
      }

      if (isset($_POST['save_image'])) {
        $imageUrl = $_POST['image_url'];
        $name = $_POST['name'];
        $descriptions = $_POST['descriptions'];
        $categories = (int) $_POST['categories'];
        $tags = $_POST['tags'];
        $imageData = file_get_contents($imageUrl);
        $imageName = $user['user_id'] . '-' . uniqid('', true) . '.png';
        $imagePath = 'imgAI/' . $imageName;

        if (file_put_contents($imagePath, $imageData)) {
          $imgInfo = getimagesize($imagePath);
          $sizeimg = $imgInfo[0] * $imgInfo[1];
          $minetype = 'png';
          $updateImgPath = "./" . $imagePath;
          $artist_url = "/" . $user['user_id'] . '-' . $user['username'];
          $stmt = $conn->prepare("INSERT INTO images (name, alt_text, title, description, tags, path, size, mime_type, artist, artist_url, artist_id, category_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
          if (!$stmt) {
            die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
          }
          $stmt->bind_param("ssssssisssii", $name, $name, $name, $descriptions, $tags, $updateImgPath, $sizeimg, $minetype, $user['fullname'], $artist_url, $user['user_id'], $categories);

          if ($stmt->execute()) {
            $inserted_id = $conn->insert_id;
            echo "<img src='$updateImgPath' alt='Saved Image' id='generatedImage' data='yes' data-id='$inserted_id'>";
            echo "<p>Lưu ảnh vào bộ sưu tập thành công!</p>";
            echo "
              <form method='post' class='button-container'>
                  <input type='hidden' name='image_url' value='$imageUrl'>
                  <button type='submit' name='save_image' class='btn-storage' onclick='reditectStorage()'>Bộ sưu tập</button> 
                  <button type='button' class='btn-download' onclick='downloadImage()'>Tải xuống</button> 
                  <button type='button' class='btn-edit' onclick='redirectEditFilerobot()'>Chỉnh sửa</button>                 
              </form>";
          } else {
            echo "Failed to save image to the database.";
          }
        } else {
          echo "Failed to save image.";
        }
      }
      $conn->close();
      ?>
    </div>
  </div>
  <script>
    function downloadImage() {
      const imgSrc = document.getElementById('generatedImage').src;
      const link = document.createElement('a');
      link.href = imgSrc;
      link.download = 'downloaded_image.jpg';
      link.click();
    }
    function reditectStorage() {
      window.location.href = 'collection.php'
    }
    function redirectEditFilerobot() {
      var imgElement = document.getElementById('generatedImage');
      var dataId = imgElement.getAttribute('data-id');
      var redirect = 'editImg.php?id=' + dataId;
      window.location.href = redirect;
    }
  </script>
</body>

</html>