-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2026 at 12:24 PM
-- Server version: 8.0.42-0ubuntu0.20.04.1
-- PHP Version: 8.3.19

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
(1, 'af0304cc-e118-4946-96d6-93df59e7665c', 'chat', 'Embedded Signup', 'whatsapp.png', 'An Embedded Signup add-on allows app users to register using their WhatsApp account.', '{\"input_fields\":[{\"element\":\"input\",\"type\":\"text\",\"name\":\"whatsapp_client_id\",\"label\":\"App ID\",\"class\":\"col-span-1\"},{\"element\":\"input\",\"type\":\"password\",\"name\":\"whatsapp_client_secret\",\"label\":\"App secret\",\"class\":\"col-span-1\"},{\"element\":\"input\",\"type\":\"text\",\"name\":\"whatsapp_config_id\",\"label\":\"Config ID\",\"class\":\"col-span-2\"},{\"element\":\"input\",\"type\":\"password\",\"name\":\"whatsapp_access_token\",\"label\":\"Access token\",\"class\":\"col-span-2\"}]}', 'extended', NULL, 1, 0, 1, 1, '2025-11-25 08:04:05', '2025-12-17 01:15:06'),
(2, 'f0c1c46c-f778-4775-93cc-3c9d417dc809', 'recaptcha', 'Google Recaptcha', 'google_recaptcha.png', 'Google reCAPTCHA enhances website security by preventing spam and abusive activities.', '{\n    \"input_fields\": [\n        {\n            \"element\": \"input\",\n            \"type\": \"password\",\n            \"name\": \"recaptcha_site_key\",\n            \"label\": \"Recaptcha site key\",\n            \"class\": \"col-span-2\"\n        },\n        {\n            \"element\": \"input\",\n            \"type\": \"password\",\n            \"name\": \"recaptcha_secret_key\",\n            \"label\": \"Recaptcha secret key\",\n            \"class\": \"col-span-2\"\n        }\n    ],\n    \"name\": \"GoogleRecaptcha\"\n}', 'regular', NULL, 0, 0, 1, 0, '2025-11-25 08:04:05', '2025-12-17 01:15:06'),
(3, '0b4f7a4c-07c1-45e6-a9a9-34fc19c00b19', 'analytics', 'Google Analytics', 'google_analytics.png', 'Google Analytics tracks website performance and provides valuable insights for optimization.', '{\"input_fields\": [{\"element\": \"input\", \"type\": \"text\", \"name\": \"google_analytics_tracking_id\", \"label\": \"Google analytics tracking ID\", \"class\": \"col-span-2\"}]}', 'regular', NULL, 0, 0, 1, 0, '2025-11-25 08:04:05', '2025-11-25 08:04:05'),
(4, '08df366a-627f-423c-ae0f-41875dba8542', 'maps', 'Google Maps', 'google_maps.png', 'Google Maps provides interactive maps for whatsapp messages.', '{\"input_fields\": [{\"element\": \"input\", \"type\": \"text\", \"name\": \"google_maps_api_key\", \"label\": \"Google maps API key\", \"class\": \"col-span-2\"}]}', 'regular', NULL, 0, 0, 1, 0, '2025-11-25 08:04:05', '2025-11-25 08:04:05'),
(5, '1d752a5a-04ca-4def-abd8-3677565a7dff', 'payments', 'Razorpay', 'razorpay.png', 'Razorpay is a payment platform that simplies payment processing.', '{\"input_fields\": [{\"element\": \"input\", \"type\": \"text\", \"name\": \"razorpay_key_id\", \"label\": \"Key ID\", \"class\": \"col-span-2\"}, {\"element\": \"input\", \"type\": \"text\", \"name\": \"razorpay_secret_key\", \"label\": \"Secret Key\", \"class\": \"col-span-2\"},{\"element\": \"input\", \"type\": \"text\", \"name\": \"razorpay_webhook_secret\", \"label\": \"Webhook secret\", \"class\": \"col-span-2\"},{\"element\":\"toggle\",\"type\":\"checkbox\",\"name\":\"razorpay_active\",\"label\":\"Enable\\/disable Razorpay\",\"class\":\"col-span-2\"}]}', 'regular', NULL, 0, 0, 1, 0, '2025-11-25 08:04:05', '2025-12-17 01:15:06'),
(6, 'a12dcdc9-ee7f-43f5-8ecf-68386f9d0fa3', 'ai', 'AI Assistant', 'ai.png', 'The AI assistant delivers intelligent, AI-driven responses by utilizing user data for training.', '{\"input_fields\": [{\"element\":\"toggle\",\"type\":\"checkbox\",\"name\":\"ai\",\"label\":\"Enable\\/disable AI Assistant\",\"class\":\"col-span-2\"}]}', NULL, NULL, 1, 0, 1, 1, '2025-12-17 01:15:06', '2026-02-14 01:07:38'),
(7, '018606c6-be46-471b-b6a4-0735bf1aad73', 'utility', 'Webhooks', 'webhook_icon.png', 'Webhooks enable real-time data transfer by sending automated notifications on specific events.', '{\n    \"name\": \"Webhook\"\n}', NULL, NULL, 1, 0, 0, 0, '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(9, 'e4057e5e-0f55-4712-a716-2a41ed5ef890', 'two factor authentication', 'Google Authenticator', 'google_authenticator.png', 'Google Authenticator enhances security with two-factor authentication.', '{\"input_fields\": [{\"element\":\"toggle\",\"type\":\"checkbox\",\"name\":\"google_auth_active\",\"label\":\"Enable\\/disable Google Authenticator\",\"class\":\"col-span-2\"}]}', 'regular', '1.0', 0, 0, 1, 1, '2025-12-17 01:15:06', '2025-12-17 01:38:07'),
(13, '3ca0be70-2127-40e0-896d-32d21ad837e2', 'utility', 'Flow builder', 'flow_icon.png', 'Flow Builder automation allows users to visually create and manage messaging workflows!', '{\"input_fields\":[{\"element\":\"toggle\",\"type\":\"checkbox\",\"name\":\"flow_builder\",\"label\":\"Enable Flow builder\",\"class\":\"col-span-2\"}]}', 'standalone', NULL, 1, 0, 1, 1, '2024-11-14 05:27:59', '2024-11-14 05:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `ai_knowledge_bases`
--

CREATE TABLE `ai_knowledge_bases` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `organization_id` bigint UNSIGNED NOT NULL,
  `source` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext,
  `embeddings` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(1, 'c777fcd0-ec4a-4e38-8f0a-3cf05ef48105', 1, 'Auto Answer', 'Hello', 'exact match', '{\"type\":\"text\",\"data\":{\"text\":\"Hello User.\\nhow can i help you?\"}}', 1, NULL, NULL, '2025-12-04 03:49:02', '2025-12-04 03:49:02');

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

--
-- Dumping data for table `billing_credits`
--

INSERT INTO `billing_credits` (`id`, `uuid`, `organization_id`, `description`, `amount`) VALUES
(1, '79a8ee5d-09df-4ded-a7cb-0fb06e92c11e', 3, 'cash', 5000.0000);

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
(2, 'd13c68d3-4f96-43ac-91ac-47e02fb232ae', 1, 1, 0.0000, NULL, 0.00, 0.0000000000, 'inclusive', 0.0000),
(3, '3ad40bff-0c32-4a78-a983-c8a585f3644f', 2, 1, 0.0000, NULL, 0.00, 0.0000000000, 'inclusive', 0.0000),
(4, '900dd08e-f825-479e-aefb-cf53d537809c', 1, 1, 500.0000, NULL, 0.00, 0.0000000000, 'inclusive', 500.0000),
(5, 'bd31a888-59d7-44b1-9d4c-98df2c5b859a', 3, 1, 500.0000, NULL, 0.00, 0.0000000000, 'inclusive', 500.0000);

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

--
-- Dumping data for table `billing_payments`
--

INSERT INTO `billing_payments` (`id`, `uuid`, `organization_id`, `processor`, `details`, `amount`) VALUES
(1, 'f3c3382f-3d8e-44ed-982b-969e4cb75de4', 1, 'bank', NULL, 1000.0000);

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
(2, 'edca4d87-ae82-4191-8cc5-0916a7396518', 1, 'payment', 1, 'bank Transaction', 1000.0000, 3, '2025-12-04 01:10:56', '2025-12-04 01:10:56'),
(3, 'aeee3647-0004-4996-b99d-6ba93bec846a', 1, 'invoice', 2, 'Invoice', 0.0000, 1, '2026-01-05 00:54:16', '2026-01-05 00:54:16'),
(4, '33985b19-56cc-4628-98b3-b9f8abaa81bb', 2, 'invoice', 3, 'Invoice', 0.0000, 4, '2026-01-05 00:55:46', '2026-01-05 00:55:46'),
(5, '706d0c10-4566-4ee3-a760-eb872a004dbf', 1, 'invoice', 4, 'Invoice', -500.0000, 1, '2026-02-05 00:56:47', '2026-02-05 00:56:47'),
(6, '2af00801-4d1b-431f-ad7e-7d24f4e2141f', 3, 'credit', 1, 'cash', 5000.0000, 3, '2026-02-12 03:22:58', '2026-02-12 03:22:58'),
(7, '8cf0874a-d8e8-4912-bedc-bf19a9b0df6b', 3, 'invoice', 5, 'Invoice', -500.0000, 5, '2026-02-12 03:23:36', '2026-02-12 03:23:36');

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
(9, '983dc2a8-1cec-43b8-b9d0-f5240c95b1a9', 1, 'for testinmg', 6, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Technician visit\",\"parameters\":[]},\"body\":{\"text\":\"Hi {{1}}, we\'re scheduling a technician visit for your {{2}} on {{3}} between {{4}} and {{5}}. Please confirm if this time slot works for you.\",\"parameters\":[{\"type\":\"text\",\"selection\":\"static\",\"value\":\"Admin\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"Admin setup installation\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"2025-12-31\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"10:00 AM\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"2:00 PM\"}]},\"footer\":{\"text\":null},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"Confirm\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"yes\"}]},{\"type\":\"QUICK_REPLY\",\"text\":\"Reschedule\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"No\"}]}],\"media\":null}', 'completed', '2025-12-04 06:24:36', 1, NULL, '2025-12-04 06:26:15', NULL),
(10, '8bd789f7-37ab-4b96-a71f-b96334341018', 2, 'test', 10, 0, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Hello World\",\"parameters\":[]},\"body\":{\"text\":\"Welcome and congratulations!! This message demonstrates your ability to send a WhatsApp message notification from the Cloud API, hosted by Meta. Thank you for taking the time to test with us.\",\"parameters\":[]},\"footer\":{\"text\":\"WhatsApp Business Platform sample message\"},\"buttons\":[],\"media\":null}', 'completed', '2026-01-05 07:11:24', 4, NULL, '2026-01-05 07:14:23', NULL),
(11, '1d5266f9-c1e1-48af-a1d0-ddde4c5c82b1', 1, 'for testinmg', 6, 8, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Technician visit\",\"parameters\":[]},\"body\":{\"text\":\"Hi {{1}}, we\'re scheduling a technician visit for your {{2}} on {{3}} between {{4}} and {{5}}. Please confirm if this time slot works for you.\",\"parameters\":[{\"type\":\"text\",\"selection\":\"static\",\"value\":\"Admin\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"Admin setup installation\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"2025-12-31\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"10:00 AM\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"2:00 PM\"}]},\"footer\":{\"text\":null},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"Confirm\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"yes\"}]},{\"type\":\"QUICK_REPLY\",\"text\":\"Reschedule\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"No\"}]}],\"media\":null}', 'scheduled', '2026-02-05 08:53:19', 1, NULL, '2026-02-05 08:53:19', NULL),
(12, '0a61fe20-ccb5-4027-87ce-ec77ace6b370', 1, 'for testinmg', 6, 9, '{\"header\":{\"format\":\"TEXT\",\"text\":\"Technician visit\",\"parameters\":[]},\"body\":{\"text\":\"Hi {{1}}, we\'re scheduling a technician visit for your {{2}} on {{3}} between {{4}} and {{5}}. Please confirm if this time slot works for you.\",\"parameters\":[{\"type\":\"text\",\"selection\":\"static\",\"value\":\"Admin\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"Admin setup installation\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"2025-12-31\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"10:00 AM\"},{\"type\":\"text\",\"selection\":\"static\",\"value\":\"2:00 PM\"}]},\"footer\":{\"text\":null},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"Confirm\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"yes\"}]},{\"type\":\"QUICK_REPLY\",\"text\":\"Reschedule\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"No\"}]}],\"media\":null}', 'scheduled', '2026-02-05 08:56:22', 1, NULL, '2026-02-05 08:56:22', NULL);

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
(12, 9, 1, 14, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+916376535743\",\"wa_id\":\"916376535743\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkMyMjk1NEVGQjA5MUJCMkZFAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-04 00:56:12', '2025-12-04 00:56:14'),
(13, 9, 2, 15, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086311\",\"wa_id\":\"919257086311\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSOTAyQkExOTUzRjM4NDAzNUFBAA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-04 00:56:12', '2025-12-04 00:56:15'),
(14, 9, 3, 16, '{\"data\":{\"messaging_product\":\"whatsapp\",\"contacts\":[{\"input\":\"+919257086309\",\"wa_id\":\"919257086309\"}],\"messages\":[{\"id\":\"wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTE1NzVEMkU5OTc2MTZGNDE3AA==\",\"message_status\":\"accepted\"}]}}', 'success', 0, '2025-12-04 00:56:12', '2025-12-04 00:56:15'),
(15, 10, 5, NULL, '{\"data\":{\"error\":{\"message\":\"(#133010) Account not registered\",\"type\":\"OAuthException\",\"code\":133010,\"fbtrace_id\":\"A5HGoXTpMKeK7L0jTUid6FO\"}},\"message\":\"(#133010) Account not registered\"}', 'failed', 0, '2026-01-05 01:44:22', '2026-01-05 01:44:23');

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
(1, 'e114efef-83ea-45a9-be38-33c90f3fd70c', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOEIxNDcxOTJGMTlEQjY4N0MwAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"Dqot\"},\"buttons\":[{\"type\":\"URL\",\"text\":\"Visit website\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 01:28:42'),
(2, 'b08e6e13-398f-4950-9fcf-af6d01fe6ba7', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSOTAxMjg4OTAyRkUwRUJCRTFBAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"Dqot\"},\"buttons\":[{\"type\":\"URL\",\"text\":\"Visit website\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 01:30:38'),
(3, '562f56d4-5a1e-4c90-b9a1-9694ec81ad48', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRDU0NDBBQURFQkFERDRBQ0VDAA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"Dqot\"},\"buttons\":[{\"type\":\"URL\",\"text\":\"Visit website\",\"value\":\"https:\\/\\/www.dqotsolutions.com\\/\",\"parameters\":[]}]}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 01:30:39'),
(4, '7d74c80c-a4f4-4bdb-b810-07c3009f1f43', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMTIyRDJDQUY0M0Y3M0NGN0QyAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello hem ant this is a message from DOT\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 01:31:38'),
(5, 'c19f6bbf-122c-4384-976b-bc5137e68cd0', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRUYwNTQzMjc5RkUzQTg0MjBBAA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello hem ant this is a message from DOT\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 01:31:39'),
(6, '0f1b978f-c31d-43fc-af67-89ca35b0fc56', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQzZENUJFNjBDQkM5RTUyREEzAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 04:30:56'),
(7, '67394cee-6882-4cfb-a3e9-a39de30eb85e', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRDJCQjRERjMxN0NBNjVERDcyAA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 04:30:57'),
(8, '34638d42-e04e-48a7-9e65-1249a6e2e391', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSQjA2MzMzRjY0MUZCOTU2RTk4AA==', 3, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hello User\",\"footer\":\"DQOT Solutions\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-26 04:30:58'),
(9, 'cd24d910-5346-4cfb-9012-e4b5a008bff0', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMTc3RUZEN0I5QjFCNTUyQTI1AA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is demo from admin panal\",\"footer\":\"this is demo from admin panal\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-27 23:59:57'),
(10, '10f1f194-2a7c-4309-87c5-4509357f3109', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRkU4MkE4N0RBNjM4NzU4MTQ1AA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is demo from admin panal\",\"footer\":\"this is demo from admin panal\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-27 23:59:58'),
(11, '38dee7c6-2f36-4ab7-9db7-23474156f4ee', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSMDZFMjlDQjg1QzdDNzJBQjVGAA==', 3, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is demo from admin panal\",\"footer\":\"this is demo from admin panal\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-11-27 23:59:59'),
(12, '62691de4-9162-42eb-a74c-e45547c0f92f', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSRDA4RURCMkNFM0FFNkIwODY5AA==', 2, NULL, 'outbound', '{\"text\":{\"body\":\"ssss\"},\"type\":\"text\"}', NULL, 'delivered', 0, NULL, NULL, '2025-12-04 06:19:46'),
(13, 'ede62e05-06c4-4494-889c-810f16e8d0f9', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSQ0FBRUY2MEE5QUMzQjE3ODFBAA==', 1, NULL, 'outbound', '{\"text\":{\"body\":\"sss\"},\"type\":\"text\"}', NULL, 'delivered', 0, NULL, NULL, '2025-12-04 06:20:08'),
(14, '417bc818-084d-4501-a1c3-e913c9496663', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSNkMyMjk1NEVGQjA5MUJCMkZFAA==', 1, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hi Admin, we\'re scheduling a technician visit for your Admin setup installation on 2025-12-31 between 10:00 AM and 2:00 PM. Please confirm if this time slot works for you.\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"Confirm\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"yes\"}]},{\"type\":\"QUICK_REPLY\",\"text\":\"Reschedule\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"No\"}]}]}', NULL, 'accepted', 0, NULL, NULL, '2025-12-04 00:56:14'),
(15, '4d5ac253-c692-435b-999d-fe735007f2d7', 1, 'wamid.HBgMOTE5MjU3MDg2MzExFQIAERgSOTAyQkExOTUzRjM4NDAzNUFBAA==', 2, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hi Admin, we\'re scheduling a technician visit for your Admin setup installation on 2025-12-31 between 10:00 AM and 2:00 PM. Please confirm if this time slot works for you.\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"Confirm\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"yes\"}]},{\"type\":\"QUICK_REPLY\",\"text\":\"Reschedule\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"No\"}]}]}', NULL, 'accepted', 0, NULL, NULL, '2025-12-04 00:56:15'),
(16, '7738eb2c-db3f-4a5c-bd3e-0a6822d86e64', 1, 'wamid.HBgMOTE5MjU3MDg2MzA5FQIAERgSNTE1NzVEMkU5OTc2MTZGNDE3AA==', 3, NULL, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"Hi Admin, we\'re scheduling a technician visit for your Admin setup installation on 2025-12-31 between 10:00 AM and 2:00 PM. Please confirm if this time slot works for you.\"},\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"Confirm\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"yes\"}]},{\"type\":\"QUICK_REPLY\",\"text\":\"Reschedule\",\"value\":null,\"parameters\":[{\"type\":\"static\",\"value\":\"No\"}]}]}', NULL, 'accepted', 0, NULL, NULL, '2025-12-04 00:56:15'),
(17, 'bb2c24c9-53ac-455b-b711-33d3506f08df', 1, 'wamid.HBgMOTE2Mzc2NTM1NzQzFQIAERgSMEVBNkIwMUY2OTU2REJEQzE0AA==', 1, 1, 'outbound', '{\"type\":\"text\",\"text\":{\"body\":\"this is demo from admin panal\",\"footer\":\"this is demo from admin panal\"}}', NULL, 'accepted', 0, NULL, NULL, '2025-12-19 00:25:17');

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
(1, 1, 'chat', 1, NULL, NULL, '2025-11-26 01:28:42', NULL),
(2, 1, 'chat', 2, NULL, NULL, '2025-11-26 01:30:38', NULL),
(3, 2, 'chat', 3, NULL, NULL, '2025-11-26 01:30:39', NULL),
(4, 1, 'chat', 4, NULL, NULL, '2025-11-26 01:31:38', NULL),
(5, 2, 'chat', 5, NULL, NULL, '2025-11-26 01:31:39', NULL),
(6, 1, 'chat', 6, NULL, NULL, '2025-11-26 04:30:56', NULL),
(7, 2, 'chat', 7, NULL, NULL, '2025-11-26 04:30:57', NULL),
(8, 3, 'chat', 8, NULL, NULL, '2025-11-26 04:30:58', NULL),
(9, 1, 'chat', 9, NULL, NULL, '2025-11-27 23:59:57', NULL),
(10, 2, 'chat', 10, NULL, NULL, '2025-11-27 23:59:58', NULL),
(11, 3, 'chat', 11, NULL, NULL, '2025-11-27 23:59:59', NULL),
(12, 2, 'chat', 12, NULL, NULL, '2025-12-04 00:49:46', NULL),
(13, 1, 'chat', 13, NULL, NULL, '2025-12-04 00:50:08', NULL),
(14, 1, 'chat', 14, NULL, NULL, '2025-12-04 00:56:14', NULL),
(15, 2, 'chat', 15, NULL, NULL, '2025-12-04 00:56:15', NULL),
(16, 3, 'chat', 16, NULL, NULL, '2025-12-04 00:56:15', NULL),
(17, 1, 'ticket', 1, NULL, NULL, '2025-12-05 01:07:21', NULL),
(18, 1, 'chat', 17, NULL, NULL, '2025-12-19 00:25:18', NULL);

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
(1, 3, NULL, 'open', NULL, '2025-12-05 00:49:44'),
(2, 2, NULL, 'open', NULL, '2025-12-05 00:49:44'),
(3, 1, 1, 'closed', NULL, '2025-12-05 00:49:44');

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
(1, 1, 'Conversation was moved from opened to closed', '2025-12-05 01:07:21', NULL);

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
(1, '87f05c6a-f40b-4a3a-9681-d13cddcd6f44', 1, 'Test', 'test', '+916376535743', 'test@gmail.com', NULL, NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', '[]', 9, 0, 0, 1, '2025-11-26 01:15:43', '2026-02-05 08:56:22', NULL),
(2, '0e10cbbd-c857-46f6-b5aa-619610984dad', 1, 'narendra', 'shrma', '+919257086311', 'naredra@gmail.com', NULL, NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', '[]', 9, 0, 0, 1, '2025-11-26 01:30:19', '2026-02-05 08:56:22', NULL),
(3, '1d293a96-370f-4181-998b-fde589132a4f', 1, 'DQOT', 'Admin', '+919257086309', 'dqot@gmail.com', NULL, NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', '[]', NULL, 0, 0, 1, '2025-11-26 01:55:18', '2025-11-26 01:55:18', NULL),
(4, '6df945b3-1728-49ec-a1e2-d694681219db', 1, 'Mike', 'Jones', '+919898989898', 'mikejones@gmail.com', NULL, NULL, '{\"street\":\"\",\"city\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"\"}', NULL, NULL, 0, 0, 1, NULL, NULL, NULL),
(5, '33f18fca-585a-4d47-b0cb-771c8b7f32ef', 2, 'teast', 'user', '+916376535743', NULL, NULL, NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', '[]', NULL, 0, 0, 4, '2026-01-05 01:40:00', '2026-01-05 01:40:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts_flows_old`
--

CREATE TABLE `contacts_flows_old` (
  `id` bigint NOT NULL,
  `contact_id` bigint UNSIGNED NOT NULL,
  `flow_id` int UNSIGNED NOT NULL,
  `campaign_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

--
-- Dumping data for table `contact_contact_group`
--

INSERT INTO `contact_contact_group` (`id`, `contact_id`, `contact_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2025-12-17 03:21:24', '2025-12-17 03:21:24');

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
(2, '12863159-2cb0-4ea0-aa69-8d9a407905f2', 1, 'abc', 1, '2025-11-26 05:37:37', '2025-11-26 05:37:37', NULL),
(3, '280e5fd1-6159-4688-b395-2547a5f970e6', 1, 'retry', 1, '2026-02-05 07:53:34', '2026-02-05 02:23:34', NULL),
(4, '0dd65bb3-9392-4279-a5c3-4290246c6e21', 1, 'retry', 1, '2026-02-05 07:55:30', '2026-02-05 02:25:30', NULL),
(5, '838dcba2-2cd6-484c-863d-aeb78ff25596', 1, 'retry', 1, '2026-02-05 07:57:53', '2026-02-05 02:27:53', NULL),
(6, '0d2f4094-4ba8-4b9f-9c71-427b9e777811', 1, 'retry', 1, '2026-02-05 07:59:52', '2026-02-05 02:29:52', NULL),
(7, 'a0efa763-5269-4716-9a91-8cf8e16eb9f3', 1, 'retry', 1, '2026-02-05 08:51:21', '2026-02-05 03:21:21', NULL),
(8, '25a7d486-4e35-467f-90e6-5737db1f5573', 1, 'retry', 1, '2026-02-05 08:53:19', '2026-02-05 03:23:19', NULL),
(9, '9af2ab67-659a-4b5a-8d4f-d03a8ab0c7d4', 1, 'retry_2602050226', 1, '2026-02-05 08:56:22', '2026-02-05 03:26:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_tags`
--

CREATE TABLE `contact_tags` (
  `id` bigint NOT NULL,
  `contact_id` char(50) NOT NULL,
  `tag_id` bigint NOT NULL,
  `assign_by` bigint DEFAULT NULL,
  `assign_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contact_tags`
--

INSERT INTO `contact_tags` (`id`, `contact_id`, `tag_id`, `assign_by`, `assign_datetime`) VALUES
(1, '33f18fca-585a-4d47-b0cb-771c8b7f32ef', 1, NULL, '2026-01-30 12:11:59');

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

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Is the Green Tick guaranteed?', 'Meta awards the Green Tick based on brand presence. While we cannot guarantee it (nobody can), our expert team optimizes your profile to maximize the chances of approval.', 1, '2026-02-04 05:11:11', '2026-02-04 05:11:11'),
(2, 'Can I use my existing WhatsApp number?', 'Yes, you can migrate your existing phone number to the WhatsApp Business API. However, you must first delete the account from the current WhatsApp App / Business App before onboarding.', 1, '2026-02-04 05:12:12', '2026-02-04 05:12:12');

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
(1, '22e6b2db-3086-463c-a311-c208b70df6ec', 2, 'Test', 'this is test', 'keywords', 'Hii', '{\"nodes\":[{\"id\":\"1\",\"type\":\"start\",\"dimensions\":{\"width\":452,\"height\":286},\"computedPosition\":{\"x\":-5.537832282597947,\"y\":-3239.1192373949425,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"1\",\"position\":\"right\",\"x\":443.328125,\"y\":134,\"width\":18,\"height\":18}],\"target\":null},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":-5.537832282597947,\"y\":-3239.1192373949425},\"data\":{\"uuid\":\"22e6b2db-3086-463c-a311-c208b70df6ec\",\"title\":\"start\",\"metadata\":{\"fields\":{\"type\":\"keywords\",\"keywords\":\"Hii\"}}},\"events\":{},\"label\":\"start\"},{\"id\":\"2\",\"type\":\"media\",\"dimensions\":{\"width\":419,\"height\":414},\"computedPosition\":{\"x\":587.8744970789435,\"y\":-3309.302346129252,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"2\",\"position\":\"right\",\"x\":409.6875,\"y\":198,\"width\":18,\"height\":18}],\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"2\",\"position\":\"left\",\"x\":-9,\"y\":198,\"width\":18,\"height\":18}]},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":587.8744970789435,\"y\":-3309.302346129252},\"data\":{\"uuid\":\"22e6b2db-3086-463c-a311-c208b70df6ec\",\"title\":\"media\",\"metadata\":{\"fields\":{\"type\":\"media\",\"mediaType\":\"image\",\"caption\":\"erwerwerwer\",\"media\":{\"flow_id\":1,\"step_id\":\"2\",\"path\":\"https://waapi.dqotdemo.in/media/public/xIazSElSbPRBnB5iIrb9FTGJ4zvKPewcye0e1P4y.png\",\"location\":\"local\",\"metadata\":\"{\\\"name\\\":\\\"image__1_-removebg-preview.png\\\",\\\"extension\\\":\\\"image\\\\/png\\\",\\\"size\\\":59612}\",\"uuid\":\"d5739361-83d4-4008-a1d7-d4b1e63e25fe\",\"updated_at\":\"2026-01-20T05:29:16.000000Z\",\"created_at\":\"2026-01-20T05:29:16.000000Z\",\"id\":1}}}},\"events\":{},\"label\":\"media node\"},{\"id\":\"3\",\"type\":\"buttons\",\"dimensions\":{\"width\":0,\"height\":0},\"computedPosition\":{\"x\":1263.4194014244226,\"y\":-3062.591567786297,\"z\":0},\"handleBounds\":{\"source\":[],\"target\":[]},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":1263.4194014244226,\"y\":-3062.591567786297},\"data\":{\"uuid\":\"22e6b2db-3086-463c-a311-c208b70df6ec\",\"title\":\"buttons\",\"metadata\":{\"fields\":[]}},\"events\":{},\"label\":\"buttons node\"},{\"id\":\"4\",\"type\":\"buttons\",\"dimensions\":{\"width\":0,\"height\":0},\"computedPosition\":{\"x\":1365.4194014244226,\"y\":-3154.591567786297,\"z\":0},\"handleBounds\":{\"source\":[],\"target\":[]},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":1365.4194014244226,\"y\":-3154.591567786297},\"data\":{\"uuid\":\"22e6b2db-3086-463c-a311-c208b70df6ec\",\"title\":\"buttons\",\"metadata\":{\"fields\":[]}},\"events\":{},\"label\":\"buttons node\"},{\"id\":\"5\",\"type\":\"buttons\",\"dimensions\":{\"width\":464,\"height\":840},\"computedPosition\":{\"x\":1168.8822202277622,\"y\":-3898.9298864576626,\"z\":1000},\"handleBounds\":{\"source\":null,\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"5\",\"position\":\"left\",\"x\":-9.000188308324697,\"y\":411.0003993200208,\"width\":18,\"height\":18}]},\"selected\":true,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":1168.8822202277622,\"y\":-3898.9298864576626},\"data\":{\"uuid\":\"22e6b2db-3086-463c-a311-c208b70df6ec\",\"title\":\"buttons\",\"metadata\":{\"fields\":{\"type\":\"interactive buttons\",\"headerType\":\"none\",\"headerText\":\"\",\"headerMedia\":[],\"body\":\"\",\"footer\":\"\",\"buttonType\":\"buttons\",\"buttons\":{\"button1\":\"\",\"button2\":\"\",\"button3\":\"\"},\"ctaUrlButton\":{\"displayText\":\"\",\"url\":\"\"}}}},\"events\":{},\"label\":\"buttons node\"}],\"edges\":[{\"id\":\"vueflow__edge-1-2\",\"type\":\"default\",\"source\":\"1\",\"target\":\"2\",\"sourceHandle\":null,\"targetHandle\":null,\"data\":{},\"events\":{},\"label\":\"\",\"sourceNode\":{\"id\":\"1\",\"type\":\"start\",\"dimensions\":{\"width\":452,\"height\":286},\"computedPosition\":{\"x\":-5.537832282597947,\"y\":-3239.1192373949425,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"1\",\"position\":\"right\",\"x\":443.328125,\"y\":134,\"width\":18,\"height\":18}],\"target\":null},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":-5.537832282597947,\"y\":-3239.1192373949425},\"data\":{\"uuid\":\"22e6b2db-3086-463c-a311-c208b70df6ec\",\"title\":\"start\",\"metadata\":{\"fields\":{\"type\":\"keywords\",\"keywords\":\"Hii\"}}},\"events\":{},\"label\":\"start\"},\"targetNode\":{\"id\":\"2\",\"type\":\"media\",\"dimensions\":{\"width\":419,\"height\":414},\"computedPosition\":{\"x\":587.8744970789435,\"y\":-3309.302346129252,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"2\",\"position\":\"right\",\"x\":409.6875,\"y\":198,\"width\":18,\"height\":18}],\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"2\",\"position\":\"left\",\"x\":-9,\"y\":198,\"width\":18,\"height\":18}]},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":587.8744970789435,\"y\":-3309.302346129252},\"data\":{\"uuid\":\"22e6b2db-3086-463c-a311-c208b70df6ec\",\"title\":\"media\",\"metadata\":{\"fields\":{\"type\":\"media\",\"mediaType\":\"image\",\"caption\":\"erwerwerwer\",\"media\":{\"flow_id\":1,\"step_id\":\"2\",\"path\":\"https://waapi.dqotdemo.in/media/public/xIazSElSbPRBnB5iIrb9FTGJ4zvKPewcye0e1P4y.png\",\"location\":\"local\",\"metadata\":\"{\\\"name\\\":\\\"image__1_-removebg-preview.png\\\",\\\"extension\\\":\\\"image\\\\/png\\\",\\\"size\\\":59612}\",\"uuid\":\"d5739361-83d4-4008-a1d7-d4b1e63e25fe\",\"updated_at\":\"2026-01-20T05:29:16.000000Z\",\"created_at\":\"2026-01-20T05:29:16.000000Z\",\"id\":1}}}},\"events\":{},\"label\":\"media node\"},\"sourceX\":455.79029271740205,\"sourceY\":-3096.1192373949425,\"targetX\":578.8744970789435,\"targetY\":-3102.302346129252}],\"viewport\":{\"x\":-270.8095608080471,\"y\":2332.978751065701,\"zoom\":0.5904963307147651}}', 'inactive', '2026-01-19 07:14:40', '2026-01-22 07:37:22', NULL),
(2, 'a87e9de7-2996-4c34-8bd0-686d9ffead23', 1, 'test', 'testing', 'new_contact', NULL, '{\"nodes\":[{\"id\":\"1\",\"type\":\"start\",\"dimensions\":{\"width\":459,\"height\":194},\"computedPosition\":{\"x\":48,\"y\":23,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"1\",\"position\":\"right\",\"x\":450.3905742799187,\"y\":87.99999929024295,\"width\":18,\"height\":18}],\"target\":null},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":48,\"y\":23},\"data\":{\"uuid\":\"a87e9de7-2996-4c34-8bd0-686d9ffead23\",\"title\":\"start\",\"metadata\":{\"fields\":{\"type\":\"new_contact\",\"keywords\":null}}},\"events\":{},\"label\":\"start\"},{\"id\":\"2\",\"type\":\"delay\",\"dimensions\":{\"width\":150,\"height\":40},\"computedPosition\":{\"x\":619.40625,\"y\":44,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"2\",\"position\":\"bottom\",\"x\":66.00011340556443,\"y\":30.000008965138964,\"width\":18,\"height\":18}],\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"2\",\"position\":\"top\",\"x\":66.00011340556443,\"y\":-7.999996482813534,\"width\":18,\"height\":18}]},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":619.40625,\"y\":44},\"data\":{\"uuid\":\"a87e9de7-2996-4c34-8bd0-686d9ffead23\",\"title\":\"delay\",\"metadata\":{\"fields\":{\"type\":\"delay\",\"value\":44,\"unit\":\"seconds\"}}},\"events\":{},\"label\":\"delay node\"},{\"id\":\"3\",\"type\":\"contact\",\"dimensions\":{\"width\":290,\"height\":466},\"computedPosition\":{\"x\":768.40625,\"y\":161,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"3\",\"position\":\"right\",\"x\":280.62505405820804,\"y\":223.9999774773671,\"width\":18,\"height\":18}],\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"3\",\"position\":\"left\",\"x\":-8.999978635988777,\"y\":223.9999774773671,\"width\":18,\"height\":18}]},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":768.40625,\"y\":161},\"data\":{\"uuid\":\"a87e9de7-2996-4c34-8bd0-686d9ffead23\",\"title\":\"contact\",\"metadata\":{\"fields\":[],\"customer\":{\"service_id\":2,\"collect_name\":true,\"collect_email\":true,\"collect_phone\":true,\"require_payment\":false,\"confirmation_message\":\"sdvdscvsd\"}}},\"events\":{},\"label\":\"contact node\"}],\"edges\":[{\"id\":\"vueflow__edge-1-2\",\"type\":\"default\",\"source\":\"1\",\"target\":\"2\",\"sourceHandle\":null,\"targetHandle\":null,\"data\":{},\"events\":{},\"label\":\"\",\"sourceNode\":{\"id\":\"1\",\"type\":\"start\",\"dimensions\":{\"width\":459,\"height\":194},\"computedPosition\":{\"x\":48,\"y\":23,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"1\",\"position\":\"right\",\"x\":450.3905742799187,\"y\":87.99999929024295,\"width\":18,\"height\":18}],\"target\":null},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":48,\"y\":23},\"data\":{\"uuid\":\"a87e9de7-2996-4c34-8bd0-686d9ffead23\",\"title\":\"start\",\"metadata\":{\"fields\":{\"type\":\"new_contact\",\"keywords\":null}}},\"events\":{},\"label\":\"start\"},\"targetNode\":{\"id\":\"2\",\"type\":\"delay\",\"dimensions\":{\"width\":150,\"height\":40},\"computedPosition\":{\"x\":619.40625,\"y\":44,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"2\",\"position\":\"bottom\",\"x\":66.00011340556443,\"y\":30.000008965138964,\"width\":18,\"height\":18}],\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"2\",\"position\":\"top\",\"x\":66.00011340556443,\"y\":-7.999996482813534,\"width\":18,\"height\":18}]},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":619.40625,\"y\":44},\"data\":{\"uuid\":\"a87e9de7-2996-4c34-8bd0-686d9ffead23\",\"title\":\"delay\",\"metadata\":{\"fields\":{\"type\":\"delay\",\"value\":44,\"unit\":\"seconds\"}}},\"events\":{},\"label\":\"delay node\"},\"sourceX\":516.3905742799187,\"sourceY\":119.99999929024295,\"targetX\":694.4063634055644,\"targetY\":36.000003517186464,\"selected\":true},{\"id\":\"vueflow__edge-2-2\",\"type\":\"default\",\"source\":\"2\",\"target\":\"2\",\"sourceHandle\":null,\"targetHandle\":null,\"data\":{},\"events\":{},\"label\":\"\",\"sourceNode\":{\"id\":\"2\",\"type\":\"delay\",\"dimensions\":{\"width\":150,\"height\":40},\"computedPosition\":{\"x\":619.40625,\"y\":44,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"2\",\"position\":\"bottom\",\"x\":66.00011340556443,\"y\":30.000008965138964,\"width\":18,\"height\":18}],\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"2\",\"position\":\"top\",\"x\":66.00011340556443,\"y\":-7.999996482813534,\"width\":18,\"height\":18}]},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":619.40625,\"y\":44},\"data\":{\"uuid\":\"a87e9de7-2996-4c34-8bd0-686d9ffead23\",\"title\":\"delay\",\"metadata\":{\"fields\":{\"type\":\"delay\",\"value\":44,\"unit\":\"seconds\"}}},\"events\":{},\"label\":\"delay node\"},\"targetNode\":{\"id\":\"2\",\"type\":\"delay\",\"dimensions\":{\"width\":150,\"height\":40},\"computedPosition\":{\"x\":619.40625,\"y\":44,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"2\",\"position\":\"bottom\",\"x\":66.00011340556443,\"y\":30.000008965138964,\"width\":18,\"height\":18}],\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"2\",\"position\":\"top\",\"x\":66.00011340556443,\"y\":-7.999996482813534,\"width\":18,\"height\":18}]},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":619.40625,\"y\":44},\"data\":{\"uuid\":\"a87e9de7-2996-4c34-8bd0-686d9ffead23\",\"title\":\"delay\",\"metadata\":{\"fields\":{\"type\":\"delay\",\"value\":44,\"unit\":\"seconds\"}}},\"events\":{},\"label\":\"delay node\"},\"sourceX\":694.4063634055644,\"sourceY\":92.00000896513896,\"targetX\":694.4063634055644,\"targetY\":36.000003517186464},{\"id\":\"vueflow__edge-2-3\",\"type\":\"default\",\"source\":\"2\",\"target\":\"3\",\"sourceHandle\":null,\"targetHandle\":null,\"data\":{},\"events\":{},\"label\":\"\",\"sourceNode\":{\"id\":\"2\",\"type\":\"delay\",\"dimensions\":{\"width\":150,\"height\":40},\"computedPosition\":{\"x\":619.40625,\"y\":44,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"2\",\"position\":\"bottom\",\"x\":66.00011340556443,\"y\":30.000008965138964,\"width\":18,\"height\":18}],\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"2\",\"position\":\"top\",\"x\":66.00011340556443,\"y\":-7.999996482813534,\"width\":18,\"height\":18}]},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":619.40625,\"y\":44},\"data\":{\"uuid\":\"a87e9de7-2996-4c34-8bd0-686d9ffead23\",\"title\":\"delay\",\"metadata\":{\"fields\":{\"type\":\"delay\",\"value\":44,\"unit\":\"seconds\"}}},\"events\":{},\"label\":\"delay node\"},\"targetNode\":{\"id\":\"3\",\"type\":\"contact\",\"dimensions\":{\"width\":290,\"height\":466},\"computedPosition\":{\"x\":768.40625,\"y\":161,\"z\":0},\"handleBounds\":{\"source\":[{\"id\":null,\"type\":\"source\",\"nodeId\":\"3\",\"position\":\"right\",\"x\":280.62505405820804,\"y\":223.9999774773671,\"width\":18,\"height\":18}],\"target\":[{\"id\":null,\"type\":\"target\",\"nodeId\":\"3\",\"position\":\"left\",\"x\":-8.999978635988777,\"y\":223.9999774773671,\"width\":18,\"height\":18}]},\"selected\":false,\"dragging\":false,\"resizing\":false,\"initialized\":false,\"isParent\":false,\"position\":{\"x\":768.40625,\"y\":161},\"data\":{\"uuid\":\"a87e9de7-2996-4c34-8bd0-686d9ffead23\",\"title\":\"contact\",\"metadata\":{\"fields\":[],\"customer\":{\"service_id\":2,\"collect_name\":true,\"collect_email\":true,\"collect_phone\":true,\"require_payment\":false,\"confirmation_message\":\"sdvdscvsd\"}}},\"events\":{},\"label\":\"contact node\"},\"sourceX\":694.4063634055644,\"sourceY\":92.00000896513896,\"targetX\":759.4062713640112,\"targetY\":393.9999774773671}],\"viewport\":{\"x\":45.14044538132333,\"y\":111.32356406549798,\"zoom\":0.8405408850191183}}', 'inactive', '2026-02-05 23:11:03', '2026-02-13 01:51:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flows_old`
--

CREATE TABLE `flows_old` (
  `id` bigint NOT NULL,
  `organization_id` bigint UNSIGNED NOT NULL,
  `name` varchar(192) NOT NULL,
  `contact_list_id` json DEFAULT NULL,
  `segment_id` json DEFAULT NULL,
  `flow_for` enum('whatsapp') NOT NULL DEFAULT 'whatsapp',
  `flow_type` enum('generic','campaign') NOT NULL DEFAULT 'generic',
  `data` text NOT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `matching_type` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `flows_old`
--

INSERT INTO `flows_old` (`id`, `organization_id`, `name`, `contact_list_id`, `segment_id`, `flow_for`, `flow_type`, `data`, `keywords`, `matching_type`, `status`, `created_at`, `updated_at`) VALUES
(3, 2, 'dxdddd', NULL, NULL, 'whatsapp', 'generic', '{\"messageToEdit\":null,\"elements\":{\"nodes\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"initialized\":false,\"position\":{\"x\":135,\"y\":45},\"data\":[],\"matching_types\":\"exacts\",\"keyword\":null,\"label\":\"starter-box node\"}],\"edges\":[],\"position\":[0,1],\"zoom\":1,\"viewport\":{\"x\":0,\"y\":1,\"zoom\":1}},\"messages\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"label\":\"Label\",\"title\":\"Start Bot flow\",\"text\":\"Text\",\"subtitle\":\"Subtitle\",\"color\":\"#000000\"}]}', 'Hello', 'exacts', 1, '2026-01-13 11:29:13', '2026-01-13 11:29:13'),
(4, 2, 'dddd', NULL, NULL, 'whatsapp', 'generic', '{\"messageToEdit\":null,\"elements\":{\"nodes\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"initialized\":false,\"position\":{\"x\":135,\"y\":45},\"data\":[],\"matching_types\":\"exacts\",\"keyword\":null,\"label\":\"starter-box node\"}],\"edges\":[],\"position\":[0,1],\"zoom\":1,\"viewport\":{\"x\":0,\"y\":1,\"zoom\":1}},\"messages\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"label\":\"Label\",\"title\":\"Start Bot flow\",\"text\":\"Text\",\"subtitle\":\"Subtitle\",\"color\":\"#000000\"}]}', 'Hello', 'exacts', 1, '2026-01-13 11:34:31', '2026-01-13 11:34:31'),
(5, 2, 'dddd', NULL, NULL, 'whatsapp', 'generic', '{\"messageToEdit\":null,\"elements\":{\"nodes\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"initialized\":false,\"position\":{\"x\":135,\"y\":45},\"data\":[],\"matching_types\":\"exacts\",\"keyword\":null,\"label\":\"starter-box node\"}],\"edges\":[],\"position\":[0,1],\"zoom\":1,\"viewport\":{\"x\":0,\"y\":1,\"zoom\":1}},\"messages\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"label\":\"Label\",\"title\":\"Start Bot flow\",\"text\":\"Text\",\"subtitle\":\"Subtitle\",\"color\":\"#000000\"}]}', 'Hello', 'exacts', 1, '2026-01-13 11:36:15', '2026-01-13 11:36:15'),
(7, 2, 'test', NULL, NULL, 'whatsapp', 'generic', '{\"messageToEdit\":null,\"elements\":{\"nodes\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"initialized\":false,\"position\":{\"x\":135,\"y\":45},\"data\":[],\"matching_types\":\"exacts\",\"keyword\":null,\"label\":\"starter-box node\"},{\"id\":\"box-with-buttong0czgq0b76qzi6bn9e5gq8\",\"type\":\"box-with-button\",\"initialized\":false,\"position\":{\"x\":585,\"y\":180},\"data\":[],\"label\":\"box-with-button node\"}],\"edges\":[{\"id\":\"vueflow__edge-starter-boxxn3tn0ycqxdp7izcap2qdjright-box-with-buttong0czgq0b76qzi6bn9e5gq8left\",\"type\":\"custom\",\"source\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"target\":\"box-with-buttong0czgq0b76qzi6bn9e5gq8\",\"sourceHandle\":\"right\",\"targetHandle\":\"left\",\"data\":[],\"label\":null,\"animated\":false,\"sourceX\":432.5999755859375,\"sourceY\":105.83438110351562,\"targetX\":577.4000244140625,\"targetY\":390.1343688964844}],\"position\":[0,1],\"zoom\":1,\"viewport\":{\"x\":0,\"y\":1,\"zoom\":1}},\"messages\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"label\":\"Label\",\"title\":\"Start Bot flow\",\"text\":\"Text\",\"subtitle\":\"Subtitle\",\"color\":\"#000000\"},{\"id\":\"box-with-buttong0czgq0b76qzi6bn9e5gq8\",\"title\":\"Button Message\",\"type\":\"box-with-button\",\"header_media_type\":null,\"header_text\":\"test\",\"header_media\":null,\"footer_text\":\"test\",\"button_message\":\"test\",\"button_duration\":3,\"items\":[{\"id\":\"5cu4eq5xe2l7r6jo8qlf2a\",\"type\":\"button\",\"text\":\"test\"},{\"id\":\"w2kz2sps0kht8uglihlzpg\",\"type\":\"button\",\"text\":\"test\"},{\"id\":\"0rritjgt8h4hsjf3t45fmsa\",\"type\":\"button\",\"text\":\"test\"}],\"color\":\"#000000\",\"position\":1}]}', 'Hello', 'exacts', 1, '2026-01-13 11:50:45', '2026-01-13 11:50:45'),
(8, 2, 'ssss', NULL, NULL, 'whatsapp', 'generic', '{\"messageToEdit\":null,\"elements\":{\"nodes\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"initialized\":false,\"position\":{\"x\":135,\"y\":45},\"data\":[],\"matching_types\":\"exacts\",\"keyword\":null,\"label\":\"starter-box node\"},{\"id\":\"box-with-buttond80ev5rjubcm5o7ksrdvok\",\"type\":\"box-with-button\",\"initialized\":false,\"position\":{\"x\":555,\"y\":180},\"data\":[],\"label\":\"box-with-button node\"}],\"edges\":[{\"id\":\"vueflow__edge-starter-boxxn3tn0ycqxdp7izcap2qdjright-box-with-buttond80ev5rjubcm5o7ksrdvokleft\",\"type\":\"custom\",\"source\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"target\":\"box-with-buttond80ev5rjubcm5o7ksrdvok\",\"sourceHandle\":\"right\",\"targetHandle\":\"left\",\"data\":[],\"label\":null,\"animated\":false,\"sourceX\":432.5999755859375,\"sourceY\":105.83438110351562,\"targetX\":547.4000244140625,\"targetY\":361.6187438964844}],\"position\":[0,1],\"zoom\":1,\"viewport\":{\"x\":0,\"y\":1,\"zoom\":1}},\"messages\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"label\":\"Label\",\"title\":\"Start Bot flow\",\"text\":\"Text\",\"subtitle\":\"Subtitle\",\"color\":\"#000000\"},{\"id\":\"box-with-buttond80ev5rjubcm5o7ksrdvok\",\"title\":\"Button Message\",\"type\":\"box-with-button\",\"header_media_type\":null,\"header_text\":null,\"header_media\":null,\"footer_text\":null,\"button_message\":null,\"button_duration\":0,\"items\":[{\"id\":\"bkdxrbbhh9ksf4gj2wdn\",\"type\":\"button\",\"text\":null},{\"id\":\"i90zn91ao0fbuy2xntgxqc\",\"type\":\"button\",\"text\":null},{\"id\":\"pfahl024l30edzeps5t56\",\"type\":\"button\",\"text\":null}],\"color\":\"#000000\",\"position\":1}]}', 'Hello', 'exacts', 1, '2026-01-13 11:54:26', '2026-01-13 11:54:26'),
(9, 2, 'erterterte', NULL, NULL, 'whatsapp', 'generic', '{\"messageToEdit\":null,\"elements\":{\"nodes\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"initialized\":false,\"position\":{\"x\":135,\"y\":45},\"data\":[],\"matching_types\":\"exacts\",\"keyword\":null,\"label\":\"starter-box node\"},{\"id\":\"box-with-buttonyny3ddidyujocv1wav5lyl\",\"type\":\"box-with-button\",\"initialized\":false,\"position\":{\"x\":780,\"y\":0},\"data\":[],\"label\":\"box-with-button node\"}],\"edges\":[{\"id\":\"vueflow__edge-starter-boxxn3tn0ycqxdp7izcap2qdjright-box-with-buttonyny3ddidyujocv1wav5lylleft\",\"type\":\"custom\",\"source\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"target\":\"box-with-buttonyny3ddidyujocv1wav5lyl\",\"sourceHandle\":\"right\",\"targetHandle\":\"left\",\"data\":[],\"label\":null,\"animated\":false,\"sourceX\":432.5999755859375,\"sourceY\":105.83438110351562,\"targetX\":772.4000244140625,\"targetY\":181.61874389648438}],\"position\":[0,1],\"zoom\":1,\"viewport\":{\"x\":0,\"y\":1,\"zoom\":1}},\"messages\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"label\":\"Label\",\"title\":\"Start Bot flow\",\"text\":\"Text\",\"subtitle\":\"Subtitle\",\"color\":\"#000000\"},{\"id\":\"box-with-buttonyny3ddidyujocv1wav5lyl\",\"title\":\"Button Message\",\"type\":\"box-with-button\",\"header_media_type\":null,\"header_text\":null,\"header_media\":null,\"footer_text\":null,\"button_message\":null,\"button_duration\":0,\"items\":[{\"id\":\"z8unyyqe1ebbeezi7vnudt\",\"type\":\"button\",\"text\":null},{\"id\":\"eh9fi4we3x0g2kj73wxxdc\",\"type\":\"button\",\"text\":null},{\"id\":\"ffrcz5ku9xkvnhb2432sk\",\"type\":\"button\",\"text\":null}],\"color\":\"#000000\",\"position\":1}]}', 'Hello', 'exacts', 1, '2026-01-13 11:55:14', '2026-01-13 11:55:14'),
(10, 2, 'w-full mt-2', NULL, NULL, 'whatsapp', 'generic', '{\"messageToEdit\":null,\"elements\":{\"nodes\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"initialized\":false,\"position\":{\"x\":135,\"y\":45},\"data\":[],\"matching_types\":\"exacts\",\"keyword\":null,\"label\":\"starter-box node\"},{\"id\":\"box-with-buttons1po1r189b9113xbttjg86\",\"type\":\"box-with-button\",\"initialized\":false,\"position\":{\"x\":975,\"y\":105},\"data\":[],\"label\":\"box-with-button node\"}],\"edges\":[{\"id\":\"vueflow__edge-starter-boxxn3tn0ycqxdp7izcap2qdjright-box-with-buttons1po1r189b9113xbttjg86left\",\"type\":\"custom\",\"source\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"target\":\"box-with-buttons1po1r189b9113xbttjg86\",\"sourceHandle\":\"right\",\"targetHandle\":\"left\",\"data\":[],\"label\":null,\"animated\":false,\"sourceX\":431.3997976413241,\"sourceY\":104.63433963318741,\"targetX\":967.400081160963,\"targetY\":315.13426586299977}],\"position\":[170.67245722953805,167.84986405583277],\"zoom\":0.6070974421975232,\"viewport\":{\"x\":170.67245722953805,\"y\":167.84986405583277,\"zoom\":0.6070974421975232}},\"messages\":[{\"id\":\"starter-boxxn3tn0ycqxdp7izcap2qdj\",\"type\":\"starter-box\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"label\":\"Label\",\"title\":\"Start Bot flow\",\"text\":\"Text\",\"subtitle\":\"Subtitle\",\"color\":\"#000000\"},{\"id\":\"box-with-buttons1po1r189b9113xbttjg86\",\"title\":\"Button Message\",\"type\":\"box-with-button\",\"header_media_type\":null,\"header_text\":\"w-full mt-2\",\"header_media\":null,\"footer_text\":\"w-full mt-2\",\"button_message\":\"w-full mt-2\",\"button_duration\":3,\"items\":[{\"id\":\"glxo5t5texofrz612aoor\",\"type\":\"button\",\"text\":\"w-full mt-2\"},{\"id\":\"hbzwfu6vxwqya6rsz0i2\",\"type\":\"button\",\"text\":\"w-full mt-2\"},{\"id\":\"cf00bcn9my7gw7iczcgcrf\",\"type\":\"button\",\"text\":\"w-full mt-2\"}],\"color\":\"#000000\",\"position\":2}]}', 'Hello', 'exacts', 1, '2026-01-13 12:02:04', '2026-01-13 12:02:04');

-- --------------------------------------------------------

--
-- Table structure for table `flows_old_2`
--

CREATE TABLE `flows_old_2` (
  `id` bigint NOT NULL,
  `uuid` char(50) NOT NULL,
  `organization_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `metadata` json NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `flows_old_2`
--

INSERT INTO `flows_old_2` (`id`, `uuid`, `organization_id`, `name`, `metadata`, `status`, `created_at`, `updated_at`) VALUES
(1, 'f5c09300-284b-49f0-956d-899c65c41331', 2, 'test', '\"[]\"', 1, '2026-01-15 07:17:51', '2026-01-15 07:17:51'),
(2, '6184f779-86b0-4862-b13a-7029cee3de6f', 2, 'testing', '\"[]\"', 1, '2026-01-15 07:18:50', '2026-01-15 07:18:50'),
(3, 'b111223a-21aa-4f4a-80bb-e3e5bd58af60', 2, 'test', '\"[]\"', 1, '2026-01-15 07:19:22', '2026-01-15 07:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `flow_edges_old`
--

CREATE TABLE `flow_edges_old` (
  `id` bigint NOT NULL,
  `flow_id` bigint UNSIGNED NOT NULL,
  `edge_id` varchar(192) NOT NULL,
  `source` text NOT NULL,
  `target` text NOT NULL,
  `sourceHandle` text NOT NULL,
  `data` text NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `flow_edges_old`
--

INSERT INTO `flow_edges_old` (`id`, `flow_id`, `edge_id`, `source`, `target`, `sourceHandle`, `data`, `updated_at`, `created_at`) VALUES
(1, 7, 'vueflow__edge-starter-boxxn3tn0ycqxdp7izcap2qdjright-box-with-buttong0czgq0b76qzi6bn9e5gq8left', 'starter-boxxn3tn0ycqxdp7izcap2qdj', 'box-with-buttong0czgq0b76qzi6bn9e5gq8', 'right', '[]', '2026-01-13 11:50:45', '2026-01-13 11:50:45'),
(2, 8, 'vueflow__edge-starter-boxxn3tn0ycqxdp7izcap2qdjright-box-with-buttond80ev5rjubcm5o7ksrdvokleft', 'starter-boxxn3tn0ycqxdp7izcap2qdj', 'box-with-buttond80ev5rjubcm5o7ksrdvok', 'right', '[]', '2026-01-13 11:54:26', '2026-01-13 11:54:26'),
(3, 9, 'vueflow__edge-starter-boxxn3tn0ycqxdp7izcap2qdjright-box-with-buttonyny3ddidyujocv1wav5lylleft', 'starter-boxxn3tn0ycqxdp7izcap2qdj', 'box-with-buttonyny3ddidyujocv1wav5lyl', 'right', '[]', '2026-01-13 11:55:14', '2026-01-13 11:55:14'),
(4, 10, 'vueflow__edge-starter-boxxn3tn0ycqxdp7izcap2qdjright-box-with-buttons1po1r189b9113xbttjg86left', 'starter-boxxn3tn0ycqxdp7izcap2qdj', 'box-with-buttons1po1r189b9113xbttjg86', 'right', '[]', '2026-01-13 12:02:04', '2026-01-13 12:02:04');

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

--
-- Dumping data for table `flow_media`
--

INSERT INTO `flow_media` (`id`, `uuid`, `flow_id`, `step_id`, `path`, `location`, `metadata`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'd5739361-83d4-4008-a1d7-d4b1e63e25fe', 1, 2, 'https://waapi.dqotdemo.in/media/public/xIazSElSbPRBnB5iIrb9FTGJ4zvKPewcye0e1P4y.png', 'local', '{\"name\":\"image__1_-removebg-preview.png\",\"extension\":\"image\\/png\",\"size\":59612}', '2026-01-19 23:59:16', '2026-01-19 23:59:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flow_nodes_old`
--

CREATE TABLE `flow_nodes_old` (
  `id` bigint UNSIGNED NOT NULL,
  `flow_id` bigint UNSIGNED NOT NULL,
  `node_id` varchar(192) NOT NULL,
  `type` varchar(100) NOT NULL,
  `position` text NOT NULL,
  `data` text NOT NULL,
  `connections` json DEFAULT NULL,
  `organization_id` bigint UNSIGNED DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `flow_nodes_old`
--

INSERT INTO `flow_nodes_old` (`id`, `flow_id`, `node_id`, `type`, `position`, `data`, `connections`, `organization_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 3, 'starter-boxxn3tn0ycqxdp7izcap2qdj', 'starter-box', '{\"x\":135,\"y\":45}', '{\"type\":\"text\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"duration\":0}', '{\"inputs\": [], \"outputs\": [{\"type\": \"text\"}]}', 2, 4, NULL, '2026-01-13 11:29:13', '2026-01-13 11:29:13'),
(2, 4, 'starter-boxxn3tn0ycqxdp7izcap2qdj', 'starter-box', '{\"x\":135,\"y\":45}', '{\"type\":\"text\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"duration\":0}', '{\"inputs\": [], \"outputs\": [{\"type\": \"text\"}]}', 2, 4, NULL, '2026-01-13 11:34:31', '2026-01-13 11:34:31'),
(3, 5, 'starter-boxxn3tn0ycqxdp7izcap2qdj', 'starter-box', '{\"x\":135,\"y\":45}', '{\"type\":\"text\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"duration\":0}', '{\"inputs\": [], \"outputs\": [{\"type\": \"text\"}]}', 2, 4, NULL, '2026-01-13 11:36:15', '2026-01-13 11:36:15'),
(6, 7, 'starter-boxxn3tn0ycqxdp7izcap2qdj', 'starter-box', '{\"x\":135,\"y\":45}', '{\"type\":\"text\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"duration\":0}', '{\"inputs\": [], \"outputs\": [{\"data\": [], \"type\": \"text\", \"node_id\": \"box-with-buttong0czgq0b76qzi6bn9e5gq8\"}]}', 2, 4, NULL, '2026-01-13 11:50:45', '2026-01-13 11:50:45'),
(7, 7, 'box-with-buttong0czgq0b76qzi6bn9e5gq8', 'box-with-button', '{\"x\":585,\"y\":180}', '{\"duration\":3,\"type\":\"button\",\"body\":{\"text\":\"test\"},\"action\":{\"buttons\":[{\"type\":\"reply\",\"reply\":{\"id\":\"5cu4eq5xe2l7r6jo8qlf2a\",\"title\":\"test\"}},{\"type\":\"reply\",\"reply\":{\"id\":\"w2kz2sps0kht8uglihlzpg\",\"title\":\"test\"}},{\"type\":\"reply\",\"reply\":{\"id\":\"0rritjgt8h4hsjf3t45fmsa\",\"title\":\"test\"}}]},\"header_text\":\"test\",\"header_type\":\"text\",\"footer_text\":\"test\"}', '{\"inputs\": {\"data\": [], \"type\": \"left\", \"node_id\": \"starter-boxxn3tn0ycqxdp7izcap2qdj\"}, \"outputs\": [{\"type\": \"button\"}]}', 2, 4, NULL, '2026-01-13 11:50:45', '2026-01-13 11:50:45'),
(8, 8, 'starter-boxxn3tn0ycqxdp7izcap2qdj', 'starter-box', '{\"x\":135,\"y\":45}', '{\"type\":\"text\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"duration\":0}', '{\"inputs\": [], \"outputs\": [{\"data\": [], \"type\": \"text\", \"node_id\": \"box-with-buttond80ev5rjubcm5o7ksrdvok\"}]}', 2, 4, NULL, '2026-01-13 11:54:26', '2026-01-13 11:54:26'),
(9, 8, 'box-with-buttond80ev5rjubcm5o7ksrdvok', 'box-with-button', '{\"x\":555,\"y\":180}', '{\"duration\":0,\"type\":\"button\",\"body\":{\"text\":\"\"},\"action\":{\"buttons\":[{\"type\":\"reply\",\"reply\":{\"id\":\"bkdxrbbhh9ksf4gj2wdn\",\"title\":null}},{\"type\":\"reply\",\"reply\":{\"id\":\"i90zn91ao0fbuy2xntgxqc\",\"title\":null}},{\"type\":\"reply\",\"reply\":{\"id\":\"pfahl024l30edzeps5t56\",\"title\":null}}]}}', '{\"inputs\": {\"data\": [], \"type\": \"left\", \"node_id\": \"starter-boxxn3tn0ycqxdp7izcap2qdj\"}, \"outputs\": [{\"type\": \"button\"}]}', 2, 4, NULL, '2026-01-13 11:54:26', '2026-01-13 11:54:26'),
(10, 9, 'starter-boxxn3tn0ycqxdp7izcap2qdj', 'starter-box', '{\"x\":135,\"y\":45}', '{\"type\":\"text\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"duration\":0}', '{\"inputs\": [], \"outputs\": [{\"data\": [], \"type\": \"text\", \"node_id\": \"box-with-buttonyny3ddidyujocv1wav5lyl\"}]}', 2, 4, NULL, '2026-01-13 11:55:14', '2026-01-13 11:55:14'),
(11, 9, 'box-with-buttonyny3ddidyujocv1wav5lyl', 'box-with-button', '{\"x\":780,\"y\":0}', '{\"duration\":0,\"type\":\"button\",\"body\":{\"text\":\"\"},\"action\":{\"buttons\":[{\"type\":\"reply\",\"reply\":{\"id\":\"z8unyyqe1ebbeezi7vnudt\",\"title\":null}},{\"type\":\"reply\",\"reply\":{\"id\":\"eh9fi4we3x0g2kj73wxxdc\",\"title\":null}},{\"type\":\"reply\",\"reply\":{\"id\":\"ffrcz5ku9xkvnhb2432sk\",\"title\":null}}]}}', '{\"inputs\": {\"data\": [], \"type\": \"left\", \"node_id\": \"starter-boxxn3tn0ycqxdp7izcap2qdj\"}, \"outputs\": [{\"type\": \"button\"}]}', 2, 4, NULL, '2026-01-13 11:55:14', '2026-01-13 11:55:14'),
(12, 10, 'starter-boxxn3tn0ycqxdp7izcap2qdj', 'starter-box', '{\"x\":135,\"y\":45}', '{\"type\":\"text\",\"keyword\":\"Hello\",\"matching_types\":\"exacts\",\"duration\":0}', '{\"inputs\": [], \"outputs\": [{\"data\": [], \"type\": \"text\", \"node_id\": \"box-with-buttons1po1r189b9113xbttjg86\"}]}', 2, 4, NULL, '2026-01-13 12:02:04', '2026-01-13 12:02:04'),
(13, 10, 'box-with-buttons1po1r189b9113xbttjg86', 'box-with-button', '{\"x\":975,\"y\":105}', '{\"duration\":3,\"type\":\"button\",\"body\":{\"text\":\"w-full mt-2\"},\"action\":{\"buttons\":[{\"type\":\"reply\",\"reply\":{\"id\":\"glxo5t5texofrz612aoor\",\"title\":\"w-full mt-2\"}},{\"type\":\"reply\",\"reply\":{\"id\":\"hbzwfu6vxwqya6rsz0i2\",\"title\":\"w-full mt-2\"}},{\"type\":\"reply\",\"reply\":{\"id\":\"cf00bcn9my7gw7iczcgcrf\",\"title\":\"w-full mt-2\"}}]},\"header_text\":\"w-full mt-2\",\"header_type\":\"text\",\"footer_text\":\"w-full mt-2\"}', '{\"inputs\": {\"data\": [], \"type\": \"left\", \"node_id\": \"starter-boxxn3tn0ycqxdp7izcap2qdj\"}, \"outputs\": [{\"type\": \"button\"}]}', 2, 4, NULL, '2026-01-13 12:02:04', '2026-01-13 12:02:04');

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
(3, 'Spanish', 'es', 'active', 0, NULL, NULL, '2025-11-25 08:04:05', '2025-11-25 08:04:05'),
(4, 'Hindi', 'hi', 'active', 0, NULL, NULL, '2025-12-04 01:29:06', '2025-12-04 01:35:37');

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
(1, '5cdbc424-c12b-4b95-88f2-89d344fb3447', '2025112606143113k80', 'Admin', NULL, '{\"tickets\": {\"active\": false, \"auto_assignment\": false, \"reassign_reopened_chats\": false, \"allow_agents_to_view_all_chats\": false}, \"whatsapp\": {\"app_id\": \"1425813585771610\", \"waba_id\": \"1413791536770774\", \"name_status\": \"AVAILABLE_WITHOUT_REVIEW\", \"access_token\": \"EAAL6XhbxAgEBQDrezNOVE3rjozTZA0hZBXIHf9yE7gIPGFZCdnSOlonNSt5ZBZCAjUhueG9txJNU4zqc7WKK6TNAGdzFMenH0sSy8LCftOtoRrGcoKgPgZADKZCSrP7vAYIa7AOp7fNhZCHyljZBK03yLsRZBWMh19ljIMjNZA3nTvoXC6AEBnVTbb7BCzsaDZC36u9BOsCqJOzi9VdlDP7vkZAEVjoZCoknZAziShyTAWZB\", \"number_status\": \"CONNECTED\", \"verified_name\": \"Test Number\", \"quality_rating\": \"GREEN\", \"phone_number_id\": \"881372528393145\", \"business_profile\": {\"about\": null, \"email\": \"wabizboost@gmail.com\", \"address\": \"Jaipur\", \"industry\": \"PROF_SERVICES\", \"description\": null, \"profile_picture_url\": \"https://waapi.dqotdemo.in/media/public/XiZeMQru7uCcmIlBwTbtlRFETSxfeImdNyDh7WFp.jpg\"}, \"is_embedded_signup\": 0, \"display_phone_number\": \"15551948235\", \"messaging_limit_tier\": \"TIER_250\", \"account_review_status\": \"APPROVED\", \"business_verification\": \"\", \"max_phone_numbers_per_business\": null, \"max_daily_conversation_per_phone\": null}}', NULL, 1, NULL, NULL, '2025-11-26 00:44:31', '2026-02-14 05:30:32'),
(2, '605a7595-f524-45b4-b096-2f442cd5690b', '202512120543054MIWR', 'Hemant', NULL, '{\"QrCode\": {\"code\": \"RDHLH7I3DNH5D1\", \"qr_image_url\": \"https://scontent.fjai10-1.fna.fbcdn.net/m1/v/t6/An9tnDJ1EhWnr9yMr1dM-IdGKX7DWcREWpnNW_2yRHGY6SdnVTOWYASJK_QX5mipSZ7wsN3rzu25GNSNfDxI2texFR19OEWIJo8hWrPXdebvV7nYmYUTanN5ZV6qZizhfpJrh1jM7CzS?edm=ADZZtP0EAAAA&_nc_gid=YTobleY2mAxhoPehiDjqBw&_nc_oc=Adk2ChoWPBkazdFZ3EOPnB7ShKlCSnfOdnI63Gpnzy3x1Y0IgeUaDMPO5i8BfSoWw78&ccb=10-5&oh=00_AfpVK5oQpfTpzJHzxDpb5DVX3xRQDUoFkO0G9Su2tFySqQ&oe=699FBF26&_nc_sid=5a413f\", \"deep_link_url\": \"https://wa.me/message/RDHLH7I3DNH5D1\", \"prefilled_message\": \"whatsapp\"}, \"whatsapp\": {\"app_id\": \"1425813585771610\", \"waba_id\": \"1584726769620648\", \"name_status\": \"AVAILABLE_WITHOUT_REVIEW\", \"access_token\": \"EAAUQxRhLvFoBQemUvdqJeCqMa8uGoCA1JpLz6vlvrT6WLh6eV7i5hakGOsZAKYJZBVtJQj7kSvb6Y1IXiL25ZBvbQHO4vVZCpPFpAu0ukeC1W7FLhBBKs4ee2vYqUAkOsVsSKW074v9BhocYegvLXw9EmBpSUGpmMdra24o1tef8yIZBZCdjYP94hQLcZCNUQZDZD\", \"number_status\": \"CONNECTED\", \"verified_name\": \"Wabizboost\", \"quality_rating\": \"GREEN\", \"phone_number_id\": \"964491340074649\", \"business_profile\": {\"about\": null, \"email\": \"sales@dqotsolutions.com\", \"address\": \"2nd Floor, NK TOWER, Bal Vihar, Jhotwara, Jaipur, Rajasthan 302012\", \"industry\": \"PROF_SERVICES\", \"description\": \"Deliver Quality on Time : Web Development Agency | App Development | Digital Marketing Service | Software Development\"}, \"is_embedded_signup\": 0, \"display_phone_number\": \"+91 92570 86308\", \"messaging_limit_tier\": \"TIER_250\", \"account_review_status\": \"APPROVED\", \"business_verification\": \"\", \"max_phone_numbers_per_business\": null, \"max_daily_conversation_per_phone\": null}, \"automation\": {\"response_sequence\": [\"Automated Flows\", \"Basic Replies\"]}}', NULL, 4, NULL, NULL, '2025-12-12 00:13:05', '2026-01-27 01:59:43'),
(3, 'eded3ab4-cee8-4133-87df-afa40d86d26b', '202601080733445VNFZ', 'MyTodayHoroscope', NULL, NULL, NULL, 5, NULL, NULL, '2026-01-08 02:03:44', '2026-01-08 02:03:44');

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
(1, 'Privacy Policy', 'Introduction<p>Thanks for using our products and services (\"Services\"). The Services are provided by &lt;Your Business Name&gt;.</p><p>By using our Services, you are agreeing to these terms. Please read them carefully.</p><p>Our Services are very diverse, so sometimes additional terms or product requirements (including age requirements) may apply. Additional terms will be available with the relevant Services, and those additional terms become part of your agreement with us if you use those Services.</p>Using our services<p>You must follow any policies made available to you within the Services.</p><p>Don\'t misuse our Services. For example, don\'t interfere with our Services or try to access them using a method other than the interface and the instructions that we provide. You may use our Services only as permitted by law, including applicable export and re-export control laws and regulations. We may suspend or stop providing our Services to you if you do not comply with our terms or policies or if we are investigating suspected misconduct.</p><p>Using our Services does not give you ownership of any intellectual property rights in our Services or the content you access. You may not use content from our Services unless you obtain permission from its owner or are otherwise permitted by law. These terms do not grant you the right to use any branding or logos used in our Services. Don\'t remove, obscure, or alter any legal notices displayed in or along with our Services.</p>Privacy and copyright protection<p>&lt;Your Business Name&gt;\'s privacy policies explain how we treat your personal data and protect your privacy when you use our Services. By using our Services, you agree that &lt;Your Business Name&gt; can use such data in accordance with our privacy policies.</p><p>We respond to notices of alleged copyright infringement and terminate accounts of repeat infringers according to the process set out in the U.S. Digital Millennium Copyright Act.</p><p>We provide information to help copyright holders manage their intellectual property online. If you think somebody is violating your copyrights and want to notify us, you can find information about submitting notices and &lt;Your Business Name&gt;\'s policy about responding to notices in our Help Center.</p>Your content in our services<p>Some of our Services allow you to upload, submit, store, send or receive content. You retain ownership of any intellectual property rights that you hold in that content. In short, what belongs to you stays yours.</p><p>When you upload, submit, store, send or receive content to or through our Services, you give &lt;Your Business Name&gt; (and those we work with) a worldwide license to use, host, store, reproduce, modify, create derivative works (such as those resulting from translations, adaptations or other changes we make so that your content works better with our Services), communicate, publish, publicly perform, publicly display and distribute such content. The rights you grant in this license are for the limited purpose of operating, promoting, and improving our Services, and to develop new ones. This license continues even if you stop using our Services (for example, for a business listing you have added to &lt;Your Business Name&gt; Maps). Some Services may offer you ways to access and remove content that has been provided to that Service. Also, in some of our Services, there are terms or settings that narrow the scope of our use of the content submitted in those Services. Make sure you have the necessary rights to grant us this license for any content that you submit to our Services.</p>', '2025-11-25 08:04:05', '2025-11-25 08:04:05'),
(2, 'Terms of Service', '<p>1. Agreement to Terms\n\nThese Terms and Conditions constitute a legally binding agreement made between you, whether personally or on behalf of an entity (“you”) and Wa Biz Boost (“we,” “us” or “our”), concerning your access to and use of the Wa Biz Boost website as well as any other media form, media channel, mobile website or mobile application related, linked, or otherwise connected thereto (collectively, the “Site”).\n\n2. Intellectual Property Rights\n\nUnless otherwise indicated, the Site is our proprietary property and all source code, databases, functionality, software, website designs, audio, video, text, photographs, and graphics on the Site (collectively, the “Content”) and the trademarks, service marks, and logos contained therein (the “Marks”) are owned or controlled by us or licensed to us.\n\n3. User Representations\n\nBy using the Site, you represent and warrant that:\n\nAll registration information you submit will be true, accurate, current, and complete.\nYou will maintain the accuracy of such information and promptly update such registration information as necessary.\nYou have the legal capacity and you agree to comply with these Terms and Conditions.\nYou use the API in compliance with WhatsApp &amp; Meta Policies.\n4. Prohibited Activities\n\nYou may not access or use the Site for any purpose other than that for which we make the Site available. The Site may not be used in connection with any commercial endeavors except those that are specifically endorsed or approved by us.\n\n5. Limitation of Liability\n\nIn no event will we or our directors, employees, or agents be liable to you or any third party for any direct, indirect, consequential, exemplary, incidental, special, or punitive damages, including lost profit, lost revenue, loss of data, or other damages arising from your use of the site, even if we have been advised of the possibility of such damages.\n\n6. Contact Us\n\n</p><p>In order to resolve a complaint regarding the Site or to receive further information regarding use of the Site, please contact us at: <a href=\"mailto:support@wabizboost.com\">support@wabizboost.com</a>.</p>', '2026-02-10 05:04:07', '2025-11-25 08:04:05'),
(3, 'Refund Policy', '<strong>1. Cancellation Policy</strong><p>You may cancel your subscription at any time. If you cancel your subscription, your account will remain active until the end of your current billing period. No further charges will be applied.</p><strong>2. Refund Eligibility</strong><p>To provide the best customer satisfaction, we provide the following solutions. Feel free to contact us if you have any questions regarding this Refund Policy or the practices of this site.</p><ul><li><span style=\"color:rgb(17,27,33);\">7-Day Trial:</span> We offer a 7-day free trial for new users. You are not charged during this period.</li><li><span style=\"color:rgb(17,27,33);\">Technical Issues:</span> If you face technical issues that prevent you from using the core features of our service and our support team is unable to resolve them within a reasonable timeframe, you may be eligible for a refund.</li></ul><strong>3. Non-refundable Circumstances</strong><p>Refunds are generally not provided for:</p><ul><li>Change of mind after subscription payment.</li><li>Partial use of the subscription period.</li><li>Failure to use the service due to lack of knowledge or user error.</li><li>Policy violations resulting in account suspension by WhatsApp or Meta.</li></ul><strong>4. Requesting a Refund</strong><p>To request a refund, please contact our support team at <a href=\"mailto:contact@wabizboost.com\">contact@wabizboost.com</a> with your transaction details and the reason for the request. We review refund requests on a case-by-case basis.</p>', '2026-02-10 05:05:03', '2026-02-10 05:04:45');

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
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `id` bigint NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(192) NOT NULL,
  `email` varchar(192) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `msg` text,
  `subject` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`id`, `type`, `name`, `email`, `phone`, `msg`, `subject`, `created_at`, `updated_at`) VALUES
(1, 'CONTACT-US', 'test', 'test@gmail.com', '919898989898', 'test test test', 'Support', '2026-02-11 05:42:04', '2026-02-11 05:42:04'),
(2, 'CONTACT-US', 'tesat', 'test@gmail.com', '919898989898', 'test  testetstststst', 'Support', '2026-02-11 05:43:06', '2026-02-11 05:43:06');

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

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `name`, `position`, `review`, `rating`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'John Duo', 'Developer', '\"WaBizBoost helped us get the Green Tick verification which instantly boosted our open rates by 40%. Highly recommended!\"', 5, NULL, 1, '2026-02-04 04:47:59', '2026-02-04 04:50:06'),
(2, 'DQOT Solutions', 'IT Firm', '\"WaBizBoost helped us get the Green Tick verification which instantly boosted our open rates by 40%. Highly recommended!\"', 5, NULL, 1, '2026-02-10 03:17:49', '2026-02-10 03:17:49');

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

--
-- Dumping data for table `seeder_histories`
--

INSERT INTO `seeder_histories` (`id`, `seeder_name`, `created_at`, `updated_at`) VALUES
(1, 'Database\\Seeders\\AddonsLicenseSeeder', '2025-12-17 01:15:05', '2025-12-17 01:15:05'),
(2, 'Database\\Seeders\\AddonsTableSeeder', '2025-12-17 01:15:05', '2025-12-17 01:15:05'),
(3, 'Database\\Seeders\\AddonsTableSeeder2', '2025-12-17 01:15:05', '2025-12-17 01:15:05'),
(4, 'Database\\Seeders\\AddonsTableSeeder3', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(5, 'Database\\Seeders\\AddonsTableSeeder4', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(6, 'Database\\Seeders\\AddonsTableSeeder5', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(7, 'Database\\Seeders\\AddonsTableSeeder6', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(8, 'Database\\Seeders\\AddonsTableSeeder7', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(9, 'Database\\Seeders\\AddonsTableSeeder8', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(10, 'Database\\Seeders\\EmailTemplateSeeder', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(11, 'Database\\Seeders\\LanguageTableSeeder', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(12, 'Database\\Seeders\\ModulesTableSeeder', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(13, 'Database\\Seeders\\PageSeeder', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(14, 'Database\\Seeders\\PaymentGatewaysTableSeeder', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(15, 'Database\\Seeders\\RolesTableSeeder', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(16, 'Database\\Seeders\\SettingsTableSeeder', '2025-12-17 01:15:06', '2025-12-17 01:15:06'),
(17, 'Database\\Seeders\\TicketCategoriesTableSeeder', '2025-12-17 01:15:07', '2025-12-17 01:15:07'),
(18, 'Database\\Seeders\\WebhookModuleSeeder', '2025-12-17 01:15:07', '2025-12-17 01:15:07');

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
('ai', '1'),
('allow_facebook_login', '1'),
('allow_google_login', '0'),
('app_environment', 'local'),
('authentication', '0.115'),
('available_version', NULL),
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
('company_name', 'WaBizBoost'),
('currency', 'INR'),
('date_format', 'd-M-y'),
('default_image_api', NULL),
('default_language', 'en'),
('display_frontend', '1'),
('email', NULL),
('facebook_login', '{\"client_id\":\"1425813585771610\",\"client_secret\":\"a4be500922114a5620f8d892f5709c32\"}'),
('favicon', 'public/4ZXhOsU6YMs0OaPpFLNiCwLTN62ea4nLTqw7Ae2M.png'),
('flow_builder', '1'),
('google_analytics_status', '0'),
('google_analytics_tracking_id', NULL),
('google_login', '{\"client_id\":null,\"client_secret\":null}'),
('google_maps_api_key', NULL),
('invoice_prefix', NULL),
('is_embedded_signup_active', '1'),
('is_tax_inclusive', '1'),
('is_update_available', '0'),
('last_update_check', '2025-12-17 06:45:06'),
('logo', 'public/7TxktfB272GXmDNP8ON2VzEqw0MSehHgJ4OzDKyH.svg'),
('mail_config', NULL),
('marketing', '0.8631'),
('phone', NULL),
('pusher_app_cluster', NULL),
('pusher_app_id', NULL),
('pusher_app_key', NULL),
('pusher_app_secret', NULL),
('razorpay_active', '1'),
('razorpay_key_id', 'dfsfdsdfsdf'),
('razorpay_secret_key', 'fsdfsdfdsf'),
('razorpay_webhook_secret', 'fsdfsdfsd'),
('recaptcha_active', '0'),
('recaptcha_secret_key', NULL),
('recaptcha_site_key', NULL),
('release_date', NULL),
('service', '0'),
('smtp_email_active', '0'),
('socials', '{\"facebook\":null,\"twitter\":null,\"instagram\":null,\"slack\":null,\"linkedin\":null}'),
('storage_system', 'local'),
('time_format', 'H:i'),
('timezone', 'Asia/Kolkata'),
('title', NULL),
('trial_limits', '{\"users\":\"-1\",\"messages\":\"-1\",\"contacts\":\"-1\",\"campaigns\":\"-1\",\"automated_replies\":\"-1\"}'),
('trial_period', '1'),
('type', 'subscription'),
('utility', '0.115'),
('verify_email', '0'),
('version', NULL),
('whatsapp_access_token', 'EAAL6XhbxAgEBQDrezNOVE3rjozTZA0hZBXIHf9yE7gIPGFZCdnSOlonNSt5ZBZCAjUhueG9txJNU4zqc7WKK6TNAGdzFMenH0sSy8LCftOtoRrGcoKgPgZADKZCSrP7vAYIa7AOp7fNhZCHyljZBK03yLsRZBWMh19ljIMjNZA3nTvoXC6AEBnVTbb7BCzsaDZC36u9BOsCqJOzi9VdlDP7vkZAEVjoZCoknZAziShyTAWZB'),
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
(1, '3c49c6ba-ef9d-4755-9b7d-e5bb910db02a', 1, 1, NULL, '2026-02-05 00:56:47', '2026-03-05 06:26:47', 'active', '2025-11-26 00:44:31', '2026-02-05 00:56:47'),
(2, '7c6152e3-54b9-41d1-aedc-ad6a3f83f402', 2, 1, NULL, '2026-01-05 00:55:46', '2026-02-05 06:25:46', 'active', '2025-12-12 00:13:05', '2026-01-05 00:55:46'),
(3, 'ad947e66-8f8c-4ab4-a0ab-7915fc9d647e', 3, 1, NULL, '2026-02-12 03:23:36', '2026-03-12 08:53:36', 'active', '2026-01-08 02:03:44', '2026-02-12 03:23:36');

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
(1, 'ed423bfb-4efa-4cb3-b062-40280b6ab3e9', 'Basic', 500.00, 'monthly', '{\"campaign_limit\":\"100\",\"message_limit\":\"10000\",\"contacts_limit\":\"4\",\"canned_replies_limit\":\"10\",\"team_limit\":\"5\",\"receive_messages_after_expiration\":1,\"ai_text_response_limit\":\"-1\",\"ai_audio_response_limit\":\"-1\",\"addons\":{\"Embedded Signup\":true,\"Flow builder\":true,\"AI Assistant\":true}}', 'active', '2025-11-26 02:23:46', '2026-02-14 01:10:08', NULL),
(2, 'c59f2331-ebfd-4d45-9ac8-01a188117f85', 'Pro', 1000.00, 'monthly', '{\"campaign_limit\":\"-1\",\"message_limit\":\"-1\",\"contacts_limit\":\"-1\",\"canned_replies_limit\":\"-1\",\"team_limit\":\"-1\",\"receive_messages_after_expiration\":1,\"ai_text_response_limit\":\"-1\",\"ai_audio_response_limit\":\"-1\",\"addons\":{\"Embedded Signup\":true,\"Flow builder\":true,\"AI Assistant\":true}}', 'active', '2025-11-26 02:24:36', '2026-02-14 01:09:19', NULL),
(3, 'b31c2bb5-d033-43f0-961c-fc8d511ae696', 'Pro', 9600.00, 'yearly', '{\"campaign_limit\":\"-1\",\"message_limit\":\"-1\",\"contacts_limit\":\"-1\",\"canned_replies_limit\":\"-1\",\"team_limit\":\"-1\",\"receive_messages_after_expiration\":1,\"ai_text_response_limit\":\"-1\",\"ai_audio_response_limit\":\"-1\",\"addons\":{\"Embedded Signup\":true,\"Flow builder\":true,\"AI Assistant\":true}}', 'active', '2026-02-04 01:00:02', '2026-02-14 01:09:05', NULL),
(4, '7cf6a427-4e32-4798-9c20-888d127ca6af', 'Basic', 4999.00, 'yearly', '{\"campaign_limit\":\"100\",\"message_limit\":\"10000\",\"contacts_limit\":\"-1\",\"canned_replies_limit\":\"10\",\"team_limit\":\"5\",\"receive_messages_after_expiration\":1,\"ai_text_response_limit\":\"-1\",\"ai_audio_response_limit\":\"-1\",\"addons\":{\"Embedded Signup\":true,\"Flow builder\":true,\"AI Assistant\":true}}', 'active', '2026-02-04 01:01:24', '2026-02-14 01:08:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint NOT NULL,
  `organization_id` bigint NOT NULL,
  `name` varchar(192) NOT NULL,
  `color` varchar(10) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `organization_id`, `name`, `color`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Lead', '#207402', NULL, '2026-01-29 10:45:00', '2026-01-30 05:08:06'),
(2, 2, 'New Customer', '#d50101', NULL, '2026-01-30 05:08:35', '2026-01-30 05:08:35'),
(3, 2, 'Follow Up', '#001061', NULL, '2026-01-30 05:08:57', '2026-01-30 05:08:57'),
(4, 2, 'Important', '#d39292', NULL, '2026-01-30 05:10:12', '2026-01-30 05:14:23');

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
  `created_by` bigint UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `uuid`, `organization_id`, `user_id`, `role`, `status`, `created_by`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'ade59f8a-e1d7-4360-baba-356a460c96fb', 1, 1, 'owner', 'active', 1, NULL, NULL, '2025-11-26 00:44:31', '2025-11-26 00:44:31'),
(2, '94c74ba1-e2c4-4e3b-97cd-98ee21385fdd', 2, 4, 'owner', 'active', 4, NULL, NULL, '2025-12-12 00:13:05', '2025-12-12 00:13:05'),
(3, '9a18f03a-9250-437b-9c9d-283dc1c3c38c', 3, 5, 'owner', 'active', 5, NULL, NULL, '2026-01-08 02:03:44', '2026-01-08 02:03:44');

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

--
-- Dumping data for table `team_invites`
--

INSERT INTO `team_invites` (`id`, `organization_id`, `email`, `code`, `role`, `invited_by`, `expire_at`) VALUES
(1, 1, 'hemant@dqotsolutions.com', '1f87a8dec9b11b17ad7b27946044ffda', 'agent', 1, '2025-12-05 01:51:18');

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
(1, '2a2d3faf-9761-4a75-bf78-2f86a8dde45a', 1, '1580734569965342', 'for_testing', 'MARKETING', 'en', '{\"name\":\"for_testing\",\"previous_category\":\"UTILITY\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"This is testing form console\"},{\"type\":\"BODY\",\"text\":\"Hello User\"},{\"type\":\"FOOTER\",\"text\":\"DQOT Solutions\"}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"sub_category\":\"CUSTOM\",\"id\":\"1580734569965342\"}', 'APPROVED', 1, '2025-11-26 01:12:11', '2025-12-19 07:29:55', NULL),
(2, 'e82caaf8-9bfd-497b-933e-051d8820305a', 1, '799159499787092', 'broadcast_message', 'MARKETING', 'en', '{\"name\":\"broadcast_message\",\"previous_category\":\"UTILITY\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"BODY\",\"text\":\"Hello hem ant this is a message from DOT\"}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"sub_category\":\"CUSTOM\",\"id\":\"799159499787092\"}', 'APPROVED', 1, '2025-11-26 01:12:11', '2025-12-19 07:29:55', NULL),
(3, '7a8ea32c-549e-4210-9498-db22e2436f2b', 1, '2276160219570116', 'marketing', 'MARKETING', 'en', '{\"name\":\"marketing\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"DQOT\"},{\"type\":\"BODY\",\"text\":\"Hello User\"},{\"type\":\"FOOTER\",\"text\":\"Dqot\"},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"URL\",\"text\":\"Visit website\",\"url\":\"https:\\/\\/www.dqotsolutions.com\\/\"}]}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"sub_category\":\"CUSTOM\",\"id\":\"2276160219570116\"}', 'APPROVED', 1, '2025-11-26 01:12:11', '2025-12-19 07:29:55', NULL),
(4, '442d80c6-f65e-4040-a236-739415273478', 1, '699088566598140', 'hello_world', 'UTILITY', 'en_US', '{\"name\":\"hello_world\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Hello World\"},{\"type\":\"BODY\",\"text\":\"Welcome and congratulations!! This message demonstrates your ability to send a WhatsApp message notification from the Cloud API, hosted by Meta. Thank you for taking the time to test with us.\"},{\"type\":\"FOOTER\",\"text\":\"WhatsApp Business Platform sample message\"}],\"language\":\"en_US\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"id\":\"699088566598140\"}', 'APPROVED', 1, '2025-11-26 01:12:11', '2025-12-19 07:29:55', NULL),
(5, 'e43bdeb6-ac0b-4af8-9d77-a3cc6197b99b', 1, '861109253097484', 'test', 'UTILITY', 'en', '{\"name\":\"test\",\"previous_category\":\"UTILITY\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"this is demo from admin panal\"},{\"type\":\"BODY\",\"text\":\"this is demo from admin panal\"},{\"type\":\"FOOTER\",\"text\":\"this is demo from admin panal\"}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"id\":\"861109253097484\"}', 'APPROVED', 1, '2025-11-26 01:52:03', '2025-12-19 07:29:55', NULL),
(6, '638753b8-d80b-47cd-a893-7eec08da324d', 1, '876852972178728', 'appointment_scheduling', 'UTILITY', 'en_US', '{\"name\":\"appointment_scheduling\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Technician visit\"},{\"type\":\"BODY\",\"text\":\"Hi {{1}}, we\'re scheduling a technician visit for your {{2}} on {{3}} between {{4}} and {{5}}. Please confirm if this time slot works for you.\",\"example\":{\"body_text\":[[\"John\",\"broadband installation\",\"2025-12-31\",\"10:00 AM\",\"2:00 PM\"]]}},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"Confirm\"},{\"type\":\"QUICK_REPLY\",\"text\":\"Reschedule\"}]}],\"language\":\"en_US\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"sub_category\":\"CUSTOM\",\"id\":\"876852972178728\"}', 'APPROVED', 1, '2025-11-28 01:50:58', '2025-12-19 07:29:55', NULL),
(7, '16133f9b-beb6-494d-bd5f-82347f8963d7', 1, '782784924809471', 'appointment_cancel', 'UTILITY', 'en_US', '{\"name\":\"appointment_cancel\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Your appointment was canceled\"},{\"type\":\"BODY\",\"text\":\"Hello {{1}},\\n\\nYour upcoming appointment with {{2}} on {{3}} at {{4}} has been canceled.\\n\\nLet us know if you have any questions or need to reschedule.\\n\\n\",\"example\":{\"body_text\":[[\"John\",\"Fashion Styles\",\"December 31, 2025\",\"1:00 PM\"]]}},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"URL\",\"text\":\"View details\",\"url\":\"https:\\/\\/www.example.com\\/\"}]}],\"language\":\"en_US\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"library_template_name\":\"appointment_cancellation_1\",\"id\":\"782784924809471\"}', 'APPROVED', 1, '2025-12-06 02:13:17', '2025-12-19 07:29:55', NULL),
(8, '4d25b146-685f-4766-90cf-9053fc744c3e', 1, '1489667825427218', 'low_balance', 'UTILITY', 'en', '{\"name\":\"low_balance\",\"previous_category\":\"MARKETING\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Recharge Alert\"},{\"type\":\"BODY\",\"text\":\"\\u25b6\\ufe0f\\ud83d\\udd3d\\ud83d\\udd3cHi John, your mobile balance is {{1}}. Please recharge to avoid interruption\\u25b6\\ufe0f.\",\"example\":{\"body_text\":[[\"5rs\"]]}},{\"type\":\"FOOTER\",\"text\":\"jio corporation\"},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"URL\",\"text\":\"Recharge Now\",\"url\":\"http:\\/\\/abc.com\\/\"}]}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"correct_category\":\"UTILITY\",\"id\":\"1489667825427218\"}', 'APPROVED', 1, '2025-12-06 02:19:06', '2025-12-19 07:29:55', NULL),
(9, 'be3f70fc-709c-4f29-a70c-05bcd07ba922', 1, '1395166601977669', 'offer_nsg', 'MARKETING', 'en', '{\"name\":\"offer_nsg\",\"previous_category\":\"UTILITY\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Offer MSG\"},{\"type\":\"BODY\",\"text\":\"this is offer msg for dqot \\nuse this code abc123\\nfor get 20 discount on every product on dqot website.\"},{\"type\":\"FOOTER\",\"text\":\"powered by DQOT\"},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"share\"},{\"type\":\"PHONE_NUMBER\",\"text\":\"call now\",\"phone_number\":\"+911234567898\"},{\"type\":\"COPY_CODE\",\"text\":\"Copy offer code\",\"example\":[\"abc123\"]},{\"type\":\"URL\",\"text\":\"visit now\",\"url\":\"https:\\/\\/www.dqotsolutions.com\\/\"}]}],\"language\":\"en\",\"status\":\"PENDING\",\"category\":\"MARKETING\",\"id\":\"1395166601977669\"}', 'PENDING', 1, '2025-12-19 07:29:55', '2025-12-19 07:29:55', NULL),
(10, '9691b4d4-06bc-46d5-b589-584dbb9ec0c4', 2, '1651015639208237', 'hello_world', 'UTILITY', 'en_US', '{\"name\":\"hello_world\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Hello World\"},{\"type\":\"BODY\",\"text\":\"Welcome and congratulations!! This message demonstrates your ability to send a WhatsApp message notification from the Cloud API, hosted by Meta. Thank you for taking the time to test with us.\"},{\"type\":\"FOOTER\",\"text\":\"WhatsApp Business Platform sample message\"}],\"language\":\"en_US\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"id\":\"1651015639208237\"}', 'APPROVED', 4, '2026-01-05 01:40:28', '2026-02-02 04:44:04', NULL),
(11, 'c9db9eaa-cb71-4abe-8620-dc05b91787c1', 2, '783185694794520', 'test_marketing', 'MARKETING', 'en', '{\"name\":\"test_marketing\",\"parameter_format\":\"NAMED\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"this is test msg from marketing.\"},{\"type\":\"BODY\",\"text\":\"this is test MSG from marketing.\"},{\"type\":\"FOOTER\",\"text\":\"powered vy DQOT\"}],\"language\":\"en\",\"status\":\"PENDING\",\"category\":\"MARKETING\",\"sub_category\":\"CUSTOM\",\"id\":\"783185694794520\"}', 'PENDING', 4, '2026-01-05 04:13:19', '2026-01-05 04:13:19', NULL),
(12, 'b78883dd-7ed4-4a20-b094-5d9cd3e67e9a', 2, '799688323087506', 'cta_based', 'MARKETING', 'en', '{\"name\":\"cta_based\",\"previous_category\":\"UTILITY\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"CTA based\"},{\"type\":\"BODY\",\"text\":\"Hii {{1}} \\ud83d\\udc4b\\r\\nWe\\u2019ve added new features to help you manage conversations faster.\\r\\n\\r\\n\\ud83d\\udc49 Tap below to explore now.\",\"example\":{\"body_text\":[[\"Hemant\"]]}},{\"type\":\"FOOTER\",\"text\":\"powered by DQOT Solutions\"},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"QUICK_REPLY\",\"text\":\"View Features\"},{\"type\":\"URL\",\"text\":\"Contact Support\",\"url\":\"https:\\/\\/www.dqotsolutions.com\\/\"}]}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"MARKETING\",\"id\":\"799688323087506\"}', 'APPROVED', 4, '2026-01-13 00:00:47', '2026-01-27 01:57:54', NULL),
(13, '38ebe911-6766-451a-b048-c12ece336515', 2, '1445254887159350', 'no_open_postions_notifications', 'MARKETING', 'en', '{\"name\":\"no_open_postions_notifications\",\"previous_category\":\"MARKETING\",\"parameter_format\":\"POSITIONAL\",\"components\":[{\"type\":\"HEADER\",\"format\":\"TEXT\",\"text\":\"Hello {{1}}\",\"example\":{\"header_text\":[\"test\"]}},{\"type\":\"BODY\",\"text\":\"Thank you for reaching out and for your interest in working with us.\\r\\n\\r\\nAt the moment, we do not have any open positions available. However, we truly appreciate your interest and encourage you to stay connected with us for future opportunities.\\r\\n\\r\\nIf any suitable position opens up, we will be happy to reach out.\\r\\n\\r\\nThank you once again for your time and understanding.\\r\\n\\r\\nWarm regards\"},{\"type\":\"FOOTER\",\"text\":\"DQOT Solution Pvt. Ltd.\"},{\"type\":\"BUTTONS\",\"buttons\":[{\"type\":\"URL\",\"text\":\"Visit Now\",\"url\":\"https:\\/\\/www.dqotsolutions.com\\/\"},{\"type\":\"PHONE_NUMBER\",\"text\":\"Call at\",\"phone_number\":\"+919257086308\"}]}],\"language\":\"en\",\"status\":\"APPROVED\",\"category\":\"UTILITY\",\"correct_category\":\"UTILITY\",\"id\":\"1445254887159350\"}', 'APPROVED', 4, '2026-01-30 23:32:53', '2026-02-02 04:44:04', NULL);

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

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `uuid`, `reference`, `organization_id`, `user_id`, `category_id`, `subject`, `message`, `priority`, `assigned_to`, `status`, `closed_by`, `created_at`, `updated_at`) VALUES
(1, 'aa012663-d3ae-41b9-9bab-aac2510a21e0', 'SUP-000001-251204', NULL, 1, 3, 'test', 'this is issue', 'high', 3, 'closed', NULL, '2025-12-04 03:52:45', '2025-12-04 03:55:17');

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

--
-- Dumping data for table `ticket_comments`
--

INSERT INTO `ticket_comments` (`id`, `ticket_id`, `user_id`, `message`, `seen`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'sss', 0, '2025-12-04 03:53:24', '2025-12-04 03:53:24'),
(2, 1, 1, 'sdfcsdfsdf', 0, '2025-12-04 03:53:43', '2025-12-04 03:53:43'),
(3, 1, 1, 'sdcffsdfsd', 0, '2025-12-04 03:54:34', '2025-12-04 03:54:34'),
(4, 1, 3, 'dsfsdf', 0, '2025-12-04 03:54:50', '2025-12-04 03:54:50');

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
  `whatsapp_verify` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `facebook_id`, `avatar`, `role`, `phone`, `address`, `email_verified_at`, `password`, `tfa_secret`, `tfa`, `status`, `meta`, `plan`, `plan_id`, `will_expire`, `remember_token`, `whatsapp_verify`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test', 'User', 'user@gmail.com', NULL, NULL, 'user', '+919898989898', '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', NULL, '$2y$12$KiAVpn9QidyghcYMsyCBcetIDInDBRIm.NMPbYsE0kplH1wkVPo66', 'RCKKT7SDIDFJ3B2EZXYN4L2LAAII7NAS', 0, 1, NULL, NULL, NULL, NULL, 'L3171Zrx30KT08whYJchYMMN3Ispsus77fPlosvDvW6gPggP9nKaSFG95Nam', 0, '2025-11-26 00:44:31', '2026-02-05 03:57:42', NULL),
(3, 'Super', 'Admin', 'admin@admin.com', NULL, NULL, 'admin', NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', NULL, '$2y$12$KiAVpn9QidyghcYMsyCBcetIDInDBRIm.NMPbYsE0kplH1wkVPo66', 'VMBFPMAIXY6IAEUOGIGJBUS3TX7WLWLR', 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2025-11-26 00:44:31', '2025-12-17 01:38:07', NULL),
(4, 'Hemant', 'Sharma', 'hemant@dqotsolutions.com', NULL, NULL, 'user', '+919898989898', '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', NULL, '$2y$12$8KBqy9kjfZ4qZWQLE.v9F.TGYnetyPzW7R.8OBqPlIzWuH1Ety5ma', 'JBFL3M2GQUZOXBKDW3E2LCGZBZV34EZ6', 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2025-12-12 00:13:05', '2026-01-06 04:03:10', NULL),
(5, 'my', 'horoscope', 'support@mytodayhoroscope.com', NULL, NULL, 'user', NULL, '{\"street\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":null}', NULL, '$2y$12$9H/f2hrMc/EF44tan1kGeutZM0rU8QkoGxZjc2ErxnFRTg6rC.Pw.', 'IPT24GVST3MCBYHRPQC233KURRR7OLHC', 0, 1, NULL, NULL, NULL, NULL, NULL, 0, '2026-01-08 02:03:44', '2026-01-08 02:03:45', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ai_knowledge_bases`
--
ALTER TABLE `ai_knowledge_bases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `organization_id` (`organization_id`);

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
-- Indexes for table `contacts_flows_old`
--
ALTER TABLE `contacts_flows_old`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `contact_tags`
--
ALTER TABLE `contact_tags`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `flows_old`
--
ALTER TABLE `flows_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flows_old_2`
--
ALTER TABLE `flows_old_2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid_unique` (`uuid`);

--
-- Indexes for table `flow_edges_old`
--
ALTER TABLE `flow_edges_old`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `flow_nodes_old`
--
ALTER TABLE `flow_nodes_old`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ai_knowledge_bases`
--
ALTER TABLE `ai_knowledge_bases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auto_replies`
--
ALTER TABLE `auto_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billing_credits`
--
ALTER TABLE `billing_credits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billing_debits`
--
ALTER TABLE `billing_debits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_invoices`
--
ALTER TABLE `billing_invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `billing_items`
--
ALTER TABLE `billing_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_payments`
--
ALTER TABLE `billing_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `billing_tax_rates`
--
ALTER TABLE `billing_tax_rates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_transactions`
--
ALTER TABLE `billing_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `campaign_logs`
--
ALTER TABLE `campaign_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `campaign_log_retries`
--
ALTER TABLE `campaign_log_retries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `chat_logs`
--
ALTER TABLE `chat_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `chat_media`
--
ALTER TABLE `chat_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_notes`
--
ALTER TABLE `chat_notes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_status_logs`
--
ALTER TABLE `chat_status_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_tickets`
--
ALTER TABLE `chat_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chat_ticket_logs`
--
ALTER TABLE `chat_ticket_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts_flows_old`
--
ALTER TABLE `contacts_flows_old`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_contact_group`
--
ALTER TABLE `contact_contact_group`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_fields`
--
ALTER TABLE `contact_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_groups`
--
ALTER TABLE `contact_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contact_tags`
--
ALTER TABLE `contact_tags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flows`
--
ALTER TABLE `flows`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flows_old`
--
ALTER TABLE `flows_old`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `flows_old_2`
--
ALTER TABLE `flows_old_2`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flow_edges_old`
--
ALTER TABLE `flow_edges_old`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `flow_logs`
--
ALTER TABLE `flow_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flow_media`
--
ALTER TABLE `flow_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flow_nodes_old`
--
ALTER TABLE `flow_nodes_old`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `flow_user_data`
--
ALTER TABLE `flow_user_data`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `organization_api_keys`
--
ALTER TABLE `organization_api_keys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `team_invites`
--
ALTER TABLE `team_invites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_categories`
--
ALTER TABLE `ticket_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ticket_comments`
--
ALTER TABLE `ticket_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
