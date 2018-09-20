-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2018 at 03:11 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rimo`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(10) UNSIGNED NOT NULL,
  `album` varchar(750) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `album`, `created_at`, `updated_at`, `date`, `description`) VALUES
(1, 'KUET', '2018-08-13 06:47:00', '2018-08-16 10:44:23', '2018-08-14', 'Beautiful KUET at night.'),
(2, 'Pohela Boishakh', '2018-08-13 06:47:00', '2018-08-16 10:53:49', '2018-08-14', 'First day of bengali new year');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'locale', 'text', 'Locale', 0, 1, 1, 1, 1, 0, '', 12),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '', 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '', 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '', 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(22, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, '', 9),
(23, 4, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(25, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(26, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(27, 5, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(28, 5, 'photo', 'image', 'Photo', 1, 1, 1, 1, 1, 1, NULL, 2),
(29, 5, 'album_id', 'text_area', 'Album Id', 0, 1, 1, 1, 1, 1, NULL, 4),
(30, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(31, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(33, 5, 'photo_belongsto_album_relationship', 'relationship', 'albums', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Album\",\"table\":\"albums\",\"type\":\"belongsTo\",\"column\":\"album_id\",\"key\":\"id\",\"label\":\"album\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(34, 6, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(35, 6, 'cadet_no', 'number', 'Cadet No', 0, 1, 1, 1, 1, 1, NULL, 4),
(36, 6, 'address', 'text_area', 'Address', 0, 1, 1, 1, 1, 1, NULL, 5),
(37, 6, 'house', 'select_dropdown', 'House', 0, 1, 1, 1, 1, 1, '{\"default\":\"Titumir\",\"options\":{\"Titumir\":\"Titumir\",\"Surma\":\"Surma\",\"Shahjalal\":\"Shahjalal\"}}', 6),
(38, 6, 'profession', 'text', 'Profession', 0, 1, 1, 1, 1, 1, NULL, 8),
(40, 6, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, NULL, 9),
(41, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 10),
(42, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 11),
(43, 1, 'user_hasone_userdetail_relationship', 'relationship', 'userdetails', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Userdetail\",\"table\":\"userdetails\",\"type\":\"hasOne\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"cadet_no\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":null}', 13),
(44, 6, 'userdetail_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(45, 4, 'album', 'text', 'Album', 0, 1, 1, 1, 1, 1, NULL, 2),
(46, 7, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(47, 7, 'headline', 'text', 'Headline', 1, 1, 1, 1, 1, 1, NULL, 3),
(48, 7, 'picture', 'image', 'Picture', 0, 1, 1, 1, 1, 1, NULL, 5),
(49, 7, 'notice', 'text_area', 'Notice', 1, 1, 1, 1, 1, 1, NULL, 6),
(50, 7, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, NULL, 8),
(51, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 9),
(52, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 10),
(53, 1, 'user_hasmany_notice_relationship', 'relationship', 'notices', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Notice\",\"table\":\"notices\",\"type\":\"hasMany\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"headline\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":null}', 14),
(54, 7, 'notice_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(55, 4, 'album_hasmany_photo_relationship', 'relationship', 'photos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Photo\",\"table\":\"photos\",\"type\":\"hasMany\",\"column\":\"album_id\",\"key\":\"id\",\"label\":\"photo\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(56, 7, 'date', 'date', 'Date', 1, 1, 1, 1, 1, 1, NULL, 4),
(57, 4, 'date', 'date', 'Date', 1, 1, 1, 1, 1, 1, NULL, 4),
(58, 4, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, NULL, 3),
(59, 6, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, NULL, 7),
(60, 5, 'title', 'text_area', 'Title', 0, 1, 1, 1, 1, 1, NULL, 3),
(61, 8, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(62, 8, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"Debit\",\"options\":{\"Debit\":\"Debit\",\"Credit\":\"Credit\"}}', 3),
(63, 8, 'amount', 'number', 'Amount', 1, 1, 1, 1, 1, 1, NULL, 4),
(64, 8, 'remark', 'text_area', 'Remark', 0, 1, 1, 1, 1, 1, NULL, 5),
(65, 8, 'transaction_no', 'text', 'Transaction No', 0, 1, 1, 1, 1, 1, NULL, 6),
(66, 8, 'date', 'date', 'Date', 1, 1, 1, 1, 1, 1, NULL, 7),
(67, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 8),
(68, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 9),
(69, 1, 'user_hasmany_transaction_relationship', 'relationship', 'transactions', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Transaction\",\"table\":\"transactions\",\"type\":\"hasMany\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"transaction_no\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":null}', 15),
(70, 8, 'transaction_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"albums\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(71, 8, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, NULL, 10),
(72, 6, 'dob', 'date', 'Date of Birth', 0, 1, 1, 1, 1, 1, NULL, 3),
(73, 7, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"0\",\"options\":{\"0\":\"Hidden\",\"1\":\"Show\"}}', 7);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, NULL, '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(4, 'albums', 'albums', 'Album', 'Albums', 'voyager-photos', 'App\\Album', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-13 06:31:15', '2018-08-13 06:31:15'),
(5, 'photos', 'photos', 'Photo', 'Photos', 'voyager-photo', 'App\\Photo', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-13 06:33:03', '2018-08-13 06:33:03'),
(6, 'userdetails', 'userdetails', 'Userdetail', 'Userdetails', 'voyager-person', 'App\\Userdetail', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-13 07:14:21', '2018-08-13 07:14:21'),
(7, 'notices', 'notices', 'Notice', 'Notices', 'voyager-warning', 'App\\Notice', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-13 09:11:47', '2018-08-13 09:11:47'),
(8, 'transactions', 'transactions', 'Transaction', 'Transactions', 'voyager-receipt', 'App\\Transaction', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null}', '2018-08-14 10:40:43', '2018-08-14 10:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2018-08-13 01:23:43', '2018-08-13 01:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2018-08-13 01:23:43', '2018-08-13 01:23:43', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2018-08-13 01:23:43', '2018-08-13 06:53:32', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2018-08-13 01:23:43', '2018-08-13 01:23:43', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2018-08-13 01:23:43', '2018-08-13 01:23:43', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 5, '2018-08-13 01:23:43', '2018-08-13 06:53:32', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2018-08-13 01:23:43', '2018-08-13 06:53:32', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2018-08-13 01:23:43', '2018-08-13 06:53:32', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2018-08-13 01:23:43', '2018-08-13 06:53:32', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2018-08-13 01:23:43', '2018-08-13 06:53:32', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 6, '2018-08-13 01:23:43', '2018-08-13 06:53:32', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2018-08-13 01:23:43', '2018-08-13 06:53:32', 'voyager.hooks', NULL),
(12, 1, 'Albums', '', '_self', 'voyager-photos', NULL, 14, 1, '2018-08-13 06:31:15', '2018-08-13 06:53:34', 'voyager.albums.index', NULL),
(13, 1, 'Photos', '', '_self', 'voyager-photo', NULL, 14, 2, '2018-08-13 06:33:03', '2018-08-13 06:53:36', 'voyager.photos.index', NULL),
(14, 1, 'Gallery', '', '_self', 'voyager-archive', '#000000', NULL, 7, '2018-08-13 06:53:27', '2018-08-13 06:53:32', NULL, ''),
(15, 1, 'Userdetails', '', '_self', 'voyager-person', NULL, NULL, 8, '2018-08-13 07:14:21', '2018-08-13 07:14:21', 'voyager.userdetails.index', NULL),
(16, 1, 'Notices', '', '_self', 'voyager-warning', NULL, NULL, 9, '2018-08-13 09:11:47', '2018-08-13 09:11:47', 'voyager.notices.index', NULL),
(17, 1, 'Transactions', '', '_self', 'voyager-receipt', NULL, NULL, 10, '2018-08-14 10:40:43', '2018-08-14 10:40:43', 'voyager.transactions.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(26, '2016_06_01_000004_create_oauth_clients_table', 2),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(10) UNSIGNED NOT NULL,
  `headline` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(750) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `headline`, `picture`, `notice`, `user_id`, `created_at`, `updated_at`, `date`, `status`) VALUES
(1, '৪৫ পয়সা সর্বনিম্ন কলরেট চালু মধ্যরাতে', 'notices\\August2018\\PulZChj38UMSYD1a5tpm.jpg', 'আজ সোমবার মধ্যরাত থেকে মোবাইল ফোনের সর্বনিম্ন একক কলরেট ৪৫ পয়সা চালু হচ্ছে। এর ফলে মোবাইল ফোনে কথা বলার ক্ষেত্রে অফনেট ও অননেট সুবিধা থাকছে না। একই অপারেটরের নম্বরে ফোন করা হলে সেটিকে বলা হয় অননেট আর অন্য অপারেটরে ফোন করা হলে তা হয় অফনেট। সর্বোচ্চ কলরেট আগের মতোই ২ টাকা থাকবে। \r\n\r\nদেশের সব মোবাইল ফোন অপারেটরকে এই নির্দেশনা কার্যকর করতে আজ সোমবার নির্দেশনা পাঠিয়েছে বাংলাদেশ টেলিযোগাযোগ নিয়ন্ত্রণ কমিশন (বিটিআরসি)। অপারেটররাও এই নির্দেশনা কার্যকর করার প্রস্তুতি শুরু করে দিয়েছে।', 1, '2018-08-13 09:24:00', '2018-08-13 10:11:24', '2018-08-14', 0),
(2, 'Service of process', 'notices\\August2018\\NtjdYymtpOmj7XtjWS86.jpg', 'At common law, notice is the fundamental principle in service of process. In this case, the service of process puts the defendant \"on notice\" of the allegations contained within the complaint, or other such pleading. Since notice is fundamental, a court may rule a pleading defective if it does not put the defendant on notice.\r\n\r\nIn a civil case, personal jurisdiction over a defendant is obtained by service of a summons. Service can be accomplished by personal delivery of the summons or subpoena to the person or an authorized agent of the person. Service may also be made by substituted means; for example, in many jurisdictions, service of a summons can be made on a person of suitable age and discretion at the residence or place of business of the defendant. Jurisdiction over corporations can often be obtained through a government body authorized to receive such process.', 1, '2018-08-13 10:18:19', '2018-08-13 10:18:19', '2018-08-14', 0),
(3, '৪৫ পয়সা সর্বনিম্ন কলরেট চালু মধ্যরাতে', 'notices\\August2018\\aIujxzJW4S7dbHg5HlFY.png', 'afwfwefqe', 1, '2018-08-16 14:36:38', '2018-08-16 14:36:38', '2018-08-14', 1),
(4, 'Test Headline', 'notices\\August2018\\avatar-1534648626.jpg', 'Test notice', 2, '2018-08-19 03:17:06', '2018-08-19 03:17:06', '2018-08-19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('004073e6f60d3de94077a3759e9c71fdf0541b44c713b31ea8592e82ce503233eeb160d5b2e76895', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:46:39', '2018-08-13 06:46:39', '2019-08-13 12:46:39'),
('010197caa7c11874cb71a28b395d7a140aac5c2c01fe4ca16fff449df8b8fbbe63e6b210d006dd3d', 1, 1, 'MyApp', '[]', 0, '2018-08-14 11:22:06', '2018-08-14 11:22:06', '2019-08-14 17:22:06'),
('01d509872ea6ab7afe9b81d85ac778c2b88a0354816ecd21abf758a26eee77ba7c4b1f8e700d5a59', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:50:39', '2018-08-13 05:50:39', '2019-08-13 11:50:39'),
('02a6c2b78fdddf7f868a49d77ee4324a1f5be045a756b61fa4666993e3ee85ab627bb15761488748', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:44:36', '2018-08-15 12:44:36', '2019-08-15 18:44:36'),
('06b247558eefad5a6ebc3eb88b1670dd9d3e4a94fbb072cf367bd2d54dbeaae4abf72d1ad43d3f57', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:54:40', '2018-08-13 05:54:40', '2019-08-13 11:54:40'),
('072fd1c8d4d0654dce3c25c7d867762c3cfa0e38a2fdcb67a6b9c67e09c12a026bb4ba9f85ad3fd7', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:51:06', '2018-08-13 06:51:06', '2019-08-13 12:51:06'),
('07f829507fea88df3ec7a8fa3e6b8cdc102959e288b85c5b7c26f799ea5b469acff776d8ce07b971', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:47:28', '2018-08-15 11:47:28', '2019-08-15 17:47:28'),
('0b346eaf7209163e97b402e3f86ed54a9918eccd034bf1a85e73189dc659ca9c0d2c96a81d6d038d', 1, 1, 'MyApp', '[]', 0, '2018-08-15 07:21:12', '2018-08-15 07:21:12', '2019-08-15 13:21:12'),
('0b4725b13662dc47ce745679ad5d8474992f6016bbbc15a1d545bb376169a8df72c3938835c63531', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:08:35', '2018-08-15 11:08:35', '2019-08-15 17:08:35'),
('0c67f1d05b68993100b62361e6e8bd3b8ff787dd84fe585240c75f7d2a02d6a7cdcb56c5874c024e', 1, 1, 'newToken', '[]', 0, '2018-08-15 07:56:52', '2018-08-15 07:56:52', '2019-08-15 13:56:52'),
('0dad432f7303911eb1bca600804c034966c71bf1d7a856bca3b1f061f1dc2e4dc7fec11ba3d02136', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:06:48', '2018-08-15 12:06:48', '2019-08-15 18:06:48'),
('0f045c4ecb89efa939c3773a18b56c13d71011cb93118e2db33539665dbe81e0080c6a54ac8b2f01', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:45:10', '2018-08-15 12:45:10', '2019-08-15 18:45:10'),
('0f2fd42ee0528191dbdc31b005a295428482c38457030cb92029cd3ffd79d7dfa1a72f3eae535561', 1, 1, 'MyApp', '[]', 1, '2018-08-15 11:12:24', '2018-08-15 11:12:24', '2019-08-15 17:12:24'),
('146a5196d2371a73bf0b8fc0fd066eb7236a991492ba714d857cb82f87fa72a243e4913ca391dfc2', 1, 1, 'MyApp', '[]', 0, '2018-08-14 11:33:53', '2018-08-14 11:33:53', '2019-08-14 17:33:53'),
('1530fb142184a9833978ac6c61b369e7650022c67cbd6c1e7536add63cd9291e55f7875088354aec', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:42:37', '2018-08-13 06:42:37', '2019-08-13 12:42:37'),
('1abf085c6e0415fb5a90b22ff2873e71680c08ee5c42844d6a95f0716502eed248d6024d2d606d01', 1, 1, 'MyApp', '[]', 1, '2018-08-15 07:57:09', '2018-08-15 07:57:09', '2019-08-15 13:57:09'),
('1afd6ead13d90a116fc30edb78ddfad7b40e912db0cedb289daa3c055b567c9c254a550f429d8a26', 1, 1, 'MyApp', '[]', 0, '2018-08-15 14:32:24', '2018-08-15 14:32:24', '2019-08-15 20:32:24'),
('1c16b2b38e27f79934c973309e312516be48065b1ab26e5893beee995898a1000266ac637fff967e', 1, 1, 'MyApp', '[]', 1, '2018-08-15 07:54:53', '2018-08-15 07:54:53', '2019-08-15 13:54:53'),
('1d24a1a9bada1c4fe8f738531fa76bd86775c49439dbe6c89c49b39fb532e6c558aac72cb4b87acb', 1, 1, 'MyApp', '[]', 0, '2018-08-16 09:38:02', '2018-08-16 09:38:02', '2019-08-16 15:38:02'),
('1f9c76a53004e3fb31dc3df5273f509820c4cf60956be083ebe94fb2e8956d0afa7fe7536e1e29a5', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:21:08', '2018-08-15 11:21:08', '2019-08-15 17:21:08'),
('20645ff0c32e73bea97a36b954810d6549b2d31123e0023052a27e0c0fd1ca591736c657e3aed63d', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:00:04', '2018-08-13 05:00:04', '2019-08-13 11:00:04'),
('21643feaf5b4e5d2aaf3460ecfaa7c310f16449d91a46877e150eb6d837b4c1b2c9de3baef9a43c7', 1, 1, 'MyApp', '[]', 0, '2018-08-16 10:37:45', '2018-08-16 10:37:45', '2019-08-16 16:37:45'),
('263988497bc70eaab4311ee9a571c3c44e9beb216cfc6a0902b9f65305e1a0a2d6d2cb7e4991363f', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:34:46', '2018-08-13 06:34:46', '2019-08-13 12:34:46'),
('286577fef5f04e3298cf56314fd60f62c93900d8a0e011c96feebed046b7b58e63e23741884aa121', 1, 1, 'newToken', '[]', 0, '2018-08-15 07:56:06', '2018-08-15 07:56:06', '2019-08-15 13:56:06'),
('325510e6062f66e177026763008453413369dcddef7b94c8327da7cf35ddee559b0b06a570355e88', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:13:25', '2018-08-15 12:13:25', '2019-08-15 18:13:25'),
('32c063552b766f8cb8655284a1c49f95630df31af5fa4fef673e0f41d147a1867ddd3265ee356a82', 1, 1, 'newToken', '[]', 0, '2018-08-15 07:54:41', '2018-08-15 07:54:41', '2019-08-15 13:54:41'),
('3964580d01d3ec59e25a3da66b9b844b854eb1218a346ecd8c01a8a26a84c127a3e04b995ee04ebc', 1, 1, 'MyApp', '[]', 0, '2018-08-13 08:09:53', '2018-08-13 08:09:53', '2019-08-13 14:09:53'),
('3aba91f8ac5d9c7dfa7540609f40b00849ab0235c1a0c3dfd2f76d4a1294ba4325215f448d34b556', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:14:43', '2018-08-15 11:14:43', '2019-08-15 17:14:43'),
('3c2503b8fab201d14766555756e280dab40606a88b9779e3718324717e4d5e904f5562afc461cae1', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:21:16', '2018-08-15 11:21:16', '2019-08-15 17:21:16'),
('3d60c1b3e53d332e694dc55fc83e91e5061faaf9be73aa4d4d57094edd8c018756f7063482fd0f64', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:48:27', '2018-08-13 06:48:27', '2019-08-13 12:48:27'),
('3f809562293b51e80f2d0df5163f2e136845c8180f60fe6609321d5ba0e950f0d740e3b60ba20289', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:01:34', '2018-08-13 05:01:34', '2019-08-13 11:01:34'),
('48a023722ba0d7056ebcd769f3d9746606e982c7e22f3815b00fdb91c4ecd9bb8b198736e1c0f7ea', 1, 1, 'MyApp', '[]', 0, '2018-08-15 14:32:17', '2018-08-15 14:32:17', '2019-08-15 20:32:17'),
('49f3ca7c847a8652834e311f87ca22d733578ef88a6adfd67e245ac88523238c767eba8be56da0ba', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:32:47', '2018-08-15 12:32:47', '2019-08-15 18:32:47'),
('4a77ea8b72aabd6a7ba70f3f4d057c4900e62316f6d1ff6f9b4d10a5d05088086217ac0a207df2dd', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:20:29', '2018-08-15 12:20:29', '2019-08-15 18:20:29'),
('4bae69f246ba85cdf8232af3f86ad4aa54656448c37220172b3e13678e7aa6c488d0727008135cf5', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:28:20', '2018-08-13 06:28:20', '2019-08-13 12:28:20'),
('4bce80d092db821fae39f3dcece1021c08c8b519142b9cb9974b613db324dcac0b4f5810375f82f0', 1, 1, 'MyApp', '[]', 0, '2018-08-15 07:20:51', '2018-08-15 07:20:51', '2019-08-15 13:20:51'),
('4c23be854a736b4a1818207c0a2851a3fb2f366db6a98fb9a095ec19f9cc976b46dc852187bb6747', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:06:21', '2018-08-15 12:06:21', '2019-08-15 18:06:21'),
('4e6dac38000471b9ac8f71b66fbcc85d23b8a7a6745142ff387c5665d3d8560821a88b8b8f4f2300', 1, 1, 'newToken', '[]', 0, '2018-08-15 08:02:07', '2018-08-15 08:02:07', '2019-08-15 14:02:07'),
('4fa2e19c9ba41e5f8df4b9000d99ef66cd670c22567096eb41e0c24fcf7b6f951b0cebb1253863b7', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:01:28', '2018-08-13 05:01:28', '2019-08-13 11:01:28'),
('51892923485ec8bc2c6d0e33f9f211c9fc2c3979eeaa5a70258d0cdbd707d0cd75aace2ab6c98148', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:36:31', '2018-08-13 06:36:31', '2019-08-13 12:36:31'),
('53d0fe0bc21d0e0eb4cb42fb4d6ab3854dca63ad3c4e09e1cb2979868e5f3e9e0da0b5901fd7fb04', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:21:04', '2018-08-15 11:21:04', '2019-08-15 17:21:04'),
('56f773486cc9436098fa2a8a67daa2b16f008efc75e20828ca0ba285c5c05719be4637016b28bfe2', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:42:27', '2018-08-13 06:42:27', '2019-08-13 12:42:27'),
('58cdf03e0eda2551e5a32b89215216280618fc5d51d0ffa972faf6c590f9e4167966092da922e1d3', 1, 1, 'MyApp', '[]', 0, '2018-08-15 14:32:22', '2018-08-15 14:32:22', '2019-08-15 20:32:22'),
('5b2e9c448aed8604c217f09477ef41f87606d937670af44679c1d9a7d2059ce8e681e0572097b282', 2, 1, 'MyApp', '[]', 0, '2018-08-18 17:46:16', '2018-08-18 17:46:16', '2019-08-18 23:46:16'),
('5fbcf430e24ba3132f3f8c4059a7e052707e8c3712bde756dc76852801ef18128f36a4eafab408c0', 1, 1, 'MyApp', '[]', 0, '2018-08-15 07:44:34', '2018-08-15 07:44:34', '2019-08-15 13:44:34'),
('607f6b35cbaded4d4eb7561c96dffb4a7f42dbf57e942d786b05f09ecd725d1c146ee43e7a09d6bb', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:29:48', '2018-08-13 06:29:48', '2019-08-13 12:29:48'),
('60819fe2db8c2aaa1c1565345e265a8061a76385361e43dd55c50a2124619c4bd2532e3f3b508bba', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:32:37', '2018-08-13 06:32:37', '2019-08-13 12:32:37'),
('61fe3f46b419255008e74588d1bd26c729de6ee78703919c38080406796a6333b7e7d20e621bdddb', 1, 1, 'MyApp', '[]', 0, '2018-08-16 07:25:54', '2018-08-16 07:25:54', '2019-08-16 13:25:54'),
('63ee20aa1d294d5fb4d33fd3ec6dc319d36a4d15247e48fefc48621a4ecc62bad94de19340ebc72b', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:48:08', '2018-08-15 11:48:08', '2019-08-15 17:48:08'),
('647fcc73f2799ba5215dd051b06e4fd0d9a43cdf5d956f943c0f550dcc21ffb42329295ab7e7f240', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:16:28', '2018-08-15 11:16:28', '2019-08-15 17:16:28'),
('66dab59b671481298c279ea70bc029101770e92f5fdd3c6fb4727251841673e66dbf11cb759bb8ff', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:42:03', '2018-08-13 06:42:03', '2019-08-13 12:42:03'),
('67c8d729a21134d370f11931c373ded2fa33a28eb87b77caaec83197c8ad2b5a9e11236d74f69b06', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:21:19', '2018-08-15 12:21:19', '2019-08-15 18:21:19'),
('6f03caa81d7f488254adb7dd4ae06abac4fc236b71f1079fa9b904154a8a67e8d95f62f6c8c48128', 1, 1, 'MyApp', '[]', 0, '2018-08-13 01:36:22', '2018-08-13 01:36:22', '2019-08-13 07:36:22'),
('704655cb19cde58ecf1e04c856440ff4ab8fb4c7216a7b0036b4c45b241cb5a7cc632f7944333231', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:10:34', '2018-08-15 12:10:34', '2019-08-15 18:10:34'),
('70806ac5dca60c03f3c06bf89e69c0e79846f88024c194bbbc19754b294e28797c1d1c59e3909097', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:55:29', '2018-08-13 05:55:29', '2019-08-13 11:55:29'),
('715b8f94d12dc01414848a27ab349491cd0327060757d4de67e76a6a7f3fa7102359538b887d1149', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:15:18', '2018-08-15 11:15:18', '2019-08-15 17:15:18'),
('777bcf8f83107aa3665beca07f3020a9bd13ef8fda84a25705b38c18c65bfda03f0acd58d041fe04', 1, 1, 'MyApp', '[]', 0, '2018-08-16 10:37:50', '2018-08-16 10:37:50', '2019-08-16 16:37:50'),
('78941306ec0b21987f0710f591d0e9205bae63966343c909acd673e5801199f8a73fc3956db18289', 1, 1, 'MyApp', '[]', 0, '2018-08-14 03:15:56', '2018-08-14 03:15:56', '2019-08-14 09:15:56'),
('7a226c6a94fea0d6275e59b5df35196549916dbd07d7da8a8e7bf20ea6d25384ed6bd16a63ac65da', 1, 1, 'MyApp', '[]', 0, '2018-08-15 14:32:25', '2018-08-15 14:32:25', '2019-08-15 20:32:25'),
('7ad7083de2ea633575e79ef2c0bfdceb0431cb8e6aba76ca77bf612f37b5b418e1c4c8c91195ae24', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:16:59', '2018-08-15 12:16:59', '2019-08-15 18:16:59'),
('7b003a0e13b8ddffad09fe069c6b3294a7ea81e1af0c1f4f5cdf872b60e6ea93d2775a3eddbfbd0b', 1, 1, 'MyApp', '[]', 0, '2018-08-14 15:46:33', '2018-08-14 15:46:33', '2019-08-14 21:46:33'),
('7e77879ce3ebc3a2af9fac344216e48c40bc7e1a5d92a70730394d2603a987a513246f217c78d5a5', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:47:11', '2018-08-13 05:47:11', '2019-08-13 11:47:11'),
('7f6e914f7393ac78c2ef9069e0df722960f16f72f4acc5663589c54591d74ee736b113e7bfb72762', 1, 1, 'MyApp', '[]', 0, '2018-08-15 14:32:24', '2018-08-15 14:32:24', '2019-08-15 20:32:24'),
('83ded7711fccbea40938cbd4889f43789e895e3f415f4c55360113c1f42945a8912012fc5dafe610', 1, 1, 'MyApp', '[]', 0, '2018-08-13 04:12:21', '2018-08-13 04:12:21', '2019-08-13 10:12:21'),
('854036aa117a36f3daca7b5362245466d62ca9c5ad1cc85284a5b8098d3a94e1b68d0ff29df5b7c6', 1, 1, 'MyApp', '[]', 0, '2018-08-16 07:36:15', '2018-08-16 07:36:15', '2019-08-16 13:36:15'),
('8665484fa1224139ac61fb0b8f3b698a298b548692ac7097d5da9ea083db244a5f53ad40ddd77503', 2, 1, 'MyApp', '[]', 0, '2018-08-18 17:52:24', '2018-08-18 17:52:24', '2019-08-18 23:52:24'),
('884a63e8cbc6009df6e63684ac02250e54debb3e4766cbc6f62aabde4711113cf8547e7de111760d', 3, 1, 'MyApp', '[]', 0, '2018-08-15 11:28:10', '2018-08-15 11:28:10', '2019-08-15 17:28:10'),
('894cc8c3d84dec33994e9ce989d5819aff0b629dc12ffa8c2f1cf872058468cc3ef309bfee26bbd4', 1, 1, 'MyApp', '[]', 0, '2018-08-13 04:28:02', '2018-08-13 04:28:02', '2019-08-13 10:28:02'),
('89c12bba5b7eaa142f4e20b41b4373e30e397ded7cab0b809eafc78aee23feddefa37f4c490216f7', 1, 1, 'MyApp', '[]', 0, '2018-08-13 08:26:22', '2018-08-13 08:26:22', '2019-08-13 14:26:22'),
('89fe11a02afab6ab4302ba87638aa067a7e4164f67caef94c9b87e50e6b8b7790bcfacf4e9c22034', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:42:01', '2018-08-13 05:42:01', '2019-08-13 11:42:01'),
('8c3a38cb5413b3dc0e4d015506bd4ac60873785335ec0aed7919d8471883dde0ca87446e32b7d510', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:19:56', '2018-08-15 12:19:56', '2019-08-15 18:19:56'),
('8e14445a99f4e1c45ecbb08bb221aba79233626b1040ced8ad43ab817c919b17e9c98d1bc19b41ca', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:35:56', '2018-08-13 06:35:56', '2019-08-13 12:35:56'),
('90099c07258553a98e609eebea24fea70568d890be7daffe753ea5dd8ee3b50ba8957d775d86f4db', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:43:06', '2018-08-13 06:43:06', '2019-08-13 12:43:06'),
('93a8baf3caeef90e523f0dd7f6aaebfc124cf83fba3b267c6585f511d27659667e6720ac0c9c7682', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:17:19', '2018-08-15 11:17:19', '2019-08-15 17:17:19'),
('965da9152ce158a5258bec85a570a5620edaf8d7021983df10dcf3a72fadadd7e30ef7bad32d477f', 1, 1, 'MyApp', '[]', 0, '2018-08-15 14:32:21', '2018-08-15 14:32:21', '2019-08-15 20:32:21'),
('970e04a9de6eb8da15df11f266a560d6c5497512e998faab3b7cea5b42a4abd80b3afae196b61adc', 1, 1, 'MyApp', '[]', 0, '2018-08-16 09:18:45', '2018-08-16 09:18:45', '2019-08-16 15:18:45'),
('9d7008717d7a4d327ccc6294fc41103239038e1d0d27280ce9e9ceae730ec41d86a26497bd02ad36', 1, 1, 'MyApp', '[]', 0, '2018-08-18 17:42:34', '2018-08-18 17:42:34', '2019-08-18 23:42:34'),
('9ee2f594bea7df1fa4bc3309f835ebdef78187aea4961391e119828d004c66a2cbece1d3c816e8da', 1, 1, 'MyApp', '[]', 0, '2018-08-13 04:25:57', '2018-08-13 04:25:57', '2019-08-13 10:25:57'),
('a51afb1537af0ed9dfcdd0757dd69134e426634f5628e15ef8a42a12dac0b078c03c86c491c6daf6', 1, 1, 'MyApp', '[]', 0, '2018-08-15 14:50:14', '2018-08-15 14:50:14', '2019-08-15 20:50:14'),
('ac62f89ff22a8cd895c9d17b15db0a52fe3f7dea7a9fbc8fff8845c4cb263e9f5ae7dbd331429a20', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:24:16', '2018-08-13 06:24:16', '2019-08-13 12:24:16'),
('ad30d6f48725ffd1d463e890eeffa61eb8764c6b27fc828757de46ae3e8cfd6a9c7f506e8e7fe436', 2, 1, 'MyApp', '[]', 0, '2018-08-18 17:45:30', '2018-08-18 17:45:30', '2019-08-18 23:45:30'),
('ae3a28e447e28d4621bfa2c01114f92d206b7bc75adc6e1b5c0fa902cc0bc404b2bddc5c350c2506', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:50:27', '2018-08-13 05:50:27', '2019-08-13 11:50:27'),
('b0a50ff12c983bcbd1d69701c8f861cc62466d009f46659f9b98c2915ed1e9db2b51e984956cad8c', 1, 1, 'MyApp', '[]', 1, '2018-08-15 07:56:14', '2018-08-15 07:56:14', '2019-08-15 13:56:14'),
('b4b4293ae68b8342c1fad7c17fffc2cdce441525cf29846a3c2a655b45a4b0a9dd1d3587b5d971b9', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:17:27', '2018-08-15 11:17:27', '2019-08-15 17:17:27'),
('b57fc2ae43c0759350f4faa696bb1c65f3d07620a98ed49e02f463222932bdc1a0c9475979808df4', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:52:57', '2018-08-13 06:52:57', '2019-08-13 12:52:57'),
('b5ac5b3675b9ec4acd5c45e8302f7f73fb7c5bc80ef8dcd94995ece7c66b78097351a784f6fc2beb', 3, 1, 'MyApp', '[]', 0, '2018-08-15 11:28:24', '2018-08-15 11:28:24', '2019-08-15 17:28:24'),
('b60b26d7beeb91ae1646d79a53be5370d9dee6d06e06e0429c4cccd7688ab854d5d3083ed03c43d7', 1, 1, 'MyApp', '[]', 0, '2018-08-15 14:32:11', '2018-08-15 14:32:11', '2019-08-15 20:32:11'),
('b6e23b0e47ea12610f7c0180e72f555c0a09dd33c5c0692cdd0bf2ec015a8e4e71547725b77695c8', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:50:28', '2018-08-13 06:50:28', '2019-08-13 12:50:28'),
('b7b1fa4640ed6fb026be439b42a7601e075c59c5b14577f2ce44cc456693531eb454dcfac9c3f53e', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:11:37', '2018-08-15 12:11:37', '2019-08-15 18:11:37'),
('b927933d644f41da7b6e6a44aeb30dfd4b40aaf135651a74caa0ba8a7bc0b1fcea3c6c7ded7f0675', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:21:58', '2018-08-15 11:21:58', '2019-08-15 17:21:58'),
('ba0590441fa2c573d2544ee2225da2de6a61634ad5a91a7db8cb56686e360a45952c74e4ce9e37b4', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:00:23', '2018-08-13 05:00:23', '2019-08-13 11:00:23'),
('bc3e6b6e663d566c80661a7a1e2100b99cd50ce6bb7443600f48cd515b42ea0085a914d7f16991dd', 1, 1, 'MyApp', '[]', 0, '2018-08-15 14:32:04', '2018-08-15 14:32:04', '2019-08-15 20:32:04'),
('c02283817e6027091205d05057d9d16c3a5e3c2aec4c72748d2993d2fb8aed8969d0f5b96f1613bf', 1, 1, 'MyApp', '[]', 0, '2018-08-15 14:32:23', '2018-08-15 14:32:23', '2019-08-15 20:32:23'),
('c18625f523ebee2ff94d44f409cf8a132353f727af962b5907dc1074efa5ebd522740a8d2755c8ed', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:57:46', '2018-08-13 06:57:46', '2019-08-13 12:57:46'),
('c3be7db778724b5759c8366bcb0508f3b68551ccc59516b24271aa15d17c60b30c26ec8f575eb86e', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:43:53', '2018-08-13 06:43:53', '2019-08-13 12:43:53'),
('c6d405b060ce7ad3a1089427560268cda473aaaa9c41692b48db437d7be777048c095ace2229b93a', 2, 1, 'MyApp', '[]', 0, '2018-08-19 03:14:07', '2018-08-19 03:14:07', '2019-08-19 09:14:07'),
('c7599a4dddc8491e4bcafc618aacc9736a0bcf417fced5eabd870790a11da41ee5fb839ad1f02020', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:47:31', '2018-08-15 11:47:31', '2019-08-15 17:47:31'),
('d02d5de3e6c36fd5377c20093378fd9a7d0821a32bbdfa8ff95b4ae6b34289500e7e281ff16493c4', 1, 1, 'MyApp', '[]', 0, '2018-08-16 09:38:02', '2018-08-16 09:38:02', '2019-08-16 15:38:02'),
('d1d14bdbafdf346859011c0d85c3c541676a9a11104e67e1a6f7bb9b18794cbb9f584b9ec7d3fd10', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:06:20', '2018-08-15 12:06:20', '2019-08-15 18:06:20'),
('d3b86cf298e1aff3f26f4115efb3e12bb2a198f8135f7a7adc47769d0f1d56845866977c697bd8b8', 1, 1, 'MyApp', '[]', 0, '2018-08-13 04:14:58', '2018-08-13 04:14:58', '2019-08-13 10:14:58'),
('d8880d42cbbd1c074e682de1f87bea132cabd11c5ab3308fda49f7dd0a406385783aa83db2e9892a', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:10:54', '2018-08-15 12:10:54', '2019-08-15 18:10:54'),
('ddeaf54c5ac2251a86ce35fbf882f7527fad7846a5160ed45c01bfb7987539e9196b7b9928ae13e3', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:33:18', '2018-08-15 12:33:18', '2019-08-15 18:33:18'),
('e0a3c419c40be3558d8b81136e413278e4ca1ced5615b2543d917910308db8b851f28a320f374f36', 1, 1, 'MyApp', '[]', 0, '2018-08-15 09:49:57', '2018-08-15 09:49:57', '2019-08-15 15:49:57'),
('e1687fd48d29bfac25d74b2f54381693be7d2fe6bfd5adb9474b743a9e5934e016c39741ed126075', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:00:23', '2018-08-13 05:00:23', '2019-08-13 11:00:23'),
('e17885e0b82ae390324baafeedef27f27a5cdc7a930eaa55085cd7b14e7661758148d4da2251adb9', 1, 1, 'MyApp', '[]', 1, '2018-08-13 05:56:05', '2018-08-13 05:56:05', '2019-08-13 11:56:05'),
('e43f8f784717981fbc3c4eb8d61c8a0748167d8027745a63e1202a0029d7e69fa08e3086beea9cbf', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:47:54', '2018-08-13 05:47:54', '2019-08-13 11:47:54'),
('e59ccdada74b7d44267ef1c37e99620f1bc8c6bdb877500a7fd0d144c8d103e9a8630a7d4415a974', 1, 1, 'MyApp', '[]', 0, '2018-08-15 14:32:26', '2018-08-15 14:32:26', '2019-08-15 20:32:26'),
('ea2e73bee329fd1207d4298d3bac046079f3638f624735824089c19f9903cdf3aca2e09016641bb0', 1, 1, 'MyApp', '[]', 1, '2018-08-13 04:29:25', '2018-08-13 04:29:25', '2019-08-13 10:29:25'),
('ebc2737e34825afe7b706b9854d7426732a6b6a5ba6753352c67c3ec6d4c7d1a1b3c5c19f2521ac7', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:10:54', '2018-08-15 11:10:54', '2019-08-15 17:10:54'),
('f50da383608b875807da988c80798102da5a9de6d21511f0def34ea1c5d83563e964f1dad9077e4d', 1, 1, 'MyApp', '[]', 0, '2018-08-13 05:00:04', '2018-08-13 05:00:04', '2019-08-13 11:00:04'),
('f60670fdf681ebf6ccb80d31306eb38710e220ae030eda800a9cf370152b3dc897335b8b9347abc4', 1, 1, 'MyApp', '[]', 0, '2018-08-15 12:43:53', '2018-08-15 12:43:53', '2019-08-15 18:43:53'),
('f78889cf7405deb11a9106fd3fc804eb60e4a58e8898fdb1a14fc8ede58866bbfc60c8101e142e44', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:10:07', '2018-08-15 11:10:07', '2019-08-15 17:10:07'),
('faced25746d9e60d8291593e52c888349b1556214b6937470ecfd71c8238203064e286c68fd44710', 1, 1, 'MyApp', '[]', 0, '2018-08-15 11:15:19', '2018-08-15 11:15:19', '2019-08-15 17:15:19'),
('fb1ebfdf5c1a4037491223b4f0da34e450821fa3ab85fda30ea4944c140d0128d92457927c2cad9f', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:42:16', '2018-08-13 06:42:16', '2019-08-13 12:42:16'),
('fbe3d090a573e579264c541b34f928791cabad12d3360a79696f1602f17aac1cde594b8f1282e013', 1, 1, 'MyApp', '[]', 0, '2018-08-13 06:28:35', '2018-08-13 06:28:35', '2019-08-13 12:28:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'KFFZuSJ3YAobtQsQRxDIMMmMKNTKv4Azp43VN4ag', 'http://localhost', 1, 0, 0, '2018-08-13 01:28:52', '2018-08-13 01:28:52'),
(2, NULL, 'Laravel Password Grant Client', 'EtwlnIuWwmMihMwo55FdM8ghIieqz0HGcqSoIyPr', 'http://localhost', 0, 1, 0, '2018-08-13 01:28:52', '2018-08-13 01:28:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-08-13 01:28:52', '2018-08-13 01:28:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('nibir2k12@live.com', '$2y$10$lwmxlyLTem/zV2mIEROxZeDZN5d3dfItyUnhao6ju45Pzg1Bd7lBG', '2018-08-15 09:35:19'),
('nibir2k12@gmail.com', '$2y$10$gfYwqmNRx/pRsWCTIlrhEuJO8glPaOX/DUVbKrcgHrhOYLhpHDpii', '2018-08-15 09:50:58'),
('safallwa@gmail.com', '$2y$10$1K9XHQZfnKVt8mzaAS5dhOMOlXZ2U0iP8IYGgBPA3RtGRkUEqSAzC', '2018-08-16 07:33:22'),
('nibir2k12@yahoo.com', '$2y$10$qM1Bk/90RVYFbjtX9UK42e8wzZmUhKAXq6at7x0voVG7nggEaaSGe', '2018-08-16 08:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(2, 'browse_bread', NULL, '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(3, 'browse_database', NULL, '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(4, 'browse_media', NULL, '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(5, 'browse_compass', NULL, '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(6, 'browse_menus', 'menus', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(7, 'read_menus', 'menus', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(8, 'edit_menus', 'menus', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(9, 'add_menus', 'menus', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(10, 'delete_menus', 'menus', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(11, 'browse_roles', 'roles', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(12, 'read_roles', 'roles', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(13, 'edit_roles', 'roles', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(14, 'add_roles', 'roles', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(15, 'delete_roles', 'roles', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(16, 'browse_users', 'users', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(17, 'read_users', 'users', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(18, 'edit_users', 'users', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(19, 'add_users', 'users', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(20, 'delete_users', 'users', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(21, 'browse_settings', 'settings', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(22, 'read_settings', 'settings', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(23, 'edit_settings', 'settings', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(24, 'add_settings', 'settings', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(25, 'delete_settings', 'settings', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(26, 'browse_hooks', NULL, '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(27, 'browse_albums', 'albums', '2018-08-13 06:31:15', '2018-08-13 06:31:15'),
(28, 'read_albums', 'albums', '2018-08-13 06:31:15', '2018-08-13 06:31:15'),
(29, 'edit_albums', 'albums', '2018-08-13 06:31:15', '2018-08-13 06:31:15'),
(30, 'add_albums', 'albums', '2018-08-13 06:31:15', '2018-08-13 06:31:15'),
(31, 'delete_albums', 'albums', '2018-08-13 06:31:15', '2018-08-13 06:31:15'),
(32, 'browse_photos', 'photos', '2018-08-13 06:33:03', '2018-08-13 06:33:03'),
(33, 'read_photos', 'photos', '2018-08-13 06:33:03', '2018-08-13 06:33:03'),
(34, 'edit_photos', 'photos', '2018-08-13 06:33:03', '2018-08-13 06:33:03'),
(35, 'add_photos', 'photos', '2018-08-13 06:33:03', '2018-08-13 06:33:03'),
(36, 'delete_photos', 'photos', '2018-08-13 06:33:03', '2018-08-13 06:33:03'),
(37, 'browse_userdetails', 'userdetails', '2018-08-13 07:14:21', '2018-08-13 07:14:21'),
(38, 'read_userdetails', 'userdetails', '2018-08-13 07:14:21', '2018-08-13 07:14:21'),
(39, 'edit_userdetails', 'userdetails', '2018-08-13 07:14:21', '2018-08-13 07:14:21'),
(40, 'add_userdetails', 'userdetails', '2018-08-13 07:14:21', '2018-08-13 07:14:21'),
(41, 'delete_userdetails', 'userdetails', '2018-08-13 07:14:21', '2018-08-13 07:14:21'),
(42, 'browse_notices', 'notices', '2018-08-13 09:11:47', '2018-08-13 09:11:47'),
(43, 'read_notices', 'notices', '2018-08-13 09:11:47', '2018-08-13 09:11:47'),
(44, 'edit_notices', 'notices', '2018-08-13 09:11:47', '2018-08-13 09:11:47'),
(45, 'add_notices', 'notices', '2018-08-13 09:11:47', '2018-08-13 09:11:47'),
(46, 'delete_notices', 'notices', '2018-08-13 09:11:47', '2018-08-13 09:11:47'),
(47, 'browse_transactions', 'transactions', '2018-08-14 10:40:43', '2018-08-14 10:40:43'),
(48, 'read_transactions', 'transactions', '2018-08-14 10:40:43', '2018-08-14 10:40:43'),
(49, 'edit_transactions', 'transactions', '2018-08-14 10:40:43', '2018-08-14 10:40:43'),
(50, 'add_transactions', 'transactions', '2018-08-14 10:40:43', '2018-08-14 10:40:43'),
(51, 'delete_transactions', 'transactions', '2018-08-14 10:40:43', '2018-08-14 10:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1);

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(750) COLLATE utf8mb4_unicode_ci NOT NULL,
  `album_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `photo`, `album_id`, `created_at`, `updated_at`, `title`) VALUES
