-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2024 at 02:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lfa`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add blog post', 7, 'add_blogpost'),
(26, 'Can change blog post', 7, 'change_blogpost'),
(27, 'Can delete blog post', 7, 'delete_blogpost'),
(28, 'Can view blog post', 7, 'view_blogpost'),
(29, 'Can add portfolio item', 8, 'add_portfolioitem'),
(30, 'Can change portfolio item', 8, 'change_portfolioitem'),
(31, 'Can delete portfolio item', 8, 'delete_portfolioitem'),
(32, 'Can view portfolio item', 8, 'view_portfolioitem'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add service', 10, 'add_service'),
(38, 'Can change service', 10, 'change_service'),
(39, 'Can delete service', 10, 'delete_service'),
(40, 'Can view service', 10, 'view_service');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$IOHllmj1twfHzslWsEVNCT$9dWNh2k2oRahNPBeFJG7P7SLDorBf5M3K+qKcn0njJk=', '2024-09-12 02:51:01.627309', 1, 'admin', '', '', '', 1, 1, '2024-09-12 02:50:52.635613');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-09-12 02:51:20.037802', '1', 'Teardrop Wind Flag (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(2, '2024-09-12 03:42:37.932036', '2', 'Bow Wind Flag (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(3, '2024-09-12 08:23:07.031226', '3', 'Fabric Flag (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(4, '2024-09-12 08:23:21.511587', '4', 'Air Dancer Tube (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(5, '2024-09-12 08:23:44.069289', '5', 'Tension Fabric Wall (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(6, '2024-09-12 08:28:01.123800', '6', 'Outdoor Pop-Up Frame (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(7, '2024-09-14 00:53:19.659644', '7', 'Fabric Banner Stand (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(8, '2024-09-14 00:53:39.554378', '8', 'Speedy Counter (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(9, '2024-09-14 00:53:55.348249', '9', 'Display Tex (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(10, '2024-09-14 00:54:11.949192', '10', 'Super Twill (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(11, '2024-09-14 00:54:32.223779', '11', 'Voile (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(12, '2024-09-14 00:54:47.125896', '12', 'Ponge (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(13, '2024-09-14 00:57:48.203492', '13', 'Table Cloth (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(14, '2024-09-14 00:58:03.298757', '14', 'Chair Cover (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(15, '2024-09-14 00:58:19.265167', '15', 'Blockout Fabric (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(16, '2024-09-14 00:58:44.152907', '16', 'Roof (Tent)', 1, '[{\"added\": {}}]', 9, 1),
(17, '2024-09-14 00:58:58.436343', '17', 'Roof + Back (Tent)', 1, '[{\"added\": {}}]', 9, 1),
(18, '2024-09-14 00:59:42.255090', '18', 'Roof + Back + Side Half Panel (Tent)', 1, '[{\"added\": {}}]', 9, 1),
(19, '2024-09-14 00:59:55.258676', '19', 'Roof + Back + Full Side Panel (Tent)', 1, '[{\"added\": {}}]', 9, 1),
(20, '2024-09-14 01:01:14.325297', '20', 'Mastercast (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(21, '2024-09-14 01:01:36.523366', '21', 'White (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(22, '2024-09-14 01:01:56.612197', '22', 'Polymetric (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(23, '2024-09-14 01:02:25.356134', '23', 'Hi-Tac (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(24, '2024-09-14 01:02:42.266165', '24', 'Front Adhesive (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(25, '2024-09-14 01:02:58.513264', '25', 'Clear (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(26, '2024-09-14 01:03:12.201764', '26', 'Frosted (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(27, '2024-09-14 01:03:33.148368', '27', 'One Way Vision (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(28, '2024-09-14 01:04:04.832112', '29', 'General Sticker (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(29, '2024-09-14 01:04:35.334055', '28', 'One Way Vision (General Sticker)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Name\", \"Description\", \"Features\"]}}]', 9, 1),
(30, '2024-09-14 01:05:20.370758', '28', 'Static Cling (General Sticker)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Name\"]}}]', 9, 1),
(31, '2024-09-14 01:06:47.857921', '27', 'One Way Vision (General Sticker)', 2, '[{\"changed\": {\"fields\": [\"Productid\"]}}]', 9, 1),
(32, '2024-09-14 01:07:15.747496', '29', 'White Ink (General Sticker)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Name\", \"Description\", \"Features\"]}}]', 9, 1),
(33, '2024-09-14 01:07:37.585279', '30', 'Light Box (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(34, '2024-09-14 01:07:58.281188', '31', 'Floor Sticker (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(35, '2024-09-14 01:08:15.379753', '32', 'Wall Sticker (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(36, '2024-09-14 01:08:29.803460', '33', 'Vehicle Wrapping (General Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(37, '2024-09-14 01:08:52.531979', '34', 'Letter Cutting (Computer Die-Cut Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(38, '2024-09-14 01:09:15.878463', '35', 'Magnetic (Computer Die-Cut Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(39, '2024-09-14 01:09:29.848228', '36', 'Label (Computer Die-Cut Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(40, '2024-09-14 01:09:59.217944', '37', 'Backdrop (Computer Die-Cut Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(41, '2024-09-14 01:10:14.704613', '38', 'Window (Computer Die-Cut Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(42, '2024-09-14 01:10:37.131936', '39', 'Pops & Photo Frame (Computer Die-Cut Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(43, '2024-09-14 01:11:08.004044', '40', 'Promotional Table (Computer Die-Cut Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(44, '2024-09-14 01:11:50.505257', '41', 'Main-Shaped Standee (Computer Die-Cut Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(45, '2024-09-14 01:12:06.115491', '42', 'Lucky Draw Box (Computer Die-Cut Sticker)', 1, '[{\"added\": {}}]', 9, 1),
(46, '2024-09-14 01:12:35.808470', '43', 'Foam Eco (Mounting Box)', 1, '[{\"added\": {}}]', 9, 1),
(47, '2024-09-14 01:13:00.493020', '44', 'Foam Rigit (Mounting Box)', 1, '[{\"added\": {}}]', 9, 1),
(48, '2024-09-14 01:13:22.194014', '45', 'PP Hollow (Mounting Box)', 1, '[{\"added\": {}}]', 9, 1),
(49, '2024-09-14 01:13:44.090286', '46', 'PVC Board (Mounting Box)', 1, '[{\"added\": {}}]', 9, 1),
(50, '2024-09-14 01:14:00.687401', '47', 'Cardboard Stand (Mounting Box)', 1, '[{\"added\": {}}]', 9, 1),
(51, '2024-09-14 01:14:16.589642', '48', 'Tripod Display (Mounting Box)', 1, '[{\"added\": {}}]', 9, 1),
(52, '2024-09-14 01:14:39.648701', '49', 'Man-Shaped Standee (Mounting Box)', 1, '[{\"added\": {}}]', 9, 1),
(53, '2024-09-14 01:14:57.845733', '50', 'Roll-Up Banner (Display System)', 1, '[{\"added\": {}}]', 9, 1),
(54, '2024-09-14 01:15:17.308219', '51', 'X Frame (Display System)', 1, '[{\"added\": {}}]', 9, 1),
(55, '2024-09-14 01:15:41.428988', '52', 'T Stand (Display System)', 1, '[{\"added\": {}}]', 9, 1),
(56, '2024-09-14 01:16:37.841894', '53', 'Handheld Board (Display System)', 1, '[{\"added\": {}}]', 9, 1),
(57, '2024-09-14 01:16:55.343639', '54', 'Promotional Table (Display System)', 1, '[{\"added\": {}}]', 9, 1),
(58, '2024-09-14 01:17:26.181919', '55', 'Door Stand (Display System)', 1, '[{\"added\": {}}]', 9, 1),
(59, '2024-09-14 01:18:14.950002', '56', 'Bunting (Fabric)', 1, '[{\"added\": {}}]', 9, 1),
(60, '2024-09-14 01:19:04.531446', '57', 'Signboard (Display System)', 1, '[{\"added\": {}}]', 9, 1),
(61, '2024-09-14 01:19:22.988252', '58', 'Indoor Poster (Poster & Lightbox)', 1, '[{\"added\": {}}]', 9, 1),
(62, '2024-09-14 01:19:43.994689', '59', 'Outdoor Poster (Poster & Lightbox)', 1, '[{\"added\": {}}]', 9, 1),
(63, '2024-09-14 01:20:08.011266', '60', 'Light Box Film (Poster & Lightbox)', 1, '[{\"added\": {}}]', 9, 1),
(64, '2024-09-14 01:20:24.048301', '61', 'Light Box Banner (Poster & Lightbox)', 1, '[{\"added\": {}}]', 9, 1),
(65, '2024-09-14 01:20:40.058465', '62', 'Portable (Backdrop)', 1, '[{\"added\": {}}]', 9, 1),
(66, '2024-09-14 01:20:58.403086', '63', 'Fabric Wall (Backdrop)', 1, '[{\"added\": {}}]', 9, 1),
(67, '2024-09-14 01:21:32.805825', '64', 'Traditional Wall Unit (Backdrop)', 1, '[{\"added\": {}}]', 9, 1),
(68, '2024-09-14 01:41:05.961381', '1', 'Signboard - Tribal Taste', 1, '[{\"added\": {}}]', 8, 1),
(69, '2024-09-14 01:41:17.356217', '2', 'BOSS Beauty & Nail Signboard', 1, '[{\"added\": {}}]', 8, 1),
(70, '2024-09-14 01:41:28.877528', '3', 'Greet Lounge 3D Wall Sticker', 1, '[{\"added\": {}}]', 8, 1),
(71, '2024-09-14 01:41:38.196276', '4', 'Amazing Things Happen Here Transparent LED Poster Frame', 1, '[{\"added\": {}}]', 8, 1),
(72, '2024-09-14 01:41:49.799614', '5', 'Teamwork Die Cut Letter Wall Sticker', 1, '[{\"added\": {}}]', 8, 1),
(73, '2024-09-14 01:42:00.115877', '6', 'Rubina HW (Kuching) SDN BHD 3D Die Cut Signboard', 1, '[{\"added\": {}}]', 8, 1),
(74, '2024-09-14 01:42:10.378125', '7', 'Dutch Lady Lightbox', 1, '[{\"added\": {}}]', 8, 1),
(75, '2024-09-14 01:42:22.997955', '8', '#RWMF2022 Letter Signboard', 1, '[{\"added\": {}}]', 8, 1),
(76, '2024-09-14 01:42:34.425223', '9', 'dji Lightbox', 1, '[{\"added\": {}}]', 8, 1),
(77, '2024-09-14 01:42:44.492748', '10', 'Karuna Lightbox Signboard', 1, '[{\"added\": {}}]', 8, 1),
(78, '2024-09-14 01:42:54.465267', '11', 'NAIM 3D Lightbox', 1, '[{\"added\": {}}]', 8, 1),
(79, '2024-09-14 01:43:05.029562', '12', 'ZOSO MUSIC Signboard', 1, '[{\"added\": {}}]', 8, 1),
(80, '2024-09-14 01:43:16.339830', '13', 'bekertilly 3D Die Cut Letter Wall Sticker', 1, '[{\"added\": {}}]', 8, 1),
(81, '2024-09-14 01:43:28.124397', '14', 'Public Parking Signboard', 1, '[{\"added\": {}}]', 8, 1),
(82, '2024-09-14 01:43:38.085243', '15', 'DUBS Carpark Notice Board', 1, '[{\"added\": {}}]', 8, 1),
(83, '2024-09-14 01:43:48.516114', '16', 'DUBS Carpark Please Pay Here Signboard', 1, '[{\"added\": {}}]', 8, 1),
(84, '2024-09-14 01:44:02.102052', '17', 'Battle of the Barbell 2024 Fabric Portable Banner', 1, '[{\"added\": {}}]', 8, 1),
(85, '2024-09-14 01:44:13.004666', '18', 'Insta360 Lightbox', 1, '[{\"added\": {}}]', 8, 1),
(86, '2024-09-23 02:34:40.396599', '1', 'Teardrop Wind Flag (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(87, '2024-09-23 02:34:48.169340', '2', 'Bow Wind Flag (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(88, '2024-09-23 02:34:55.789966', '3', 'Fabric Flag (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(89, '2024-09-23 02:48:42.761999', '4', 'Air Dancer Tube (Fabric)', 3, '', 9, 1),
(90, '2024-09-23 02:54:08.856843', '5', 'Tension Fabric Wall (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(91, '2024-09-23 02:58:32.136958', '6', 'Outdoor Pop-Up Frame (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(92, '2024-09-23 03:05:32.707029', '7', 'Fabric Banner Stand (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(93, '2024-09-23 03:30:51.307936', '8', 'Speedy Counter (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(94, '2024-09-23 03:54:54.337864', '9', 'Display Tex (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(95, '2024-09-23 05:02:53.744289', '13', 'Table Cloth (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(96, '2024-09-23 05:08:31.053711', '14', 'Chair Cover (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(97, '2024-09-23 05:22:45.329126', '56', 'Bunting (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(98, '2024-09-23 05:33:45.702028', '17', 'Roof + Back (Tent)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(99, '2024-09-23 05:34:03.013418', '16', 'Roof (Tent)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(100, '2024-09-23 05:38:44.184149', '18', 'Roof + Back + Side Half Panel (Tent)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(101, '2024-09-23 05:38:51.109614', '19', 'Roof + Back + Full Side Panel (Tent)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(102, '2024-09-23 06:49:09.817642', '62', 'Portable (Backdrop)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(103, '2024-09-23 06:57:26.697432', '63', 'Fabric Wall (Backdrop)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(104, '2024-09-23 07:10:53.202262', '64', 'Traditional Wall Unit (Backdrop)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(105, '2024-09-23 07:29:35.014449', '64', 'Traditional Wall Unit (Backdrop)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(106, '2024-09-23 07:29:48.472652', '61', 'Light Box Banner (Poster & Lightbox)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(107, '2024-09-23 07:30:00.750287', '59', 'Outdoor Poster (Poster & Lightbox)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(108, '2024-09-23 07:30:16.552363', '62', 'Portable (Backdrop)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(109, '2024-09-23 07:30:57.710505', '58', 'Indoor Poster (Poster & Lightbox)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(110, '2024-09-23 07:31:09.207382', '59', 'Outdoor Poster (Poster & Lightbox)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(111, '2024-09-23 07:31:37.128811', '60', 'Light Box Film (Poster & Lightbox)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(112, '2024-09-23 07:32:01.903816', '61', 'Light Box Banner (Poster & Lightbox)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(113, '2024-09-23 07:45:11.573229', '50', 'Roll-Up Banner (Display System)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(114, '2024-09-23 07:50:44.102628', '51', 'X Frame (Display System)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(115, '2024-09-23 07:56:26.772499', '52', 'T Stand (Display System)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(116, '2024-09-23 08:06:47.645789', '53', 'Handheld Board (Display System)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(117, '2024-09-23 08:10:38.153255', '54', 'Promotional Table (Display System)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(118, '2024-09-23 08:18:12.338138', '55', 'Door Stand (Display System)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(119, '2024-09-23 08:32:02.628467', '57', 'Signboard (Display System)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(120, '2024-09-24 00:36:31.153315', '10', 'Super Twill (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(121, '2024-09-24 00:39:44.077482', '11', 'Voile (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(122, '2024-09-24 00:44:50.228651', '12', 'Ponge (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1),
(123, '2024-09-24 00:50:41.652200', '15', 'Blockout Fabric (Fabric)', 2, '[{\"changed\": {\"fields\": [\"Productid\", \"Image\"]}}]', 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'main', 'blogpost'),
(8, 'main', 'portfolioitem'),
(9, 'main', 'product'),
(10, 'main', 'service'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-09-12 02:49:27.275170'),
(2, 'auth', '0001_initial', '2024-09-12 02:49:27.993929'),
(3, 'admin', '0001_initial', '2024-09-12 02:49:28.181433'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-09-12 02:49:28.181433'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-09-12 02:49:28.212669'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-09-12 02:49:28.290795'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-09-12 02:49:28.353299'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-09-12 02:49:28.384548'),
(9, 'auth', '0004_alter_user_username_opts', '2024-09-12 02:49:28.384548'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-09-12 02:49:28.447049'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-09-12 02:49:28.447049'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-09-12 02:49:28.447049'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-09-12 02:49:28.478346'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-09-12 02:49:28.493920'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-09-12 02:49:28.525177'),
(16, 'auth', '0011_update_proxy_permissions', '2024-09-12 02:49:28.525177'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-09-12 02:49:28.525177'),
(18, 'main', '0001_initial', '2024-09-12 02:49:28.603297'),
(19, 'main', '0002_product_is_featured', '2024-09-12 02:49:28.634557'),
(20, 'main', '0003_alter_product_category', '2024-09-12 02:49:28.634557'),
(21, 'main', '0004_product_features', '2024-09-12 02:49:28.650173'),
(22, 'main', '0005_alter_product_image', '2024-09-12 02:49:28.681428'),
(23, 'sessions', '0001_initial', '2024-09-12 02:49:28.712670');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('70nkqib7pjm5rogb7ml4j8pzggy2v0ut', '.eJxVjMsOwiAQRf-FtSEMLY-6dO83EIZhpGogKe3K-O_apAvd3nPOfYkQt7WEreclzCTOAsTpd8OYHrnugO6x3ppMra7LjHJX5EG7vDbKz8vh_h2U2Mu3ttaZRKQZwA7Oo1eAJqXoQKE1ZjATj5zRodKQ_aSJIitPyKyBxsGJ9wfaWDf_:1soZvB:tV_-Ybt6WbvEBJ1bSHp-CHOEK7nF4P9sRIOTO1qvelQ', '2024-09-26 02:51:01.630309');

-- --------------------------------------------------------

--
-- Table structure for table `main_blogpost`
--

CREATE TABLE `main_blogpost` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `publish_date` datetime(6) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_portfolioitem`
--

