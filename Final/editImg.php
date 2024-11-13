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
<title>Chỉnh sửa hình ảnh</title>
<link rel="icon" href="../favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/css.css">
<link rel="stylesheet" type="text/css" href="css/createAI.css">
<link rel="stylesheet" type="text/css" href="css/edit.css">
<script src="https://scaleflex.cloudimg.io/v7/plugins/filerobot-image-editor/4.8.1/filerobot-image-editor.min.js">
</script>
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
  <h1>Chỉnh sửa hình ảnh</h1>
  <?php
  if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM images WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
      $imgInfo = $result->fetch_assoc();
      echo "<img src='" . $imgInfo['path'] . "' alt='Saved Image' id='Imagesrc' style='display: none;'>";
    }
  } else {
    echo '<div class="divider"> Chọn file ảnh </div>';
    echo '<input type="file" name="image" id="imageUpload" accept="image/*" required>';
    echo '<div class="divider"> ✨ Hoặc chọn ảnh ✨</div>';
    $sql = "SELECT * FROM images JOIN categories ON images.category_id = categories.cat_id WHERE artist_id = ? ORDER BY uploaded_at DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user['user_id']);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
      echo '<button class="back-button" onclick="goBack()" style="display: none;">Quay lại</button>';
      echo "<div class = 'storage'>";
      while ($row = $result->fetch_assoc()) {
        echo "<img src='' id='idImage' style='display: none;'>";
        echo "<div class='image-item' data-tooltip='Chọn ảnh'>";
        echo "<img src='" . $row['path'] . "' data-name='" . $row['name'] . "' class='thumbnail' >";
        echo "<p class='image-name'>" . htmlspecialchars($row['name']) . "</p>";
        echo "</div>";
      }
      echo "</div>";
    } else {
      echo "<p>Chưa có ảnh nào được tải lên.</p>";
    }
  }
  ?>
  <div id="editor_container" style="width: 100%; height: 700px;"></div>
  <script>
    document.addEventListener("DOMContentLoaded", function() {
    const imageElement = document.getElementById("Imagesrc");
    if (imageElement) {
        const src = imageElement.src;
      edit_Img(src);
    } 
});
    const fileimg = document.getElementById("imageUpload")
    function goBack() {
      document.getElementById('editor_container').style.display = 'none';
      document.querySelectorAll('.storage').forEach(element => {
        element.style.display = 'flex';
      });
      document.querySelector('.back-button').style.display = 'none';

    }
    imageUpload.addEventListener('change', function (event) {
      const file = event.target.files[0];
      if (file) {
        document.querySelectorAll('.divider').forEach(element => {
          element.style.display = 'none';
        });
        document.querySelectorAll('.storage').forEach(element => {
          element.style.display = 'none';
        });
        const reader = new FileReader();
        reader.onload = function (e) {
          const imgElement = document.getElementById('idImage');
          imgElement.src = e.target.result;
          edit_Img(e.target.result);
        };
        reader.readAsDataURL(file);
      }

    })

    document.querySelectorAll('.image-item').forEach(item => {
      item.addEventListener('click', function () {
        const imgElement = this.querySelector('img');

        const imageId = imgElement.src;

        document.querySelectorAll('.divider').forEach(element => {
          element.style.display = 'none';
        });
        document.querySelectorAll('.storage').forEach(element => {
          element.style.display = 'none';
        });
        document.getElementById('imageUpload').style.display = 'none';
        document.querySelector('.back-button').style.display = 'block';
        document.getElementById('editor_container').style.display = 'block';

        edit_Img(imageId);
      });
    });

    document.addEventListener('DOMContentLoaded', function () {
      const imgElement = document.getElementById('Imagesrc');
      if (imgElement) {
        const srcimg = imgElement.src;
        edit_Img(srcimg);
      }
    });
    function base64ToBlob(base64, mimeType) {
      const byteCharacters = atob(base64.split(',')[1]);
      const byteArrays = [];

      for (let offset = 0; offset < byteCharacters.length; offset += 512) {
        const slice = byteCharacters.slice(offset, offset + 512);
        const byteNumbers = new Array(slice.length);
        for (let i = 0; i < slice.length; i++) {
          byteNumbers[i] = slice.charCodeAt(i);
        }
        const byteArray = new Uint8Array(byteNumbers);
        byteArrays.push(byteArray);
      }

      return new Blob(byteArrays, { type: mimeType });
    }
    function edit_Img(srcImg) {
      const imageUrl = srcImg;
      const { TABS, TOOLS } = FilerobotImageEditor;
      const config = {
        source: imageUrl,
        onSave: (editedImageObject, designState) => {
          const imageUrl = editedImageObject.imageBase64;
          const imageSize = editedImageObject.width * editedImageObject.height;
          const imageName = editedImageObject.fullName;
          const imageFormat = editedImageObject.mimeType.split('/')[1];

          const downloadLink = document.createElement('a');
          downloadLink.href = imageUrl;
          downloadLink.download = imageName;
          downloadLink.style.display = 'none';
          document.body.appendChild(downloadLink);
          downloadLink.click();
          document.body.removeChild(downloadLink);

          const imageBlob = base64ToBlob(imageUrl, editedImageObject.mimeType);

          const formData = new FormData();
          formData.append('image', imageBlob);
          formData.append('name', imageName);
          formData.append('size', imageSize)
          formData.append('format', imageFormat);
          console.log(imageBlob);
          console.log(formData);

          fetch('saveEditImg.php', { // Server
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
    }
  </script>
</body>

</html>