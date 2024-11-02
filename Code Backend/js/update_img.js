document.addEventListener('DOMContentLoaded', () => {
    const modal = document.getElementById('editImageModal');
    const closeBtn = modal.querySelector('.close-btn');
    const cancelBtn = modal.querySelector('.cancel-btn');
    const editForm = document.getElementById('edit-form');
    const imagePreview = document.getElementById('image_preview');
    const nameInput = document.getElementById('name');
    const descriptionInput = document.getElementById('description');
    const categorySelect = document.getElementById('category');
    const tagsInput = document.getElementById('tags');
    const imageIdInput = document.getElementById('image_id');

    window.openEditModal = function(imageId) {
        fetch(`get_img_details.php?id=${imageId}`)
            .then(response => response.json())
            .then(data => {
                if (data) {
                    imageIdInput.value = data.id;
                    imagePreview.src = data.path;
                    nameInput.value = data.name;
                    descriptionInput.value = data.description;
                    tagsInput.value = data.tags;

                    categorySelect.value = data.category_id || '';

                    modal.style.display = 'block';
                } else {
                    alert('Không thể lấy thông tin ảnh.');
                }
            })
            .catch(error => {
                console.error('Lỗi:', error);
                alert('Đã xảy ra lỗi khi tải thông tin ảnh.');
            });
    };

    const closeModal = () => {
        modal.style.display = 'none';
    };

    closeBtn.addEventListener('click', closeModal);
    cancelBtn.addEventListener('click', closeModal);

    window.addEventListener('click', event => {
        if (event.target === modal) {
            closeModal();
        }
    });

    editForm.addEventListener('submit', event => {
        event.preventDefault();

        const formData = new FormData(editForm);
        fetch('update_img.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(data => {
            if (data.trim() === 'success') {
                alert('Ảnh đã được cập nhật thành công.');
                closeModal();
                location.reload();
            } else {
                alert('Cập nhật ảnh thất bại. Vui lòng thử lại.');
            }
        })
        .catch(error => {
            console.error('Lỗi:', error);
            alert('Đã xảy ra lỗi khi cập nhật ảnh.');
        });
    });
});
document.addEventListener('DOMContentLoaded', () => {
    const editButtons = document.querySelectorAll('.edit-btn');

    editButtons.forEach(button => {
        button.addEventListener('click', () => {
            const imageId = button.dataset.id;
            console.log(imageId)
            openEditModal(imageId);
        });
    });
});
