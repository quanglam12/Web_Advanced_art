-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 07, 2024 lúc 09:39 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `data_web_art`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cat_id`, `category_name`, `category_description`) VALUES
(1, 'Beach', 'Hình ảnh về bãi biển, cát trắng và sóng biển.'),
(2, 'Cliff', 'Hình ảnh về các vách đá hùng vĩ.'),
(3, 'Dawn', 'Hình ảnh về bình minh rực rỡ.'),
(4, 'Landscape', 'Hình ảnh về phong cảnh thiên nhiên.'),
(5, 'Ocean', 'Hình ảnh về đại dương bao la.'),
(6, 'Outdoors', 'Hình ảnh về các hoạt động ngoài trời.'),
(7, 'Rock', 'Hình ảnh về các tảng đá và địa hình đá.'),
(8, 'Sand', 'Hình ảnh về cát và sa mạc.'),
(9, 'Sea', 'Hình ảnh về biển cả.'),
(10, 'Seashore', 'Hình ảnh về bờ biển.'),
(11, 'Summer', 'Hình ảnh về mùa hè sôi động.'),
(12, 'Sun', 'Hình ảnh về mặt trời.'),
(13, 'Sunset', 'Hình ảnh về hoàng hôn.'),
(14, 'Travel Photos', 'Hình ảnh về các chuyến du lịch.'),
(15, 'Water', 'Hình ảnh về nước và các dạng nước.'),
(16, 'Nature', 'Hình ảnh về thiên nhiên.'),
(18, '4k Wallpaper', 'Hình ảnh nền 4k chất lượng cao.'),
(19, 'Beautiful Nature Images', 'Hình ảnh đẹp về thiên nhiên.'),
(20, 'Blue Sky', 'Hình ảnh về bầu trời xanh.'),
(21, 'Cloudiness', 'Hình ảnh về mây và bầu trời.'),
(22, 'Cloud', 'Hình ảnh về mây.'),
(23, 'Cloudscape', 'Hình ảnh về cảnh mây.'),
(24, 'Cloudy', 'Hình ảnh về thời tiết nhiều mây.'),
(25, 'Daytime', 'Hình ảnh về ban ngày.'),
(26, 'Environment', 'Hình ảnh về môi trường.'),
(27, 'Nature Background', 'Hình ảnh nền về thiên nhiên.'),
(28, 'Nature Phorography', 'Hình ảnh chụp về thiên nhiên.'),
(30, 'AI', 'Hình ảnh do trí tuệ nhân tạo (Artificial Intelligence) tạo ra.'),
(32, 'Forest', 'Hình ảnh về rừng cây xanh mát'),
(33, 'Mountain', 'Hình ảnh về núi non hùng vĩ'),
(34, 'River', 'Hình ảnh về sông suối'),
(35, 'Waterfall', 'Hình ảnh về thác nước'),
(36, 'Wildlife', 'Hình ảnh về động vật hoang dã'),
(37, 'Flowers', 'Hình ảnh về các loài hoa'),
(38, 'Autumn', 'Hình ảnh về mùa thu'),
(39, 'Winter', 'Hình ảnh về mùa đông'),
(40, 'Spring', 'Hình ảnh về mùa xuân'),
(41, 'Cityscape', 'Hình ảnh về cảnh quan thành phố'),
(42, 'Architecture', 'Hình ảnh về kiến trúc'),
(43, 'Night Sky', 'Hình ảnh về bầu trời đêm'),
(44, 'Stars', 'Hình ảnh về các vì sao'),
(45, 'Galaxy', 'Hình ảnh về dải ngân hà'),
(46, 'Space', 'Hình ảnh về không gian vũ trụ'),
(47, 'Abstract', 'Hình ảnh trừu tượng'),
(48, 'Patterns', 'Hình ảnh về các mẫu hoa văn'),
(49, 'Textures', 'Hình ảnh về các loại kết cấu'),
(50, 'Food', 'Hình ảnh về món ăn'),
(51, 'Drink', 'Hình ảnh về đồ uống'),
(52, 'People', 'Hình ảnh về con người'),
(53, 'Portraits', 'Hình ảnh chân dung'),
(54, 'Animals', 'Hình ảnh về động vật'),
(55, 'Birds', 'Hình ảnh về các loài chim'),
(56, 'Insects', 'Hình ảnh về côn trùng'),
(57, 'Underwater', 'Hình ảnh dưới nước'),
(58, 'Sports', 'Hình ảnh về thể thao'),
(59, 'Adventure', 'Hình ảnh về các cuộc phiêu lưu'),
(60, 'Festivals', 'Hình ảnh về các lễ hội'),
(61, 'Culture', 'Hình ảnh về văn hóa'),
(62, 'Anime', 'Hình ảnh về hoạt hình Nhật Bản');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `size` int(11) NOT NULL,
  `mime_type` varchar(50) NOT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `artist_url` varchar(255) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `name`, `path`, `alt_text`, `title`, `description`, `uploaded_at`, `size`, `mime_type`, `artist`, `artist_url`, `artist_id`, `category_id`, `tags`) VALUES
(2, 'Liyue Daytime', './uploads/1-66e8d287e07d73.70729627.jpg', 'Liyue Daytime', 'Liyue Daytime', '', '2024-09-17 00:51:19', 661557, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 11, '#liyue'),
(3, 'Hội An', './uploads/1-672440e443f211.74455211.jpeg', 'Hội An', 'Hội An', '', '2024-11-01 02:45:56', 1018835, 'jpeg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 60, ''),
(4, 'Bird', './uploads/1-672440e44478e1.22161314.jpg', 'Bird', 'Bird', '', '2024-11-01 02:45:56', 103148, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 55, ''),
(5, 'Sunset', './uploads/1-672440e444df89.38136227.webp', 'Sunset', 'Sunset', 'Hoàng hôn', '2024-11-01 02:45:56', 121744, 'webp', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 13, ''),
(6, 'Zodiac', './uploads/1-672440e445b004.93335206.jpg', 'Zodiac', 'Zodiac', '', '2024-11-01 02:45:56', 76521, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 30, ''),
(7, 'Tiger', './uploads/1-672440e4461a32.55391454.jpg', 'Tiger', 'Tiger', '', '2024-11-01 02:45:56', 181888, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 30, ''),
(8, 'Horse', './uploads/1-672440e4467ea4.56614419.jpg', 'Horse', 'Horse', '', '2024-11-01 02:45:56', 204115, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 30, ''),
(9, 'Sunshine', './uploads/1-672440e446d4f7.09987103.jpg', 'Sunshine', 'Sunshine', '', '2024-11-01 02:45:56', 153341, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 16, ''),
(10, 'Phượng Hoàng cổ trấn', './uploads/1-672440e4473333.39127780.jpg', 'Phượng Hoàng cổ trấn', 'Phượng Hoàng cổ trấn', '', '2024-11-01 02:45:56', 991457, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 14, ''),
(11, 'Beach', './uploads/1-672440e44796c6.61637945.jpg', 'Beach', 'Beach', '', '2024-11-01 02:45:56', 216736, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 1, ''),
(12, 'Woman butterfly', './uploads/1-672440e447f341.65005257.jpg', 'Woman butterfly', 'Woman butterfly', '', '2024-11-01 02:45:56', 99649, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 30, ''),
(13, 'Robot & Technology', './uploads/1-672440e4484eb1.23580458.jpg', 'Robot & Technology', 'Robot & Technology', '', '2024-11-01 02:45:56', 41036, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 30, ''),
(14, 'Daily life', './uploads/1-672440e448a6a8.94578618.jpg', 'Daily life', 'Daily life', '', '2024-11-01 02:45:56', 101128, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 25, ''),
(15, 'Lễ hội cà phê 2023', './uploads/1-67245a97581b09.67503967.jpg', 'Lễ hội cà phê 2023', 'Lễ hội cà phê 2023', '', '2024-11-01 04:35:35', 211396, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 60, '#2023'),
(16, 'Lễ hội cồng chiêng Tây Nguyên', './uploads/1-67245a975893b9.47927895.jpg', 'Lễ hội cồng chiêng Tây Nguyên', 'Lễ hội cồng chiêng Tây Nguyên', '', '2024-11-01 04:35:35', 105191, 'jpg', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 60, '#TayNguyen'),
(17, '1-67287ddf5e2982.42976077.png', './imgAI/1-67287ddf5e2982.42976077.png', '1-67287ddf5e2982.42976077.png', '1-67287ddf5e2982.42976077.png', NULL, '2024-11-04 07:55:11', 1048576, 'png', 'Mai Văn Quang Lâm', '/1-quanglam', 1, 30, NULL),
(18, 'ảnh.png', './imgAI/8-6729bed793d261.47374562.png', '8-6729bed793d261.47374562.png', '8-6729bed793d261.47374562.png', 'mèo và chó', '2024-11-05 06:44:39', 1048576, 'png', 'chi to', '/8-tdc147@gmail.com', 8, 30, '#cat #dog'),
(19, '10-6729d1b3e18b10.63761326.png', './imgAI/10-6729d1b3e18b10.63761326.png', '10-6729d1b3e18b10.63761326.png', '10-6729d1b3e18b10.63761326.png', NULL, '2024-11-05 08:05:07', 1048576, 'png', 'Quốc Huân', '/10-quochuan', 10, 30, NULL),
(20, 'Họa sĩ kỹ thuật số', './uploads/10-672a409075fa15.56235945.jfif', 'a', 'a', '', '2024-11-05 15:58:08', 13155, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(21, 'Thú dễ thương', './uploads/10-672a466d4a0e72.28221032.jfif', 'Thú dễ thương', 'Thú dễ thương', '', '2024-11-05 16:23:09', 15225, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(22, 'Ngọn hải đăng dưới ánh trăng', './uploads/10-672a466d4a88c2.47318480.jfif', 'Ngọn hải đăng dưới ánh trăng', 'Ngọn hải đăng dưới ánh trăng', '', '2024-11-05 16:23:09', 7145, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(23, 'Robot vui vẻ vẽ tranh', './uploads/10-672a466d4ae309.27075991.jfif', 'Robot vui vẻ vẽ tranh', 'Robot vui vẻ vẽ tranh', '', '2024-11-05 16:23:09', 14442, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(24, 'Pháo đài bí ẩn', './uploads/10-672a466d4b37b5.11762810.jfif', 'Pháo đài bí ẩn', 'Pháo đài bí ẩn', '', '2024-11-05 16:23:09', 7171, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(25, 'Người máy sáng tạo', './uploads/10-672a466d4b9a21.08012529.jfif', 'Người máy sáng tạo', 'Người máy sáng tạo', '', '2024-11-05 16:23:09', 6571, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(26, 'Người máy làm việc', './uploads/10-672a466d4c52b1.77345629.jfif', 'Người máy làm việc', 'Người máy làm việc', '', '2024-11-05 16:23:09', 7423, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(27, 'Hệ thống dữ liệu AI', './uploads/10-672a466d4caa80.11087257.jfif', 'Hệ thống dữ liệu AI', 'Hệ thống dữ liệu AI', '', '2024-11-05 16:23:09', 16183, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(28, 'Học hỏi cùng robot', './uploads/10-672a466d4d0e61.49654063.jfif', 'Học hỏi cùng robot', 'Học hỏi cùng robot', '', '2024-11-05 16:23:09', 8458, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(29, 'Chân dung người phụ nữ trừu tượng', './uploads/10-672a466d4d6ce9.03811113.jfif', 'Chân dung người phụ nữ trừu tượng', 'Chân dung người phụ nữ trừu tượng', '', '2024-11-05 16:23:09', 26333, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(30, 'Máy ảnh cổ điển', './uploads/10-672a466d4dbf48.54521900.jfif', 'Máy ảnh cổ điển', 'Máy ảnh cổ điển', '', '2024-11-05 16:23:09', 8616, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(31, 'Nhân vật AI tương lai', './uploads/10-672a466d4e1600.18991068.jfif', 'Nhân vật AI tương lai', 'Nhân vật AI tương lai', '', '2024-11-05 16:23:09', 10871, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(32, 'Cô gái trong thế giới tương lai', './uploads/10-672a466d4e6bb2.84239080.jfif', 'Cô gái trong thế giới tương lai', 'Cô gái trong thế giới tương lai', '', '2024-11-05 16:23:09', 8258, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(33, 'Chú chó Corgi dễ thương', './uploads/10-672a466d4ec937.76412470.jfif', 'Chú chó Corgi dễ thương', 'Chú chó Corgi dễ thương', '', '2024-11-05 16:23:09', 8222, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(34, 'Người phụ nữ với mái tóc đầy nghệ thuật', './uploads/10-672a466d4f2563.98837230.jfif', 'Người phụ nữ với mái tóc đầy nghệ thuật', 'Người phụ nữ với mái tóc đầy nghệ thuật', '', '2024-11-05 16:23:09', 13258, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(35, 'Mèo đội nón đỏ', './uploads/10-672a466d4f7910.67875187.jfif', 'Mèo đội nón đỏ', 'Mèo đội nón đỏ', '', '2024-11-05 16:23:09', 8735, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(36, 'Chân dung nữ người máy', './uploads/10-672a466d4fcc02.05956574.jfif', 'Chân dung nữ người máy', 'Chân dung nữ người máy', '', '2024-11-05 16:23:09', 8139, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(37, 'Thế giới song hành', './uploads/10-672a466d501ca9.11314159.jfif', 'Thế giới song hành', 'Thế giới song hành', '', '2024-11-05 16:23:09', 9376, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(38, 'Chiến binh AI', './uploads/10-672a466d5070c7.84936749.jfif', 'Chiến binh AI', 'Chiến binh AI', '', '2024-11-05 16:23:09', 13144, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(39, 'Trung tâm điều khiển không gian', './uploads/10-672a466d50c8b3.59742541.jfif', 'Trung tâm điều khiển không gian', 'Trung tâm điều khiển không gian', '', '2024-11-05 16:23:09', 11631, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(40, 'Kỹ thuật viên tương lai', './uploads/10-672a466d5119f6.70707853.jfif', 'Kỹ thuật viên tương lai', 'Kỹ thuật viên tương lai', '', '2024-11-05 16:23:09', 8153, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(41, 'Nữ chiến binh và năng lượng', './uploads/10-672a466d516be8.73675251.jfif', 'Nữ chiến binh và năng lượng', 'Nữ chiến binh và năng lượng', '', '2024-11-05 16:23:09', 8720, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(42, 'Voi rừng huyền bí', './uploads/10-672a466d51c419.46001392.jfif', 'Voi rừng huyền bí', 'Voi rừng huyền bí', '', '2024-11-05 16:23:09', 11036, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(43, 'Cô gái đeo khăn', './uploads/10-672a466d5215e3.36714558.jfif', 'Cô gái đeo khăn', 'Cô gái đeo khăn', '', '2024-11-05 16:23:09', 5613, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(44, 'Robot nghệ sĩ', './uploads/10-672a466d526d25.44184492.jfif', 'Robot nghệ sĩ', 'Robot nghệ sĩ', '', '2024-11-05 16:23:09', 10835, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(45, 'Bà lão trầm tư', './uploads/10-672a466d52c181.36661834.jfif', 'Bà lão trầm tư', 'Bà lão trầm tư', '', '2024-11-05 16:23:09', 7464, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(46, 'Nhện khổng lồ', './uploads/10-672a466d5311b3.79187352.jfif', 'Nhện khổng lồ', 'Nhện khổng lồ', '', '2024-11-05 16:23:09', 6561, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(47, 'Người máy suy tư', './uploads/10-672a466d5366a8.16552610.jfif', 'Người máy suy tư', 'Người máy suy tư', '', '2024-11-05 16:23:09', 9878, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(48, 'Cáo tinh nghịch', './uploads/10-672a466d53ba26.03950725.jfif', 'Cáo tinh nghịch', 'Cáo tinh nghịch', '', '2024-11-05 16:23:09', 10989, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(49, 'Thành phố điện tử', './uploads/10-672a466d540ae1.45312815.jfif', 'Thành phố điện tử', 'Thành phố điện tử', '', '2024-11-05 16:23:09', 14713, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(50, 'Cô gái và sắc hoa', './uploads/10-672a466d545f07.86347533.jfif', 'Cô gái và sắc hoa', 'Cô gái và sắc hoa', '', '2024-11-05 16:23:09', 12431, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(51, 'Chân dung công nghệ', './uploads/10-672a466d54af77.93481646.jfif', 'Chân dung công nghệ', 'Chân dung công nghệ', '', '2024-11-05 16:23:09', 9944, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(52, 'Cô gái nghệ thuật', './uploads/10-672a466d5500a1.96870495.jfif', 'Cô gái nghệ thuật', 'Cô gái nghệ thuật', '', '2024-11-05 16:23:09', 9062, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(53, 'Nhà khoa học tương lai', './uploads/10-672a466d554ce2.57179176.jfif', 'Nhà khoa học tương lai', 'Nhà khoa học tương lai', '', '2024-11-05 16:23:09', 15737, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(54, 'Thác nước ảo', './uploads/10-672a466d55a9a2.77963665.jfif', 'Thác nước ảo', 'Thác nước ảo', '', '2024-11-05 16:23:09', 13978, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(55, 'Cuộc chiến bùng nổ', './uploads/10-672a466d560229.48777686.jfif', 'Cuộc chiến bùng nổ', 'Cuộc chiến bùng nổ', '', '2024-11-05 16:23:09', 18012, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(56, 'Người và Cú khổng lồ', './uploads/10-672a466d565f31.94817439.jfif', 'Người và Cú khổng lồ', 'Người và Cú khổng lồ', '', '2024-11-05 16:23:09', 11200, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(57, 'Khuôn mặt công nghệ', './uploads/10-672a466d56ae70.17131100.jfif', 'Khuôn mặt công nghệ', 'Khuôn mặt công nghệ', '', '2024-11-05 16:23:09', 10066, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(58, 'Bản vẽ nghệ thuật', './uploads/10-672a466d56ffa4.93132635.jfif', 'Bản vẽ nghệ thuật', 'Bản vẽ nghệ thuật', '', '2024-11-05 16:23:09', 10401, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(59, 'Người máy Gemini', './uploads/10-672a466d575597.54273247.jfif', 'Người máy Gemini', 'Người máy Gemini', '', '2024-11-05 16:23:09', 11679, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(60, 'Trái tim thép', './uploads/10-672a466d57ab50.93290759.jfif', 'Trái tim thép', 'Trái tim thép', '', '2024-11-05 16:23:09', 9680, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(61, 'Bộ máy đồ chơi', './uploads/10-672a466d5804c1.80899607.jfif', 'Bộ máy đồ chơi', 'Bộ máy đồ chơi', '', '2024-11-05 16:23:09', 12922, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(62, 'Thế giới viễn tưởng', './uploads/10-672a466d5856b2.46888739.jfif', 'Thế giới viễn tưởng', 'Thế giới viễn tưởng', '', '2024-11-05 16:23:09', 6375, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(63, 'Công viên hiện đại', './uploads/10-672a466d58a282.04015562.jfif', 'Công viên hiện đại', 'Công viên hiện đại', '', '2024-11-05 16:23:09', 9904, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(64, 'Chiến binh trong cát bụi', './uploads/10-672a466d58f592.36820022.jfif', 'Chiến binh trong cát bụi', 'Chiến binh trong cát bụi', '', '2024-11-05 16:23:09', 8000, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(65, 'Robot chiến binh rực rỡ', './uploads/10-672a466d594969.27075341.jfif', 'Robot chiến binh rực rỡ', 'Robot chiến binh rực rỡ', '', '2024-11-05 16:23:09', 12353, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(66, 'Paimon', './uploads/10-672a466d599619.63455469.jfif', 'Paimon', 'Paimon', '', '2024-11-05 16:23:09', 7231, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(67, 'Chân dung người già trầm tĩnh', './uploads/10-672a466d59e6b7.78126869.jfif', 'Chân dung người già trầm tĩnh', 'Chân dung người già trầm tĩnh', '', '2024-11-05 16:23:09', 6172, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(68, 'Cảnh biển với ngọn hải đăng', './uploads/10-672a466d5a3766.16986901.jfif', 'Cảnh biển với ngọn hải đăng', 'Cảnh biển với ngọn hải đăng', '', '2024-11-05 16:23:09', 9827, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(69, 'Chim và hoa rực rỡ', './uploads/10-672a466d5a8955.85565125.jfif', 'Chim và hoa rực rỡ', 'Chim và hoa rực rỡ', '', '2024-11-05 16:23:09', 14632, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(70, 'Chàng trai với nụ cười ấm áp', './uploads/10-672a466d5adc46.54083368.jfif', 'Chàng trai với nụ cười ấm áp', 'Chàng trai với nụ cười ấm áp', '', '2024-11-05 16:23:09', 8826, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(71, 'Kiến trúc hiện đại tương lai', './uploads/10-672a466d5b3757.35179222.jfif', 'Kiến trúc hiện đại tương lai', 'Kiến trúc hiện đại tương lai', '', '2024-11-05 16:23:09', 7772, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(72, 'Trứng và thành phố neon ban đêm', './uploads/10-672a466d5b8ab6.99825820.jfif', 'Trứng và thành phố neon ban đêm', 'Trứng và thành phố neon ban đêm', '', '2024-11-05 16:23:09', 8709, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(73, 'Cảnh quan kỳ ảo đầy sắc màu', './uploads/10-672a466d5bdc02.79622238.jfif', 'Cảnh quan kỳ ảo đầy sắc màu', 'Cảnh quan kỳ ảo đầy sắc màu', '', '2024-11-05 16:23:09', 17579, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(74, 'Mèo chiến binh với đôi mắt sáng', './uploads/10-672a466d5c2e99.33153167.jfif', 'Mèo chiến binh với đôi mắt sáng', 'Mèo chiến binh với đôi mắt sáng', '', '2024-11-05 16:23:09', 11148, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(75, 'Người phụ nữ công nghệ', './uploads/10-672a466d5c9ac0.64152659.jfif', 'Người phụ nữ công nghệ', 'Người phụ nữ công nghệ', '', '2024-11-05 16:23:09', 10738, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(76, 'Chú chó dễ thương bên hoa', './uploads/10-672a466d5cef01.47788424.jfif', 'Chú chó dễ thương bên hoa', 'Chú chó dễ thương bên hoa', '', '2024-11-05 16:23:09', 8753, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(77, 'Cô gái người máy giữa thành phố', './uploads/10-672a466d5d4741.44510897.jfif', 'Cô gái người máy giữa thành phố', 'Cô gái người máy giữa thành phố', '', '2024-11-05 16:23:09', 11575, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(78, 'Chú cú với ánh mắt sắc bén', './uploads/10-672a466d5da1c0.11801377.jfif', 'Chú cú với ánh mắt sắc bén', 'Chú cú với ánh mắt sắc bén', '', '2024-11-05 16:23:09', 15787, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(79, 'Vũ công lấp lánh giữa ánh đèn', './uploads/10-672a466d5e02b1.88286643.jfif', 'Vũ công lấp lánh giữa ánh đèn', 'Vũ công lấp lánh giữa ánh đèn', '', '2024-11-05 16:23:09', 10417, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(80, 'Sư tử đứng giữa mây trời', './uploads/10-672a466d5e6c85.70308770.jfif', 'Sư tử đứng giữa mây trời', 'Sư tử đứng giữa mây trời', '', '2024-11-05 16:23:09', 12290, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(81, 'Bộ máy công nghệ đen hồng', './uploads/10-672a466d5eccd1.16068922.jfif', 'Bộ máy công nghệ đen hồng', 'Bộ máy công nghệ đen hồng', '', '2024-11-05 16:23:09', 12726, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(82, 'Thư viện khổng lồ tương lai', './uploads/10-672a466d5f1d38.01231940.jfif', 'Thư viện khổng lồ tương lai', 'Thư viện khổng lồ tương lai', '', '2024-11-05 16:23:09', 12706, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(83, 'Chân dung trừu tượng đầy màu sắc', './uploads/10-672a466d5f6cd7.85836304.jfif', 'Chân dung trừu tượng đầy màu sắc', 'Chân dung trừu tượng đầy màu sắc', '', '2024-11-05 16:23:09', 20706, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(84, 'Con hổ', './uploads/10-672a466d5fc288.66799377.jfif', 'Con hổ', 'Con hổ', '', '2024-11-05 16:23:09', 12115, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(86, 'Kimetsu no yaiba', './uploads/10-672a4e747db915.49405268.jfif', 'Kimetsu no yaiba', 'Kimetsu no yaiba', '', '2024-11-05 16:57:24', 16541, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(87, 'Gojo satoru', './uploads/10-672a4e747fc4a9.28563885.jfif', 'Gojo satoru', 'Gojo satoru', '', '2024-11-05 16:57:24', 14559, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(88, 'Gojo satoru', './uploads/10-672a4e748041b1.54716161.jfif', 'Gojo satoru', 'Gojo satoru', '', '2024-11-05 16:57:24', 10915, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(89, 'Thị trấn nhỏ', './uploads/10-672a4e7480d967.83262414.jfif', 'Thị trấn nhỏ', 'Thị trấn nhỏ', '', '2024-11-05 16:57:24', 13408, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(90, 'Áo dài Việt Nam', './uploads/10-672a4e74814ca7.30975866.jfif', 'Áo dài Việt Nam', 'Áo dài Việt Nam', '', '2024-11-05 16:57:24', 11076, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(91, 'Doraemon movie 42', './uploads/10-672a4e7481b1d1.45594934.jfif', 'Doraemon movie 42', 'Doraemon movie 42', '', '2024-11-05 16:57:24', 9848, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(92, 'Hình nền wibu', './uploads/10-672a4e74820f84.16777392.jfif', 'Hình nền wibu', 'Hình nền wibu', '', '2024-11-05 16:57:24', 14626, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(93, 'Hình nền ngầu', './uploads/10-672a4e74829ba0.97213074.jfif', 'Hình nền ngầu', 'Hình nền ngầu', '', '2024-11-05 16:57:24', 11557, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(94, 'Kimetsu no yaiba', './uploads/10-672a4e748319d1.66532949.jfif', 'Kimetsu no yaiba', 'Kimetsu no yaiba', '', '2024-11-05 16:57:24', 18480, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(95, 'Boy anime', './uploads/10-672a4e74837f84.51821829.jfif', 'Boy anime', 'Boy anime', '', '2024-11-05 16:57:24', 7233, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(96, 'Roronoa Zoro ', './uploads/10-672a4e7483e4d4.04162373.jfif', 'Roronoa Zoro ', 'Roronoa Zoro ', '', '2024-11-05 16:57:24', 19551, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 30, ''),
(97, 'Boku no Hero Academia', './uploads/10-672a4e7484b847.66850627.jfif', 'Boku no Hero Academia', 'Boku no Hero Academia', '', '2024-11-05 16:57:24', 14242, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(98, 'Sad boy', './uploads/10-672a4e74851ec1.36912877.jfif', 'Sad boy', 'Sad boy', '', '2024-11-05 16:57:24', 5473, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(99, 'Monkey D. Luffy', './uploads/10-672a4e74858380.42534989.jfif', 'Monkey D. Luffy', 'Monkey D. Luffy', '', '2024-11-05 16:57:24', 10962, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(100, 'Cool boy', './uploads/10-672a4e7485f782.02969978.jfif', 'Cool boy', 'Cool boy', '', '2024-11-05 16:57:24', 13307, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(101, 'Gojo vs Sukuna', './uploads/10-672a4e74865e08.92657648.jfif', 'Gojo vs Sukuna', 'Gojo vs Sukuna', '', '2024-11-05 16:57:24', 10719, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(102, 'Life to anime', './uploads/10-672a4e7486c1b9.83783791.jfif', 'Life to anime', 'Life to anime', '', '2024-11-05 16:57:24', 17654, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(103, 'Anime wall paper', './uploads/10-672a4e748723a7.71647116.jfif', 'Anime wall paper', 'Anime wall paper', '', '2024-11-05 16:57:24', 10539, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(104, 'Vũ trụ anime', './uploads/10-672a4e748798e8.73522090.jfif', 'Vũ trụ anime', 'Vũ trụ anime', '', '2024-11-05 16:57:24', 19568, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(105, 'Kurumi', './uploads/10-672a4e74880892.02802998.jfif', 'Kurumi', 'Kurumi', '', '2024-11-05 16:57:24', 13649, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(106, 'Cool girl', './uploads/10-672a4e748861a9.25441085.jfif', 'Cool girl', 'Cool girl', '', '2024-11-05 16:57:24', 15131, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(107, 'Thiên thần và ác quỷ', './uploads/10-672a4e7488c1d9.15118941.jfif', 'Thiên thần và ác quỷ', 'Thiên thần và ác quỷ', '', '2024-11-05 16:57:24', 12225, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(108, 'Beauty girl', './uploads/10-672a4e748921d9.34688801.jfif', 'Beauty girl', 'Beauty girl', '', '2024-11-05 16:57:24', 14319, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(109, 'Chill girl', './uploads/10-672a4e74899a37.78245955.jfif', 'Chill girl', 'Chill girl', '', '2024-11-05 16:57:24', 13015, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(110, 'Cute girl', './uploads/10-672a4e7489fee7.52780651.jfif', 'Cute girl', 'Cute girl', '', '2024-11-05 16:57:24', 11902, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(111, 'Dandadan', './uploads/10-672a4e748a5be8.85936285.jfif', 'Dandadan', 'Dandadan', '', '2024-11-05 16:57:24', 19175, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(112, 'Nhà thờ', './uploads/10-672a4e748abe26.41928730.jfif', 'Nhà thờ', 'Nhà thờ', '', '2024-11-05 16:57:24', 13616, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(113, 'Ngôi nhà', './uploads/10-672a4e748b47a5.18367888.jfif', 'Ngôi nhà', 'Ngôi nhà', '', '2024-11-05 16:57:24', 13771, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(114, 'Nhà hiện đại', './uploads/10-672a4e748bbbb4.20660077.jfif', 'Nhà hiện đại', 'Nhà hiện đại', '', '2024-11-05 16:57:24', 8968, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(115, 'Phong cảnh đẹp', './uploads/10-672a4e748c2280.28950242.jfif', 'Phong cảnh đẹp', 'Phong cảnh đẹp', '', '2024-11-05 16:57:24', 8051, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(116, 'Jujutsu Kaisen', './uploads/10-672a4e748c8298.63397477.jfif', 'Jujutsu Kaisen', 'Jujutsu Kaisen', '', '2024-11-05 16:57:24', 12381, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(117, 'One Piece', './uploads/10-672a4e748cf8d6.17692427.jfif', 'One Piece', 'One Piece', '', '2024-11-05 16:57:24', 21134, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(118, 'Zenitsu', './uploads/10-672a4e748d6283.51918437.jfif', 'Zenitsu', 'Zenitsu', '', '2024-11-05 16:57:24', 11356, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(119, 'Attack On Titan', './uploads/10-672a4e748dbc08.45626686.jfif', 'Attack On Titan', 'Attack On Titan', '', '2024-11-05 16:57:24', 15460, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(120, 'Sukuna', './uploads/10-672a4e748e18e6.37901160.jfif', 'Sukuna', 'Sukuna', '', '2024-11-05 16:57:24', 11621, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(121, 'Kakashi', './uploads/10-672a4e748e8e81.97480460.jfif', 'Kakashi', 'Kakashi', '', '2024-11-05 16:57:24', 5585, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(122, 'One piece', './uploads/10-672a4e748eefb9.53787360.jfif', 'One piece', 'One piece', '', '2024-11-05 16:57:24', 16019, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(123, 'Cool wall paper', './uploads/10-672a4e748f4a42.37705064.jfif', 'Cool wall paper', 'Cool wall paper', '', '2024-11-05 16:57:24', 13317, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(124, 'Anime wall paper', './uploads/10-672a4e748fa189.34814405.jfif', 'Anime wall paper', 'Anime wall paper', '', '2024-11-05 16:57:24', 11051, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(125, 'Howls moving castle', './uploads/10-672a4e74900fc8.61836574.jfif', 'Howls moving castle', 'Howls moving castle', '', '2024-11-05 16:57:24', 8627, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(126, 'tomioka', './uploads/10-672a4e7490bee6.40203153.jfif', 'tomioka', 'tomioka', '', '2024-11-05 16:57:24', 16339, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(127, 'Gojo satoru', './uploads/10-672a4e74911753.16566685.jfif', 'Gojo satoru', 'Gojo satoru', '', '2024-11-05 16:57:24', 7713, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(128, 'Totoro my neighbor', './uploads/10-672a4e74916ff8.58002863.jfif', 'Totoro my neighbor', 'Totoro my neighbor', '', '2024-11-05 16:57:24', 10732, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(129, 'hình nền đẹp', './uploads/10-672a4e7491f356.17297285.jfif', 'hình nền đẹp', 'hình nền đẹp', '', '2024-11-05 16:57:24', 7649, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(130, 'Kaneki', './uploads/10-672a4e74925d70.86404239.jfif', 'Kaneki', 'Kaneki', '', '2024-11-05 16:57:24', 11851, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(131, 'hình nền đẹp', './uploads/10-672a4e7492b7b4.47582703.jfif', 'hình nền đẹp', 'hình nền đẹp', '', '2024-11-05 16:57:24', 14594, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(132, 'hình nền đẹp', './uploads/10-672a4e749313a6.47716604.jfif', 'hình nền đẹp', 'hình nền đẹp', '', '2024-11-05 16:57:24', 12510, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(133, 'hình nền đẹp', './uploads/10-672a4e74938692.38562145.jfif', 'hình nền đẹp', 'hình nền đẹp', '', '2024-11-05 16:57:24', 10739, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(134, 'Zhongli', './uploads/10-672a4e7493f266.73343560.jfif', 'Zhongli', 'Zhongli', '', '2024-11-05 16:57:24', 13903, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(135, 'Kimetsu no yaiba', './uploads/10-672a4e74944ca9.43549051.jfif', 'Kimetsu no yaiba', 'Kimetsu no yaiba', '', '2024-11-05 16:57:24', 8989, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 62, ''),
(136, 'Lễ hội ...', './uploads/10-672a59033851c4.37253096.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 9462, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(137, 'Lễ hội ...', './uploads/10-672a590338e762.05731674.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 13433, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(138, 'Lễ hội ...', './uploads/10-672a5903394bd7.16380534.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 10194, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(139, 'Lễ hội ...', './uploads/10-672a590339a659.35587350.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 15054, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(140, 'Lễ hội ...', './uploads/10-672a59033a0d28.73415432.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 10673, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(141, 'Lễ hội ...', './uploads/10-672a59033a66b3.95223075.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 17666, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(142, 'Lễ hội ...', './uploads/10-672a59033aba59.35705665.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 17899, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(143, 'Lễ hội ...', './uploads/10-672a59033b0c01.19439418.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 9299, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(144, 'Lễ hội ...', './uploads/10-672a59033b5a93.13707714.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 25365, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(145, 'Lễ hội ...', './uploads/10-672a59033bb612.50858466.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 12245, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(146, 'Lễ hội ...', './uploads/10-672a59033c1333.12363257.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 9632, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(147, 'Lễ hội ...', './uploads/10-672a59033c68e7.88570847.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 10311, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(148, 'Lễ hội ...', './uploads/10-672a59033cca11.12332830.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 22382, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(149, 'Lễ hội ...', './uploads/10-672a59033d24f1.28261131.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 13751, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(150, 'Lễ hội ...', './uploads/10-672a59033d8156.38747516.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 18346, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(151, 'Lễ hội ...', './uploads/10-672a59033dd309.43376892.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 14605, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(152, 'Lễ hội ...', './uploads/10-672a59033e23d1.23249155.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 10325, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(153, 'Lễ hội ...', './uploads/10-672a59033e7909.32528802.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 16170, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(154, 'Lễ hội ...', './uploads/10-672a59033f3a62.88065908.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 16783, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(155, 'Lễ hội ...', './uploads/10-672a59033f8978.82833406.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 16027, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(156, 'Lễ hội ...', './uploads/10-672a59033fdd70.77646087.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 18372, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(157, 'Lễ hội ...', './uploads/10-672a59034032e9.77363120.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 11207, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(158, 'Lễ hội ...', './uploads/10-672a59034087d8.65070972.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 15653, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(159, 'Lễ hội ...', './uploads/10-672a590340e625.49392989.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 13899, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(160, 'Lễ hội ...', './uploads/10-672a5903413d66.49770207.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 11847, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(161, 'Lễ hội ...', './uploads/10-672a5903418fb3.62075937.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 17122, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(162, 'Lễ hội ...', './uploads/10-672a590341e841.20397212.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 13863, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(163, 'Lễ hội ...', './uploads/10-672a5903423714.83314459.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 13957, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(164, 'Lễ hội ...', './uploads/10-672a5903428ac7.70963155.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 17057, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(165, 'Lễ hội ...', './uploads/10-672a590342e0e6.79285494.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 18562, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(166, 'Lễ hội ...', './uploads/10-672a5903433137.27379971.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 28332, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(167, 'Lễ hội ...', './uploads/10-672a5903438343.70041980.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 11550, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(168, 'Lễ hội ...', './uploads/10-672a590343d130.97691338.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 15697, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(169, 'Lễ hội ...', './uploads/10-672a59034422e3.89038524.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 18676, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(170, 'Lễ hội ...', './uploads/10-672a59034476f0.67045695.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 11171, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(171, 'Lễ hội ...', './uploads/10-672a590344c901.54458263.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 15825, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(172, 'Lễ hội ...', './uploads/10-672a59034523f7.69409309.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 21799, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(173, 'Lễ hội ...', './uploads/10-672a5903457f76.43269693.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 20320, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(174, 'Lễ hội ...', './uploads/10-672a5903469721.34278889.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 21606, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(175, 'Lễ hội ...', './uploads/10-672a590347bbe8.99094148.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 15031, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(176, 'Lễ hội ...', './uploads/10-672a5903482255.51326583.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 14832, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(177, 'Lễ hội ...', './uploads/10-672a5903487402.07220466.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 14483, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(178, 'Lễ hội ...', './uploads/10-672a590348c531.24999632.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 20213, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(179, 'Lễ hội ...', './uploads/10-672a5903491ac9.54393952.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 17463, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(180, 'Lễ hội ...', './uploads/10-672a5903496fe5.63729194.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 9616, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(181, 'Lễ hội ...', './uploads/10-672a590349c435.97697550.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 25159, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(182, 'Lễ hội ...', './uploads/10-672a59034a1512.53947481.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 12977, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(183, 'Lễ hội ...', './uploads/10-672a59034a64f0.07899236.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 11711, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(184, 'Lễ hội ...', './uploads/10-672a59034ab4c7.31175264.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 14133, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(185, 'Lễ hội ...', './uploads/10-672a59034b0b26.88210888.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 10679, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(186, 'Lễ hội ...', './uploads/10-672a59034b63e9.14667844.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 15603, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(187, 'Lễ hội ...', './uploads/10-672a59034bbf93.13478321.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 18504, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(188, 'Lễ hội ...', './uploads/10-672a59034c1448.57807092.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 16467, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(189, 'Lễ hội ...', './uploads/10-672a59034c7265.30597958.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 21499, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(190, 'Lễ hội ...', './uploads/10-672a59034ccd03.16308759.jfif', 'Lễ hội ...', 'Lễ hội ...', '', '2024-11-05 17:42:27', 13531, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 60, ''),
(191, 'Hồ trong rừng', './uploads/10-672a5c07b72544.17165688.jfif', 'Hồ trong rừng', 'Hồ trong rừng', '', '2024-11-05 17:55:19', 11543, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(192, 'Hoa trên đồi', './uploads/10-672a5c07b87779.66074336.jfif', 'Hoa trên đồi', 'Hoa trên đồi', '', '2024-11-05 17:55:19', 10495, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(193, 'Cây đại thụ', './uploads/10-672a5c07b8f202.76344461.jfif', 'Cây đại thụ', 'Cây đại thụ', '', '2024-11-05 17:55:19', 10640, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(194, 'Ảnh rừng núi', './uploads/10-672a5c07b95736.55892433.jfif', 'Ảnh rừng núi', 'Ảnh rừng núi', '', '2024-11-05 17:55:19', 8836, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(195, 'Bình minh trong rừng', './uploads/10-672a5c07b9bde6.42379528.jfif', 'Bình minh trong rừng', 'Bình minh trong rừng', '', '2024-11-05 17:55:19', 9082, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(196, 'Công viên thiên nhiên', './uploads/10-672a5c07ba3d20.45334649.jfif', 'Công viên thiên nhiên', 'Công viên thiên nhiên', '', '2024-11-05 17:55:19', 13885, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(197, 'Tán lá rừng', './uploads/10-672a5c07baacb9.45933372.jfif', 'Tán lá rừng', 'Tán lá rừng', '', '2024-11-05 17:55:19', 15863, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(198, 'Hoàng hôn trên cánh đồng', './uploads/10-672a5c07bb14d8.82948560.jfif', 'Hoàng hôn trên cánh đồng', 'Hoàng hôn trên cánh đồng', '', '2024-11-05 17:55:19', 9848, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(199, 'Chim trên cành', './uploads/10-672a5c07bb83a4.63357744.jfif', 'Chim trên cành', 'Chim trên cành', '', '2024-11-05 17:55:19', 6891, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(200, 'Tia nắng trong rừng', './uploads/10-672a5c07bbf677.82029041.jfif', 'Tia nắng trong rừng', 'Tia nắng trong rừng', '', '2024-11-05 17:55:19', 10472, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(201, 'Thác thiên nhiên', './uploads/10-672a5c07bc6027.98148827.jfif', 'Thác thiên nhiên', 'Thác thiên nhiên', '', '2024-11-05 17:55:19', 12769, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(202, 'Con đường thơ mộng', './uploads/10-672a5c07bcc7d2.95065778.jfif', 'Con đường thơ mộng', 'Con đường thơ mộng', '', '2024-11-05 17:55:19', 12014, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(203, 'Hoàng hôn trên cây đồi', './uploads/10-672a5c07bd2c69.59639252.jfif', 'Hoàng hôn trên cây đồi', 'Hoàng hôn trên cây đồi', '', '2024-11-05 17:55:19', 9583, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(204, 'Thác trong rừng', './uploads/10-672a5c07bd9d77.26572979.jfif', 'Thác trong rừng', 'Thác trong rừng', '', '2024-11-05 17:55:19', 11897, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(205, 'Hồ huyền ảo', './uploads/10-672a5c07be0579.70873292.jfif', 'Hồ huyền ảo', 'Hồ huyền ảo', '', '2024-11-05 17:55:19', 5901, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(206, 'Bướm và hoa', './uploads/10-672a5c07be6826.73932444.jfif', 'Bướm và hoa', 'Bướm và hoa', '', '2024-11-05 17:55:19', 12163, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(207, 'Hồ và đồi núi', './uploads/10-672a5c07bee556.48069305.jfif', 'Hồ và đồi núi', 'Hồ và đồi núi', '', '2024-11-05 17:55:19', 9445, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(208, 'Cảnh đẹp', './uploads/10-672a5c07bf71b9.72905032.jfif', 'Cảnh đẹp', 'Cảnh đẹp', '', '2024-11-05 17:55:19', 10564, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(209, 'Hồ bình minh', './uploads/10-672a5c07bfe3e6.23348372.jfif', 'Hồ bình minh', 'Hồ bình minh', '', '2024-11-05 17:55:19', 6213, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(210, 'Hoa và bướm', './uploads/10-672a5c07c050f6.56151702.jfif', 'Hoa và bướm', 'Hoa và bướm', '', '2024-11-05 17:55:19', 12680, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(211, 'Chim và hoa', './uploads/10-672a5c07c0c092.81322295.jfif', 'Chim và hoa', 'Chim và hoa', '', '2024-11-05 17:55:19', 12312, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(212, 'Mây trời', './uploads/10-672a5c07c13159.64676249.jfif', 'Mây trời', 'Mây trời', '', '2024-11-05 17:55:19', 8509, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(213, 'Cảnh đẹp về đêm', './uploads/10-672a5c07c19347.24055982.jfif', 'Cảnh đẹp về đêm', 'Cảnh đẹp về đêm', '', '2024-11-05 17:55:19', 8052, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(214, 'Sông Amazon', './uploads/10-672a5c07c1f168.97166598.jfif', 'Sông Amazon', 'Sông Amazon', '', '2024-11-05 17:55:19', 9774, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(215, 'Thác và hồ', './uploads/10-672a5c07c2d319.80402267.jfif', 'Thác và hồ', 'Thác và hồ', '', '2024-11-05 17:55:19', 11545, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(216, 'Đồi', './uploads/10-672a5c07c34743.09989774.jfif', 'Đồi', 'Đồi', '', '2024-11-05 17:55:19', 9468, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(217, 'Cánh đồng rực rỡ', './uploads/10-672a5c07c3ac03.61001426.jfif', 'Cánh đồng rực rỡ', 'Cánh đồng rực rỡ', '', '2024-11-05 17:55:19', 8673, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(218, 'Hồ thơ mộng', './uploads/10-672a5c07c453c8.61023284.jfif', 'Hồ thơ mộng', 'Hồ thơ mộng', '', '2024-11-05 17:55:19', 12377, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(219, 'Cánh đồng bình minh', './uploads/10-672a5c07c4ce04.72102227.jfif', 'Cánh đồng bình minh', 'Cánh đồng bình minh', '', '2024-11-05 17:55:19', 8838, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(220, 'Cành hoa đẹp', './uploads/10-672a5c07c53b03.22718323.jfif', 'Cành hoa đẹp', 'Cành hoa đẹp', '', '2024-11-05 17:55:19', 7569, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(221, 'Cảnh đẹp', './uploads/10-672a5c07c5a0e7.61585558.jfif', 'Cảnh đẹp', 'Cảnh đẹp', '', '2024-11-05 17:55:19', 6417, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(222, 'Hồ đẹp', './uploads/10-672a5c07c60df7.03020261.jfif', 'Hồ đẹp', 'Hồ đẹp', '', '2024-11-05 17:55:19', 4525, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(223, 'Cầu trong rừng', './uploads/10-672a5c07c66d65.04828234.jfif', 'Cầu trong rừng', 'Cầu trong rừng', '', '2024-11-05 17:55:19', 15357, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(224, 'Một cái cây', './uploads/10-672a5c07c6cef0.53145945.jfif', 'Một cái cây', 'Một cái cây', '', '2024-11-05 17:55:19', 11474, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(225, 'Cây trong quả cầu', './uploads/10-672a5c07c72c23.26647952.jfif', 'Cây trong quả cầu', 'Cây trong quả cầu', '', '2024-11-05 17:55:19', 7129, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(226, 'Cây bên bờ hồ', './uploads/10-672a5c07c792e3.67776772.jfif', 'Cây bên bờ hồ', 'Cây bên bờ hồ', '', '2024-11-05 17:55:19', 8835, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(227, 'Bậc thang trong rừng', './uploads/10-672a5c07c7f136.07955397.jfif', 'Bậc thang trong rừng', 'Bậc thang trong rừng', '', '2024-11-05 17:55:19', 11103, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(228, 'Cây bên dòng sông', './uploads/10-672a5c07c849e0.48694691.jfif', 'Cây bên dòng sông', 'Cây bên dòng sông', '', '2024-11-05 17:55:19', 8977, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(229, 'Sông giữa rừng núi', './uploads/10-672a5c07c8aa48.88848616.jfif', 'Sông giữa rừng núi', 'Sông giữa rừng núi', '', '2024-11-05 17:55:19', 12561, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(230, 'Quả cầu có cây', './uploads/10-672a5c07c90a39.14024794.jfif', 'Quả cầu có cây', 'Quả cầu có cây', '', '2024-11-05 17:55:19', 8876, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(231, 'Hồ đẹp huyền ảo', './uploads/10-672a5c07c96c41.63085281.jfif', 'Hồ đẹp huyền ảo', 'Hồ đẹp huyền ảo', '', '2024-11-05 17:55:19', 7625, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(232, 'Cảnh đẹp', './uploads/10-672a5c07c9c865.75934316.jfif', 'Cảnh đẹp', 'Cảnh đẹp', '', '2024-11-05 17:55:19', 13263, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(233, 'Cầu trong rừng', './uploads/10-672a5c07ca21f2.48323660.jfif', 'Cầu trong rừng', 'Cầu trong rừng', '', '2024-11-05 17:55:19', 10320, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(234, 'Chồi cây trong rừng', './uploads/10-672a5c07ca7a97.92885572.jfif', 'Chồi cây trong rừng', 'Chồi cây trong rừng', '', '2024-11-05 17:55:19', 11760, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(235, 'Cảnh đẹp', './uploads/10-672a5c07cad446.23648862.jfif', 'Cảnh đẹp', 'Cảnh đẹp', '', '2024-11-05 17:55:19', 8351, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(236, 'Cầu thang trên núi', './uploads/10-672a5c07cb2d93.87931741.jfif', 'Cầu thang trên núi', 'Cầu thang trên núi', '', '2024-11-05 17:55:19', 10345, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(237, 'Giữa rừng', './uploads/10-672a5c07cb88a7.69839097.jfif', 'Giữa rừng', 'Giữa rừng', '', '2024-11-05 17:55:19', 21129, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(238, 'Quả cầu trong rừng', './uploads/10-672a5c07cbe264.05371337.jfif', 'Quả cầu trong rừng', 'Quả cầu trong rừng', '', '2024-11-05 17:55:19', 9805, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(239, 'Đường rừng', './uploads/10-672a5c07cc3bc0.43300983.jfif', 'Đường rừng', 'Đường rừng', '', '2024-11-05 17:55:19', 12247, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(240, 'Hồ đẹp', './uploads/10-672a5c07cc97b8.68837502.jfif', 'Hồ đẹp', 'Hồ đẹp', '', '2024-11-05 17:55:19', 8305, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(241, 'Hồ bên đồi', './uploads/10-672a5c07ccf077.80490667.jfif', 'Hồ bên đồi', 'Hồ bên đồi', '', '2024-11-05 17:55:19', 13483, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(242, 'Cảnh đẹp', './uploads/10-672a5c07cd4617.11846629.jfif', 'Cảnh đẹp', 'Cảnh đẹp', '', '2024-11-05 17:55:19', 12066, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(243, 'Cảnh đẹp', './uploads/10-672a5c07cd9b20.01696550.jfif', 'Cảnh đẹp', 'Cảnh đẹp', '', '2024-11-05 17:55:19', 13593, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(244, 'Rừng mờ ảo', './uploads/10-672a5c07cdfc79.80503581.jfif', 'Rừng mờ ảo', 'Rừng mờ ảo', '', '2024-11-05 17:55:19', 9511, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(245, 'Cảnh đẹp', './uploads/10-672a5c07ce5e70.86147661.jfif', 'Cảnh đẹp', 'Cảnh đẹp', '', '2024-11-05 17:55:19', 11407, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 16, ''),
(246, 'Thầy cô tham dự chào đón tân sinh viên', './uploads/10-672a6202462390.00628434.jpg', 'Thầy cô tham dự chào đón tân sinh viên', 'Thầy cô tham dự chào đón tân sinh viên', '', '2024-11-05 18:20:50', 147188, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(247, 'Chào đón tân sinh viên', './uploads/10-672a62024767d4.64844003.jpg', 'Chào đón tân sinh viên', 'Chào đón tân sinh viên', '', '2024-11-05 18:20:50', 255731, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(248, 'Lớp CNTT K22', './uploads/10-672a620247dff8.24717863.jpg', 'Lớp CNTT K22', 'Lớp CNTT K22', '', '2024-11-05 18:20:50', 137252, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(249, 'Cô Nguyễn Thị Như', './uploads/10-672a6202483947.64384985.jpg', 'Cô Nguyễn Thị Như', 'Cô Nguyễn Thị Như', '', '2024-11-05 18:20:50', 163015, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(250, 'Khóa luận tốt nghiệp', './uploads/10-672a620248a881.05050557.jpg', 'Khóa luận tốt nghiệp', 'Khóa luận tốt nghiệp', '', '2024-11-05 18:20:50', 52302, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(251, 'Sinh hoạt học thuật chuyển đổi số', './uploads/10-672a6202491193.51858080.jpg', 'Sinh hoạt học thuật chuyển đổi số', 'Sinh hoạt học thuật chuyển đổi số', '', '2024-11-05 18:20:50', 174294, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(252, 'Sinh hoạt học thuật chuyển đổi số', './uploads/10-672a6202497403.77466835.jpg', 'Sinh hoạt học thuật chuyển đổi số', 'Sinh hoạt học thuật chuyển đổi số', '', '2024-11-05 18:20:50', 175660, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(253, 'Lễ tốt nghiệp 2022', './uploads/10-672a620249d139.08197579.jpg', 'Lễ tốt nghiệp 2022', 'Lễ tốt nghiệp 2022', '', '2024-11-05 18:20:50', 94848, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(254, 'Báo cáo nghiệm thu', './uploads/10-672a62024a3ad9.65844387.jpg', 'Báo cáo nghiệm thu', 'Báo cáo nghiệm thu', 'Đề tài ứng dụng mô hình học sâu nhận diện biển số xe', '2024-11-05 18:20:50', 262458, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(255, 'Các giảng viên ngành CNTT', './uploads/10-672a62024aa5f8.75866488.jpg', 'Các giảng viên ngành CNTT', 'Các giảng viên ngành CNTT', '', '2024-11-05 18:20:50', 269872, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(256, 'Thầy Nguyễn Đức Thắng', './uploads/10-672a62024b0494.71717218.jpg', 'Thầy Nguyễn Đức Thắng', 'Thầy Nguyễn Đức Thắng', '', '2024-11-05 18:20:50', 144823, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(257, 'Lễ tốt nghiệp', './uploads/10-672a62024b63b8.84969733.jpg', 'Lễ tốt nghiệp', 'Lễ tốt nghiệp', '', '2024-11-05 18:20:50', 264149, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(258, 'Chào đón tân sinh viên K23', './uploads/10-672a62024bbbb1.10691055.jpg', 'Chào đón tân sinh viên K23', 'Chào đón tân sinh viên K23', '', '2024-11-05 18:20:50', 65785, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(259, 'Chúc mừng năm mới', './uploads/10-672a62024c2f31.62123353.jpg', 'Chúc mừng năm mới', 'Chúc mừng năm mới', '', '2024-11-05 18:20:50', 109944, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(260, 'Thầy Nguyễn Đức Thắng', './uploads/10-672a62024c9083.03800263.jpg', 'Thầy Nguyễn Đức Thắng', 'Thầy Nguyễn Đức Thắng', '', '2024-11-05 18:20:50', 111996, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(261, 'Hội thảo khoa học', './uploads/10-672a62024ce550.31761967.jpg', 'Hội thảo khoa học', 'Hội thảo khoa học', 'Hội thảo khoa học đề tài Xây dựng website bán hàng theo gói sản phẩm', '2024-11-05 18:20:50', 77444, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(262, 'Hội nghị sinh viên NCKH', './uploads/10-672a62024d4330.69685791.jpg', 'Hội nghị sinh viên NCKH', 'Hội nghị sinh viên NCKH', '', '2024-11-05 18:20:50', 138035, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(263, 'Cô Nguyễn Thị Như', './uploads/10-672a62024da5b7.75293029.jpg', 'Cô Nguyễn Thị Như', 'Cô Nguyễn Thị Như', 'Vui mừng khi bốc trúng phần thưởng dầu gội', '2024-11-05 18:20:50', 137267, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(264, 'Thầy Nguyễn Đức Thắng', './uploads/10-672a62024e0185.72818783.jpg', 'Thầy Nguyễn Đức Thắng', 'Thầy Nguyễn Đức Thắng', '', '2024-11-05 18:20:50', 54533, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, '');
INSERT INTO `images` (`id`, `name`, `path`, `alt_text`, `title`, `description`, `uploaded_at`, `size`, `mime_type`, `artist`, `artist_url`, `artist_id`, `category_id`, `tags`) VALUES
(265, 'Sinh viên & Học sinh', './uploads/10-672a62024e5946.47250434.jpg', 'Sinh viên & Học sinh', 'Sinh viên & Học sinh', '', '2024-11-05 18:20:50', 143845, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(266, 'Sinh viên & Học sinh', './uploads/10-672a62024eb057.71301302.jpg', 'Sinh viên & Học sinh', 'Sinh viên & Học sinh', '', '2024-11-05 18:20:50', 86149, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(267, 'Lễ tốt nghiệp', './uploads/10-672a62024f0397.51516407.jpg', 'Lễ tốt nghiệp', 'Lễ tốt nghiệp', '', '2024-11-05 18:20:50', 113146, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(268, 'Lễ tốt nghiệp', './uploads/10-672a62024f6112.31462592.jpg', 'Lễ tốt nghiệp', 'Lễ tốt nghiệp', '', '2024-11-05 18:20:50', 189638, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(269, 'Lễ tốt nghiệp', './uploads/10-672a62024fc3d8.76080070.jpg', 'Lễ tốt nghiệp', 'Lễ tốt nghiệp', '', '2024-11-05 18:20:50', 97914, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(270, 'Sinh viên làm hồ sơ nhập học', './uploads/10-672a6202501eb2.85663308.jpg', 'Sinh viên làm hồ sơ nhập học', 'Sinh viên làm hồ sơ nhập học', '', '2024-11-05 18:20:50', 181113, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(271, 'Sinh viên làm hồ sơ nhập học', './uploads/10-672a62025077f3.69743438.jpg', 'Sinh viên làm hồ sơ nhập học', 'Sinh viên làm hồ sơ nhập học', '', '2024-11-05 18:20:50', 159681, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(272, 'Lớp CNTT K20', './uploads/10-672a620250cf23.36373441.jfif', 'Lớp CNTT K20', 'Lớp CNTT K20', '', '2024-11-05 18:20:50', 10263, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(273, 'Lớp CNTT K22', './uploads/10-672a62025130b1.02828494.jpg', 'Lớp CNTT K22', 'Lớp CNTT K22', '', '2024-11-05 18:20:50', 284962, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(274, 'Hội thao', './uploads/10-672a6202519060.89097082.jpg', 'Hội thao', 'Hội thao', '', '2024-11-05 18:20:50', 383685, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(275, 'Lớp CNTT K20 tại TMA', './uploads/10-672a620251e6a7.51861583.jpg', 'Lớp CNTT K20 tại TMA', 'Lớp CNTT K20 tại TMA', '', '2024-11-05 18:20:50', 450337, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(276, 'Thầy Thắng và Hải Yến', './uploads/10-672a620252b362.20464954.JPG', 'Thầy Thắng và Hải Yến', 'Thầy Thắng và Hải Yến', '', '2024-11-05 18:20:50', 384483, 'JPG', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(277, 'Họp nhóm', './uploads/10-672a62025310f3.48360254.jpg', 'Họp nhóm', 'Họp nhóm', '', '2024-11-05 18:20:50', 402666, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(278, 'Sinh viên DH Tây Nguyên', './uploads/10-672a6202536a77.92828175.jpg', 'Sinh viên DH Tây Nguyên', 'Sinh viên DH Tây Nguyên', '', '2024-11-05 18:20:50', 247539, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(279, 'Cô Nguyễn Thị Như', './uploads/10-672a620253c121.58194961.JPG', 'Cô Nguyễn Thị Như', 'Cô Nguyễn Thị Như', '', '2024-11-05 18:20:50', 54942, 'JPG', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(280, 'Bảo vệ đề tài tốt nghiệp đại học', './uploads/10-672a6202541597.32512482.jpg', 'Bảo vệ đề tài tốt nghiệp đại học', 'Bảo vệ đề tài tốt nghiệp đại học', '', '2024-11-05 18:20:50', 184065, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(281, 'Hội thi chuyên môn nghiệp vụ 2024', './uploads/10-672a62025472b6.21323691.jpg', 'Hội thi chuyên môn nghiệp vụ 2024', 'Hội thi chuyên môn nghiệp vụ 2024', '', '2024-11-05 18:20:50', 224930, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(282, 'Bảo vệ đề tài tốt nghiệp đại học', './uploads/10-672a620254cb42.27895717.JPG', 'Bảo vệ đề tài tốt nghiệp đại học', 'Bảo vệ đề tài tốt nghiệp đại học', '', '2024-11-05 18:20:50', 270175, 'JPG', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(283, 'Bảo vệ đề tài tốt nghiệp đại học', './uploads/10-672a6202552903.70665614.jpg', 'Bảo vệ đề tài tốt nghiệp đại học', 'Bảo vệ đề tài tốt nghiệp đại học', '', '2024-11-05 18:20:50', 147018, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(284, 'Thầy Từ Ngọc Thảo và lớp CNTT K22', './uploads/10-672a62025583f8.21224119.jpg', 'Thầy Từ Ngọc Thảo và lớp CNTT K22', 'Thầy Từ Ngọc Thảo và lớp CNTT K22', '', '2024-11-05 18:20:50', 166584, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(285, 'Chào mừng tân sinh viên', './uploads/10-672a620255efb2.37725817.jpg', 'Chào mừng tân sinh viên', 'Chào mừng tân sinh viên', '', '2024-11-05 18:20:50', 183211, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(286, 'Bóng đá IT cup', './uploads/10-672a6202565934.87001586.JPG', 'Bóng đá IT cup', 'Bóng đá IT cup', '', '2024-11-05 18:20:50', 277532, 'JPG', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(287, 'Sinh hoạt chi đoàn', './uploads/10-672a620256ba90.84278969.JPG', 'Sinh hoạt chi đoàn', 'Sinh hoạt chi đoàn', '', '2024-11-05 18:20:50', 460324, 'JPG', 'Quốc Huân', '/10-quochuan', 10, 52, ''),
(290, 'Du lịch ...', './uploads/10-672a62f7de2271.53975891.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 7317, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(291, 'Du lịch ...', './uploads/10-672a62f7debf84.69046164.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 4853, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(292, 'Du lịch ...', './uploads/10-672a62f7df29e8.17699331.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 12047, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(293, 'Du lịch ...', './uploads/10-672a62f7df7fa7.46636155.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 14473, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(294, 'Du lịch ...', './uploads/10-672a62f7dfe1e7.52049429.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 7295, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(295, 'Du lịch ...', './uploads/10-672a62f7e04d60.08057376.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 9627, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(296, 'Du lịch ...', './uploads/10-672a62f7e0ada1.72389903.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 8897, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(297, 'Du lịch ...', './uploads/10-672a62f7e1df09.09465496.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 10414, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(298, 'Du lịch ...', './uploads/10-672a62f7e25343.35162340.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 13467, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(299, 'Du lịch ...', './uploads/10-672a62f7e2bf10.52430264.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 5925, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(300, 'Du lịch ...', './uploads/10-672a62f7e313b1.36798795.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 7648, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(301, 'Du lịch ...', './uploads/10-672a62f7e3bdf3.52062148.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 7672, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(302, 'Du lịch ...', './uploads/10-672a62f7e41cd8.03447360.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 6491, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(303, 'Du lịch ...', './uploads/10-672a62f7e47485.65893986.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 8496, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(304, 'Du lịch ...', './uploads/10-672a62f7e4d021.78250509.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 9409, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(305, 'Du lịch ...', './uploads/10-672a62f7e52b70.14458531.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 7416, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(306, 'Du lịch ...', './uploads/10-672a62f7e58dd6.93767831.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 6784, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(307, 'Du lịch ...', './uploads/10-672a62f7e66028.93208675.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 10529, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(308, 'Du lịch ...', './uploads/10-672a62f7e6d402.77648274.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 10957, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(309, 'Du lịch ...', './uploads/10-672a62f7e73718.26039883.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 7986, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(310, 'Du lịch ...', './uploads/10-672a62f7e79840.34154354.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 8109, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(311, 'Du lịch ...', './uploads/10-672a62f7e7ef98.86551544.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 8870, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(312, 'Du lịch ...', './uploads/10-672a62f7e84c94.41002740.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 8249, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(313, 'Du lịch ...', './uploads/10-672a62f7e8b3f4.03631113.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 11615, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(314, 'Du lịch ...', './uploads/10-672a62f7e90db0.99490217.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 8547, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(315, 'Du lịch ...', './uploads/10-672a62f7e967a2.74999484.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 10378, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(316, 'Du lịch ...', './uploads/10-672a62f7e9bc18.27444090.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 12359, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(317, 'Du lịch ...', './uploads/10-672a62f7ea1a95.52181827.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 8826, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(318, 'Du lịch ...', './uploads/10-672a62f7ea74d8.20511519.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 7151, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(319, 'Du lịch ...', './uploads/10-672a62f7eacb66.05264947.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 11671, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(320, 'Du lịch ...', './uploads/10-672a62f7eb2805.84347636.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 11861, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(321, 'Du lịch ...', './uploads/10-672a62f7eb7f67.50048045.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 19516, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(322, 'Du lịch ...', './uploads/10-672a62f7ebdd07.32296818.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 10285, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(323, 'Du lịch ...', './uploads/10-672a62f7ec3a71.90227112.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 13035, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(324, 'Du lịch ...', './uploads/10-672a62f7ec9563.48044228.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 8899, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(325, 'Du lịch ...', './uploads/10-672a62f7ece9c2.86422675.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 6831, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(326, 'Du lịch ...', './uploads/10-672a62f7ed42a0.68165139.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 9409, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(327, 'Du lịch ...', './uploads/10-672a62f7eda905.57747315.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 8044, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(328, 'Du lịch ...', './uploads/10-672a62f7ee0447.14875421.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 10251, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(329, 'Du lịch ...', './uploads/10-672a62f7ee5539.72833529.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 11498, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(330, 'Du lịch ...', './uploads/10-672a62f7eeab38.74338397.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 7090, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(331, 'Du lịch ...', './uploads/10-672a62f7ef02f1.42418719.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 7002, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(332, 'Du lịch ...', './uploads/10-672a62f7ef6a89.91220912.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 6345, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(333, 'Du lịch ...', './uploads/10-672a62f7efc688.44078018.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 8273, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(334, 'Du lịch ...', './uploads/10-672a62f7f023b3.13073788.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 11725, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(335, 'Du lịch ...', './uploads/10-672a62f7f07b90.34168077.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 14213, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(336, 'Du lịch ...', './uploads/10-672a62f7f0ddc6.17414030.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 9340, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(337, 'Du lịch ...', './uploads/10-672a62f7f13994.16951167.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 16135, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(338, 'Du lịch ...', './uploads/10-672a62f7f18916.41528052.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 13380, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(339, 'Du lịch ...', './uploads/10-672a62f7f1e264.12081956.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 10318, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(340, 'Du lịch ...', './uploads/10-672a62f7f23d82.69905923.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 7707, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(341, 'Du lịch ...', './uploads/10-672a62f7f2a445.96828260.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 13643, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(342, 'Du lịch ...', './uploads/10-672a62f7f2f945.00591076.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 9277, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(343, 'Du lịch ...', './uploads/10-672a62f7f35540.78512350.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 10658, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(344, 'Du lịch ...', './uploads/10-672a62f7f3a522.16272525.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 9641, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(345, 'Du lịch ...', './uploads/10-672a62f7f3f929.77032646.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:55', 10191, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(346, 'Du lịch ...', './uploads/10-672a62f8003064.11517051.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 4610, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(347, 'Du lịch ...', './uploads/10-672a62f8008399.98348956.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 6365, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(348, 'Du lịch ...', './uploads/10-672a62f800dba7.98852768.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 8715, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(349, 'Du lịch ...', './uploads/10-672a62f8013900.10707537.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 10127, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(350, 'Du lịch ...', './uploads/10-672a62f8018d13.68019603.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 10175, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(351, 'Du lịch ...', './uploads/10-672a62f801ed59.23746134.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 12487, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(352, 'Du lịch ...', './uploads/10-672a62f8024b38.69583402.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 11559, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(353, 'Du lịch ...', './uploads/10-672a62f8029eb0.00424451.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 7243, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(354, 'Du lịch ...', './uploads/10-672a62f802f561.85075947.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 10987, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(355, 'Du lịch ...', './uploads/10-672a62f8041082.89365240.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 12119, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(356, 'Du lịch ...', './uploads/10-672a62f80471f4.87592744.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 7445, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(357, 'Du lịch ...', './uploads/10-672a62f8059174.58494425.jfif', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 7629, 'jfif', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(358, 'Du lịch ...', './uploads/10-672a62f805ee49.87858230.jpg', 'Du lịch ...', 'Du lịch ...', '', '2024-11-05 18:24:56', 2375335, 'jpg', 'Quốc Huân', '/10-quochuan', 10, 14, ''),
(359, '11-672abc28df2b18.83171013.png', './imgAI/11-672abc28df2b18.83171013.png', '11-672abc28df2b18.83171013.png', '11-672abc28df2b18.83171013.png', NULL, '2024-11-06 00:45:28', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(360, '11-672ac095029692.30950752.png', './imgAI/11-672ac095029692.30950752.png', '11-672ac095029692.30950752.png', '11-672ac095029692.30950752.png', NULL, '2024-11-06 01:04:21', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(361, '11-672ac58a9ecfc0.59671357.png', './imgAI/11-672ac58a9ecfc0.59671357.png', '11-672ac58a9ecfc0.59671357.png', '11-672ac58a9ecfc0.59671357.png', NULL, '2024-11-06 01:25:30', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(362, '11-672ac5d1785023.14184103.png', './imgAI/11-672ac5d1785023.14184103.png', '11-672ac5d1785023.14184103.png', '11-672ac5d1785023.14184103.png', NULL, '2024-11-06 01:26:41', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(363, '11-672ac5dd56ce33.01114036.png', './imgAI/11-672ac5dd56ce33.01114036.png', '11-672ac5dd56ce33.01114036.png', '11-672ac5dd56ce33.01114036.png', NULL, '2024-11-06 01:26:53', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(364, '11-672ac676594158.58403184.png', './imgAI/11-672ac676594158.58403184.png', '11-672ac676594158.58403184.png', '11-672ac676594158.58403184.png', NULL, '2024-11-06 01:29:26', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(365, '11-672ac77a3db9a0.16351833.png', './imgAI/11-672ac77a3db9a0.16351833.png', '11-672ac77a3db9a0.16351833.png', '11-672ac77a3db9a0.16351833.png', NULL, '2024-11-06 01:33:46', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(366, '11-672ac8f96555b2.83824090.png', './imgAI/11-672ac8f96555b2.83824090.png', '11-672ac8f96555b2.83824090.png', '11-672ac8f96555b2.83824090.png', NULL, '2024-11-06 01:40:09', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(367, '11-672ac93bb4f382.75709822.png', './imgAI/11-672ac93bb4f382.75709822.png', '11-672ac93bb4f382.75709822.png', '11-672ac93bb4f382.75709822.png', NULL, '2024-11-06 01:41:15', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(368, '11-672ac9ea694700.21879886.png', './imgAI/11-672ac9ea694700.21879886.png', '11-672ac9ea694700.21879886.png', '11-672ac9ea694700.21879886.png', NULL, '2024-11-06 01:44:10', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(369, '11-672aca36355ed4.33920443.png', './imgAI/11-672aca36355ed4.33920443.png', '11-672aca36355ed4.33920443.png', '11-672aca36355ed4.33920443.png', NULL, '2024-11-06 01:45:26', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(370, '11-672acc21ba4da1.93611017.png', './imgAI/11-672acc21ba4da1.93611017.png', '11-672acc21ba4da1.93611017.png', '11-672acc21ba4da1.93611017.png', NULL, '2024-11-06 01:53:37', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(371, '11-672acdab5c1545.76416418.png', './imgAI/11-672acdab5c1545.76416418.png', '11-672acdab5c1545.76416418.png', '11-672acdab5c1545.76416418.png', NULL, '2024-11-06 02:00:11', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(372, '11-672ace106cb3c3.18185025.png', './imgAI/11-672ace106cb3c3.18185025.png', '11-672ace106cb3c3.18185025.png', '11-672ace106cb3c3.18185025.png', NULL, '2024-11-06 02:01:52', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(373, '11-672acf14e801b3.59093850.png', './imgAI/11-672acf14e801b3.59093850.png', '11-672acf14e801b3.59093850.png', '11-672acf14e801b3.59093850.png', NULL, '2024-11-06 02:06:12', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(374, '11-672acfe876b967.72558543.png', './imgAI/11-672acfe876b967.72558543.png', '11-672acfe876b967.72558543.png', '11-672acfe876b967.72558543.png', NULL, '2024-11-06 02:09:44', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(375, '11-672ad037d6d8d3.25087124.png', './imgAI/11-672ad037d6d8d3.25087124.png', '11-672ad037d6d8d3.25087124.png', '11-672ad037d6d8d3.25087124.png', NULL, '2024-11-06 02:11:03', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL),
(376, '11-672ad25a239930.37980086.png', './imgAI/11-672ad25a239930.37980086.png', '11-672ad25a239930.37980086.png', '11-672ad25a239930.37980086.png', NULL, '2024-11-06 02:20:10', 1048576, 'png', 'Nguyễn Thị Như', '/11-nguyenthinhu', 11, 30, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_account`
--

