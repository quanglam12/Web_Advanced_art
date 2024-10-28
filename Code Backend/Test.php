<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Lấy dữ liệu ảnh từ request POST
    $imageData = $_POST['image'];
    $imageName = $_POST['name'];
    $imageFormat = $_POST['format'];

    // Tách phần header của Base64 và phần dữ liệu ảnh thực
    list($type, $data) = explode(';', $imageData);
    list(, $data) = explode(',', $data);

    // Chuyển dữ liệu Base64 thành nhị phân
    $data = base64_decode($data);

    // Đường dẫn lưu ảnh trên server (uploads/)
    $uploadPath = './uploads/' . $imageName;

    // Lưu ảnh lên server
    if (file_put_contents($uploadPath, $data)) {
        echo "Ảnh đã được lưu thành công!";
    } else {
        echo "Lỗi khi lưu ảnh.";
    }
}
?>


<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload và Chỉnh sửa Ảnh</title>
    <script src="https://cdn.scaleflex.it/plugins/filerobot-image-editor/4.8.1/filerobot-image-editor.min.js"></script>
</head>
<body>
    <h1>Upload và Chỉnh sửa Ảnh</h1>

    <!-- Form Upload Ảnh -->
    <form id="uploadForm">
        <label for="imageUpload">Chọn ảnh để upload:</label>
        <input type="file" id="imageUpload" accept="image/*" required>
        <button type="submit">Upload</button>
    </form>

    <!-- Khu vực hiển thị ảnh đã upload -->
    <h2>Ảnh đã tải lên:</h2>
    <img id="uploadedImage" src="" alt="Chọn một ảnh" style="max-width: 100%; display: none;">

    <!-- Nút Chỉnh sửa ảnh -->
    <button id="edit_image" style="display: none;">Chỉnh sửa Ảnh</button>

    <!-- Container cho Filerobot Image Editor -->
    <div id="imageEditorContainer" style="width: 100%; height: 600px; display: none;"></div>
    <div id="editor_container" style="width: 100%; height: 700px;"></div>

    <script>
        // Khi người dùng upload ảnh
        document.getElementById('uploadForm').addEventListener('submit', function (e) {
            e.preventDefault();
            const fileInput = document.getElementById('imageUpload');
            const file = fileInput.files[0];

            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const imageUrl = e.target.result;
                    const uploadedImage = document.getElementById('uploadedImage');
                    uploadedImage.src = imageUrl;
                    uploadedImage.style.display = 'block';  // Hiển thị ảnh

                    document.getElementById('edit_image').style.display = 'inline-block';  // Hiển thị nút Chỉnh sửa
                };
                reader.readAsDataURL(file);
            }
        });

        // Khi người dùng nhấn nút "Chỉnh sửa ảnh"
        document.getElementById('edit_image').addEventListener('click', function () {
            const imageUrl = document.getElementById('uploadedImage').src;
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
    formData.append('action', 'save_image');

    fetch('Test.php', {
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
        });



    </script>
</body>
</html>
