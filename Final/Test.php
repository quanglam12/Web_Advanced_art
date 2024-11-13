<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Hiển Thị Ảnh</title>
    <style>
      body {
    font-family: Arial, sans-serif;
}

.image-gallery {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 15px;
    padding: 20px;
}

.image-gallery img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    object-position: center;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease;
    cursor: pointer; /* Thêm con trỏ tay khi hover */
}

.image-gallery img:hover {
    transform: scale(1.05);
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
    justify-content: center;
    align-items: center;
}

.modal-content {
    max-width: 80%;
    max-height: 80%;
}

.close {
    position: absolute;
    top: 20px;
    right: 30px;
    color: white;
    font-size: 30px;
    cursor: pointer;
}

    </style>
</head>
<body>

<div class="image-gallery">
    <img src="image1.jpg" alt="Ảnh 1" class="thumbnail">
    <img src="image2.jpg" alt="Ảnh 2" class="thumbnail">
    <img src="image3.jpg" alt="Ảnh 3" class="thumbnail">
    <img src="image4.jpg" alt="Ảnh 4" class="thumbnail">
    <!-- Thêm các ảnh khác nếu cần -->
</div>

<div class="modal" id="modal">
    <span class="close" id="close">&times;</span>
    <img class="modal-content" id="modal-image">
</div>

<script>
  const thumbnails = document.querySelectorAll('.thumbnail');
const modal = document.getElementById('modal');
const modalImage = document.getElementById('modal-image');
const closeBtn = document.getElementById('close');

thumbnails.forEach(thumbnail => {
    thumbnail.addEventListener('click', () => {
        modal.style.display = 'flex';
        modalImage.src = thumbnail.src; // Lấy đường dẫn hình ảnh đã nhấp
    });
});

closeBtn.addEventListener('click', () => {
    modal.style.display = 'none'; // Ẩn modal khi nhấp vào nút đóng
});

// Đóng modal khi nhấp ra ngoài hình ảnh
modal.addEventListener('click', (event) => {
    if (event.target === modal) {
        modal.style.display = 'none';
    }
});

</script>
</body>
</html>
