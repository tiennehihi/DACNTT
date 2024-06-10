-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th6 10, 2024 lúc 10:34 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookingcar`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booking_list`
--

CREATE TABLE `booking_list` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `cab_id` int(30) NOT NULL,
  `pickup_zone` text NOT NULL,
  `drop_zone` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = Pending,\r\n1 = Driver has Confirmed,\r\n2 = Pickup,\r\n3 = drop-off,\r\n4 = cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `booking_list`
--

INSERT INTO `booking_list` (`id`, `ref_code`, `client_id`, `cab_id`, `pickup_zone`, `drop_zone`, `status`, `date_created`, `date_updated`) VALUES
(25, '202406-00001', 18, 6, 'Khánh Vân', 'Hà Nội', 4, '2024-06-09 00:46:44', '2024-06-09 10:12:23'),
(26, '202406-00002', 18, 2, 'Đại học Thăng Long', 'Hà Đông', 0, '2024-06-10 15:27:09', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cab_list`
--

CREATE TABLE `cab_list` (
  `id` int(30) NOT NULL,
  `reg_code` varchar(100) NOT NULL,
  `category_id` int(30) NOT NULL,
  `cab_reg_no` varchar(200) NOT NULL,
  `body_no` varchar(100) NOT NULL,
  `cab_model` text NOT NULL,
  `cab_driver` text NOT NULL,
  `driver_contact` text NOT NULL,
  `driver_address` text NOT NULL,
  `password` text NOT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cab_list`
--

INSERT INTO `cab_list` (`id`, `reg_code`, `category_id`, `cab_reg_no`, `body_no`, `cab_model`, `cab_driver`, `driver_contact`, `driver_address`, `password`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00002', 1, 'ASTR0306', 'Fusion-130', 'Ford Fusion', 'Mark Cooper', '09123456789', '94 Chestnut Street', '5f4dcc3b5aa765d61d8327deb882cf99', 'uploads/dirvers/1.png?v=1644981064', 1, 0, '2022-03-02 10:59:12', '2022-03-27 22:04:44'),
(2, '202202-00001', 2, 'ASTR0715', 'Camry-440', 'Toyota Camry', 'George Williams', '09456987123', '69 Nixon Avenue', '7ad1aea197a92805ac70f71bdec579d3', 'uploads/dirvers/2.png?v=1644981833', 1, 0, '2022-03-02 11:13:30', '2022-03-27 22:04:51'),
(3, '202203-00001', 1, 'ASTR0123', 'Prius-1010', 'Toyota Prius', 'Henry', '7485658965', '12 Fincham Road', '5f4dcc3b5aa765d61d8327deb882cf99', 'uploads/dirvers/3.png?v=1648051050', 1, 0, '2022-03-02 21:42:30', '2022-03-27 22:05:00'),
(4, '202203-00002', 1, 'ASTR0770', 'Soul-009', 'Kia Soul', 'Lexie Luthor', '7896478540', '70 Star Trek Drive', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 1, 0, '2022-03-02 21:59:17', '2022-03-27 14:44:37'),
(5, '202203-00003', 1, 'ASTR0741', 'Civic-7781', 'Honda Civic', 'Allen S. Nichols', '7895410000', '74 Frosty Lane', '5f4dcc3b5aa765d61d8327deb882cf99', 'uploads/dirvers/5.png?v=1648311707', 1, 0, '2022-03-02 22:06:47', '2022-03-27 14:44:40'),
(6, '202203-00004', 2, 'ASTR0850', 'ESV-7700', 'Cadillac Escalade ESV', 'Jose R. Kerner', '7850001010', '15 Chatham Way', '5f4dcc3b5aa765d61d8327deb882cf99', 'uploads/dirvers/6.png?v=1648311872', 1, 0, '2022-03-02 22:09:32', '2022-03-27 14:44:43'),
(7, '202203-00005', 1, 'ASTR0555', 'iTen-1010', 'Hyundai i10', 'Tony W. Bryan', '4785478500', '59 Patterson Fork Road', '5f4dcc3b5aa765d61d8327deb882cf99', 'uploads/dirvers/7.png?v=1648312063', 1, 0, '2022-03-02 22:12:43', '2022-03-02 22:12:43'),
(8, '202203-00006', 1, 'ASTR0020', 'Skoda-162TSI', 'Skoda Superb 162TSI', 'John J. Ackles', '2547854444', '49 Andell Road', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 1, 0, '2022-03-02 22:16:57', '2022-03-27 14:44:48'),
(9, '202203-00007', 1, 'ASTRO0022', 'Picanto-7785', 'Kia Picanto', 'Amy K. Walker', '4558889850', '54 Dovetail Estates', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 1, 0, '2022-03-02 22:18:41', '2022-03-27 14:44:51'),
(10, '202203-00008', 3, 'ASTR0089', 'Galaxy-7777', 'Ford Galaxy', 'Stanley J. Marty', '2589654570', '77 Park Street', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 1, 0, '2022-03-02 13:00:24', '2022-03-27 14:44:53'),
(11, '202203-00009', 1, 'ASTR0047', 'Passat-7890', 'Volkswagen Passat', 'Gabriel M. Allen', '7896666666', '13 Boring Lane', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 1, 0, '2022-03-02 13:02:37', '2022-03-27 14:44:57'),
(12, '202203-00010', 3, 'ASTR0258', 'Touran-8989', 'Volkswagen Touran', 'Wayne J. Broussard', '7412563250', '74 Goldleaf Lane', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 1, 0, '2022-03-02 13:04:26', '2022-03-27 14:44:59'),
(13, '202203-00011', 1, 'ASTR0885', 'Toledo-5555', 'SEAT Toledo', 'Linda L. Reid', '7895555540', '29 Lake Floyd Circle', '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 1, 0, '2022-03-02 13:05:37', '2022-03-27 14:45:02'),
(14, '202203-00012', 1, 'ASTR0135', 'i30T-0135', 'Hyundai i30 Tourer', 'Will Williams', '7412580000', '259 Ridge Road', '5f4dcc3b5aa765d61d8327deb882cf99', 'uploads/dirvers/14.png?v=1648366006', 1, 0, '2022-03-02 13:11:46', '2022-03-27 13:11:46'),
(15, '202406-00001', 2, '35A - 782.45', '1.9x4.2', 'Mitsubishi Atrage', 'Vũ Đức Tiến', '09422852933', 'Khánh Vân, Yên Khánh, Ninh Bình', '1a429989249392a7d291e9f7891350f3', NULL, 1, 0, '2024-06-09 09:46:23', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `delete_flag`, `status`, `date_created`, `date_updated`) VALUES
(1, '5 chỗ', 'D&ograve;ng xe 5 chỗ của ch&uacute;ng t&ocirc;i bao gồm c&aacute;c mẫu như Hyundai Kona, Honda HR-V v&agrave; Mazda CX-3. Những chiếc xe n&agrave;y c&oacute; k&iacute;ch thước nhỏ gọn, vận h&agrave;nh linh hoạt v&agrave; tiết kiệm nhi&ecirc;n liệu, rất ph&ugrave; hợp di chuyển trong th&agrave;nh phố. Ch&uacute;ng t&ocirc;i đảm bảo xe lu&ocirc;n sạch sẽ, an to&agrave;n v&agrave; thoải m&aacute;i cho kh&aacute;ch.', 0, 1, '2022-03-01 10:03:54', '2024-06-09 09:52:17'),
(2, '6 chỗ', 'D&ograve;ng xe 6 chỗ như Mitsubishi Xpander v&agrave; Suzuki Ertiga. Những chiếc xe n&agrave;y c&oacute; k&iacute;ch thước lớn hơn xe 5 chỗ, nhưng vẫn di chuyển linh hoạt trong th&agrave;nh phố. Đ&acirc;y l&agrave; lựa chọn ph&ugrave; hợp cho gia đ&igrave;nh c&oacute; 5-6 th&agrave;nh vi&ecirc;n.', 0, 1, '2022-03-01 10:08:10', '2024-06-09 09:52:11'),
(3, '7 chỗ', 'D&ograve;ng xe 7 chỗ của ch&uacute;ng t&ocirc;i bao gồm Toyota Innova, Honda Odyssey v&agrave; Hyundai Santa Fe. Những mẫu xe n&agrave;y rộng r&atilde;i, c&oacute; 3 h&agrave;ng ghế, c&oacute; thể chở được nhiều h&agrave;nh kh&aacute;ch c&ugrave;ng nhiều h&agrave;nh l&yacute;. Ch&uacute;ng rất th&iacute;ch hợp cho c&aacute;c gia đ&igrave;nh hoặc những chuyến đi xa.', 0, 1, '2022-03-03 12:59:29', '2024-06-09 09:52:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_added` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `client_list`
--

INSERT INTO `client_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `image_path`, `status`, `delete_flag`, `date_created`, `date_added`) VALUES
(18, 'Vũ', 'Đức', 'Tiến', 'Male', '0942852933', 'xóm 5, Vân Tiến\r\nYên Khánh', 'vuductientienti@gmail.com', '1a429989249392a7d291e9f7891350f3', NULL, 1, 0, '2024-06-09 00:45:22', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Cab Booking System'),
(6, 'short_name', 'CabBooking'),
(11, 'logo', 'uploads/1717902120_cabicon.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/bgbooking3.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Admin', 'Tiến', 'admin', '1a429989249392a7d291e9f7891350f3', 'uploads/1624000_adminicn.png', NULL, 1, '2022-01-19 14:02:37', '2024-06-09 09:43:30'),
(8, 'Phạm Bảo', 'Nguyên', 'nguyen_staff', '1a429989249392a7d291e9f7891350f3', 'uploads/avatar-8.png?v=1648396920', NULL, 2, '2022-03-01 16:14:00', '2024-06-09 09:55:41'),
(9, 'Đỗ Trung', 'Kiên', 'kien_staff', '1a429989249392a7d291e9f7891350f3', 'uploads/avatar-9.png?v=1648396901', NULL, 2, '2022-03-27 21:46:41', '2024-06-09 09:54:46');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `booking_list`
--
ALTER TABLE `booking_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cab_id` (`cab_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Chỉ mục cho bảng `cab_list`
--
ALTER TABLE `cab_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `booking_list`
--
ALTER TABLE `booking_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `cab_list`
--
ALTER TABLE `cab_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `booking_list`
--
ALTER TABLE `booking_list`
  ADD CONSTRAINT `booking_list_ibfk_1` FOREIGN KEY (`cab_id`) REFERENCES `cab_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_list_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `cab_list`
--
ALTER TABLE `cab_list`
  ADD CONSTRAINT `cab_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
