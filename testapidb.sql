-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2021 at 04:23 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testapidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ch_messages`
--

CREATE TABLE `ch_messages` (
  `id` bigint(20) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `body` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_profiles`
--

CREATE TABLE `company_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_08_24_080559_create_sessions_table', 1),
(7, '2021_08_24_084652_create_posts_table', 1),
(8, '2021_09_15_070728_create_company_profiles_table', 2),
(9, '2021_12_07_064419_add__gender_to_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('snhasan05@gmail.com', '$2y$10$dDj53lnSK9/zRl5P2PgXEOtA/I9xAZShcthKzZoGB1MpFHZXV/IQ2', '2021-12-06 23:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `designation`, `created_at`, `updated_at`) VALUES
(1, 'ahsan', 'ao', '2021-10-17 03:19:18', '2021-10-17 03:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('qt5xTUYc2Bw7aeXijmwGsx57XLvAc8Qm8Jlpg0QV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicEhlSk8yWHAxZXVHTTJnVW1sSlpaVGxCZm95Q09aZm9IcG9yZ1JKaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1638974310),
('VypnJk2Wmev2OIGFxRitkDFBhpH93r1sneMvesy6', 7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiakxuZk4xbEFURnk5ZjJnMGdOS0RCNjBPY01BTjBzUWFxczFVblZ0biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGF0aWZ5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NztzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDVFWkFqUG1NSUlabjYzQ09ud252WHUxVzk3Y3ZRN1dLZ1JDU3hwTzQ5ckEwT0VQcFQyazRhIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCQ1RVpBalBtTUlJWm42M0NPbndudlh1MVc5N2N2UTdXS2dSQ1N4cE80OXJBME9FUHBUMms0YSI7fQ==', 1638975952),
('zxioMFIEQRNNqksH2nP9npvvkB9NCkTYwvP0No9p', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiVzBHOHZIeEM0dUhqU1pmVngzRGtzeGhzbTRQVDJ6YkpVeEVzeWRBbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGF0aWZ5LzciO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkMnJacWg3ekNJZ2JidmR1VkV4T2lJT21XNGcyVkNFYVlWSDBIMnNmT3JiSTNzbTlqdkNjSjIiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDJyWnFoN3pDSWdiYnZkdVZFeE9pSU9tVzRnMlZDRWFZVkgwSDJzZk9yYkkzc205anZDY0oyIjt9', 1638976961),
('rbqutPrtgLf1XTwnUbhC3i2TM8wnjUw1CumrbfH2', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMTl1NU90a1BBRmRKMGVVejlEemlYb3dsbkxIMjdIQlUxWWd3bU1aYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGF0aWZ5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHguNXloWXU5MFcvTHZqLjYxWWd6RGVpL0tWMmdNZFpkTjFhMTN4WjhjWlFBU25aRlpzZjNTIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCR4LjV5aFl1OTBXL0x2ai42MVlnekRlaS9LVjJnTWRaZE4xYTEzeFo4Y1pRQVNuWkZac2YzUyI7fQ==', 1638976641),
('RAOberZjagw2p7ok4ctcyhlgYFjT4LCRI0CqDtmJ', 7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoibk9BZUhHVlNQNDRDUVdUeGE3bklBR1hsYzZIclRLRDVSbVlkTVlCZyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvY2hhdGlmeSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjc7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ1RVpBalBtTUlJWm42M0NPbndudlh1MVc5N2N2UTdXS2dSQ1N4cE80OXJBME9FUHBUMms0YSI7fQ==', 1638976641);

-- --------------------------------------------------------

--
-- Table structure for table `userrelation`
--

CREATE TABLE `userrelation` (
  `id` int(10) NOT NULL,
  `primaryUser` int(10) DEFAULT NULL,
  `secondaryUser` int(10) DEFAULT NULL,
  `liked` int(11) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userrelation`
--

