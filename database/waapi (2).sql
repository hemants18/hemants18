-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 21, 2026 at 11:57 AM
-- Server version: 8.0.44-0ubuntu0.22.04.2
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_plan_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `update_available` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `uuid`, `category`, `name`, `logo`, `description`, `metadata`, `license`, `version`, `is_plan_restricted`, `update_available`, `status`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'af0304cc-e118-4946-96d6-93df59e7665c', 'chat', 'Embedded Signup', 'whatsapp.png', 'An Embedded Signup add-on allows app users to register using their WhatsApp account.', '{\"input_fields\":[{\"element\":\"input\",\"type\":\"text\",\"name\":\"whatsapp_client_id\",\"label\":\"App ID\",\"class\":\"col-span-1\"},{\"element\":\"input\",\"type\":\"password\",\"name\":\"whatsapp_client_secret\",\"label\":\"App secret\",\"class\":\"col-span-1\"},{\"element\":\"input\",\"type\":\"text\",\"name\":\"whatsapp_config_id\",\"label\":\"Config ID\",\"class\":\"col-span-2\"},{\"element\":\"input\",\"type\":\"password\",\"name\":\"whatsapp_access_token\",\"label\":\"Access token\",\"class\":\"col-span-2\"}]}', NULL, NULL, 1, 0, 1, 1, '2025-11-25 08:04:05', '2025-11-25 08:04:05'),
(2, 'f0c1c46c-f778-4775-93cc-3c9d417dc809', 'recaptcha', 'Google Recaptcha', 'google_recaptcha.png', 'Google reCAPTCHA enhances website security by preventing spam and abusive activities.', '{\"input_fields\": [{\"element\": \"input\", \"type\": \"password\", \"name\": \"recaptcha_site_key\", \"label\": \"Recaptcha site key\", \"class\": \"col-span-2\"}, {\"element\": \"input\", \"type\": \"password\", \"name\": \"recaptcha_secret_key\", \"label\": \"Recaptcha secret key\", \"class\": \"col-span-2\"}, {\"element\": \"toggle\", \"type\": \"checkbox\", \"name\": \"recaptcha_active\", \"label\": \"Activate recaptcha\", \"class\": \"col-span-2\"}]}', NULL, NULL, 0, 0, 1, 0, '2025-11-25 08:04:05', '2025-11-25 08:04:05'),
(3, '0b4f7a4c-07c1-45e6-a9a9-34fc19c00b19', 'analytics', 'Google Analytics', 'google_analytics.png', 'Google Analytics tracks website performance and provides valuable insights for optimization.', '{\"input_fields\": [{\"element\": \"input\", \"type\": \"text\", \"name\": \"google_analytics_tracking_id\", \"label\": \"Google analytics tracking ID\", \"class\": \"col-span-2\"}]}', NULL, NULL, 0, 0, 1, 0, '2025-11-25 08:04:05', '2025-11-25 08:04:05'),
(4, '08df366a-627f-423c-ae0f-41875dba8542', 'maps', 'Google Maps', 'google_maps.png', 'Google Maps provides interactive maps for whatsapp messages.', '{\"input_fields\": [{\"element\": \"input\", \"type\": \"text\", \"name\": \"google_maps_api_key\", \"label\": \"Google maps API key\", \"class\": \"col-span-2\"}]}', NULL, NULL, 0, 0, 1, 0, '2025-11-25 08:04:05', '2025-11-25 08:04:05'),
(5, '1d752a5a-04ca-4def-abd8-3677565a7dff', 'payments', 'Razorpay', 'razorpay.png', 'Razorpay is a payment platform that simplies payment processing.', '{\"input_fields\": [{\"element\": \"input\", \"type\": \"text\", \"name\": \"razorpay_key_id\", \"label\": \"Key ID\", \"class\": \"col-span-2\"}, {\"element\": \"input\", \"type\": \"text\", \"name\": \"razorpay_secret_key\", \"label\": \"Secret Key\", \"class\": \"col-span-2\"},{\"element\": \"input\", \"type\": \"text\", \"name\": \"razorpay_webhook_secret\", \"label\": \"Webhook secret\", \"class\": \"col-span-2\"},{\"element\":\"toggle\",\"type\":\"checkbox\",\"name\":\"razorpay_active\",\"label\":\"Enable\\/disable Razorpay\",\"class\":\"col-span-2\"}]}', NULL, NULL, 0, 0, 1, 0, '2025-11-25 08:04:05', '2025-11-25 08:04:05'),
(6, 'e4057e5e-0f55-4712-a716-2a41ed5ef890', 'two factor authentication', 'Google Authenticator', 'google_authenticator.png', 'Google Authenticator enhances security with two-factor authentication.', '{\"input_fields\": [{\"element\":\"toggle\",\"type\":\"checkbox\",\"name\":\"google_auth_active\",\"label\":\"Enable\\/disable Google Authenticator\",\"class\":\"col-span-2\"}]}', 'regular', '1.0', 0, 0, 1, 0, '2025-12-17 06:45:06', '2025-12-17 07:08:07'),
(13, '3ca0be70-2127-40e0-896d-32d21ad837e2', 'utility', 'Flow builder', 'flow_icon.png', 'Flow Builder automation allows users to visually create and manage messaging workflows!', '{\"input_fields\":[{\"element\":\"toggle\",\"type\":\"checkbox\",\"name\":\"flow_builder\",\"label\":\"Enable Flow builder\",\"class\":\"col-span-2\"}]}', 'standalone', NULL, 1, 0, 1, 1, '2024-11-14 10:57:59', '2024-11-14 11:02:55');

-- --------------------------------------------------------

--
-- Table structure for table `auto_replies`
--

CREATE TABLE `auto_replies` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trigger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_criteria` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auto_replies`
--

INSERT INTO `auto_replies` (`id`, `uuid`, `organization_id`, `name`, `trigger`, `match_criteria`, `metadata`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '84a77193-2468-430e-838b-9a3258bc4fc5', 1, 'Auto Answer', 'Hello', 'exact match', '{\"type\":\"text\",\"data\":{\"text\":\"Hello {full_name}.\\nHow can i help you?\"}}', 1, NULL, NULL, '2025-12-05 06:17:58', '2025-12-15 11:58:13'),
(2, 'ee0407bb-0f3a-478f-b21c-d1cb314f205f', 1, 'share', 'share', 'exact match', '{\"type\":\"text\",\"data\":{\"text\":\"fsdfsdfsdffffffffddddddddddddddddddddddddddddddddd\"}}', 1, NULL, NULL, '2025-12-16 12:28:01', '2025-12-16 12:36:32'),
(3, '97c0018a-33aa-4a11-a1f2-9a63698414c5', 3, 'test', 'Hi', 'contains', '{\"type\":\"text\",\"data\":{\"text\":\"Hello {first_name}\\nThis is on trail.\"}}', 6, 6, '2026-01-19 06:48:43', '2026-01-19 06:47:32', '2026-01-19 06:47:32');

-- --------------------------------------------------------

--
-- Table structure for table `billing_credits`
--

CREATE TABLE `billing_credits` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_debits`
--

CREATE TABLE `billing_debits` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_invoices`
--

CREATE TABLE `billing_invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int NOT NULL,
  `plan_id` int NOT NULL,
  `subtotal` decimal(19,4) NOT NULL,
  `coupon_id` int DEFAULT NULL,
  `coupon_amount` decimal(23,2) DEFAULT '0.00',
  `tax` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `tax_type` enum('inclusive','exclusive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_invoices`
--