CREATE TABLE `main_portfolioitem` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_portfolioitem`
--

INSERT INTO `main_portfolioitem` (`id`, `title`, `description`, `image`) VALUES
(1, 'Signboard - Tribal Taste', 'A striking and culturally inspired signboard designed to capture the essence of tribal art. This signboard features intricate patterns and vibrant colors, making it a focal point for any establishment that celebrates indigenous or ethnic cuisine.', 'portfolio/lfa1.png'),
(2, 'BOSS Beauty & Nail Signboard', 'An elegant and stylish signboard for beauty salons and nail studios. Featuring a sleek design with a modern touch, it’s crafted to highlight the luxury and sophistication of the BOSS Beauty & Nail brand.', 'portfolio/lfa2.png'),
(3, 'Greet Lounge 3D Wall Sticker', 'Add a dynamic and welcoming touch to your space with this 3D wall sticker. Featuring a stylish and contemporary design, it creates a sense of depth and dimension, perfect for enhancing the ambiance of a lounge or social area.', 'portfolio/lfa3.png'),
(4, 'Amazing Things Happen Here Transparent LED Poster Frame', 'A modern and eye-catching LED poster frame with a transparent design that illuminates your posters. Ideal for showcasing events or promotions, it provides a vibrant glow that makes any message stand out.', 'portfolio/lfa4.png'),
(5, 'Teamwork Die Cut Letter Wall Sticker', 'A motivational wall sticker featuring die-cut letters that spell out “Teamwork.” This design emphasizes collaboration and unity, making it perfect for office spaces, team rooms, or any environment where teamwork is key.', 'portfolio/lfa5.png'),
(6, 'Rubina HW (Kuching) SDN BHD 3D Die Cut Signboard', 'A sophisticated 3D die-cut signboard showcasing the Rubina HW (Kuching) SDN BHD logo. Its dimensional design adds depth and prominence, ideal for corporate or commercial spaces.', 'portfolio/lfa6.png'),
(7, 'Dutch Lady Lightbox', 'A high-impact lightbox featuring the Dutch Lady brand. With its illuminated design, this lightbox ensures that the Dutch Lady logo and messaging are prominently displayed, drawing attention in any retail or promotional setting.', 'portfolio/lfa7.png'),
(8, '#RWMF2022 Letter Signboard', 'A bold and vibrant signboard celebrating the #RWMF2022 event. Perfect for festivals or special occasions, this signboard captures the spirit of the event with its eye-catching design and celebratory flair.', 'portfolio/lfa8.png'),
(9, 'dji Lightbox', 'A sleek and modern lightbox showcasing the dji logo. This illuminated display enhances brand visibility and is ideal for retail spaces or events where showcasing high-tech equipment or services is key.', 'portfolio/lfa9.png'),
(10, 'Karuna Lightbox Signboard', 'A stylish lightbox signboard featuring the Karuna brand. With its bright, backlit design, it effectively highlights the brand name and logo, making it an attractive addition to any storefront or business.', 'portfolio/lfa10.png'),
(11, 'NAIM 3D Lightbox', 'A sophisticated 3D lightbox signboard for NAIM, designed to provide a striking visual impact. The combination of 3D elements and illumination ensures that the NAIM logo stands out, making it perfect for corporate or commercial displays.', 'portfolio/lfa11.png'),
(12, 'ZOSO MUSIC Signboard', 'A vibrant and engaging signboard for ZOSO MUSIC. Featuring a bold design that captures the essence of music, this signboard is ideal for music venues, studios, or promotional events.', 'portfolio/lfa12.png'),
(13, 'bekertilly 3D Die Cut Letter Wall Sticker', 'A creative and eye-catching die-cut letter wall sticker for bekertilly. Its 3D design adds depth and texture to the wall, making it a distinctive feature for branding or decorative purposes.', 'portfolio/lfa13.png'),
(14, 'Public Parking Signboard', 'A clear and straightforward signboard indicating public parking areas. Designed for maximum visibility and readability, it ensures that drivers can easily locate parking spots in busy areas.', 'portfolio/lfa14.png'),
(15, 'DUBS Carpark Notice Board', 'A practical notice board for the DUBS carpark, designed to provide essential information and updates to drivers. Its clean design and durable construction make it a reliable addition to any parking facility.', 'portfolio/lfa15.png'),
(16, 'DUBS Carpark Please Pay Here Signboard', 'A functional and clear signboard instructing drivers to make payments at the designated area. With a straightforward design, it ensures that payment procedures are communicated effectively.', 'portfolio/lfa16.png'),
(17, 'Battle of the Barbell 2024 Fabric Portable Banner', 'A high-quality, portable fabric banner designed for the Battle of the Barbell 2024 event. Featuring vibrant graphics and a durable fabric, this banner is perfect for promotional use at competitions or fitness events.', 'portfolio/lfa17.png'),
(18, 'Insta360 Lightbox', 'A modern lightbox showcasing the Insta360 brand. With its sleek, illuminated design, it highlights the brand’s logo and products, making it an ideal display solution for tech events or retail settings.', 'portfolio/lfa18.png');

-- --------------------------------------------------------

--
-- Table structure for table `main_product`
--

CREATE TABLE `main_product` (
  `productid` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `features` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_product`
