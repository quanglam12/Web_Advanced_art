// Hiển thị hình ảnh theo danh mục
const tags = document.querySelectorAll('.tag');
const imageGallery = document.querySelector('.image-gallery');

tags.forEach(tag => {
    tag.addEventListener('click', () => {
        const selectedCategoryId = tag.dataset.categoryId;
        // Gửi yêu cầu HTTP
        fetch(`get_imgs.php?category_id=${selectedCategoryId}`)
            .then(response => response.json())
            .then(data => {
                imageGallery.innerHTML = '';

                data.forEach(image => {
                    const imgDiv = document.createElement('div');
                    imgDiv.innerHTML = `
                                <img src="${image.path}" alt="${image.name}" class="thumbnail" data-id="${image.id}" data-category-id="${image.category_id}">
                                <p class="imgname">${image.name}</p>
                                <p class="imgartist"><a href="${image.artist_url}">Tác giả: ${image.artist}</a></p>
                            `;
                    imageGallery.appendChild(imgDiv);
                });
                setupThumbnailClickEvents();
            })
            .catch(error => {
                console.error('Lỗi:', error);
            });
    });
});