INSERT INTO `billing_invoices` (`id`, `uuid`, `organization_id`, `plan_id`, `subtotal`, `coupon_id`, `coupon_amount`, `tax`, `tax_type`, `total`) VALUES
(1, '61f70935-5834-4040-acc8-eb87e36730dc', 1, 1, 0.0000, NULL, 0.00, 0.0000000000, 'inclusive', 0.0000),
(2, '34c90912-61f8-4d6e-97b5-65fc0d1e8c0c', 1, 1, 0.0000, NULL, 0.00, 0.0000000000, 'inclusive', 0.0000),
(3, '965f0400-ce04-4a7b-8e36-b40e9e39a006', 3, 1, 0.0000, NULL, 0.00, 0.0000000000, 'inclusive', 0.0000),
(4, '4ede72f3-995f-4aea-a8ac-2ce619d6d672', 3, 1, 0.0000, NULL, 0.00, 0.0000000000, 'inclusive', 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `billing_items`
--

CREATE TABLE `billing_items` (
  `id` bigint UNSIGNED NOT NULL,
  `billing_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` int NOT NULL,
  `amount` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_payments`
--

CREATE TABLE `billing_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int NOT NULL,
  `processor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_tax_rates`
--

CREATE TABLE `billing_tax_rates` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` int NOT NULL,
  `rate` decimal(19,4) NOT NULL,
  `amount` decimal(19,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_transactions`
--

CREATE TABLE `billing_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int NOT NULL,
  `entity_type` enum('payment','invoice','credit','debit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(19,4) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billing_transactions`
--

INSERT INTO `billing_transactions` (`id`, `uuid`, `organization_id`, `entity_type`, `entity_id`, `description`, `amount`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'bcc78ab6-2755-4908-9f72-88a278961a3c', 1, 'invoice', 1, 'Invoice', 0.0000, 1, '2025-11-26 02:25:00', '2025-11-26 02:25:00'),
(2, '4db97118-6482-4147-8bff-1f02fada9961', 1, 'invoice', 2, 'Invoice', 0.0000, 1, '2025-12-26 09:12:35', '2025-12-26 09:12:35'),
(3, '3f4fa9c0-00be-4304-8337-dec699d28b88', 3, 'invoice', 3, 'Invoice', 0.0000, 6, '2026-01-05 12:54:25', '2026-01-05 12:54:25'),
(4, 'e54ff642-8ff5-47ae-acfa-7cd5218cbe7a', 3, 'invoice', 4, 'Invoice', 0.0000, 6, '2026-01-20 11:51:04', '2026-01-20 11:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `blog_authors`
--

CREATE TABLE `blog_authors` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int NOT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `published` int NOT NULL DEFAULT '0',
  `deleted` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `publish_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_id` int NOT NULL,
  `contact_group_id` int NOT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `scheduled_at` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `deleted_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `uuid`, `organization_id`, `name`, `template_id`, `contact_group_id`, `metadata`, `status`, `scheduled_at`, `created_by`, `deleted_by`, `created_at`, `deleted_at`) VALUES
(4, '7539d3a0-a2dc-4780-90b0-a6ef0c289826', 1, 'test', 3, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"DQOT\",\"parameters\":[]},\"body\":{\"text\":\"Hello User\",\"parameters\":[]},\"footer\":{\"text\":\"Dqot\"},\"buttons\":[{\"type\":\"URL\",\"text\":\"Visit website\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}],\"media\":null}', 'completed', '2025-11-26 06:57:33', 1, NULL, '2025-11-26 06:58:42', NULL),
(5, '63d396ff-5688-482a-bc0a-65a8013cad44', 1, 'tet', 3, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"DQOT\",\"parameters\":[]},\"body\":{\"text\":\"Hello User\",\"parameters\":[]},\"footer\":{\"text\":\"Dqot\"},\"buttons\":[{\"type\":\"URL\",\"text\":\"Visit website\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}],\"media\":null}', 'completed', '2025-11-26 07:00:36', 1, NULL, '2025-11-26 07:00:39', NULL),
(6, 'c1d12854-93bb-4099-8101-2ca7337e8e0d', 1, 'rest', 2, 0, '{\"header\":{\"format\":null,\"text\":null,\"parameters\":[]},\"body\":{\"text\":\"Hello hem ant this is a message from DOT\",\"parameters\":[]},\"footer\":{\"text\":null},\"buttons\":[],\"media\":null}', 'completed', '2025-11-26 07:01:34', 1, NULL, '2025-11-26 07:01:39', NULL),
(7, 'db706329-d769-41e2-be84-c0bf74423c76', 1, 'for testing', 1, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"This is testing form console\",\"parameters\":[]},\"body\":{\"text\":\"Hello User\",\"parameters\":[]},\"footer\":{\"text\":\"DQOT Solutions\"},\"buttons\":[],\"media\":null}', 'completed', '2025-11-26 10:00:53', 1, NULL, '2025-11-26 10:00:58', NULL),
(8, '3318314c-cac1-4d95-b6ab-0b2900fadbc7', 1, 'test', 5, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"this is demo from admin panal\",\"parameters\":[]},\"body\":{\"text\":\"this is demo from admin panal\",\"parameters\":[]},\"footer\":{\"text\":\"this is demo from admin panal\"},\"buttons\":[],\"media\":null}', 'completed', '2025-11-28 05:29:52', 1, NULL, '2025-11-28 05:29:59', NULL),
(9, 'ce56731d-ddad-46d2-8f73-e32caed5657b', 1, 'test', 1, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"This is testing form console\",\"parameters\":[]},\"body\":{\"text\":\"Hello User\",\"parameters\":[]},\"footer\":{\"text\":\"DQOT Solutions\"},\"buttons\":[],\"media\":null}', 'completed', '2025-12-05 06:45:20', 1, NULL, '2025-12-05 07:05:04', NULL),
(10, '842d70f2-c55e-466e-a3d6-da8545cbf0c0', 1, 'test', 1, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"This is testing form console\",\"parameters\":[]},\"body\":{\"text\":\"Hello User\",\"parameters\":[]},\"footer\":{\"text\":\"DQOT Solutions\"},\"buttons\":[],\"media\":null}', 'completed', '2025-12-05 07:58:30', 1, NULL, '2025-12-05 07:58:45', NULL),
(11, '44389459-7ff1-454c-9cd3-8fe16ffcf07e', 1, 'test with friend', 6, 2, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Technician visit\",\"parameters\":[]},\"body\":{\"text\":\"Hi {{1}}, we\'re scheduling a technician visit for your {{2}} on {{3}} between {{4}} and {{5}}. Please confirm if this time slot works for you.\",\"parameters\":[{\"type\":\"text\",\"selection\":\"static\",\"value\":\"Kapil\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"Khujli krwane ka\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"2025-12-05\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"10:00 AM\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"2:00 PM\"}]},\"footer\":{\"text\":null},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"Confirm\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"yes\"}]},{\"type\":\"QUICK_REPLY\",\"text\":\"Reschedule\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"No\"}]}],\"media\":null}', 'completed', '2025-12-05 08:59:57', 1, NULL, '2025-12-05 09:00:07', NULL),
(12, '62c779e2-3acd-4e3d-a82b-8e3d62a3677c', 1, 'test', 7, 2, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Recharge Alert\",\"parameters\":[]},\"body\":{\"text\":\"\\u25b6\\ufe0f\\ud83d\\udd3d\\ud83d\\udd3cHi John, your mobile balance is {{1}}. Please recharge to avoid interruption\\u25b6\\ufe0f.\",\"parameters\":[{\"type\":\"text\",\"selection\":\"static\",\"value\":\"150\"}]},\"footer\":{\"text\":\"jio corporation\"},\"buttons\":[{\"type\":\"URL\",\"text\":\"Recharge Now\",\"value\":\"http:\\/\\/abc.com\\/\",\"parameters\":[]}],\"media\":null}', 'completed', '2025-12-07 10:22:58', 1, NULL, '2025-12-10 06:26:23', NULL),
(13, 'aba6ee8f-1cb0-4625-99f9-39d0fdf706f7', 1, 'test', 9, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Offer MSG\",\"parameters\":[]},\"body\":{\"text\":\"this is offer msg for dqot \\r\\nuse this code #abc123\\r\\nfor get 20% discount on every product on dqot website.\",\"parameters\":[]},\"footer\":{\"text\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"Test\"}]},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"+919636963365\",\"parameters\":[]},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"abc123\"}]},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}],\"media\":null}', 'completed', '2025-12-15 12:14:21', 1, NULL, '2025-12-15 12:14:30', NULL),
(14, '118e88f7-aef4-49fa-a171-fc2a997a0427', 1, 'sdfhsjhfd', 9, 2, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Offer MSG\",\"parameters\":[]},\"body\":{\"text\":\"this is offer msg for dqot \\r\\nuse this code #abc123\\r\\nfor get 20% discount on every product on dqot website.\",\"parameters\":[]},\"footer\":{\"text\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"sdfsdjfsdfgjsdf\"}]},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"+919636963365\",\"parameters\":[]},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"abc123\"}]},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}],\"media\":null}', 'completed', '2025-12-16 12:26:21', 1, NULL, '2025-12-16 12:26:25', NULL),
(15, '8a76a182-998b-4043-9b78-dd2dcca2df7d', 1, 'fgdfhgjdfghkdfgkdfjg', 9, 2, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Offer MSG\",\"parameters\":[]},\"body\":{\"text\":\"this is offer msg for dqot \\r\\nuse this code #abc123\\r\\nfor get 20% discount on every product on dqot website.\",\"parameters\":[]},\"footer\":{\"text\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"gdfgdfgdfgdfg\"}]},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"+919636963365\",\"parameters\":[]},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"abc123\"}]},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}],\"media\":null}', 'completed', '2025-12-16 12:31:26', 1, NULL, '2025-12-16 12:31:31', NULL),
(16, 'f8afdd26-7b8e-4b9a-aa61-3df943ddaf90', 3, 'test', 10, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Hello World\",\"parameters\":[]},\"body\":{\"text\":\"Welcome and congratulations!! This message demonstrates your ability to send a WhatsApp message notification from the Cloud API, hosted by Meta. Thank you for taking the time to test with us.\",\"parameters\":[]},\"footer\":{\"text\":\"WhatsApp Business Platform sample message\"},\"buttons\":[],\"media\":null}', 'completed', '2026-01-06 05:52:59', 6, NULL, '2026-01-06 05:53:04', NULL),
(17, '349df22d-caaf-4daf-be83-9d8ee9d2d16c', 3, 'test', 10, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Hello World\",\"parameters\":[]},\"body\":{\"text\":\"Welcome and congratulations!! This message demonstrates your ability to send a WhatsApp message notification from the Cloud API, hosted by Meta. Thank you for taking the time to test with us.\",\"parameters\":[]},\"footer\":{\"text\":\"WhatsApp Business Platform sample message\"},\"buttons\":[],\"media\":null}', 'completed', '2026-01-06 08:56:19', 6, NULL, '2026-01-06 08:56:22', NULL),
(18, 'b1932d47-c35c-47d2-94a3-d10037653c50', 3, 'test', 11, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"this is test msg from marketing.\",\"parameters\":[]},\"body\":{\"text\":\"this is test MSG from marketing.\",\"parameters\":[]},\"footer\":{\"text\":\"powered vy DQOT\"},\"buttons\":[],\"media\":null}', 'completed', '2026-01-06 08:56:54', 6, NULL, '2026-01-06 08:57:00', NULL),
(19, 'a9fccfdb-0e22-4a36-bead-cdbfe0f2ce90', 3, 'test', 11, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"this is test msg from marketing.\",\"parameters\":[]},\"body\":{\"text\":\"this is test MSG from marketing.\",\"parameters\":[]},\"footer\":{\"text\":\"powered vy DQOT\"},\"buttons\":[],\"media\":null}', 'completed', '2026-01-08 12:06:37', 6, NULL, '2026-01-08 12:06:41', NULL),
(20, 'f6acc4e3-3d6e-4b47-aa18-13b8501a65b2', 3, 'test', 11, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"this is test msg from marketing.\",\"parameters\":[]},\"body\":{\"text\":\"this is test MSG from marketing.\",\"parameters\":[]},\"footer\":{\"text\":\"powered vy DQOT\"},\"buttons\":[],\"media\":null}', 'completed', '2026-01-09 13:08:55', 6, NULL, '2026-01-09 13:09:00', NULL),
(21, 'cb66af9f-d946-4d12-9789-a943ae142f3e', 3, 'test', 10, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Hello World\",\"parameters\":[]},\"body\":{\"text\":\"Welcome and congratulations!! This message demonstrates your ability to send a WhatsApp message notification from the Cloud API, hosted by Meta. Thank you for taking the time to test with us.\",\"parameters\":[]},\"footer\":{\"text\":\"WhatsApp Business Platform sample message\"},\"buttons\":[],\"media\":null}', 'completed', '2026-01-09 13:12:48', 6, NULL, '2026-01-09 13:12:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_logs`
--

CREATE TABLE `campaign_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `campaign_id` int NOT NULL,
  `contact_id` int NOT NULL,
  `chat_id` int DEFAULT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','success','failed','ongoing') COLLATE utf8mb4_unicode_ci NOT NULL,
  `retry_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaign_logs`
--

INSERT INTO `campaign_logs` (`id`, `campaign_id`, `contact_id`, `chat_id`, `metadata`, `status`, `retry_count`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 1, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOEIxNDcxOTJGMTlEQjY4N0MwAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-11-26 01:28:41', '2025-11-26 01:28:42'),
(2, 5, 1, 2, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTAxMjg4OTAyRkUwRUJCRTFBAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-11-26 01:30:37', '2025-11-26 01:30:38'),
(3, 5, 2, 3, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086311\",\"wa_id\":\"919257086311\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRDU0NDBBQURFQkFERDRBQ0VDAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-11-26 01:30:37', '2025-11-26 01:30:39'),
(4, 6, 1, 4, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMTIyRDJDQUY0M0Y3M0NGN0QyAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-11-26 01:31:36', '2025-11-26 01:31:38'),
(5, 6, 2, 5, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086311\",\"wa_id\":\"919257086311\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRUYwNTQzMjc5RkUzQTg0MjBBAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-11-26 01:31:36', '2025-11-26 01:31:39'),
(6, 7, 1, 6, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQzZENUJFNjBDQkM5RTUyREEzAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-11-26 04:30:54', '2025-11-26 04:30:56'),
(7, 7, 2, 7, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086311\",\"wa_id\":\"919257086311\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRDJCQjRERjMxN0NBNjVERDcyAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-11-26 04:30:54', '2025-11-26 04:30:57'),
(8, 7, 3, 8, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086309\",\"wa_id\":\"919257086309\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSQjA2MzMzRjY0MUZCOTU2RTk4AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-11-26 04:30:54', '2025-11-26 04:30:58'),
(9, 8, 1, 9, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMTc3RUZEN0I5QjFCNTUyQTI1AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-11-27 23:59:55', '2025-11-27 23:59:57'),
(10, 8, 2, 10, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086311\",\"wa_id\":\"919257086311\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRkU4MkE4N0RBNjM4NzU4MTQ1AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-11-27 23:59:55', '2025-11-27 23:59:58'),
(11, 8, 3, 11, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086309\",\"wa_id\":\"919257086309\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMDZFMjlDQjg1QzdDNzJBQjVGAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-11-27 23:59:55', '2025-11-27 23:59:59'),
(12, 9, 1, 28, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUMzRkQ4MTRDREVBNDVCM0VGAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-05 07:05:00', '2025-12-05 07:05:01'),
(13, 9, 2, 29, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086311\",\"wa_id\":\"919257086311\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSMDBDM0FGMUFDRTk2OUQ4RUIyAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-05 07:05:00', '2025-12-05 07:05:02'),
(14, 9, 3, 30, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086309\",\"wa_id\":\"919257086309\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTU1ODlCRTMwQkVENDRFQzlBAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-05 07:05:00', '2025-12-05 07:05:04'),
(15, 9, 4, NULL, '{\"data\":{\"error\":{\"message\":\"(#131030) Recipient phone number not in allowed list\",\"type\":\"OAuthException\",\"code\":131030,\"error_data\":{\"messaging_product\":\"whatsapp\",\"details\":\"Recipient phone number not in allowed list: Add recipient phone number to recipient list and try again.\"},\"fbtrace_id\":\"AhSvfuoCdXrekh2eS0_jww_\"}},\"message\":\"(#131030) Recipient phone number not in allowed list\"}', 'failed', 0, '2025-12-05 07:05:00', '2025-12-05 07:05:04'),
(16, 10, 1, 34, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTdFRjZFNDk4NTlEOUE4RkM0AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-05 07:58:41', '2025-12-05 07:58:43'),
(17, 10, 2, 35, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086311\",\"wa_id\":\"919257086311\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSOTYxQTJFREJFMENFQTIwNzU5AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-05 07:58:41', '2025-12-05 07:58:43'),
(18, 10, 3, 36, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086309\",\"wa_id\":\"919257086309\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSOEY5NkZCODQ1QzRGREMzQTJCAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-05 07:58:41', '2025-12-05 07:58:44'),
(19, 10, 4, 37, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919672520566\",\"wa_id\":\"919672520566\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMERBQjRBODk0MTY4NkQ3OEM4AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-05 07:58:41', '2025-12-05 07:58:45'),
(20, 11, 1, 40, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTExQkM2NzcwODA5NjQ5MTMzAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-05 09:00:05', '2025-12-05 09:00:06'),
(21, 11, 4, 41, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919672520566\",\"wa_id\":\"919672520566\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODRDMkE0QUNCNUM3OEYyRjcxAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-05 09:00:05', '2025-12-05 09:00:07'),
(22, 12, 1, 57, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDhDQjFBRkQ1NTg3NzEwNEFDAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-10 06:26:20', '2025-12-10 06:26:21'),
(23, 12, 4, 58, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919672520566\",\"wa_id\":\"919672520566\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTNCQkNDNEM4OTRCQjgwMDFBAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-10 06:26:20', '2025-12-10 06:26:23'),
(24, 13, 1, 112, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMjdDNEM2QjM5Q0VCMDhDQkE5AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-15 12:14:23', '2025-12-15 12:14:26'),
(25, 13, 2, 113, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086311\",\"wa_id\":\"919257086311\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSQzM5NEI5REU5QTlFRDg3REU3AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-15 12:14:23', '2025-12-15 12:14:27'),
(26, 13, 3, 114, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086309\",\"wa_id\":\"919257086309\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTg2MzZERkY4QUQ0QTNBQ0YzAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-15 12:14:23', '2025-12-15 12:14:29'),
(27, 13, 4, 115, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919672520566\",\"wa_id\":\"919672520566\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODZFMzIzRUIyOTJDNTJDMEIwAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-15 12:14:23', '2025-12-15 12:14:30'),
(28, 14, 1, 125, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkIyM0IxOTY4ODRFODJFMTc1AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-16 12:26:23', '2025-12-16 12:26:24'),
(29, 14, 4, 126, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919672520566\",\"wa_id\":\"919672520566\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTk2RUVGMUI5RjI4QUYwMjZEAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-16 12:26:23', '2025-12-16 12:26:25'),
(30, 15, 1, 131, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUY4NTdGOTdDNDk5NDlEMDRCAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-16 12:31:28', '2025-12-16 12:31:30'),
(31, 15, 4, 132, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919672520566\",\"wa_id\":\"919672520566\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSOEQ4NTBDRUYyMkI3NkQwQzcxAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-16 12:31:28', '2025-12-16 12:31:31'),
(32, 16, 5, NULL, '{\"data\":{\"error\":{\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\",\"type\":\"OAuthException\",\"code\":131058,\"fbtrace_id\":\"AojuKab2aYuwF1ntjclVUPg\"}},\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\"}', 'failed', 0, '2026-01-06 05:53:02', '2026-01-06 05:53:03'),
(33, 16, 6, NULL, '{\"data\":{\"error\":{\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\",\"type\":\"OAuthException\",\"code\":131058,\"fbtrace_id\":\"AkOmjeqiIDCdb3us29JSQSQ\"}},\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\"}', 'failed', 0, '2026-01-06 05:53:02', '2026-01-06 05:53:03'),
(34, 16, 7, NULL, '{\"data\":{\"error\":{\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\",\"type\":\"OAuthException\",\"code\":131058,\"fbtrace_id\":\"Akj_OLEIBqO6rpCh9qYPnh1\"}},\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\"}', 'failed', 0, '2026-01-06 05:53:02', '2026-01-06 05:53:04'),
(35, 17, 5, NULL, '{\"data\":{\"error\":{\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\",\"type\":\"OAuthException\",\"code\":131058,\"fbtrace_id\":\"AnrRAqF85L5jsA-9UueV_fb\"}},\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\"}', 'failed', 0, '2026-01-06 08:56:19', '2026-01-06 08:56:20'),
(36, 17, 6, NULL, '{\"data\":{\"error\":{\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\",\"type\":\"OAuthException\",\"code\":131058,\"fbtrace_id\":\"A7ejbdsJIYvprwFjjUbpBLo\"}},\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\"}', 'failed', 0, '2026-01-06 08:56:19', '2026-01-06 08:56:21'),
(37, 17, 7, NULL, '{\"data\":{\"error\":{\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\",\"type\":\"OAuthException\",\"code\":131058,\"fbtrace_id\":\"A4XvFwyGPQrzdyPrmLKESFe\"}},\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\"}', 'failed', 0, '2026-01-06 08:56:19', '2026-01-06 08:56:22'),
(38, 18, 5, 210, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQjI5RDAyQUI1NDg0Nzc4QzY2AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2026-01-06 08:56:55', '2026-01-06 08:56:57'),
(39, 18, 6, 211, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086311\",\"wa_id\":\"919257086311\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRDNCQjU0MzU0MjlENkU3OTQyAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2026-01-06 08:56:55', '2026-01-06 08:56:58'),
(40, 18, 7, 212, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919782543431\",\"wa_id\":\"919782543431\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSNUYyMTNFRjhCM0YyRUU2NkI4AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2026-01-06 08:56:55', '2026-01-06 08:57:00'),
(41, 19, 11, 221, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQzQ4MTE3N0ExQUQ0QUNFNkMwAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2026-01-08 12:06:39', '2026-01-08 12:06:41'),
(42, 20, 11, 226, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUY4MUQ3NzkzQTY3QjQ2QzhEAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2026-01-09 13:08:57', '2026-01-09 13:08:58'),
(43, 20, 12, 227, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919782543431\",\"wa_id\":\"919782543431\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSODg3OUQzMjUxMUFBOTFBODAwAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2026-01-09 13:08:57', '2026-01-09 13:09:00'),
(44, 21, 11, NULL, '{\"data\":{\"error\":{\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\",\"type\":\"OAuthException\",\"code\":131058,\"fbtrace_id\":\"Ay6OymXHp5dB9lEpXT9ekDW\"}},\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\"}', 'failed', 0, '2026-01-09 13:12:51', '2026-01-09 13:12:51'),
(45, 21, 12, NULL, '{\"data\":{\"error\":{\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\",\"type\":\"OAuthException\",\"code\":131058,\"fbtrace_id\":\"ATxGeSSueAUIJVsR-UmCE7z\"}},\"message\":\"(#131058) Hello World templates can only be sent from the Public Test Numbers\"}', 'failed', 0, '2026-01-09 13:12:51', '2026-01-09 13:12:52');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_log_retries`
--

CREATE TABLE `campaign_log_retries` (
  `id` bigint UNSIGNED NOT NULL,
  `campaign_log_id` bigint UNSIGNED NOT NULL,
  `chat_id` bigint UNSIGNED DEFAULT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int NOT NULL,
  `wam_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `type` enum('inbound','outbound') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_id` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_by` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `uuid`, `organization_id`, `wam_id`, `contact_id`, `user_id`, `type`, `metadata`, `media_id`, `status`, `is_read`, `deleted_by`, `deleted_at`, `created_at`) VALUES
(1, 'e114efef-83ea-45a9-be38-33c90f3fd70c', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOEIxNDcxOTJGMTlEQjY4N0MwAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"Dqot\"},\"buttons\":[{\"type\":\"URL\",\"text\":\"Visit website\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'accepted', 0, 1, '2026-01-05 07:55:40', '2025-11-26 01:28:42'),
(2, 'b08e6e13-398f-4950-9fcf-af6d01fe6ba7', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTAxMjg4OTAyRkUwRUJCRTFBAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"Dqot\"},\"buttons\":[{\"type\":\"URL\",\"text\":\"Visit website\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'accepted', 0, 1, '2026-01-05 07:55:40', '2025-11-26 01:30:38'),
(3, '562f56d4-5a1e-4c90-b9a1-9694ec81ad48', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRDU0NDBBQURFQkFERDRBQ0VDAA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"Dqot\"},\"buttons\":[{\"type\":\"URL\",\"text\":\"Visit website\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 01:30:39'),
(4, '7d74c80c-a4f4-4bdb-b810-07c3009f1f43', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMTIyRDJDQUY0M0Y3M0NGN0QyAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello hem ant this is a message from DOT\"}}', NULL, 'accepted', 0, 1, '2026-01-05 07:55:40', '2025-11-26 01:31:38'),
(5, 'c19f6bbf-122c-4384-976b-bc5137e68cd0', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRUYwNTQzMjc5RkUzQTg0MjBBAA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello hem ant this is a message from DOT\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 01:31:39'),
(6, '0f1b978f-c31d-43fc-af67-89ca35b0fc56', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQzZENUJFNjBDQkM5RTUyREEzAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'accepted', 0, 1, '2026-01-05 07:55:40', '2025-11-26 04:30:56'),
(7, '67394cee-6882-4cfb-a3e9-a39de30eb85e', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRDJCQjRERjMxN0NBNjVERDcyAA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 04:30:57'),
(8, '34638d42-e04e-48a7-9e65-1249a6e2e391', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSQjA2MzMzRjY0MUZCOTU2RTk4AA==', 3, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 04:30:58'),
(9, 'cd24d910-5346-4cfb-9012-e4b5a008bff0', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMTc3RUZEN0I5QjFCNTUyQTI1AA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is demo from admin panal\",\"footer\":\"this is demo from admin panal\"}}', NULL, 'accepted', 0, 1, '2026-01-05 07:55:40', '2025-11-27 23:59:57'),
(10, '10f1f194-2a7c-4309-87c5-4509357f3109', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRkU4MkE4N0RBNjM4NzU4MTQ1AA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is demo from admin panal\",\"footer\":\"this is demo from admin panal\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-27 23:59:58'),
(11, '38dee7c6-2f36-4ab7-9db7-23474156f4ee', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMDZFMjlDQjg1QzdDNzJBQjVGAA==', 3, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is demo from admin panal\",\"footer\":\"this is demo from admin panal\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-27 23:59:59'),
(12, '0a51ef3d-27a3-4fdd-87d2-ac482dcdc004', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzREJBMEQzRTg2QjFBNUMzMEE3QUNERkNCNTYyQkIA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzREJBMEQzRTg2QjFBNUMzMEE3QUNERkNCNTYyQkIA\",\"timestamp\":\"1764912345\",\"text\":{\"body\":\"Hello User\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-05 05:25:48'),
(13, '0e534eee-8181-4497-9063-c614f492a932', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU4NDY4QzVDOTNDMzA2RTkxQjVBNjRFOUIwOUI1M0IA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU4NDY4QzVDOTNDMzA2RTkxQjVBNjRFOUIwOUI1M0IA\",\"timestamp\":\"1764912511\",\"text\":{\"body\":\"Aa naa\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-05 05:28:34'),
(14, '46183a07-86b0-47e0-8a36-2da5cb3c2809', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMDMyRUZCMTEwN0I1NEVGNTc2AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-05 05:28:59'),
(15, 'c7caa8ea-def4-4f13-b41f-195e1eec4087', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5Q0ZGRDY0NkVEQTM0NUQxMjY3OTA0RjJGRUMwMEIA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5Q0ZGRDY0NkVEQTM0NUQxMjY3OTA0RjJGRUMwMEIA\",\"timestamp\":\"1764912553\",\"text\":{\"body\":\"Hii\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-05 05:29:15'),
(16, '62c7c1da-f22d-4ffc-990d-13ef184eec9f', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2NzA5MDhCODI4MDczRjNDRUMwNEEyODAzREMwNDUA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2NzA5MDhCODI4MDczRjNDRUMwNEEyODAzREMwNDUA\",\"timestamp\":\"1764915426\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-05 06:17:08'),
(17, 'f08150a4-84fc-40f0-9d96-653902bd41eb', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCMTVCRjREODcyRjU4NjJFMDY5M0EzODFBRjQ4NjgA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCMTVCRjREODcyRjU4NjJFMDY5M0EzODFBRjQ4NjgA\",\"timestamp\":\"1764915490\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-05 06:18:12'),
(18, 'b3c74b41-5bc6-4264-aea1-6dc537085482', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMTY3RDgzQjkzQ0ZBNTA0REVFAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"Hello User.\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-05 06:18:14'),
(19, '4b518e98-9225-4fb8-b4e8-f62a1378f121', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5QzRBMDY4MkYzNjNCMEREQTgyNjY1N0MwRjJFQjgA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5QzRBMDY4MkYzNjNCMEREQTgyNjY1N0MwRjJFQjgA\",\"timestamp\":\"1764915502\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-05 06:18:24'),
(20, 'c4b62685-d09f-4cf3-a4d4-7b1e45c7ca06', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUREMTE1OEYxRTg5M0M5QTdEAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"Hello User.\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-05 06:18:25'),
(21, 'cfde4291-ba04-4ff4-8651-27304108fe44', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTg3OEQ5M0ZGQTE1QjAxQzgyAA==', 1, NULL, 'outbound', '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTg3OEQ5M0ZGQTE1QjAxQzgyAA==\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/png\"}}', 1, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-05 06:19:18'),
(22, 'f4c8f4f3-3b6c-4c2f-abaf-51201111a4ac', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMEY2NEMyNTM3MUNBRTlFMTRDNQA=', 2, NULL, 'inbound', '{\"from\":\"919257086311\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMEY2NEMyNTM3MUNBRTlFMTRDNQA=\",\"timestamp\":\"1764916753\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-05 06:39:15'),
(23, '228ee29a-1d43-4ba7-a837-566f47076ec3', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSREE3NDJGM0JGRDQxRDhCMDc2AA==', 2, NULL, 'outbound', '{\"text\":{\"body\":\"Hello User.\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'delivered', 0, NULL, NULL, '2025-12-05 06:39:16'),
(24, '5ee62a21-bbb4-41a5-892f-6d8d8e85f050', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRUZBMkFFRUIyRDkzNkNBRTQwAA==', 2, NULL, 'outbound', '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRUZBMkFFRUIyRDkzNkNBRTQwAA==\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/png\"}}', 2, 'read', 0, NULL, NULL, '2025-12-05 06:40:22'),
(25, 'b31c39aa-e4cf-4898-947b-3fc303d7ee52', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMEE3MjIwQTFBRjQyNkY1RTYxOQA=', 2, NULL, 'inbound', '{\"from\":\"919257086311\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMEE3MjIwQTFBRjQyNkY1RTYxOQA=\",\"timestamp\":\"1764916834\",\"text\":{\"body\":\"okay\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-05 06:40:35'),
(26, '0c207818-bf18-44d8-9071-4e41cf1bd07c', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSQzNDM0NBN0M4OTFGNDk3NDA1AA==', 2, NULL, 'outbound', '{\"text\":{\"body\":\"axhi bat h\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2025-12-05 06:40:45'),
(27, '5648b989-f714-4404-ada7-b7017f11ad61', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMENENjQzNkVFNEU0NDE3NUUxMgA=', 2, NULL, 'inbound', '{\"from\":\"919257086311\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMENENjQzNkVFNEU0NDE3NUUxMgA=\",\"timestamp\":\"1764916851\",\"text\":{\"body\":\"hanji\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-05 06:40:52'),
(28, 'c97f0ec8-be87-4518-8125-52c4b8ee3c05', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUMzRkQ4MTRDREVBNDVCM0VGAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-05 07:05:01'),
(29, '2ba017df-4259-492a-8e8c-75004e488ba0', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSMDBDM0FGMUFDRTk2OUQ4RUIyAA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'read', 0, NULL, NULL, '2025-12-05 07:05:02'),
(30, 'a212079c-616f-4951-ae1e-aa879a7bccfa', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTU1ODlCRTMwQkVENDRFQzlBAA==', 3, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'read', 0, NULL, NULL, '2025-12-05 07:05:04'),
(31, '11485075-eccf-47d4-9106-14c9702f6075', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMEVCODBGQzg3RUYwMjk3RTI1MQA=', 2, NULL, 'inbound', '{\"from\":\"919257086311\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMEVCODBGQzg3RUYwMjk3RTI1MQA=\",\"timestamp\":\"1764918312\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-05 07:05:14'),
(32, 'bbb28d1d-8ffe-4c70-ba13-fab566d46859', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSQTAwRkZCNzhDQ0UzRThBMjhEAA==', 2, NULL, 'outbound', '{\"text\":{\"body\":\"Hello User.\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2025-12-05 07:05:15'),
(33, '9fcf1a99-ea99-48e9-a4d7-20bc8cd9db87', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMDQ0NTcyMjhENjFCN0I1RDJGNgA=', 2, NULL, 'inbound', '{\"from\":\"919257086311\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMDQ0NTcyMjhENjFCN0I1RDJGNgA=\",\"timestamp\":\"1764918322\",\"text\":{\"body\":\"No\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-05 07:05:24'),
(34, '0ee10c34-256f-42fd-86cd-a6d918d3e3cc', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTdFRjZFNDk4NTlEOUE4RkM0AA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-05 07:58:43'),
(35, 'b5c17eed-7790-4ef6-82dc-558bb4b995ec', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSOTYxQTJFREJFMENFQTIwNzU5AA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'read', 0, NULL, NULL, '2025-12-05 07:58:43'),
(36, 'd91b0926-de6e-4fb2-93e6-364c0c7c6d93', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSOEY5NkZCODQ1QzRGREMzQTJCAA==', 3, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'failed', 0, NULL, NULL, '2025-12-05 07:58:44'),
(37, '36b79f83-deca-4223-96cf-5469a317b028', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMERBQjRBODk0MTY4NkQ3OEM4AA==', 4, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'failed', 0, 1, '2025-12-05 13:04:57', '2025-12-05 07:58:45'),
(38, 'fc2daf38-034a-4ded-a43c-1b02ea90eeaf', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMERFRTlDQUJCOTYyNTY3REMzMgA=', 2, NULL, 'inbound', '{\"from\":\"919257086311\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMERFRTlDQUJCOTYyNTY3REMzMgA=\",\"timestamp\":\"1764921536\",\"text\":{\"body\":\"hello sir\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-05 07:58:57'),
(39, 'c246d4c3-f4ea-4d00-a362-a10c71af7657', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBNEJCMEJFRjRCNTMzNEY4QjBGODJBODUzQUJFMjgA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBNEJCMEJFRjRCNTMzNEY4QjBGODJBODUzQUJFMjgA\",\"timestamp\":\"1764921599\",\"text\":{\"body\":\"Hii\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-05 08:00:00'),
(40, '9d865a15-ecb9-40ac-9ca1-b3ed88b5add2', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTExQkM2NzcwODA5NjQ5MTMzAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hi Kapil, we\'re scheduling a technician visit for your Khujli krwane ka on 2025-12-05 between 10:00 AM and 2:00 PM. Please confirm if this time slot works for you.\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"Confirm\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"yes\"}]},{\"type\":\"QUICK_REPLY\",\"text\":\"Reschedule\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"No\"}]}]}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-05 09:00:06'),
(41, '173007d5-1d00-4d1d-ab86-9acf11b1ff50', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODRDMkE0QUNCNUM3OEYyRjcxAA==', 4, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hi Kapil, we\'re scheduling a technician visit for your Khujli krwane ka on 2025-12-05 between 10:00 AM and 2:00 PM. Please confirm if this time slot works for you.\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"Confirm\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"yes\"}]},{\"type\":\"QUICK_REPLY\",\"text\":\"Reschedule\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"No\"}]}]}', NULL, 'read', 0, 1, '2025-12-05 13:04:57', '2025-12-05 09:00:07'),
(42, '23e0602c-52fa-4fe8-be86-a27e00b48387', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhggQUM4RDJFRjgxMjg2OUZFMkM4M0Y3NkE0MEZBREY0MEQA', 4, NULL, 'inbound', '{\"context\":{\"from\":\"15551948235\",\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODRDMkE0QUNCNUM3OEYyRjcxAA==\"},\"from\":\"919672520566\",\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhggQUM4RDJFRjgxMjg2OUZFMkM4M0Y3NkE0MEZBREY0MEQA\",\"timestamp\":\"1764925255\",\"type\":\"button\",\"button\":{\"payload\":\"yes\",\"text\":\"Confirm\"}}', NULL, 'delivered', 0, 1, '2025-12-05 13:04:57', '2025-12-05 09:00:57'),
(43, '96f265f2-4302-4e66-9995-1475b934d07e', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSNUIyMTQ0RkQwMDZBRDJFMjc2AA==', 4, NULL, 'outbound', '{\"text\":{\"body\":\"what\'s you budget?\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2025-12-05 13:04:57', '2025-12-05 09:01:22'),
(44, '6aba2bdc-650a-4757-b1f3-31c6d42f1fa8', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhggQUMzMTQwQTgzRTE0OTU1Njc2RUIxQTU1NzRFRTk4NUQA', 4, NULL, 'inbound', '{\"from\":\"919672520566\",\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhggQUMzMTQwQTgzRTE0OTU1Njc2RUIxQTU1NzRFRTk4NUQA\",\"timestamp\":\"1764925299\",\"text\":{\"body\":\"As per the service\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2025-12-05 13:04:57', '2025-12-05 09:01:41'),
(45, '3b0f322f-4432-41c8-b26c-a02c03ba4565', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSNkQ3MUUwNDJCODFCQkU4MDY4AA==', 4, NULL, 'outbound', '{\"text\":{\"body\":\"i have many type of service.\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2025-12-05 13:04:57', '2025-12-05 09:01:58'),
(46, '83b00046-a884-49bf-87be-bcc097c58c94', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhggQUNBQTlFQUNDRTQwRjc0NDY3RkFDMkE3OTI1MEU4OEYA', 4, NULL, 'inbound', '{\"from\":\"919672520566\",\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhggQUNBQTlFQUNDRTQwRjc0NDY3RkFDMkE3OTI1MEU4OEYA\",\"timestamp\":\"1764925331\",\"text\":{\"body\":\"Please share service list\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2025-12-05 13:04:57', '2025-12-05 09:02:12'),
(47, 'e50ed308-4e1f-45cf-8aa8-006aef149be0', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMDRDM0YyMzcxQUI4NzczRTI3RQA=', 2, NULL, 'inbound', '{\"from\":\"919257086311\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMDRDM0YyMzcxQUI4NzczRTI3RQA=\",\"timestamp\":\"1764925335\",\"text\":{\"body\":\"?\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-05 09:02:17'),
(48, 'fbabf352-0ee7-4dc5-96cb-d606ab3b8ae0', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMDk4MEZDQkVDOTkxNkFGNkUzMgA=', 2, NULL, 'inbound', '{\"from\":\"919257086311\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMDk4MEZDQkVDOTkxNkFGNkUzMgA=\",\"timestamp\":\"1764928993\",\"text\":{\"body\":\"sir 140+60= 200\\/\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-05 10:03:15'),
(49, '9f146057-8145-4f9d-b8e5-e83fb586d3a7', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMkU0RjA2RDk1QUQ3RjZDNzJEAA==', 4, NULL, 'outbound', '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMkU0RjA2RDk1QUQ3RjZDNzJEAA==\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/png\"}}', 3, 'read', 0, NULL, NULL, '2025-12-05 13:06:34'),
(50, 'f921a90c-0934-45b1-bc0e-e21d6750b94d', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGQzc3MjVBOTgyRkNBMzBFRTE1RTMwQTUzNkQ1MTcA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGQzc3MjVBOTgyRkNBMzBFRTE1RTMwQTUzNkQ1MTcA\",\"timestamp\":\"1765103138\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-07 10:25:41'),
(51, 'e91d67fd-a6ea-4f87-968d-1dcf3162a773', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMkQzNjkyQjc2QTQzRUZCRUU3AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"Hello User.\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-07 10:25:43'),
(52, '89b07851-b0b0-4f58-a9ab-f69ddc952683', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTlCMDU2MjJFNkNFRDZDMTJEAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-07 10:25:57'),
(53, 'c01d1ddd-9f9b-403b-bfd2-3e961f17f6e7', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGNDMzNzAyNDQxOUVEMERCNzUzMkNBNjVEN0QyMEUA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGNDMzNzAyNDQxOUVEMERCNzUzMkNBNjVEN0QyMEUA\",\"timestamp\":\"1765103167\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-07 10:26:09'),
(54, '23d7a8ed-4f3a-48a8-b5cf-55f3d2f577f3', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOERBMTkwMTRGRTgzMDFBNTY5AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"Hello User.\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-07 10:26:10'),
(55, '3b8f41fc-3259-44f6-82c9-af722eb9202e', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgUMkEyQzk3RjFGN0M1MEVDNDBFMEIA', 3, NULL, 'inbound', '{\"from\":\"919257086309\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgUMkEyQzk3RjFGN0M1MEVDNDBFMEIA\",\"timestamp\":\"1765180259\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-08 07:51:03'),
(56, '64bd4458-81e6-477d-91ea-2c8503844add', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNDFFM0NCRDk3Mjc5MTkyNTk2AA==', 3, NULL, 'outbound', '{\"text\":{\"body\":\"Hello User.\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2025-12-08 07:51:05'),
(57, 'bb849769-f5a9-46fa-b4b8-b103cd39feec', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDhDQjFBRkQ1NTg3NzEwNEFDAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"\\u25b6\\ufe0f\\ud83d\\udd3d\\ud83d\\udd3cHi John, your mobile balance is {{1}}. Please recharge to avoid interruption\\u25b6\\ufe0f.\",\"footer\":\"jio corporation\"},\"buttons\":[{\"type\":\"URL\",\"text\":\"Recharge Now\",\"value\":\"http:\\/\\/abc.com\\/\",\"parameters\":[]}]}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-10 06:26:21'),
(58, '024355d6-d3d8-43c8-8611-77f605ecfb96', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTNCQkNDNEM4OTRCQjgwMDFBAA==', 4, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"\\u25b6\\ufe0f\\ud83d\\udd3d\\ud83d\\udd3cHi John, your mobile balance is {{1}}. Please recharge to avoid interruption\\u25b6\\ufe0f.\",\"footer\":\"jio corporation\"},\"buttons\":[{\"type\":\"URL\",\"text\":\"Recharge Now\",\"value\":\"http:\\/\\/abc.com\\/\",\"parameters\":[]}]}', NULL, 'read', 0, NULL, NULL, '2025-12-10 06:26:23'),
(59, '94e9a72b-67fe-4f4d-9a10-a79b76f5cde1', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxODUzNzM2MDNEQjkzRDYxRTI0ODFDMTNCMjRDRDgA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxODUzNzM2MDNEQjkzRDYxRTI0ODFDMTNCMjRDRDgA\",\"timestamp\":\"1765348673\",\"text\":{\"body\":\"test\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-10 06:37:55'),
(60, 'afd70b64-b8db-4fd8-aff7-baa4c129d3e7', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhgWM0VCMDEwQzFBQjRERkY1NUU5M0M3OAA=', 4, NULL, 'inbound', '{\"from\":\"919672520566\",\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhgWM0VCMDEwQzFBQjRERkY1NUU5M0M3OAA=\",\"timestamp\":\"1765349233\",\"text\":{\"body\":\"ok\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-10 06:47:14'),
(61, '1a3d7a4d-93f3-469b-9126-72801d989644', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVENzRDRDU4NUQ3QkRFQzkzQ0UwNjcyOTM5QjgwMzAA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVENzRDRDU4NUQ3QkRFQzkzQ0UwNjcyOTM5QjgwMzAA\",\"timestamp\":\"1765357069\",\"location\":{\"address\":\"2nd Floor, NK TOWER, Jaipur, 302012, RJ, IN\",\"latitude\":26.94585624,\"longitude\":75.7330994,\"name\":\"Dqot Solutions - App Development Company in India | Web Development Company in India| Digital Marketing Agency in India\",\"url\":\"https:\\/\\/www.dqotsolutions.com\\/\"},\"type\":\"location\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-10 08:57:51'),
(62, '7d5d9533-a9fb-47ba-ad49-35bf55e7a2df', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgUMkEzOUFDQzhERjUzOEREMDRCRjQA', 3, NULL, 'inbound', '{\"from\":\"919257086309\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgUMkEzOUFDQzhERjUzOEREMDRCRjQA\",\"timestamp\":\"1765537760\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-12 11:09:22'),
(63, '0bc0c232-1588-4726-902b-93c52a2f3393', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMDY0NUIyRDA0RDQyNUVCQkYzAA==', 3, NULL, 'outbound', '{\"text\":{\"body\":\"fsdfhj\"},\"type\":\"text\"}', NULL, 'delivered', 0, NULL, NULL, '2025-12-12 11:09:31'),
(64, 'eb9695c3-50b2-47e2-96f3-b4124ea8f329', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgUMkEwRTJDNDc3QTE4QURCQ0U2RTUA', 3, NULL, 'inbound', '{\"from\":\"919257086309\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgUMkEwRTJDNDc3QTE4QURCQ0U2RTUA\",\"timestamp\":\"1765537781\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-12 11:09:43'),
(65, 'ab84fd74-9fc2-415a-8956-c5d7096f826e', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMjM3Q0U2OTVBRkI3Nzg3QzE4AA==', 3, NULL, 'outbound', '{\"text\":{\"body\":\"Hello User.\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2025-12-12 11:09:45'),
(66, 'dc5015bf-22c7-4796-9e8e-53303ce71907', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyN0I3NkY4OTNDMEU0QzM0MzY5ODM0RjI5OTdCREEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyN0I3NkY4OTNDMEU0QzM0MzY5ODM0RjI5OTdCREEA\",\"timestamp\":\"1765604270\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-13 05:37:53'),
(67, '6a3d634c-487d-4b5d-b54d-a02555eb799a', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNUM4M0VGNDAxQzE4RUY1RTFFAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-13 05:38:50'),
(68, 'e79fe970-29b3-44ef-a0f7-d7e54f1ff90d', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3NzQ0NTg0REZBRUIzOENBMjI2QUIwNjcyODEzNzAA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3NzQ0NTg0REZBRUIzOENBMjI2QUIwNjcyODEzNzAA\",\"timestamp\":\"1765604338\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-13 05:39:00'),
(69, '7f909986-252d-45f0-a3d3-7e5ae1332b4e', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNTFFOTIyODE5NEI1MkE2QkRFAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"Hello User.\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-13 05:39:03'),
(70, '9489665d-5bb0-4cb8-b045-2d2b4fe85fe3', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU4NzcwMzhGNzU1RTBBQzQ1NjFGQjdENzdDREQxNEQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU4NzcwMzhGNzU1RTBBQzQ1NjFGQjdENzdDREQxNEQA\",\"timestamp\":\"1765610094\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-13 07:14:57'),
(71, 'a1f1b5a0-1caf-4bac-a832-ad8481bf2f2b', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDYwOUNEODlFMzdBRDlBMThCAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-13 07:15:27'),
(72, '06a1fb2c-1b21-41df-8dfa-2c5aa84ee4d4', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhggQUNDNTgzODBEOTE3OEZBNEQ5OUFFNEZFNzNBNzA3RTEA', 4, NULL, 'inbound', '{\"from\":\"919672520566\",\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhggQUNDNTgzODBEOTE3OEZBNEQ5OUFFNEZFNzNBNzA3RTEA\",\"timestamp\":\"1765781892\",\"text\":{\"body\":\"Hey\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-15 06:58:15'),
(73, 'c13d6256-cda8-47ae-875a-0e7f7fb014e8', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhggQUMxRDYzQzlGNzRGOTE2QURDQkRFODI5NDJDNTEwOTAA', 4, NULL, 'inbound', '{\"from\":\"919672520566\",\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAEhggQUMxRDYzQzlGNzRGOTE2QURDQkRFODI5NDJDNTEwOTAA\",\"timestamp\":\"1765781893\",\"text\":{\"body\":\"Man\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-15 06:58:16'),
(74, 'c556057e-4c0d-4d90-b0e3-6ade9925ba85', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTVCRDFERUU3QTdGMzU2MkRGAA==', 4, NULL, 'outbound', '{\"text\":{\"body\":\"hanji\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2025-12-15 06:58:32'),
(75, '40869149-47a7-43bb-a067-e24720aa7fc6', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGMDYwN0RDODU2RUUyQ0IzMDM1QzAyNUJEM0M1OEMA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGMDYwN0RDODU2RUUyQ0IzMDM1QzAyNUJEM0M1OEMA\",\"timestamp\":\"1765782814\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 07:13:36'),
(76, 'b5cc64c0-295c-4b55-a139-923824361b84', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQzgwOUYzOENGNUY4QjI1Q0FDAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 07:13:51'),
(77, 'de5d54a3-5661-43df-8bb6-2b74d02c00f4', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVERDg3MDY0MzkwMDAzMkNCQUREQ0YxOENEOEVGMEIA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVERDg3MDY0MzkwMDAzMkNCQUREQ0YxOENEOEVGMEIA\",\"timestamp\":\"1765783200\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 07:20:02'),
(78, '8f1f6064-4e59-45be-8cde-70721cf222cd', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2OTM0RUNBQTQ4MjVBNUJDNTA5RTY5NzVFMDI1OUEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2OTM0RUNBQTQ4MjVBNUJDNTA5RTY5NzVFMDI1OUEA\",\"timestamp\":\"1765783253\",\"text\":{\"body\":\"Good\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 07:20:54'),
(79, '28e16f98-8662-4a68-af47-aefff0b8d24c', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUwM0RBOENCNjgyMjIwOTMxOEQ0MjVGQjVBM0M3NTQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUwM0RBOENCNjgyMjIwOTMxOEQ0MjVGQjVBM0M3NTQA\",\"timestamp\":\"1765783498\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 07:25:00'),
(80, 'ab902017-a34c-4231-9b7e-449dc97779e3', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMEQ2RTFEOEMyMjBCMzMzMDkwAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"Hello User.\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 07:25:02'),
(81, '52811a0b-3a1c-47c9-9d9f-12695f15bd98', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDQjQ0OTg5MjY5QzRCOUY5RkRDNUIzN0RFNUE1NkIA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDQjQ0OTg5MjY5QzRCOUY5RkRDNUIzN0RFNUE1NkIA\",\"timestamp\":\"1765783832\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 07:30:34'),
(82, '6e479bae-aba5-4aee-95a4-e22536ab1fb0', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNjI5RTMyNjg1OUY1MjNFNEFDAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 07:32:20'),
(83, '63994cf0-ad60-4d95-9f10-d65318f319a4', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBRTJDQ0EzRENGQzdEMTMyQzY0NEQyMTQxM0YwRTgA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBRTJDQ0EzRENGQzdEMTMyQzY0NEQyMTQxM0YwRTgA\",\"timestamp\":\"1765792016\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 09:46:58'),
(84, '5e87af61-042f-42b3-85b4-6b327e84b741', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3Rjg2NDQwQTgxQjM5MTE1NzYzRTgyMEI0RTBDREQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3Rjg2NDQwQTgxQjM5MTE1NzYzRTgyMEI0RTBDREQA\",\"timestamp\":\"1765792764\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 09:59:26'),
(85, '95131b67-eeb9-4334-b431-791412161468', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMzFEOTlBRjlCM0Q4QzlGOEQxAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"53\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 09:59:45'),
(86, '0e3a30c7-860a-4e45-a69f-cda410969cbe', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1RjFBQzJGOUI1MkQ2RkY4QUUwN0M2RDZDMEU4RDEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1RjFBQzJGOUI1MkQ2RkY4QUUwN0M2RDZDMEU4RDEA\",\"timestamp\":\"1765793358\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 10:09:21'),
(87, '01041215-a79d-4856-8c9f-c06730b03389', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5ODU2NkVCMTZBM0VGRjM4MDI4RjJENzkxRDhFODQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5ODU2NkVCMTZBM0VGRjM4MDI4RjJENzkxRDhFODQA\",\"timestamp\":\"1765793682\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 10:14:44'),
(88, 'ab3eda9f-ebb8-4e86-9c13-3d61d46aaea9', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzMzFFQ0JFMzM0N0FBMUZBQzU3MjgyQzZEMDM1QUEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzMzFFQ0JFMzM0N0FBMUZBQzU3MjgyQzZEMDM1QUEA\",\"timestamp\":\"1765795682\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 10:48:04'),
(89, 'b19fcbb1-c8c0-4320-bcb2-05486e6e0126', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVFNkJGNkI1RjAzODRCMzk0QTg0ODAyQjY0NkExOTEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVFNkJGNkI1RjAzODRCMzk0QTg0ODAyQjY0NkExOTEA\",\"timestamp\":\"1765795849\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 10:50:50'),
(90, '7a33dae5-d7cc-4d18-9780-d95a8870f853', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTYyNzk2ODEwOTU2ODc2RDQ0AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"Hello User.\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 10:50:52'),
(91, 'f2964b7f-50ac-41ce-8e8c-abeeffc464c8', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMjQ3Rjk0QzcyQUQ4REZCNTFFAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 10:51:24'),
(92, '00a0dfb8-26fb-4b2c-a99d-fab993a04039', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0NkVENDY2QUQwNjgzREYyNjE5OTIyMTE3QzQwODcA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0NkVENDY2QUQwNjgzREYyNjE5OTIyMTE3QzQwODcA\",\"timestamp\":\"1765795969\",\"text\":{\"body\":\"Hello g\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 10:52:50'),
(93, 'd416b06e-0dbe-4563-b8d7-cfb0baf8b8b9', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSOUY5N0MzRkJEMDNBMjU4MDFFAA==', 4, NULL, 'outbound', '{\"text\":{\"body\":\"hello\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2025-12-15 10:54:12'),
(94, 'a43e5364-e102-49f8-8cfe-bde66f13bbd0', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDNGRTc2QTkzMEFFOTNBMTQzAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"fcdsfsdf\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:09:10'),
(95, '06874c5a-92ec-4c53-978f-3785db7189be', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBMEFCMzRDNTUxQTk5MkE0MDFBRURCMTkzNkQyQzQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBMEFCMzRDNTUxQTk5MkE0MDFBRURCMTkzNkQyQzQA\",\"timestamp\":\"1765796980\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:09:42'),
(96, 'da39a53f-81ad-4170-8eac-f7b80f143ee0', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUNBQ0JFOTcxMkUwRjhBNjU2AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"sdfnsdfnsdf\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:28:43'),
(97, '06988967-58ab-466d-98c5-7d8475878b6c', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBNjhCMDU5OTcyNjQxQjVFQUQ5QjJEQ0U1OTY1RTcA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBNjhCMDU5OTcyNjQxQjVFQUQ5QjJEQ0U1OTY1RTcA\",\"timestamp\":\"1765798154\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:29:16'),
(98, 'ca9baa76-b039-4418-8436-686a1fce1392', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCOTY3QzRBM0YzRDY3RjdGRTg1RDMwQzI1MTdCNjcA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCOTY3QzRBM0YzRDY3RjdGRTg1RDMwQzI1MTdCNjcA\",\"timestamp\":\"1765798698\",\"text\":{\"body\":\"Hlloo\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:38:20'),
(99, '4cb00257-dfc4-4a5d-a06a-e6e343340cf1', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQjBDNENDRDhEQ0E3NUQzQjU4AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"hello\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:38:32'),
(100, '8e418800-b9cc-416e-b46f-2df3b5b3cda7', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSQTlDRTc5ODcyOEZCOUY4MUEwAA==', 4, NULL, 'outbound', '{\"text\":{\"body\":\"hanji\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2025-12-15 11:42:36'),
(101, '310dcb16-259a-4eff-87eb-72525b39adf3', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUMwRjkxMTFDQTVEN0RERjdFAA==', 1, NULL, 'outbound', '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUMwRjkxMTFDQTVEN0RERjdFAA==\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/png\"}}', 4, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:43:47'),
(102, 'c40800be-faa5-4bd1-8e57-e101c5698c91', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBRkJDOTcwMDYzMUUxMzhCMTY5QTA2M0VFNUY1NDMA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBRkJDOTcwMDYzMUUxMzhCMTY5QTA2M0VFNUY1NDMA\",\"timestamp\":\"1765799039\",\"text\":{\"body\":\"Kya h\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:44:01'),
(103, '20639843-9b6b-426b-9e13-c56bf268f0e1', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGQ0RDMzA5OTlDNkUyQUQ3RkVBRkE0MUFCRjczRjMA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGQ0RDMzA5OTlDNkUyQUQ3RkVBRkE0MUFCRjczRjMA\",\"timestamp\":\"1765799058\",\"text\":{\"body\":\"Okay\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:44:19'),
(104, '395608f3-8bec-48bc-8c7c-98b87daac00d', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVFRDk2QTdFREFGRkJGQ0VDNDNENkQ3MDE1QUI1NTYA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVFRDk2QTdFREFGRkJGQ0VDNDNENkQ3MDE1QUI1NTYA\",\"timestamp\":\"1765799068\",\"text\":{\"body\":\"Good\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:44:30'),
(105, '77e56f57-af45-4919-b418-4ddd95f725d0', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMzNGNjU3RDVCNEM0MERBNjEzAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"s\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:46:21'),
(106, '380b077d-d649-4934-aa08-e280f1c4fce8', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMDA5MkQzRDJGNURCMzhCRUJEAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"23\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:47:10'),
(107, '35ade0d7-0782-4b3d-9dba-98ccd86981d4', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUI5QjQ5NERGNTk4RDg3ODc4AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"https:\\/\\/waapi.dqotdemo.in\\/chats\\/87f05c6a-f40b-4a3a-9681-d13cddcd6f44?page=1\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:48:46'),
(108, '614808c5-7bda-4bf6-b77f-2808c6d31c07', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2ODg4MjkzQjVGOEVGQTlGQUM2NEEzMDk0NDUzQjQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2ODg4MjkzQjVGOEVGQTlGQUM2NEEzMDk0NDUzQjQA\",\"timestamp\":\"1765799343\",\"text\":{\"body\":\"Ohk\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 11:49:04'),
(109, '8b91fc0c-ddaa-4e78-adfc-a2e942bb7765', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgWM0VCMDMxNDRCM0NBQzc2RDFDMTRBNgA=', 3, NULL, 'inbound', '{\"from\":\"919257086309\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgWM0VCMDMxNDRCM0NBQzc2RDFDMTRBNgA=\",\"timestamp\":\"1765799812\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-15 11:56:55'),
(110, 'd744ea90-a820-4d37-89c6-7fc658af005d', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgWM0VCMEUzQkJBOUFDMTQ3QTE3ODVDMgA=', 3, NULL, 'inbound', '{\"from\":\"919257086309\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgWM0VCMEUzQkJBOUFDMTQ3QTE3ODVDMgA=\",\"timestamp\":\"1765799906\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-15 11:58:28'),
(111, '057c863a-d64a-49ea-a81a-b723b9288334', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSRTMxQzE4NkM1NTQ2NkJGQkE1AA==', 3, NULL, 'outbound', '{\"text\":{\"body\":\"Hello DQOT Admin.\\nHow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2025-12-15 11:58:29'),
(112, '6d8f3430-3407-4270-870c-d1f728f79cf8', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMjdDNEM2QjM5Q0VCMDhDQkE5AA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is offer msg for dqot \\r\\nuse this code #abc123\\r\\nfor get 20% discount on every product on dqot website.\",\"footer\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"Test\"}]},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"+919636963365\",\"parameters\":[]},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"abc123\"}]},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-15 12:14:26'),
(113, '21f41926-6244-4b93-aa3f-44ac2ac28e86', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSQzM5NEI5REU5QTlFRDg3REU3AA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is offer msg for dqot \\r\\nuse this code #abc123\\r\\nfor get 20% discount on every product on dqot website.\",\"footer\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"Test\"}]},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"+919636963365\",\"parameters\":[]},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"abc123\"}]},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'failed', 0, NULL, NULL, '2025-12-15 12:14:27'),
(114, '1367f70a-21fd-4231-addf-0d588a76e82b', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTg2MzZERkY4QUQ0QTNBQ0YzAA==', 3, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is offer msg for dqot \\r\\nuse this code #abc123\\r\\nfor get 20% discount on every product on dqot website.\",\"footer\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"Test\"}]},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"+919636963365\",\"parameters\":[]},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"abc123\"}]},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'read', 0, NULL, NULL, '2025-12-15 12:14:29'),
(115, '610df0f4-69bf-493c-9344-48786148f3ce', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODZFMzIzRUIyOTJDNTJDMEIwAA==', 4, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is offer msg for dqot \\r\\nuse this code #abc123\\r\\nfor get 20% discount on every product on dqot website.\",\"footer\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"Test\"}]},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"+919636963365\",\"parameters\":[]},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"abc123\"}]},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'read', 0, NULL, NULL, '2025-12-15 12:14:30'),
(116, '8d2df51c-795c-42b6-95b9-55b08b16a198', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzRDM5MzA5NkY5OTdCODk3ODREQ0I1RjNDNzM1QTAA', 1, NULL, 'inbound', '{\"context\":{\"from\":\"15551948235\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMjdDNEM2QjM5Q0VCMDhDQkE5AA==\"},\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzRDM5MzA5NkY5OTdCODk3ODREQ0I1RjNDNzM1QTAA\",\"timestamp\":\"1765800939\",\"type\":\"button\",\"button\":{\"payload\":\"Test\",\"text\":\"share\"}}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 12:15:41'),
(117, '8e9003ee-f08c-4ad6-90e8-fedc99fde0e2', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5M0VDRUQxQzMwQjdBNEM4MjVGRDBCMUEyN0VFMjgA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5M0VDRUQxQzMwQjdBNEM4MjVGRDBCMUEyN0VFMjgA\",\"timestamp\":\"1765800981\",\"text\":{\"body\":\"abc123\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-15 12:16:23'),
(118, 'e0ec1898-7540-4833-9092-ddfcafd77a71', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3N0RGRkZDNDE4MzYzNjFGQzZFM0IyOEJBMjYxQ0QA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3N0RGRkZDNDE4MzYzNjFGQzZFM0IyOEJBMjYxQ0QA\",\"timestamp\":\"1765887866\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:24:30'),
(119, '33d5e89b-4e0e-43e7-bf57-fc1dd850ccc2', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxRERDMjIzN0IyNTBFODU1MUM5MDdBNzA2MjkyMDcA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxRERDMjIzN0IyNTBFODU1MUM5MDdBNzA2MjkyMDcA\",\"timestamp\":\"1765887878\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:24:40'),
(120, '212202bf-5dc9-4a20-9418-90253b01d577', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNzBDRjA5QUNEMEMyMDZGRTIzAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"Hello Test test.\\nHow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:24:41'),
(121, 'bf584dd8-ac82-484a-9ea3-ee26bb526e6f', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSREE3MUE0NDdGN0Y3MTRENThDAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"sfhskfjskdfg\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:24:48'),
(122, '12f2a43b-b3fb-4eab-a952-5784a0a421e0', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkU2QjRCMjcyQTZBNDc0RkVFAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"fsdfsdjfsdjf\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:24:55'),
(123, '42d7170b-094f-4fd5-b29c-be91a8758f30', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSN0RFODNEQzVCOUM4MkM3RUY3AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"345rt5y6t54\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:25:03'),
(124, '700d165b-38f0-4b37-827e-e346ac962bbd', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDNkFFMTI2NTYwQkU1QTZGQ0IxQ0FENDdGQjI3RjcA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDNkFFMTI2NTYwQkU1QTZGQ0IxQ0FENDdGQjI3RjcA\",\"timestamp\":\"1765887906\",\"text\":{\"body\":\"Bshsj\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:25:09'),
(125, 'f02e22b9-69b5-4d16-a13b-7c3aeaabb849', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkIyM0IxOTY4ODRFODJFMTc1AA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is offer msg for dqot \\r\\nuse this code #abc123\\r\\nfor get 20% discount on every product on dqot website.\",\"footer\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"sdfsdjfsdfgjsdf\"}]},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"+919636963365\",\"parameters\":[]},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"abc123\"}]},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:26:24'),
(126, '4c5cc951-d057-4c81-b7a0-edb19690a036', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTk2RUVGMUI5RjI4QUYwMjZEAA==', 4, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is offer msg for dqot \\r\\nuse this code #abc123\\r\\nfor get 20% discount on every product on dqot website.\",\"footer\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"sdfsdjfsdfgjsdf\"}]},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"+919636963365\",\"parameters\":[]},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"abc123\"}]},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'read', 0, NULL, NULL, '2025-12-16 12:26:25'),
(127, 'ef85597b-89b7-4934-bf0f-c6714a670a80', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyODA5ODREQjc1MDMyNTYyREE4NjQzNzJGNzZCMkQA', 1, NULL, 'inbound', '{\"context\":{\"from\":\"15551948235\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkIyM0IxOTY4ODRFODJFMTc1AA==\"},\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyODA5ODREQjc1MDMyNTYyREE4NjQzNzJGNzZCMkQA\",\"timestamp\":\"1765888014\",\"type\":\"button\",\"button\":{\"payload\":\"sdfsdjfsdfgjsdf\",\"text\":\"share\"}}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:26:55'),
(128, 'b42dbe72-7a9d-4edf-a1a1-dd06408bf21f', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyNkQ4OTA5QTM3NEY1NjI2OTc4OUI5Rjk2NTNGM0YA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyNkQ4OTA5QTM3NEY1NjI2OTc4OUI5Rjk2NTNGM0YA\",\"timestamp\":\"1765888024\",\"text\":{\"body\":\"abc123\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:27:06'),
(129, '665a2c8f-6eb7-4237-baa2-dc25d422adf4', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVEMTRDNUY2RkNBOEJEMUMxNDUxRDIwRDAxRkU4NkYA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVEMTRDNUY2RkNBOEJEMUMxNDUxRDIwRDAxRkU4NkYA\",\"timestamp\":\"1765888139\",\"text\":{\"body\":\"share\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:29:00'),
(130, '3dceb1ab-e5b7-4f63-8b29-9a93a49f0997', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNDMxODBBMDZGMEEzMEYwMEZDAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"fsdfsdfsdffffffffddddddddddddddddddddddddddddddddd\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:29:01');
INSERT INTO `chats` (`id`, `uuid`, `organization_id`, `wam_id`, `contact_id`, `user_id`, `type`, `metadata`, `media_id`, `status`, `is_read`, `deleted_by`, `deleted_at`, `created_at`) VALUES
(131, '65efeb68-2f3e-4fce-99de-59dc18dfbf0e', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUY4NTdGOTdDNDk5NDlEMDRCAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is offer msg for dqot \\r\\nuse this code #abc123\\r\\nfor get 20% discount on every product on dqot website.\",\"footer\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"gdfgdfgdfgdfg\"}]},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"+919636963365\",\"parameters\":[]},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"abc123\"}]},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:31:30'),
(132, 'c0a4286e-665c-432a-adfd-20334d380d5d', 1, 'wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSOEQ4NTBDRUYyMkI3NkQwQzcxAA==', 4, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is offer msg for dqot \\r\\nuse this code #abc123\\r\\nfor get 20% discount on every product on dqot website.\",\"footer\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"gdfgdfgdfgdfg\"}]},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"+919636963365\",\"parameters\":[]},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"abc123\"}]},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'sent', 0, NULL, NULL, '2025-12-16 12:31:31'),
(133, 'd3c964e1-d92d-467e-a0d0-214b96b9d8b2', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCNjFFQUZDMEIwNzJGNTEyQTFERUQ0MzIzODQ2QjAA', 1, NULL, 'inbound', '{\"context\":{\"from\":\"15551948235\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUY4NTdGOTdDNDk5NDlEMDRCAA==\"},\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCNjFFQUZDMEIwNzJGNTEyQTFERUQ0MzIzODQ2QjAA\",\"timestamp\":\"1765888556\",\"type\":\"button\",\"button\":{\"payload\":\"gdfgdfgdfgdfg\",\"text\":\"share\"}}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2025-12-16 12:35:57'),
(134, '26e71f8d-6989-42c6-9438-7dcb2df56e74', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5OUNEQjk4NTYyNUIyNTI1NzcwQzI5RTAzOTgzNjUA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5OUNEQjk4NTYyNUIyNTI1NzcwQzI5RTAzOTgzNjUA\",\"timestamp\":\"1765948638\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-17 05:17:20'),
(135, '6a140e18-acd5-4f8e-875b-ec12cc5775fb', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUFGQzgxRjQ2NDZFQzk4QUE5AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"Hello Test test.\\nHow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-17 05:17:22'),
(136, '5fe0785a-dda9-4c2c-8b25-86963d55454d', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2MDE2RUFDRENFRTlDQzQxNzE0OUE0N0I1QkQ3QkIA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2MDE2RUFDRENFRTlDQzQxNzE0OUE0N0I1QkQ3QkIA\",\"timestamp\":\"1765948657\",\"text\":{\"body\":\"Share\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-17 05:17:38'),
(137, '39ac82ec-6086-4df4-a22b-083536396bc8', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUU3RTkxOTY4QTk5QzA1MDVCAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"fsdfsdfsdffffffffddddddddddddddddddddddddddddddddd\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-17 05:17:39'),
(138, 'e86684fd-3548-4ef4-88a3-af573937953a', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUwRTM0MkVDMjIzNzc4RDY4RTJDQjg2OEU3NDIxMzUA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUwRTM0MkVDMjIzNzc4RDY4RTJDQjg2OEU3NDIxMzUA\",\"timestamp\":\"1765948694\",\"text\":{\"body\":\"Test\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-17 05:18:16'),
(139, '71d1c703-26c5-414f-9e70-973ad5b01f89', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2OEMwMTVBRkEyREQyRDI5REZCNzMyRjA4NTlFNkMA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2OEMwMTVBRkEyREQyRDI5REZCNzMyRjA4NTlFNkMA\",\"timestamp\":\"1765958382\",\"text\":{\"body\":\"Hill\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-17 07:59:44'),
(140, 'ad8dc87c-ea55-4cc2-b578-78df0e7bb469', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBNDcyRUNGNzk4RTlBMDc4OTdCNkYzMjZDMjE1RTEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBNDcyRUNGNzk4RTlBMDc4OTdCNkYzMjZDMjE1RTEA\",\"timestamp\":\"1766124583\",\"text\":{\"body\":\"Heel\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-19 06:09:45'),
(141, 'd0561e60-dd02-495a-aef9-69e4af53a278', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkYwMzcwQjg2Q0Y5RTNCNTM1AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"dasdsadsadsad\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-19 06:26:42'),
(142, '70a6a54b-e431-4d37-bd7c-e258a0de1bf9', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1OTJCQzc1MUNBQTYwRjI3RjZBRTE0QkU3RENFMEEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1OTJCQzc1MUNBQTYwRjI3RjZBRTE0QkU3RENFMEEA\",\"timestamp\":\"1766125968\",\"text\":{\"body\":\"*this is demo from admin panal* this is demo from admin panal *this is demo from admin panal* this is demo from admin panal\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-19 06:32:50'),
(143, '00b12fef-c76c-4974-9a7c-d47ddd4efe45', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU4MEI3RTBDMTg5OEM1OEZERURFRUIxQjBBOTY5MTEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU4MEI3RTBDMTg5OEM1OEZERURFRUIxQjBBOTY5MTEA\",\"timestamp\":\"1766126148\",\"text\":{\"body\":\"Gghhhhhhjhhjhjhhjjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhuu\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-19 06:35:49'),
(144, '6a3b5338-d6d4-4931-8461-716a22a0f827', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCNDNDMUJDQTM4NDFGRTEzRTMyRDIwNTFFQzZDNkQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCNDNDMUJDQTM4NDFGRTEzRTMyRDIwNTFFQzZDNkQA\",\"timestamp\":\"1766734682\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 07:38:05'),
(145, '584c033c-6205-4489-bb4b-002c3c03d515', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0NkZEQkRDNDczODRCOEZFMDYzRjlFODQ2M0NGQjIA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0NkZEQkRDNDczODRCOEZFMDYzRjlFODQ2M0NGQjIA\",\"timestamp\":\"1766740436\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 09:13:58'),
(146, '8a6f74b8-f165-4866-8ea0-77484fa9a93b', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVEMkE5RDYxQzZCNDJGNTk5NEI0MTc3NjY4NUUyRTgA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVEMkE5RDYxQzZCNDJGNTk5NEI0MTc3NjY4NUUyRTgA\",\"timestamp\":\"1766740598\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 09:16:40'),
(147, 'bcce565b-b3af-4127-844a-662c150f22aa', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3NjE4Qzk2QjVDQjRBM0NBQURDODYxNzU4MTcwMjkA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3NjE4Qzk2QjVDQjRBM0NBQURDODYxNzU4MTcwMjkA\",\"timestamp\":\"1766740691\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 09:18:13'),
(148, '6ef343e7-1679-4744-83ee-fd4c9649aa4d', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5MzMyNUM3OUZCMDYzRTMwMDMzRkVBMDE3RkIxQjQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5MzMyNUM3OUZCMDYzRTMwMDMzRkVBMDE3RkIxQjQA\",\"timestamp\":\"1766740714\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 09:18:36'),
(149, 'f0edfb5e-5a0e-4817-b695-e8b12a918c9e', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU4RDNDRjYwMEI4NDM4MTA4NkQ0RDczQUE3RjE5QjgA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU4RDNDRjYwMEI4NDM4MTA4NkQ0RDczQUE3RjE5QjgA\",\"timestamp\":\"1766741079\",\"text\":{\"body\":\"Hlo\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 09:24:41'),
(150, '1c977faf-6b12-4ac6-b04c-984991f449e6', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgUMkEwNjZCNzU3QTJCNTUxNERGRkIA', 3, NULL, 'inbound', '{\"from\":\"919257086309\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgUMkEwNjZCNzU3QTJCNTUxNERGRkIA\",\"timestamp\":\"1766741415\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2025-12-26 09:30:19'),
(151, 'd952fddd-feaf-4d19-b90f-9ddd5687550e', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCQzk4NkYwRjYyRDkwNDA1M0UxQTZGNTc5RkE3MDQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCQzk4NkYwRjYyRDkwNDA1M0UxQTZGNTc5RkE3MDQA\",\"timestamp\":\"1766741936\",\"text\":{\"body\":\"Hlo\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 09:38:58'),
(152, '802913b5-229a-4c17-83ba-d21414fb4db4', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUM5Njg0NTAxQjc0RDRDNjgxAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"23\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-26 09:40:14'),
(153, '813170e4-501e-4daa-a63f-e7115a2c4c0d', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzMEVCRUYzNzFFMTZCNTJBNzdFM0I3MjNFQ0E5NEQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzMEVCRUYzNzFFMTZCNTJBNzdFM0I3MjNFQ0E5NEQA\",\"timestamp\":\"1766742767\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 09:52:49'),
(154, '77191314-2afa-4b6c-a32a-45d9d60cc9ba', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzQzhDMUREQ0Q0OERFRDFBNUI0QjE0NTQxQTZCRDgA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzQzhDMUREQ0Q0OERFRDFBNUI0QjE0NTQxQTZCRDgA\",\"timestamp\":\"1766742782\",\"text\":{\"body\":\"Hhlo\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 09:53:04'),
(155, 'fbcab3b4-1534-471a-8481-120c675805ac', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3RTIzRjQzRDMyNjUyNEM5QkVCRjc2QjZCNDdEQzAA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3RTIzRjQzRDMyNjUyNEM5QkVCRjc2QjZCNDdEQzAA\",\"timestamp\":\"1766743117\",\"text\":{\"body\":\"G\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 09:58:39'),
(156, '70001e35-206f-4a29-8628-d5e879314386', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1N0NCMTU1NDM4RUE5REY0RTU0RTA5OTJFNTE5ODQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1N0NCMTU1NDM4RUE5REY0RTU0RTA5OTJFNTE5ODQA\",\"timestamp\":\"1766744032\",\"text\":{\"body\":\"Han\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 10:13:54'),
(157, '191f50ff-12b8-4166-a0b7-a637b86d48f7', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2QTE5RDdDQTY0NDBCMTM0OUU5MURFMUY0M0VFMDAA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2QTE5RDdDQTY0NDBCMTM0OUU5MURFMUY0M0VFMDAA\",\"timestamp\":\"1766745619\",\"text\":{\"body\":\"G\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 10:40:21'),
(158, '57e7917e-c150-4c02-88d8-9dfe4c70407a', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVFNzZFQjBBNjdEQTFGMzUwMTFFNkE0NDdBOEVDMzkA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVFNzZFQjBBNjdEQTFGMzUwMTFFNkE0NDdBOEVDMzkA\",\"timestamp\":\"1766745746\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 10:42:27'),
(159, '8a8fd741-7a96-4719-9e4b-84f1b76ffaf0', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDODJBMjk2RDlFNDNFMjRFNjVDNUU0Nzg0MkI2RDcA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDODJBMjk2RDlFNDNFMjRFNjVDNUU0Nzg0MkI2RDcA\",\"timestamp\":\"1766746028\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-26 10:47:10'),
(160, 'e7baf5a0-a943-45e8-b755-a84bdab022af', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxQjk4NTgxRkU0RDQ3RjhENjE1RTQxNjcyODE1MEEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxQjk4NTgxRkU0RDQ3RjhENjE1RTQxNjcyODE1MEEA\",\"timestamp\":\"1766814238\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-27 05:44:01'),
(161, '72206108-cf1c-4ed9-bfa8-1d680b5ddb3d', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNzc2NzIxODcwNDkwNkQyNTY3AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"\\ud83d\\udc6c\\ud83d\\udc6c\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-27 05:46:34'),
(162, 'd3477860-afd5-4b9a-8058-fe8233a9a940', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGQzQ4QjU4RDg2ODA5Q0IxQTYzNjhBQjYwMkQ4NzkA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGQzQ4QjU4RDg2ODA5Q0IxQTYzNjhBQjYwMkQ4NzkA\",\"timestamp\":\"1766820155\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-27 07:22:37'),
(163, '34827519-1ee8-4366-86b5-7b682adab37a', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTk3RjM1QjFFNDFGNDg5NjE3AA==', 1, 7, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is offer msg for dqot \\nuse this code abc123\\nfor get 20 discount on every product on dqot website.\",\"footer\":\"powered by DQOT\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\",\"value\":\"share\"},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"value\":\"call now\"},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"value\":\"Copy offer code\"},{\"type\":\"URL\",\"text\":\"visit now\",\"value\":\"visit now\"}]}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-27 11:18:39'),
(164, 'daa9db9b-2631-46ca-9902-eafb49992fbe', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3RDFDOUUyMDQzMDI1NUI3MDFFRjgyNTI2NEEzMzUA', 1, NULL, 'inbound', '{\"context\":{\"from\":\"15551948235\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTk3RjM1QjFFNDFGNDg5NjE3AA==\"},\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU3RDFDOUUyMDQzMDI1NUI3MDFFRjgyNTI2NEEzMzUA\",\"timestamp\":\"1766834504\",\"type\":\"button\",\"button\":{\"payload\":\"https:\\/\\/waapi.dqotdemo.in\\/login\",\"text\":\"share\"}}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-27 11:21:46'),
(165, '4804c2a1-04f6-49c0-97d8-a9a31e314305', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5NERFOUZCNjNEMDdBOTlBQzcwNDlBODJDQkI1QkIA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5NERFOUZCNjNEMDdBOTlBQzcwNDlBODJDQkI1QkIA\",\"timestamp\":\"1767072698\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-30 05:31:41'),
(166, 'b08ea5cc-73a4-4751-8973-ffe1929842f2', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyMjg4NEIzNTIwRTAxODk0ODkyQUNDRDhBQThGNTQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyMjg4NEIzNTIwRTAxODk0ODkyQUNDRDhBQThGNTQA\",\"timestamp\":\"1767072708\",\"text\":{\"body\":\"Hlo\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-30 05:31:50'),
(167, '1b5fc823-4d3e-4790-8fc9-55493fb1d605', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGMTJDNUIxMzZFN0VBMTk0OTZBMkJFRjdCNEFBNjAA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGMTJDNUIxMzZFN0VBMTk0OTZBMkJFRjdCNEFBNjAA\",\"timestamp\":\"1767072725\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-30 05:32:07'),
(168, '578796f1-c4ae-4f00-8a0e-6492cb2752e7', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVERUFDNEY5MzlBMzU2NDg3QkFEMDQwQUU1OEZERTkA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVERUFDNEY5MzlBMzU2NDg3QkFEMDQwQUU1OEZERTkA\",\"timestamp\":\"1767072784\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-30 05:33:07'),
(169, '32b4b3bb-a2c4-4e4f-9b7b-9dada07e8812', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDMjlGNjdCNjlENkE4NUZBOUMzNjVEQ0QyN0I0MUUA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDMjlGNjdCNjlENkE4NUZBOUMzNjVEQ0QyN0I0MUUA\",\"timestamp\":\"1767074267\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-30 05:57:49'),
(170, 'd4a65d71-faa2-4d2d-817e-3dbea8d2d010', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNDMzMzg5NDlCMUFFREQ4MDczAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"Hello Test test.\\nHow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-30 05:57:51'),
(171, '918a11df-3a1d-44e5-8b5e-21b5d6860fa0', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5MDc4MDhGQjFENjFFMkNBMUQ1MkU1MjkyMEY5OTIA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU5MDc4MDhGQjFENjFFMkNBMUQ1MkU1MjkyMEY5OTIA\",\"timestamp\":\"1767078434\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-30 07:07:16'),
(172, 'f813ec60-5501-43d6-8bc3-eb21e8bac98c', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGMkE2MkVDQUM4MUEwMDQ0ODM1RUJBNjFDNzUxRDQA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGMkE2MkVDQUM4MUEwMDQ0ODM1RUJBNjFDNzUxRDQA\",\"timestamp\":\"1767079186\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2025-12-30 07:19:48'),
(173, 'facc55d6-908f-4ab1-a907-b1dfb4790ca2', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUMxQkMxMEUwRTBEQ0Q5NThBAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"https:\\/\\/everydayhomegarden.com\\/7-tiny-house-ideas-for-small-spaces\\/\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-30 10:19:45'),
(174, 'f8344627-10a3-41b4-aabc-28ca25867f34', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDc2RENCRTIwMUY4MURFRkU4AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"dasdsda\"},\"type\":\"text\"}', NULL, 'read', 0, 1, '2026-01-05 07:55:40', '2025-12-30 11:13:51'),
(175, 'bab916de-b436-42d8-b0a5-77b368e6dc1d', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1NTE4ODg4MDlCOTFFQkZDNUY3OUZCMzZDOUVGNTEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1NTE4ODg4MDlCOTFFQkZDNUY3OUZCMzZDOUVGNTEA\",\"timestamp\":\"1767335580\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 06:33:04'),
(176, '344a620a-8119-4672-ac09-c8997d4bb4e6', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVEQkQyMzgyNzVDNzBEMUYyOTk3OEIwQTA5RjU2QzYA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVEQkQyMzgyNzVDNzBEMUYyOTk3OEIwQTA5RjU2QzYA\",\"timestamp\":\"1767335696\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 06:34:58'),
(177, '8c01fce0-8b1d-4293-9e45-ef653b21abfd', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzQTQ1RjA3NjIxRjcxMURGN0E1MEUxRTcxRjJEMDUA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzQTQ1RjA3NjIxRjcxMURGN0E1MEUxRTcxRjJEMDUA\",\"timestamp\":\"1767335852\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 06:37:34'),
(178, '8bebd395-6b41-4443-b796-b0814a1ff57c', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0QjVBNDcwMUY3OUM4REIxMDQ4MzQ4NjQ1NENEMjAA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0QjVBNDcwMUY3OUM4REIxMDQ4MzQ4NjQ1NENEMjAA\",\"timestamp\":\"1767335976\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 06:39:37'),
(179, '1942b82e-9849-42dd-b7f2-2164a94b82eb', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDRDNBREY3QTM3REZDQkI2QzEyNzMxMjI5RTUzNUMA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDRDNBREY3QTM3REZDQkI2QzEyNzMxMjI5RTUzNUMA\",\"timestamp\":\"1767336058\",\"text\":{\"body\":\"Hlo\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 06:40:59'),
(180, '211b5d9a-eb1b-4f6e-87f3-8c88a6be90b6', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCMzZDOTEwRDQ1NjI2NjFFRDkxQkJCMDk5NkIyMDUA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCMzZDOTEwRDQ1NjI2NjFFRDkxQkJCMDk5NkIyMDUA\",\"timestamp\":\"1767336396\",\"text\":{\"body\":\"Yes\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 06:46:37'),
(181, '5ac036ce-dccd-4bd7-8eba-bd0fcfa0f834', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxNjJEQkFCMUQ5QjEyRDlERkM1RUVFMzY4QzhFODEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxNjJEQkFCMUQ5QjEyRDlERkM1RUVFMzY4QzhFODEA\",\"timestamp\":\"1767336755\",\"text\":{\"body\":\"Yessss\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 06:52:37'),
(182, 'ac901623-9e34-4c0b-986a-61f4e552467b', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxREY4Q0FGNEM3QTEwM0Q0NUE1MUZBQzhBOTkyNDkA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxREY4Q0FGNEM3QTEwM0Q0NUE1MUZBQzhBOTkyNDkA\",\"timestamp\":\"1767337395\",\"text\":{\"body\":\"Hs\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 07:03:16'),
(183, 'a9186a0a-e5de-48de-8562-1643977b2899', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBOTQ2RjVCQURFNzgyRDlDRTkyNDE1N0JBQjRFQUIA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBOTQ2RjVCQURFNzgyRDlDRTkyNDE1N0JBQjRFQUIA\",\"timestamp\":\"1767337691\",\"text\":{\"body\":\"Hss\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 07:08:13'),
(184, 'f740bad1-812f-43e4-8d5a-900e6648d810', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBODU2RTY0NEMzQ0RBQTk2NDMzRERFMTgyRUY3NTgA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBODU2RTY0NEMzQ0RBQTk2NDMzRERFMTgyRUY3NTgA\",\"timestamp\":\"1767337768\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 07:09:30'),
(185, '3234b132-63dc-4032-8043-7d44dcd80d76', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyRTUxOTU0MDQxNDE4OUQ3QTU5M0IxNjlFRjYxQUYA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyRTUxOTU0MDQxNDE4OUQ3QTU5M0IxNjlFRjYxQUYA\",\"timestamp\":\"1767337786\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 07:09:47'),
(186, '5684a6d5-603b-4070-9564-ef36b0a58775', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDOEYxQjY3NUI2QjNGODIxRDBCRjg3MzZDNUE1NEYA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDOEYxQjY3NUI2QjNGODIxRDBCRjg3MzZDNUE1NEYA\",\"timestamp\":\"1767337847\",\"text\":{\"body\":\"Hlo\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 07:10:48'),
(187, '09290e13-dab8-45fc-8b34-c7491cbe54a8', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgUMkFEODVBRkMzNDBDNTNGRDIzNDkA', 3, NULL, 'inbound', '{\"from\":\"919257086309\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAEhgUMkFEODVBRkMzNDBDNTNGRDIzNDkA\",\"timestamp\":\"1767338038\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-02 07:14:00'),
(188, '90a893c3-5811-4c63-9ea0-181792aefb73', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMTVBQkY5RjgyOTExNDRCQjFDAA==', 3, NULL, 'outbound', '{\"text\":{\"body\":\"Hello DQOT Admin.\\nHow can i help you?\"},\"type\":\"text\"}', NULL, 'delivered', 0, NULL, NULL, '2026-01-02 07:14:02'),
(189, '86030724-438c-49dd-b130-4cf2dc400e5d', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0QjZGRUREODhFMjJBM0REQjhENTRERTUyRDJCRTYA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0QjZGRUREODhFMjJBM0REQjhENTRERTUyRDJCRTYA\",\"timestamp\":\"1767346233\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 09:30:36'),
(190, 'f5dfde6e-101d-4209-91ce-198016697dc6', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyRkNFQ0QyQTdEMEE1MTFGODc0REEzODFBRDYzOTEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyRkNFQ0QyQTdEMEE1MTFGODc0REEzODFBRDYzOTEA\",\"timestamp\":\"1767346271\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 09:31:13'),
(191, '5df66909-beb2-4485-b66e-f53a998a639e', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxQ0JGNDJDNDFERDlCNUE2MTJEM0JDM0ZCQUZDQkYA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUxQ0JGNDJDNDFERDlCNUE2MTJEM0JDM0ZCQUZDQkYA\",\"timestamp\":\"1767353431\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 11:30:34'),
(192, '7bf67434-9f2c-4d24-af2a-91361d385002', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDREUzQzNEN0Y1QzA5OTQ0OEU0MEM0RkQwRURCRDcA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVDREUzQzNEN0Y1QzA5OTQ0OEU0MEM0RkQwRURCRDcA\",\"timestamp\":\"1767353527\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 11:32:09'),
(193, '589c3a5d-1150-42c7-bf2f-b293f709b3ea', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0N0FGQjg4OEFFMzU4NTE5RUEwOUY1MTRBNkVFRkMA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0N0FGQjg4OEFFMzU4NTE5RUEwOUY1MTRBNkVFRkMA\",\"timestamp\":\"1767353744\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 11:35:46'),
(194, 'f12825bd-6c71-409b-9808-e5605eb9036b', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2OUMwQjQwRTczQjVGN0IxM0RFOTY2OEExQzkwRTIA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2OUMwQjQwRTczQjVGN0IxM0RFOTY2OEExQzkwRTIA\",\"timestamp\":\"1767354493\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, 1, '2026-01-05 07:55:40', '2026-01-02 11:48:14'),
(195, 'a9eac8a7-500a-4c10-adc4-1321b9aacaba', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2ODFFNzRGRUY5M0Y2NERCRUMzMkFGNDI5QjdGMjIA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2ODFFNzRGRUY5M0Y2NERCRUMzMkFGNDI5QjdGMjIA\",\"timestamp\":\"1767599718\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 0, 1, '2026-01-05 07:55:40', '2026-01-05 07:55:21'),
(196, 'f77cdcae-2483-4bd0-8325-ce8ff204088b', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1MjM5OEFGRUUyMkI3QUM4MjNCQTYzOThBRjY4MTUA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1MjM5OEFGRUUyMkI3QUM4MjNCQTYzOThBRjY4MTUA\",\"timestamp\":\"1767599759\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-05 07:56:00'),
(197, '28c2c1d8-22d4-4274-b5a0-38daafb5e78e', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNEVFN0VENkIyQzA5MTg2OTVGAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"56\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-05 07:56:07'),
(198, '2f9aa299-006d-45d3-b036-d484387bff99', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQkZFOEJBODY4MTVDQTk5QUMyAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"\\ud83d\\ude0a\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-05 07:58:33'),
(199, 'ff77e948-3274-466e-b126-b62e3395fc29', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUVCMzgyMzY5MTg2QjU3OEU4AA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"23\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-05 07:58:49'),
(200, 'ac0f89ec-a363-4680-8096-40bf713307b1', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGOThGMTVBRkI5MTUwNjhFRDYzQzQzRjIyNzlFNTUA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVGOThGMTVBRkI5MTUwNjhFRDYzQzQzRjIyNzlFNTUA\",\"timestamp\":\"1767599937\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-05 07:58:59'),
(201, '8aea78c0-ced3-475d-8b27-f749527d4b38', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUwNTREQkNCRkYxRDgzOUFDMjZERTYxNzE4QzVCNTYA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUwNTREQkNCRkYxRDgzOUFDMjZERTYxNzE4QzVCNTYA\",\"timestamp\":\"1767618795\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-05 13:13:17'),
(202, '3c3762d4-1059-4974-8e5f-3bbfcb033c18', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2OUI1Qjk4NzdGODJBMkQ0ODU5QjY2ODkxMkFEOEEA', 1, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2OUI1Qjk4NzdGODJBMkQ0ODU5QjY2ODkxMkFEOEEA\",\"timestamp\":\"1767619537\",\"text\":{\"body\":\"Hii\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-05 13:25:39'),
(203, 'aa285869-e34d-480c-9061-371b40c33d58', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzNzhGOTE4OTMxNzQwMTZFNjE0MjM0QTU5MTM3RkEA', 5, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzNzhGOTE4OTMxNzQwMTZFNjE0MjM0QTU5MTM3RkEA\",\"timestamp\":\"1767619654\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-05 13:27:35'),
(204, '7efdd7c7-2255-4711-9109-76fe15046a0b', 3, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMDUwM0UyNzhGNjYyRkQwQUU5QQA=', 6, NULL, 'inbound', '{\"from\":\"919257086311\",\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAEhgWM0VCMDUwM0UyNzhGNjYyRkQwQUU5QQA=\",\"timestamp\":\"1767619715\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-05 13:28:37'),
(205, '0921d13f-b518-43af-b367-42ecd1fcaabf', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVEQUVGQTVGQzc2MkI4ODY5RDIzNTY0OTkxNjFFNTEA', 5, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVEQUVGQTVGQzc2MkI4ODY5RDIzNTY0OTkxNjFFNTEA\",\"timestamp\":\"1767676481\",\"text\":{\"body\":\"Heles\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-06 05:14:43'),
(206, '3689cc22-72f0-40e7-b5c2-d1882162c034', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E4QUYxRTI5MkMyMDNFNTIzM0EA', 7, NULL, 'inbound', '{\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E4QUYxRTI5MkMyMDNFNTIzM0EA\",\"timestamp\":\"1767676497\",\"text\":{\"body\":\"Nitika test msg\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-06 05:14:59'),
(207, '8dbb4da1-1eaf-499d-a2bc-3d698c867370', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRkVCRjgwMkIyOUYzMDE2RDg3AA==', 5, NULL, 'outbound', '{\"text\":{\"body\":\"..\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-06 05:15:02'),
(208, '0808ed45-d71e-44ce-b449-edd666e2f23a', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1Q0ZCRjE1RjdBMjFFMzA1QTkxREQzNzc5Q0U5MDkA', 5, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1Q0ZCRjE1RjdBMjFFMzA1QTkxREQzNzc5Q0U5MDkA\",\"timestamp\":\"1767676515\",\"text\":{\"body\":\"Hshs\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-06 05:15:17'),
(209, '4f19b016-9fcd-4d8b-ad21-7032e5041e68', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMTczNjQxQjIxNkIzMDhDMjkzAA==', 7, NULL, 'outbound', '{\"text\":{\"body\":\"yes\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-06 05:15:22'),
(210, '8a7e18ce-ad61-471f-bf22-7401282029ed', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQjI5RDAyQUI1NDg0Nzc4QzY2AA==', 5, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is test MSG from marketing.\",\"footer\":\"powered vy DQOT\"}}', NULL, 'accepted', 0, NULL, NULL, '2026-01-06 08:56:57'),
(211, 'a086a025-e8e9-4662-8f4c-1928e543d594', 3, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRDNCQjU0MzU0MjlENkU3OTQyAA==', 6, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is test MSG from marketing.\",\"footer\":\"powered vy DQOT\"}}', NULL, 'accepted', 0, NULL, NULL, '2026-01-06 08:56:58'),
(212, '13618eaa-4960-4efc-bee5-9200a8b8429a', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSNUYyMTNFRjhCM0YyRUU2NkI4AA==', 7, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is test MSG from marketing.\",\"footer\":\"powered vy DQOT\"}}', NULL, 'failed', 0, NULL, NULL, '2026-01-06 08:57:00'),
(213, '5912a00e-1387-4139-aa5a-d1390e28c070', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNUY1OEI4MkUyMEYyRTYxRUY1AA==', 5, 6, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is test MSG from marketing.\",\"footer\":\"powered vy DQOT\"}}', NULL, 'failed', 0, NULL, NULL, '2026-01-07 05:06:34'),
(214, 'da3e795e-631f-4dcd-b9cd-d3f250184611', 3, 'wamid.HBgMOTE5OTI5NDUxMjg4FQIAEhggQUM1RjZFODdCQzE4N0JBNDU2M0E2N0U5QkUxOTQ0RTQA', 8, NULL, 'inbound', '{\"from\":\"919929451288\",\"id\":\"wamid.HBgMOTE5OTI5NDUxMjg4FQIAEhggQUM1RjZFODdCQzE4N0JBNDU2M0E2N0U5QkUxOTQ0RTQA\",\"timestamp\":\"1767781518\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-07 10:25:21'),
(215, '15422e79-9bfc-452b-8d40-0f0678ad1819', 3, 'wamid.HBgMOTE5OTI5NDUxMjg4FQIAERgSQzUwODJDMjU1RTBERjBBQTlCAA==', 8, NULL, 'outbound', '{\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-07 10:25:39'),
(216, '6fd8102c-398a-41bf-823e-599b838e0b9c', 3, 'wamid.HBgMOTE5OTI5NDUxMjg4FQIAEhggQUM4NDlDNUUwNjc5MDFCNDc0NzkzQkMzNDMzQzY2NzUA', 8, NULL, 'inbound', '{\"from\":\"919929451288\",\"id\":\"wamid.HBgMOTE5OTI5NDUxMjg4FQIAEhggQUM4NDlDNUUwNjc5MDFCNDc0NzkzQkMzNDMzQzY2NzUA\",\"timestamp\":\"1767781540\",\"text\":{\"body\":\"I want to develop an app\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-07 10:25:43'),
(217, '243a08b0-674f-47e5-81e1-f125e7f8fdf2', 3, 'wamid.HBgMOTE5MjQxMTIzMzczFQIAEhggQUMyOUIyRTg1QTJCNERGODAxNEYwRkI0MTAxQ0I4NDMA', 9, NULL, 'inbound', '{\"from\":\"919241123373\",\"id\":\"wamid.HBgMOTE5MjQxMTIzMzczFQIAEhggQUMyOUIyRTg1QTJCNERGODAxNEYwRkI0MTAxQ0I4NDMA\",\"timestamp\":\"1767788251\",\"text\":{\"body\":\"arvind.kumar2026@gmail.com\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-07 12:17:33'),
(218, 'c128fd4a-64be-4c06-a041-8efee1a70883', 3, 'wamid.HBgMOTE5MjQxMTIzMzczFQIAERgSNzc2OEVDMjA5RTFGOTRCNDlCAA==', 9, NULL, 'outbound', '{\"text\":{\"body\":\"Kindly find the link here too:\\nEd tech Web Discussion \\nWednesday, 7 January \\u00b7 6:00 \\u2013 7:00pm\\nTime zone: Asia\\/Kolkata\\nGoogle Meet joining info\\nVideo call link: https:\\/\\/meet.google.com\\/qxs-sdue-fvt\\nOr dial: \\u202a(US) +1 413-276-6815\\u202c PIN: \\u202a870 408 042\\u202c#\\nMore phone numbers: https:\\/\\/tel.meet\\/qxs-sdue-fvt?pin=3068521595889\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-07 12:19:57'),
(219, 'f1500af8-1687-41d0-bd17-70fe333b2a47', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyRUJBQUJBNzFDNTMwQUJCNkFGMkI2RDQwN0E0OTEA', 10, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyRUJBQUJBNzFDNTMwQUJCNkFGMkI2RDQwN0E0OTEA\",\"timestamp\":\"1767852502\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-08 06:08:25'),
(220, '74a833ac-a484-4273-a903-97015948f121', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUwMzVDRDVGNjgxOEFCNDE5ODEwODRBMTkxQzYyMkUA', 11, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUwMzVDRDVGNjgxOEFCNDE5ODEwODRBMTkxQzYyMkUA\",\"timestamp\":\"1767873978\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-08 12:06:21'),
(221, 'fefdc38b-8efa-4fce-a382-a6b9972857d2', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQzQ4MTE3N0ExQUQ0QUNFNkMwAA==', 11, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is test MSG from marketing.\",\"footer\":\"powered vy DQOT\"}}', NULL, 'read', 0, NULL, NULL, '2026-01-08 12:06:41'),
(222, '05a3a458-807f-4912-97d7-6b684ba369cc', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSM0ZDMjAyMkRCREU4QjExQjEwAA==', 11, NULL, 'outbound', '{\"text\":{\"body\":\"testing\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-08 12:32:11'),
(223, 'c02f1cc5-5fcf-4073-bb2e-084265d28ae9', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E4OTYwNzM2Q0I5M0IyNUVDMTIA', 12, NULL, 'inbound', '{\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E4OTYwNzM2Q0I5M0IyNUVDMTIA\",\"timestamp\":\"1767875611\",\"text\":{\"body\":\"Testing try\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-08 12:33:33'),
(224, 'a64ce7bd-e62f-4a4a-a014-5c18ecf9821c', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMTcxOTNCQTA5MjQ2QTQwNjk2AA==', 12, NULL, 'outbound', '{\"text\":{\"body\":\"test\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-08 12:34:31'),
(225, 'f714437c-9aa5-4b52-bb5d-e5fc495d4f26', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRTgyNjBGOTNFNUQxNUMyRDExAA==', 11, 6, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is test MSG from marketing.\",\"footer\":\"powered vy DQOT\"}}', NULL, 'failed', 0, NULL, NULL, '2026-01-09 13:06:35'),
(226, '423271d9-88bb-49f9-ac6e-3efc927826fc', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUY4MUQ3NzkzQTY3QjQ2QzhEAA==', 11, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is test MSG from marketing.\",\"footer\":\"powered vy DQOT\"}}', NULL, 'failed', 0, NULL, NULL, '2026-01-09 13:08:58'),
(227, '11e0c54e-f2cf-4ee2-bbe4-c98750adf30a', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSODg3OUQzMjUxMUFBOTFBODAwAA==', 12, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is test MSG from marketing.\",\"footer\":\"powered vy DQOT\"}}', NULL, 'failed', 0, NULL, NULL, '2026-01-09 13:09:00'),
(228, 'fafd44f7-4499-48ae-8506-bc9eaff5dfb0', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMzkxMDEzOEI0QkQyQjQyODY3AA==', 11, 6, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is test MSG from marketing.\",\"footer\":\"powered vy DQOT\"}}', NULL, 'failed', 0, NULL, NULL, '2026-01-10 05:24:18'),
(229, 'c529a8e1-c7ed-47f1-9401-90a78d1e12c9', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUNDRTkzQTQxOTgxQzRGMTI1AA==', 11, 6, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hii {{1}} \\ud83d\\udc4b\\r\\nWe\\u2019ve added new features to help you manage conversations faster.\\r\\n\\r\\n\\ud83d\\udc49 Tap below to explore now.\",\"footer\":\"powered by DQOT Solutions\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"View Features\",\"value\":\"View Features\"},{\"type\":\"URL\",\"text\":\"Contact Support\",\"value\":\"Contact Support\"}]}', NULL, 'read', 0, NULL, NULL, '2026-01-13 05:12:05'),
(230, '03ad8319-6966-4721-8671-c7f6cd488e16', 3, 'wamid.HBgMNDQ3OTQzMTIxOTk5FQIAEhgUMkFBNkMyRTdGQTJDODREOTQ3OTAA', 14, NULL, 'inbound', '{\"from\":\"447943121999\",\"id\":\"wamid.HBgMNDQ3OTQzMTIxOTk5FQIAEhgUMkFBNkMyRTdGQTJDODREOTQ3OTAA\",\"timestamp\":\"1768380788\",\"text\":{\"body\":\"I don\\u2019t appear to have a response. I will close this enquiry if priorities have changed\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-14 08:53:11'),
(231, '996a16a1-0b24-4f32-bf99-e0c99b437c30', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0EzRUZEREE0RTNBMTFGQzIzRkMA', 12, NULL, 'inbound', '{\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0EzRUZEREE0RTNBMTFGQzIzRkMA\",\"timestamp\":\"1768558219\",\"text\":{\"body\":\"??!1\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-16 10:10:22'),
(232, 'ad892ae5-3871-41f6-b0a6-44abaff93bd8', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSM0YzMzU4MjVEQkZDNDAwQTQ1AA==', 12, NULL, 'outbound', '{\"text\":{\"body\":\"try\"},\"type\":\"text\"}', NULL, 'delivered', 0, NULL, NULL, '2026-01-16 10:10:31'),
(233, '3eff0dc9-d9c1-46f9-aa3f-ad236dfed46f', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSREZGNEM0NjU5OTZGM0IxQzgzAA==', 12, NULL, 'outbound', '{\"text\":{\"body\":\"testing\"},\"type\":\"text\"}', NULL, 'delivered', 0, NULL, NULL, '2026-01-16 10:10:43'),
(234, 'c812ed1d-fe95-4faa-858b-66b0b2a27654', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E3OUU4RDNBQ0E3OEVCQzU1NkEA', 12, NULL, 'inbound', '{\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E3OUU4RDNBQ0E3OEVCQzU1NkEA\",\"timestamp\":\"1768805266\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-19 06:47:49'),
(235, 'ae60b189-1554-4c6e-99fc-7785872aea6f', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSQjcwOTczNTA0MDBEMzk3QUYwAA==', 12, NULL, 'outbound', '{\"text\":{\"body\":\"Hello Nitika Sharma\\nThis is on trail.\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-19 06:47:51'),
(236, '495af1d6-a666-4333-be5f-7cad33ce1b27', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0ExOThGNkUzNjQ0OUNBNUNFRDAA', 12, NULL, 'inbound', '{\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0ExOThGNkUzNjQ0OUNBNUNFRDAA\",\"timestamp\":\"1768805418\",\"text\":{\"body\":\"Hello, I\\u2019d like to connect regarding your business.\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-19 06:50:20'),
(237, 'b0de68f4-504d-4e0d-b7a6-b09affea503e', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUyNTFDREM5RjI2OUZGNjVDNTRFMDU5Mzg5MkQxOTkA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUyNTFDREM5RjI2OUZGNjVDNTRFMDU5Mzg5MkQxOTkA\",\"timestamp\":\"1768821044\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-19 11:10:47'),
(238, 'f34180b2-4bc3-419e-a497-62b15d9254d3', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU0RTY2QjBCODE4QzVBNjAxM0Y0REMxOEQzM0VCRUYA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU0RTY2QjBCODE4QzVBNjAxM0Y0REMxOEQzM0VCRUYA\",\"timestamp\":\"1768821059\",\"text\":{\"body\":\"Ananya Gupta (AstroTarsh)\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-19 11:11:02'),
(239, 'd7b7470e-d1be-4e49-b849-1071bb4c646f', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTVCODhBRjVGMEFCQzVFRUIxQjY2N0M3REY0QzQ3REMA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTVCODhBRjVGMEFCQzVFRUIxQjY2N0M3REY0QzQ3REMA\",\"timestamp\":\"1768821318\",\"text\":{\"body\":\"https:\\/\\/www.facebook.com\\/share\\/17rU45i9yu\\/\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-19 11:15:20'),
(240, 'aabb26ca-29ed-4869-86b1-4e95165a7bb9', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU2RUQwOEM3NUFFOUNFMzYxOEU4MTc4RjZDNkMyQzcA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU2RUQwOEM3NUFFOUNFMzYxOEU4MTc4RjZDNkMyQzcA\",\"timestamp\":\"1768821536\",\"errors\":[{\"code\":131051,\"title\":\"Message type unknown\",\"message\":\"Message type unknown\",\"error_data\":{\"details\":\"Message type is currently not supported.\"}}],\"type\":\"unsupported\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-19 11:18:57'),
(241, '29a0da89-0015-4c11-bce4-553d60fd3c6e', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUwNkY1MkU1NDgwQkY5MzcyNTdGMkFDQTBFQjZBMjYA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUwNkY1MkU1NDgwQkY5MzcyNTdGMkFDQTBFQjZBMjYA\",\"timestamp\":\"1768821536\",\"errors\":[{\"code\":131051,\"title\":\"Message type unknown\",\"message\":\"Message type unknown\",\"error_data\":{\"details\":\"Message type is currently not supported.\"}}],\"type\":\"unsupported\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-19 11:18:58'),
(242, 'b4c69346-bd65-481d-a853-0aab5a188caa', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU3NkI0MTY2QTA1QTA4MjFFMkREQUQ3QTgzQUY2RUQA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU3NkI0MTY2QTA1QTA4MjFFMkREQUQ3QTgzQUY2RUQA\",\"timestamp\":\"1768821542\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"4jLExJgV6+aPLex6detuVGecrtOGqovv2oUsf8OAI\\/M=\",\"id\":\"864015776551593\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=864015776551593&source=webhook&ext=1768821843&hash=ARmr6s7rkCM51LcH2hIvp1yxpZ62UmLVVQHg5dfaQJPM5w\"}}', 5, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:04'),
(243, '02cb8d2c-a0d8-4613-afe2-0bd45f170c1b', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUxMDE1MkZFRUFGQjlDRDIyNDQ5NDVDQTkwMUQ3MzgA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUxMDE1MkZFRUFGQjlDRDIyNDQ5NDVDQTkwMUQ3MzgA\",\"timestamp\":\"1768821541\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"gxisO6WfQhTmhURUBWVKljO5AK2YzuxkVhE15+dGkpE=\",\"id\":\"863007849947310\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=863007849947310&source=webhook&ext=1768821843&hash=ARlgZPo-DIHB4fhX58hndhh9bVn90qJzA8iRh7JVmEdi7w\"}}', 7, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:04'),
(244, 'db33bd86-1594-4bf1-9060-b690a0a7abe3', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU4NDEwQkZDRkNBQjBCRDVGNEI4NEZBOEQ2NzQ2QUEA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU4NDEwQkZDRkNBQjBCRDVGNEI4NEZBOEQ2NzQ2QUEA\",\"timestamp\":\"1768821542\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"\\/DlQZFXjDCHjSDtTID7yuXASDuHgleUz5eYFFDEwTm4=\",\"id\":\"25714938304832382\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=25714938304832382&source=webhook&ext=1768821844&hash=ARnc9InVIr2MeXPwus3OfdVJx9jvfIxXH2sr5xLtn64ThA\"}}', 6, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:05'),
(245, '7723a329-ac74-4407-a9ba-f9a8c952e7ac', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUxQThCODhDMEU5Q0VBOENCRjMxNTJGOTI4QjJERUYA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUxQThCODhDMEU5Q0VBOENCRjMxNTJGOTI4QjJERUYA\",\"timestamp\":\"1768821542\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"JJHlnfbuFJ8JjBUVX9JntidrC\\/Pqddlb5A+rRlMoJc4=\",\"id\":\"1218084573754140\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=1218084573754140&source=webhook&ext=1768821844&hash=ARmRIEyIPlSXoyQHKcBLTywL2wouH5xApmLelbseEyVbCQ\"}}', 9, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:06'),
(246, '03ff9364-a153-4300-9a81-3c3aa96bb27a', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUyRTM3NTkzNjk5MThCMEVGNTA3N0Y3QzRCMzFCMTQA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUyRTM3NTkzNjk5MThCMEVGNTA3N0Y3QzRCMzFCMTQA\",\"timestamp\":\"1768821543\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"rsQbWfN7leRN3cnRqMeBWRaufFKa4oGyoZWXmDquBYM=\",\"id\":\"2412418545845209\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=2412418545845209&source=webhook&ext=1768821845&hash=ARlOB_HdTQhYqbgR36CH5bT4g8sLQzOltGSC8xxJsCC_Xw\"}}', 8, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:06'),
(247, 'a4e43e4c-47de-4cef-a880-191b463b7a52', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU1MDIyQTc4OTA4QTg3RTJDRDcxMTUyMTkxNzY2RjkA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU1MDIyQTc4OTA4QTg3RTJDRDcxMTUyMTkxNzY2RjkA\",\"timestamp\":\"1768821543\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"2OHRaA5S2iybSVV4ubOS06vjOaidURsgNBJYKvNh0AA=\",\"id\":\"893826946483232\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=893826946483232&source=webhook&ext=1768821846&hash=ARmYewgNGTo5mA8Vfiz4WX-miB9dqowqTsUA2sAcUIKiKA\"}}', 10, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:07'),
(248, '180d9ba2-b2ff-446f-9d2e-3df00e44b99e', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUwOTc3OTgzREQ3OTQ2QTM5MDU4NTgwRURBQzFEMDcA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUwOTc3OTgzREQ3OTQ2QTM5MDU4NTgwRURBQzFEMDcA\",\"timestamp\":\"1768821544\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"JJHlnfbuFJ8JjBUVX9JntidrC\\/Pqddlb5A+rRlMoJc4=\",\"id\":\"1335761511567644\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=1335761511567644&source=webhook&ext=1768821846&hash=ARlF6L9KcNlwefxog2Co6juU8avmWSxgdn3x1crAfnzgiQ\"}}', 11, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:07'),
(249, '8f04725f-7901-462e-b221-cea72c0b7ff6', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTVEQjI5MjZGRTc4OUJCREE3QzlGQzc3MDcxRjFFODkA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTVEQjI5MjZGRTc4OUJCREE3QzlGQzc3MDcxRjFFODkA\",\"timestamp\":\"1768821544\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"eW763m8O2dz4zBpJe\\/XUfn6gTF4Iy\\/BMF69q4eiPmAU=\",\"id\":\"1430620898637627\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=1430620898637627&source=webhook&ext=1768821847&hash=ARnFtezAStNVsSRPE5CSAHIJNCfijFxbAc5QlLvq5hOtkw\"}}', 12, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:08');
INSERT INTO `chats` (`id`, `uuid`, `organization_id`, `wam_id`, `contact_id`, `user_id`, `type`, `metadata`, `media_id`, `status`, `is_read`, `deleted_by`, `deleted_at`, `created_at`) VALUES
(250, 'fec0d71b-df5a-4651-bd4d-3e9ce37cf8ad', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU4MDc2QkQxQjNFMzIwMDc4MUZCRjEzMTI2RUExMEUA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU4MDc2QkQxQjNFMzIwMDc4MUZCRjEzMTI2RUExMEUA\",\"timestamp\":\"1768821545\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"4jLExJgV6+aPLex6detuVGecrtOGqovv2oUsf8OAI\\/M=\",\"id\":\"25873945522236529\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=25873945522236529&source=webhook&ext=1768821848&hash=ARnauGPA8nu7CbtbTZiAmKvvxR3WLW_qxv67k7NUeVtQKA\"}}', 13, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:09'),
(251, 'daa61ab1-bce7-4039-bc28-9634f84ae879', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU5MEE2QzdERUIyRUE0N0FDMjU2Qjc3RDUyMEJFRkEA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTU5MEE2QzdERUIyRUE0N0FDMjU2Qjc3RDUyMEJFRkEA\",\"timestamp\":\"1768821544\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"quyt9sdFMivu1iddUJoQjkMI9WRTPqM0yGAvoQ5wlFQ=\",\"id\":\"882391241160475\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=882391241160475&source=webhook&ext=1768821847&hash=ARmCylLnA2cHa5rlXyp2pXQCTQz3jtOsiErHTNipP5SZPw\"}}', 14, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:09'),
(252, 'a7be264c-d0bb-4fbb-89d2-3ed7f716dc3c', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUwOUVBNjU4ODExMkFGOEEzMjRDNDBGQ0VBREVGMUYA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTUwOUVBNjU4ODExMkFGOEEzMjRDNDBGQ0VBREVGMUYA\",\"timestamp\":\"1768821546\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"\\/DlQZFXjDCHjSDtTID7yuXASDuHgleUz5eYFFDEwTm4=\",\"id\":\"896150873384929\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=896150873384929&source=webhook&ext=1768821848&hash=ARlJ6N4tt39TYX9HX0ynyD564Cd_kNBaN6l0ZZGotI41XQ\"}}', 15, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:09'),
(253, '521d7d7c-2c80-452a-8a57-758dcab453aa', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTVFMjM3MTk2QTQ5NjBGRjM1NzQ0QThBMUM4N0I5NTgA', 16, NULL, 'inbound', '{\"from\":\"918433109834\",\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAEhggQTVFMjM3MTk2QTQ5NjBGRjM1NzQ0QThBMUM4N0I5NTgA\",\"timestamp\":\"1768821546\",\"type\":\"image\",\"image\":{\"mime_type\":\"image\\/jpeg\",\"sha256\":\"gxisO6WfQhTmhURUBWVKljO5AK2YzuxkVhE15+dGkpE=\",\"id\":\"1981620929233571\",\"url\":\"https:\\/\\/lookaside.fbsbx.com\\/whatsapp_business\\/attachments\\/?mid=1981620929233571&source=webhook&ext=1768821849&hash=ARk7r7mO50uvp6TxJbnaeYADlqxgfeD8cnC7uhj9sVqHfQ\"}}', 16, 'delivered', 1, NULL, NULL, '2026-01-19 11:19:10'),
(254, '34fddda8-7a23-4611-8d49-911ca4c4a935', 3, 'wamid.HBgMOTE4NDMzMTA5ODM0FQIAERgSMkREQkJDNkMyNzdEMUE1MkQwAA==', 16, NULL, 'outbound', '{\"text\":{\"body\":\"Good Evening...\\n\\nThis is Nitika Sharma from DQOT Solutions Pvt Ltd.  \\nhttps:\\/\\/www.dqotsolutions.com\\/\\n\\nAs discussed in our recent call, I\\u2019m sharing the project details and ballpark estimation below for your reference.\\n\\n Project will include:\\n\\u2022 Website (user-facing)\\n\\u2022 Mobile App \\u2013 Android &amp; iOS\\n\\u2022 Admin Panel \\u2013 Web-based \\n\\nKey features planned: Kundali making &amp; matching, Horoscope, Panchang, Astrologer chat, Audio\\/Video calls, Product selling, Go Live sessions, and Blog.\\n=============================================================================================Based on the above scope and features, the ballpark development estimate is \\u20b95,00,000 + 18% GST.\\nThis is a high-level estimate and may vary slightly once final requirements and flows are frozen.\\n=============================================================================================\\nThe following will be arranged\\/paid by the client directly:\\n\\u2022 Payment Gateway\\n\\u2022 SMS \\/ WhatsApp \\/ Email services\\n\\u2022 Video &amp; Audio Calling APIs\\n\\u2022 Cloud hosting &amp; server costs\\n\\u2022 App Store &amp; Play Store accounts\\n\\u2022 Any paid astrology APIs (Panchang, Kundali data, etc.)\\n\\nIf required, we will fully assist you in selecting and coordinating all third-party services, while the actual accounts and payments remain on the client\\u2019s side.\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-19 11:45:03'),
(255, '9d747516-62e3-4b85-931d-23ae85d686a1', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMDVGNDI5QTU0RUNEMzYyNUVGAA==', 12, 6, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hii {{1}} \\ud83d\\udc4b\\r\\nWe\\u2019ve added new features to help you manage conversations faster.\\r\\n\\r\\n\\ud83d\\udc49 Tap below to explore now.\",\"footer\":\"powered by DQOT Solutions\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"View Features\",\"value\":\"View Features\"},{\"type\":\"URL\",\"text\":\"Contact Support\",\"value\":\"Contact Support\"}]}', NULL, 'read', 0, NULL, NULL, '2026-01-20 07:24:10'),
(256, '2f1e265c-0043-449e-b67b-c09c441ba619', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E3Qjc5RDQzRUEyMUY0NkEzOTgA', 12, NULL, 'inbound', '{\"context\":{\"from\":\"919257086308\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMDVGNDI5QTU0RUNEMzYyNUVGAA==\"},\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E3Qjc5RDQzRUEyMUY0NkEzOTgA\",\"timestamp\":\"1768893874\",\"type\":\"button\",\"button\":{\"payload\":\"1224\",\"text\":\"View Features\"}}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 07:24:36'),
(257, '6b483ee5-3c1b-458e-9b3c-2ad946107423', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSOUVCMTFGMUJCMDU1NTEzNDYyAA==', 12, NULL, 'outbound', '{\"text\":{\"body\":\"\\ud83d\\ude01\\ud83d\\ude01\\ud83d\\ude01\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-20 07:48:18'),
(258, 'e9e68cfd-f772-485e-b57f-8081ff464fe5', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVFQjI1MDgzMzJFQjBENzk0QzQ4NTUwMTBBN0JCRjYA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVFQjI1MDgzMzJFQjBENzk0QzQ4NTUwMTBBN0JCRjYA\",\"timestamp\":\"1768909844\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 11:50:46'),
(259, '926afd00-5fff-4a68-8731-c68b06312775', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCRjRCNzNERENBQzU3OUQxRUE5RjhCMUIxQkE3RTIA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCRjRCNzNERENBQzU3OUQxRUE5RjhCMUIxQkE3RTIA\",\"timestamp\":\"1768909883\",\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 11:51:24'),
(260, 'a7168ffb-baba-4672-9162-8f4e190f9666', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1MTI2MDQ5MTMzMTQ3NDhCRkY0OEZFMEY5MTM1RDIA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1MTI2MDQ5MTMzMTQ3NDhCRkY0OEZFMEY5MTM1RDIA\",\"timestamp\":\"1768910239\",\"text\":{\"body\":\"start\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 11:57:20'),
(261, 'a532f310-afd3-495b-b88d-111c6b429059', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyQjM0NEM3QTNFNERCMzg5Q0ZDQzg3RTlEREUzMDQA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyQjM0NEM3QTNFNERCMzg5Q0ZDQzg3RTlEREUzMDQA\",\"timestamp\":\"1768910807\",\"text\":{\"body\":\"start\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 12:06:49'),
(262, 'b8f93ab0-327d-4ff0-a46a-544476cb25df', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCREU0OENBNzlDNjJEMkZBNDA0REM3QTFGQTE4OTEA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVCREU0OENBNzlDNjJEMkZBNDA0REM3QTFGQTE4OTEA\",\"timestamp\":\"1768911634\",\"text\":{\"body\":\"start\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 12:20:35'),
(263, 'dda98e2b-56e7-453c-921c-c8c1ff37a221', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBMTZGOTVDNjREQTFBMzg4QzM1NjdGMDREMDg3QUUA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBMTZGOTVDNjREQTFBMzg4QzM1NjdGMDREMDg3QUUA\",\"timestamp\":\"1768912402\",\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 12:33:23'),
(264, '8e90dfd8-569b-446f-b7dd-c0a2a23da2fc', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2RThCRDYxRjVEMDI0NjBGMDA1MENENTg0RjJGNUIA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU2RThCRDYxRjVEMDI0NjBGMDA1MENENTg0RjJGNUIA\",\"timestamp\":\"1768913507\",\"text\":{\"body\":\"start\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 12:51:48'),
(265, '4fd1c5a6-c77a-49ca-97f2-3af0e154f24d', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzMzJFREZGRTA0MDRCRDY0MDNCRjcwRjcyMUM0MEYA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzMzJFREZGRTA0MDRCRDY0MDNCRjcwRjcyMUM0MEYA\",\"timestamp\":\"1768914488\",\"text\":{\"body\":\"start\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 13:08:09'),
(266, '1a918678-4002-4d1d-95e0-6bdb300dca22', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1RjZDNTExNEUxRUYyNjI5Q0QzRkQ4QUIwNkNFRTIA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1RjZDNTExNEUxRUYyNjI5Q0QzRkQ4QUIwNkNFRTIA\",\"timestamp\":\"1768915138\",\"text\":{\"body\":\"start\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 13:18:59'),
(267, 'c42c7db7-e070-422b-9126-a4fdfb229a50', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNjQyNUQ2OEY3NUIwNjg0Q0I3AA==', 18, NULL, 'outbound', '{\"text\":{\"body\":\"Hello 9AM IT Services\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-20 13:19:00'),
(268, '8d48e015-c7ed-42fb-8f5e-a889ab5c330e', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E3NTQ1MDEyMDJDNTY0QzMyNzkA', 19, NULL, 'inbound', '{\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E3NTQ1MDEyMDJDNTY0QzMyNzkA\",\"timestamp\":\"1768915349\",\"text\":{\"body\":\"Hello\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 13:22:31'),
(269, 'd862a88b-883a-4bd7-a0af-a09dd4022e0b', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E4QjNCOEZCRDFEQzlCRTgxMEIA', 19, NULL, 'inbound', '{\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E4QjNCOEZCRDFEQzlCRTgxMEIA\",\"timestamp\":\"1768915354\",\"text\":{\"body\":\"Hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 13:22:36'),
(270, 'acbd63b6-f5d0-4667-be5b-5ea8aeb7f895', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E1NTU4MUNDNzBEOUJDRjhDNTkA', 19, NULL, 'inbound', '{\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E1NTU4MUNDNzBEOUJDRjhDNTkA\",\"timestamp\":\"1768915358\",\"text\":{\"body\":\"hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 13:22:39'),
(271, 'c2f02597-794d-4cc3-b395-7f31577083f0', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0EwRDFDMkM0NEJEOTU1RkQwQzcA', 19, NULL, 'inbound', '{\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0EwRDFDMkM0NEJEOTU1RkQwQzcA\",\"timestamp\":\"1768915363\",\"text\":{\"body\":\"hi\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 13:22:45'),
(272, '1b3d2389-194a-45cd-b25b-052c35833120', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E5N0ExRkU1OThBQjlCQTk5OUEA', 19, NULL, 'inbound', '{\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0E5N0ExRkU1OThBQjlCQTk5OUEA\",\"timestamp\":\"1768915367\",\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 13:22:48'),
(273, 'd9fbfc47-ae8f-409e-b9be-da03231edded', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMEYzNEZDNzhCN0RDQUYwNzc5AA==', 19, NULL, 'outbound', '{\"text\":{\"body\":\"Hello Nitika Sharma\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'delivered', 0, NULL, NULL, '2026-01-20 13:22:49'),
(274, '8b3fc312-966e-48f2-80f7-ceefbffb28d9', 3, 'wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0FFQzczRDg1REVBM0Q1NzREMDMA', 19, NULL, 'inbound', '{\"from\":\"919782543431\",\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAEhgUM0FFQzczRDg1REVBM0Q1NzREMDMA\",\"timestamp\":\"1768915381\",\"text\":{\"body\":\"U are not layak helping me\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-20 13:23:03'),
(275, '1b28e0a1-ef8a-4121-950a-b0abbe5dc4c6', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyQUY2MzE1MDY1QjI1OTMzREEyMUFBRDdCQjkyMjUA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUyQUY2MzE1MDY1QjI1OTMzREEyMUFBRDdCQjkyMjUA\",\"timestamp\":\"1768973674\",\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-21 05:34:37'),
(276, '9b8d3925-0973-485b-9f61-9640660526f4', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0QUU2NEM2MjczRERBQzM3MjY2REIyOEVGNkFDNzMA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0QUU2NEM2MjczRERBQzM3MjY2REIyOEVGNkFDNzMA\",\"timestamp\":\"1768973715\",\"text\":{\"body\":\"start\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-21 05:35:16'),
(277, '6a66b6c3-ae5c-4d70-99c0-775465173882', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzQzkwMjQ3NDlGNjlCMjQ4N0JGRjY3N0EyMDc5MjYA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTUzQzkwMjQ3NDlGNjlCMjQ4N0JGRjY3N0EyMDc5MjYA\",\"timestamp\":\"1768973784\",\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-21 05:36:26'),
(278, 'a7ffb9b7-3da4-47c6-87a6-ead5f27d3f27', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU4RDE0MUE1RkIyQUQzRjdFMDcyMzA0MDJBRjFEOUQA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU4RDE0MUE1RkIyQUQzRjdFMDcyMzA0MDJBRjFEOUQA\",\"timestamp\":\"1768974828\",\"text\":{\"body\":\"hii\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-21 05:53:50'),
(279, '64c8b85a-2806-443f-88db-a5cbb8151ca2', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1QTVGNkY4MUY4ODhDOEE1OUZDNjQ1OUNENTNBNkQA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU1QTVGNkY4MUY4ODhDOEE1OUZDNjQ1OUNENTNBNkQA\",\"timestamp\":\"1768978529\",\"text\":{\"body\":\"start\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-21 06:55:33'),
(280, '7fa48619-1962-4823-98f5-3348b1cc7a10', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUU4M0EwQzRENDEzQkFBMzM2AA==', 18, NULL, 'outbound', '{\"text\":{\"body\":\"Hello 9AM IT Services\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-21 06:55:34'),
(281, '1d3b7617-4ca8-4904-aef8-ab139a8da2bb', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBNTYyNkI3OUZEQzcxQzk3NDg2MTVBRDQzNkY2MUUA', 18, NULL, 'inbound', '{\"context\":{\"from\":\"919257086308\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUU4M0EwQzRENDEzQkFBMzM2AA==\"},\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTVBNTYyNkI3OUZEQzcxQzk3NDg2MTVBRDQzNkY2MUUA\",\"timestamp\":\"1768978541\",\"type\":\"interactive\",\"interactive\":{\"type\":\"button_reply\",\"button_reply\":{\"id\":\"button1\",\"title\":\"Click Now\"}}}', NULL, 'delivered', 1, NULL, NULL, '2026-01-21 06:55:43'),
(282, 'c4b89703-a131-4c16-adcb-fb38916eb39e', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0Mjk4MTkwMzU5QTY0NTBFNkE0MTRGNjgxOEE2RUYA', 18, NULL, 'inbound', '{\"from\":\"916376535743\",\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAEhggQTU0Mjk4MTkwMzU5QTY0NTBFNkE0MTRGNjgxOEE2RUYA\",\"timestamp\":\"1768978679\",\"text\":{\"body\":\"Hii\"},\"type\":\"text\"}', NULL, 'delivered', 1, NULL, NULL, '2026-01-21 06:58:00'),
(283, 'dc4e657d-4b1f-43c5-b848-cc85f39bc2f1', 3, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRERENTEwQThCNEU0QTUwMDM1AA==', 18, NULL, 'outbound', '{\"text\":{\"body\":\"Hello 9AM IT Services\\nhow can i help you?\"},\"type\":\"text\"}', NULL, 'read', 0, NULL, NULL, '2026-01-21 06:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `chat_logs`
--

CREATE TABLE `chat_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `contact_id` int NOT NULL,
  `entity_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` int NOT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_logs`
--

INSERT INTO `chat_logs` (`id`, `contact_id`, `entity_type`, `entity_id`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'chat', 1, 1, '2026-01-05 07:55:40', '2025-11-26 01:28:42', NULL),
(2, 1, 'chat', 2, 1, '2026-01-05 07:55:40', '2025-11-26 01:30:38', NULL),
(3, 2, 'chat', 3, NULL, NULL, '2025-11-26 01:30:39', NULL),
(4, 1, 'chat', 4, 1, '2026-01-05 07:55:40', '2025-11-26 01:31:38', NULL),
(5, 2, 'chat', 5, NULL, NULL, '2025-11-26 01:31:39', NULL),
(6, 1, 'chat', 6, 1, '2026-01-05 07:55:40', '2025-11-26 04:30:56', NULL),
(7, 2, 'chat', 7, NULL, NULL, '2025-11-26 04:30:57', NULL),
(8, 3, 'chat', 8, NULL, NULL, '2025-11-26 04:30:58', NULL),
(9, 1, 'chat', 9, 1, '2026-01-05 07:55:40', '2025-11-27 23:59:57', NULL),
(10, 2, 'chat', 10, NULL, NULL, '2025-11-27 23:59:58', NULL),
(11, 3, 'chat', 11, NULL, NULL, '2025-11-27 23:59:59', NULL),
(12, 1, 'chat', 12, 1, '2026-01-05 07:55:40', '2025-12-05 05:25:48', NULL),
(13, 1, 'chat', 13, 1, '2026-01-05 07:55:40', '2025-12-05 05:28:34', NULL),
(14, 1, 'chat', 14, 1, '2026-01-05 07:55:40', '2025-12-05 05:28:59', NULL),
(15, 1, 'chat', 15, 1, '2026-01-05 07:55:40', '2025-12-05 05:29:15', NULL),
(16, 1, 'chat', 16, 1, '2026-01-05 07:55:40', '2025-12-05 06:17:08', NULL),
(17, 1, 'chat', 17, 1, '2026-01-05 07:55:40', '2025-12-05 06:18:12', NULL),
(18, 1, 'chat', 18, 1, '2026-01-05 07:55:40', '2025-12-05 06:18:14', NULL),
(19, 1, 'chat', 19, 1, '2026-01-05 07:55:40', '2025-12-05 06:18:24', NULL),
(20, 1, 'chat', 20, 1, '2026-01-05 07:55:40', '2025-12-05 06:18:25', NULL),
(21, 1, 'chat', 21, 1, '2026-01-05 07:55:40', '2025-12-05 06:19:18', NULL),
(22, 2, 'chat', 22, NULL, NULL, '2025-12-05 06:39:15', NULL),
(23, 2, 'chat', 23, NULL, NULL, '2025-12-05 06:39:16', NULL),
(24, 2, 'chat', 24, NULL, NULL, '2025-12-05 06:40:22', NULL),
(25, 2, 'chat', 25, NULL, NULL, '2025-12-05 06:40:35', NULL),
(26, 2, 'chat', 26, NULL, NULL, '2025-12-05 06:40:45', NULL),
(27, 2, 'chat', 27, NULL, NULL, '2025-12-05 06:40:52', NULL),
(28, 1, 'chat', 28, 1, '2026-01-05 07:55:40', '2025-12-05 07:05:01', NULL),
(29, 2, 'chat', 29, NULL, NULL, '2025-12-05 07:05:02', NULL),
(30, 3, 'chat', 30, NULL, NULL, '2025-12-05 07:05:04', NULL),
(31, 2, 'chat', 31, NULL, NULL, '2025-12-05 07:05:14', NULL),
(32, 2, 'chat', 32, NULL, NULL, '2025-12-05 07:05:15', NULL),
(33, 2, 'chat', 33, NULL, NULL, '2025-12-05 07:05:24', NULL),
(34, 1, 'chat', 34, 1, '2026-01-05 07:55:40', '2025-12-05 07:58:43', NULL),
(35, 2, 'chat', 35, NULL, NULL, '2025-12-05 07:58:43', NULL),
(36, 3, 'chat', 36, NULL, NULL, '2025-12-05 07:58:44', NULL),
(37, 4, 'chat', 37, 1, '2025-12-05 13:04:57', '2025-12-05 07:58:45', NULL),
(38, 2, 'chat', 38, NULL, NULL, '2025-12-05 07:58:57', NULL),
(39, 1, 'chat', 39, 1, '2026-01-05 07:55:40', '2025-12-05 08:00:00', NULL),
(40, 1, 'chat', 40, 1, '2026-01-05 07:55:40', '2025-12-05 09:00:06', NULL),
(41, 4, 'chat', 41, 1, '2025-12-05 13:04:57', '2025-12-05 09:00:07', NULL),
(42, 4, 'chat', 42, 1, '2025-12-05 13:04:57', '2025-12-05 09:00:57', NULL),
(43, 4, 'chat', 43, 1, '2025-12-05 13:04:57', '2025-12-05 09:01:22', NULL),
(44, 4, 'chat', 44, 1, '2025-12-05 13:04:57', '2025-12-05 09:01:41', NULL),
(45, 4, 'chat', 45, 1, '2025-12-05 13:04:57', '2025-12-05 09:01:58', NULL),
(46, 4, 'chat', 46, 1, '2025-12-05 13:04:57', '2025-12-05 09:02:12', NULL),
(47, 2, 'chat', 47, NULL, NULL, '2025-12-05 09:02:17', NULL),
(48, 2, 'chat', 48, NULL, NULL, '2025-12-05 10:03:15', NULL),
(49, 4, 'chat', 49, NULL, NULL, '2025-12-05 13:06:34', NULL),
(50, 1, 'chat', 50, 1, '2026-01-05 07:55:40', '2025-12-07 10:25:41', NULL),
(51, 1, 'chat', 51, 1, '2026-01-05 07:55:40', '2025-12-07 10:25:43', NULL),
(52, 1, 'chat', 52, 1, '2026-01-05 07:55:40', '2025-12-07 10:25:57', NULL),
(53, 1, 'chat', 53, 1, '2026-01-05 07:55:40', '2025-12-07 10:26:09', NULL),
(54, 1, 'chat', 54, 1, '2026-01-05 07:55:40', '2025-12-07 10:26:10', NULL),
(55, 3, 'chat', 55, NULL, NULL, '2025-12-08 07:51:03', NULL),
(56, 3, 'chat', 56, NULL, NULL, '2025-12-08 07:51:05', NULL),
(57, 1, 'chat', 57, 1, '2026-01-05 07:55:40', '2025-12-10 06:26:21', NULL),
(58, 4, 'chat', 58, NULL, NULL, '2025-12-10 06:26:23', NULL),
(59, 1, 'chat', 59, 1, '2026-01-05 07:55:40', '2025-12-10 06:37:55', NULL),
(60, 4, 'chat', 60, NULL, NULL, '2025-12-10 06:47:14', NULL),
(61, 1, 'chat', 61, 1, '2026-01-05 07:55:40', '2025-12-10 08:57:51', NULL),
(62, 3, 'chat', 62, NULL, NULL, '2025-12-12 11:09:22', NULL),
(63, 3, 'chat', 63, NULL, NULL, '2025-12-12 11:09:31', NULL),
(64, 3, 'chat', 64, NULL, NULL, '2025-12-12 11:09:43', NULL),
(65, 3, 'chat', 65, NULL, NULL, '2025-12-12 11:09:45', NULL),
(66, 1, 'chat', 66, 1, '2026-01-05 07:55:40', '2025-12-13 05:37:53', NULL),
(67, 1, 'chat', 67, 1, '2026-01-05 07:55:40', '2025-12-13 05:38:50', NULL),
(68, 1, 'chat', 68, 1, '2026-01-05 07:55:40', '2025-12-13 05:39:00', NULL),
(69, 1, 'chat', 69, 1, '2026-01-05 07:55:40', '2025-12-13 05:39:03', NULL),
(70, 1, 'chat', 70, 1, '2026-01-05 07:55:40', '2025-12-13 07:14:57', NULL),
(71, 1, 'chat', 71, 1, '2026-01-05 07:55:40', '2025-12-13 07:15:27', NULL),
(72, 4, 'chat', 72, NULL, NULL, '2025-12-15 06:58:15', NULL),
(73, 4, 'chat', 73, NULL, NULL, '2025-12-15 06:58:16', NULL),
(74, 4, 'chat', 74, NULL, NULL, '2025-12-15 06:58:32', NULL),
(75, 1, 'chat', 75, 1, '2026-01-05 07:55:40', '2025-12-15 07:13:36', NULL),
(76, 1, 'chat', 76, 1, '2026-01-05 07:55:40', '2025-12-15 07:13:51', NULL),
(77, 1, 'chat', 77, 1, '2026-01-05 07:55:40', '2025-12-15 07:20:02', NULL),
(78, 1, 'chat', 78, 1, '2026-01-05 07:55:40', '2025-12-15 07:20:54', NULL),
(79, 1, 'chat', 79, 1, '2026-01-05 07:55:40', '2025-12-15 07:25:00', NULL),
(80, 1, 'chat', 80, 1, '2026-01-05 07:55:40', '2025-12-15 07:25:02', NULL),
(81, 1, 'chat', 81, 1, '2026-01-05 07:55:40', '2025-12-15 07:30:34', NULL),
(82, 1, 'chat', 82, 1, '2026-01-05 07:55:40', '2025-12-15 07:32:20', NULL),
(83, 1, 'chat', 83, 1, '2026-01-05 07:55:40', '2025-12-15 09:46:58', NULL),
(84, 1, 'chat', 84, 1, '2026-01-05 07:55:40', '2025-12-15 09:59:26', NULL),
(85, 1, 'chat', 85, 1, '2026-01-05 07:55:40', '2025-12-15 09:59:45', NULL),
(86, 1, 'chat', 86, 1, '2026-01-05 07:55:40', '2025-12-15 10:09:21', NULL),
(87, 1, 'chat', 87, 1, '2026-01-05 07:55:40', '2025-12-15 10:14:44', NULL),
(88, 1, 'chat', 88, 1, '2026-01-05 07:55:40', '2025-12-15 10:48:04', NULL),
(89, 1, 'chat', 89, 1, '2026-01-05 07:55:40', '2025-12-15 10:50:50', NULL),
(90, 1, 'chat', 90, 1, '2026-01-05 07:55:40', '2025-12-15 10:50:52', NULL),
(91, 1, 'chat', 91, 1, '2026-01-05 07:55:40', '2025-12-15 10:51:24', NULL),
(92, 1, 'chat', 92, 1, '2026-01-05 07:55:40', '2025-12-15 10:52:50', NULL),
(93, 4, 'chat', 93, NULL, NULL, '2025-12-15 10:54:12', NULL),
(94, 1, 'chat', 94, 1, '2026-01-05 07:55:40', '2025-12-15 11:09:10', NULL),
(95, 1, 'chat', 95, 1, '2026-01-05 07:55:40', '2025-12-15 11:09:42', NULL),
(96, 1, 'chat', 96, 1, '2026-01-05 07:55:40', '2025-12-15 11:28:43', NULL),
(97, 1, 'chat', 97, 1, '2026-01-05 07:55:40', '2025-12-15 11:29:16', NULL),
(98, 1, 'chat', 98, 1, '2026-01-05 07:55:40', '2025-12-15 11:38:20', NULL),
(99, 1, 'chat', 99, 1, '2026-01-05 07:55:40', '2025-12-15 11:38:32', NULL),
(100, 4, 'chat', 100, NULL, NULL, '2025-12-15 11:42:36', NULL),
(101, 1, 'chat', 101, 1, '2026-01-05 07:55:40', '2025-12-15 11:43:47', NULL),
(102, 1, 'chat', 102, 1, '2026-01-05 07:55:40', '2025-12-15 11:44:01', NULL),
(103, 1, 'chat', 103, 1, '2026-01-05 07:55:40', '2025-12-15 11:44:19', NULL),
(104, 1, 'chat', 104, 1, '2026-01-05 07:55:40', '2025-12-15 11:44:30', NULL),
(105, 1, 'chat', 105, 1, '2026-01-05 07:55:40', '2025-12-15 11:46:21', NULL),
(106, 1, 'chat', 106, 1, '2026-01-05 07:55:40', '2025-12-15 11:47:10', NULL),
(107, 1, 'chat', 107, 1, '2026-01-05 07:55:40', '2025-12-15 11:48:46', NULL),
(108, 1, 'chat', 108, 1, '2026-01-05 07:55:40', '2025-12-15 11:49:04', NULL),
(109, 3, 'chat', 109, NULL, NULL, '2025-12-15 11:56:55', NULL),
(110, 3, 'chat', 110, NULL, NULL, '2025-12-15 11:58:28', NULL),
(111, 3, 'chat', 111, NULL, NULL, '2025-12-15 11:58:29', NULL),
(112, 1, 'chat', 112, 1, '2026-01-05 07:55:40', '2025-12-15 12:14:26', NULL),
(113, 2, 'chat', 113, NULL, NULL, '2025-12-15 12:14:27', NULL),
(114, 3, 'chat', 114, NULL, NULL, '2025-12-15 12:14:29', NULL),
(115, 4, 'chat', 115, NULL, NULL, '2025-12-15 12:14:30', NULL),
(116, 1, 'chat', 116, 1, '2026-01-05 07:55:40', '2025-12-15 12:15:41', NULL),
(117, 1, 'chat', 117, 1, '2026-01-05 07:55:40', '2025-12-15 12:16:23', NULL),
(118, 1, 'chat', 118, 1, '2026-01-05 07:55:40', '2025-12-16 12:24:30', NULL),
(119, 1, 'chat', 119, 1, '2026-01-05 07:55:40', '2025-12-16 12:24:40', NULL),
(120, 1, 'chat', 120, 1, '2026-01-05 07:55:40', '2025-12-16 12:24:41', NULL),
(121, 1, 'chat', 121, 1, '2026-01-05 07:55:40', '2025-12-16 12:24:48', NULL),
(122, 1, 'chat', 122, 1, '2026-01-05 07:55:40', '2025-12-16 12:24:55', NULL),
(123, 1, 'chat', 123, 1, '2026-01-05 07:55:40', '2025-12-16 12:25:03', NULL),
(124, 1, 'chat', 124, 1, '2026-01-05 07:55:40', '2025-12-16 12:25:09', NULL),
(125, 1, 'chat', 125, 1, '2026-01-05 07:55:40', '2025-12-16 12:26:24', NULL),
(126, 4, 'chat', 126, NULL, NULL, '2025-12-16 12:26:25', NULL),
(127, 1, 'chat', 127, 1, '2026-01-05 07:55:40', '2025-12-16 12:26:55', NULL),
(128, 1, 'chat', 128, 1, '2026-01-05 07:55:40', '2025-12-16 12:27:06', NULL),
(129, 1, 'chat', 129, 1, '2026-01-05 07:55:40', '2025-12-16 12:29:00', NULL),
(130, 1, 'chat', 130, 1, '2026-01-05 07:55:40', '2025-12-16 12:29:01', NULL),
(131, 1, 'chat', 131, 1, '2026-01-05 07:55:40', '2025-12-16 12:31:30', NULL),
(132, 4, 'chat', 132, NULL, NULL, '2025-12-16 12:31:31', NULL),
(133, 1, 'chat', 133, 1, '2026-01-05 07:55:40', '2025-12-16 12:35:57', NULL),
(134, 1, 'chat', 134, 1, '2026-01-05 07:55:40', '2025-12-17 05:17:20', NULL),
(135, 1, 'chat', 135, 1, '2026-01-05 07:55:40', '2025-12-17 05:17:22', NULL),
(136, 1, 'chat', 136, 1, '2026-01-05 07:55:40', '2025-12-17 05:17:38', NULL),
(137, 1, 'chat', 137, 1, '2026-01-05 07:55:40', '2025-12-17 05:17:39', NULL),
(138, 1, 'chat', 138, 1, '2026-01-05 07:55:40', '2025-12-17 05:18:16', NULL),
(139, 1, 'chat', 139, 1, '2026-01-05 07:55:40', '2025-12-17 07:59:44', NULL),
(140, 1, 'chat', 140, 1, '2026-01-05 07:55:40', '2025-12-19 06:09:45', NULL),
(141, 1, 'chat', 141, 1, '2026-01-05 07:55:40', '2025-12-19 06:26:42', NULL),
(142, 1, 'chat', 142, 1, '2026-01-05 07:55:40', '2025-12-19 06:32:50', NULL),
(143, 1, 'chat', 143, 1, '2026-01-05 07:55:40', '2025-12-19 06:35:49', NULL),
(144, 1, 'chat', 144, 1, '2026-01-05 07:55:40', '2025-12-26 07:38:05', NULL),
(145, 1, 'chat', 145, 1, '2026-01-05 07:55:40', '2025-12-26 09:13:58', NULL),
(146, 1, 'chat', 146, 1, '2026-01-05 07:55:40', '2025-12-26 09:16:40', NULL),
(147, 1, 'chat', 147, 1, '2026-01-05 07:55:40', '2025-12-26 09:18:13', NULL),
(148, 1, 'chat', 148, 1, '2026-01-05 07:55:40', '2025-12-26 09:18:36', NULL),
(149, 1, 'chat', 149, 1, '2026-01-05 07:55:40', '2025-12-26 09:24:41', NULL),
(150, 3, 'chat', 150, NULL, NULL, '2025-12-26 09:30:19', NULL),
(151, 1, 'chat', 151, 1, '2026-01-05 07:55:40', '2025-12-26 09:38:58', NULL),
(152, 1, 'chat', 152, 1, '2026-01-05 07:55:40', '2025-12-26 09:40:14', NULL),
(153, 1, 'chat', 153, 1, '2026-01-05 07:55:40', '2025-12-26 09:52:49', NULL),
(154, 1, 'chat', 154, 1, '2026-01-05 07:55:40', '2025-12-26 09:53:04', NULL),
(155, 1, 'chat', 155, 1, '2026-01-05 07:55:40', '2025-12-26 09:58:39', NULL),
(156, 1, 'chat', 156, 1, '2026-01-05 07:55:40', '2025-12-26 10:13:54', NULL),
(157, 1, 'chat', 157, 1, '2026-01-05 07:55:40', '2025-12-26 10:40:21', NULL),
(158, 1, 'chat', 158, 1, '2026-01-05 07:55:40', '2025-12-26 10:42:27', NULL),
(159, 1, 'chat', 159, 1, '2026-01-05 07:55:40', '2025-12-26 10:47:10', NULL),
(160, 1, 'chat', 160, 1, '2026-01-05 07:55:40', '2025-12-27 05:44:01', NULL),
(161, 1, 'chat', 161, 1, '2026-01-05 07:55:40', '2025-12-27 05:46:34', NULL),
(162, 1, 'chat', 162, 1, '2026-01-05 07:55:40', '2025-12-27 07:22:37', NULL),
(163, 1, 'chat', 163, 1, '2026-01-05 07:55:40', '2025-12-27 11:18:39', NULL),
(164, 1, 'chat', 164, 1, '2026-01-05 07:55:40', '2025-12-27 11:21:46', NULL),
(165, 1, 'chat', 165, 1, '2026-01-05 07:55:40', '2025-12-30 05:31:41', NULL),
(166, 1, 'chat', 166, 1, '2026-01-05 07:55:40', '2025-12-30 05:31:50', NULL),
(167, 1, 'chat', 167, 1, '2026-01-05 07:55:40', '2025-12-30 05:32:07', NULL),
(168, 1, 'chat', 168, 1, '2026-01-05 07:55:40', '2025-12-30 05:33:07', NULL),
(169, 1, 'chat', 169, 1, '2026-01-05 07:55:40', '2025-12-30 05:57:49', NULL),
(170, 1, 'chat', 170, 1, '2026-01-05 07:55:40', '2025-12-30 05:57:51', NULL),
(171, 1, 'chat', 171, 1, '2026-01-05 07:55:40', '2025-12-30 07:07:17', NULL),
(172, 1, 'chat', 172, 1, '2026-01-05 07:55:40', '2025-12-30 07:19:48', NULL),
(173, 1, 'chat', 173, 1, '2026-01-05 07:55:40', '2025-12-30 10:19:45', NULL),
(174, 1, 'chat', 174, 1, '2026-01-05 07:55:40', '2025-12-30 11:13:51', NULL),
(175, 1, 'ticket', 1, NULL, NULL, '2025-12-30 11:15:18', NULL),
(176, 1, 'notes', 1, NULL, NULL, '2025-12-30 11:16:08', NULL),
(177, 1, 'notes', 2, NULL, NULL, '2025-12-30 11:18:07', NULL),
(178, 1, 'chat', 175, 1, '2026-01-05 07:55:40', '2026-01-02 06:33:04', NULL),
(179, 1, 'chat', 176, 1, '2026-01-05 07:55:40', '2026-01-02 06:34:58', NULL),
(180, 1, 'chat', 177, 1, '2026-01-05 07:55:40', '2026-01-02 06:37:34', NULL),
(181, 1, 'chat', 178, 1, '2026-01-05 07:55:40', '2026-01-02 06:39:37', NULL),
(182, 1, 'chat', 179, 1, '2026-01-05 07:55:40', '2026-01-02 06:40:59', NULL),
(183, 1, 'chat', 180, 1, '2026-01-05 07:55:40', '2026-01-02 06:46:37', NULL),
(184, 1, 'chat', 181, 1, '2026-01-05 07:55:40', '2026-01-02 06:52:37', NULL),
(185, 1, 'chat', 182, 1, '2026-01-05 07:55:40', '2026-01-02 07:03:16', NULL),
(186, 1, 'chat', 183, 1, '2026-01-05 07:55:40', '2026-01-02 07:08:13', NULL),
(187, 1, 'chat', 184, 1, '2026-01-05 07:55:40', '2026-01-02 07:09:30', NULL),
(188, 1, 'chat', 185, 1, '2026-01-05 07:55:40', '2026-01-02 07:09:47', NULL),
(189, 1, 'chat', 186, 1, '2026-01-05 07:55:40', '2026-01-02 07:10:48', NULL),
(190, 3, 'chat', 187, NULL, NULL, '2026-01-02 07:14:00', NULL),
(191, 3, 'chat', 188, NULL, NULL, '2026-01-02 07:14:02', NULL),
(192, 1, 'chat', 189, 1, '2026-01-05 07:55:40', '2026-01-02 09:30:36', NULL),
(193, 1, 'chat', 190, 1, '2026-01-05 07:55:40', '2026-01-02 09:31:13', NULL),
(194, 1, 'chat', 191, 1, '2026-01-05 07:55:40', '2026-01-02 11:30:34', NULL),
(195, 1, 'chat', 192, 1, '2026-01-05 07:55:40', '2026-01-02 11:32:09', NULL),
(196, 1, 'chat', 193, 1, '2026-01-05 07:55:40', '2026-01-02 11:35:46', NULL),
(197, 1, 'chat', 194, 1, '2026-01-05 07:55:40', '2026-01-02 11:48:14', NULL),
(198, 1, 'chat', 195, 1, '2026-01-05 07:55:40', '2026-01-05 07:55:21', NULL),
(199, 1, 'chat', 196, NULL, NULL, '2026-01-05 07:56:00', NULL),
(200, 1, 'chat', 197, NULL, NULL, '2026-01-05 07:56:07', NULL),
(201, 1, 'chat', 198, NULL, NULL, '2026-01-05 07:58:33', NULL),
(202, 1, 'chat', 199, NULL, NULL, '2026-01-05 07:58:49', NULL),
(203, 1, 'chat', 200, NULL, NULL, '2026-01-05 07:58:59', NULL),
(204, 1, 'chat', 201, NULL, NULL, '2026-01-05 13:13:17', NULL),
(205, 1, 'chat', 202, NULL, NULL, '2026-01-05 13:25:39', NULL),
(206, 5, 'chat', 203, NULL, NULL, '2026-01-05 13:27:35', NULL),
(207, 6, 'chat', 204, NULL, NULL, '2026-01-05 13:28:37', NULL),
(208, 5, 'chat', 205, NULL, NULL, '2026-01-06 05:14:43', NULL),
(209, 7, 'chat', 206, NULL, NULL, '2026-01-06 05:14:59', NULL),
(210, 5, 'chat', 207, NULL, NULL, '2026-01-06 05:15:02', NULL),
(211, 5, 'chat', 208, NULL, NULL, '2026-01-06 05:15:17', NULL),
(212, 7, 'chat', 209, NULL, NULL, '2026-01-06 05:15:22', NULL),
(213, 5, 'chat', 210, NULL, NULL, '2026-01-06 08:56:57', NULL),
(214, 6, 'chat', 211, NULL, NULL, '2026-01-06 08:56:58', NULL),
(215, 7, 'chat', 212, NULL, NULL, '2026-01-06 08:57:00', NULL),
(216, 5, 'chat', 213, NULL, NULL, '2026-01-07 05:06:34', NULL),
(217, 8, 'chat', 214, NULL, NULL, '2026-01-07 10:25:21', NULL),
(218, 8, 'chat', 215, NULL, NULL, '2026-01-07 10:25:39', NULL),
(219, 8, 'chat', 216, NULL, NULL, '2026-01-07 10:25:43', NULL),
(220, 9, 'chat', 217, NULL, NULL, '2026-01-07 12:17:33', NULL),
(221, 9, 'chat', 218, NULL, NULL, '2026-01-07 12:19:57', NULL),
(222, 10, 'chat', 219, NULL, NULL, '2026-01-08 06:08:25', NULL),
(223, 11, 'chat', 220, NULL, NULL, '2026-01-08 12:06:21', NULL),
(224, 11, 'chat', 221, NULL, NULL, '2026-01-08 12:06:41', NULL),
(225, 11, 'chat', 222, NULL, NULL, '2026-01-08 12:32:11', NULL),
(226, 12, 'chat', 223, NULL, NULL, '2026-01-08 12:33:33', NULL),
(227, 12, 'chat', 224, NULL, NULL, '2026-01-08 12:34:31', NULL),
(228, 11, 'chat', 225, NULL, NULL, '2026-01-09 13:06:35', NULL),
(229, 11, 'chat', 226, NULL, NULL, '2026-01-09 13:08:58', NULL),
(230, 12, 'chat', 227, NULL, NULL, '2026-01-09 13:09:00', NULL),
(231, 11, 'chat', 228, NULL, NULL, '2026-01-10 05:24:18', NULL),
(232, 11, 'chat', 229, NULL, NULL, '2026-01-13 05:12:05', NULL),
(233, 14, 'chat', 230, NULL, NULL, '2026-01-14 08:53:11', NULL),
(234, 12, 'chat', 231, NULL, NULL, '2026-01-16 10:10:22', NULL),
(235, 12, 'chat', 232, NULL, NULL, '2026-01-16 10:10:31', NULL),
(236, 12, 'chat', 233, NULL, NULL, '2026-01-16 10:10:43', NULL),
(237, 12, 'chat', 234, NULL, NULL, '2026-01-19 06:47:49', NULL),
(238, 12, 'chat', 235, NULL, NULL, '2026-01-19 06:47:51', NULL),
(239, 12, 'chat', 236, NULL, NULL, '2026-01-19 06:50:20', NULL),
(240, 16, 'chat', 237, NULL, NULL, '2026-01-19 11:10:47', NULL),
(241, 16, 'chat', 238, NULL, NULL, '2026-01-19 11:11:02', NULL),
(242, 16, 'chat', 239, NULL, NULL, '2026-01-19 11:15:20', NULL),
(243, 16, 'chat', 240, NULL, NULL, '2026-01-19 11:18:57', NULL),
(244, 16, 'chat', 241, NULL, NULL, '2026-01-19 11:18:58', NULL),
(245, 16, 'chat', 242, NULL, NULL, '2026-01-19 11:19:06', NULL),
(246, 16, 'chat', 244, NULL, NULL, '2026-01-19 11:19:06', NULL),
(247, 16, 'chat', 243, NULL, NULL, '2026-01-19 11:19:06', NULL),
(248, 16, 'chat', 246, NULL, NULL, '2026-01-19 11:19:07', NULL),
(249, 16, 'chat', 245, NULL, NULL, '2026-01-19 11:19:07', NULL),
(250, 16, 'chat', 247, NULL, NULL, '2026-01-19 11:19:08', NULL),
(251, 16, 'chat', 248, NULL, NULL, '2026-01-19 11:19:08', NULL),
(252, 16, 'chat', 249, NULL, NULL, '2026-01-19 11:19:09', NULL),
(253, 16, 'chat', 250, NULL, NULL, '2026-01-19 11:19:10', NULL),
(254, 16, 'chat', 251, NULL, NULL, '2026-01-19 11:19:10', NULL),
(255, 16, 'chat', 252, NULL, NULL, '2026-01-19 11:19:10', NULL),
(256, 16, 'chat', 253, NULL, NULL, '2026-01-19 11:19:11', NULL),
(257, 16, 'chat', 254, NULL, NULL, '2026-01-19 11:45:03', NULL),
(258, 12, 'chat', 255, NULL, NULL, '2026-01-20 07:24:10', NULL),
(259, 12, 'chat', 256, NULL, NULL, '2026-01-20 07:24:36', NULL),
(260, 12, 'notes', 3, NULL, NULL, '2026-01-20 07:44:06', NULL),
(261, 12, 'ticket', 2, NULL, NULL, '2026-01-20 07:46:07', NULL),
(262, 12, 'notes', 4, NULL, NULL, '2026-01-20 07:46:26', NULL),
(263, 12, 'ticket', 3, NULL, NULL, '2026-01-20 07:46:47', NULL),
(264, 12, 'chat', 257, NULL, NULL, '2026-01-20 07:48:18', NULL),
(265, 18, 'ticket', 4, NULL, NULL, '2026-01-20 11:50:46', NULL),
(266, 18, 'chat', 258, NULL, NULL, '2026-01-20 11:50:46', NULL),
(267, 18, 'chat', 259, NULL, NULL, '2026-01-20 11:51:24', NULL),
(268, 18, 'chat', 260, NULL, NULL, '2026-01-20 11:57:20', NULL),
(269, 18, 'chat', 261, NULL, NULL, '2026-01-20 12:06:49', NULL),
(270, 18, 'chat', 262, NULL, NULL, '2026-01-20 12:20:35', NULL),
(271, 18, 'chat', 263, NULL, NULL, '2026-01-20 12:33:23', NULL),
(272, 18, 'chat', 264, NULL, NULL, '2026-01-20 12:51:48', NULL),
(273, 18, 'chat', 265, NULL, NULL, '2026-01-20 13:08:09', NULL),
(274, 18, 'chat', 266, NULL, NULL, '2026-01-20 13:18:59', NULL),
(275, 18, 'chat', 267, NULL, NULL, '2026-01-20 13:19:00', NULL),
(276, 19, 'ticket', 5, NULL, NULL, '2026-01-20 13:22:31', NULL),
(277, 19, 'chat', 268, NULL, NULL, '2026-01-20 13:22:31', NULL),
(278, 19, 'chat', 269, NULL, NULL, '2026-01-20 13:22:36', NULL),
(279, 19, 'chat', 270, NULL, NULL, '2026-01-20 13:22:39', NULL),
(280, 19, 'chat', 271, NULL, NULL, '2026-01-20 13:22:45', NULL),
(281, 19, 'chat', 272, NULL, NULL, '2026-01-20 13:22:48', NULL),
(282, 19, 'chat', 273, NULL, NULL, '2026-01-20 13:22:49', NULL),
(283, 19, 'chat', 274, NULL, NULL, '2026-01-20 13:23:03', NULL),
(284, 18, 'ticket', 6, NULL, NULL, '2026-01-20 13:25:33', NULL),
(285, 18, 'ticket', 7, NULL, NULL, '2026-01-21 05:34:37', NULL),
(286, 18, 'chat', 275, NULL, NULL, '2026-01-21 05:34:37', NULL),
(287, 18, 'chat', 276, NULL, NULL, '2026-01-21 05:35:16', NULL),
(288, 18, 'chat', 277, NULL, NULL, '2026-01-21 05:36:26', NULL),
(289, 18, 'chat', 278, NULL, NULL, '2026-01-21 05:53:50', NULL),
(290, 18, 'chat', 279, NULL, NULL, '2026-01-21 06:55:33', NULL),
(291, 18, 'chat', 280, NULL, NULL, '2026-01-21 06:55:34', NULL),
(292, 18, 'chat', 281, NULL, NULL, '2026-01-21 06:55:43', NULL),
(293, 18, 'chat', 282, NULL, NULL, '2026-01-21 06:58:00', NULL),
(294, 18, 'chat', 283, NULL, NULL, '2026-01-21 06:58:01', NULL),
(295, 18, 'ticket', 8, NULL, NULL, '2026-01-21 08:47:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_media`
--

CREATE TABLE `chat_media` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` enum('local','amazon') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_media`
--

INSERT INTO `chat_media` (`id`, `name`, `path`, `location`, `type`, `size`, `created_at`) VALUES
(1, '1756284746578-IMG_0010.png', 'public/vWWwTFt74aFQhM5j9aPnyWAoZgrgHXH7PogwE5sF.png', 'local', 'image/png', '600725', '2025-12-05 06:19:18'),
(2, '1756284746578-IMG_0010.png', 'public/24LPaK52OU9lF1w9dkgC923taXaOLr0E3epNyu5m.png', 'local', 'image/png', '600725', '2025-12-05 06:40:22'),
(3, 'Transaction Success Confirmation.png', 'public/Auab4n0aRHRXY2wQeX4LXp5IWHW7pcMvnG0yuDgX.png', 'local', 'image/png', '1109672', '2025-12-05 13:06:34'),
(4, 'Transaction Success Confirmation.png', 'public/cjiLQPqhnD9K85MCWvuTFLlXyLHuCs1tITcBgJvn.png', 'local', 'image/png', '1109672', '2025-12-15 11:43:47'),
(5, 'N/A', 'public/9a5ca8e050648195c70741a3c3a4146d6723312d_1768821546.jpeg', 'local', 'image/jpeg', '96791', '2026-01-19 11:19:06'),
(6, 'N/A', 'public/12a8dad8f78bc93837d8c4f4427b34f5991c3995_1768821546.jpeg', 'local', 'image/jpeg', '86954', '2026-01-19 11:19:06'),
(7, 'N/A', 'public/6f34cfb5456fcd7bec28d6672adaf9a293c957c9_1768821546.jpeg', 'local', 'image/jpeg', '83022', '2026-01-19 11:19:06'),
(8, 'N/A', 'public/205a96c54cf704e3c2b587a48169dd312e3447dc_1768821547.jpeg', 'local', 'image/jpeg', '74101', '2026-01-19 11:19:07'),
(9, 'N/A', 'public/c1089b1c8e2b55ed51cf5d88d3464633a3caedce_1768821547.jpeg', 'local', 'image/jpeg', '96204', '2026-01-19 11:19:07'),
(10, 'N/A', 'public/b5ee419438cb8b35bddc19c7580fd09b9a9b83fe_1768821548.jpeg', 'local', 'image/jpeg', '86559', '2026-01-19 11:19:08'),
(11, 'N/A', 'public/c1089b1c8e2b55ed51cf5d88d3464633a3caedce_1768821548.jpeg', 'local', 'image/jpeg', '96204', '2026-01-19 11:19:08'),
(12, 'N/A', 'public/899682724ab11ae7f08f75c1cf477dc2ef3a4ebe_1768821549.jpeg', 'local', 'image/jpeg', '70049', '2026-01-19 11:19:09'),
(13, 'N/A', 'public/9a5ca8e050648195c70741a3c3a4146d6723312d_1768821550.jpeg', 'local', 'image/jpeg', '96791', '2026-01-19 11:19:10'),
(14, 'N/A', 'public/dbf230e3982589895564284b0af30f78d9ee7245_1768821550.jpeg', 'local', 'image/jpeg', '105203', '2026-01-19 11:19:10'),
(15, 'N/A', 'public/12a8dad8f78bc93837d8c4f4427b34f5991c3995_1768821550.jpeg', 'local', 'image/jpeg', '86954', '2026-01-19 11:19:10'),
(16, 'N/A', 'public/6f34cfb5456fcd7bec28d6672adaf9a293c957c9_1768821551.jpeg', 'local', 'image/jpeg', '83022', '2026-01-19 11:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `chat_notes`
--

CREATE TABLE `chat_notes` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint UNSIGNED NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_notes`
--

INSERT INTO `chat_notes` (`id`, `uuid`, `contact_id`, `content`, `created_by`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, '2987cc2a-00c1-4afe-b810-1329772aa092', 1, 'this is test', 1, NULL, NULL, '2025-12-30 11:16:08', '2025-12-30 11:16:08'),
(2, '38ef8c19-fc68-4cd7-96b4-8820dc5184c1', 1, 'ok', 6, NULL, NULL, '2025-12-30 11:18:07', '2025-12-30 11:18:07'),
(3, 'e909a622-99d1-4836-bcf9-5445a680071c', 12, 'testing note1', 6, NULL, NULL, '2026-01-20 07:44:06', '2026-01-20 07:44:06'),
(4, 'e28d1fa0-6a32-49de-afc7-038bd4914d98', 12, 'testing 2', 6, NULL, NULL, '2026-01-20 07:46:26', '2026-01-20 07:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `chat_status_logs`
--

CREATE TABLE `chat_status_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `chat_id` int NOT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_status_logs`
--

INSERT INTO `chat_status_logs` (`id`, `chat_id`, `metadata`, `created_at`) VALUES
(1, 14, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMDMyRUZCMTEwN0I1NEVGNTc2AA==\",\"status\":\"sent\",\"timestamp\":\"1764912539\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 05:29:01'),
(2, 14, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMDMyRUZCMTEwN0I1NEVGNTc2AA==\",\"status\":\"read\",\"timestamp\":\"1764912539\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 05:29:01'),
(3, 18, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMTY3RDgzQjkzQ0ZBNTA0REVFAA==\",\"status\":\"sent\",\"timestamp\":\"1764915494\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:18:15'),
(4, 18, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMTY3RDgzQjkzQ0ZBNTA0REVFAA==\",\"status\":\"read\",\"timestamp\":\"1764915494\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:18:16'),
(5, 20, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUREMTE1OEYxRTg5M0M5QTdEAA==\",\"status\":\"sent\",\"timestamp\":\"1764915506\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:18:27'),
(6, 20, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUREMTE1OEYxRTg5M0M5QTdEAA==\",\"status\":\"read\",\"timestamp\":\"1764915506\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:18:28'),
(7, 21, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTg3OEQ5M0ZGQTE1QjAxQzgyAA==\",\"status\":\"sent\",\"timestamp\":\"1764915561\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:19:23'),
(8, 21, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTg3OEQ5M0ZGQTE1QjAxQzgyAA==\",\"status\":\"delivered\",\"timestamp\":\"1764915562\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:19:23'),
(9, 21, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTg3OEQ5M0ZGQTE1QjAxQzgyAA==\",\"status\":\"read\",\"timestamp\":\"1764915565\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:19:27'),
(10, 23, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSREE3NDJGM0JGRDQxRDhCMDc2AA==\",\"status\":\"sent\",\"timestamp\":\"1764916756\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:39:17'),
(11, 23, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSREE3NDJGM0JGRDQxRDhCMDc2AA==\",\"status\":\"delivered\",\"timestamp\":\"1764916756\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:39:18'),
(12, 23, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSREE3NDJGM0JGRDQxRDhCMDc2AA==\",\"status\":\"read\",\"timestamp\":\"1764916756\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:39:18'),
(13, 23, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSREE3NDJGM0JGRDQxRDhCMDc2AA==\",\"status\":\"delivered\",\"timestamp\":\"1764916756\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:39:18'),
(14, 24, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRUZBMkFFRUIyRDkzNkNBRTQwAA==\",\"status\":\"sent\",\"timestamp\":\"1764916824\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:40:25'),
(15, 24, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRUZBMkFFRUIyRDkzNkNBRTQwAA==\",\"status\":\"delivered\",\"timestamp\":\"1764916824\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:40:25'),
(16, 24, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRUZBMkFFRUIyRDkzNkNBRTQwAA==\",\"status\":\"delivered\",\"timestamp\":\"1764916824\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:40:26'),
(17, 24, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRUZBMkFFRUIyRDkzNkNBRTQwAA==\",\"status\":\"read\",\"timestamp\":\"1764916824\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:40:26'),
(18, 26, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSQzNDM0NBN0M4OTFGNDk3NDA1AA==\",\"status\":\"sent\",\"timestamp\":\"1764916845\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:40:46'),
(19, 26, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSQzNDM0NBN0M4OTFGNDk3NDA1AA==\",\"status\":\"delivered\",\"timestamp\":\"1764916845\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:40:46'),
(20, 26, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSQzNDM0NBN0M4OTFGNDk3NDA1AA==\",\"status\":\"read\",\"timestamp\":\"1764916845\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 06:40:47'),
(21, 29, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSMDBDM0FGMUFDRTk2OUQ4RUIyAA==\",\"status\":\"delivered\",\"timestamp\":\"1764918303\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-05 07:05:04'),
(22, 30, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTU1ODlCRTMwQkVENDRFQzlBAA==\",\"status\":\"sent\",\"timestamp\":\"1764918304\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-05 07:05:06'),
(23, 30, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTU1ODlCRTMwQkVENDRFQzlBAA==\",\"status\":\"delivered\",\"timestamp\":\"1764918305\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-05 07:05:07'),
(24, 29, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSMDBDM0FGMUFDRTk2OUQ4RUIyAA==\",\"status\":\"read\",\"timestamp\":\"1764918308\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-05 07:05:10'),
(25, 32, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSQTAwRkZCNzhDQ0UzRThBMjhEAA==\",\"status\":\"sent\",\"timestamp\":\"1764918315\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 07:05:16'),
(26, 32, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSQTAwRkZCNzhDQ0UzRThBMjhEAA==\",\"status\":\"delivered\",\"timestamp\":\"1764918315\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 07:05:17'),
(27, 32, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSQTAwRkZCNzhDQ0UzRThBMjhEAA==\",\"status\":\"read\",\"timestamp\":\"1764918318\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 07:05:20'),
(28, 28, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUMzRkQ4MTRDREVBNDVCM0VGAA==\",\"status\":\"delivered\",\"timestamp\":\"1764918333\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-05 07:05:34'),
(29, 34, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTdFRjZFNDk4NTlEOUE4RkM0AA==\",\"status\":\"delivered\",\"timestamp\":\"1764921523\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-05 07:58:45'),
(30, 35, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSOTYxQTJFREJFMENFQTIwNzU5AA==\",\"status\":\"delivered\",\"timestamp\":\"1764921524\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-05 07:58:45'),
(31, 36, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSOEY5NkZCODQ1QzRGREMzQTJCAA==\",\"status\":\"failed\",\"timestamp\":\"1764921524\",\"recipient_id\":\"919257086309\",\"errors\":[{\"code\":131049,\"title\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"message\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"error_data\":{\"details\":\"In order to maintain a healthy ecosystem engagement, the message failed to be delivered.\"}}]}', '2025-12-05 07:58:46'),
(32, 37, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMERBQjRBODk0MTY4NkQ3OEM4AA==\",\"status\":\"failed\",\"timestamp\":\"1764921525\",\"recipient_id\":\"919672520566\",\"errors\":[{\"code\":131049,\"title\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"message\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"error_data\":{\"details\":\"In order to maintain a healthy ecosystem engagement, the message failed to be delivered.\"}}]}', '2025-12-05 07:58:47'),
(33, 35, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSOTYxQTJFREJFMENFQTIwNzU5AA==\",\"status\":\"read\",\"timestamp\":\"1764921530\",\"recipient_id\":\"919257086311\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-05 07:58:52'),
(34, 28, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUMzRkQ4MTRDREVBNDVCM0VGAA==\",\"status\":\"read\",\"timestamp\":\"1764921593\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-05 07:59:54'),
(35, 34, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTdFRjZFNDk4NTlEOUE4RkM0AA==\",\"status\":\"read\",\"timestamp\":\"1764921593\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-05 07:59:54'),
(36, 30, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTU1ODlCRTMwQkVENDRFQzlBAA==\",\"status\":\"read\",\"timestamp\":\"1764924534\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-05 08:48:57'),
(37, 40, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTExQkM2NzcwODA5NjQ5MTMzAA==\",\"status\":\"sent\",\"timestamp\":\"1764925213\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"utility\",\"type\":\"free_customer_service\"}}', '2025-12-05 09:00:15'),
(38, 41, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODRDMkE0QUNCNUM3OEYyRjcxAA==\",\"status\":\"sent\",\"timestamp\":\"1764925215\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"utility\",\"type\":\"regular\"}}', '2025-12-05 09:00:16'),
(39, 41, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODRDMkE0QUNCNUM3OEYyRjcxAA==\",\"status\":\"delivered\",\"timestamp\":\"1764925215\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"utility\",\"type\":\"regular\"}}', '2025-12-05 09:00:17'),
(40, 41, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODRDMkE0QUNCNUM3OEYyRjcxAA==\",\"status\":\"delivered\",\"timestamp\":\"1764925215\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"utility\",\"type\":\"regular\"}}', '2025-12-05 09:00:17'),
(41, 40, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTExQkM2NzcwODA5NjQ5MTMzAA==\",\"status\":\"delivered\",\"timestamp\":\"1764925215\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"utility\",\"type\":\"free_customer_service\"}}', '2025-12-05 09:00:17'),
(42, 40, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTExQkM2NzcwODA5NjQ5MTMzAA==\",\"status\":\"read\",\"timestamp\":\"1764925220\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"utility\",\"type\":\"free_customer_service\"}}', '2025-12-05 09:00:22'),
(43, 41, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODRDMkE0QUNCNUM3OEYyRjcxAA==\",\"status\":\"read\",\"timestamp\":\"1764925224\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"utility\",\"type\":\"regular\"}}', '2025-12-05 09:00:25'),
(44, 43, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSNUIyMTQ0RkQwMDZBRDJFMjc2AA==\",\"status\":\"sent\",\"timestamp\":\"1764925283\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 09:01:24'),
(45, 43, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSNUIyMTQ0RkQwMDZBRDJFMjc2AA==\",\"status\":\"delivered\",\"timestamp\":\"1764925283\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 09:01:24'),
(46, 43, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSNUIyMTQ0RkQwMDZBRDJFMjc2AA==\",\"status\":\"delivered\",\"timestamp\":\"1764925283\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 09:01:24'),
(47, 43, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSNUIyMTQ0RkQwMDZBRDJFMjc2AA==\",\"status\":\"read\",\"timestamp\":\"1764925286\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 09:01:27'),
(48, 45, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSNkQ3MUUwNDJCODFCQkU4MDY4AA==\",\"status\":\"sent\",\"timestamp\":\"1764925318\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 09:02:00'),
(49, 45, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSNkQ3MUUwNDJCODFCQkU4MDY4AA==\",\"status\":\"delivered\",\"timestamp\":\"1764925319\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 09:02:00'),
(50, 45, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSNkQ3MUUwNDJCODFCQkU4MDY4AA==\",\"status\":\"read\",\"timestamp\":\"1764925319\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 09:02:00'),
(51, 49, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMkU0RjA2RDk1QUQ3RjZDNzJEAA==\",\"status\":\"sent\",\"timestamp\":\"1764939999\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 13:06:40'),
(52, 49, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMkU0RjA2RDk1QUQ3RjZDNzJEAA==\",\"status\":\"delivered\",\"timestamp\":\"1764939999\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 13:06:41'),
(53, 49, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMkU0RjA2RDk1QUQ3RjZDNzJEAA==\",\"status\":\"read\",\"timestamp\":\"1764940066\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-05 13:07:48'),
(54, 51, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMkQzNjkyQjc2QTQzRUZCRUU3AA==\",\"status\":\"sent\",\"timestamp\":\"1765103143\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-07 10:25:44'),
(55, 51, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMkQzNjkyQjc2QTQzRUZCRUU3AA==\",\"status\":\"read\",\"timestamp\":\"1765103143\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-07 10:25:45'),
(56, 52, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTlCMDU2MjJFNkNFRDZDMTJEAA==\",\"status\":\"sent\",\"timestamp\":\"1765103157\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-07 10:25:58'),
(57, 52, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTlCMDU2MjJFNkNFRDZDMTJEAA==\",\"status\":\"delivered\",\"timestamp\":\"1765103157\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-07 10:25:58'),
(58, 52, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTlCMDU2MjJFNkNFRDZDMTJEAA==\",\"status\":\"read\",\"timestamp\":\"1765103158\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-07 10:25:59'),
(59, 54, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOERBMTkwMTRGRTgzMDFBNTY5AA==\",\"status\":\"sent\",\"timestamp\":\"1765103170\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-07 10:26:11'),
(60, 54, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOERBMTkwMTRGRTgzMDFBNTY5AA==\",\"status\":\"read\",\"timestamp\":\"1765103170\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-07 10:26:12'),
(61, 56, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNDFFM0NCRDk3Mjc5MTkyNTk2AA==\",\"status\":\"sent\",\"timestamp\":\"1765180265\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-08 07:51:07'),
(62, 56, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNDFFM0NCRDk3Mjc5MTkyNTk2AA==\",\"status\":\"delivered\",\"timestamp\":\"1765180266\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-08 07:51:07'),
(63, 56, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNDFFM0NCRDk3Mjc5MTkyNTk2AA==\",\"status\":\"read\",\"timestamp\":\"1765180266\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-08 07:51:08'),
(64, 57, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDhDQjFBRkQ1NTg3NzEwNEFDAA==\",\"status\":\"sent\",\"timestamp\":\"1765347989\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-10 06:26:31'),
(65, 57, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDhDQjFBRkQ1NTg3NzEwNEFDAA==\",\"status\":\"delivered\",\"timestamp\":\"1765347990\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-10 06:26:31'),
(66, 58, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTNCQkNDNEM4OTRCQjgwMDFBAA==\",\"status\":\"sent\",\"timestamp\":\"1765347990\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-10 06:26:32'),
(67, 58, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTNCQkNDNEM4OTRCQjgwMDFBAA==\",\"status\":\"delivered\",\"timestamp\":\"1765347991\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-10 06:26:32'),
(68, 57, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDhDQjFBRkQ1NTg3NzEwNEFDAA==\",\"status\":\"read\",\"timestamp\":\"1765348011\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-10 06:26:52'),
(69, 58, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTNCQkNDNEM4OTRCQjgwMDFBAA==\",\"status\":\"read\",\"timestamp\":\"1765349217\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-10 06:46:59'),
(70, 63, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMDY0NUIyRDA0RDQyNUVCQkYzAA==\",\"status\":\"sent\",\"timestamp\":\"1765537772\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-12 11:09:34'),
(71, 63, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMDY0NUIyRDA0RDQyNUVCQkYzAA==\",\"status\":\"read\",\"timestamp\":\"1765537773\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-12 11:09:34'),
(72, 63, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMDY0NUIyRDA0RDQyNUVCQkYzAA==\",\"status\":\"delivered\",\"timestamp\":\"1765537773\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-12 11:09:34'),
(73, 65, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMjM3Q0U2OTVBRkI3Nzg3QzE4AA==\",\"status\":\"sent\",\"timestamp\":\"1765537785\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-12 11:09:46'),
(74, 65, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMjM3Q0U2OTVBRkI3Nzg3QzE4AA==\",\"status\":\"delivered\",\"timestamp\":\"1765537786\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-12 11:09:47'),
(75, 65, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMjM3Q0U2OTVBRkI3Nzg3QzE4AA==\",\"status\":\"read\",\"timestamp\":\"1765537786\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-12 11:09:47'),
(76, 67, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNUM4M0VGNDAxQzE4RUY1RTFFAA==\",\"status\":\"sent\",\"timestamp\":\"1765604331\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-13 05:38:52'),
(77, 67, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNUM4M0VGNDAxQzE4RUY1RTFFAA==\",\"status\":\"read\",\"timestamp\":\"1765604331\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-13 05:38:54'),
(78, 69, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNTFFOTIyODE5NEI1MkE2QkRFAA==\",\"status\":\"sent\",\"timestamp\":\"1765604342\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-13 05:39:04'),
(79, 69, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNTFFOTIyODE5NEI1MkE2QkRFAA==\",\"status\":\"read\",\"timestamp\":\"1765604343\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-13 05:39:05'),
(80, 71, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDYwOUNEODlFMzdBRDlBMThCAA==\",\"status\":\"sent\",\"timestamp\":\"1765610127\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-13 07:15:28'),
(81, 71, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDYwOUNEODlFMzdBRDlBMThCAA==\",\"status\":\"delivered\",\"timestamp\":\"1765610127\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-13 07:15:29'),
(82, 71, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDYwOUNEODlFMzdBRDlBMThCAA==\",\"status\":\"read\",\"timestamp\":\"1765610159\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-13 07:16:01'),
(83, 74, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTVCRDFERUU3QTdGMzU2MkRGAA==\",\"status\":\"sent\",\"timestamp\":\"1765781912\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 06:58:34'),
(84, 74, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTVCRDFERUU3QTdGMzU2MkRGAA==\",\"status\":\"delivered\",\"timestamp\":\"1765781913\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 06:58:34'),
(85, 74, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTVCRDFERUU3QTdGMzU2MkRGAA==\",\"status\":\"delivered\",\"timestamp\":\"1765781913\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 06:58:35'),
(86, 76, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQzgwOUYzOENGNUY4QjI1Q0FDAA==\",\"status\":\"sent\",\"timestamp\":\"1765782831\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 07:13:53'),
(87, 76, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQzgwOUYzOENGNUY4QjI1Q0FDAA==\",\"status\":\"read\",\"timestamp\":\"1765782832\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 07:13:54'),
(88, 80, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMEQ2RTFEOEMyMjBCMzMzMDkwAA==\",\"status\":\"sent\",\"timestamp\":\"1765783502\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 07:25:03'),
(89, 80, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMEQ2RTFEOEMyMjBCMzMzMDkwAA==\",\"status\":\"read\",\"timestamp\":\"1765783503\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 07:25:04'),
(90, 82, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNjI5RTMyNjg1OUY1MjNFNEFDAA==\",\"status\":\"sent\",\"timestamp\":\"1765783940\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 07:32:22'),
(91, 82, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNjI5RTMyNjg1OUY1MjNFNEFDAA==\",\"status\":\"delivered\",\"timestamp\":\"1765783941\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 07:32:23'),
(92, 82, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNjI5RTMyNjg1OUY1MjNFNEFDAA==\",\"status\":\"read\",\"timestamp\":\"1765785407\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 07:56:48'),
(93, 85, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMzFEOTlBRjlCM0Q4QzlGOEQxAA==\",\"status\":\"sent\",\"timestamp\":\"1765792785\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 09:59:47'),
(94, 85, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMzFEOTlBRjlCM0Q4QzlGOEQxAA==\",\"status\":\"read\",\"timestamp\":\"1765792786\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 09:59:47'),
(95, 90, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTYyNzk2ODEwOTU2ODc2RDQ0AA==\",\"status\":\"sent\",\"timestamp\":\"1765795852\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 10:50:53'),
(96, 90, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTYyNzk2ODEwOTU2ODc2RDQ0AA==\",\"status\":\"read\",\"timestamp\":\"1765795853\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 10:50:54'),
(97, 91, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMjQ3Rjk0QzcyQUQ4REZCNTFFAA==\",\"status\":\"sent\",\"timestamp\":\"1765795884\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 10:51:26'),
(98, 91, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMjQ3Rjk0QzcyQUQ4REZCNTFFAA==\",\"status\":\"read\",\"timestamp\":\"1765795885\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 10:51:27'),
(99, 93, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSOUY5N0MzRkJEMDNBMjU4MDFFAA==\",\"status\":\"sent\",\"timestamp\":\"1765796053\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 10:54:14'),
(100, 93, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSOUY5N0MzRkJEMDNBMjU4MDFFAA==\",\"status\":\"delivered\",\"timestamp\":\"1765796053\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 10:54:15'),
(101, 94, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDNGRTc2QTkzMEFFOTNBMTQzAA==\",\"status\":\"sent\",\"timestamp\":\"1765796950\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:09:12'),
(102, 94, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDNGRTc2QTkzMEFFOTNBMTQzAA==\",\"status\":\"read\",\"timestamp\":\"1765796967\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:09:28'),
(103, 96, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUNBQ0JFOTcxMkUwRjhBNjU2AA==\",\"status\":\"sent\",\"timestamp\":\"1765798124\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:28:45'),
(104, 96, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUNBQ0JFOTcxMkUwRjhBNjU2AA==\",\"status\":\"delivered\",\"timestamp\":\"1765798127\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:28:49'),
(105, 96, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUNBQ0JFOTcxMkUwRjhBNjU2AA==\",\"status\":\"read\",\"timestamp\":\"1765798149\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:29:11'),
(106, 99, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQjBDNENDRDhEQ0E3NUQzQjU4AA==\",\"status\":\"sent\",\"timestamp\":\"1765798713\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:38:34'),
(107, 99, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQjBDNENDRDhEQ0E3NUQzQjU4AA==\",\"status\":\"read\",\"timestamp\":\"1765798713\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:38:34'),
(108, 100, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSQTlDRTc5ODcyOEZCOUY4MUEwAA==\",\"status\":\"sent\",\"timestamp\":\"1765798956\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:42:37'),
(109, 100, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSQTlDRTc5ODcyOEZCOUY4MUEwAA==\",\"status\":\"delivered\",\"timestamp\":\"1765798956\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:42:38'),
(110, 101, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUMwRjkxMTFDQTVEN0RERjdFAA==\",\"status\":\"sent\",\"timestamp\":\"1765799033\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:43:55'),
(111, 101, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUMwRjkxMTFDQTVEN0RERjdFAA==\",\"status\":\"delivered\",\"timestamp\":\"1765799034\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:43:56'),
(112, 101, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUMwRjkxMTFDQTVEN0RERjdFAA==\",\"status\":\"read\",\"timestamp\":\"1765799037\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:43:58'),
(113, 105, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMzNGNjU3RDVCNEM0MERBNjEzAA==\",\"status\":\"sent\",\"timestamp\":\"1765799181\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:46:23'),
(114, 105, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMzNGNjU3RDVCNEM0MERBNjEzAA==\",\"status\":\"delivered\",\"timestamp\":\"1765799182\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:46:24'),
(115, 106, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMDA5MkQzRDJGNURCMzhCRUJEAA==\",\"status\":\"sent\",\"timestamp\":\"1765799230\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:47:11'),
(116, 106, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMDA5MkQzRDJGNURCMzhCRUJEAA==\",\"status\":\"delivered\",\"timestamp\":\"1765799231\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:47:14'),
(117, 107, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUI5QjQ5NERGNTk4RDg3ODc4AA==\",\"status\":\"sent\",\"timestamp\":\"1765799328\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:48:49'),
(118, 107, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUI5QjQ5NERGNTk4RDg3ODc4AA==\",\"status\":\"delivered\",\"timestamp\":\"1765799329\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:48:50'),
(119, 106, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMDA5MkQzRDJGNURCMzhCRUJEAA==\",\"status\":\"read\",\"timestamp\":\"1765799339\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:49:00'),
(120, 107, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUI5QjQ5NERGNTk4RDg3ODc4AA==\",\"status\":\"read\",\"timestamp\":\"1765799339\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:49:01'),
(121, 105, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMzNGNjU3RDVCNEM0MERBNjEzAA==\",\"status\":\"read\",\"timestamp\":\"1765799339\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:49:01'),
(122, 111, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSRTMxQzE4NkM1NTQ2NkJGQkE1AA==\",\"status\":\"sent\",\"timestamp\":\"1765799909\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:58:30'),
(123, 111, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSRTMxQzE4NkM1NTQ2NkJGQkE1AA==\",\"status\":\"delivered\",\"timestamp\":\"1765799909\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:58:31'),
(124, 111, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSRTMxQzE4NkM1NTQ2NkJGQkE1AA==\",\"status\":\"read\",\"timestamp\":\"1765799910\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 11:58:32'),
(125, 112, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMjdDNEM2QjM5Q0VCMDhDQkE5AA==\",\"status\":\"sent\",\"timestamp\":\"1765800874\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-15 12:14:35'),
(126, 112, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMjdDNEM2QjM5Q0VCMDhDQkE5AA==\",\"status\":\"delivered\",\"timestamp\":\"1765800875\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-15 12:14:37'),
(127, 114, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTg2MzZERkY4QUQ0QTNBQ0YzAA==\",\"status\":\"sent\",\"timestamp\":\"1765800876\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-15 12:14:37'),
(128, 114, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTg2MzZERkY4QUQ0QTNBQ0YzAA==\",\"status\":\"delivered\",\"timestamp\":\"1765800876\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-15 12:14:38'),
(129, 113, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSQzM5NEI5REU5QTlFRDg3REU3AA==\",\"status\":\"failed\",\"timestamp\":\"1765800876\",\"recipient_id\":\"919257086311\",\"errors\":[{\"code\":131049,\"title\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"message\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"error_data\":{\"details\":\"In order to maintain a healthy ecosystem engagement, the message failed to be delivered.\"}}]}', '2025-12-15 12:14:38'),
(130, 115, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODZFMzIzRUIyOTJDNTJDMEIwAA==\",\"status\":\"sent\",\"timestamp\":\"1765800877\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-15 12:14:38'),
(131, 115, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODZFMzIzRUIyOTJDNTJDMEIwAA==\",\"status\":\"delivered\",\"timestamp\":\"1765800878\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-15 12:14:40'),
(132, 112, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMjdDNEM2QjM5Q0VCMDhDQkE5AA==\",\"status\":\"read\",\"timestamp\":\"1765800886\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-15 12:14:48'),
(133, 114, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTg2MzZERkY4QUQ0QTNBQ0YzAA==\",\"status\":\"read\",\"timestamp\":\"1765800954\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-15 12:15:55'),
(134, 74, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTVCRDFERUU3QTdGMzU2MkRGAA==\",\"status\":\"read\",\"timestamp\":\"1765805946\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 13:39:08'),
(135, 93, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSOUY5N0MzRkJEMDNBMjU4MDFFAA==\",\"status\":\"read\",\"timestamp\":\"1765805946\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 13:39:08'),
(136, 100, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSQTlDRTc5ODcyOEZCOUY4MUEwAA==\",\"status\":\"read\",\"timestamp\":\"1765805946\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-15 13:39:09'),
(137, 115, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSODZFMzIzRUIyOTJDNTJDMEIwAA==\",\"status\":\"read\",\"timestamp\":\"1765805946\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-15 13:39:09'),
(138, 120, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNzBDRjA5QUNEMEMyMDZGRTIzAA==\",\"status\":\"sent\",\"timestamp\":\"1765887881\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-16 12:24:43'),
(139, 120, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNzBDRjA5QUNEMEMyMDZGRTIzAA==\",\"status\":\"read\",\"timestamp\":\"1765887882\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-16 12:24:43'),
(140, 121, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSREE3MUE0NDdGN0Y3MTRENThDAA==\",\"status\":\"sent\",\"timestamp\":\"1765887888\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-16 12:24:50'),
(141, 121, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSREE3MUE0NDdGN0Y3MTRENThDAA==\",\"status\":\"read\",\"timestamp\":\"1765887889\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-16 12:24:50'),
(142, 122, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkU2QjRCMjcyQTZBNDc0RkVFAA==\",\"status\":\"sent\",\"timestamp\":\"1765887895\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-16 12:24:56'),
(143, 122, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkU2QjRCMjcyQTZBNDc0RkVFAA==\",\"status\":\"read\",\"timestamp\":\"1765887896\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-16 12:24:57'),
(144, 123, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSN0RFODNEQzVCOUM4MkM3RUY3AA==\",\"status\":\"sent\",\"timestamp\":\"1765887904\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-16 12:25:05'),
(145, 123, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSN0RFODNEQzVCOUM4MkM3RUY3AA==\",\"status\":\"read\",\"timestamp\":\"1765887904\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-16 12:25:06'),
(146, 125, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkIyM0IxOTY4ODRFODJFMTc1AA==\",\"status\":\"sent\",\"timestamp\":\"1765887991\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-16 12:26:32'),
(147, 125, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkIyM0IxOTY4ODRFODJFMTc1AA==\",\"status\":\"delivered\",\"timestamp\":\"1765887991\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-16 12:26:33'),
(148, 126, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTk2RUVGMUI5RjI4QUYwMjZEAA==\",\"status\":\"delivered\",\"timestamp\":\"1765887992\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-16 12:26:33'),
(149, 126, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTk2RUVGMUI5RjI4QUYwMjZEAA==\",\"status\":\"sent\",\"timestamp\":\"1765887992\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-16 12:26:33'),
(150, 125, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkIyM0IxOTY4ODRFODJFMTc1AA==\",\"status\":\"read\",\"timestamp\":\"1765887994\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-16 12:26:35'),
(151, 130, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNDMxODBBMDZGMEEzMEYwMEZDAA==\",\"status\":\"sent\",\"timestamp\":\"1765888141\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-16 12:29:03'),
(152, 130, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNDMxODBBMDZGMEEzMEYwMEZDAA==\",\"status\":\"read\",\"timestamp\":\"1765888142\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-16 12:29:05'),
(153, 126, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSMTk2RUVGMUI5RjI4QUYwMjZEAA==\",\"status\":\"read\",\"timestamp\":\"1765888256\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-16 12:30:57'),
(154, 131, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUY4NTdGOTdDNDk5NDlEMDRCAA==\",\"status\":\"sent\",\"timestamp\":\"1765888297\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-16 12:31:38'),
(155, 132, '{\"id\":\"wamid.HBgMOTE5NjcyNTIwNTY2FQIAERgSOEQ4NTBDRUYyMkI3NkQwQzcxAA==\",\"status\":\"sent\",\"timestamp\":\"1765888298\",\"recipient_id\":\"919672520566\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-16 12:31:39'),
(156, 131, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUY4NTdGOTdDNDk5NDlEMDRCAA==\",\"status\":\"delivered\",\"timestamp\":\"1765888298\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-16 12:31:40'),
(157, 131, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUY4NTdGOTdDNDk5NDlEMDRCAA==\",\"status\":\"read\",\"timestamp\":\"1765888553\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-16 12:35:54'),
(158, 135, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUFGQzgxRjQ2NDZFQzk4QUE5AA==\",\"status\":\"sent\",\"timestamp\":\"1765948642\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-17 05:17:23');
INSERT INTO `chat_status_logs` (`id`, `chat_id`, `metadata`, `created_at`) VALUES
(159, 135, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUFGQzgxRjQ2NDZFQzk4QUE5AA==\",\"status\":\"read\",\"timestamp\":\"1765948643\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-17 05:17:24'),
(160, 137, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUU3RTkxOTY4QTk5QzA1MDVCAA==\",\"status\":\"sent\",\"timestamp\":\"1765948659\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-17 05:17:40'),
(161, 137, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUU3RTkxOTY4QTk5QzA1MDVCAA==\",\"status\":\"read\",\"timestamp\":\"1765948660\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-17 05:17:42'),
(162, 141, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkYwMzcwQjg2Q0Y5RTNCNTM1AA==\",\"status\":\"sent\",\"timestamp\":\"1766125602\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-19 06:26:43'),
(163, 141, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkYwMzcwQjg2Q0Y5RTNCNTM1AA==\",\"status\":\"delivered\",\"timestamp\":\"1766125613\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-19 06:26:55'),
(164, 141, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkYwMzcwQjg2Q0Y5RTNCNTM1AA==\",\"status\":\"read\",\"timestamp\":\"1766125616\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-19 06:26:58'),
(165, 152, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUM5Njg0NTAxQjc0RDRDNjgxAA==\",\"status\":\"sent\",\"timestamp\":\"1766742014\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-26 09:40:16'),
(166, 152, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUM5Njg0NTAxQjc0RDRDNjgxAA==\",\"status\":\"read\",\"timestamp\":\"1766742014\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-26 09:40:16'),
(167, 161, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNzc2NzIxODcwNDkwNkQyNTY3AA==\",\"status\":\"sent\",\"timestamp\":\"1766814394\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-27 05:46:35'),
(168, 161, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNzc2NzIxODcwNDkwNkQyNTY3AA==\",\"status\":\"delivered\",\"timestamp\":\"1766814394\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-27 05:46:36'),
(169, 161, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNzc2NzIxODcwNDkwNkQyNTY3AA==\",\"status\":\"read\",\"timestamp\":\"1766814401\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-27 05:46:42'),
(170, 163, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTk3RjM1QjFFNDFGNDg5NjE3AA==\",\"status\":\"sent\",\"timestamp\":\"1766834320\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-27 11:18:41'),
(171, 163, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTk3RjM1QjFFNDFGNDg5NjE3AA==\",\"status\":\"delivered\",\"timestamp\":\"1766834326\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-27 11:18:47'),
(172, 163, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQTk3RjM1QjFFNDFGNDg5NjE3AA==\",\"status\":\"read\",\"timestamp\":\"1766834503\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2025-12-27 11:21:44'),
(173, 170, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNDMzMzg5NDlCMUFFREQ4MDczAA==\",\"status\":\"sent\",\"timestamp\":\"1767074271\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-30 05:57:52'),
(174, 170, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNDMzMzg5NDlCMUFFREQ4MDczAA==\",\"status\":\"read\",\"timestamp\":\"1767074271\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-30 05:57:53'),
(175, 173, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUMxQkMxMEUwRTBEQ0Q5NThBAA==\",\"status\":\"sent\",\"timestamp\":\"1767089989\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-30 10:19:50'),
(176, 173, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUMxQkMxMEUwRTBEQ0Q5NThBAA==\",\"status\":\"delivered\",\"timestamp\":\"1767089989\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-30 10:19:51'),
(177, 173, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMUMxQkMxMEUwRTBEQ0Q5NThBAA==\",\"status\":\"read\",\"timestamp\":\"1767089991\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-30 10:19:52'),
(178, 174, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDc2RENCRTIwMUY4MURFRkU4AA==\",\"status\":\"sent\",\"timestamp\":\"1767093232\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-30 11:13:54'),
(179, 174, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDc2RENCRTIwMUY4MURFRkU4AA==\",\"status\":\"delivered\",\"timestamp\":\"1767093233\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-30 11:13:55'),
(180, 174, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRDc2RENCRTIwMUY4MURFRkU4AA==\",\"status\":\"read\",\"timestamp\":\"1767095216\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2025-12-30 11:46:58'),
(181, 188, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMTVBQkY5RjgyOTExNDRCQjFDAA==\",\"status\":\"sent\",\"timestamp\":\"1767338043\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-02 07:14:04'),
(182, 188, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMTVBQkY5RjgyOTExNDRCQjFDAA==\",\"status\":\"read\",\"timestamp\":\"1767338044\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-02 07:14:05'),
(183, 188, '{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMTVBQkY5RjgyOTExNDRCQjFDAA==\",\"status\":\"delivered\",\"timestamp\":\"1767338044\",\"recipient_id\":\"919257086309\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-02 07:14:05'),
(184, 197, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNEVFN0VENkIyQzA5MTg2OTVGAA==\",\"status\":\"sent\",\"timestamp\":\"1767599767\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-05 07:56:09'),
(185, 197, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNEVFN0VENkIyQzA5MTg2OTVGAA==\",\"status\":\"read\",\"timestamp\":\"1767599768\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-05 07:56:09'),
(186, 198, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQkZFOEJBODY4MTVDQTk5QUMyAA==\",\"status\":\"sent\",\"timestamp\":\"1767599913\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-05 07:58:34'),
(187, 198, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQkZFOEJBODY4MTVDQTk5QUMyAA==\",\"status\":\"delivered\",\"timestamp\":\"1767599913\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-05 07:58:35'),
(188, 198, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQkZFOEJBODY4MTVDQTk5QUMyAA==\",\"status\":\"read\",\"timestamp\":\"1767599923\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-05 07:58:44'),
(189, 199, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUVCMzgyMzY5MTg2QjU3OEU4AA==\",\"status\":\"sent\",\"timestamp\":\"1767599929\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-05 07:58:50'),
(190, 199, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUVCMzgyMzY5MTg2QjU3OEU4AA==\",\"status\":\"read\",\"timestamp\":\"1767599929\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-05 07:58:51'),
(191, 207, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRkVCRjgwMkIyOUYzMDE2RDg3AA==\",\"status\":\"sent\",\"timestamp\":\"1767676502\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-06 05:15:04'),
(192, 207, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRkVCRjgwMkIyOUYzMDE2RDg3AA==\",\"status\":\"read\",\"timestamp\":\"1767676503\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-06 05:15:05'),
(193, 209, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMTczNjQxQjIxNkIzMDhDMjkzAA==\",\"status\":\"sent\",\"timestamp\":\"1767676523\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-06 05:15:24'),
(194, 209, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMTczNjQxQjIxNkIzMDhDMjkzAA==\",\"status\":\"delivered\",\"timestamp\":\"1767676523\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-06 05:15:25'),
(195, 209, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMTczNjQxQjIxNkIzMDhDMjkzAA==\",\"status\":\"delivered\",\"timestamp\":\"1767676523\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-06 05:15:25'),
(196, 209, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMTczNjQxQjIxNkIzMDhDMjkzAA==\",\"status\":\"read\",\"timestamp\":\"1767676523\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-06 05:15:25'),
(197, 212, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSNUYyMTNFRjhCM0YyRUU2NkI4AA==\",\"status\":\"failed\",\"timestamp\":\"1767689820\",\"recipient_id\":\"919782543431\",\"errors\":[{\"code\":131042,\"title\":\"Business eligibility payment issue\",\"message\":\"Business eligibility payment issue\",\"error_data\":{\"details\":\"Message failed to send because there were one or more errors related to your payment method.\"},\"href\":\"https:\\/\\/developers.facebook.com\\/docs\\/whatsapp\\/cloud-api\\/support\\/error-codes\\/\"}]}', '2026-01-06 08:57:01'),
(198, 213, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNUY1OEI4MkUyMEYyRTYxRUY1AA==\",\"status\":\"failed\",\"timestamp\":\"1767762394\",\"recipient_id\":\"916376535743\",\"errors\":[{\"code\":131042,\"title\":\"Business eligibility payment issue\",\"message\":\"Business eligibility payment issue\",\"error_data\":{\"details\":\"Message failed to send because there were one or more errors related to your payment method.\"},\"href\":\"https:\\/\\/developers.facebook.com\\/docs\\/whatsapp\\/cloud-api\\/support\\/error-codes\\/\"}]}', '2026-01-07 05:06:36'),
(199, 215, '{\"id\":\"wamid.HBgMOTE5OTI5NDUxMjg4FQIAERgSQzUwODJDMjU1RTBERjBBQTlCAA==\",\"status\":\"sent\",\"timestamp\":\"1767781541\",\"recipient_id\":\"919929451288\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-07 10:25:42'),
(200, 215, '{\"id\":\"wamid.HBgMOTE5OTI5NDUxMjg4FQIAERgSQzUwODJDMjU1RTBERjBBQTlCAA==\",\"status\":\"delivered\",\"timestamp\":\"1767781541\",\"recipient_id\":\"919929451288\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-07 10:25:43'),
(201, 215, '{\"id\":\"wamid.HBgMOTE5OTI5NDUxMjg4FQIAERgSQzUwODJDMjU1RTBERjBBQTlCAA==\",\"status\":\"read\",\"timestamp\":\"1767781541\",\"recipient_id\":\"919929451288\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-07 10:25:43'),
(202, 218, '{\"id\":\"wamid.HBgMOTE5MjQxMTIzMzczFQIAERgSNzc2OEVDMjA5RTFGOTRCNDlCAA==\",\"status\":\"sent\",\"timestamp\":\"1767788397\",\"recipient_id\":\"919241123373\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-07 12:19:59'),
(203, 218, '{\"id\":\"wamid.HBgMOTE5MjQxMTIzMzczFQIAERgSNzc2OEVDMjA5RTFGOTRCNDlCAA==\",\"status\":\"delivered\",\"timestamp\":\"1767788398\",\"recipient_id\":\"919241123373\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-07 12:20:00'),
(204, 218, '{\"id\":\"wamid.HBgMOTE5MjQxMTIzMzczFQIAERgSNzc2OEVDMjA5RTFGOTRCNDlCAA==\",\"status\":\"read\",\"timestamp\":\"1767788414\",\"recipient_id\":\"919241123373\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-07 12:20:15'),
(205, 221, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQzQ4MTE3N0ExQUQ0QUNFNkMwAA==\",\"status\":\"sent\",\"timestamp\":\"1767874001\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2026-01-08 12:06:42'),
(206, 221, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQzQ4MTE3N0ExQUQ0QUNFNkMwAA==\",\"status\":\"read\",\"timestamp\":\"1767874001\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2026-01-08 12:06:43'),
(207, 222, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSM0ZDMjAyMkRCREU4QjExQjEwAA==\",\"status\":\"sent\",\"timestamp\":\"1767875531\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-08 12:32:12'),
(208, 222, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSM0ZDMjAyMkRCREU4QjExQjEwAA==\",\"status\":\"delivered\",\"timestamp\":\"1767875532\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-08 12:32:13'),
(209, 224, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMTcxOTNCQTA5MjQ2QTQwNjk2AA==\",\"status\":\"sent\",\"timestamp\":\"1767875671\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-08 12:34:33'),
(210, 224, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMTcxOTNCQTA5MjQ2QTQwNjk2AA==\",\"status\":\"delivered\",\"timestamp\":\"1767875672\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-08 12:34:33'),
(211, 224, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMTcxOTNCQTA5MjQ2QTQwNjk2AA==\",\"status\":\"read\",\"timestamp\":\"1767875675\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-08 12:34:37'),
(212, 222, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSM0ZDMjAyMkRCREU4QjExQjEwAA==\",\"status\":\"read\",\"timestamp\":\"1767875710\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-08 12:35:12'),
(213, 225, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRTgyNjBGOTNFNUQxNUMyRDExAA==\",\"status\":\"failed\",\"timestamp\":\"1767963995\",\"recipient_id\":\"916376535743\",\"errors\":[{\"code\":131049,\"title\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"message\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"error_data\":{\"details\":\"In order to maintain a healthy ecosystem engagement, the message failed to be delivered.\"}}]}', '2026-01-09 13:06:36'),
(214, 226, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUY4MUQ3NzkzQTY3QjQ2QzhEAA==\",\"status\":\"failed\",\"timestamp\":\"1767964138\",\"recipient_id\":\"916376535743\",\"errors\":[{\"code\":131049,\"title\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"message\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"error_data\":{\"details\":\"In order to maintain a healthy ecosystem engagement, the message failed to be delivered.\"}}]}', '2026-01-09 13:09:00'),
(215, 227, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSODg3OUQzMjUxMUFBOTFBODAwAA==\",\"status\":\"failed\",\"timestamp\":\"1767964140\",\"recipient_id\":\"919782543431\",\"errors\":[{\"code\":131049,\"title\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"message\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"error_data\":{\"details\":\"In order to maintain a healthy ecosystem engagement, the message failed to be delivered.\"}}]}', '2026-01-09 13:09:01'),
(216, 228, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMzkxMDEzOEI0QkQyQjQyODY3AA==\",\"status\":\"failed\",\"timestamp\":\"1768022658\",\"recipient_id\":\"916376535743\",\"errors\":[{\"code\":131049,\"title\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"message\":\"This message was not delivered to maintain healthy ecosystem engagement.\",\"error_data\":{\"details\":\"In order to maintain a healthy ecosystem engagement, the message failed to be delivered.\"}}]}', '2026-01-10 05:24:19'),
(217, 229, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUNDRTkzQTQxOTgxQzRGMTI1AA==\",\"status\":\"sent\",\"timestamp\":\"1768281133\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2026-01-13 05:12:15'),
(218, 229, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUNDRTkzQTQxOTgxQzRGMTI1AA==\",\"status\":\"delivered\",\"timestamp\":\"1768281135\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2026-01-13 05:12:17'),
(219, 229, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRUNDRTkzQTQxOTgxQzRGMTI1AA==\",\"status\":\"read\",\"timestamp\":\"1768281142\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2026-01-13 05:12:23'),
(220, 232, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSM0YzMzU4MjVEQkZDNDAwQTQ1AA==\",\"status\":\"sent\",\"timestamp\":\"1768558232\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-16 10:10:33'),
(221, 232, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSM0YzMzU4MjVEQkZDNDAwQTQ1AA==\",\"status\":\"delivered\",\"timestamp\":\"1768558232\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-16 10:10:34'),
(222, 232, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSM0YzMzU4MjVEQkZDNDAwQTQ1AA==\",\"status\":\"read\",\"timestamp\":\"1768558232\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-16 10:10:34'),
(223, 232, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSM0YzMzU4MjVEQkZDNDAwQTQ1AA==\",\"status\":\"delivered\",\"timestamp\":\"1768558232\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-16 10:10:34'),
(224, 233, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSREZGNEM0NjU5OTZGM0IxQzgzAA==\",\"status\":\"sent\",\"timestamp\":\"1768558243\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-16 10:10:44'),
(225, 233, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSREZGNEM0NjU5OTZGM0IxQzgzAA==\",\"status\":\"delivered\",\"timestamp\":\"1768558243\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-16 10:10:45'),
(226, 233, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSREZGNEM0NjU5OTZGM0IxQzgzAA==\",\"status\":\"read\",\"timestamp\":\"1768558244\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-16 10:10:45'),
(227, 233, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSREZGNEM0NjU5OTZGM0IxQzgzAA==\",\"status\":\"delivered\",\"timestamp\":\"1768558244\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-16 10:10:45'),
(228, 235, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSQjcwOTczNTA0MDBEMzk3QUYwAA==\",\"status\":\"sent\",\"timestamp\":\"1768805271\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-19 06:47:52'),
(229, 235, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSQjcwOTczNTA0MDBEMzk3QUYwAA==\",\"status\":\"delivered\",\"timestamp\":\"1768805271\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-19 06:47:53'),
(230, 235, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSQjcwOTczNTA0MDBEMzk3QUYwAA==\",\"status\":\"read\",\"timestamp\":\"1768805272\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-19 06:47:53'),
(231, 254, '{\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAERgSMkREQkJDNkMyNzdEMUE1MkQwAA==\",\"status\":\"sent\",\"timestamp\":\"1768823107\",\"recipient_id\":\"918433109834\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-19 11:45:08'),
(232, 254, '{\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAERgSMkREQkJDNkMyNzdEMUE1MkQwAA==\",\"status\":\"delivered\",\"timestamp\":\"1768823238\",\"recipient_id\":\"918433109834\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-19 11:47:19'),
(233, 255, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMDVGNDI5QTU0RUNEMzYyNUVGAA==\",\"status\":\"sent\",\"timestamp\":\"1768893858\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2026-01-20 07:24:19'),
(234, 255, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMDVGNDI5QTU0RUNEMzYyNUVGAA==\",\"status\":\"delivered\",\"timestamp\":\"1768893858\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2026-01-20 07:24:19'),
(235, 255, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMDVGNDI5QTU0RUNEMzYyNUVGAA==\",\"status\":\"read\",\"timestamp\":\"1768893872\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":true,\"pricing_model\":\"PMP\",\"category\":\"marketing\",\"type\":\"regular\"}}', '2026-01-20 07:24:33'),
(236, 257, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSOUVCMTFGMUJCMDU1NTEzNDYyAA==\",\"status\":\"sent\",\"timestamp\":\"1768895298\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-20 07:48:19'),
(237, 257, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSOUVCMTFGMUJCMDU1NTEzNDYyAA==\",\"status\":\"delivered\",\"timestamp\":\"1768895298\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-20 07:48:20'),
(238, 257, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSOUVCMTFGMUJCMDU1NTEzNDYyAA==\",\"status\":\"read\",\"timestamp\":\"1768896003\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-20 08:00:06'),
(239, 254, '{\"id\":\"wamid.HBgMOTE4NDMzMTA5ODM0FQIAERgSMkREQkJDNkMyNzdEMUE1MkQwAA==\",\"status\":\"read\",\"timestamp\":\"1768908273\",\"recipient_id\":\"918433109834\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-20 11:24:35'),
(240, 267, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNjQyNUQ2OEY3NUIwNjg0Q0I3AA==\",\"status\":\"sent\",\"timestamp\":\"1768915141\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-20 13:19:02'),
(241, 267, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNjQyNUQ2OEY3NUIwNjg0Q0I3AA==\",\"status\":\"read\",\"timestamp\":\"1768915142\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-20 13:19:03'),
(242, 273, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMEYzNEZDNzhCN0RDQUYwNzc5AA==\",\"status\":\"sent\",\"timestamp\":\"1768915369\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-20 13:22:51'),
(243, 273, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMEYzNEZDNzhCN0RDQUYwNzc5AA==\",\"status\":\"read\",\"timestamp\":\"1768915370\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-20 13:22:51'),
(244, 273, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMEYzNEZDNzhCN0RDQUYwNzc5AA==\",\"status\":\"delivered\",\"timestamp\":\"1768915370\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-20 13:22:51'),
(245, 273, '{\"id\":\"wamid.HBgMOTE5NzgyNTQzNDMxFQIAERgSMEYzNEZDNzhCN0RDQUYwNzc5AA==\",\"status\":\"delivered\",\"timestamp\":\"1768915370\",\"recipient_id\":\"919782543431\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-20 13:22:51'),
(246, 280, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUU4M0EwQzRENDEzQkFBMzM2AA==\",\"status\":\"sent\",\"timestamp\":\"1768978534\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-21 06:55:36'),
(247, 280, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQUU4M0EwQzRENDEzQkFBMzM2AA==\",\"status\":\"read\",\"timestamp\":\"1768978535\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-21 06:55:36'),
(248, 283, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRERENTEwQThCNEU0QTUwMDM1AA==\",\"status\":\"sent\",\"timestamp\":\"1768978681\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-21 06:58:02'),
(249, 283, '{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSRERENTEwQThCNEU0QTUwMDM1AA==\",\"status\":\"read\",\"timestamp\":\"1768978681\",\"recipient_id\":\"916376535743\",\"pricing\":{\"billable\":false,\"pricing_model\":\"PMP\",\"category\":\"service\",\"type\":\"free_customer_service\"}}', '2026-01-21 06:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `chat_tickets`
--

CREATE TABLE `chat_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `contact_id` int NOT NULL,
  `assigned_to` int DEFAULT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_tickets`
--

INSERT INTO `chat_tickets` (`id`, `contact_id`, `assigned_to`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 'open', NULL, '2025-12-30 10:40:49'),
(2, 4, NULL, 'open', NULL, '2025-12-30 10:40:49'),
(3, 3, NULL, 'open', NULL, '2025-12-30 10:40:49'),
(4, 1, 6, 'open', NULL, '2025-12-30 10:40:49'),
(5, 11, NULL, 'open', NULL, '2026-01-20 07:30:22'),
(6, 14, NULL, 'open', NULL, '2026-01-20 07:30:22'),
(7, 16, NULL, 'open', NULL, '2026-01-20 07:30:22'),
(8, 12, 6, 'open', NULL, '2026-01-20 07:30:22'),
(9, 18, 6, 'open', NULL, '2026-01-20 11:50:46'),
(10, 19, 6, 'open', NULL, '2026-01-20 13:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `chat_ticket_logs`
--

CREATE TABLE `chat_ticket_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `contact_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_ticket_logs`
--

INSERT INTO `chat_ticket_logs` (`id`, `contact_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Conversation was assigned to test developer', '2025-12-30 11:15:18', NULL),
(2, 12, 'Conversation was moved from opened to closed', '2026-01-20 07:46:07', NULL),
(3, 12, 'Conversation was moved from closed to open', '2026-01-20 07:46:47', NULL),
(4, 18, 'Conversation was opened', '2026-01-20 11:50:46', NULL),
(5, 19, 'Conversation was opened', '2026-01-20 13:22:31', NULL),
(6, 18, 'Conversation was moved from opened to closed', '2026-01-20 13:25:33', NULL),
(7, 18, 'Conversation was moved from closed to open', '2026-01-21 05:34:37', NULL),
(8, 18, 'Conversation was assigned to test developer', '2026-01-21 08:47:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int NOT NULL,
  `first_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latest_chat_created_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_group_id` int DEFAULT NULL,
  `is_favorite` tinyint NOT NULL DEFAULT '0',
  `ai_assistance_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `uuid`, `organization_id`, `first_name`, `last_name`, `phone`, `email`, `latest_chat_created_at`, `avatar`, `address`, `metadata`, `contact_group_id`, `is_favorite`, `ai_assistance_enabled`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '87f05c6a-f40b-4a3a-9681-d13cddcd6f44', 1, 'Test', 'test', '+916376535743', 'test@gmail.com', NULL, NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', '[]', 2, 0, 0, 1, '2025-11-26 01:15:43', '2025-12-05 08:58:24', '2026-01-07 13:26:42'),
(2, '0e10cbbd-c857-46f6-b5aa-619610984dad', 1, 'narendra', 'shrma', '+919257086311', 'naredra@gmail.com', NULL, '/media/public/58Ge9yVM3mvVGkKqVeQbluB9Bpc5LQg6oHRQ7Mq1.png', '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', 'null', NULL, 0, 0, 1, '2025-11-26 01:30:19', '2025-12-05 09:28:14', '2026-01-07 13:26:42'),
(3, '1d293a96-370f-4181-998b-fde589132a4f', 1, 'DQOT', 'Admin', '+919257086309', 'dqot@gmail.com', NULL, NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', '[]', NULL, 0, 0, 1, '2025-11-26 01:55:18', '2025-11-26 01:55:18', '2026-01-07 13:26:42'),
(4, 'bb6a15f5-488d-47c6-82cb-3bb4294e95e2', 1, 'Kapil', 'Kumawat', '+919672520566', 'kapil@yopmail.com', NULL, NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', '[]', 2, 0, 0, 1, '2025-12-05 06:44:28', '2025-12-05 08:58:14', '2026-01-07 13:26:42'),
(5, '69d997fa-05f5-4aad-90bc-9462d5b80c6e', 3, '9AM IT Services', NULL, '+916376535743', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-05 13:27:35', '2026-01-05 13:27:35', '2026-01-07 13:26:42'),
(6, '125b416e-685a-495e-b20d-b4372fd7f814', 3, 'Dqot Solutions', NULL, '+919257086311', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-05 13:28:37', '2026-01-05 13:28:37', '2026-01-07 13:26:42'),
(7, '86b30740-3476-4c39-8fb3-0e944b53b0a9', 3, 'Nitika Sharma', NULL, '+919782543431', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-06 05:14:59', '2026-01-06 05:14:59', '2026-01-07 13:26:42'),
(8, '4b27c0cb-3121-45b4-b387-fc8018c70785', 3, 'Riyaz', NULL, '+919929451288', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-07 10:25:21', '2026-01-07 10:25:21', '2026-01-07 13:26:42'),
(9, '16b4de91-aec9-4185-ab59-0c2954030145', 3, 'Arv', NULL, '+919241123373', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-07 12:17:32', '2026-01-07 12:17:32', '2026-01-07 13:26:42'),
(10, '72c48c0a-6158-4c34-b206-9fe8ca85d924', 3, '9AM IT Services', NULL, '+916376535743', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-08 06:08:25', '2026-01-08 06:08:25', '2026-01-08 06:12:38'),
(11, 'afd67b25-3b7b-4181-af5e-b884462fe18c', 3, '9AM IT Services', NULL, '+916376535743', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-08 12:06:21', '2026-01-08 12:06:21', '2026-01-20 07:57:24'),
(12, '571f9ab5-e4e6-4f2b-bc74-6f588d963520', 3, 'Nitika Sharma', NULL, '+919782543431', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-08 12:33:33', '2026-01-08 12:33:33', '2026-01-20 07:57:24'),
(13, 'f0cfcb30-57eb-46d6-bbe1-5762694c7a55', 3, NULL, NULL, '+918130339430', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-12 15:07:35', '2026-01-12 15:07:35', '2026-01-20 07:57:24'),
(14, '55ac3cfd-c147-4784-88af-facfe4f6c3a1', 3, 'Ronak', NULL, '+447943121999', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-14 08:53:11', '2026-01-14 08:53:11', '2026-01-20 07:57:24'),
(15, '1713c4ea-f8f5-4219-9eac-fe22dbe854b3', 3, 'Trial', 'T', '+911234567891', 'trial@gmail.com', NULL, NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', '[]', NULL, 0, 0, 6, '2026-01-15 12:03:53', '2026-01-15 12:03:53', '2026-01-20 07:57:24'),
(16, 'e02ef99d-be20-4c71-a12b-18415368d601', 3, 'AstroTarsh', NULL, '+918433109834', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-19 11:10:47', '2026-01-19 11:10:47', '2026-01-20 07:57:24'),
(17, '0f76be80-1e9d-4673-9bb1-3d6a8c70f5fe', 3, NULL, NULL, '+918130339430', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-20 11:02:55', '2026-01-20 11:02:55', NULL),
(18, '89d722ec-1a82-4cf9-8aaf-3ef31268fd4c', 3, '9AM IT Services', NULL, '+916376535743', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-20 11:50:46', '2026-01-20 11:50:46', NULL),
(19, '9cca767e-46c5-49b4-bd38-b99ebd9c4835', 3, 'Nitika Sharma', NULL, '+919782543431', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2026-01-20 13:22:31', '2026-01-20 13:26:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_contact_group`
--

CREATE TABLE `contact_contact_group` (
  `id` bigint UNSIGNED NOT NULL,
  `contact_id` bigint UNSIGNED NOT NULL,
  `contact_group_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_fields`
--

CREATE TABLE `contact_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `organization_id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `required` tinyint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_fields`
--

INSERT INTO `contact_fields` (`id`, `organization_id`, `uuid`, `position`, `name`, `type`, `value`, `required`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'd1b7f1d3-2f2c-480a-93d4-fa8d0e6b122b', 1, 'UserName', 'input', 'text', 1, '2025-12-27 07:20:04', 1, '2025-12-27 07:19:06', '2025-12-27 07:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `contact_groups`
--

CREATE TABLE `contact_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_groups`
--

INSERT INTO `contact_groups` (`id`, `uuid`, `organization_id`, `name`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '7db2c9f3-38bf-40d1-bc23-5891e3edd837', 1, 'Test', 1, '2025-11-26 01:55:29', '2025-11-26 01:55:35', '2025-11-26 01:55:35'),
(2, '12863159-2cb0-4ea0-aa69-8d9a407905f2', 1, 'abc', 1, '2025-11-26 05:37:37', '2025-11-26 05:37:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `quantity_redeemed` int DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` bigint UNSIGNED NOT NULL,
  `source` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `embeddings` json DEFAULT NULL,
  `status` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `recipient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('queued','sent','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'queued',
  `attempts` int NOT NULL DEFAULT '0',
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` blob NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `body`, `updated_at`, `updated_by`) VALUES
(1, 'Reset Password', 'Reset Password', 0x3c703e4869207b7b46697273744e616d657d7d2c3c2f703e3c703e596f752068617665207375626d697474656420612070617373776f726420726573657420666f7220796f7572206163636f756e742e204966207468697320776173206e6f7420796f752c2073696d706c792069676e6f7265207468697320656d61696c2e2042757420696620796f75206469642c20636c69636b206f6e2074686973206c696e6b207b7b4c696e6b7d7d20746f20726573657420796f75722070617373776f72642e204966207468617420646f65736e277420776f726b2c20636f707920616e642070617374652074686973206c696e6b20746f20796f75722062726f777365722e3c2f703e3c703e7b7b4c696e6b7d7d3c2f703e, '2025-11-25 08:04:05', 1),
(2, 'Password Reset Notification', 'Your Password has been reset', 0x3c703e4869207b7b46697273744e616d657d7d2c3c2f703e3c703e596f75722070617373776f726420686173206265656e207265736574207375636365737366756c6c792120596f752063616e206c6f67696e20746f20796f7572206163636f756e742e3c2f703e, '2025-11-25 08:04:05', 1),
(3, 'Registration', 'Welcome to {{CompanyName}}', 0x3c703e48656c6c6f207b7b46697273744e616d657d7d2c3c2f703e3c703e4920616d204a6f652c2074686520666f756e646572206f66207b7b436f6d70616e794e616d657d7d20616e64204920776f756c64206c696b6520746f20657874656e64206d7920686561727466656c742077656c636f6d6520746f20796f7520666f72206a6f696e696e67206f757220706c6174666f726d2e20576520617265206578636974656420746f206861766520796f75206f6e626f6172642e204665656c206672656520746f206578706c6f7265206f757220706c6174666f726d20616e64206c6574207573206b6e6f7720696620796f75206861766520616e79207175657374696f6e73206f72206e65656420617373697374616e63652e203c2f703e3c703e5468616e6b20796f7520666f722063686f6f73696e67206f757220706c6174666f726d213c2f703e3c703e4265737420726567617264732c3c2f703e3c703e546865207b7b436f6d70616e794e616d657d7d205465616d3c2f703e3c703e3c62723e3c2f703e, '2025-11-25 08:04:05', 1),
(4, 'Invite', 'You have been invited to join {{CompanyName}}', 0x3c703e48656c6c6f2074686572652c3c2f703e3c703e3c7370616e207374796c653d22636f6c6f723a207267622835352c2036352c203831293b223e596f7527766520726563656976656420616e20696e7669746174696f6e20746f206a6f696e207b7b436f6d70616e794e616d657d7d2773206163636f756e742066726f6d207b7b46697273744e616d657d7d2e3c2f7370616e3e3c2f703e3c703e546f2067657420737461727465642c2073696d706c7920636c69636b206f6e2074686520666f6c6c6f77696e67206c696e6b3a207b7b4c696e6b7d7d3c2f703e3c703e5468616e6b20796f7520616e642077656c636f6d652061626f617264213c2f703e3c703e4265737420726567617264732c3c2f703e3c703e7b7b436f6d70616e794e616d657d7d205465616d203c2f703e3c703e3c62723e3c2f703e, '2025-11-25 08:04:05', 1),
(5, 'Verify Email', 'Please verify your email', 0x3c703e4869207b66697273744e616d657d2c3c2f703e3c703e506c656173652076657269667920796f757220656d61696c20627920636c69636b696e67206f6e20746865206c696e6b2062656c6f772e3c2f703e3c703e7b766572696669636174696f6e4c696e6b7d3c2f703e3c703e3c7370616e207374796c653d226c65747465722d73706163696e673a2030656d3b20746578742d616c69676e3a20766172282d2d62732d626f64792d746578742d616c69676e293b223e4265737420726567617264732c3c2f7370616e3e3c2f703e3c703e3c62723e3c2f703e, '2025-11-25 08:04:05', 1),
(6, 'Payment Success', 'Your subscription payment was successful', 0x3c703e48656c6c6f2c3c2f703e3c703e596f757220737562736372697074696f6e207061796d656e7420776173207375636365737366756c213c2f703e, '2025-11-25 08:04:05', 1),
(7, 'Payment Failed', 'Your subscription payment was unsuccessful', 0x3c703e48656c6c6f2c3c2f703e3c703e596f7572207061796d656e742077617320756e7375636365737366756c2c20706c6561736520636865636b20796f7572207061796d656e7420616e6420636f6e6669726d2e3c2f703e3c703e3c62723e3c2f703e, '2025-11-25 08:04:05', 1),
(8, 'Subscription Renewal', 'Your subscription has been renewed successfully', 0x3c703e4869207b7b46697273744e616d657d7d2c3c2f703e3c703e596f757220737562736372697074696f6e20686173206265656e2072656e65776564207375636365737366756c6c792e203c2f703e, '2025-11-25 08:04:05', 1),
(9, 'Subscription Plan Purchase', 'Your have subscribed to {{plan}} successfully', 0x3c703e4869207b7b46697273744e616d657d7d2c3c2f703e3c703e596f752068617665206265656e207375627363726962656420746f20746865207b7b706c616e7d7d20706c616e207375636365737366756c6c792e3c2f703e, '2025-11-25 08:04:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flows`
--

CREATE TABLE `flows` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `trigger` enum('new_contact','keywords') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flows`
--

INSERT INTO `flows` (`id`, `uuid`, `organization_id`, `name`, `description`, `trigger`, `keywords`, `metadata`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '18e32d4e-e823-4e93-b21c-06d5140068f4', 3, 'test', 'testing', 'keywords', 'hii,start,hello,hlo', '{\"nodes\":[{\"id\":\"1\",\"type\":\"start\",\"dimensions\":{\"width\":452,\"height\":286},\"computedPosition\":{\"x\":13.224821217929247,\"y\":-1657.085182070352,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"1\",\"position\":\"right\",\"x\":443.32802341370643,\"y\":133.99987923048357,\"width\":18,\"height\":18}],\"target\":null},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":13.224821217929247,\"y\":-1657.085182070352},\"data\":{\"uuid\":\"18e32d4e-e823-4e93-b21c-06d5140068f4\",\"title\":\"start\",\"metadata\":{\"fields\":{\"type\":\"keywords\",\"keywords\":\"hii,start,hello,hlo\"}}},\"events\":{},\"label\":\"start\"},{\"id\":\"2\",\"type\":\"buttons\",\"dimensions\":{\"width\":464,\"height\":796},\"computedPosition\":{\"x\":1094.003580449706,\"y\":-1777.7274641948015,\"z\":1000},\"handleBounds\":{\"source\":[{\"id\":\"a\",\"type\":\"source\",\"nodeId\":\"2\",\"position\":\"right\",\"x\":454.4374937108498,\"y\":511.00004917963685,\"width\":18,\"height\":18},{\"id\":\"b\",\"position\":\"right\",\"x\":454.4374937108498,\"y\":611.0000125403568,\"type\":\"source\",\"nodeId\":\"2\",\"width\":18,\"height\":18},{\"id\":\"c\",\"position\":\"right\",\"x\":454.4374937108498,\"y\":710.9999759010768,\"type\":\"source\",\"nodeId\":\"2\",\"width\":18,\"height\":18}],\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"2\",\"position\":\"left\",\"x\":-9.000041908696186,\"y\":388.99999160972345,\"width\":18,\"height\":18}]},\"selected\":true,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":1094.003580449706,\"y\":-1777.7274641948015},\"data\":{\"uuid\":\"18e32d4e-e823-4e93-b21c-06d5140068f4\",\"title\":\"buttons\",\"metadata\":{\"fields\":{\"type\":\"interactive buttons\",\"headerType\":\"none\",\"headerText\":\"\",\"headerMedia\":[],\"body\":\"Hello {first_name}\\nhow can i help you?\",\"footer\":\"powered by DQOT\",\"buttonType\":\"buttons\",\"buttons\":{\"button1\":\"Click Now\",\"button2\":\"Yes\",\"button3\":\"No\"},\"ctaUrlButton\":{\"displayText\":\"\",\"url\":\"\"}}}},\"events\":{},\"label\":\"buttons node\"}],\"edges\":[{\"id\":\"vueflow__edge-1-2\",\"type\":\"default\",\"source\":\"1\",\"target\":\"2\",\"sourceHandle\":null,\"targetHandle\":null,\"data\":{},\"events\":{},\"label\":\"\",\"sourceNode\":{\"id\":\"1\",\"type\":\"start\",\"dimensions\":{\"width\":452,\"height\":286},\"computedPosition\":{\"x\":13.224821217929247,\"y\":-1657.085182070352,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"1\",\"position\":\"right\",\"x\":443.32802341370643,\"y\":133.99987923048357,\"width\":18,\"height\":18}],\"target\":null},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":13.224821217929247,\"y\":-1657.085182070352},\"data\":{\"uuid\":\"18e32d4e-e823-4e93-b21c-06d5140068f4\",\"title\":\"start\",\"metadata\":{\"fields\":{\"type\":\"keywords\",\"keywords\":\"hii,start,hello,hlo\"}}},\"events\":{},\"label\":\"start\"},\"targetNode\":{\"id\":\"2\",\"type\":\"buttons\",\"dimensions\":{\"width\":464,\"height\":796},\"computedPosition\":{\"x\":1094.003580449706,\"y\":-1777.7274641948015,\"z\":1000},\"handleBounds\":{\"source\":[{\"id\":\"a\",\"type\":\"source\",\"nodeId\":\"2\",\"position\":\"right\",\"x\":454.4374937108498,\"y\":511.00004917963685,\"width\":18,\"height\":18},{\"id\":\"b\",\"position\":\"right\",\"x\":454.4374937108498,\"y\":611.0000125403568,\"type\":\"source\",\"nodeId\":\"2\",\"width\":18,\"height\":18},{\"id\":\"c\",\"position\":\"right\",\"x\":454.4374937108498,\"y\":710.9999759010768,\"type\":\"source\",\"nodeId\":\"2\",\"width\":18,\"height\":18}],\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"2\",\"position\":\"left\",\"x\":-9.000041908696186,\"y\":388.99999160972345,\"width\":18,\"height\":18}]},\"selected\":true,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":1094.003580449706,\"y\":-1777.7274641948015},\"data\":{\"uuid\":\"18e32d4e-e823-4e93-b21c-06d5140068f4\",\"title\":\"buttons\",\"metadata\":{\"fields\":{\"type\":\"interactive buttons\",\"headerType\":\"none\",\"headerText\":\"\",\"headerMedia\":[],\"body\":\"Hello {first_name}\\nhow can i help you?\",\"footer\":\"powered by DQOT\",\"buttonType\":\"buttons\",\"buttons\":{\"button1\":\"Click Now\",\"button2\":\"Yes\",\"button3\":\"No\"},\"ctaUrlButton\":{\"displayText\":\"\",\"url\":\"\"}}}},\"events\":{},\"label\":\"buttons node\"},\"sourceX\":474.5528446316357,\"sourceY\":-1514.0853028398683,\"targetX\":1085.00353854101,\"targetY\":-1379.727472585078}],\"viewport\":{\"x\":43.32155107018821,\"y\":1242.6280761602252,\"zoom\":0.6973718331752025}}', 'active', '2026-01-20 07:19:07', '2026-01-21 05:46:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flow_logs`
--

CREATE TABLE `flow_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `flow_id` bigint UNSIGNED NOT NULL,
  `chat_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flow_logs`
--

INSERT INTO `flow_logs` (`id`, `flow_id`, `chat_id`, `created_at`, `updated_at`) VALUES
(1, 1, 267, '2026-01-20 13:19:01', '2026-01-20 13:19:01'),
(2, 1, 273, '2026-01-20 13:22:49', '2026-01-20 13:22:49'),
(3, 1, 280, '2026-01-21 06:55:34', '2026-01-21 06:55:34'),
(4, 1, 283, '2026-01-21 06:58:01', '2026-01-21 06:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `flow_media`
--

CREATE TABLE `flow_media` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flow_id` bigint UNSIGNED NOT NULL,
  `step_id` bigint UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` enum('local','aws') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flow_user_data`
--

CREATE TABLE `flow_user_data` (
  `id` bigint UNSIGNED NOT NULL,
  `contact_id` bigint UNSIGNED NOT NULL,
  `flow_id` bigint UNSIGNED NOT NULL,
  `current_step` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flow_user_data`
--

INSERT INTO `flow_user_data` (`id`, `contact_id`, `flow_id`, `current_step`, `created_at`, `updated_at`) VALUES
(6, 18, 1, 2, '2026-01-21 06:58:00', '2026-01-21 06:58:01');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_rtl` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `status`, `is_rtl`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'active', 0, NULL, NULL, '2025-11-25 08:04:05', '2025-11-25 08:04:05'),
(2, 'French', 'fr', 'active', 0, NULL, NULL, '2025-11-25 08:04:05', '2025-11-25 08:04:05'),
(3, 'Spanish', 'es', 'active', 0, NULL, NULL, '2025-11-25 08:04:05', '2025-11-25 08:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_03_20_050200_create_auto_replies_table', 1),
(3, '2024_03_20_050311_create_billing_credits_table', 1),
(4, '2024_03_20_050348_create_billing_debits_table', 1),
(5, '2024_03_20_050430_create_billing_invoices_table', 1),
(6, '2024_03_20_050508_create_billing_items_table', 1),
(7, '2024_03_20_050600_create_billing_payments_table', 1),
(8, '2024_03_20_050635_create_billing_tax_rates_table', 1),
(9, '2024_03_20_050711_create_billing_transactions_table', 1),
(10, '2024_03_20_050751_create_blog_authors_table', 1),
(11, '2024_03_20_050826_create_blog_categories_table', 1),
(12, '2024_03_20_050912_create_blog_posts_table', 1),
(13, '2024_03_20_050959_create_blog_tags_table', 1),
(14, '2024_03_20_051036_create_campaigns_table', 1),
(15, '2024_03_20_051111_create_campaign_logs_table', 1),
(16, '2024_03_20_051154_create_chats_table', 1),
(17, '2024_03_20_051253_create_chat_logs_table', 1),
(18, '2024_03_20_051336_create_chat_media_table', 1),
(19, '2024_03_20_051414_create_contacts_table', 1),
(20, '2024_03_20_051449_create_contact_groups_table', 1),
(21, '2024_03_20_051537_create_coupons_table', 1),
(22, '2024_03_20_051613_create_email_logs_table', 1),
(23, '2024_03_20_051655_create_email_templates_table', 1),
(24, '2024_03_20_051739_create_failed_jobs_table', 1),
(25, '2024_03_20_051807_create_faqs_table', 1),
(26, '2024_03_20_051847_create_jobs_table', 1),
(27, '2024_03_20_051919_create_modules_table', 1),
(28, '2024_03_20_051953_create_notifications_table', 1),
(29, '2024_03_20_052034_create_organizations_table', 1),
(30, '2024_03_20_052107_create_pages_table', 1),
(31, '2024_03_20_052141_create_password_reset_tokens_table', 1),
(32, '2024_03_20_052223_create_payment_gateways_table', 1),
(33, '2024_03_20_052338_create_reviews_table', 1),
(34, '2024_03_20_052401_create_users_table', 1),
(35, '2024_03_20_052430_create_roles_table', 1),
(36, '2024_03_20_052513_create_role_permissions_table', 1),
(37, '2024_03_20_052620_create_settings_table', 1),
(38, '2024_03_20_052654_create_subscriptions_table', 1),
(39, '2024_03_20_052731_create_subscription_plans_table', 1),
(40, '2024_03_20_052808_create_tax_rates_table', 1),
(41, '2024_03_20_052839_create_teams_table', 1),
(42, '2024_03_20_052914_create_team_invites_table', 1),
(43, '2024_03_20_052920_create_ticket_categories_table', 1),
(44, '2024_03_20_052956_create_templates_table', 1),
(45, '2024_03_20_053038_create_tickets_table', 1),
(46, '2024_03_20_053205_create_ticket_comments_table', 1),
(47, '2024_04_08_133150_create_organization_api_keys_table', 1),
(48, '2024_04_24_211852_create_languages', 1),
(49, '2024_04_27_155643_create_contact_fields_table', 1),
(50, '2024_04_27_160152_add_metadata_to_contacts_table', 1),
(51, '2024_05_11_052902_create_chat_notes_table', 1),
(52, '2024_05_11_052925_create_chat_tickets_table', 1),
(53, '2024_05_11_052940_create_chat_ticket_logs_table', 1),
(54, '2024_05_11_053846_rename_chat_logs_table', 1),
(55, '2024_05_11_054010_create_chat_logs_2_table', 1),
(56, '2024_05_11_063255_add_user_id_to_chats_table', 1),
(57, '2024_05_11_063540_add_role_to_team_invites_table', 1),
(58, '2024_05_11_063819_update_agent_role_to_teams_table', 1),
(59, '2024_05_11_064650_add_deleted_by_to_organization_api_keys_table', 1),
(60, '2024_05_11_065031_add_organization_id_to_tickets_table', 1),
(61, '2024_05_28_080331_make_password_nullable_in_users_table', 1),
(62, '2024_05_30_125859_modify_campaigns_table', 1),
(63, '2024_06_03_124254_create_addons_table', 1),
(64, '2024_06_07_040536_update_users_table_for_facebook_login', 1),
(65, '2024_06_07_040843_update_chat_media_table', 1),
(66, '2024_06_07_074903_add_soft_delete_to_teams_and_organizations', 1),
(67, '2024_06_09_155053_modify_billing_payments_table', 1),
(68, '2024_06_12_070820_modify_faqs_table', 1),
(69, '2024_07_04_053236_modify_amount_columns_in_billing_tables', 1),
(70, '2024_07_04_054143_modify_contacts_table_encoding', 1),
(71, '2024_07_09_011419_drop_seo_from_pages_table', 1),
(72, '2024_07_17_062442_allow_null_content_in_pages_table', 1),
(73, '2024_07_24_080535_add_latest_chat_created_at_to_contacts_table', 2),
(74, '2024_08_01_050752_add_ongoing_to_status_enum_in_campaign_logs_table', 2),
(75, '2024_08_08_130306_add_is_read_to_chats_table', 2),
(76, '2024_08_10_071237_create_documents_table', 2),
(77, '2024_10_16_201832_change_metadata_column_in_organizations_table', 2),
(78, '2024_11_12_101941_add_license_column_to_addons_table', 2),
(79, '2024_11_25_114450_add_version_and_update_needed_to_addons_table', 2),
(80, '2024_11_28_083453_add_tfa_secret_to_users_table', 2),
(81, '2024_11_29_070806_create_seeder_histories_table', 2),
(82, '2024_12_20_081118_add_is_plan_restricted_to_addons_table', 2),
(83, '2024_12_20_130829_add_is_active_table', 2),
(84, '2025_01_24_090926_add_index_to_chats_table', 2),
(85, '2025_01_24_091012_add_index_to_chat_tickets_table', 2),
(86, '2025_01_24_091043_add_index_to_contacts_first_name', 2),
(87, '2025_01_24_091115_add_fulltext_index_to_contacts_table', 2),
(88, '2025_01_29_071445_modify_status_column_in_chats_table', 2),
(89, '2025_02_21_084110_create_job_batches_table', 2),
(90, '2025_02_21_093829_add_queue_indexes', 2),
(91, '2025_04_02_085132_create_contact_contact_group_table', 2),
(92, '2025_05_01_045837_create_campaign_log_retries_table', 2),
(93, '2025_05_01_053318_add_retry_count_to_campaign_logs_table', 2),
(94, '2025_05_23_101200_add_rtl_to_languages_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `actions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `actions`) VALUES
(1, 'customers', 'view, create, edit, delete'),
(2, 'organizations', 'view, create, edit, delete'),
(3, 'billing', 'view'),
(4, 'support', 'view, create, assign'),
(5, 'team', 'view, create, edit, delete'),
(6, 'roles', 'view, create, edit, delete'),
(7, 'subscription_plans', 'view, create, edit, delete'),
(8, 'settings', 'general, timezone, broadcast_driver, payment_gateways, smtp, email_templates, billing, tax_rates, coupons, frontend');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadata` json DEFAULT NULL,
  `timezone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `uuid`, `identifier`, `name`, `address`, `metadata`, `timezone`, `created_by`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, '5cdbc424-c12b-4b95-88f2-89d344fb3447', '2025112606143113k80', 'Client Admin', '{\"street\":\"Joshi Marg\",\"city\":\"Jaiput\",\"state\":\"Rajasthan\",\"zip\":\"302012\",\"country\":\"India\"}', '{\"tickets\": {\"active\": false, \"auto_assignment\": false, \"reassign_reopened_chats\": false, \"allow_agents_to_view_all_chats\": false}, \"contacts\": {\"location\": \"before\"}, \"timezone\": \"Asia/Kolkata\", \"whatsapp\": {\"app_id\": \"1425813585771610\", \"waba_id\": \"1413791536770774\", \"name_status\": \"AVAILABLE_WITHOUT_REVIEW\", \"access_token\": \"EAAL6XhbxAgEBQDrezNOVE3rjozTZA0hZBXIHf9yE7gIPGFZCdnSOlonNSt5ZBZCAjUhueG9txJNU4zqc7WKK6TNAGdzFMenH0sSy8LCftOtoRrGcoKgPgZADKZCSrP7vAYIa7AOp7fNhZCHyljZBK03yLsRZBWMh19ljIMjNZA3nTvoXC6AEBnVTbb7BCzsaDZC36u9BOsCqJOzi9VdlDP7vkZAEVjoZCoknZAziShyTAWZB\", \"number_status\": \"CONNECTED\", \"verified_name\": \"Test Number\", \"quality_rating\": \"GREEN\", \"phone_number_id\": \"881372528393145\", \"business_profile\": {\"about\": \"Hey there! I am using WhatsApp.\", \"email\": \"wabizboost@gmail.com\", \"address\": \"Jaipur\", \"industry\": \"PROF_SERVICES\", \"description\": \"thisingf\"}, \"is_embedded_signup\": 0, \"display_phone_number\": \"15551948235\", \"messaging_limit_tier\": \"TIER_250\", \"account_review_status\": \"APPROVED\", \"business_verification\": \"\", \"max_phone_numbers_per_business\": null, \"max_daily_conversation_per_phone\": null}, \"campaigns\": {\"enable_resend\": false, \"resend_intervals\": [1, 3, 6], \"failed_campaign_group\": null, \"move_failed_contacts_to_group\": false}, \"hide_mobile\": false, \"notifications\": {\"tone\": null, \"volume\": 1, \"enable_sound\": false}}', NULL, 1, NULL, NULL, '2025-11-26 00:44:31', '2026-01-02 09:29:58'),
(2, 'c4973ba5-2479-4f68-9d0b-c81334a3f96a', '202512151258135GhvB', 'Dqot Solutions', NULL, NULL, NULL, 5, NULL, NULL, '2025-12-15 12:58:13', '2025-12-15 12:58:13'),
(3, 'f9164d85-bb41-42db-9469-47417e37de53', '202512160701396Wce0', 'test', NULL, '{\"tickets\": {\"active\": true, \"auto_assignment\": true, \"reassign_reopened_chats\": true, \"allow_agents_to_view_all_chats\": true}, \"whatsapp\": {\"app_id\": \"1425813585771610\", \"waba_id\": \"1584726769620648\", \"name_status\": \"AVAILABLE_WITHOUT_REVIEW\", \"access_token\": \"EAAUQxRhLvFoBQemUvdqJeCqMa8uGoCA1JpLz6vlvrT6WLh6eV7i5hakGOsZAKYJZBVtJQj7kSvb6Y1IXiL25ZBvbQHO4vVZCpPFpAu0ukeC1W7FLhBBKs4ee2vYqUAkOsVsSKW074v9BhocYegvLXw9EmBpSUGpmMdra24o1tef8yIZBZCdjYP94hQLcZCNUQZDZD\", \"number_status\": \"CONNECTED\", \"verified_name\": \"Wabizboost\", \"quality_rating\": \"GREEN\", \"phone_number_id\": \"964491340074649\", \"business_profile\": {\"about\": \"Hey there! I am using WhatsApp.\", \"email\": \"sales@dqotsolutions.com\", \"address\": \"2nd Floor, NK TOWER, Bal Vihar, Jhotwara, Jaipur, Rajasthan 302012\", \"industry\": \"PROF_SERVICES\", \"description\": \"Deliver Quality on Time : Web Development Agency | App Development | Digital Marketing Service | Software Development\", \"profile_picture_url\": \"https://waapi.dqotdemo.in/media/public/kL71n79ZSNp6mkZCIHEIptu2zJdsHepCBvXRkQ4M.png\"}, \"is_embedded_signup\": 0, \"display_phone_number\": \"+91 92570 86308\", \"messaging_limit_tier\": \"TIER_250\", \"account_review_status\": \"APPROVED\", \"business_verification\": \"\", \"max_phone_numbers_per_business\": null, \"max_daily_conversation_per_phone\": null}}', NULL, 6, NULL, NULL, '2025-12-16 07:01:39', '2026-01-20 11:50:31'),
(4, '33eb89bb-1e87-4242-83fa-03ea1c403997', '202601071043558fPq6', 'my today horoscope', NULL, '{\"whatsapp\": {\"app_id\": \"1425813585771610\", \"waba_id\": \"2532175210511646\", \"name_status\": \"AVAILABLE_WITHOUT_REVIEW\", \"access_token\": \"EAAUQxRhLvFoBQQE5qWEsHMrIamiRt9K7tzXZBJzUDhs3OngGlZBab9vevAxCvGBdIU8X4PZBZBMKk0ACrdMXfJXEtlR55azTPcmJLajjlaw2sivkqrDVLbRYRQdY9Xcipi7mC56nVOaydCDZBI5iZAoKy6UZCimR2k7yU14bVWxpzcCirPdNGgS8lvYa3JDPfCD8ZBMthhO06MYGjTSJMgLHU2NX7B6gISZCpZAuZBfY1rvCxEr4ipNYlHn3Lo02oDjPG6uTODcuPXvq3krcs7MJTadwBZAWN8dwiGXhZAoxHL9osV88MlXE9VgQec4XEYiQON8FD34WRCKzTTraGi6EGowZDZD\", \"number_status\": \"CONNECTED\", \"verified_name\": \"mytodayhoroscope\", \"quality_rating\": \"UNKNOWN\", \"phone_number_id\": \"997131113479202\", \"business_profile\": {\"about\": \"Hey there! I am using WhatsApp.\", \"email\": null, \"address\": null, \"industry\": \"UNDEFINED\", \"description\": null}, \"is_embedded_signup\": 1, \"display_phone_number\": \"15558580236\", \"messaging_limit_tier\": \"TIER_250\", \"account_review_status\": \"APPROVED\", \"business_verification\": \"\", \"code_verification_status\": null, \"max_phone_numbers_per_business\": null, \"max_daily_conversation_per_phone\": null}}', NULL, 8, NULL, NULL, '2026-01-07 10:43:55', '2026-01-08 12:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `organization_api_keys`
--

CREATE TABLE `organization_api_keys` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` bigint UNSIGNED NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organization_api_keys`
--

INSERT INTO `organization_api_keys` (`id`, `uuid`, `organization_id`, `token`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, '5ea9bae5-2e62-45ef-8795-20464a33996b', 1, 'YGGukW0VYIPUNraEqB6LDjAQeMGHwJJtuNbeJkmg', '2025-11-26 02:09:56', NULL, '2025-11-26 02:09:44', '2025-11-26 02:09:56'),
(2, '0c4b61b8-4767-44bb-bcfe-7bcc63a8ffd4', 1, 'wtF0YnUB3y0Fqo672z8tOjwctldyv1VLrBYFgMdz', '2025-11-26 04:49:41', NULL, '2025-11-26 04:49:37', '2025-11-26 04:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `updated_at`, `created_at`) VALUES
(1, 'Privacy Policy', '<p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">1. </span><strong>Introduction</strong></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">Wabizboost (“we,” “our,” or “us”) provides a SaaS platform that allows businesses (“clients”) to manage messaging and communication with their own customers via WhatsApp. Protecting your data and your customers’ data is our priority. This Privacy Policy explains what information we collect, how we use it, and how we protect it.</span></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">2. </span><strong>Information We Collect</strong></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">We only collect information necessary to provide our services:</span></p><ul><li><strong>Client Account Information</strong>: Name, email, company name, and login credentials</li><li><strong>Messaging Data</strong>: Templates, messages sent by clients to their own customers, delivery status.</li><li><strong>Usage Data</strong>: Information about how clients interact with the platform (e.g., features used, dashboard activity).</li><li><strong>Technical Data</strong>: Device type, IP address, browser type, and other information collected for security and performance monitoring.</li></ul><p><strong>Note</strong><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">:  </span><strong>We do not collect messages from your clients’ end-users for any purpose other than delivering the service.</strong></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">3. </span><strong>How We Use Data</strong></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">We use collected information to:</span></p><ul><li>Provide and maintain the Wabizboost platform.</li><li>Enable clients to create templates, send messages, and track delivery.</li><li>Support optional features such as automation, chatbots, reporting, and analytics.</li><li>Monitor platform usage, improve features, and maintain security.</li></ul><p><strong>Important</strong><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">: Client data and customer messages are controlled by the client , not shared or sold by Wabizboost.</span></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">4. </span><strong>Data Sharing and Disclosure</strong></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">We do </span><strong>not sell, rent, or trade Platform Data</strong><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\"> . We may share data only as required by law or to provide services (e.g., hosting providers under strict confidentiality agreements).</span></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">5. </span><strong>Data Security</strong></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">We implement industry-standard security measures to protect client data, including encryption, secure access controls, and regular monitoring. However, clients are responsible for maintaining secure login credentials and complying with WhatsApp’s policies.</span></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">6. </span><strong>Client Responsibilities</strong></p><ul><li>Clients are solely responsible for the content of messages sent to their customers.</li><li>Clients must ensure compliance with applicable laws and WhatsApp Business policies.&lt;/p&gt;</li><li>Clients control their own data and can delete their account at any time, which removes associated data from our platform.</li></ul><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">7. </span><strong>Third-Party Services</strong></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">We may use third-party services for hosting, analytics, or platform support. These providers are bound to strict confidentiality and security obligations.</span></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\">8. </span><strong>Changes to This Privacy Policy</strong></p><p><span style=\"background-color:rgb(248,253,255);color:rgb(23,29,30);\"><span>﻿</span>We may update this policy from time to time. Clients will be notified of material changes via email or platform notice.</span></p>', '2026-01-19 06:14:53', '2025-11-25 08:04:05'),
(2, 'Terms of Service', 'Introduction<p>Thanks for using our products and services (\"Services\"). The Services are provided by &lt;Your Business Name&gt;.</p><p>By using our Services, you are agreeing to these terms. Please read them carefully.</p><p>Our Services are very diverse, so sometimes additional terms or product requirements (including age requirements) may apply. Additional terms will be available with the relevant Services, and those additional terms become part of your agreement with us if you use those Services.</p>Using our services<p>You must follow any policies made available to you within the Services.</p><p>Don\'t misuse our Services. For example, don\'t interfere with our Services or try to access them using a method other than the interface and the instructions that we provide. You may use our Services only as permitted by law, including applicable export and re-export control laws and regulations. We may suspend or stop providing our Services to you if you do not comply with our terms or policies or if we are investigating suspected misconduct.</p><p>Using our Services does not give you ownership of any intellectual property rights in our Services or the content you access. You may not use content from our Services unless you obtain permission from its owner or are otherwise permitted by law. These terms do not grant you the right to use any branding or logos used in our Services. Don\'t remove, obscure, or alter any legal notices displayed in or along with our Services.</p>Privacy and copyright protection<p>&lt;Your Business Name&gt;\'s privacy policies explain how we treat your personal data and protect your privacy when you use our Services. By using our Services, you agree that &lt;Your Business Name&gt; can use such data in accordance with our privacy policies.</p><p>We respond to notices of alleged copyright infringement and terminate accounts of repeat infringers according to the process set out in the U.S. Digital Millennium Copyright Act.</p><p>We provide information to help copyright holders manage their intellectual property online. If you think somebody is violating your copyrights and want to notify us, you can find information about submitting notices and &lt;Your Business Name&gt;\'s policy about responding to notices in our Help Center.</p>Your content in our services<p>Some of our Services allow you to upload, submit, store, send or receive content. You retain ownership of any intellectual property rights that you hold in that content. In short, what belongs to you stays yours.</p><p>When you upload, submit, store, send or receive content to or through our Services, you give &lt;Your Business Name&gt; (and those we work with) a worldwide license to use, host, store, reproduce, modify, create derivative works (such as those resulting from translations, adaptations or other changes we make so that your content works better with our Services), communicate, publish, publicly perform, publicly display and distribute such content. The rights you grant in this license are for the limited purpose of operating, promoting, and improving our Services, and to develop new ones. This license continues even if you stop using our Services (for example, for a business listing you have added to &lt;Your Business Name&gt; Maps). Some Services may offer you ways to access and remove content that has been provided to that Service. Also, in some of our Services, there are terms or settings that narrow the scope of our use of the content submitted in those Services. Make sure you have the necessary rights to grant us this license for any content that you submit to our Services.</p>', '2025-11-25 08:04:05', '2025-11-25 08:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `metadata`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Paypal', NULL, 0, '2025-11-25 08:04:04', '2025-11-25 08:04:04'),
(2, 'Stripe', NULL, 0, '2025-11-25 08:04:04', '2025-11-25 08:04:04'),
(3, 'Flutterwave', NULL, 0, '2025-11-25 08:04:04', '2025-11-25 08:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `uuid`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '6a8c0329-9ea0-47cf-adc9-b6dea88d6edc', 'admin', '2025-11-25 08:04:05', '2025-11-25 08:04:05', NULL),
(2, '1a0ac040-c5a3-41e3-9202-43079cd2a3a6', 'Staff', '2025-11-25 08:04:05', '2025-11-25 08:04:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `module` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seeder_histories`
--

CREATE TABLE `seeder_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `seeder_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`key`, `value`) VALUES
('_method', 'put'),
('address', NULL),
('allow_facebook_login', '1'),
('allow_google_login', '0'),
('app_environment', 'local'),
('aws_access_key', NULL),
('aws_bucket', NULL),
('aws_default_region', NULL),
('aws_secret_key', NULL),
('billing_address', NULL),
('billing_city', NULL),
('billing_country', NULL),
('billing_name', NULL),
('billing_phone_1', NULL),
('billing_phone_2', NULL),
('billing_postal_code', NULL),
('billing_state', NULL),
('billing_tax_id', NULL),
('broadcast_driver', 'pusher'),
('company_name', 'ss'),
('currency', 'USD'),
('date_format', 'd-M-y'),
('default_image_api', NULL),
('display_frontend', '1'),
('email', NULL),
('facebook_login', '{\"client_id\":\"1425813585771610\",\"client_secret\":\"a4be500922114a5620f8d892f5709c32\"}'),
('favicon', 'public/FIedSAWGiuBMStYiBVsnotUQy62hN1WVGybNdj7a.png'),
('flow_builder', '1'),
('google_analytics_status', '0'),
('google_analytics_tracking_id', NULL),
('google_login', '{\"client_id\":null,\"client_secret\":null}'),
('google_maps_api_key', NULL),
('invoice_prefix', NULL),
('is_embedded_signup_active', '0'),
('is_tax_inclusive', '1'),
('logo', 'public/i5lb3Lfibulbt0PKo6oZlzhZzReEDGYgdoXfoaV0.svg'),
('mail_config', NULL),
('phone', NULL),
('pusher_app_cluster', NULL),
('pusher_app_id', NULL),
('pusher_app_key', NULL),
('pusher_app_secret', NULL),
('recaptcha_active', '1'),
('recaptcha_secret_key', '6Le9wkAsAAAAADd4RdhFfm-LxgVyHkqOyvcPB1yM'),
('recaptcha_site_key', '6Le9wkAsAAAAAO_f0PRFTc90pkZsLRkGihRiTNrS'),
('smtp_email_active', '0'),
('socials', '{\"facebook\":null,\"twitter\":null,\"instagram\":null,\"slack\":null,\"linkedin\":null}'),
('storage_system', 'local'),
('time_format', 'H:i'),
('timezone', 'UTC'),
('title', NULL),
('trial_period', '20'),
('type', 'general'),
('verify_email', '0'),
('whatsapp_access_token', 'EAAUQxRhLvFoBQemUvdqJeCqMa8uGoCA1JpLz6vlvrT6WLh6eV7i5hakGOsZAKYJZBVtJQj7kSvb6Y1IXiL25ZBvbQHO4vVZCpPFpAu0ukeC1W7FLhBBKs4ee2vYqUAkOsVsSKW074v9BhocYegvLXw9EmBpSUGpmMdra24o1tef8yIZBZCdjYP94hQLcZCNUQZDZD'),
('whatsapp_callback_token', '20251217064506VHUb'),
('whatsapp_client_id', '1425813585771610'),
('whatsapp_client_secret', 'a4be500922114a5620f8d892f5709c32'),
('whatsapp_config_id', '1124049599617114');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `payment_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_date` timestamp NULL DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `status` enum('trial','active') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'trial',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `uuid`, `organization_id`, `plan_id`, `payment_details`, `start_date`, `valid_until`, `status`, `created_at`, `updated_at`) VALUES
(1, '3c49c6ba-ef9d-4755-9b7d-e5bb910db02a', 1, 1, NULL, '2025-12-26 09:12:35', '2026-01-26 09:12:35', 'active', '2025-11-26 00:44:31', '2025-12-26 09:12:35'),
(2, 'e114a6f5-e4a0-4aa4-9a62-32e4daeab2a8', 2, NULL, NULL, '2025-12-15 12:58:13', '2026-01-04 12:58:13', 'trial', '2025-12-15 12:58:13', '2025-12-15 12:58:13'),
(3, 'b8dd3c8b-0280-48e4-8723-0553aba9b86b', 3, 1, NULL, '2026-01-20 11:51:04', '2026-02-20 11:51:04', 'active', '2025-12-16 07:01:39', '2026-01-20 11:51:04'),
(4, '34e0a5c5-1cc6-42bc-977e-c987d5acf92e', 4, NULL, NULL, '2026-01-07 10:43:55', '2026-01-27 10:43:55', 'trial', '2026-01-07 10:43:55', '2026-01-07 10:43:55');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(23,2) NOT NULL,
  `period` enum('monthly','yearly') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive','deleted') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_plans`
--

INSERT INTO `subscription_plans` (`id`, `uuid`, `name`, `price`, `period`, `metadata`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ed423bfb-4efa-4cb3-b062-40280b6ab3e9', 'Basic', 0.00, 'monthly', '{\"campaign_limit\":\"-1\",\"message_limit\":\"-1\",\"contacts_limit\":\"-1\",\"canned_replies_limit\":\"-1\",\"team_limit\":\"-1\",\"receive_messages_after_expiration\":1,\"ai_text_response_limit\":\"-1\",\"ai_audio_response_limit\":\"-1\",\"addons\":{\"Embedded Signup\":true,\"Flow builder\":true}}', 'active', '2025-11-26 02:23:46', '2026-01-20 07:11:11', NULL),
(2, 'c59f2331-ebfd-4d45-9ac8-01a188117f85', 'Pro', 100.00, 'monthly', '{\"campaign_limit\":\"-1\",\"message_limit\":\"-1\",\"contacts_limit\":\"-1\",\"canned_replies_limit\":\"5\",\"team_limit\":\"5\",\"receive_messages_after_expiration\":1,\"ai_text_response_limit\":\"-1\",\"ai_audio_response_limit\":\"-1\",\"addons\":{\"Embedded Signup\":true,\"Flow builder\":true}}', 'active', '2025-11-26 02:24:36', '2026-01-20 07:11:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role` enum('owner','manager','agent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manager',
  `status` enum('active','suspended') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `online_status` enum('online','offline','away') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'offline',
  `last_seen` datetime DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `uuid`, `organization_id`, `user_id`, `role`, `status`, `online_status`, `last_seen`, `created_by`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'ade59f8a-e1d7-4360-baba-356a460c96fb', 1, 1, 'owner', 'active', 'online', '2025-12-26 13:11:28', 1, NULL, NULL, '2025-11-26 00:44:31', '2025-12-26 13:11:28'),
(2, 'fe9c67c6-5d88-4498-8298-13083a14ae58', 2, 5, 'owner', 'active', 'offline', NULL, 5, NULL, NULL, '2025-12-15 12:58:13', '2025-12-15 12:58:13'),
(3, 'ccafb17f-56ea-49d4-820f-bf585478d7f2', 3, 6, 'owner', 'active', 'offline', NULL, 6, NULL, NULL, '2025-12-16 07:01:39', '2025-12-16 07:01:39'),
(4, 'b3c81621-dc64-4d65-9f45-525fbe12dae7', 1, 7, 'manager', 'active', 'offline', '2025-12-26 13:08:48', 1, NULL, NULL, '2025-12-26 10:58:51', '2025-12-26 13:08:48'),
(5, '0cc1a3ee-73e7-4577-b0a5-be8ba2fe6c66', 1, 6, 'agent', 'active', 'offline', '2025-12-26 12:58:07', 1, NULL, NULL, '2025-12-26 11:00:37', '2025-12-26 12:58:07'),
(6, '0b31802e-1f57-492b-a00d-b97ab71cf9ec', 4, 8, 'owner', 'active', 'offline', NULL, 8, NULL, NULL, '2026-01-07 10:43:55', '2026-01-07 10:43:55');

-- --------------------------------------------------------

--
-- Table structure for table `team_invites`
--

CREATE TABLE `team_invites` (
  `id` bigint UNSIGNED NOT NULL,
  `organization_id` bigint UNSIGNED NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invited_by` bigint UNSIGNED NOT NULL,
  `expire_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` bigint UNSIGNED NOT NULL,
  `meta_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `uuid`, `organization_id`, `meta_id`, `name`, `category`, `language`, `metadata`, `status`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2a2d3faf-9761-4a75-bf78-2f86a8dde45a', 1, '1580734569965342', 'for_testing', 'MARKETING', 'en', '{\"name\":\"for_testing\",\"previous_category\":\"UTILITY\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"This is testing form console\"},{\"type\":\"BODY\",\"text\":\"Hello User\"},{\"type\":\"FOOTER\",\"text\":\"DQOT Solutions\"}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"sub_category\":\"CUSTOM\",\"id\":\"1580734569965342\"}', 'APPROVED', 1, '2025-11-26 01:12:11', '2026-01-02 09:11:08', NULL),
(2, 'e82caaf8-9bfd-497b-933e-051d8820305a', 1, '799159499787092', 'broadcast_message', 'MARKETING', 'en', '{\"name\":\"broadcast_message\",\"previous_category\":\"UTILITY\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"BODY\",\"text\":\"Hello hem ant this is a message from DOT\"}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"sub_category\":\"CUSTOM\",\"id\":\"799159499787092\"}', 'APPROVED', 1, '2025-11-26 01:12:11', '2026-01-02 09:11:08', NULL),
(3, '7a8ea32c-549e-4210-9498-db22e2436f2b', 1, '2276160219570116', 'marketing', 'MARKETING', 'en', '{\"name\":\"marketing\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"DQOT\"},{\"type\":\"BODY\",\"text\":\"Hello User\"},{\"type\":\"FOOTER\",\"text\":\"Dqot\"},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"URL\",\"text\":\"Visit website\",\"url\":\"https:\\/\\/www.dqotsolutions.com\\/\"}]}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"sub_category\":\"CUSTOM\",\"id\":\"2276160219570116\"}', 'APPROVED', 1, '2025-11-26 01:12:11', '2026-01-02 09:11:08', NULL),
(4, '442d80c6-f65e-4040-a236-739415273478', 1, '699088566598140', 'hello_world', 'UTILITY', 'en_US', '{\"name\":\"hello_world\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Hello World\"},{\"type\":\"BODY\",\"text\":\"Welcome and congratulations!! This message demonstrates your ability to send a WhatsApp message notification from the Cloud API, hosted by Meta. Thank you for taking the time to test with us.\"},{\"type\":\"FOOTER\",\"text\":\"WhatsApp Business Platform sample message\"}],\"language\":\"en_US\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"id\":\"699088566598140\"}', 'APPROVED', 1, '2025-11-26 01:12:11', '2026-01-02 09:11:08', NULL),
(5, 'e43bdeb6-ac0b-4af8-9d77-a3cc6197b99b', 1, '861109253097484', 'test', 'UTILITY', 'en', '{\"name\":\"test\",\"previous_category\":\"UTILITY\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"this is demo from admin panal\"},{\"type\":\"BODY\",\"text\":\"this is demo from admin panal\"},{\"type\":\"FOOTER\",\"text\":\"this is demo from admin panal\"}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"id\":\"861109253097484\"}', 'APPROVED', 1, '2025-11-26 01:52:03', '2026-01-02 09:11:08', NULL),
(6, '638753b8-d80b-47cd-a893-7eec08da324d', 1, '876852972178728', 'appointment_scheduling', 'UTILITY', 'en_US', '{\"name\":\"appointment_scheduling\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Technician visit\"},{\"type\":\"BODY\",\"text\":\"Hi {{1}}, we\'re scheduling a technician visit for your {{2}} on {{3}} between {{4}} and {{5}}. Please confirm if this time slot works for you.\",\"example\":{\"body_text\":[[\"John\",\"broadband installation\",\"2025-12-31\",\"10:00 AM\",\"2:00 PM\"]]}},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"Confirm\"},{\"type\":\"QUICK_REPLY\",\"text\":\"Reschedule\"}]}],\"language\":\"en_US\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"sub_category\":\"CUSTOM\",\"id\":\"876852972178728\"}', 'APPROVED', 1, '2025-11-28 01:50:58', '2026-01-02 09:11:08', NULL),
(7, '748a8bb0-c84d-49af-8bc2-09537af2ea14', 1, '1489667825427218', 'low_balance', 'UTILITY', 'en', '{\"name\":\"low_balance\",\"previous_category\":\"MARKETING\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Recharge Alert\"},{\"type\":\"BODY\",\"text\":\"\\u25b6\\ufe0f\\ud83d\\udd3d\\ud83d\\udd3cHi John, your mobile balance is {{1}}. Please recharge to avoid interruption\\u25b6\\ufe0f.\",\"example\":{\"body_text\":[[\"5rs\"]]}},{\"type\":\"FOOTER\",\"text\":\"jio corporation\"},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"URL\",\"text\":\"Recharge Now\",\"url\":\"http:\\/\\/abc.com\\/\"}]}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"correct_category\":\"UTILITY\",\"id\":\"1489667825427218\"}', 'APPROVED', 1, '2025-12-06 07:54:28', '2026-01-02 09:11:08', NULL),
(8, 'e51e6b3b-8757-4366-8ce1-e55146429e7e', 1, '782784924809471', 'appointment_cancel', 'UTILITY', 'en_US', '{\"name\":\"appointment_cancel\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Your appointment was canceled\"},{\"type\":\"BODY\",\"text\":\"Hello {{1}},\\n\\nYour upcoming appointment with {{2}} on {{3}} at {{4}} has been canceled.\\n\\nLet us know if you have any questions or need to reschedule.\\n\\n\",\"example\":{\"body_text\":[[\"John\",\"Fashion Styles\",\"December 31, 2025\",\"1:00 PM\"]]}},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"URL\",\"text\":\"View details\",\"url\":\"https:\\/\\/www.example.com\\/\"}]}],\"language\":\"en_US\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"library_template_name\":\"appointment_cancellation_1\",\"id\":\"782784924809471\"}', 'APPROVED', 1, '2025-12-06 07:54:28', '2026-01-02 09:11:08', NULL),
(9, '76aacccf-e61b-4bcc-ba7a-11e7b4b106de', 1, '1395166601977669', 'offer_nsg', 'UTILITY', 'en', '{\"name\":\"offer_nsg\",\"previous_category\":\"UTILITY\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Offer MSG\"},{\"type\":\"BODY\",\"text\":\"this is offer msg for dqot \\nuse this code abc123\\nfor get 20 discount on every product on dqot website.\"},{\"type\":\"FOOTER\",\"text\":\"powered by DQOT\"},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\"},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"phone_number\":\"+911234567898\"},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"example\":[\"abc123\"]},{\"type\":\"URL\",\"text\":\"visit now\",\"url\":\"https:\\/\\/www.dqotsolutions.com\\/\"}]}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"id\":\"1395166601977669\"}', 'APPROVED', 1, '2025-12-13 06:17:08', '2026-01-02 09:11:08', NULL),
(10, 'bb7972dc-bca4-472a-a410-0de5e4888291', 3, '1651015639208237', 'hello_world', 'UTILITY', 'en_US', '{\"name\":\"hello_world\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Hello World\"},{\"type\":\"BODY\",\"text\":\"Welcome and congratulations!! This message demonstrates your ability to send a WhatsApp message notification from the Cloud API, hosted by Meta. Thank you for taking the time to test with us.\"},{\"type\":\"FOOTER\",\"text\":\"WhatsApp Business Platform sample message\"}],\"language\":\"en_US\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"id\":\"1651015639208237\"}', 'APPROVED', 6, '2026-01-02 10:58:30', '2026-01-20 11:50:31', NULL),
(11, '61e9e698-7361-4b1c-94e6-2b7e8c69e98e', 3, '783185694794520', 'test_marketing', 'MARKETING', 'en', '{\"name\":\"test_marketing\",\"parameter_format\":\"NAMED\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"this is test msg from marketing.\"},{\"type\":\"BODY\",\"text\":\"this is test MSG from marketing.\"},{\"type\":\"FOOTER\",\"text\":\"powered vy DQOT\"}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"sub_category\":\"CUSTOM\",\"id\":\"783185694794520\"}', 'PENDING_DELETION', 6, '2026-01-05 12:54:41', '2026-01-10 05:16:29', '2026-01-10 05:39:20'),
(12, 'dd8f8c5b-88b9-4447-a49e-095a431d6e14', 4, '1847890729195506', 'test', 'MARKETING', 'en', '{\"name\":\"test\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"welcome to MyTodayHoroscope\"},{\"type\":\"BODY\",\"text\":\"this is testing from MyTodayHoroscope\"},{\"type\":\"FOOTER\",\"text\":\"powered by MyTodayHoroscope\"}],\"language\":\"en\",\"status\":\"PENDING\",\"category\":\"MARKETING\",\"id\":\"1847890729195506\"}', 'APPROVED', 8, '2026-01-08 11:58:05', '2026-01-08 12:21:03', NULL),
(13, '5e040f01-e5db-4a0b-b935-5dcc01138ca6', 3, '799688323087506', 'cta_based', 'UTILITY', 'en', '{\"name\":\"cta_based\",\"previous_category\":\"UTILITY\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"CTA based\"},{\"type\":\"BODY\",\"text\":\"Hii {{1}} \\ud83d\\udc4b\\r\\nWe\\u2019ve added new features to help you manage conversations faster.\\r\\n\\r\\n\\ud83d\\udc49 Tap below to explore now.\",\"example\":{\"body_text\":[[\"Hemant\"]]}},{\"type\":\"FOOTER\",\"text\":\"powered by DQOT Solutions\"},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"View Features\"},{\"type\":\"URL\",\"text\":\"Contact Support\",\"url\":\"https:\\/\\/www.dqotsolutions.com\\/\"}]}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"id\":\"799688323087506\"}', 'APPROVED', 6, '2026-01-10 05:45:39', '2026-01-20 11:50:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `subject` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` enum('critical','high','medium','low') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_to` bigint UNSIGNED DEFAULT NULL,
  `status` enum('open','pending','resolved','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `closed_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_categories`
--

CREATE TABLE `ticket_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_categories`
--

INSERT INTO `ticket_categories` (`id`, `name`) VALUES
(1, 'Signup/login issues'),
(2, 'Campaigns issues'),
(3, 'Whatsapp issue'),
(4, 'Template Issues'),
(5, 'Chatbot Issues'),
(6, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_comments`
--

CREATE TABLE `ticket_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `ticket_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `message` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tfa_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tfa` tinyint NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `plan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `will_expire` date DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `facebook_id`, `avatar`, `role`, `phone`, `address`, `email_verified_at`, `password`, `tfa_secret`, `tfa`, `status`, `meta`, `plan`, `plan_id`, `will_expire`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Client Admin', 'User', 'client_admin@gmail.com', NULL, NULL, 'user', NULL, '{\"street\":\"Joshi Marg\",\"city\":\"Jaipur\",\"state\":\"Rajasthan\",\"zip\":\"302012\",\"country\":\"India\"}', NULL, '$2y$12$KiAVpn9QidyghcYMsyCBcetIDInDBRIm.NMPbYsE0kplH1wkVPo66', NULL, 0, 1, NULL, NULL, NULL, NULL, 'cOnerM6y4sCIcrgKG6ukJs4SkkuOFpKYm12U532LkafosAPicOnpBcMDqwKS', '2025-11-26 00:44:31', '2025-12-15 12:07:31', NULL),
(3, 'Super', 'Admin', 'admin@admin.com', NULL, NULL, 'admin', NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', NULL, '$2y$12$KiAVpn9QidyghcYMsyCBcetIDInDBRIm.NMPbYsE0kplH1wkVPo66', NULL, 0, 1, NULL, NULL, NULL, NULL, 'eZiym828W4gMuy8y2SwOFvS3cBZnSclNj15och4FisgHdtdpd5BQSA3gXUG0', '2025-11-26 00:44:31', '2025-11-26 00:44:31', NULL),
(4, 'Client Team', 'User', 'user@gmail.com', NULL, NULL, 'user', NULL, '{\"street\":\"Joshi Marg\",\"city\":\"Jaipur\",\"state\":\"Rajasthan\",\"zip\":\"302012\",\"country\":\"India\"}', NULL, '$2y$12$EJwwWY1oYd6Y0YDUjBcq7.m1aW4kGFeYoSH90uMUEHpYajVDxGp1i', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-12-15 12:09:02', '2025-12-15 12:09:02', NULL),
(5, 'narendra', 'sharma', 'narendra@dqotsolutions.com', NULL, NULL, 'user', NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', NULL, '$2y$12$xn9vnS65b02Ftzjl39NJtu/O4XmFaT8rjof2Xc9xVdcWi4DgcNSOK', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-12-15 12:58:13', '2025-12-15 12:58:13', NULL),
(6, 'test', 'developer', 'test@gmail.com', NULL, NULL, 'user', NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', NULL, '$2y$12$PSZ0tGg.xdVreAFMHYJkcu..593HoGBJnsZVwiSBp8i2dfsGLcj.O', NULL, 0, 1, NULL, NULL, NULL, NULL, '2aHluQMhffRInFncSc9XpMA1VpRLtlM2sXRVyRYA154VyPx1W18EOuDXFaad', '2025-12-16 07:01:39', '2025-12-16 07:01:39', NULL),
(7, 'Client', 'Manager', 'client_user@gmail.com', NULL, NULL, 'user', NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', NULL, '$2y$12$IBzHBUQMQKMCibKjlthPkefqJGgHrJd8iK9Uj8UgQoQ37rZ3xqOXu', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2025-12-26 10:58:51', '2025-12-30 05:14:48', NULL),
(8, 'my', 'horoscope', 'support@mytodayhoroscope.com', NULL, NULL, 'user', NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', NULL, '$2y$12$OMaJAGhyyq6b/zI4Yt14GuBMt3sHZ5Q8Em1upzNHkyRSbJ2NtOgMa', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2026-01-07 10:43:55', '2026-01-07 10:43:55', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auto_replies`
--
ALTER TABLE `auto_replies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auto_replies_uuid_unique` (`uuid`);

--
-- Indexes for table `billing_credits`
--
ALTER TABLE `billing_credits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `billing_credits_uuid_unique` (`uuid`);

--
-- Indexes for table `billing_debits`
--
ALTER TABLE `billing_debits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `billing_debits_uuid_unique` (`uuid`);

--
-- Indexes for table `billing_invoices`
--
ALTER TABLE `billing_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `billing_invoices_uuid_unique` (`uuid`);

--
-- Indexes for table `billing_items`
--
ALTER TABLE `billing_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_payments`
--
ALTER TABLE `billing_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `billing_payments_uuid_unique` (`uuid`);

--
-- Indexes for table `billing_tax_rates`
--
ALTER TABLE `billing_tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `billing_tax_rates_uuid_unique` (`uuid`);

--
-- Indexes for table `billing_transactions`
--
ALTER TABLE `billing_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `billing_transactions_uuid_unique` (`uuid`);

--
-- Indexes for table `blog_authors`
--
ALTER TABLE `blog_authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_authors_uuid_unique` (`uuid`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_uuid_unique` (`uuid`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_posts_uuid_unique` (`uuid`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_tags_uuid_unique` (`uuid`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campaigns_uuid_unique` (`uuid`);

--
-- Indexes for table `campaign_logs`
--
ALTER TABLE `campaign_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_log_retries`
--
ALTER TABLE `campaign_log_retries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chats_uuid_unique` (`uuid`),
  ADD KEY `chats_contact_id_index` (`contact_id`),
  ADD KEY `chats_created_at_index` (`created_at`),
  ADD KEY `idx_chats_contact_org_deleted_at` (`contact_id`,`organization_id`,`deleted_at`);

--
-- Indexes for table `chat_logs`
--
ALTER TABLE `chat_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_media`
--
ALTER TABLE `chat_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_notes`
--
ALTER TABLE `chat_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_status_logs`
--
ALTER TABLE `chat_status_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_tickets`
--
ALTER TABLE `chat_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_tickets_contact_id_index` (`contact_id`),
  ADD KEY `idx_chat_tickets_contact_assigned_to_status` (`contact_id`,`assigned_to`,`status`);

--
-- Indexes for table `chat_ticket_logs`
--
ALTER TABLE `chat_ticket_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contacts_uuid_unique` (`uuid`),
  ADD KEY `contacts_organization_id_index` (`organization_id`),
  ADD KEY `contacts_deleted_at_index` (`deleted_at`),
  ADD KEY `contacts_latest_chat_created_at_index` (`latest_chat_created_at`),
  ADD KEY `idx_contacts_first_name` (`first_name`),
  ADD KEY `idx_contacts_last_name` (`last_name`),
  ADD KEY `idx_contacts_email` (`email`),
  ADD KEY `idx_contacts_phone` (`phone`);
ALTER TABLE `contacts` ADD FULLTEXT KEY `fulltext_contacts_name_email_phone` (`first_name`,`last_name`,`phone`,`email`);

--
-- Indexes for table `contact_contact_group`
--
ALTER TABLE `contact_contact_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_contact_group_contact_id_foreign` (`contact_id`),
  ADD KEY `contact_contact_group_contact_group_id_foreign` (`contact_group_id`);

--
-- Indexes for table `contact_fields`
--
ALTER TABLE `contact_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_groups`
--
ALTER TABLE `contact_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_groups_uuid_unique` (`uuid`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documents_uuid_unique` (`uuid`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_logs_uuid_unique` (`uuid`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flows`
--
ALTER TABLE `flows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flows_uuid_unique` (`uuid`);

--
-- Indexes for table `flow_logs`
--
ALTER TABLE `flow_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flow_logs_flow_id_foreign` (`flow_id`);

--
-- Indexes for table `flow_media`
--
ALTER TABLE `flow_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `flow_media_uuid_unique` (`uuid`);

--
-- Indexes for table `flow_user_data`
--
ALTER TABLE `flow_user_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flow_user_data_flow_id_foreign` (`flow_id`),
  ADD KEY `flow_user_data_contact_id_index` (`contact_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_available_at_index` (`queue`,`available_at`),
  ADD KEY `jobs_attempts_index` (`attempts`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `notifications_uuid_unique` (`uuid`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organizations_uuid_unique` (`uuid`);

--
-- Indexes for table `organization_api_keys`
--
ALTER TABLE `organization_api_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organization_api_keys_token_unique` (`token`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_uuid_unique` (`uuid`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `seeder_histories`
--
ALTER TABLE `seeder_histories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seeder_histories_seeder_name_unique` (`seeder_name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_uuid_unique` (`uuid`),
  ADD KEY `subscriptions_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_plans_uuid_unique` (`uuid`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teams_uuid_unique` (`uuid`),
  ADD KEY `teams_organization_id_foreign` (`organization_id`),
  ADD KEY `teams_user_id_foreign` (`user_id`),
  ADD KEY `teams_created_by_foreign` (`created_by`);

--
-- Indexes for table `team_invites`
--
ALTER TABLE `team_invites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_invites_organization_id_foreign` (`organization_id`),
  ADD KEY `team_invites_invited_by_foreign` (`invited_by`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templates_organization_id_foreign` (`organization_id`),
  ADD KEY `templates_created_by_foreign` (`created_by`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_category_id_foreign` (`category_id`),
  ADD KEY `tickets_assigned_to_foreign` (`assigned_to`),
  ADD KEY `tickets_closed_by_foreign` (`closed_by`);

--
-- Indexes for table `ticket_categories`
--
ALTER TABLE `ticket_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_comments_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_deleted_at_unique` (`email`,`deleted_at`),
  ADD UNIQUE KEY `users_facebook_id_unique` (`facebook_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `auto_replies`
--
ALTER TABLE `auto_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `billing_credits`
--
ALTER TABLE `billing_credits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_debits`
--
ALTER TABLE `billing_debits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_invoices`
--
ALTER TABLE `billing_invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `billing_items`
--
ALTER TABLE `billing_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_payments`
--
ALTER TABLE `billing_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_tax_rates`
--
ALTER TABLE `billing_tax_rates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_transactions`
--
ALTER TABLE `billing_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog_authors`
--
ALTER TABLE `blog_authors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `campaign_logs`
--
ALTER TABLE `campaign_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `campaign_log_retries`
--
ALTER TABLE `campaign_log_retries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `chat_logs`
--
ALTER TABLE `chat_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT for table `chat_media`
--
ALTER TABLE `chat_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `chat_notes`
--
ALTER TABLE `chat_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chat_status_logs`
--
ALTER TABLE `chat_status_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `chat_tickets`
--
ALTER TABLE `chat_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chat_ticket_logs`
--
ALTER TABLE `chat_ticket_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `contact_contact_group`
--
ALTER TABLE `contact_contact_group`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_fields`
--
ALTER TABLE `contact_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_groups`
--
ALTER TABLE `contact_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flows`
--
ALTER TABLE `flows`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flow_logs`
--
ALTER TABLE `flow_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `flow_media`
--
ALTER TABLE `flow_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flow_user_data`
--
ALTER TABLE `flow_user_data`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `organization_api_keys`
--
ALTER TABLE `organization_api_keys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seeder_histories`
--
ALTER TABLE `seeder_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `team_invites`
--
ALTER TABLE `team_invites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_categories`
--
ALTER TABLE `ticket_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact_contact_group`
--
ALTER TABLE `contact_contact_group`
  ADD CONSTRAINT `contact_contact_group_contact_group_id_foreign` FOREIGN KEY (`contact_group_id`) REFERENCES `contact_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contact_contact_group_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flow_logs`
--
ALTER TABLE `flow_logs`
  ADD CONSTRAINT `flow_logs_flow_id_foreign` FOREIGN KEY (`flow_id`) REFERENCES `flows` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flow_user_data`
--
ALTER TABLE `flow_user_data`
  ADD CONSTRAINT `flow_user_data_flow_id_foreign` FOREIGN KEY (`flow_id`) REFERENCES `flows` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `teams_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`),
  ADD CONSTRAINT `teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `team_invites`
--
ALTER TABLE `team_invites`
  ADD CONSTRAINT `team_invites_invited_by_foreign` FOREIGN KEY (`invited_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `team_invites_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `templates`
--
ALTER TABLE `templates`
  ADD CONSTRAINT `templates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `templates_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_assigned_to_foreign` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `ticket_categories` (`id`),
  ADD CONSTRAINT `tickets_closed_by_foreign` FOREIGN KEY (`closed_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  ADD CONSTRAINT `ticket_comments_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
