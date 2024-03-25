-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2024 at 02:27 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogs_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `feedback_id` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `feedback_id`, `content`, `created_at`, `updated_at`) VALUES
(1, '1', '6', 'this', '2024-03-24 11:26:44', '2024-03-24 11:26:44'),
(5, '1', '6', 'This is new comment', '2024-03-24 12:10:09', '2024-03-24 12:10:09'),
(6, '1', '6', 'testing comment', '2024-03-24 12:15:19', '2024-03-24 12:15:19'),
(7, '1', '7', 'comment on seven post', '2024-03-24 12:15:49', '2024-03-24 12:15:49'),
(8, '1', '7', 'second comment on sevent post', '2024-03-24 15:42:57', '2024-03-24 15:42:57'),
(9, '1', '5', 'first comment of five feedback', '2024-03-24 19:51:53', '2024-03-24 19:51:53'),
(10, '2', '8', 'first comment of eight feedback', '2024-03-24 20:11:14', '2024-03-24 20:11:14'),
(11, '2', '7', 'third comment of seven feedback', '2024-03-24 20:11:46', '2024-03-24 20:11:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `title`, `description`, `category`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Title one', 'This is new 3 piece dress design and new.\n', 'category one', 1, '2024-03-24 07:18:17', '2024-03-24 07:18:17'),
(2, 'Title second', 'This is good condition car', 'category two', 1, '2024-03-24 07:20:14', '2024-03-24 07:20:14'),
(3, 'Title three', 'This  is new 3 piece dress design.', 'category three', 1, '2024-03-24 07:20:45', '2024-03-24 07:20:45'),
(4, 'Title four', 'This  is new 3 piece dress design and new.', 'category two', 1, '2024-03-24 07:21:15', '2024-03-24 07:21:15'),
(5, 'Title five', 'This  is new 3 piece dress just.', 'category three', 1, '2024-03-24 07:37:23', '2024-03-24 07:37:23'),
(6, 'Title six', 'This  is new 3 piece dress.', 'category four', 1, '2024-03-24 09:28:32', '2024-03-24 09:28:32'),
(7, 'Title seven', 'This is good condition car seven description', 'category three', 1, '2024-03-24 09:29:13', '2024-03-24 09:29:13'),
(8, 'Title Eight', 'This  is new 3 piece dress design by user two.', 'category four', 2, '2024-03-24 20:09:05', '2024-03-24 20:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_21_113013_create_feedback_table', 2),
(6, '2024_01_21_125309_create_comments_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', 'b0c554d3a7881b12c1623ea7ac5b229c925803a46f27eee708e7e679c99cda97', '[\"*\"]', NULL, NULL, '2024-03-19 17:24:32', '2024-03-19 17:24:32'),
(2, 'App\\Models\\User', 1, 'MyApp', 'b1f918e97bbfc9d4d9e544a913096b4e543855b8aee9abcd71829417fb86448f', '[\"*\"]', NULL, NULL, '2024-03-19 17:26:13', '2024-03-19 17:26:13'),
(3, 'App\\Models\\User', 1, 'MyApp', 'e8a772f3f48d5adfe15ae1bcef436922258b98bf5816b9fcc21f964ec5403690', '[\"*\"]', NULL, NULL, '2024-03-23 20:31:13', '2024-03-23 20:31:13'),
(4, 'App\\Models\\User', 1, 'MyApp', '449b464afa5b09d9efbc0c1151bf3546dbe21c6f8b45e51dca8ae314514855c7', '[\"*\"]', NULL, NULL, '2024-03-23 21:15:36', '2024-03-23 21:15:36'),
(5, 'App\\Models\\User', 1, 'MyApp', '7415ed2ee62e6b1c57f918248d77354cf1ac9f5a6efe50718762c87b65036dd3', '[\"*\"]', NULL, NULL, '2024-03-23 21:16:34', '2024-03-23 21:16:34'),
(6, 'App\\Models\\User', 1, 'MyApp', '0a1a82d74efeef2a4d294fa23df44c3da7f9faf562e57c0ea8bf036a88fa4f9a', '[\"*\"]', NULL, NULL, '2024-03-23 21:20:25', '2024-03-23 21:20:25'),
(7, 'App\\Models\\User', 1, 'MyApp', '551e34713cd29c0a6e3835d17c30e81e1e991f276860c24895006f05d5f13741', '[\"*\"]', NULL, NULL, '2024-03-23 21:21:26', '2024-03-23 21:21:26'),
(8, 'App\\Models\\User', 1, 'MyApp', '578224442f0d01e5963d5ecf06efd7643218c71005766940c747d6b8dcd065c7', '[\"*\"]', NULL, NULL, '2024-03-23 21:21:45', '2024-03-23 21:21:45'),
(9, 'App\\Models\\User', 1, 'MyApp', '65085be7bc3a0870a288ebd9c9e3a4553b66c54b76d3eb65a51a312fd05b8ae3', '[\"*\"]', NULL, NULL, '2024-03-23 21:22:13', '2024-03-23 21:22:13'),
(10, 'App\\Models\\User', 1, 'MyApp', '2042b9596775fcb386d5170664668505fe8e5e2da50ae521009060e6923e216f', '[\"*\"]', NULL, NULL, '2024-03-23 21:22:53', '2024-03-23 21:22:53'),
(11, 'App\\Models\\User', 1, 'MyApp', 'e54c88eb7c547f2c8af9c5dd5a8021e0b02e568cd397c0d8b84f42158a06f097', '[\"*\"]', NULL, NULL, '2024-03-23 21:26:07', '2024-03-23 21:26:07'),
(12, 'App\\Models\\User', 1, 'MyApp', '32514af9b66899901d8dcfa3b8b66a02407b4ca5b08c79f0587aa72586a5eeb3', '[\"*\"]', NULL, NULL, '2024-03-23 21:34:16', '2024-03-23 21:34:16'),
(13, 'App\\Models\\User', 1, 'MyApp', '51c525249e1f0ec6a436ca5b715ba455516c25e702431e626431cb72b6151943', '[\"*\"]', NULL, NULL, '2024-03-23 21:48:52', '2024-03-23 21:48:52'),
(14, 'App\\Models\\User', 1, 'MyApp', '4411f8fc536f187592b161c783bf8d04df5eca778b8c041de3800db13385b9b9', '[\"*\"]', NULL, NULL, '2024-03-23 21:53:12', '2024-03-23 21:53:12'),
(15, 'App\\Models\\User', 1, 'MyApp', 'ced417087a7a498628b9a53cff063d3370e7fed4e5702ecd5cb6389e7fd8b4e1', '[\"*\"]', NULL, NULL, '2024-03-23 21:55:35', '2024-03-23 21:55:35'),
(16, 'App\\Models\\User', 1, 'MyApp', 'a3938ce8172b3f5c6c8a32f9831262e56c393314a3ddab7c9b82b3134029d92c', '[\"*\"]', NULL, NULL, '2024-03-24 16:09:21', '2024-03-24 16:09:21'),
(17, 'App\\Models\\User', 1, 'MyApp', '600b08483d8bc1b40521e2ea8ebf6ad0b6531da2b7f7ba9c7dc5e5a9fafbdc5e', '[\"*\"]', NULL, NULL, '2024-03-24 16:21:35', '2024-03-24 16:21:35'),
(18, 'App\\Models\\User', 1, 'MyApp', 'c2770625fe69e969b4ce810e23c1a780e6999480982206eadea5763f1a9b8740', '[\"*\"]', NULL, NULL, '2024-03-24 16:22:21', '2024-03-24 16:22:21'),
(19, 'App\\Models\\User', 1, 'MyApp', '4b81b6eedee94d5cc45e5a4b6c28f155ae592aeb3907513c4f250b9278f7c717', '[\"*\"]', NULL, NULL, '2024-03-24 16:27:52', '2024-03-24 16:27:52'),
(20, 'App\\Models\\User', 1, 'MyApp', '7e213ad694275b3e0b10baa9a53d72340adea609ad164ea4f1b4b0ceaf080d87', '[\"*\"]', NULL, NULL, '2024-03-24 16:28:45', '2024-03-24 16:28:45'),
(21, 'App\\Models\\User', 1, 'MyApp', 'cb0827e7246a8bb0eed9e5a6b7659f7b3145024549baad4c18e04962eb59dd01', '[\"*\"]', NULL, NULL, '2024-03-24 16:29:51', '2024-03-24 16:29:51'),
(22, 'App\\Models\\User', 1, 'MyApp', '7f848f821b435ea8e0d1c929810a93ae19790824b2be0e684809613d32ff9753', '[\"*\"]', NULL, NULL, '2024-03-24 16:38:11', '2024-03-24 16:38:11'),
(23, 'App\\Models\\User', 1, 'MyApp', '04c7cb9fc3a1717841b6039f5334e5168e589a1e11fac89ca965ae352e85f4e4', '[\"*\"]', NULL, NULL, '2024-03-24 16:40:15', '2024-03-24 16:40:15'),
(24, 'App\\Models\\User', 1, 'MyApp', 'e2e4160fdf508cb0bf39ccbf18e7926479f3e16802bf509edb8a3b3f15ce8e18', '[\"*\"]', NULL, NULL, '2024-03-24 16:42:05', '2024-03-24 16:42:05'),
(25, 'App\\Models\\User', 1, 'MyApp', '745a4ae8b0879d27bd32d2eb7905da5d5be9ab6bd12b7e066fd25c53386c6422', '[\"*\"]', NULL, NULL, '2024-03-24 16:49:47', '2024-03-24 16:49:47'),
(26, 'App\\Models\\User', 1, 'MyApp', 'ddc2b53a1d3251675ca75e9e689b4502f53e829a1964fbcd44572217129d9a12', '[\"*\"]', NULL, NULL, '2024-03-24 16:50:07', '2024-03-24 16:50:07'),
(27, 'App\\Models\\User', 1, 'MyApp', '84f7e22d25c87fa4319e7b66c1414bc3c47f0d6cd2353596b0b65011c41937af', '[\"*\"]', NULL, NULL, '2024-03-24 16:52:49', '2024-03-24 16:52:49'),
(28, 'App\\Models\\User', 1, 'MyApp', '0e13306cd5a0f3ad144e2f4495094dd35ef8b265799a1e388724c9a45bd93763', '[\"*\"]', NULL, NULL, '2024-03-24 16:54:26', '2024-03-24 16:54:26'),
(29, 'App\\Models\\User', 1, 'MyApp', '7ef0280fc908e014531536e979399a5968ba8b14b636f15e098c416cf2bf56b7', '[\"*\"]', NULL, NULL, '2024-03-24 16:55:32', '2024-03-24 16:55:32'),
(30, 'App\\Models\\User', 1, 'MyApp', 'da54955406ded47a4df193a2e5eec1c64530cfb8bb6d9516495dd4daa8db6ebd', '[\"*\"]', NULL, NULL, '2024-03-24 17:05:52', '2024-03-24 17:05:52'),
(31, 'App\\Models\\User', 1, 'MyApp', 'c0dfb7c7227833b94ad03fc5ec8bb118d09980dd91248d740712280d1ee47585', '[\"*\"]', NULL, NULL, '2024-03-24 17:07:38', '2024-03-24 17:07:38'),
(32, 'App\\Models\\User', 1, 'MyApp', '5b9276ada38d6c756cf9867c4d7fdfcec3527cf7ca0882b970d24c2aed7ec21e', '[\"*\"]', NULL, NULL, '2024-03-24 17:08:51', '2024-03-24 17:08:51'),
(33, 'App\\Models\\User', 1, 'MyApp', '9bdf205a3946aa2116f57f5908aff58c5f8be7a98640bb7c25c878f1777ec9aa', '[\"*\"]', NULL, NULL, '2024-03-24 17:15:30', '2024-03-24 17:15:30'),
(34, 'App\\Models\\User', 1, 'MyApp', 'b7762b41ffc19e392c8b4fa96c9baac794457e6023a3752e7f8220549f96acef', '[\"*\"]', NULL, NULL, '2024-03-24 17:16:18', '2024-03-24 17:16:18'),
(35, 'App\\Models\\User', 1, 'MyApp', 'fcd0660d0252b8a34d3acf7fe7f0b2b25a7c7c3381c7a1f2393b6cb26612accb', '[\"*\"]', NULL, NULL, '2024-03-24 17:17:28', '2024-03-24 17:17:28'),
(36, 'App\\Models\\User', 1, 'MyApp', '65e15af382df995ad4d7eaeede3a62520ff5da5f13f444e03a96eb22cc976be9', '[\"*\"]', NULL, NULL, '2024-03-24 17:18:56', '2024-03-24 17:18:56'),
(37, 'App\\Models\\User', 1, 'MyApp', '47c950a56bbb3f922a425c12ea6b9aafb71cf091846c91df1185217115114b4d', '[\"*\"]', NULL, NULL, '2024-03-24 17:26:29', '2024-03-24 17:26:29'),
(38, 'App\\Models\\User', 2, 'MyApp', 'aa7dc0a3de6c40e79fedaec99b17bea2c47f1b53dbe6cbd2d74bcb1ac4adff23', '[\"*\"]', NULL, NULL, '2024-03-24 19:31:34', '2024-03-24 19:31:34'),
(39, 'App\\Models\\User', 1, 'MyApp', 'bcc3e55d46f329fcc4708dc86fee90e54dfedc0e86b7a1847882940f2a89a065', '[\"*\"]', NULL, NULL, '2024-03-24 19:36:29', '2024-03-24 19:36:29'),
(40, 'App\\Models\\User', 2, 'MyApp', '683d2bc23117962f35db2d15927d4ba9694821138c91c87d2733839c07a51792', '[\"*\"]', NULL, NULL, '2024-03-24 19:43:20', '2024-03-24 19:43:20'),
(41, 'App\\Models\\User', 1, 'MyApp', '75c7d9a852e83cad093363f708b502fc175d4e4c0cd6be1854a8700a5dc657e4', '[\"*\"]', NULL, NULL, '2024-03-24 19:44:10', '2024-03-24 19:44:10'),
(42, 'App\\Models\\User', 1, 'MyApp', '75d26440d8fac141b7f6469c7597f9efc645fd737023fc7ba245bdf379420482', '[\"*\"]', NULL, NULL, '2024-03-24 19:51:16', '2024-03-24 19:51:16'),
(43, 'App\\Models\\User', 1, 'MyApp', '92bd004376990da2a99cffc7947fdcb86cf3f7957463a01c00aa64416f321b5c', '[\"*\"]', NULL, NULL, '2024-03-24 19:54:16', '2024-03-24 19:54:16'),
(44, 'App\\Models\\User', 2, 'MyApp', 'cd9a18d235b755b6eb2ab613b36654e43f1153745bc39de81850ff63e7ab8995', '[\"*\"]', NULL, NULL, '2024-03-24 19:57:25', '2024-03-24 19:57:25'),
(45, 'App\\Models\\User', 2, 'MyApp', '53b10814bf608b647e8c7b69c8c40f94563d2b019e6924cee4ea374cfe4db730', '[\"*\"]', NULL, NULL, '2024-03-24 20:04:02', '2024-03-24 20:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$wFs4hQnYYyLHX3HY1KoNauHXV1Ug2J3dFmp9vZLHnkEGeaqvc.abm', NULL, '2024-03-19 17:23:46', '2024-03-19 17:23:46'),
(2, 'User', 'dlarka07@gmail.com', NULL, '$2y$10$Axcpneo7qDZEd4CdEBCnXeoO/8FsdmQzdmHzoTj9rUtLpL5E5ZCzq', NULL, '2024-03-24 19:30:43', '2024-03-24 19:30:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
