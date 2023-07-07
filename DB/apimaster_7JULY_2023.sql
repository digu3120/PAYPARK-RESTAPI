-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2023 at 03:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apimaster`
--

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
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_09_112042_create_images_table', 1),
(6, '2023_06_14_081600_create_slides_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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
(1, 'App\\Models\\User', 2, 'Personal Access Token', '3e4a6247fac257cef037c48bef4c09ad09623fe07e04cb4fedfd9c01b6a7b2bf', '[\"*\"]', NULL, NULL, '2023-06-23 06:45:07', '2023-06-23 06:45:07'),
(2, 'App\\Models\\User', 2, 'Personal Access Token', 'a17f4171a4649ce4bb0d779daa7483006b9660dde56064ccf647210c6e6f93a3', '[\"*\"]', NULL, NULL, '2023-06-23 06:47:52', '2023-06-23 06:47:52'),
(3, 'App\\Models\\User', 2, 'Personal Access Token', '8d8072ca607340ff56b14b13381487e954549c72ba0144543c577bcacfd49809', '[\"*\"]', NULL, NULL, '2023-06-23 06:48:08', '2023-06-23 06:48:08'),
(4, 'App\\Models\\User', 1, 'Personal Access Token', '62dd275cf7a669a5665329d1d3b0fc49a9a350665c058d58be80d52142ec166c', '[\"*\"]', NULL, NULL, '2023-06-23 07:33:32', '2023-06-23 07:33:32'),
(5, 'App\\Models\\User', 2, 'Personal Access Token', 'b86bd3da432f4b6fe4e8de7ed80632303a5d29a17da6d5ec3aa13e22ae58f3dd', '[\"*\"]', NULL, NULL, '2023-06-23 08:12:43', '2023-06-23 08:12:43'),
(6, 'App\\Models\\User', 2, 'Personal Access Token', 'ce1c7845e7ace20eda228bb969904dec18971f2c99ed0b0a3f5a7c2ae015132c', '[\"*\"]', NULL, NULL, '2023-06-23 08:13:43', '2023-06-23 08:13:43'),
(7, 'App\\Models\\User', 2, 'Personal Access Token', 'ffee5c0113d34e0f1e71f76872ca7b5e151455eec4aa2b9e1e73cddd12ffdc81', '[\"*\"]', NULL, NULL, '2023-06-23 08:13:46', '2023-06-23 08:13:46'),
(8, 'App\\Models\\User', 2, 'Personal Access Token', '0a3fde39f5d2b79c201c4e05715064280c84f403f26215811c16085ec4175ce3', '[\"*\"]', NULL, NULL, '2023-06-23 08:13:49', '2023-06-23 08:13:49'),
(9, 'App\\Models\\User', 2, 'Personal Access Token', 'bf01fcae0832836a5c4b4911a24abe8f1bc343da734dee0b2ece4d36e3bb36d1', '[\"*\"]', NULL, NULL, '2023-06-29 01:39:40', '2023-06-29 01:39:40'),
(10, 'App\\Models\\User', 2, 'Personal Access Token', '618a63299522969b99c67efb172fb84a94202e6bd17be65872000aaba909c66c', '[\"*\"]', NULL, NULL, '2023-06-29 02:20:03', '2023-06-29 02:20:03'),
(11, 'App\\Models\\User', 2, 'Personal Access Token', 'eaabc8af3c353c136badd096e486f35afdb3b0759470f6c435e2cfae7171ecbb', '[\"*\"]', NULL, NULL, '2023-06-29 02:29:47', '2023-06-29 02:29:47'),
(12, 'App\\Models\\User', 2, 'Personal Access Token', '0fe54bd9346fbd47f45e1f05c8c30f6d27b99822ba789f28eddc95b0b7b8d7e3', '[\"*\"]', NULL, NULL, '2023-07-03 03:33:35', '2023-07-03 03:33:35'),
(13, 'App\\Models\\User', 2, 'Personal Access Token', '4191407fa9e3f78299476e01fc28f7866e48c4b342e4ee474cca68a918428a7a', '[\"*\"]', NULL, NULL, '2023-07-03 03:38:58', '2023-07-03 03:38:58'),
(14, 'App\\Models\\User', 2, 'Personal Access Token', 'e0d6cf3abafaec2da2df5dcc76c97d0ce2ea9d699cf302006f88a7788b8454f8', '[\"*\"]', NULL, NULL, '2023-07-03 03:39:23', '2023-07-03 03:39:23'),
(15, 'App\\Models\\User', 2, 'Personal Access Token', '1a6486ca24cbdd06397b6be0a5cddc939348ed2031610986d215948f05f71012', '[\"*\"]', NULL, NULL, '2023-07-03 03:44:01', '2023-07-03 03:44:01'),
(16, 'App\\Models\\User', 2, 'Personal Access Token', '3c69833d4a90ef525f7b2adf2d2a9f62623da798551f66ff206bf9e482b3fb79', '[\"*\"]', NULL, NULL, '2023-07-03 03:44:03', '2023-07-03 03:44:03'),
(17, 'App\\Models\\User', 2, 'Personal Access Token', '1ab8c7dd0550e3f42f4e1c3766f7025d11168be628e3a6894b69448077d469e8', '[\"*\"]', NULL, NULL, '2023-07-03 03:45:01', '2023-07-03 03:45:01'),
(18, 'App\\Models\\User', 2, 'Personal Access Token', 'd2255a4fd72cdd53f684a818a548251a6f12ded2fa9baa31906d8b6a0f207ac9', '[\"*\"]', NULL, NULL, '2023-07-03 03:47:45', '2023-07-03 03:47:45'),
(19, 'App\\Models\\User', 2, 'Personal Access Token', '0c85ecbffbbb2f793de31ed2af6968d703442bd95ad4530f1a7cf325f39505c5', '[\"*\"]', NULL, NULL, '2023-07-03 03:55:18', '2023-07-03 03:55:18'),
(20, 'App\\Models\\User', 2, 'Personal Access Token', 'e10c9fb0d4a298e3f4e6273e6cb5bc571e44db251f7e18ad55825506d71efba4', '[\"*\"]', NULL, NULL, '2023-07-03 04:07:59', '2023-07-03 04:07:59'),
(21, 'App\\Models\\User', 2, 'Personal Access Token', 'e2a6c82985fe7cce2bcb2e1bad92fc87b2c4aa10f1c5b09221574b5212b4b9ec', '[\"*\"]', NULL, NULL, '2023-07-03 04:09:38', '2023-07-03 04:09:38'),
(22, 'App\\Models\\User', 2, 'Personal Access Token', 'b384bc79bf13d9afaebdccd0d40a5b6992e1901afc639376f586c2299ed4a6f5', '[\"*\"]', NULL, NULL, '2023-07-03 05:07:27', '2023-07-03 05:07:27'),
(23, 'App\\Models\\User', 2, 'Personal Access Token', 'bedc0e736723976f97c62562f3280eb20fe515db171a81895bd2d7d4167b53c7', '[\"*\"]', NULL, NULL, '2023-07-03 05:15:54', '2023-07-03 05:15:54'),
(24, 'App\\Models\\User', 2, 'Personal Access Token', '6d8ca1e32ac24de2f5fc7d7e92bca3791bafe9beadbce2d7613e52ad316c4394', '[\"*\"]', NULL, NULL, '2023-07-03 05:23:49', '2023-07-03 05:23:49'),
(25, 'App\\Models\\User', 2, 'Personal Access Token', 'ded1ff6b5496803a56811acf1e215322abc2b0e3e7006ac6b2454d287fbbc198', '[\"*\"]', NULL, NULL, '2023-07-03 05:28:59', '2023-07-03 05:28:59'),
(26, 'App\\Models\\User', 2, 'Personal Access Token', '86f18fa1798fba08892dc34af3774b2b1748d2117cad0ed9ba5ee1eb6866fd35', '[\"*\"]', NULL, NULL, '2023-07-03 05:31:19', '2023-07-03 05:31:19'),
(27, 'App\\Models\\User', 1, 'Personal Access Token', '4ed0a6a2debb9b6d407f1c127b4dbccc99c3f81d8a0979f1efa0f9e08f412204', '[\"*\"]', NULL, NULL, '2023-07-03 05:34:08', '2023-07-03 05:34:08'),
(28, 'App\\Models\\User', 1, 'Personal Access Token', 'af29c7e8bc8f49d6400f553bf4a9451382b7787771af7fa771de301dc6ff4e66', '[\"*\"]', NULL, NULL, '2023-07-03 05:36:28', '2023-07-03 05:36:28'),
(29, 'App\\Models\\User', 2, 'Personal Access Token', '935d80549412fa1f35b55d95c853d0d61ef4e317e97e95075fe0ee0b548f1e91', '[\"*\"]', NULL, NULL, '2023-07-04 03:52:02', '2023-07-04 03:52:02'),
(30, 'App\\Models\\User', 2, 'Personal Access Token', '3ee7f9ff3d3cdfd344c5008d05d4cb4be2f9ac39748ace21c923149f9b4b5544', '[\"*\"]', NULL, NULL, '2023-07-04 03:58:03', '2023-07-04 03:58:03'),
(31, 'App\\Models\\User', 2, 'Personal Access Token', '8f061c43e0c1558b4519f287599a06ba15a7aea7c842c2583094790d81f8f09f', '[\"*\"]', NULL, NULL, '2023-07-04 04:09:28', '2023-07-04 04:09:28'),
(32, 'App\\Models\\User', 2, 'Personal Access Token', '99361247638921b9733ba620abe08ed466a6b593dade5a8c040903a194d6dde9', '[\"*\"]', NULL, NULL, '2023-07-04 05:27:06', '2023-07-04 05:27:06'),
(33, 'App\\Models\\User', 2, 'Personal Access Token', '72c4759505d34e681b3c4af9428c1806831442375ab3f93589bc28b7fe06a404', '[\"*\"]', NULL, NULL, '2023-07-07 02:08:20', '2023-07-07 02:08:20'),
(34, 'App\\Models\\User', 4, 'Personal Access Token', 'd2e6b8e25f09e22f9bfe34a0a3e74ecfb1408b1b67fc7acb5624f06dbc2f6a4f', '[\"*\"]', NULL, NULL, '2023-07-07 05:19:39', '2023-07-07 05:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'parkpay', 'parkpay15@gmail.com', '8898057007', '$2y$10$2es284zhmLfUSWzfkVBYCu6IX2zxbdOU5adcwoaUaoJcfazrRPPE.', 'daf1e77fa398ea66963ebe7d3cb014da133104974e56db5179ef2bb189a67bf6', '2023-06-23 09:52:31', '2023-07-07 02:21:13'),
(2, 'tj', 'tj@gmail.com', '1234567890', '$2y$10$2es284zhmLfUSWzfkVBYCu6IX2zxbdOU5adcwoaUaoJcfazrRPPE.', '14|uUFyVHxjLhwgDjlPfxkzy0Z5jDBJJslnED4FEsHe', '2023-06-23 06:38:59', '2023-07-03 03:39:23'),
(3, 'digu', 'digu@gmail.com', '1144772255', '$2y$10$jFCHLKOsswipdh235T5rQ.FT0KtR7w1vAE54bEjD4qRwyQdeMinMu', NULL, '2023-07-07 05:03:41', '2023-07-07 05:03:41'),
(4, 'santosh', 'santosh@gmail.com', '5588223366', '$2y$10$x8DbUWiDA1Ahr/1oew4JuOfQOjAvvk1/ecS8mQgVRQ36kmVHvlGZC', NULL, '2023-07-07 05:17:26', '2023-07-07 05:17:26'),
(6, 'test', 'test@gmail.com', '1234567800', '$2y$10$tngtBAYdMrcC57VNLlAfae.jnfruWww1T.zdTOq3y9Tlm0s8.Vxdy', NULL, '2023-07-07 06:06:53', '2023-07-07 06:06:53'),
(13, 'test', 'test1@gmail.com', '1231515565', '$2y$10$curkTtLMpR27DrrYFWxHTulJJeImfB5rpUVorAUE6OP3xBeFDdyT.', NULL, '2023-07-07 07:41:34', '2023-07-07 07:41:34'),
(18, 'test103', 'test03@gmail.com', '1234567899', '$2y$10$ASGjE/s7Iy.InxkofcxD/etH0hkrnyW9jhgLwAhxPoz1IhOVTzIFi', NULL, '2023-07-07 07:49:24', '2023-07-07 07:49:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
