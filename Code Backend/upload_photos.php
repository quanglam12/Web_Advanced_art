<?php
include 'db_connect.php';
    $sql = "SELECT id, name FROM categories";
    $result = $conn->query($sql);
    $categoriesOptions = '';

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $categoriesOptions .= '<option value="' . $row['id'] . '">' . htmlspecialchars($row['name']) . '</option>';
        }
    }
    $conn->close();
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Upload Multiple Images</title>
</head>
<body>
    <h2>Upload Multiple Images</h2>
    <form action="save_photos.php" method="POST" enctype="multipart/form-data" id="uploadForm">
        <input type="file" name="images[]" id="imageInput" accept="image/*" multiple required>
        <div class="image-preview" id="imagePreview"></div>
        <button type="submit" name="upload">Upload</button>
    </form>

    <script>
        const categoriesOptions = `<?php echo $categoriesOptions; ?>`;

        document.getElementById('imageInput').addEventListener('change', function(event) {
            const files = Array.from(event.target.files);
            const imagePreview = document.getElementById('imagePreview');
            imagePreview.innerHTML = '';

            files.forEach((file, index) => {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const div = document.createElement('div');
                    div.classList.add('image-item');
                    div.innerHTML = `
                        <img src="${e.target.result}" alt="Image Preview">
                        <button type="button" class="remove-btn" data-index="${index}">&times;</button>
                        <input type="text" name="names[]" placeholder="Enter name" required>
                        <textarea name="descriptions[]" placeholder="Enter description" ></textarea>
                        <select name="categories[]" required>
                            <option value="">Select Category</option>
                             ${categoriesOptions}
                        </select>
                        <input type="text" name="tags[]" placeholder="Enter tags (comma-separated)" >
                    `;
                    imagePreview.appendChild(div);

                    div.querySelector('.remove-btn').addEventListener('click', function() {
                        div.remove();
                        const updatedFiles = new DataTransfer();
                        files.splice(index, 1);
                        files.forEach(f => updatedFiles.items.add(f));
                        document.getElementById('imageInput').files = updatedFiles.files;
                    });
                };
                reader.readAsDataURL(file);
            });
        });
    </script>
</body>
</html>