CREATE TABLE `user_account` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT './avata/avata-default.jpg',
  `date_of_birth` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `account_status` enum('Active','Inactive','Banned') NOT NULL,
  `role` enum('Admin','User','Artist') DEFAULT 'User',
  `address` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female','Other') NOT NULL DEFAULT 'Other',
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `session_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_account`
--

INSERT INTO `user_account` (`user_id`, `username`, `password`, `fullname`, `email`, `phone_number`, `profile_picture`, `date_of_birth`, `created_at`, `account_status`, `role`, `address`, `gender`, `email_verified`, `session_token`) VALUES
(1, 'quanglam', '$2y$10$ii6z8Dc5MwxCpUKaJJvrK.ye7NRN7rvUjssKJYs.FiNMuIh.1Bb2a', 'Mai Văn Quang Lâm', 'quanglammaivan@gmail.com', '0395804101', './avata/f7a8583e6dd7d28fe801cc42e00a21ae1.png', '2004-12-12', '2024-11-02 22:54:23', 'Active', 'Admin', 'BMT', 'Male', 0, '7490ac2236e14302ba71d92627c5411d'),
(2, 'quanglam1', '$2y$10$TdnpQHPOkewQE3XITc.lues9UOeb147ZX9qaZKM8QZFLSwSyRFs7m', '', '', NULL, NULL, '0000-00-00', '2024-09-22 05:08:23', 'Active', 'User', NULL, 'Other', 0, NULL),
(3, 'quanglam@gmail.com', '$2y$10$ZM7w.7ZlbH7MI/b0CyqurOxw7UbH/qVOw.TJpMFjXtCxW/6yIq59u', '', 'quanglam@gmail.com', NULL, NULL, '0000-00-00', '2024-09-22 05:19:18', 'Active', 'User', NULL, 'Other', 0, NULL),
(4, 'quanglam1@gmail.com', '$2y$10$7URZUKkU/ZhhaU84EAuZzuzbB1yJvI3ZSm.3k4bw9UjsY8ztd437G', '', 'quanglam1@gmail.com', NULL, NULL, '0000-00-00', '2024-09-22 05:24:45', 'Active', 'User', NULL, 'Other', 0, NULL),
(5, 'quanglam2@gmail.com', '$2y$10$hwmObZIuW2DiVoGeXKsflOvdZJHlBPwo1BQmRqrc7gdFhVjI0h6bm', '', 'quanglam2@gmail.com', NULL, NULL, '0000-00-00', '2024-09-22 05:38:57', 'Active', 'User', NULL, 'Other', 0, NULL),
(6, 'quanglam@hotmail.com', '$2y$10$ZN8T.SvkXasLnCPMVYkN4.VRT1.yqXS982m.e5IxqGDJZyTbw2om.', '', 'quanglam@hotmail.com', NULL, NULL, '0000-00-00', '2024-09-22 06:01:00', 'Active', 'User', NULL, 'Other', 0, NULL),
(7, 'quanglam12@gmail.com', '$2y$10$nbH1WDDiQqe/R0eZ8c.beeoDKjH.zxFGDaK2k2dlUuGLqi8FMOoim', '123', 'quanglam12@gmail.com', '123', NULL, '0012-03-12', '2024-09-22 07:12:12', 'Active', 'User', 'bmt', 'Other', 0, NULL),
(8, 'tdc147@gmail.com', '$2y$10$IdQksWsGittQsXY9zHah0ep26eY1eYkfRqbQJ6zCgevsYJB9RZRXa', 'chi to', 'tdc147@gmail.com', '0359545289', NULL, '2004-07-14', '2024-11-05 06:43:05', 'Active', 'User', 'dak lak', 'Male', 0, NULL),
(9, 'tranminhanh203vn@gmail.com', '$2y$10$il6cmCqx9oCNBZO6KTdeBuRPhwZk3xqVz/2BhAf/H53MvcmKgfJ3K', 'Trần Minh Anh', 'tranminhanh203vn@gmail.com', '0982208914', './avata/5b8f014859488764bf1edd0ede744c599.jpeg', '2003-12-22', '2024-11-05 07:11:28', 'Active', 'User', '98/3 y wang', 'Male', 0, NULL),
(10, 'quochuan', '$2y$10$T3FVK4NpsyrgKgbHqBH9xeotqmSbEtnrQA27NmcdONUWia587ofhC', 'Quốc Huân', 'quochuan@gmail.com', '0123456789', './avata/avatar-default.jpg', '2000-01-01', '2024-11-05 07:26:50', 'Active', 'User', 'Đăk Lăk', 'Male', 0, NULL),
(11, 'nguyenthinhu', '$2y$10$M9i0D9unbm5TIjfZnmMTdOLBEzeOzC/Rf.reCPP/s5knlpL6bALxG', 'Nguyễn Thị Như', 'nguyenthinhu@gmail.com', '0123456789', './avata/ba285b3bab82e09d58bc71ab6a8b373311.jpg', '2000-01-01', '2024-11-06 00:40:49', 'Active', 'User', 'Đăk Lăk', 'Female', 0, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `name` (`category_name`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Chỉ mục cho bảng `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=377;

--
-- AUTO_INCREMENT cho bảng `user_account`
--
ALTER TABLE `user_account`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
