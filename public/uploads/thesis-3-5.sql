-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 03, 2020 lúc 09:14 AM
-- Phiên bản máy phục vụ: 10.3.16-MariaDB
-- Phiên bản PHP: 7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `thesis`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 0, 'Teachers', 'fa-users', 'teachers', '*', NULL, NULL),
(9, 0, 0, 'Students', 'fa-users', 'students', '*', NULL, NULL),
(10, 0, 0, 'Projects', 'fa-book', 'projects', '*', NULL, NULL),
(11, 0, 0, 'Subscriptions', 'fa-check', 'subscriptions', '*', NULL, NULL),
(12, 0, 0, 'Subscription Finishes', 'fa-check-square', 'subscription-finishes', '*', NULL, NULL),
(13, 0, 0, 'Categories', 'fa-list-alt', 'categories', '*', NULL, NULL),
(14, 0, 0, 'Cron Job', 'fa-list-alt', 'cron-jobs', '*', NULL, NULL),
(15, 0, 0, 'Not Subscription', 'fa-sticky-note-o', '/not-subscriptions', '*', '2020-05-01 08:16:06', '2020-05-01 08:16:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-04-22 09:27:39', '2020-04-22 09:27:39'),
(2, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-04-22 09:29:40', '2020-04-22 09:29:40'),
(3, 1, 'admin/students', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:30:05', '2020-04-22 09:30:05'),
(4, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-04-22 09:30:34', '2020-04-22 09:30:34'),
(5, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:30:38', '2020-04-22 09:30:38'),
(6, 1, 'admin/teachers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:30:42', '2020-04-22 09:30:42'),
(7, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:31:40', '2020-04-22 09:31:40'),
(8, 1, 'admin/teachers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:31:42', '2020-04-22 09:31:42'),
(9, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-04-22 09:33:12', '2020-04-22 09:33:12'),
(10, 1, 'admin/teachers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:33:15', '2020-04-22 09:33:15'),
(11, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-04-22 09:35:39', '2020-04-22 09:35:39'),
(12, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-04-22 09:35:57', '2020-04-22 09:35:57'),
(13, 1, 'admin/teachers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:36:00', '2020-04-22 09:36:00'),
(14, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-04-22 09:37:00', '2020-04-22 09:37:00'),
(15, 1, 'admin/teachers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:37:03', '2020-04-22 09:37:03'),
(16, 1, 'admin/teachers', 'POST', '127.0.0.1', '{\"name\":\"Toan Nguyen\",\"email\":\"ngtoan97@gmail.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-23\",\"is_active\":\"1\",\"password\":\"123456\",\"_token\":\"8kEyqAsvRfodau3yh6nD2MDWDK8GjwghlI1HeFR0\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/teachers\"}', '2020-04-22 09:37:14', '2020-04-22 09:37:14'),
(17, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-04-22 09:37:14', '2020-04-22 09:37:14'),
(18, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:37:58', '2020-04-22 09:37:58'),
(19, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:38:21', '2020-04-22 09:38:21'),
(20, 1, 'admin/cron-jobs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:38:23', '2020-04-22 09:38:23'),
(21, 1, 'admin/cron-jobs', 'POST', '127.0.0.1', '{\"model\":\"Project\",\"description\":\"Test Coupon\",\"end_at\":\"2020-04-01 16:38:23\",\"start_at\":\"2020-04-30 16:38:23\",\"_token\":\"8kEyqAsvRfodau3yh6nD2MDWDK8GjwghlI1HeFR0\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-22 09:38:43', '2020-04-22 09:38:43'),
(22, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-22 09:38:43', '2020-04-22 09:38:43'),
(23, 1, 'admin/cron-jobs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:40:02', '2020-04-22 09:40:02'),
(24, 1, 'admin/cron-jobs/1', 'PUT', '127.0.0.1', '{\"model\":\"Project\",\"description\":\"Test Coupon\",\"end_at\":\"2020-04-30 16:38:23\",\"start_at\":\"2020-04-01 16:38:23\",\"_token\":\"8kEyqAsvRfodau3yh6nD2MDWDK8GjwghlI1HeFR0\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-22 09:40:08', '2020-04-22 09:40:08'),
(25, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-22 09:40:09', '2020-04-22 09:40:09'),
(26, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:40:32', '2020-04-22 09:40:32'),
(27, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:40:35', '2020-04-22 09:40:35'),
(28, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Website\",\"description\":null,\"_token\":\"8kEyqAsvRfodau3yh6nD2MDWDK8GjwghlI1HeFR0\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/categories\"}', '2020-04-22 09:40:40', '2020-04-22 09:40:40'),
(29, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2020-04-22 09:40:41', '2020-04-22 09:40:41'),
(30, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Website\",\"description\":\"Website\",\"_token\":\"8kEyqAsvRfodau3yh6nD2MDWDK8GjwghlI1HeFR0\"}', '2020-04-22 09:40:45', '2020-04-22 09:40:45'),
(31, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-04-22 09:40:45', '2020-04-22 09:40:45'),
(32, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:40:47', '2020-04-22 09:40:47'),
(33, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Network\",\"description\":\"Network\",\"_token\":\"8kEyqAsvRfodau3yh6nD2MDWDK8GjwghlI1HeFR0\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/categories\"}', '2020-04-22 09:40:54', '2020-04-22 09:40:54'),
(34, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-04-22 09:40:54', '2020-04-22 09:40:54'),
(35, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:44:35', '2020-04-22 09:44:35'),
(36, 1, 'admin/projects/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:44:41', '2020-04-22 09:44:41'),
(37, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"name\":\"Laapjt r\\u00ecnh web n\\u00e1n h\\u00e0ng\",\"number\":\"1\",\"status\":\"1\",\"description\":\"Laapjt r\\u00ecnh web n\\u00e1n h\\u00e0ng\",\"teacher_id\":\"6\",\"_token\":\"8kEyqAsvRfodau3yh6nD2MDWDK8GjwghlI1HeFR0\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/projects\"}', '2020-04-22 09:44:44', '2020-04-22 09:44:44'),
(38, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-04-22 09:44:44', '2020-04-22 09:44:44'),
(39, 1, 'admin/projects/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-22 09:44:47', '2020-04-22 09:44:47'),
(40, 1, 'admin/projects/2', 'PUT', '127.0.0.1', '{\"name\":\"L\\u1eadp trinh app h\\u1eb9n h\\u00f2\",\"number\":\"1\",\"status\":\"1\",\"description\":\"L\\u1eadp trinh app h\\u1eb9n h\\u00f2\",\"teacher_id\":\"6\",\"_token\":\"8kEyqAsvRfodau3yh6nD2MDWDK8GjwghlI1HeFR0\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/projects\"}', '2020-04-22 09:44:50', '2020-04-22 09:44:50'),
(41, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-04-22 09:44:51', '2020-04-22 09:44:51'),
(42, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-04-25 04:29:26', '2020-04-25 04:29:26'),
(43, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-04-25 04:29:29', '2020-04-25 04:29:29'),
(44, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-25 04:29:53', '2020-04-25 04:29:53'),
(45, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-25 04:29:55', '2020-04-25 04:29:55'),
(46, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-25 04:30:14', '2020-04-25 04:30:14'),
(47, 1, 'admin/subscriptions/1', 'PUT', '127.0.0.1', '{\"option_one\":\"1\",\"option_two\":\"2\",\"student_id\":\"2\",\"offer_project\":\"Test444\",\"description\":\"HEllo\",\"_token\":\"57ooQb8iFeJ6NROSdXM7UMxQdFVPjOaPalCqtzMP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/subscriptions\"}', '2020-04-25 04:30:19', '2020-04-25 04:30:19'),
(48, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-04-25 04:30:19', '2020-04-25 04:30:19'),
(49, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-04-25 04:31:38', '2020-04-25 04:31:38'),
(50, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-25 04:31:41', '2020-04-25 04:31:41'),
(51, 1, 'admin/subscriptions/1', 'PUT', '127.0.0.1', '{\"option_one\":\"1\",\"option_two\":\"2\",\"student_id\":\"1\",\"offer_project\":\"Test444\",\"description\":\"HEllo\",\"_token\":\"57ooQb8iFeJ6NROSdXM7UMxQdFVPjOaPalCqtzMP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/subscriptions\"}', '2020-04-25 04:31:44', '2020-04-25 04:31:44'),
(52, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-04-25 04:31:44', '2020-04-25 04:31:44'),
(53, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-25 04:31:47', '2020-04-25 04:31:47'),
(54, 1, 'admin/subscriptions/1', 'PUT', '127.0.0.1', '{\"option_one\":\"1\",\"option_two\":\"2\",\"student_id\":\"2\",\"offer_project\":\"Test444\",\"description\":\"HEllo\",\"_token\":\"57ooQb8iFeJ6NROSdXM7UMxQdFVPjOaPalCqtzMP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/subscriptions\"}', '2020-04-25 04:31:51', '2020-04-25 04:31:51'),
(55, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-04-25 04:31:51', '2020-04-25 04:31:51'),
(56, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-04-25 04:32:12', '2020-04-25 04:32:12'),
(57, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-25 04:32:14', '2020-04-25 04:32:14'),
(58, 1, 'admin/subscriptions/1', 'PUT', '127.0.0.1', '{\"option_one\":\"1\",\"option_two\":\"2\",\"student_id\":\"1\",\"offer_project\":\"Test444\",\"description\":\"HEllo\",\"_token\":\"57ooQb8iFeJ6NROSdXM7UMxQdFVPjOaPalCqtzMP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/subscriptions\"}', '2020-04-25 04:32:17', '2020-04-25 04:32:17'),
(59, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-04-25 04:32:17', '2020-04-25 04:32:17'),
(60, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-25 04:32:20', '2020-04-25 04:32:20'),
(61, 1, 'admin/subscriptions/1', 'PUT', '127.0.0.1', '{\"option_one\":\"1\",\"option_two\":\"2\",\"student_id\":\"2\",\"offer_project\":\"Test444\",\"description\":\"HEllo\",\"_token\":\"57ooQb8iFeJ6NROSdXM7UMxQdFVPjOaPalCqtzMP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/subscriptions\"}', '2020-04-25 04:32:25', '2020-04-25 04:32:25'),
(62, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-04-25 04:32:25', '2020-04-25 04:32:25'),
(63, 1, 'admin/subscriptions/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-25 04:32:29', '2020-04-25 04:32:29'),
(64, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-04-27 07:30:16', '2020-04-27 07:30:16'),
(65, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-04-27 07:30:20', '2020-04-27 07:30:20'),
(66, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 07:30:26', '2020-04-27 07:30:26'),
(67, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 07:30:39', '2020-04-27 07:30:39'),
(68, 1, 'admin/teachers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 07:30:43', '2020-04-27 07:30:43'),
(69, 1, 'admin/teachers', 'POST', '127.0.0.1', '{\"name\":\"Chu Huy\\u1ec1n\",\"email\":\"chuhuyen@gamil.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-15\",\"is_active\":\"1\",\"password\":\"123456\",\"_token\":\"0IG4n9KGeL7TbJJxunzeTafdDF3gDPZwrtd86FOo\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/teachers\"}', '2020-04-27 07:31:13', '2020-04-27 07:31:13'),
(70, 1, 'admin/teachers/create', 'GET', '127.0.0.1', '[]', '2020-04-27 07:31:14', '2020-04-27 07:31:14'),
(71, 1, 'admin/teachers', 'POST', '127.0.0.1', '{\"name\":\"Chu Huy\\u1ec1n Teacher\",\"email\":\"chuteacher@gamil.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-15\",\"is_active\":\"1\",\"password\":\"123456\",\"_token\":\"0IG4n9KGeL7TbJJxunzeTafdDF3gDPZwrtd86FOo\"}', '2020-04-27 07:31:38', '2020-04-27 07:31:38'),
(72, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-04-27 07:31:38', '2020-04-27 07:31:38'),
(73, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 07:31:48', '2020-04-27 07:31:48'),
(74, 1, 'admin/projects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 07:31:50', '2020-04-27 07:31:50'),
(75, 1, 'admin/projects', 'POST', '127.0.0.1', '{\"name\":null,\"number\":\"1\",\"status\":\"0\",\"description\":null,\"teacher_id\":null,\"_token\":\"0IG4n9KGeL7TbJJxunzeTafdDF3gDPZwrtd86FOo\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/projects\"}', '2020-04-27 07:32:09', '2020-04-27 07:32:09'),
(76, 1, 'admin/projects/create', 'GET', '127.0.0.1', '[]', '2020-04-27 07:32:10', '2020-04-27 07:32:10'),
(77, 1, 'admin/projects', 'POST', '127.0.0.1', '{\"name\":\"X\\u00e2y d\\u1ef1ng web \\u0111\\u0103ng k\\u00ed \\u0111\\u1ed3 \\u00e1n t\\u1ed1t nghi\\u1ec7p\",\"number\":\"1\",\"status\":\"1\",\"description\":\"X\\u00e2y d\\u1ef1ng web \\u0111\\u0103ng k\\u00ed \\u0111\\u1ed3 \\u00e1n t\\u1ed1t nghi\\u1ec7p\",\"teacher_id\":\"8\",\"_token\":\"0IG4n9KGeL7TbJJxunzeTafdDF3gDPZwrtd86FOo\"}', '2020-04-27 07:32:41', '2020-04-27 07:32:41'),
(78, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-04-27 07:32:41', '2020-04-27 07:32:41'),
(79, 1, 'admin/projects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 07:32:45', '2020-04-27 07:32:45'),
(80, 1, 'admin/projects', 'POST', '127.0.0.1', '{\"name\":\"L\\u1eadp tr\\u00ecnh b\\u1ea3o m\\u1eadt h\\u1ec7 th\\u1ed1ng\",\"number\":\"1\",\"status\":\"1\",\"description\":\"L\\u1eadp tr\\u00ecnh b\\u1ea3o m\\u1eadt h\\u1ec7 th\\u1ed1ng\",\"teacher_id\":\"8\",\"_token\":\"0IG4n9KGeL7TbJJxunzeTafdDF3gDPZwrtd86FOo\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/projects\"}', '2020-04-27 07:33:13', '2020-04-27 07:33:13'),
(81, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-04-27 07:33:14', '2020-04-27 07:33:14'),
(82, 1, 'admin/students', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 07:35:31', '2020-04-27 07:35:31'),
(83, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 07:44:33', '2020-04-27 07:44:33'),
(84, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '[]', '2020-04-27 07:44:59', '2020-04-27 07:44:59'),
(85, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 08:28:45', '2020-04-27 08:28:45'),
(86, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 08:28:47', '2020-04-27 08:28:47'),
(87, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-04-27 08:55:43', '2020-04-27 08:55:43'),
(88, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 08:55:46', '2020-04-27 08:55:46'),
(89, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 08:56:05', '2020-04-27 08:56:05'),
(90, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 08:57:09', '2020-04-27 08:57:09'),
(91, 1, 'admin/cron-jobs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 08:57:13', '2020-04-27 08:57:13'),
(92, 1, 'admin/cron-jobs', 'POST', '127.0.0.1', '{\"model\":\"Subscriptions\",\"description\":\"Subscriptions for teacher\",\"end_at\":\"2020-04-27 15:57:13\",\"start_at\":\"2020-05-09 15:57:13\",\"_token\":\"RTVHwqzNtvxJYdD4EeDPRdYXZcncjagBiT4yT2hJ\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-27 08:57:44', '2020-04-27 08:57:44'),
(93, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 08:57:45', '2020-04-27 08:57:45'),
(94, 1, 'admin/cron-jobs/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:01:43', '2020-04-27 09:01:43'),
(95, 1, 'admin/cron-jobs/2', 'PUT', '127.0.0.1', '{\"model\":\"Subscriptions\",\"description\":\"Subscriptions for teacher\",\"end_at\":\"2020-04-13 15:57:13\",\"start_at\":\"2020-05-09 15:57:13\",\"_token\":\"RTVHwqzNtvxJYdD4EeDPRdYXZcncjagBiT4yT2hJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-27 09:01:47', '2020-04-27 09:01:47'),
(96, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:01:48', '2020-04-27 09:01:48'),
(97, 1, 'admin/cron-jobs/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:03:43', '2020-04-27 09:03:43'),
(98, 1, 'admin/cron-jobs/2', 'PUT', '127.0.0.1', '{\"model\":\"Subscriptions\",\"description\":\"Subscriptions for teacher\",\"end_at\":\"2020-05-09 15:57:13\",\"start_at\":\"2020-03-30 15:57:13\",\"_token\":\"RTVHwqzNtvxJYdD4EeDPRdYXZcncjagBiT4yT2hJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-27 09:03:52', '2020-04-27 09:03:52'),
(99, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:03:52', '2020-04-27 09:03:52'),
(100, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:10:57', '2020-04-27 09:10:57'),
(101, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:10:57', '2020-04-27 09:10:57'),
(102, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:11:01', '2020-04-27 09:11:01'),
(103, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:13:36', '2020-04-27 09:13:36'),
(104, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:13:43', '2020-04-27 09:13:43'),
(105, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:13:47', '2020-04-27 09:13:47'),
(106, 1, 'admin/cron-jobs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:13:52', '2020-04-27 09:13:52'),
(107, 1, 'admin/cron-jobs/create', 'GET', '127.0.0.1', '[]', '2020-04-27 09:20:24', '2020-04-27 09:20:24'),
(108, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:25:45', '2020-04-27 09:25:45'),
(109, 1, 'admin/cron-jobs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:25:48', '2020-04-27 09:25:48'),
(110, 1, 'admin/cron-jobs/1', 'PUT', '127.0.0.1', '{\"model\":\"0\",\"description\":\"Test Coupon\",\"end_at\":\"2020-04-30 16:38:23\",\"start_at\":\"2020-04-01 16:38:23\",\"_token\":\"RTVHwqzNtvxJYdD4EeDPRdYXZcncjagBiT4yT2hJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-27 09:25:52', '2020-04-27 09:25:52'),
(111, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:25:52', '2020-04-27 09:25:52'),
(112, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:26:15', '2020-04-27 09:26:15'),
(113, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:26:22', '2020-04-27 09:26:22'),
(114, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:27:19', '2020-04-27 09:27:19'),
(115, 1, 'admin/cron-jobs/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:27:22', '2020-04-27 09:27:22'),
(116, 1, 'admin/cron-jobs/2', 'PUT', '127.0.0.1', '{\"model\":\"1\",\"description\":\"Subscriptions for teacher\",\"end_at\":\"2020-05-09 15:57:13\",\"start_at\":\"2020-03-30 15:57:13\",\"_token\":\"RTVHwqzNtvxJYdD4EeDPRdYXZcncjagBiT4yT2hJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-27 09:27:26', '2020-04-27 09:27:26'),
(117, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:27:26', '2020-04-27 09:27:26'),
(118, 1, 'admin/cron-jobs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:41:09', '2020-04-27 09:41:09'),
(119, 1, 'admin/cron-jobs', 'POST', '127.0.0.1', '{\"model\":\"2\",\"description\":\"The time student\",\"end_at\":\"2020-05-09 16:41:09\",\"start_at\":\"2020-04-20 16:41:09\",\"_token\":\"RTVHwqzNtvxJYdD4EeDPRdYXZcncjagBiT4yT2hJ\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-27 09:41:37', '2020-04-27 09:41:37'),
(120, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:41:37', '2020-04-27 09:41:37'),
(121, 1, 'admin/cron-jobs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:42:07', '2020-04-27 09:42:07'),
(122, 1, 'admin/cron-jobs/1', 'PUT', '127.0.0.1', '{\"model\":\"0\",\"description\":\"The time for teacher subscription project\",\"end_at\":\"2020-04-30 16:38:23\",\"start_at\":\"2020-04-01 16:38:23\",\"_token\":\"RTVHwqzNtvxJYdD4EeDPRdYXZcncjagBiT4yT2hJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-27 09:42:11', '2020-04-27 09:42:11'),
(123, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:42:12', '2020-04-27 09:42:12'),
(124, 1, 'admin/cron-jobs/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:42:31', '2020-04-27 09:42:31'),
(125, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:45:35', '2020-04-27 09:45:35'),
(126, 1, 'admin/cron-jobs/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:45:40', '2020-04-27 09:45:40'),
(127, 1, 'admin/cron-jobs/3', 'PUT', '127.0.0.1', '{\"model\":\"2\",\"description\":\"The time student\",\"end_at\":\"2020-04-26 16:41:09\",\"start_at\":\"2020-04-20 16:41:09\",\"_token\":\"RTVHwqzNtvxJYdD4EeDPRdYXZcncjagBiT4yT2hJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-27 09:45:44', '2020-04-27 09:45:44'),
(128, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:45:45', '2020-04-27 09:45:45'),
(129, 1, 'admin/cron-jobs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:56:37', '2020-04-27 09:56:37'),
(130, 1, 'admin/cron-jobs/1', 'PUT', '127.0.0.1', '{\"model\":\"0\",\"description\":\"The time for teacher subscription project\",\"end_at\":\"2020-04-26 16:38:23\",\"start_at\":\"2020-04-01 16:38:23\",\"_token\":\"RTVHwqzNtvxJYdD4EeDPRdYXZcncjagBiT4yT2hJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-27 09:56:43', '2020-04-27 09:56:43'),
(131, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:56:43', '2020-04-27 09:56:43'),
(132, 1, 'admin/cron-jobs/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 09:56:57', '2020-04-27 09:56:57'),
(133, 1, 'admin/cron-jobs/2', 'PUT', '127.0.0.1', '{\"model\":\"1\",\"description\":\"Subscriptions for teacher\",\"end_at\":\"2020-04-26 15:57:13\",\"start_at\":\"2020-03-30 15:57:13\",\"_token\":\"RTVHwqzNtvxJYdD4EeDPRdYXZcncjagBiT4yT2hJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-27 09:57:01', '2020-04-27 09:57:01'),
(134, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 09:57:02', '2020-04-27 09:57:02'),
(135, 1, 'admin/cron-jobs/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 10:01:37', '2020-04-27 10:01:37'),
(136, 1, 'admin/cron-jobs/2', 'PUT', '127.0.0.1', '{\"model\":\"1\",\"description\":\"Subscriptions for teacher\",\"end_at\":\"2020-05-08 15:57:13\",\"start_at\":\"2020-03-30 15:57:13\",\"_token\":\"RTVHwqzNtvxJYdD4EeDPRdYXZcncjagBiT4yT2hJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-04-27 10:01:42', '2020-04-27 10:01:42'),
(137, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-04-27 10:01:42', '2020-04-27 10:01:42'),
(138, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-04-29 03:31:55', '2020-04-29 03:31:55'),
(139, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-29 03:32:02', '2020-04-29 03:32:02'),
(140, 1, 'admin/students', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-29 03:32:07', '2020-04-29 03:32:07'),
(141, 1, 'admin/students', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-29 03:32:52', '2020-04-29 03:32:52'),
(142, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-01 07:24:32', '2020-05-01 07:24:32'),
(143, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 07:24:41', '2020-05-01 07:24:41'),
(144, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 07:24:43', '2020-05-01 07:24:43'),
(145, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2020-05-01 07:24:54', '2020-05-01 07:24:54'),
(146, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2020-05-01 07:25:10', '2020-05-01 07:25:10'),
(147, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 07:26:07', '2020-05-01 07:26:07'),
(148, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 07:26:10', '2020-05-01 07:26:10'),
(149, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 07:26:19', '2020-05-01 07:26:19'),
(150, 1, 'admin/cron-jobs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 07:26:25', '2020-05-01 07:26:25'),
(151, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-05-01 07:28:41', '2020-05-01 07:28:41'),
(152, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 07:30:02', '2020-05-01 07:30:02'),
(153, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '[]', '2020-05-01 07:30:04', '2020-05-01 07:30:04'),
(154, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '[]', '2020-05-01 07:30:24', '2020-05-01 07:30:24'),
(155, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '[]', '2020-05-01 07:30:48', '2020-05-01 07:30:48'),
(156, 1, 'admin/students', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 07:30:52', '2020-05-01 07:30:52'),
(157, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 07:31:43', '2020-05-01 07:31:43'),
(158, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 07:35:48', '2020-05-01 07:35:48'),
(159, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 07:35:55', '2020-05-01 07:35:55'),
(160, 1, 'admin/projects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 07:43:32', '2020-05-01 07:43:32'),
(161, 1, 'admin/projects/create', 'GET', '127.0.0.1', '[]', '2020-05-01 07:48:21', '2020-05-01 07:48:21'),
(162, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2020-05-01 07:48:29', '2020-05-01 07:48:29'),
(163, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 08:03:59', '2020-05-01 08:03:59'),
(164, 1, 'admin/cron-jobs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 08:04:07', '2020-05-01 08:04:07'),
(165, 1, 'admin/cron-jobs/1', 'PUT', '127.0.0.1', '{\"model\":\"0\",\"description\":\"The time for teacher subscription project\",\"end_at\":\"2020-04-26 16:38:23\",\"start_at\":\"2020-05-09 16:38:23\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-05-01 08:04:16', '2020-05-01 08:04:16'),
(166, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-05-01 08:04:16', '2020-05-01 08:04:16'),
(167, 1, 'admin/cron-jobs/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 08:04:29', '2020-05-01 08:04:29'),
(168, 1, 'admin/cron-jobs/1', 'PUT', '127.0.0.1', '{\"model\":\"0\",\"description\":\"The time for teacher subscription project\",\"end_at\":\"2020-05-30 16:38:23\",\"start_at\":\"2020-04-26 16:38:23\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-05-01 08:04:40', '2020-05-01 08:04:40'),
(169, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-05-01 08:04:40', '2020-05-01 08:04:40'),
(170, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 08:08:24', '2020-05-01 08:08:24'),
(171, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 08:08:26', '2020-05-01 08:08:26'),
(172, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 08:15:06', '2020-05-01 08:15:06'),
(173, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Not Subscription\",\"icon\":\"fa-sticky-note-o\",\"uri\":\"\\/not-subscriptions\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\"}', '2020-05-01 08:16:06', '2020-05-01 08:16:06'),
(174, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-01 08:16:07', '2020-05-01 08:16:07'),
(175, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-01 08:16:13', '2020-05-01 08:16:13'),
(176, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 08:16:17', '2020-05-01 08:16:17'),
(177, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:24:56', '2020-05-01 08:24:56'),
(178, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:25:10', '2020-05-01 08:25:10'),
(179, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 08:25:16', '2020-05-01 08:25:16'),
(180, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:25:53', '2020-05-01 08:25:53'),
(181, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:26:25', '2020-05-01 08:26:25'),
(182, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:27:13', '2020-05-01 08:27:13'),
(183, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:27:20', '2020-05-01 08:27:20'),
(184, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:28:35', '2020-05-01 08:28:35'),
(185, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:28:54', '2020-05-01 08:28:54'),
(186, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:28:54', '2020-05-01 08:28:54'),
(187, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:29:52', '2020-05-01 08:29:52'),
(188, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:31:24', '2020-05-01 08:31:24'),
(189, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:31:33', '2020-05-01 08:31:33'),
(190, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:31:39', '2020-05-01 08:31:39'),
(191, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:32:46', '2020-05-01 08:32:46'),
(192, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:36:19', '2020-05-01 08:36:19'),
(193, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:36:28', '2020-05-01 08:36:28'),
(194, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:42:57', '2020-05-01 08:42:57'),
(195, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:43:43', '2020-05-01 08:43:43'),
(196, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:43:54', '2020-05-01 08:43:54'),
(197, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:44:03', '2020-05-01 08:44:03'),
(198, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-05-01 08:52:47', '2020-05-01 08:52:47'),
(199, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 08:52:50', '2020-05-01 08:52:50'),
(200, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:52:52', '2020-05-01 08:52:52'),
(201, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:52:53', '2020-05-01 08:52:53'),
(202, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:53:06', '2020-05-01 08:53:06'),
(203, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:53:12', '2020-05-01 08:53:12'),
(204, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:53:15', '2020-05-01 08:53:15'),
(205, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:53:35', '2020-05-01 08:53:35'),
(206, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:53:42', '2020-05-01 08:53:42'),
(207, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:53:53', '2020-05-01 08:53:53'),
(208, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:54:14', '2020-05-01 08:54:14'),
(209, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:55:14', '2020-05-01 08:55:14'),
(210, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"hot\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:55:18', '2020-05-01 08:55:18'),
(211, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"new\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:55:19', '2020-05-01 08:55:19'),
(212, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"recommend\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:55:21', '2020-05-01 08:55:21'),
(213, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:56:30', '2020-05-01 08:56:30'),
(214, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"options\":\"1\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:56:33', '2020-05-01 08:56:33'),
(215, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:56:35', '2020-05-01 08:56:35'),
(216, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"options\":\"1\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:56:37', '2020-05-01 08:56:37'),
(217, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:57:20', '2020-05-01 08:57:20'),
(218, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"options\":\"1\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:57:22', '2020-05-01 08:57:22'),
(219, 1, 'admin/projects/2', 'PUT', '127.0.0.1', '{\"options\":\"1\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:57:24', '2020-05-01 08:57:24'),
(220, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:57:27', '2020-05-01 08:57:27'),
(221, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:57:50', '2020-05-01 08:57:50'),
(222, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:58:09', '2020-05-01 08:58:09'),
(223, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"status\":\"1\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:58:12', '2020-05-01 08:58:12'),
(224, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-01 08:58:15', '2020-05-01 08:58:15'),
(225, 1, 'admin/projects/3', 'PUT', '127.0.0.1', '{\"status\":\"3\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:58:17', '2020-05-01 08:58:17'),
(226, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 08:58:27', '2020-05-01 08:58:27'),
(227, 1, 'admin/students', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 08:58:31', '2020-05-01 08:58:31'),
(228, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 08:59:43', '2020-05-01 08:59:43'),
(229, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 08:59:46', '2020-05-01 08:59:46'),
(230, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"isActive\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:59:49', '2020-05-01 08:59:49'),
(231, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"isActive\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 08:59:51', '2020-05-01 08:59:51'),
(232, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 08:59:52', '2020-05-01 08:59:52'),
(233, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:00:36', '2020-05-01 09:00:36'),
(234, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:00:38', '2020-05-01 09:00:38'),
(235, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:00:39', '2020-05-01 09:00:39'),
(236, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"isActive\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:00:46', '2020-05-01 09:00:46'),
(237, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"isActive\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:00:46', '2020-05-01 09:00:46'),
(238, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"isActive\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:00:47', '2020-05-01 09:00:47'),
(239, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:00:50', '2020-05-01 09:00:50'),
(240, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:01:22', '2020-05-01 09:01:22'),
(241, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:01:29', '2020-05-01 09:01:29'),
(242, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:01:31', '2020-05-01 09:01:31'),
(243, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:01:32', '2020-05-01 09:01:32'),
(244, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:01:47', '2020-05-01 09:01:47'),
(245, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:01:49', '2020-05-01 09:01:49'),
(246, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:01:52', '2020-05-01 09:01:52'),
(247, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:01:52', '2020-05-01 09:01:52'),
(248, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:02:06', '2020-05-01 09:02:06'),
(249, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 09:02:12', '2020-05-01 09:02:12'),
(250, 1, 'admin/students', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 09:02:15', '2020-05-01 09:02:15'),
(251, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:02:19', '2020-05-01 09:02:19'),
(252, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:02:20', '2020-05-01 09:02:20'),
(253, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:02:21', '2020-05-01 09:02:21'),
(254, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:02:23', '2020-05-01 09:02:23'),
(255, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:02:38', '2020-05-01 09:02:38'),
(256, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:02:41', '2020-05-01 09:02:41'),
(257, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:02:42', '2020-05-01 09:02:42'),
(258, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:02:44', '2020-05-01 09:02:44'),
(259, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:02:45', '2020-05-01 09:02:45'),
(260, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:02:50', '2020-05-01 09:02:50'),
(261, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:03:13', '2020-05-01 09:03:13'),
(262, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:03:15', '2020-05-01 09:03:15'),
(263, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:03:19', '2020-05-01 09:03:19'),
(264, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:03:19', '2020-05-01 09:03:19'),
(265, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:03:20', '2020-05-01 09:03:20'),
(266, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:03:21', '2020-05-01 09:03:21'),
(267, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:03:32', '2020-05-01 09:03:32'),
(268, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:03:42', '2020-05-01 09:03:42'),
(269, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:03:44', '2020-05-01 09:03:44'),
(270, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:03:45', '2020-05-01 09:03:45'),
(271, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:03:46', '2020-05-01 09:03:46'),
(272, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:03:48', '2020-05-01 09:03:48'),
(273, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:03:49', '2020-05-01 09:03:49'),
(274, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:03:50', '2020-05-01 09:03:50'),
(275, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:03:52', '2020-05-01 09:03:52'),
(276, 1, 'admin/students/3', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:03:53', '2020-05-01 09:03:53'),
(277, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:03:55', '2020-05-01 09:03:55'),
(278, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:04:46', '2020-05-01 09:04:46'),
(279, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:04:48', '2020-05-01 09:04:48'),
(280, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:04:49', '2020-05-01 09:04:49'),
(281, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:04:51', '2020-05-01 09:04:51'),
(282, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:04:52', '2020-05-01 09:04:52'),
(283, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:05:33', '2020-05-01 09:05:33'),
(284, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:05:37', '2020-05-01 09:05:37'),
(285, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:05:38', '2020-05-01 09:05:38'),
(286, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:05:55', '2020-05-01 09:05:55'),
(287, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:05:57', '2020-05-01 09:05:57'),
(288, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:05:58', '2020-05-01 09:05:58'),
(289, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:06:00', '2020-05-01 09:06:00'),
(290, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:06:30', '2020-05-01 09:06:30'),
(291, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:06:32', '2020-05-01 09:06:32'),
(292, 1, 'admin/students/3', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:06:37', '2020-05-01 09:06:37'),
(293, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:06:39', '2020-05-01 09:06:39'),
(294, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:06:40', '2020-05-01 09:06:40'),
(295, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:06:46', '2020-05-01 09:06:46'),
(296, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:06:47', '2020-05-01 09:06:47'),
(297, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:07:07', '2020-05-01 09:07:07'),
(298, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:07:11', '2020-05-01 09:07:11'),
(299, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:07:30', '2020-05-01 09:07:30'),
(300, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:07:43', '2020-05-01 09:07:43'),
(301, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:07:48', '2020-05-01 09:07:48'),
(302, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:07:48', '2020-05-01 09:07:48'),
(303, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:07:49', '2020-05-01 09:07:49'),
(304, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:08:07', '2020-05-01 09:08:07'),
(305, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:09:29', '2020-05-01 09:09:29'),
(306, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:09:31', '2020-05-01 09:09:31'),
(307, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:09:43', '2020-05-01 09:09:43'),
(308, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:09:45', '2020-05-01 09:09:45'),
(309, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:09:47', '2020-05-01 09:09:47'),
(310, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:10:45', '2020-05-01 09:10:45'),
(311, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:10:54', '2020-05-01 09:10:54'),
(312, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:10:58', '2020-05-01 09:10:58'),
(313, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:11:48', '2020-05-01 09:11:48'),
(314, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:12:03', '2020-05-01 09:12:03'),
(315, 1, 'admin/students/3', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:12:05', '2020-05-01 09:12:05'),
(316, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:12:08', '2020-05-01 09:12:08'),
(317, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:13:02', '2020-05-01 09:13:02'),
(318, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:13:09', '2020-05-01 09:13:09'),
(319, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:13:12', '2020-05-01 09:13:12'),
(320, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:19:05', '2020-05-01 09:19:05'),
(321, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:19:08', '2020-05-01 09:19:08'),
(322, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:19:24', '2020-05-01 09:19:24'),
(323, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:19:26', '2020-05-01 09:19:26'),
(324, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:20:03', '2020-05-01 09:20:03'),
(325, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:20:08', '2020-05-01 09:20:08'),
(326, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:20:23', '2020-05-01 09:20:23'),
(327, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:20:28', '2020-05-01 09:20:28'),
(328, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:20:30', '2020-05-01 09:20:30'),
(329, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:24:25', '2020-05-01 09:24:25'),
(330, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 09:24:27', '2020-05-01 09:24:27'),
(331, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:30:31', '2020-05-01 09:30:31');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(332, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 09:30:35', '2020-05-01 09:30:35'),
(333, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 09:30:36', '2020-05-01 09:30:36'),
(334, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 09:32:50', '2020-05-01 09:32:50'),
(335, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:34:17', '2020-05-01 09:34:17'),
(336, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:34:22', '2020-05-01 09:34:22'),
(337, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:34:54', '2020-05-01 09:34:54'),
(338, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:35:08', '2020-05-01 09:35:08'),
(339, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:35:30', '2020-05-01 09:35:30'),
(340, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:35:35', '2020-05-01 09:35:35'),
(341, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:36:12', '2020-05-01 09:36:12'),
(342, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:40:20', '2020-05-01 09:40:20'),
(343, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:41:42', '2020-05-01 09:41:42'),
(344, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:42:04', '2020-05-01 09:42:04'),
(345, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 09:42:08', '2020-05-01 09:42:08'),
(346, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:42:16', '2020-05-01 09:42:16'),
(347, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_columns_\":\"created_at,description,id,offer_project,option_two,student_id,updated_at\",\"_pjax\":\"#pjax-container\"}', '2020-05-01 09:43:53', '2020-05-01 09:43:53'),
(348, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_columns_\":\"created_at,description,id,offer_project,option_two,student_id,updated_at\"}', '2020-05-01 09:44:41', '2020-05-01 09:44:41'),
(349, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 09:44:45', '2020-05-01 09:44:45'),
(350, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 09:45:06', '2020-05-01 09:45:06'),
(351, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:02:57', '2020-05-01 10:02:57'),
(352, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-01 10:04:43', '2020-05-01 10:04:43'),
(353, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:04:47', '2020-05-01 10:04:47'),
(354, 1, 'admin/auth/setting', 'PUT', '127.0.0.1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$hCj9bQOBS2GqOWNH2PBY6eG.\\/qq4sWJoL.CBc1TXzHS29lVePxdtm\",\"password_confirmation\":\"$2y$10$hCj9bQOBS2GqOWNH2PBY6eG.\\/qq4sWJoL.CBc1TXzHS29lVePxdtm\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\"}', '2020-05-01 10:04:54', '2020-05-01 10:04:54'),
(355, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2020-05-01 10:04:54', '2020-05-01 10:04:54'),
(356, 1, 'admin/auth/setting', 'GET', '127.0.0.1', '[]', '2020-05-01 10:04:57', '2020-05-01 10:04:57'),
(357, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:06:49', '2020-05-01 10:06:49'),
(358, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-01 10:08:28', '2020-05-01 10:08:28'),
(359, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:08:30', '2020-05-01 10:08:30'),
(360, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:08:35', '2020-05-01 10:08:35'),
(361, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:09:01', '2020-05-01 10:09:01'),
(362, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:09:43', '2020-05-01 10:09:43'),
(363, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:11:08', '2020-05-01 10:11:08'),
(364, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:11:11', '2020-05-01 10:11:11'),
(365, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:11:11', '2020-05-01 10:11:11'),
(366, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:11:49', '2020-05-01 10:11:49'),
(367, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:12:13', '2020-05-01 10:12:13'),
(368, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:13:07', '2020-05-01 10:13:07'),
(369, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:13:32', '2020-05-01 10:13:32'),
(370, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:13:36', '2020-05-01 10:13:36'),
(371, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:13:39', '2020-05-01 10:13:39'),
(372, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:13:41', '2020-05-01 10:13:41'),
(373, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:14:07', '2020-05-01 10:14:07'),
(374, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 10:14:15', '2020-05-01 10:14:15'),
(375, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-05-01 10:14:34', '2020-05-01 10:14:34'),
(376, 1, 'admin/cron-jobs/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:14:43', '2020-05-01 10:14:43'),
(377, 1, 'admin/cron-jobs/3', 'PUT', '127.0.0.1', '{\"model\":\"2\",\"description\":\"The time student\",\"end_at\":\"2020-05-09 16:41:09\",\"start_at\":\"2020-04-20 16:41:09\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/cron-jobs\"}', '2020-05-01 10:14:49', '2020-05-01 10:14:49'),
(378, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-05-01 10:14:50', '2020-05-01 10:14:50'),
(379, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:15:01', '2020-05-01 10:15:01'),
(380, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:15:35', '2020-05-01 10:15:35'),
(381, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 10:15:41', '2020-05-01 10:15:41'),
(382, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:22:05', '2020-05-01 10:22:05'),
(383, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:26:42', '2020-05-01 10:26:42'),
(384, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '[]', '2020-05-01 10:33:52', '2020-05-01 10:33:52'),
(385, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:33:54', '2020-05-01 10:33:54'),
(386, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:35:46', '2020-05-01 10:35:46'),
(387, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:36:07', '2020-05-01 10:36:07'),
(388, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:36:45', '2020-05-01 10:36:45'),
(389, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:38:28', '2020-05-01 10:38:28'),
(390, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:38:48', '2020-05-01 10:38:48'),
(391, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:39:28', '2020-05-01 10:39:28'),
(392, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:40:51', '2020-05-01 10:40:51'),
(393, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:41:33', '2020-05-01 10:41:33'),
(394, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:45:19', '2020-05-01 10:45:19'),
(395, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:45:31', '2020-05-01 10:45:31'),
(396, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:45:45', '2020-05-01 10:45:45'),
(397, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:46:04', '2020-05-01 10:46:04'),
(398, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:46:08', '2020-05-01 10:46:08'),
(399, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:46:46', '2020-05-01 10:46:46'),
(400, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:47:23', '2020-05-01 10:47:23'),
(401, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:48:12', '2020-05-01 10:48:12'),
(402, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:48:22', '2020-05-01 10:48:22'),
(403, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:48:32', '2020-05-01 10:48:32'),
(404, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:48:41', '2020-05-01 10:48:41'),
(405, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:49:06', '2020-05-01 10:49:06'),
(406, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:49:14', '2020-05-01 10:49:14'),
(407, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:49:17', '2020-05-01 10:49:17'),
(408, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:49:35', '2020-05-01 10:49:35'),
(409, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:50:29', '2020-05-01 10:50:29'),
(410, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:51:09', '2020-05-01 10:51:09'),
(411, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:51:18', '2020-05-01 10:51:18'),
(412, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:51:32', '2020-05-01 10:51:32'),
(413, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:51:46', '2020-05-01 10:51:46'),
(414, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:51:53', '2020-05-01 10:51:53'),
(415, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '[]', '2020-05-01 10:51:55', '2020-05-01 10:51:55'),
(416, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:54:56', '2020-05-01 10:54:56'),
(417, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:55:12', '2020-05-01 10:55:12'),
(418, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:57:30', '2020-05-01 10:57:30'),
(419, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:58:18', '2020-05-01 10:58:18'),
(420, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:59:03', '2020-05-01 10:59:03'),
(421, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:59:10', '2020-05-01 10:59:10'),
(422, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:59:20', '2020-05-01 10:59:20'),
(423, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:59:34', '2020-05-01 10:59:34'),
(424, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 10:59:45', '2020-05-01 10:59:45'),
(425, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:02:32', '2020-05-01 11:02:32'),
(426, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:03:10', '2020-05-01 11:03:10'),
(427, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:03:23', '2020-05-01 11:03:23'),
(428, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:03:33', '2020-05-01 11:03:33'),
(429, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:04:10', '2020-05-01 11:04:10'),
(430, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '[]', '2020-05-01 11:04:19', '2020-05-01 11:04:19'),
(431, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '[]', '2020-05-01 11:04:40', '2020-05-01 11:04:40'),
(432, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:04:42', '2020-05-01 11:04:42'),
(433, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:04:53', '2020-05-01 11:04:53'),
(434, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:05:28', '2020-05-01 11:05:28'),
(435, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:05:39', '2020-05-01 11:05:39'),
(436, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:06:08', '2020-05-01 11:06:08'),
(437, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:06:24', '2020-05-01 11:06:24'),
(438, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:06:47', '2020-05-01 11:06:47'),
(439, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:07:09', '2020-05-01 11:07:09'),
(440, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:07:21', '2020-05-01 11:07:21'),
(441, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:07:24', '2020-05-01 11:07:24'),
(442, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:07:47', '2020-05-01 11:07:47'),
(443, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:08:16', '2020-05-01 11:08:16'),
(444, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:08:19', '2020-05-01 11:08:19'),
(445, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:08:30', '2020-05-01 11:08:30'),
(446, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:08:34', '2020-05-01 11:08:34'),
(447, 1, 'admin/subscriptions/1', 'PUT', '127.0.0.1', '{\"option_one\":\"4\",\"option_two\":\"2\",\"student_id\":\"2\",\"offer_project\":\"Test444\",\"description\":\"HEllo\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/subscriptions\"}', '2020-05-01 11:08:40', '2020-05-01 11:08:40'),
(448, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:08:40', '2020-05-01 11:08:40'),
(449, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:08:42', '2020-05-01 11:08:42'),
(450, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:08:46', '2020-05-01 11:08:46'),
(451, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:08:50', '2020-05-01 11:08:50'),
(452, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:08:58', '2020-05-01 11:08:58'),
(453, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:09:45', '2020-05-01 11:09:45'),
(454, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:09:53', '2020-05-01 11:09:53'),
(455, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:10:07', '2020-05-01 11:10:07'),
(456, 1, 'admin/subscriptions/1', 'PUT', '127.0.0.1', '{\"option_one\":\"1\",\"option_two\":\"2\",\"student_id\":\"2\",\"offer_project\":\"Test444\",\"description\":\"HEllo\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/subscriptions\"}', '2020-05-01 11:10:11', '2020-05-01 11:10:11'),
(457, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:10:11', '2020-05-01 11:10:11'),
(458, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:10:29', '2020-05-01 11:10:29'),
(459, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:10:33', '2020-05-01 11:10:33'),
(460, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:10:50', '2020-05-01 11:10:50'),
(461, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:12:24', '2020-05-01 11:12:24'),
(462, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:12:55', '2020-05-01 11:12:55'),
(463, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:13:00', '2020-05-01 11:13:00'),
(464, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:13:02', '2020-05-01 11:13:02'),
(465, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:13:27', '2020-05-01 11:13:27'),
(466, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:14:10', '2020-05-01 11:14:10'),
(467, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:14:12', '2020-05-01 11:14:12'),
(468, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:17:20', '2020-05-01 11:17:20'),
(469, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:17:23', '2020-05-01 11:17:23'),
(470, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 11:17:26', '2020-05-01 11:17:26'),
(471, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-01 11:17:27', '2020-05-01 11:17:27'),
(472, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 11:17:29', '2020-05-01 11:17:29'),
(473, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-01 11:17:30', '2020-05-01 11:17:30'),
(474, 1, 'admin/teachers/8', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 11:17:34', '2020-05-01 11:17:34'),
(475, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-01 11:17:35', '2020-05-01 11:17:35'),
(476, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 11:18:31', '2020-05-01 11:18:31'),
(477, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:18:33', '2020-05-01 11:18:33'),
(478, 1, 'admin/students', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:18:37', '2020-05-01 11:18:37'),
(479, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"4cT5djSr0Dm53a4gKPeruE1a32hlcbPeorFk82JU\",\"_method\":\"PUT\"}', '2020-05-01 11:18:38', '2020-05-01 11:18:38'),
(480, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-01 11:18:41', '2020-05-01 11:18:41'),
(481, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:18:49', '2020-05-01 11:18:49'),
(482, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-01 11:19:16', '2020-05-01 11:19:16'),
(483, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:19:23', '2020-05-01 11:19:23'),
(484, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:19:25', '2020-05-01 11:19:25'),
(485, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:19:32', '2020-05-01 11:19:32'),
(486, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:27:39', '2020-05-01 11:27:39'),
(487, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:27:58', '2020-05-01 11:27:58'),
(488, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:28:05', '2020-05-01 11:28:05'),
(489, 1, 'admin/not-subscriptions/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:28:07', '2020-05-01 11:28:07'),
(490, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:28:17', '2020-05-01 11:28:17'),
(491, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:29:11', '2020-05-01 11:29:11'),
(492, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:29:14', '2020-05-01 11:29:14'),
(493, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-01 11:29:19', '2020-05-01 11:29:19'),
(494, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-02 01:55:32', '2020-05-02 01:55:32'),
(495, 1, 'admin/students', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 01:55:39', '2020-05-02 01:55:39'),
(496, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"yW623MWU2KbYTRNqQO4njsY9SYAfyPpZ73BQUesU\",\"_method\":\"PUT\"}', '2020-05-02 01:55:46', '2020-05-02 01:55:46'),
(497, 1, 'admin/students', 'GET', '127.0.0.1', '[]', '2020-05-02 01:55:47', '2020-05-02 01:55:47'),
(498, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 02:24:44', '2020-05-02 02:24:44'),
(499, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 02:30:01', '2020-05-02 02:30:01'),
(500, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 02:30:05', '2020-05-02 02:30:05'),
(501, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:32:16', '2020-05-02 02:32:16'),
(502, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 02:32:24', '2020-05-02 02:32:24'),
(503, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:32:51', '2020-05-02 02:32:51'),
(504, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:33:05', '2020-05-02 02:33:05'),
(505, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:33:37', '2020-05-02 02:33:37'),
(506, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:33:53', '2020-05-02 02:33:53'),
(507, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:35:09', '2020-05-02 02:35:09'),
(508, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:35:11', '2020-05-02 02:35:11'),
(509, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:36:43', '2020-05-02 02:36:43'),
(510, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:36:55', '2020-05-02 02:36:55'),
(511, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:37:14', '2020-05-02 02:37:14'),
(512, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:37:18', '2020-05-02 02:37:18'),
(513, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:37:33', '2020-05-02 02:37:33'),
(514, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:37:47', '2020-05-02 02:37:47'),
(515, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:38:02', '2020-05-02 02:38:02'),
(516, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:38:23', '2020-05-02 02:38:23'),
(517, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:39:29', '2020-05-02 02:39:29'),
(518, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:39:32', '2020-05-02 02:39:32'),
(519, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:39:39', '2020-05-02 02:39:39'),
(520, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:39:49', '2020-05-02 02:39:49'),
(521, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:40:01', '2020-05-02 02:40:01'),
(522, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:40:32', '2020-05-02 02:40:32'),
(523, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:40:47', '2020-05-02 02:40:47'),
(524, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:41:18', '2020-05-02 02:41:18'),
(525, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:41:30', '2020-05-02 02:41:30'),
(526, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:41:41', '2020-05-02 02:41:41'),
(527, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:41:52', '2020-05-02 02:41:52'),
(528, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:42:05', '2020-05-02 02:42:05'),
(529, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:42:35', '2020-05-02 02:42:35'),
(530, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:42:42', '2020-05-02 02:42:42'),
(531, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:43:24', '2020-05-02 02:43:24'),
(532, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:43:32', '2020-05-02 02:43:32'),
(533, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:44:42', '2020-05-02 02:44:42'),
(534, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:44:46', '2020-05-02 02:44:46'),
(535, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:45:29', '2020-05-02 02:45:29'),
(536, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:45:35', '2020-05-02 02:45:35'),
(537, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:45:43', '2020-05-02 02:45:43'),
(538, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:46:04', '2020-05-02 02:46:04'),
(539, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:46:17', '2020-05-02 02:46:17'),
(540, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:46:45', '2020-05-02 02:46:45'),
(541, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 02:50:35', '2020-05-02 02:50:35'),
(542, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:51:02', '2020-05-02 02:51:02'),
(543, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 02:51:50', '2020-05-02 02:51:50'),
(544, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 02:51:52', '2020-05-02 02:51:52'),
(545, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:52:20', '2020-05-02 02:52:20'),
(546, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:52:30', '2020-05-02 02:52:30'),
(547, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:52:36', '2020-05-02 02:52:36'),
(548, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-02 02:52:49', '2020-05-02 02:52:49'),
(549, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 02:52:55', '2020-05-02 02:52:55'),
(550, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:53:20', '2020-05-02 02:53:20'),
(551, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:53:28', '2020-05-02 02:53:28'),
(552, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:53:57', '2020-05-02 02:53:57'),
(553, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:54:16', '2020-05-02 02:54:16'),
(554, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:57:02', '2020-05-02 02:57:02'),
(555, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 02:57:22', '2020-05-02 02:57:22'),
(556, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:04:09', '2020-05-02 03:04:09'),
(557, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:04:16', '2020-05-02 03:04:16'),
(558, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:04:28', '2020-05-02 03:04:28'),
(559, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:04:36', '2020-05-02 03:04:36'),
(560, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:04:42', '2020-05-02 03:04:42'),
(561, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:04:55', '2020-05-02 03:04:55'),
(562, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:05:03', '2020-05-02 03:05:03'),
(563, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:05:31', '2020-05-02 03:05:31'),
(564, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:05:44', '2020-05-02 03:05:44'),
(565, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:05:49', '2020-05-02 03:05:49'),
(566, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:05:55', '2020-05-02 03:05:55'),
(567, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:06:02', '2020-05-02 03:06:02'),
(568, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:06:23', '2020-05-02 03:06:23'),
(569, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:06:27', '2020-05-02 03:06:27'),
(570, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:09:43', '2020-05-02 03:09:43'),
(571, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:09:52', '2020-05-02 03:09:52'),
(572, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:10:16', '2020-05-02 03:10:16'),
(573, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:10:45', '2020-05-02 03:10:45'),
(574, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:10:51', '2020-05-02 03:10:51'),
(575, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:11:11', '2020-05-02 03:11:11'),
(576, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:11:40', '2020-05-02 03:11:40'),
(577, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:11:45', '2020-05-02 03:11:45'),
(578, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:12:57', '2020-05-02 03:12:57'),
(579, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:13:20', '2020-05-02 03:13:20'),
(580, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:13:28', '2020-05-02 03:13:28'),
(581, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:13:43', '2020-05-02 03:13:43'),
(582, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:13:52', '2020-05-02 03:13:52'),
(583, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:20:38', '2020-05-02 03:20:38'),
(584, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:20:59', '2020-05-02 03:20:59'),
(585, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:21:02', '2020-05-02 03:21:02'),
(586, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:23:00', '2020-05-02 03:23:00'),
(587, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:23:12', '2020-05-02 03:23:12'),
(588, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:23:28', '2020-05-02 03:23:28'),
(589, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:23:35', '2020-05-02 03:23:35'),
(590, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:23:50', '2020-05-02 03:23:50'),
(591, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '[]', '2020-05-02 03:25:52', '2020-05-02 03:25:52'),
(592, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 03:25:56', '2020-05-02 03:25:56'),
(593, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:26:09', '2020-05-02 03:26:09'),
(594, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:27:15', '2020-05-02 03:27:15'),
(595, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:27:27', '2020-05-02 03:27:27'),
(596, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:28:16', '2020-05-02 03:28:16'),
(597, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:28:24', '2020-05-02 03:28:24'),
(598, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:28:31', '2020-05-02 03:28:31'),
(599, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:28:37', '2020-05-02 03:28:37'),
(600, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:29:30', '2020-05-02 03:29:30'),
(601, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:30:49', '2020-05-02 03:30:49'),
(602, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:31:03', '2020-05-02 03:31:03'),
(603, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:31:11', '2020-05-02 03:31:11'),
(604, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:31:43', '2020-05-02 03:31:43'),
(605, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:32:25', '2020-05-02 03:32:25'),
(606, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:32:46', '2020-05-02 03:32:46'),
(607, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:32:51', '2020-05-02 03:32:51'),
(608, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:33:06', '2020-05-02 03:33:06'),
(609, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:33:20', '2020-05-02 03:33:20'),
(610, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:33:43', '2020-05-02 03:33:43'),
(611, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:33:59', '2020-05-02 03:33:59'),
(612, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:34:05', '2020-05-02 03:34:05'),
(613, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:34:26', '2020-05-02 03:34:26'),
(614, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:34:39', '2020-05-02 03:34:39'),
(615, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:37:07', '2020-05-02 03:37:07'),
(616, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:38:44', '2020-05-02 03:38:44'),
(617, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:40:48', '2020-05-02 03:40:48'),
(618, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:41:29', '2020-05-02 03:41:29'),
(619, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:41:39', '2020-05-02 03:41:39'),
(620, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:43:50', '2020-05-02 03:43:50'),
(621, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:44:17', '2020-05-02 03:44:17'),
(622, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:44:35', '2020-05-02 03:44:35'),
(623, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:44:53', '2020-05-02 03:44:53'),
(624, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:45:28', '2020-05-02 03:45:28'),
(625, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:45:58', '2020-05-02 03:45:58'),
(626, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:46:22', '2020-05-02 03:46:22'),
(627, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:46:48', '2020-05-02 03:46:48'),
(628, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:47:04', '2020-05-02 03:47:04'),
(629, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:53:01', '2020-05-02 03:53:01'),
(630, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:56:55', '2020-05-02 03:56:55'),
(631, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 03:57:12', '2020-05-02 03:57:12'),
(632, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 03:57:40', '2020-05-02 03:57:40'),
(633, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 03:57:51', '2020-05-02 03:57:51'),
(634, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 04:02:12', '2020-05-02 04:02:12'),
(635, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 04:02:15', '2020-05-02 04:02:15'),
(636, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:02:17', '2020-05-02 04:02:17'),
(637, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:02:34', '2020-05-02 04:02:34'),
(638, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:03:58', '2020-05-02 04:03:58'),
(639, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:04:05', '2020-05-02 04:04:05'),
(640, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:04:08', '2020-05-02 04:04:08'),
(641, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"status\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:04:21', '2020-05-02 04:04:21'),
(642, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"status\":\"off\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:04:30', '2020-05-02 04:04:30'),
(643, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:05:01', '2020-05-02 04:05:01'),
(644, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:05:04', '2020-05-02 04:05:04'),
(645, 1, 'admin/teachers/8', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:05:14', '2020-05-02 04:05:14'),
(646, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:05:15', '2020-05-02 04:05:15'),
(647, 1, 'admin/teachers/8', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:05:16', '2020-05-02 04:05:16'),
(648, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:05:18', '2020-05-02 04:05:18'),
(649, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:05:53', '2020-05-02 04:05:53'),
(650, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:06:05', '2020-05-02 04:06:05'),
(651, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:06:07', '2020-05-02 04:06:07'),
(652, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:07:24', '2020-05-02 04:07:24'),
(653, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:07:31', '2020-05-02 04:07:31'),
(654, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 04:07:35', '2020-05-02 04:07:35'),
(655, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:07:35', '2020-05-02 04:07:35'),
(656, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:07:57', '2020-05-02 04:07:57'),
(657, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 04:08:00', '2020-05-02 04:08:00'),
(658, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"name\":\"Toan Nguyen Teacher\",\"email\":\"ngtoan97@gmail.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-23\",\"is_active\":\"off\",\"password\":null,\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/teachers\"}', '2020-05-02 04:08:04', '2020-05-02 04:08:04'),
(659, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 04:08:04', '2020-05-02 04:08:04'),
(660, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"name\":\"Toan Nguyen Teacher\",\"email\":\"ngtoan97@gmail.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-23\",\"is_active\":\"off\",\"password\":\"123456\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:08:19', '2020-05-02 04:08:19'),
(661, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:08:19', '2020-05-02 04:08:19'),
(662, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:08:26', '2020-05-02 04:08:26'),
(663, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:09:45', '2020-05-02 04:09:45'),
(664, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:09:48', '2020-05-02 04:09:48'),
(665, 1, 'admin/teachers/8', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:09:50', '2020-05-02 04:09:50'),
(666, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 04:09:52', '2020-05-02 04:09:52'),
(667, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:10:00', '2020-05-02 04:10:00'),
(668, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:10:00', '2020-05-02 04:10:00'),
(669, 1, 'admin/teachers/8', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:10:01', '2020-05-02 04:10:01'),
(670, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:10:02', '2020-05-02 04:10:02'),
(671, 1, 'admin/students', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 04:10:08', '2020-05-02 04:10:08'),
(672, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:10:10', '2020-05-02 04:10:10'),
(673, 1, 'admin/students/1', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:10:11', '2020-05-02 04:10:11'),
(674, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:10:12', '2020-05-02 04:10:12'),
(675, 1, 'admin/students/3', 'PUT', '127.0.0.1', '{\"is_active\":\"off\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:10:13', '2020-05-02 04:10:13'),
(676, 1, 'admin/students/2', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:10:20', '2020-05-02 04:10:20'),
(677, 1, 'admin/students/3', 'PUT', '127.0.0.1', '{\"is_active\":\"on\",\"_token\":\"w84LqOFpufZf7sBD6G7Qf97jIHR5fnf1Zi0pplQQ\",\"_method\":\"PUT\"}', '2020-05-02 04:10:22', '2020-05-02 04:10:22'),
(678, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 04:12:20', '2020-05-02 04:12:20'),
(679, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 04:12:24', '2020-05-02 04:12:24'),
(680, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 04:12:35', '2020-05-02 04:12:35'),
(681, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 04:12:38', '2020-05-02 04:12:38'),
(682, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 06:36:47', '2020-05-02 06:36:47'),
(683, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:36:53', '2020-05-02 06:36:53'),
(684, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 06:40:07', '2020-05-02 06:40:07'),
(685, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:40:09', '2020-05-02 06:40:09'),
(686, 1, 'admin/subscriptions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:40:11', '2020-05-02 06:40:11'),
(687, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:40:18', '2020-05-02 06:40:18'),
(688, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:40:20', '2020-05-02 06:40:20'),
(689, 1, 'admin/subscriptions/1', 'PUT', '127.0.0.1', '{\"option_one\":\"1\",\"option_two\":\"2\",\"student_id\":\"2\",\"offer_project\":\"Test444\",\"description\":\"HEllo\",\"categories\":[\"1\",\"2\",null],\"_token\":\"QbUIgEakMR2Zw3DAvcLkZLpt6hhUr14S6NVRBijM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/subscriptions\"}', '2020-05-02 06:40:25', '2020-05-02 06:40:25'),
(690, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 06:40:26', '2020-05-02 06:40:26'),
(691, 1, 'admin/subscriptions/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:40:28', '2020-05-02 06:40:28'),
(692, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:40:30', '2020-05-02 06:40:30'),
(693, 1, 'admin/subscriptions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:40:32', '2020-05-02 06:40:32'),
(694, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:55:44', '2020-05-02 06:55:44'),
(695, 1, 'admin/projects/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:55:50', '2020-05-02 06:55:50'),
(696, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-02 06:55:51', '2020-05-02 06:55:51'),
(697, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-02 06:56:49', '2020-05-02 06:56:49'),
(698, 1, 'admin/projects/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:56:52', '2020-05-02 06:56:52'),
(699, 1, 'admin/projects/1', 'PUT', '127.0.0.1', '{\"name\":\"Laapjt r\\u00ecnh web n\\u00e1n h\\u00e0ng\",\"number\":\"1\",\"status\":\"1\",\"description\":\"Laapjt r\\u00ecnh web n\\u00e1n h\\u00e0ng\",\"teacher_id\":\"6\",\"categories\":[\"1\",\"2\",null],\"_token\":\"QbUIgEakMR2Zw3DAvcLkZLpt6hhUr14S6NVRBijM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/projects\"}', '2020-05-02 06:56:57', '2020-05-02 06:56:57'),
(700, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-02 06:56:58', '2020-05-02 06:56:58'),
(701, 1, 'admin/projects/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 06:57:00', '2020-05-02 06:57:00'),
(702, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:03:25', '2020-05-02 07:03:25'),
(703, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 07:04:29', '2020-05-02 07:04:29'),
(704, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 07:10:31', '2020-05-02 07:10:31'),
(705, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:10:34', '2020-05-02 07:10:34'),
(706, 1, 'admin/projects/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:10:37', '2020-05-02 07:10:37'),
(707, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:12:54', '2020-05-02 07:12:54'),
(708, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:13:00', '2020-05-02 07:13:00'),
(709, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 07:13:34', '2020-05-02 07:13:34'),
(710, 1, 'admin/not-subscriptions/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:13:39', '2020-05-02 07:13:39'),
(711, 1, 'admin/not-subscriptions/4', 'PUT', '127.0.0.1', '{\"option_one\":\"2\",\"option_two\":\"4\",\"student_id\":\"4\",\"offer_project\":\"Hell\",\"description\":\"geeee\",\"categories\":[\"1\",\"2\",null],\"_token\":\"QbUIgEakMR2Zw3DAvcLkZLpt6hhUr14S6NVRBijM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/not-subscriptions\"}', '2020-05-02 07:13:44', '2020-05-02 07:13:44'),
(712, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 07:13:45', '2020-05-02 07:13:45'),
(713, 1, 'admin/not-subscriptions/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:14:01', '2020-05-02 07:14:01'),
(714, 1, 'admin/not-subscriptions/4/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:14:27', '2020-05-02 07:14:27'),
(715, 1, 'admin/not-subscriptions/4/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:14:51', '2020-05-02 07:14:51'),
(716, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:14:54', '2020-05-02 07:14:54'),
(717, 1, 'admin/subscription-finishes/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:14:57', '2020-05-02 07:14:57'),
(718, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:28:31', '2020-05-02 07:28:31'),
(719, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:28:52', '2020-05-02 07:28:52'),
(720, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 07:28:54', '2020-05-02 07:28:54'),
(721, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:28:59', '2020-05-02 07:28:59'),
(722, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 07:30:00', '2020-05-02 07:30:00'),
(723, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 07:34:56', '2020-05-02 07:34:56'),
(724, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:35:00', '2020-05-02 07:35:00'),
(725, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"name\":\"Toan Nguyen Teacher\",\"email\":\"ngtoan97@gmail.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-23\",\"is_active\":\"on\",\"password\":null,\"_token\":\"QbUIgEakMR2Zw3DAvcLkZLpt6hhUr14S6NVRBijM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/teachers\"}', '2020-05-02 07:35:04', '2020-05-02 07:35:04');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(726, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:35:30', '2020-05-02 07:35:30'),
(727, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:35:31', '2020-05-02 07:35:31'),
(728, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:35:33', '2020-05-02 07:35:33'),
(729, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 07:35:34', '2020-05-02 07:35:34'),
(730, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:35:36', '2020-05-02 07:35:36'),
(731, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"name\":\"Toan Nguyen Teacher\",\"email\":\"ngtoan97@gmail.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-23\",\"is_active\":\"on\",\"password\":null,\"_token\":\"QbUIgEakMR2Zw3DAvcLkZLpt6hhUr14S6NVRBijM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/teachers\"}', '2020-05-02 07:35:38', '2020-05-02 07:35:38'),
(732, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:35:39', '2020-05-02 07:35:39'),
(733, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:35:50', '2020-05-02 07:35:50'),
(734, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"name\":\"Toan Nguyen Teacher\",\"email\":\"ngtoan97@gmail.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-23\",\"is_active\":\"on\",\"password\":null,\"_token\":\"QbUIgEakMR2Zw3DAvcLkZLpt6hhUr14S6NVRBijM\",\"_method\":\"PUT\"}', '2020-05-02 07:35:52', '2020-05-02 07:35:52'),
(735, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:35:52', '2020-05-02 07:35:52'),
(736, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:39:38', '2020-05-02 07:39:38'),
(737, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"name\":\"Toan Nguyen Teacher\",\"email\":\"ngtoan97@gmail.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-23\",\"is_active\":\"on\",\"password\":null,\"_token\":\"QbUIgEakMR2Zw3DAvcLkZLpt6hhUr14S6NVRBijM\",\"_method\":\"PUT\"}', '2020-05-02 07:39:41', '2020-05-02 07:39:41'),
(738, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:39:42', '2020-05-02 07:39:42'),
(739, 1, 'admin/subscription-finishes/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:44:30', '2020-05-02 07:44:30'),
(740, 1, 'admin/teachers', 'GET', '127.0.0.1', '[]', '2020-05-02 07:50:21', '2020-05-02 07:50:21'),
(741, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:50:24', '2020-05-02 07:50:24'),
(742, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"name\":\"Toan Nguyen Teacher\",\"email\":\"ngtoan97@gmail.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-23\",\"is_active\":\"on\",\"password\":null,\"_token\":\"QbUIgEakMR2Zw3DAvcLkZLpt6hhUr14S6NVRBijM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/teachers\"}', '2020-05-02 07:50:27', '2020-05-02 07:50:27'),
(743, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:50:27', '2020-05-02 07:50:27'),
(744, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"name\":\"Toan Nguyen Teacher\",\"email\":\"ngtoan97@gmail.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-23\",\"is_active\":\"on\",\"password\":\"dsf\\u0111\",\"_token\":\"QbUIgEakMR2Zw3DAvcLkZLpt6hhUr14S6NVRBijM\",\"_method\":\"PUT\"}', '2020-05-02 07:50:31', '2020-05-02 07:50:31'),
(745, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:50:31', '2020-05-02 07:50:31'),
(746, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:50:40', '2020-05-02 07:50:40'),
(747, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"name\":\"Toan Nguyen Teacher\",\"email\":\"ngtoan97@gmail.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-23\",\"is_active\":\"on\",\"password\":null,\"_token\":\"QbUIgEakMR2Zw3DAvcLkZLpt6hhUr14S6NVRBijM\",\"_method\":\"PUT\"}', '2020-05-02 07:50:42', '2020-05-02 07:50:42'),
(748, 1, 'admin/teachers/6', 'GET', '127.0.0.1', '[]', '2020-05-02 07:51:31', '2020-05-02 07:51:31'),
(749, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:51:35', '2020-05-02 07:51:35'),
(750, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '[]', '2020-05-02 07:51:37', '2020-05-02 07:51:37'),
(751, 1, 'admin/teachers/6', 'PUT', '127.0.0.1', '{\"name\":\"Toan Nguyen Teacher\",\"email\":\"ngtoan97@gmail.com\",\"phone_number\":\"0358496951\",\"speciality\":\"Website\",\"type\":\"Teacher\",\"gender\":\"male\",\"birth_day\":\"2020-04-23\",\"is_active\":\"on\",\"password\":null,\"_token\":\"QbUIgEakMR2Zw3DAvcLkZLpt6hhUr14S6NVRBijM\",\"_method\":\"PUT\"}', '2020-05-02 07:51:39', '2020-05-02 07:51:39'),
(752, 1, 'admin/teachers/6', 'GET', '127.0.0.1', '[]', '2020-05-02 07:57:26', '2020-05-02 07:57:26'),
(753, 1, 'admin/teachers/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 07:57:28', '2020-05-02 07:57:28'),
(754, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 08:00:54', '2020-05-02 08:00:54'),
(755, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 08:00:59', '2020-05-02 08:00:59'),
(756, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 08:35:20', '2020-05-02 08:35:20'),
(757, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-02 08:42:39', '2020-05-02 08:42:39'),
(758, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 09:03:38', '2020-05-02 09:03:38'),
(759, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 09:08:41', '2020-05-02 09:08:41'),
(760, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 09:11:57', '2020-05-02 09:11:57'),
(761, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"5\",\"_model\":\"App_Subscription\",\"_token\":\"LiIhf3qwpkRVglpazErDeAzCz8hScmFCdgt0vDIZ\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-05-02 09:12:24', '2020-05-02 09:12:24'),
(762, 1, 'admin/subscriptions/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 09:12:49', '2020-05-02 09:12:49'),
(763, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 09:12:51', '2020-05-02 09:12:51'),
(764, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 09:12:54', '2020-05-02 09:12:54'),
(765, 1, 'admin/subscriptions/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 09:12:56', '2020-05-02 09:12:56'),
(766, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 09:13:01', '2020-05-02 09:13:01'),
(767, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"5\",\"_model\":\"App_Subscription\",\"_token\":\"LiIhf3qwpkRVglpazErDeAzCz8hScmFCdgt0vDIZ\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-05-02 09:13:07', '2020-05-02 09:13:07'),
(768, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 09:13:07', '2020-05-02 09:13:07'),
(769, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 09:13:28', '2020-05-02 09:13:28'),
(770, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 09:20:16', '2020-05-02 09:20:16'),
(771, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 09:22:13', '2020-05-02 09:22:13'),
(772, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 09:23:27', '2020-05-02 09:23:27'),
(773, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 09:23:33', '2020-05-02 09:23:33'),
(774, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 09:27:32', '2020-05-02 09:27:32'),
(775, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-02 09:27:50', '2020-05-02 09:27:50'),
(776, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-02 09:32:37', '2020-05-02 09:32:37'),
(777, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 09:32:42', '2020-05-02 09:32:42'),
(778, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"6\",\"_model\":\"App_Subscription\",\"_token\":\"LiIhf3qwpkRVglpazErDeAzCz8hScmFCdgt0vDIZ\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-05-02 09:32:47', '2020-05-02 09:32:47'),
(779, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 09:33:00', '2020-05-02 09:33:00'),
(780, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"6\",\"_model\":\"App_Subscription\",\"_token\":\"LiIhf3qwpkRVglpazErDeAzCz8hScmFCdgt0vDIZ\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2020-05-02 09:33:06', '2020-05-02 09:33:06'),
(781, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 09:33:06', '2020-05-02 09:33:06'),
(782, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 09:33:21', '2020-05-02 09:33:21'),
(783, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 09:40:43', '2020-05-02 09:40:43'),
(784, 1, 'admin/projects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 10:15:34', '2020-05-02 10:15:34'),
(785, 1, 'admin/projects', 'GET', '127.0.0.1', '[]', '2020-05-02 10:15:41', '2020-05-02 10:15:41'),
(786, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 10:38:49', '2020-05-02 10:38:49'),
(787, 1, 'admin/cron-jobs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 10:38:52', '2020-05-02 10:38:52'),
(788, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 10:38:52', '2020-05-02 10:38:52'),
(789, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 10:43:22', '2020-05-02 10:43:22'),
(790, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 10:50:58', '2020-05-02 10:50:58'),
(791, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '[]', '2020-05-02 10:51:38', '2020-05-02 10:51:38'),
(792, 1, 'admin/subscription-finishes/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 10:51:40', '2020-05-02 10:51:40'),
(793, 1, 'admin/subscription-finishes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 10:51:49', '2020-05-02 10:51:49'),
(794, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 10:51:57', '2020-05-02 10:51:57'),
(795, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-02 20:09:12', '2020-05-02 20:09:12'),
(796, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:09:21', '2020-05-02 20:09:21'),
(797, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:19:28', '2020-05-02 20:19:28'),
(798, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:20:52', '2020-05-02 20:20:52'),
(799, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:21:05', '2020-05-02 20:21:05'),
(800, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:21:13', '2020-05-02 20:21:13'),
(801, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:21:41', '2020-05-02 20:21:41'),
(802, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:24:23', '2020-05-02 20:24:23'),
(803, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:24:38', '2020-05-02 20:24:38'),
(804, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:25:12', '2020-05-02 20:25:12'),
(805, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:25:17', '2020-05-02 20:25:17'),
(806, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:26:37', '2020-05-02 20:26:37'),
(807, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:26:50', '2020-05-02 20:26:50'),
(808, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:27:02', '2020-05-02 20:27:02'),
(809, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:27:18', '2020-05-02 20:27:18'),
(810, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:27:38', '2020-05-02 20:27:38'),
(811, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:28:30', '2020-05-02 20:28:30'),
(812, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:29:11', '2020-05-02 20:29:11'),
(813, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_export_\":\"all\"}', '2020-05-02 20:29:23', '2020-05-02 20:29:23'),
(814, 1, 'admin/not-subscriptions/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:29:40', '2020-05-02 20:29:40'),
(815, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:29:44', '2020-05-02 20:29:44'),
(816, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:30:08', '2020-05-02 20:30:08'),
(817, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:30:28', '2020-05-02 20:30:28'),
(818, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:31:33', '2020-05-02 20:31:33'),
(819, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:31:54', '2020-05-02 20:31:54'),
(820, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\"}', '2020-05-02 20:33:55', '2020-05-02 20:33:55'),
(821, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\"}', '2020-05-02 20:34:07', '2020-05-02 20:34:07'),
(822, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\"}', '2020-05-02 20:34:46', '2020-05-02 20:34:46'),
(823, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\"}', '2020-05-02 20:38:10', '2020-05-02 20:38:10'),
(824, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\",\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:38:20', '2020-05-02 20:38:20'),
(825, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:39:03', '2020-05-02 20:39:03'),
(826, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:39:17', '2020-05-02 20:39:17'),
(827, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:39:17', '2020-05-02 20:39:17'),
(828, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:40:02', '2020-05-02 20:40:02'),
(829, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:40:23', '2020-05-02 20:40:23'),
(830, 1, 'admin/not-subscriptions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:40:42', '2020-05-02 20:40:42'),
(831, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\",\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:40:48', '2020-05-02 20:40:48'),
(832, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-05-02 20:41:13', '2020-05-02 20:41:13'),
(833, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:41:23', '2020-05-02 20:41:23'),
(834, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:41:26', '2020-05-02 20:41:26'),
(835, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"loris_vn\",\"name\":\"Toan Nguyen\",\"password\":\"1234356\",\"password_confirmation\":\"123456\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"I7M0Yc4Q6g33tYhWfxlwX3jb6RyqBm8yZkLm8sci\",\"_previous_\":\"http:\\/\\/thesislocal.com\\/admin\\/auth\\/users\"}', '2020-05-02 20:41:54', '2020-05-02 20:41:54'),
(836, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-05-02 20:41:54', '2020-05-02 20:41:54'),
(837, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"loris_vn\",\"name\":\"Toan Nguyen\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"I7M0Yc4Q6g33tYhWfxlwX3jb6RyqBm8yZkLm8sci\"}', '2020-05-02 20:42:06', '2020-05-02 20:42:06'),
(838, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-05-02 20:42:07', '2020-05-02 20:42:07'),
(839, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:46:14', '2020-05-02 20:46:14'),
(840, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:46:24', '2020-05-02 20:46:24'),
(841, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:47:49', '2020-05-02 20:47:49'),
(842, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:48:03', '2020-05-02 20:48:03'),
(843, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:49:02', '2020-05-02 20:49:02'),
(844, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:49:16', '2020-05-02 20:49:16'),
(845, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"categories\":\"Web\",\"per_page\":\"50\"}', '2020-05-02 20:49:23', '2020-05-02 20:49:23'),
(846, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:49:40', '2020-05-02 20:49:40'),
(847, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:54:58', '2020-05-02 20:54:58'),
(848, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:55:02', '2020-05-02 20:55:02'),
(849, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:58:39', '2020-05-02 20:58:39'),
(850, 1, 'admin/not-subscriptions', 'GET', '127.0.0.1', '[]', '2020-05-02 20:59:08', '2020-05-02 20:59:08'),
(851, 1, 'admin/subscriptions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-02 20:59:53', '2020-05-02 20:59:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL),
(1, 10, NULL, NULL),
(1, 11, NULL, NULL),
(1, 12, NULL, NULL),
(1, 13, NULL, NULL),
(1, 14, NULL, NULL),
(1, 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$hCj9bQOBS2GqOWNH2PBY6eG./qq4sWJoL.CBc1TXzHS29lVePxdtm', 'Administrator', 'images/48d37465c453c979538ba8b10c7d1383.jpg', 'v0glcoE8QCvIYTAgJO51gnILn8otdYGKdN22fMqp4Rux7b4fuzNXzsuOyfJP', '2020-04-22 09:27:18', '2020-05-01 10:04:54'),
(2, 'loris_vn', '$2y$10$6iRCoVWAHGh9s/mOo4o2qOWZwfEcw7wiskWwbOWDhFLW.YeCVsG5m', 'Toan Nguyen', NULL, NULL, '2020-05-02 20:42:07', '2020-05-02 20:42:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_user_permissions`
--

INSERT INTO `admin_user_permissions` (`user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Website', 'Website', '2020-04-22 09:40:45', '2020-04-22 09:40:45'),
(2, 'Network', 'Network', '2020-04-22 09:40:54', '2020-04-22 09:40:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cron_job`
--

CREATE TABLE `cron_job` (
  `id` int(10) UNSIGNED NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_at` datetime NOT NULL,
  `start_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cron_job`
--

INSERT INTO `cron_job` (`id`, `model`, `description`, `end_at`, `start_at`, `created_at`, `updated_at`) VALUES
(1, '0', 'The time for teacher subscription project', '2020-05-30 16:38:23', '2020-04-26 16:38:23', '2020-04-22 09:38:43', '2020-05-01 08:04:40'),
(2, '1', 'Subscriptions for teacher', '2020-05-08 15:57:13', '2020-03-30 15:57:13', '2020-04-27 08:57:45', '2020-04-27 10:01:42'),
(3, '2', 'The time student', '2020-05-09 16:41:09', '2020-04-20 16:41:09', '2020-04-27 09:41:37', '2020-05-01 10:14:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_03_23_074031_create_table_categories', 1),
(6, '2020_03_23_080105_create_table_subscription', 1),
(7, '2020_03_23_081948_create_table_projects', 1),
(8, '2020_03_23_082739_create_project_category', 1),
(9, '2020_03_23_115713_add_relationship_subscription_table', 1),
(10, '2020_03_23_120238_create_subscription_category_table', 1),
(11, '2020_03_30_141451_create_subscription_finish_table', 1),
(12, '2020_03_30_142019_add_relationship_subscription_finish_table', 1),
(13, '2020_04_05_150323_create_cron_job_table', 1),
(14, '2020_05_01_171817_add_field_subscription_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL DEFAULT 1,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `projects`
--

INSERT INTO `projects` (`id`, `name`, `number`, `status`, `description`, `teacher_id`, `created_at`, `updated_at`) VALUES
(1, 'Laapjt rình web nán hàng', 1, '1', 'Laapjt rình web nán hàng', 6, '2020-04-22 09:41:06', '2020-05-01 08:58:12'),
(2, 'Lập trinh app hẹn hò', 1, '1', 'Lập trinh app hẹn hò', 6, '2020-04-22 09:41:25', '2020-04-22 09:44:50'),
(3, 'Xây dựng web đăng kí đồ án tốt nghiệp', 1, '3', 'Xây dựng web đăng kí đồ án tốt nghiệp', 8, '2020-04-27 07:32:41', '2020-05-01 08:58:17'),
(4, 'Lập trình bảo mật hệ thống', 1, '1', 'Lập trình bảo mật hệ thống', 8, '2020-04-27 07:33:13', '2020-04-27 07:33:13'),
(5, 'An toàn điện toán đám mây', 1, '0', 'heloo', 6, '2020-05-02 08:25:50', '2020-05-02 08:25:50'),
(6, 'An toàn điện toán đám mây', 1, '0', 'heloo', 6, '2020-05-02 08:26:12', '2020-05-02 08:26:12'),
(7, 'An toàn điện toán đám mây', 1, '0', 'heloo', 6, '2020-05-02 08:30:28', '2020-05-02 08:30:28'),
(8, 'An toàn điện toán đám mây', 1, '0', 'hrloo', 6, '2020-05-02 08:31:23', '2020-05-02 08:31:23'),
(9, 'An toàn điện toán đám mây', 1, '0', 'hrloo', 6, '2020-05-02 08:33:49', '2020-05-02 08:33:49'),
(10, 'An toàn điện toán đám mây', 1, '0', 'hrloo', 6, '2020-05-02 08:34:05', '2020-05-02 08:34:05'),
(11, 'An toàn điện toán đám mây', 1, '0', 'hrloo', 6, '2020-05-02 08:34:33', '2020-05-02 08:34:33'),
(12, 'An toàn điện toán đám mây', 1, '0', 'hê', 6, '2020-05-02 08:34:45', '2020-05-02 08:34:45'),
(13, 'An toàn thương mại điện tử', 1, '0', 'HEllipp', 6, '2020-05-02 08:42:58', '2020-05-02 08:42:58'),
(14, 'An toàn bảo mật hệ điều hành', 1, '0', 'heee', 6, '2020-05-02 08:46:41', '2020-05-02 08:46:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `project_category`
--

CREATE TABLE `project_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `project_category`
--

INSERT INTO `project_category` (`id`, `project_id`, `category_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 11, 2),
(4, 12, 1),
(5, 13, 2),
(6, 14, 1),
(7, 14, 2),
(8, 2, 1),
(9, 2, 2),
(10, 7, 2),
(11, 5, 1),
(12, 5, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_one` int(10) UNSIGNED DEFAULT NULL,
  `option_two` int(10) UNSIGNED DEFAULT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `offer_project` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subscriptions`
--

    INSERT INTO `subscriptions` (`id`, `option_one`, `option_two`, `student_id`, `offer_project`, `description`, `created_at`, `updated_at`, `status`) VALUES
    (1, 1, 2, 2, 'Test444', 'HEllo', '2020-04-22 09:45:04', '2020-05-01 11:10:11', 1),
    (3, 2, 4, 3, 'Ứng dụng tìm đường', 'Ứng dụng tìm đường', '2020-04-27 07:36:25', '2020-05-01 11:16:28', 1),
    (4, 2, 4, 4, 'Hell', 'geeee', '2020-05-01 10:15:28', '2020-05-01 10:15:28', 0),
    (7, 1, 2, 1, 'Test', 'heee', '2020-05-02 09:33:18', '2020-05-02 09:33:18', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscription_category`
--

CREATE TABLE `subscription_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `subscription_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subscription_category`
--

INSERT INTO `subscription_category` (`id`, `subscription_id`, `category_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 4, 1),
(4, 4, 2),
(14, 7, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscription_finish`
--

CREATE TABLE `subscription_finish` (
  `id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subscription_finish`
--

INSERT INTO `subscription_finish` (`id`, `teacher_id`, `student_id`, `project_id`, `description`, `subscription_id`, `created_at`, `updated_at`) VALUES
(1, 6, 2, 1, 'Teacher checked', 1, '2020-04-22 09:49:11', '2020-04-27 08:09:48'),
(4, 6, 3, 2, 'Teacher checked', 3, '2020-05-01 11:04:08', '2020-05-01 11:16:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `class_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speciality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `student_code`, `gender`, `birth_day`, `class_code`, `speciality`, `type`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Chu Huyền ', 'chuhuyen@gmail.com', '34888533', 'AT120254', 'female', '1997-01-01', 'AT12B', NULL, 'Student', '$2y$10$mEAkKQakGqG2cfZBWzqHgO.sYJJYwiGoOaMlHTZowFPVINka0HyXq', '1', NULL, '2020-04-22 09:30:28', '2020-05-02 04:10:11'),
(2, 'Thanh Thu', 'thanhthu@gamil.com', '34888533', 'AT120255', 'female', '1997-01-01', 'AT12B', NULL, 'Student', '$2y$10$GdYJPaTx.yk5GVXt7lNRk.r1ihdnicWP5aFq.wE/d8MEltwHJoFA2', '1', NULL, '2020-04-22 09:30:28', '2020-05-02 04:10:20'),
(3, 'Hoàng Ngọc Anh', 'ngocanh@gamil.com', '34888533', 'AT120256', 'female', '1997-01-01', 'AT12B', NULL, 'Student', '$2y$10$pLOvFGrGlFHwEiEXlIgNzORj8XXsm7bMiyAhJMZVJohf7HcGW.Zs6', '1', NULL, '2020-04-22 09:30:28', '2020-05-02 04:10:22'),
(4, 'Toan Nguyễn  Khắc', 'toanngukan@gamil.com', '34888533', 'AT120257', 'female', '1997-01-01', 'AT12B', NULL, 'Student', '$2y$10$vh4Tg0b18Y1Oi8yTP562weh.gCD9QD6SYt55Axq1Hlv3WOZlRffRq', '1', NULL, '2020-04-22 09:30:28', '2020-04-22 09:30:28'),
(5, 'Nguyễn Thị Hương Lan', 'huonglan@gamil.com', '34888533', 'AT120258', 'female', '1997-01-01', 'AT12B', NULL, 'Student', '$2y$10$RmXAVpv9TwU.0Wd1Umb9TeNVcAljCinONFlc9svxQRZSEaI.ClRE.', '1', NULL, '2020-04-22 09:30:28', '2020-04-22 09:30:28'),
(6, 'Toan Nguyen Teacher', 'ngtoan97@gmail.com', '0358496951', NULL, 'male', '2020-04-23', NULL, 'Website', 'Teacher', '$2y$10$YKRSsEuhJGllS0A8c96kaOOTTIGYmM/fvAJ1/nLEg9TH08hLaRJTi', '1', NULL, '2020-04-22 09:37:14', '2020-05-02 04:10:02'),
(8, 'Chu Huyền Teacher', 'chuteacher@gamil.com', '0358496951', NULL, 'male', '2020-04-15', NULL, 'Website', 'Teacher', '$2y$10$YKRSsEuhJGllS0A8c96kaOOTTIGYmM/fvAJ1/nLEg9TH08hLaRJTi', '1', NULL, '2020-04-27 07:31:38', '2020-05-02 04:10:01');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Chỉ mục cho bảng `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Chỉ mục cho bảng `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Chỉ mục cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Chỉ mục cho bảng `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cron_job`
--
ALTER TABLE `cron_job`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
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
-- Chỉ mục cho bảng `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_fk_1124` (`teacher_id`);

--
-- Chỉ mục cho bảng `project_category`
--
ALTER TABLE `project_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_fk_1120` (`project_id`),
  ADD KEY `category_fk_1121` (`category_id`);

--
-- Chỉ mục cho bảng `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_one_1125` (`option_one`),
  ADD KEY `option_two_1125` (`option_two`),
  ADD KEY `student_1125` (`student_id`);

--
-- Chỉ mục cho bảng `subscription_category`
--
ALTER TABLE `subscription_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_fk_1126` (`subscription_id`),
  ADD KEY `category_fk_1126` (`category_id`);

--
-- Chỉ mục cho bảng `subscription_finish`
--
ALTER TABLE `subscription_finish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_1126` (`teacher_id`),
  ADD KEY `student_1126` (`student_id`),
  ADD KEY `project_1126` (`project_id`),
  ADD KEY `subscription_1126` (`subscription_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=852;

--
-- AUTO_INCREMENT cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cron_job`
--
ALTER TABLE `cron_job`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `project_category`
--
ALTER TABLE `project_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `subscription_category`
--
ALTER TABLE `subscription_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `subscription_finish`
--
ALTER TABLE `subscription_finish`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `teacher_fk_1124` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `project_category`
--
ALTER TABLE `project_category`
  ADD CONSTRAINT `category_fk_1121` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `project_fk_1120` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Các ràng buộc cho bảng `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `option_one_1125` FOREIGN KEY (`option_one`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `option_two_1125` FOREIGN KEY (`option_two`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `student_1125` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `subscription_category`
--
ALTER TABLE `subscription_category`
  ADD CONSTRAINT `category_fk_1126` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `subscription_fk_1126` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`);

--
-- Các ràng buộc cho bảng `subscription_finish`
--
ALTER TABLE `subscription_finish`
  ADD CONSTRAINT `project_1126` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `student_1126` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `subscription_1126` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`),
  ADD CONSTRAINT `teacher_1126` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