--

INSERT INTO `main_product` (`productid`, `name`, `description`, `category`, `image`, `is_featured`, `features`) VALUES
(1, 'Teardrop Wind Flag', 'Enhance visibility with our Teardrop Wind Flag, perfect for events, storefronts, and outdoor advertising. Its unique teardrop shape ensures maximum visibility even in low winds.', 'Fabric', 'products/1teardropflag.png', 1, 'High-visibility teardrop design,Durable, weather-resistant fabric,Easy setup with a variety of base options,Customizable with your logo or message'),
(2, 'Bow Wind Flag', 'The Bow Wind Flag combines style and functionality, ideal for grabbing attention at trade shows, promotions, and outdoor events. Its bow shape provides a striking and elegant display.', 'Fabric', 'products/2bowwindflag.png', 0, 'Elegant bow shape for high-impact visibility,Robust, all-weather fabric,Lightweight and portable,Fully customizable for branding'),
(3, 'Fabric Flag', 'Our Fabric Flag offers a versatile and durable solution for promotional needs. Suitable for both indoor and outdoor use, this flag is perfect for businesses, events, and exhibitions.', 'Fabric', 'products/3fabricflag.png', 1, 'High-quality, vibrant fabric material,Various sizes and finishing options,Weather-resistant and long-lasting,Customizable printing for maximum impact'),
(5, 'Tension Fabric Wall', 'Create a stunning visual backdrop with our Tension Fabric Wall. Perfect for trade shows, exhibitions, and retail displays, this product features a sleek, wrinkle-free appearance.', 'Fabric', 'products/4tensionfabricwall.png', 1, 'Create a stunning visual backdrop with our Tension Fabric Wall. Perfect for trade shows, exhibitions, and retail displays, this product features a sleek, wrinkle-free appearance.'),
(6, 'Outdoor Pop-Up Frame', 'The Outdoor Pop-Up Frame is an ideal solution for temporary outdoor displays, offering quick setup and a sturdy frame for promotional graphics.', 'Fabric', 'products/5popupframe.png', 1, 'Quick and easy setup,Durable, weather-resistant frame,Customizable fabric graphics,Compact and portable design'),
(7, 'Fabric Banner Stand', 'Showcase your brand with our Fabric Banner Stand, perfect for trade shows, events, and retail environments. The stand features a lightweight design and high-quality fabric for vibrant graphics.', 'Fabric', 'products/6fabricbannerstand.png', 0, 'Lightweight and portable,High-quality, custom-printed fabric,Adjustable height options,Quick and easy assembly'),
(8, 'Speedy Counter', 'The Speedy Counter provides an efficient and stylish way to promote your brand at trade shows and events. Featuring a sleek design and easy assembly, it’s perfect for engaging customers.', 'Fabric', 'products/7speedycounter.png', 1, 'Quick setup with lightweight construction,Customizable graphics,Compact and portable,Durable and stable design'),
(9, 'Display Tex', 'Display Tex offers a premium fabric option for high-resolution graphics and vibrant colors. Ideal for various display applications including trade shows and exhibitions.', 'Fabric', 'products/8displaytex.png', 1, 'High-resolution, vivid printing,Durable, wrinkle-resistant fabric,Versatile for various display formats,Easy to clean and maintain'),
(10, 'Super Twill', 'Super Twill fabric combines durability with a sophisticated look, making it ideal for flags, banners, and display graphics. This fabric is perfect for high-impact visuals.', 'Fabric', 'products/supertwill.jpg', 0, 'Durable, high-quality twill fabric,Excellent color retention,Ideal for indoor and outdoor use,Customizable for various applications'),
(11, 'Voile', 'Voile fabric offers a light and airy texture, ideal for elegant banners, window displays, and soft signage. It’s perfect for adding a touch of sophistication to any display.', 'Fabric', 'products/voile.jpg', 1, 'Lightweight, sheer fabric,Soft texture with vibrant color options,Suitable for both indoor and outdoor use,Customizable for various designs'),
(12, 'Ponge', 'Ponge fabric is a versatile, high-quality option for flags, banners, and displays. Known for its smooth finish and durability, it\'s ideal for creating professional-grade promotional materials.', 'Fabric', 'products/ponge.jpg', 0, 'Smooth, high-quality finish,Durable and long-lasting,Excellent for detailed prints,Suitable for various display applications'),
(13, 'Table Cloth', 'Our Table Cloth is designed to enhance the appearance of your trade show or event setup. Available in various sizes and customizable with your brand\'s logo or design.', 'Fabric', 'products/9tablecloth.png', 1, 'High-quality, wrinkle-resistant fabric,Customizable with full-color prints,Fits standard table sizes,Easy to clean and maintain'),
(14, 'Chair Cover', 'Transform the look of any event with our stylish Chair Covers. Perfect for weddings, conferences, and trade shows, these covers add elegance and professionalism to your setup.', 'Fabric', 'products/10chaircloth.png', 0, 'Stretchable, wrinkle-resistant fabric,Customizable with various colors and designs,Fits most standard chair sizes,Easy to install and remove'),
(15, 'Blockout Fabric', 'Blockout Fabric is ideal for creating banners and displays that require complete opacity. Perfect for backdrops and signage where light-blocking is essential.', 'Fabric', 'products/blockout.jpg', 1, '100% opacity for complete light blocking,Durable and resistant to fading,Ideal for both indoor and outdoor use,Customizable for various display needs'),
(16, 'Roof', 'Our Tent Roof provides essential protection from the elements, ideal for outdoor events, markets, and fairs. Constructed for durability and easy assembly.', 'Tent', 'products/21roof.png', 1, 'Weather-resistant material,Quick and easy to install,Available in various sizes,Customizable with graphics'),
(17, 'Roof + Back', 'The Roof + Back Tent option offers complete coverage for your outdoor setup, including protection from rain and wind. Perfect for market stalls, events, and exhibitions.', 'Tent', 'products/22roofback.png', 1, 'Includes roof and back panel for full coverage,Durable, weather-resistant fabric,Easy assembly with secure fittings,Customizable for branding'),
(18, 'Roof + Back + Side Half Panel', 'The Roof + Back + Side Half Panel Tent provides enhanced protection and coverage with additional side paneling, ideal for more extensive outdoor setups and exhibits.', 'Tent', 'products/23roofbackhalfside.png', 0, 'Includes roof, back, and half-side panels,Weather-resistant and durable fabric,Easy to set up and disassemble,Customizable with your design or logo'),
(19, 'Roof + Back + Full Side Panel', 'Complete your outdoor event setup with the Roof + Back + Full Side Panel Tent, offering comprehensive protection and privacy with full side coverage.', 'Tent', 'products/24roofbackside.png', 1, 'Includes roof, back, and full-side panels,Superior weather resistance,Easy to assemble and disassemble,Customizable for branding and design'),
(20, 'Mastercast', 'Mastercast stickers offer high-quality, durable adhesion for a range of surfaces. Perfect for promotional materials, product labels, and custom graphics.', 'General Sticker', '', 1, 'Durable adhesive for various surfaces,High-quality printing,Available in multiple sizes and finishes,Ideal for long-term use'),
(21, 'White', 'White stickers provide a clean, versatile base for custom designs and branding. Ideal for product labels, decals, and promotional materials.', 'General Sticker', '', 0, 'Crisp, white base for clear printing,Strong adhesive properties,Suitable for various surfaces,Customizable with high-resolution prints'),
(22, 'Polymetric', 'Polymetric stickers offer excellent durability and flexibility, making them perfect for outdoor applications and high-wear environments.', 'General Sticker', '', 1, 'High durability for outdoor use,Flexible and weather-resistant,Customizable with vibrant graphics,Long-lasting adhesion'),
(23, 'Hi-Tac', 'Hi-Tac stickers are designed for high-adhesion needs, ensuring your graphics stay in place even in challenging conditions. Ideal for heavy-duty applications.', 'General Sticker', '', 0, 'High-adhesion properties,Stays secure in various conditions,Customizable with high-quality prints,Suitable for both indoor and outdoor use'),
(24, 'Front Adhesive', 'Front Adhesive stickers are perfect for window graphics and other applications where the adhesive needs to be on the front of the sticker for a clean look.', 'General Sticker', '', 1, 'Adhesive on the front for window applications,High-quality, clear printing,Durable and weather-resistant,Easy to apply and remove'),
(25, 'Clear', 'Clear stickers offer a seamless look by blending with the background. Ideal for adding subtle branding or decorative elements to any surface.', 'General Sticker', '', 1, 'Transparent base for a seamless appearance,High-resolution custom printing,Durable and weather-resistant,Easy to apply and remove'),
(26, 'Frosted', 'Frosted stickers provide a translucent, frosted look that adds a touch of elegance to your graphics. Perfect for privacy and decorative purposes.', 'General Sticker', '', 0, 'Translucent, frosted finish,Adds a sophisticated touch to designs,Durable and weather-resistant,Easy to apply and maintain'),
(27, 'One Way Vision', 'One Way Vision stickers are ideal for window graphics, allowing visibility from the inside while displaying your design on the outside. Perfect for storefronts and vehicle windows.', 'General Sticker', '', 1, 'Perforated design for visibility from one side,High-quality, weather-resistant material,Easy to apply and remove,Customizable with vibrant graphics'),
(28, 'Static Cling', 'Static Cling stickers are perfect for temporary displays and easy repositioning. Ideal for window graphics, promotional signage, and retail displays.', 'General Sticker', '', 0, 'No adhesive; clings to surfaces with static,Easy to reposition and remove,Ideal for smooth surfaces like windows,Customizable with high-quality prints'),
(29, 'White Ink', 'White Ink stickers offer a unique printing option, providing a bright and opaque base for vibrant colors on dark or transparent backgrounds.', 'General Sticker', '', 0, 'Bright, opaque white ink for vivid colors,Ideal for dark or transparent surfaces,Durable and weather-resistant,High-quality, customizable prints'),
(30, 'Light Box', 'Light Box stickers are designed for use with illuminated displays, providing clear and vibrant graphics that shine through when backlit.', 'General Sticker', '', 1, 'Designed for backlit applications,High-resolution, vibrant printing,Durable and weather-resistant,Customizable with your graphics'),
(31, 'Floor Sticker', 'Floor Stickers are perfect for in-store promotions, wayfinding, and branding on floors. Made to withstand foot traffic and adhere securely to various floor types.', 'General Sticker', '', 0, 'Durable and slip-resistant,Ideal for high-traffic areas,Easy to apply and remove without residue,Customizable with high-quality prints'),
(32, 'Wall Sticker', 'Wall Stickers offer a versatile and easy-to-install solution for decorating and branding walls. Ideal for both residential and commercial spaces.', 'General Sticker', '', 1, 'Easy to apply and remove,High-quality, durable prints,Suitable for smooth wall surfaces,Customizable with various designs and sizes'),
(33, 'Vehicle Wrapping', 'Vehicle Wrapping provides a full-color, eye-catching way to advertise on your vehicle. Ideal for businesses looking to turn their vehicles into mobile billboards.', 'General Sticker', '', 1, 'Full-color, high-resolution printing,Durable and weather-resistant,Easy to apply and remove,Customizable to fit various vehicle sizes and shapes'),
(34, 'Letter Cutting', 'Letter Cutting stickers offer precise, die-cut letters for custom signage and branding. Ideal for creating clean and professional text-based designs.', 'Computer Die-Cut Sticker', '', 1, 'Precise die-cut letters,Ideal for custom text-based designs,High-quality, durable materials,Available in various fonts and sizes'),
(35, 'Magnetic', 'Magnetic stickers are perfect for temporary signage and promotions. Ideal for vehicles, metal surfaces, and magnetic boards.', 'Computer Die-Cut Sticker', '', 0, 'Magnetic backing for easy attachment,Removable and repositionable,Durable and weather-resistant,Customizable with high-resolution prints'),
(36, 'Label', 'Label stickers are designed for product labeling and organization. Available in various shapes and sizes, they offer a professional look for any application.', 'Computer Die-Cut Sticker', '', 1, 'Versatile shapes and sizes,High-quality, durable adhesive,Customizable with your design,Ideal for product labels and organizational needs'),
(37, 'Backdrop', 'Backdrop stickers are perfect for creating striking backgrounds at events, trade shows, and exhibitions. Customizable to fit any space and design.', 'Computer Die-Cut Sticker', '', 0, 'Customizable to fit any space,High-quality, vibrant printing,Easy to apply and remove,Durable and suitable for various surfaces'),
(38, 'Window', 'Window stickers are designed for use on glass surfaces, ideal for storefronts, offices, and promotional displays. They offer clear visibility and vibrant colors.', 'Computer Die-Cut Sticker', '', 1, 'Ideal for glass and transparent surfaces,High-resolution, vivid printing,Easy to apply and remove,Customizable with various designs'),
(39, 'Pops & Photo Frame', 'Pops & Photo Frame stickers offer a fun and interactive way to display photos and promotions. Ideal for events, retail displays, and personal use.', 'Computer Die-Cut Sticker', '', 0, 'Interactive and customizable designs,High-quality printing for clear images,Easy to apply and remove,Suitable for various surfaces'),
(40, 'Promotional Table', 'Promotional Table stickers are designed to enhance tables at events and trade shows. Customizable with your brand’s logo or message for maximum visibility.', 'Computer Die-Cut Sticker', '', 1, 'Customizable with high-quality prints,Durable and easy to clean,Ideal for event and trade show tables,Available in various sizes and shapes'),
(41, 'Main-Shaped Standee', 'The Main-Shaped Standee offers a distinctive, custom-shaped display for events and promotions. Ideal for drawing attention and showcasing your brand.', 'Computer Die-Cut Sticker', '', 1, 'Custom-shaped for unique displays,High-quality, durable materials,Easy to set up and transport,Ideal for events and trade shows'),
(42, 'Lucky Draw Box', 'The Lucky Draw Box is perfect for promotional events and raffles. Customizable with your branding and designed to attract participants.', 'Computer Die-Cut Sticker', '', 0, 'Customizable with your brand’s design,Durable and easy to set up,Ideal for promotional draws and raffles,Portable and eye-catching'),
(43, 'Foam Eco', 'Foam Eco mounting boxes provide an eco-friendly solution for displays and presentations. Made from recycled materials, they are both sustainable and effective.', 'Mounting Box', '', 1, 'Made from eco-friendly materials,Lightweight and durable,Easy to assemble and customize,Ideal for presentations and displays'),
(44, 'Foam Rigit', 'Foam Rigit mounting boxes offer sturdy support for various display applications. Ideal for trade shows, exhibitions, and promotional events.', 'Mounting Box', '', 0, 'Rigid foam construction for durability,Lightweight and easy to handle,Customizable for different display needs,Easy to assemble and disassemble'),
(45, 'PP Hollow', 'PP Hollow mounting boxes provide a durable and lightweight option for displays. Perfect for trade shows, exhibitions, and temporary setups.', 'Mounting Box', '', 0, 'Lightweight and durable polypropylene material,Easy to assemble and transport,Customizable with various sizes and designs,Suitable for both indoor and outdoor use'),
(46, 'PVC Board', 'PVC Board mounting boxes offer a strong, rigid option for displays. Ideal for signs, presentations, and promotional materials.', 'Mounting Box', '', 1, 'Sturdy PVC construction,Customizable with high-quality prints,Durable and weather-resistant,Easy to set up and transport'),
(47, 'Cardboard Stand', 'Cardboard Stands are an economical and versatile option for displays and promotional materials. Ideal for temporary setups and lightweight displays.', 'Mounting Box', '', 0, 'Cost-effective and versatile,Easy to assemble and customize,Lightweight and portable,Suitable for short-term use'),
(48, 'Tripod Display', 'Tripod Displays offer a portable and adjustable solution for showcasing graphics and signage. Ideal for trade shows, presentations, and events.', 'Mounting Box', '', 1, 'Adjustable height and angle,Lightweight and easy to transport,Customizable with various graphics,Sturdy and stable design'),
(49, 'Man-Shaped Standee', 'The Man-Shaped Standee is a life-sized, eye-catching display ideal for promotions and events. Customizable with your branding for maximum impact.', 'Mounting Box', '', 1, 'Life-sized, customizable design,High-quality, durable materials,Easy to set up and transport,Ideal for promotions and events'),
(50, 'Roll-Up Banner', 'The Roll-Up Banner is a portable and easy-to-use display solution for trade shows, events, and presentations. Featuring a retractable design for convenience.', 'Display System', 'products/6fabricbannerstand_8NkwBsi.png', 1, 'Features,Retractable design for easy setup,High-quality, customizable graphics,Lightweight and portable'),
(51, 'X Frame', 'The X Frame display system offers a stable and adjustable solution for showcasing graphics and banners. Ideal for trade shows, retail spaces, and events.', 'Display System', 'products/62xstand.png', 1, 'Features,Adjustable frame for various sizes,Stable and durable construction,Customizable with high-resolution graphics'),
(52, 'T Stand', 'T Stand displays provide a versatile and easy-to-use solution for promoting your brand. Perfect for indoor and outdoor events, retail spaces, and trade shows.', 'Display System', 'products/63tstand.png', 0, 'Features,T-shaped stand for stable display,Customizable with various graphics,Lightweight and portable'),
(53, 'Handheld Board', 'Handheld Boards are ideal for mobile promotions and events. Lightweight and customizable, they offer a practical solution for engaging with your audience.', 'Display System', 'products/64handheldboard.png', 1, 'Features,Lightweight and easy to carry,Customizable with your design or message,Ideal for mobile promotions and events'),
(54, 'Promotional Table', 'The Promotional Table system enhances your trade show or event setup with a stylish and functional display. Customizable with your branding for a professional look.', 'Display System', 'products/65promotionaltable.png', 1, 'Features,Customizable with high-quality prints,Easy to assemble and disassemble,Durable and stable design'),
(55, 'Door Stand', 'The Door Stand is perfect for promoting messages or advertisements directly on doorways. Customizable and versatile for various marketing needs.', 'Display System', 'products/66doorstand.png', 0, 'Features,Customizable with your design,Easy to attach to door surfaces,Durable and weather-resistant'),
(56, 'Bunting', 'Bunting are perfect for decorating events, fairs, and storefronts. Available in various colors and designs to enhance your promotional activities.', 'Fabric', 'products/12bunting.png', 1, 'Features,Vibrant colors and designs,Lightweight and easy to hang,Durable, weather-resistant fabric'),
(57, 'Signboard', 'Signboards offer a robust and professional solution for advertising and directional signage. Ideal for businesses, events, and public spaces.', 'Display System', 'products/67signboard.png', 1, 'Features,High-quality, durable construction,Customizable with various graphics,Suitable for both indoor and outdoor use'),
(58, 'Indoor Poster', 'Indoor Posters are perfect for promoting events, products, and messages within indoor environments. Customizable with high-resolution graphics for maximum impact.', 'Poster & Lightbox', 'products/71indoorposter.png', 1, 'High-quality printing for vibrant colors,Ideal for indoor use,Customizable sizes and designs,Durable and easy to install'),
(59, 'Outdoor Poster', 'Outdoor Posters are designed to withstand weather conditions while delivering impactful advertising. Ideal for outdoor events, promotions, and signage.', 'Poster & Lightbox', 'products/72outdoorposter.png', 1, 'Weather-resistant material,High-resolution, durable printing,Customizable for various outdoor settings,Easy to install and maintain'),
(60, 'Light Box Film', 'Light Box Film is designed for use with illuminated light boxes, providing vibrant and eye-catching graphics that stand out in any setting.', 'Poster & Lightbox', 'products/73lightboxposter_QOdoeU4.png', 1, 'Designed for backlit light boxes,High-quality, vibrant printing,Durable and weather-resistant,Customizable with your graphics'),
(61, 'Light Box Banner', 'Light Box Banners offer a dynamic way to display your message with backlighting, ensuring high visibility and impact. Ideal for advertising and promotional displays.', 'Poster & Lightbox', 'products/74lightboxbanner_ANiONvK.png', 1, 'High-resolution, backlit printing,Durable and weather-resistant,Customizable sizes and designs,Easy to install and replace'),
(62, 'Portable', 'Portable Backdrops are ideal for events and trade shows, providing a professional and easy-to-transport solution for showcasing your brand or message.', 'Backdrop', 'products/81portablebackdrop_ffCN7qw.png', 1, 'Features,Lightweight and easy to carry,Quick setup and takedown,Customizable with high-resolution prints'),
(63, 'Fabric Wall', 'The Fabric Wall backdrop offers a sleek and elegant solution for trade shows, exhibitions, and presentations. Made from high-quality fabric for a smooth finish.', 'Backdrop', 'products/82fabricwall.png', 1, 'Features,High-quality, wrinkle-resistant fabric,Customizable with your design,Easy to assemble and disassemble'),
(64, 'Traditional Wall Unit', 'The Traditional Wall Unit provides a classic and robust display option for exhibitions and trade shows. Features a durable construction for a professional presentation.', 'Backdrop', 'products/83traditionalwall_7STJuZR.png', 1, 'Features,Sturdy and durable construction,Customizable with various graphics,Ideal for trade shows and exhibitions');

-- --------------------------------------------------------

--
-- Table structure for table `main_service`
--

CREATE TABLE `main_service` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `main_blogpost`
--
ALTER TABLE `main_blogpost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_portfolioitem`
--
ALTER TABLE `main_portfolioitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_product`
--
ALTER TABLE `main_product`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `main_service`
--
ALTER TABLE `main_service`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `main_blogpost`
--
ALTER TABLE `main_blogpost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_portfolioitem`
--
ALTER TABLE `main_portfolioitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `main_product`
--
ALTER TABLE `main_product`
  MODIFY `productid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `main_service`
--
ALTER TABLE `main_service`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
