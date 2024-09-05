document.addEventListener("DOMContentLoaded", function () {
    // Xử lý đăng ký tài khoản
    const registrationForm = document.querySelector("#registrationForm");
    if (registrationForm) {
        registrationForm.addEventListener("submit", function (event) {
            if (!validateForm()) {
                event.preventDefault(); // Ngăn chặn form nếu không hợp lệ
            }
        });
    }

    function validateForm() {
        const fullname = document.querySelector('input[name="fullname"]').value.trim();
        const email = document.querySelector('input[name="email"]').value.trim();
        const password = document.querySelector('input[name="password"]').value;
        const confirmPassword = document.querySelector('input[name="confirm_password"]').value;

        // Kiểm tra trường trống
        if (!fullname || !email || !password || !confirmPassword) {
            alert("Vui lòng điền tất cả các trường bắt buộc.");
            return false;
        }

        // Kiểm tra mật khẩu có khớp không
        if (password !== confirmPassword) {
            alert("Mật khẩu và xác nhận mật khẩu không khớp.");
            return false;
        }

        // Chuyển hướng đến trang giao diện nếu thành công
        window.location.href = "giao_dien.html";
        return true;
    }

    // Xử lý đăng nhập với "Nhớ đăng nhập"
    const loginForm = document.getElementById("loginForm");
    if (loginForm) {
        const usernameInput = document.getElementById("username");
        const passwordInput = document.getElementById("password");
        const rememberMeCheckbox = document.getElementById("rememberMe");

        // Kiểm tra nếu thông tin đăng nhập đã được lưu trước đó
        if (localStorage.getItem("rememberMe") === "true") {
            usernameInput.value = localStorage.getItem("username");
            rememberMeCheckbox.checked = true;
        }

        // Xử lý khi form được submit
        loginForm.addEventListener("submit", function (event) {
            event.preventDefault(); // Ngăn chặn form submit mặc định

            const username = usernameInput.value;
            const password = passwordInput.value;
            const rememberMe = rememberMeCheckbox.checked;

            if (rememberMe) {
                // Lưu thông tin vào localStorage
                localStorage.setItem("username", username);
                localStorage.setItem("rememberMe", true);
            } else {
                // Xóa thông tin đã lưu
                localStorage.removeItem("username");
                localStorage.setItem("rememberMe", false);
            }

            // Xử lý đăng nhập (ví dụ: gửi thông tin tới server)
            alert("Đăng nhập thành công!"); // Thay thế bằng logic xử lý thực tế
        });
    }
});
