#Web advanced - Web Art with Dall-E
Hướng dẫn cài đặt và cấu hình Web art
1. Cài đặt XAMPP
Bước 1: Tải XAMPP
Truy cập trang Apache Friends để tải phiên bản XAMPP phù hợp với hệ điều hành của bạn (Windows, macOS, hoặc Linux).
Bước 2: Cài đặt XAMPP
Mở file cài đặt vừa tải về và làm theo các bước hướng dẫn.
Trong quá trình cài đặt, chọn các thành phần như Apache, MySQL, và PHP.
Sau khi cài đặt, khởi động XAMPP Control Panel và bật các module cần thiết: Apache và MySQL.
2. Import cơ sở dữ liệu vào XAMPP
Bước 1: Mở phpMyAdmin
Mở XAMPP Control Panel, đảm bảo rằng module Apache và MySQL đã được bật.
Truy cập vào phpMyAdmin bằng trình duyệt.
Bước 2: Tạo cơ sở dữ liệu mới
Trong phpMyAdmin, nhấn vào Databases ở trên cùng.
Nhập tên cơ sở dữ liệu: "Data_web_art" (hoặc tạo tên tùy ý và thay đổi tên cơ sở dữ liệu trong file db_connect.php) và nhấn Create.
Bước 3: Import file .sql trong thư mục "Database"
Chọn cơ sở dữ liệu vừa tạo từ danh sách bên trái.
Nhấn vào tab Import.
Trong phần File to import, chọn file .sql từ máy tính của bạn.
Nhấn Go để import dữ liệu vào cơ sở dữ liệu.
3. Thay đổi API DALL-E trong file .htmlaccess
Bước 1: Tìm file .htmlaccess (Hoặc tạo mới trong thư mục "htdocs")
File .htmlaccess có thể nằm trong thư mục gốc của dự án hoặc trong thư mục con chứa các file cấu hình khác.
Bước 2: Sửa API key DALL-E
Mở file .htmlaccess bằng một trình soạn thảo văn bản.
Thêm vào file dòng lệnh sau:
RewriteEngine On

RewriteRule ^([0-9]+)-([a-zA-Z0-9_.@-]+)$ /dashboard/Web_art/account/profile.php?id=$1&username=$2 [L,QSA]

SetEnv API_KEY "your_Dall-E_API"

Lưu file .htmlaccess sau khi chỉnh sửa.