INSERT INTO `userrelation` (`id`, `primaryUser`, `secondaryUser`, `liked`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(29, 1, 3, 1, 1, '2021-12-08 09:16:26', NULL, '2021-12-08 09:16:26'),
(30, 1, 7, 1, 1, '2021-12-08 09:28:24', NULL, '2021-12-08 09:28:24'),
(31, 1, 3, 1, 1, '2021-12-08 09:33:24', NULL, '2021-12-08 09:33:24'),
(32, 7, 1, 1, 7, '2021-12-08 09:33:58', NULL, '2021-12-08 09:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `dob`, `latitude`, `longitude`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `gender`) VALUES
(1, 'Syed Nasrul ', 'snhasan05@gmail.com', NULL, '$2y$10$x.5yhYu90W/Lvj.61YgzDei/KV2gMdZdN1a13xZ8cZQASnZFZsf3S', '1995-12-10', 23.7538717, 90.391831, NULL, NULL, 'H7VPPrD2tJYdomMV0NC0DNlRnAF6QVmDfiCXLeDDgu9RS96u74AGoCZh5UV9', NULL, 'profile-photos/Gy0A7tRXB96sdUK0x5pFOHNEuyMRUepaXwBEaaz4.png', '2021-09-14 22:24:00', '2021-12-08 02:27:14', 'Male'),
(2, 'ahsan', 'ahsan@mail.com', NULL, '$2y$10$eDX0FNvfBRHB4AU3w/kqWON3c40rsoXbQTmWgakZQPqwPalaQpjDK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-19 00:20:41', '2021-10-19 00:20:41', NULL),
(3, 'syed', 'hasan.syed011@gmail.com', NULL, '$2y$10$2rZqh7zCIgbbvduVExOiIOmW4g2VCEaYVH0H2sfOrbI3sm9jvCcJ2', '2000-02-15', 23.7508961, 90.3842619, NULL, NULL, 'kSMSeNaAQSZmeNOXz0cR5OVHGrj6NXBES6vUnJHiEkCvRF1cSjeCBNv9c0JV', NULL, 'profile-photos/thlVhZRMZRnQkRim2f6PZD53LPcA45hM4l6iHfjY.jpg', '2021-12-06 23:00:27', '2021-12-07 22:32:32', 'Male'),
(4, 'Ripon', 'ripon@mail.com', NULL, '$2y$10$WvnlZzk2LqgkOIysUjJCgOS/FiSOa2e9xkqxW7ttd/dRO.ryXcVya', '1997-07-09', 23.7539503, 90.3918682, NULL, NULL, NULL, NULL, 'profile-photos/BM3dOZP757reMHB5tRXByg4kA2jFAYlp21luxaVQ.jpg', '2021-12-08 02:27:49', '2021-12-08 02:29:14', 'Male'),
(5, 'kamrul', 'kamrul@mail.com', NULL, '$2y$10$dqc7fHaO4wT8PsDaDD.Ym.ZYDGMMCTR6Lx4lCJDfCuhjJkzXyrIJG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-08 02:29:49', '2021-12-08 02:29:49', NULL),
(6, 'anika', 'anika@mail.com', NULL, '$2y$10$myahVblr82tKt8M6s39xjeJ3ZolGgSxfvlYRoMV1BlVCudt2tkSIy', '1997-01-28', 23.750746, 90.440813, NULL, NULL, NULL, NULL, 'profile-photos/HN6VydlcLUdEzUu0GoTL1XocgJX2OmWsBdhd6fT9.jpg', '2021-12-08 02:31:20', '2021-12-08 07:52:03', 'Female'),
(7, 'jessica', 'jessica@mail.com', NULL, '$2y$10$5EZAjPmMIIZn63COnwnvXu1W97cvQ7WKgRCSxpO49rA0OEPpT2k4a', '2000-06-06', 23.7538917, 90.3918391, NULL, NULL, NULL, NULL, 'profile-photos/H9Vcv1TmFAY9IUhRbQiRcDGS3eDKwbuDiOb1DfJe.png', '2021-12-08 02:39:33', '2021-12-08 02:50:15', 'Female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ch_messages`
--
ALTER TABLE `ch_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_profiles`
--
ALTER TABLE `company_profiles`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
