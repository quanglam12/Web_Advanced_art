// Lọc hình ảnh theo danh mục
const tags = document.querySelectorAll('.tag');
const imageGallery = document.querySelector('.image-gallery');
// Lọc hình ảnh theo danh mục
function filterImages(selectedCategoryId) {
    const thumbnails = document.querySelectorAll('.thumbnail');
    thumbnails.forEach(thumbnail => {
        const imageCategoryId = thumbnail.dataset.categoryId;
        if (imageCategoryId === selectedCategoryId) {
            thumbnail.parentElement.style.display = 'block';
        } else {
            thumbnail.parentElement.style.display = 'none';
        }
    });
}
// Nổi bật thẻ được chọn
function clearSelectedTags() {
    tags.forEach(tag => {
        tag.classList.remove('selected-tag');
    });
}

tags.forEach(tag => {
    tag.addEventListener('click', () => {
        clearSelectedTags();

        tag.classList.add('selected-tag');

        const selectedCategoryId = tag.dataset.categoryId;

        filterImages(selectedCategoryId);
    });
});
