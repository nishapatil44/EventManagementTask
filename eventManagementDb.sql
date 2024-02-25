-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for event_management
CREATE DATABASE IF NOT EXISTS `event_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `event_management`;

-- Dumping structure for table event_management.events
CREATE TABLE IF NOT EXISTS `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photos` json NOT NULL,
  `until_datetime` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `events_user_id_foreign` (`user_id`),
  CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.events: ~1 rows (approximately)
INSERT INTO `events` (`id`, `title`, `description`, `category`, `photos`, `until_datetime`, `created_at`, `updated_at`, `user_id`) VALUES
	(1, 'Event', 'This is a test event', 'test', '{"photo": "e629cfcb-2772-4e7b-bcb9-c4fde6239842.jpg", "datetime": "2024-02-24 07:57:00"}', '2024-03-01 07:57:00', '2024-02-25 07:24:36', '2024-02-25 07:24:36', 1);

-- Dumping structure for table event_management.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table event_management.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.migrations: ~12 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_02_24_115821_create_events_table', 2),
	(6, '2014_10_12_100000_create_password_resets_table', 3),
	(7, '2024_02_25_103846_add_user_id_to_events_table', 4),
	(8, '2016_06_01_000001_create_oauth_auth_codes_table', 5),
	(9, '2016_06_01_000002_create_oauth_access_tokens_table', 5),
	(10, '2016_06_01_000003_create_oauth_refresh_tokens_table', 5),
	(11, '2016_06_01_000004_create_oauth_clients_table', 5),
	(12, '2016_06_01_000005_create_oauth_personal_access_clients_table', 5);

-- Dumping structure for table event_management.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.oauth_access_tokens: ~0 rows (approximately)
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('1b228509992acd83b8c8f0a613e3c8fc3e740f62c4a2413e83aef10d7b7d9c660f5aed3501d92886', 1, 1, 'myToken', '[]', 0, '2024-02-25 06:35:41', '2024-02-25 06:35:42', '2025-02-25 12:05:41'),
	('3403c113431b5338fde40b5b84ad60c8ed603571c7f01bfe884391fc5018beead9234b6b9b63fb16', 1, 1, 'myToken', '[]', 0, '2024-02-25 06:35:08', '2024-02-25 06:35:08', '2025-02-25 12:05:08');

-- Dumping structure for table event_management.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.oauth_auth_codes: ~0 rows (approximately)

-- Dumping structure for table event_management.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.oauth_clients: ~1 rows (approximately)
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', '806CT6q9eTkVMGuYAfwMOAQ3LHiFZSzibylAC2vq', NULL, 'http://localhost', 1, 0, 0, '2024-02-25 05:30:43', '2024-02-25 05:30:43'),
	(2, NULL, 'Laravel Password Grant Client', 'WNTiMkdgYKCfG9WuHFcA8G2djf3QdoDjXMFO9MQ4', 'users', 'http://localhost', 0, 1, 0, '2024-02-25 05:30:43', '2024-02-25 05:30:43');

-- Dumping structure for table event_management.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.oauth_personal_access_clients: ~1 rows (approximately)
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2024-02-25 05:30:43', '2024-02-25 05:30:43');

-- Dumping structure for table event_management.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.oauth_refresh_tokens: ~0 rows (approximately)

-- Dumping structure for table event_management.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.password_resets: ~0 rows (approximately)

-- Dumping structure for table event_management.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table event_management.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.personal_access_tokens: ~7 rows (approximately)
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 1, 'myToken', '5f157a5e3f0090ab75313a67c35d3882a0e7592f664adbe96afbb40b1c18ac69', '["*"]', NULL, NULL, '2024-02-25 05:47:55', '2024-02-25 05:47:55'),
	(2, 'App\\Models\\User', 1, 'myToken', '466ca4b084342ec02169feb22553b75b9abbc982f6dee46c069d954699bcfe69', '["*"]', NULL, NULL, '2024-02-25 05:48:52', '2024-02-25 05:48:52'),
	(3, 'App\\Models\\User', 1, 'myToken', 'd046e726352e526b8de3f199c31a14fa7128c32efe10685c341a2985dc9111ed', '["*"]', NULL, NULL, '2024-02-25 05:49:44', '2024-02-25 05:49:44'),
	(4, 'App\\Models\\User', 1, 'myToken', '682392b55f0b47044efc2df7dbc1dbf5dc8a0104e283ebf3f67c01bbef62b3e7', '["*"]', NULL, NULL, '2024-02-25 05:51:04', '2024-02-25 05:51:04'),
	(5, 'App\\Models\\User', 1, 'myToken', '5b74daf3b7ceb8d8abd50992cccc3ffe6a3d1d64f85f348ac06fa61ba4cb5475', '["*"]', NULL, NULL, '2024-02-25 05:52:39', '2024-02-25 05:52:39'),
	(6, 'App\\Models\\User', 1, 'myToken', '38bc7912264a7d653e7290a3f23939b215934892b46290e65cf8439d7f34240c', '["*"]', NULL, NULL, '2024-02-25 05:52:52', '2024-02-25 05:52:52'),
	(7, 'App\\Models\\User', 1, 'myToken', 'c564f84e556c42937f0937b9766d85b1d0c03dd46d464b391bd3848153316480', '["*"]', NULL, NULL, '2024-02-25 05:53:09', '2024-02-25 05:53:09');

-- Dumping structure for table event_management.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table event_management.users: ~6 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `timezone`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Nisha', 'nspatil44@gmail.com', NULL, '$2y$12$uzdoeQsiZ6CjDopBr5ObyeJNZlyfugGogbUyl/O01GTrVRtYNb0QC', 'admin', 'Europe/Tallinn', NULL, '2024-02-25 04:40:58', '2024-02-25 04:40:58'),
	(2, 'test', 'test@gmail.com', NULL, '$2y$12$uzdoeQsiZ6CjDopBr5ObyeJNZlyfugGogbUyl/O01GTrVRtYNb0QC', NULL, 'Europe/Tallinn', NULL, '2024-02-25 05:44:03', '2024-02-25 05:44:03'),
	(3, 'dummy', 'dummy@gmail.com', NULL, '$2y$12$qE8htQTCtNHKyPRYW7UYVOrEr02KULH6c2Vfaf1XSYkByq9hPikSO', NULL, 'Europe/Tallinn', NULL, '2024-02-25 07:01:06', '2024-02-25 07:01:06'),
	(4, 'timezonecheck', 'check@gmail.com', NULL, '$2y$12$eILxQDnVwofrY9lpE8WZdOYJWlXcrZcQLS9cP6tE7B/cbBQeqFx5q', NULL, 'Europe/Tallinn', NULL, '2024-02-25 07:03:29', '2024-02-25 07:03:29'),
	(5, 'test1', 'test1@gmail.com', NULL, '$2y$12$iVSK6FCqfGRhjWQVuimY0OUq0iPTHsItMYqw9MoUSPzPE1BX3kWh.', NULL, 'Europe/Tallinn', NULL, '2024-02-25 07:06:09', '2024-02-25 07:06:09'),
	(6, 'test2', 'test2@gmail.com', NULL, '$2y$12$0LxhF8KY61Au9wJsHeEy.usqASpast0NutfGBFA6NtbbsPDhlGVu2', 'admin', 'Africa/Brazzaville', NULL, '2024-02-25 07:13:23', '2024-02-25 07:13:23');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
