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
    <form method="post">
      <label for="image_prompt">Nhập nội dung để tạo ảnh:</label>
      <input type="text" id="image_prompt" name="image_prompt" required>
      <button type="submit" name="generate_image">Tạo</button>
    </form>
    <div class="imageGeneration">
      <?php
      if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['generate_image'])) {
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

            echo "<img src='$imageUrl' alt='Generated Image' id='generatedImage'><br>";
            echo "
              <form method='post'>
                  <input type='hidden' name='image_url' value='$imageUrl'>
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
        $imageData = file_get_contents($imageUrl);
        $imageName = $user['user_id'] . '-' . uniqid('', true) . '.png';
        $imagePath = 'imgAI/' . $imageName;

        if (file_put_contents($imagePath, $imageData)) {
          $imgInfo = getimagesize($imagePath);
          $sizeimg = $imgInfo[0] * $imgInfo[1];
          $minetype = 'png';
          $updateImgPath = "./" . $imagePath;
          $artist_url = "/" . $user['user_id'] . '-' . $user['username'];
          $category_id = 30;
          $stmt = $conn->prepare("INSERT INTO images (name, alt_text, title, path, size, mime_type, artist, artist_url, artist_id, category_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
          if (!$stmt) {
            die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
          }
          $stmt->bind_param("ssssisssii", $imageName, $imageName, $imageName, $updateImgPath, $sizeimg, $minetype, $user['fullname'], $artist_url, $user['user_id'], $category_id);

          if ($stmt->execute()) {
            echo "Image saved successfully: <img src='$imagePath' alt='Saved Image' id='generatedImage'>";
            echo "
              <form method='post'>
                  <input type='hidden' name='image_url' value='$imageUrl'>
                  <button type='submit' name='save_image'>Lưu</button>
                  <button type='button' id='edit_image'>Chỉnh sửa</button>
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
    <div id="editor_container" style="width: 100%; height: 700px;"></div>
  </div>

  <script>
    document.getElementById('edit_image').addEventListener('click', function () {
      const imageUrl = document.getElementById('generatedImage').src;
      const { TABS, TOOLS } = FilerobotImageEditor;
      const config = {
        source: imageUrl,
        onSave: (editedImageObject, designState) => {
          const imageUrl = editedImageObject.imageBase64;
          const imageName = editedImageObject.fullName;
          const imageFormat = editedImageObject.mimeType.split('/')[1];

          const downloadLink = document.createElement('a');
          downloadLink.href = imageUrl;
          downloadLink.download = 'edited_image.jpg';
          downloadLink.style.display = 'none';
          document.body.appendChild(downloadLink);
          downloadLink.click();
          document.body.removeChild(downloadLink);

          const formData = new FormData();
          formData.append('image', imageUrl);
          formData.append('name', imageName);
          formData.append('format', imageFormat);

          fetch('createimgAI.php', { // Server
            method: 'POST',
            body: formData
          })
            .then(response => response.text())
            .then(result => {
              console.log('Server response:', result);
            })
            .catch(error => {
              console.error('Error uploading image:', error);
            });
        },
        annotationsCommon: {
          fill: '#ff0000',
        },
        Text: { text: 'Filerobot...' },
        Rotate: { angle: 90, componentType: 'slider' },
        translations: {
          profile: 'Profile',
          coverPhoto: 'Cover photo',
          facebook: 'Facebook',
          socialMedia: 'Social Media',
          fbProfileSize: '180x180px',
          fbCoverPhotoSize: '820x312px',
        },
        Crop: {
          presetsItems: [
            {
              titleKey: 'classicTv',
              descriptionKey: '4:3',
              ratio: 4 / 3,
              // icon: CropClassicTv, // optional, CropClassicTv is a React Function component. Possible (React Function component, string or HTML Element)
            },
            {
              titleKey: 'cinemascope',
              descriptionKey: '21:9',
              ratio: 21 / 9,
              // icon: CropCinemaScope, // optional, CropCinemaScope is a React Function component.  Possible (React Function component, string or HTML Element)
            },
          ],
          presetsFolders: [
            {
              titleKey: 'socialMedia', // will be translated into Social Media as backend contains this translation key
              // icon: Social, // optional, Social is a React Function component. Possible (React Function component, string or HTML Element)
              groups: [
                {
                  titleKey: 'facebook',
                  items: [
                    {
                      titleKey: 'profile',
                      width: 180,
                      height: 180,
                      descriptionKey: 'fbProfileSize',
                    },
                    {
                      titleKey: 'coverPhoto',
                      width: 820,
                      height: 312,
                      descriptionKey: 'fbCoverPhotoSize',
                    },
                  ],
                },
              ],
            },
          ],
        },
        tabsIds: [TABS.ADJUST, TABS.FINETUNE, TABS.FILTERS, TABS.ANNOTATE, TABS.WATERMARK, TABS.RESIZE], // or ['Adjust', 'Annotate', 'Watermark']
        defaultTabId: TABS.ANNOTATE, // or 'Annotate'
        defaultToolId: TOOLS.TEXT, // or 'Text'
      };

      // Assuming we have a div with id="editor_container"
      const filerobotImageEditor = new FilerobotImageEditor(
        document.querySelector('#editor_container'),
        config,
      );

      filerobotImageEditor.render({
        onClose: (closingReason) => {
          console.log('Closing reason', closingReason);
          filerobotImageEditor.terminate();
        },
      });
    })


  </script>

</body>

</html>