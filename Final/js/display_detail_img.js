// Hiển thị chi tiết hình ảnh
const modal = document.getElementById('modal');
const modalImage = document.getElementById('modal-image');
const modalName = document.getElementById('modal-name');
const modalArtist = document.getElementById('modal-artist');
const modalSize = document.getElementById('modal-size');
const modalCategory = document.getElementById('modal-category');
const modalDescription = document.getElementById('modal-description');
const modalTags = document.getElementById('modal-tags');
const downloadLink = document.getElementById('download-link');
const closeBtn = document.getElementById('close');

//Hiển thị chi tiết hình ảnh
function showModal(thumbnail) {
    const imageId = thumbnail.dataset.id;

    fetch(`get_img_details.php?id=${imageId}`)
        .then(response => response.json())
        .then(data => {
            modal.style.display = 'flex';
            modalImage.src = thumbnail.src; 
            modalName.textContent = data.name;
            modalArtist.textContent = data.artist;
            modalSize.textContent = data.size;
            modalCategory.textContent = data.category_name;
            modalDescription.textContent = data.description;
            modalTags.textContent = data.tags;
            downloadLink.href = thumbnail.src;
        })
        .catch(error => {
            console.error('Lỗi:', error);
        });
}
// Thêm sự kiện bấm vào hình ảnh
function setupThumbnailClickEvents() {
    const thumbnails = document.querySelectorAll('.thumbnail');
    thumbnails.forEach(thumbnail => {
        thumbnail.addEventListener('click', () => showModal(thumbnail));
    });
}
// Sự kiện đóng khi bấm nút
closeBtn.addEventListener('click', () => {
    modal.style.display = 'none'; 
});
// Sự kiện đóng khi bấm ra ngoài
modal.addEventListener('click', (event) => {
    if (event.target === modal) {
        modal.style.display = 'none'; 
    }
});

document.addEventListener('DOMContentLoaded', setupThumbnailClickEvents);
