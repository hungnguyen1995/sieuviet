-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 09, 2019 lúc 10:53 AM
-- Phiên bản máy phục vụ: 10.1.30-MariaDB
-- Phiên bản PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blog`
--

INSERT INTO `blog` (`id`, `name`, `content`, `category_id`, `thumbnail`, `created_at`, `updated_at`) VALUES
(8, 'dasa', '<p>dasda</p>', 22, 'upload/May/04-43-22-Capture.PNG', NULL, NULL),
(9, 'ads', '<p>ads</p>', 19, 'upload/May/03-19-35-Capture.PNG', NULL, NULL),
(10, 'asdasdasd', '<p>asdasda</p>', 19, 'upload/May/03-19-45-DEMO.jpg', NULL, NULL),
(11, 'sdasdas', '<p>asdasdasd</p>', 20, 'upload/May/03-19-56-Capture.PNG', NULL, NULL),
(12, 'dsadasda', '<p>asdasd</p>', 22, 'upload/May/04-40-38-DEMO.jpg', NULL, NULL),
(13, 'asdasdasda', '<p>aadsasdsa</p>', 19, 'upload/May/03-20-21-Capture.PNG', NULL, NULL),
(14, 'adsasda', '<p>dasd</p>', 19, 'upload/May/04-36-15-DEMO.jpg', NULL, NULL),
(15, 'dasdasda', '<p>dasdasd</p>', 22, 'upload/May/08-27-12-DEMO.jpg', NULL, NULL),
(16, '1111', '<p>dasda 1312</p>', 19, 'upload/May/08-25-17-Capture.PNG', NULL, '2019-05-08 04:49:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `parent`, `created_at`, `updated_at`) VALUES
(19, 'Ã¡dsada', 20, NULL, '2019-05-08 09:17:49'),
(20, 'Ã¡Ä‘Ã¢sd', 0, NULL, NULL),
(22, 'asdasd', 19, NULL, NULL),
(23, '12312', 19, '2019-05-08 07:10:53', NULL),
(25, '2311edda', 0, '2019-05-08 07:11:13', '2019-05-08 09:06:00'),
(26, '213123123as', 0, '2019-05-08 07:11:21', '2019-05-08 07:38:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_06_060905_create_category_table', 2),
(4, '2019_05_06_061315_create_blog_table', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, '123', 'abc@gmail.com', '$2y$08$T2FhYkZNNmNXbnRGcGFFVeLjNgpE3cQbwbUXfPrNyIwCcHrTMXBLq', NULL, NULL, NULL),
(4, 'sadasd', 'masndm@gmaid.com', '$2y$08$TWZpcXVCam1jUm1LSHFVeOSI3ZJdDmPnc2sd6G6NjaWTMmTsg5XVC', NULL, NULL, NULL),
(5, 'dasmasd', 'asdmadm@gmail.com', '$2y$08$MXBJcWR5RWRnaTh0aDJad.LLnjo4X4bfic4EU2sYh8StQlsZ5fkPO', NULL, NULL, NULL),
(6, 'asdaskd', 'asdja@dsam.com', '$2y$08$eitENXpJN2xaZXdjbTVQRuj1J7mEWjgnr4BALTsi0Feka33.NBk1W', NULL, NULL, NULL),
(7, 'sad', 'sadasd@saa.asdm', '$2y$08$ei81akdnd3VVQW9mQ25IZ.gcQZr7w1jRANZLvE0xXBt7DzUe9NPsO', NULL, NULL, NULL),
(8, 'Hoang khiem', 'hoangkhiem222@gmail.com', '$2y$08$TXZUTjBPNlhiei9Mc2xYduJ3bknYx1Eix/o5FP4wTOBvZAHjEu7wO', NULL, NULL, NULL),
(9, 'Ã¡dÃ¡', 'hoangkhiem111@gmail.com', '$2y$08$b2hLVXAyc2szL3JGYTc3O.EWPHzRw1WvIEQ9GuWl0sxb8mLPVYp4S', NULL, NULL, NULL),
(10, 'asdasdas', 'a@gmail.com', '$2y$08$VWl3SkJ1dEw0SjQ4Z1J5Z.OabgHfor99s/PJcwi8QTk6R8XmJClyq', NULL, NULL, NULL),
(11, 'sad', 'aaa@gmail.com', '$2y$08$WE1NU2ZaRkR3ZHNReFVvReEy2dE22FGeJ/D29Aujk0ep/ppkqMt4q', NULL, NULL, NULL),
(12, 'Nguyá»…n HoÃ ng KhiÃªm', 'hoangkhiem2222@gmail.com', '$2y$08$cEdBNEszYjBZUmZxZGZxYO0VVwktHmJz9doGUiBX2bzCdM3cMOV9K', NULL, NULL, NULL),
(13, 'saÄ‘asa', 'sadsada@gmail.com', '$2y$08$R0ZISGxaUjVoR2s2RzV3UeQjkfuGEp.151VX7rmR9lNm4NH.Pw3Qa', NULL, '2019-05-08 04:46:34', NULL),
(14, 'djsakd', 'dasnd@gasj.com', '$2y$08$R2NMUjlNZnRQdjZ4OGFEZupHN6UTMF6qd3bPtos6PlNnvE0t5/9hS', NULL, '0000-00-00 00:00:00', NULL),
(15, 'Ã¡Ä‘Ã¢sd', 'asjdkajd@sadas.com', '$2y$08$MVRKYXVDd05uMEtvYmc3Yu8GQBB/opOjEEdam.s5NM7EpKOd5VSTK', NULL, '2019-05-08 06:25:38', NULL),
(16, 'Ã¡dáº¥d', 'asdkasmdk@gmail.com', '$2y$08$aDYyaWExNFpyU3l0TTdiNelwmNZNoYI2y7k9nzSVlfdWzrHDeVoai', NULL, '2019-05-09 01:12:51', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