(11, 'photos\\August2018\\UtLwSzx3YCTITwkcPjCk.jpg', 1, '2018-08-16 10:46:50', '2018-08-16 10:46:50', 'Annual Feast 2016'),
(12, 'photos\\August2018\\7tdT5KF9eQ1dwaeP0Z02.jpg', 1, '2018-08-16 10:48:43', '2018-08-16 10:48:43', 'Statue of Durbar Bangla KUET'),
(13, 'photos\\August2018\\GpK3DuBbg6YHUJaoE4X7.jpg', 1, '2018-08-16 10:49:13', '2018-08-16 10:49:13', 'Padma Pond KUET'),
(14, 'photos\\August2018\\yL7nZPBX4n34D7F1n3fG.png', 1, '2018-08-16 10:51:36', '2018-08-16 10:51:36', 'FH HAll Kuet'),
(15, 'photos\\August2018\\5ReKz4BBpFCGGvHkX04Y.jpg', 2, '2018-08-16 10:54:37', '2018-08-16 10:54:37', 'KUET 1st day of bengali new year'),
(16, 'photos\\August2018\\veufofYKAkEamz9jIOAQ.jpg', 2, '2018-08-16 10:55:06', '2018-08-16 10:55:06', 'Normal Photo'),
(17, 'photos\\August2018\\3zHpPHuEZFiJCEIa9DBT.jpg', 2, '2018-08-16 10:56:20', '2018-08-16 10:56:20', 'Rally of pohela boishakh');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2018-08-13 01:23:43', '2018-08-13 01:23:43'),
(2, 'user', 'Normal User', '2018-08-13 01:23:43', '2018-08-13 01:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'RIMO', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'RIMO', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `transaction_no` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `type`, `amount`, `remark`, `transaction_no`, `date`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Debit', 1500.33, 'At common law, notice is the fundamental principle in service of process. In this case, the service of process puts the defendant \"on notice\" of the allegations contained within the complaint At common law, notice is the fundamental principle in service of process. In this case, the service of process puts the defendant \"on notice\" of the allegations contained within the complaint At common law, notice is the fundamental principle in service of process. In this case, the service of process puts the defendant \"on notice\" of the allegations contained within the complaint At common law, notice is the fundamental principle in service of process. In this case, the service of process puts the defendant \"on notice\" of the allegations contained within the complaint', '5csidof222223', '2018-08-14', '2018-08-14 10:45:00', '2018-08-14 13:49:14', 1),
(2, 'Credit', 200, 'haha', '5csidof222223', '2018-08-14', '2018-08-14 12:18:07', '2018-08-14 12:18:07', 1),
(3, 'Debit', 500, 'haha', '5csidof222223', '2018-08-15', '2018-08-14 12:18:36', '2018-08-14 12:18:36', 1),
(4, 'Debit', 100, 'haha', '5csidof222223', '2018-02-07', '2018-08-14 13:09:02', '2018-08-14 13:09:02', 1),
(5, 'Debit', 50.55, 'haha', '5csidof222223', '2018-08-13', '2018-08-14 13:13:00', '2018-08-14 13:20:11', 1),
(6, 'Debit', 50, 'test remark', '+46wr4fw4g9w64gw69g4', '2018-08-19', '2018-08-19 03:30:01', '2018-08-19 03:30:01', 2);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `id` int(10) UNSIGNED NOT NULL,
  `cadet_no` int(11) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `house` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profession` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`id`, `cadet_no`, `address`, `house`, `profession`, `user_id`, `created_at`, `updated_at`, `phone`, `dob`) VALUES
(1, 1512, 'Basila City, Block-B, Road-2, Mohammadpur, Dhaka-1207, Bangladesh', 'Surma', 'Engineer', 1, '2018-08-13 07:25:00', '2018-08-15 09:03:09', '01758382836', '2018-08-13'),
(2, 1511, 'Basila City, Block-B, Road-2, Mohammadpur, Dhaka-1207', 'Surma', 'Doctor', 2, '2018-08-13 07:26:00', '2018-08-15 08:40:57', '01758382828', '2002-01-29'),
(3, 2511, 'Basila City, Block-B, Road-2, Mohammadpur, Dhaka-1207, Bangladesh\r\nMalatinagar Matir Mosque Len, Bogra-5800, Bangladesh', 'Shahjalal', 'Doctor', 3, '2018-08-16 10:42:53', '2018-08-16 10:42:53', '01758382828', '1993-11-10'),
(4, 5658, 'Basila City, Block-B, Road-2, Mohammadpur, Dhaka-1207, Bangladesh\r\nMalatinagar Matir Mosque Len, Bogra-5800, Bangladesh', 'Shahjalal', 'Doctor', 4, '2018-08-16 10:43:00', '2018-08-16 10:43:40', '01758382828', '2002-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Foyal Nibir', 'safallwa@gmail.com', 'users\\August2018\\avatar-1534409413.jpg', '$2y$10$dFbi4oOMwHEv835Qr/v0leu8uR3LuupGjeGC9PKLB9XJ7mA5B4exe', 'ikwPRLe5kTUBQDj8c69rFuaUceeM4jPdpyWnAk04h8Cn6v1i5iJl8TeIRH6a', '{\"locale\":\"en\"}', '2018-08-13 01:24:31', '2018-08-16 08:50:13'),
(2, 1, 'Jahan', 'safallwa11@gmail.com', 'users\\August2018\\97OMcko5CxplzSferEVJ.jpg', '$2y$10$PpG.aSzTNydp.ZjOcJNSveceuXyo2FZHrsidpTq.2vYx1k8G4xtRq', NULL, '{\"locale\":\"en\"}', '2018-08-13 04:33:58', '2018-08-16 10:41:02'),
(3, 2, 'Nibir', 'foysal@gmail.com', 'users\\August2018\\cHBauzNTS4EoxWHVmSxT.jpg', '$2y$10$afxhQrEsAob1BFmx8fr73uixVhmTNMk40X51lBMZe7i0mNPncol9O', '1vAPh7J6otMmkuetLFv8WRBc7oFJr7bQZD6ZueE9sQLEn3WVStzVow441HyP', '{\"locale\":\"en\"}', '2018-08-13 04:35:05', '2018-08-16 10:39:53'),
(4, 1, 'Foysal Ahmed Nibir', 'nibir2k12@yahoo.com', 'users\\August2018\\yfnJI8GIfZhdNXfxJ7zr.jpg', '$2y$10$YlmHcdqXZG5z5quYsVTUMuq44BnzjTLInrh5DA6iYaCqJ6l5dKEpq', NULL, '{\"locale\":\"en\"}', '2018-08-13 04:35:33', '2018-08-16 10:39:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 1),
(3, 2),
(4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userdetails_cadet_no_unique` (`cadet_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
