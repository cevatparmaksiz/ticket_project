-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 26 Şub 2022, 19:36:32
-- Sunucu sürümü: 10.4.13-MariaDB
-- PHP Sürümü: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ticket`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cinema`
--

CREATE TABLE `cinema` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cinemaName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cinemaAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cityId` int(11) NOT NULL,
  `cinemaNo` int(11) NOT NULL,
  `seatCount` int(11) NOT NULL,
  `flag1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `cinema`
--

INSERT INTO `cinema` (`id`, `cinemaName`, `cinemaAddress`, `cityId`, `cinemaNo`, `seatCount`, `flag1`, `flag2`, `visible`, `created_at`, `updated_at`) VALUES
(1, 'Cinemaximum', 'antalya', 11, 10, 50, '', '', 1, '2022-02-26 10:21:04', '2022-02-26 10:21:04');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cinema_attendend`
--

CREATE TABLE `cinema_attendend` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cinemaId` int(11) NOT NULL,
  `cityId` int(11) NOT NULL,
  `movieId` int(11) NOT NULL,
  `flag1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `cinema_attendend`
--

INSERT INTO `cinema_attendend` (`id`, `cinemaId`, `cityId`, `movieId`, `flag1`, `flag2`, `visible`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 8, '', '', 1, '2022-02-26 13:27:45', '2022-02-26 13:27:45');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `city`
--

CREATE TABLE `city` (
  `city_id` int(2) NOT NULL,
  `city_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `city_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `city`
--

INSERT INTO `city` (`city_id`, `city_title`, `city_key`) VALUES
(1, 'İSTANBUL', 34),
(2, 'ANKARA', 6),
(3, 'İZMİR', 35),
(4, 'BURSA', 16),
(5, 'ADANA', 1),
(6, 'ADIYAMAN', 2),
(7, 'AFYONKARAHİSAR', 3),
(8, 'AĞRI', 4),
(9, 'AKSARAY', 68),
(10, 'AMASYA', 5),
(11, 'ANTALYA', 7),
(12, 'ARDAHAN', 75),
(13, 'ARTVİN', 8),
(14, 'AYDIN', 9),
(15, 'BALIKESİR', 10),
(16, 'BARTIN', 74),
(17, 'BATMAN', 72),
(18, 'BAYBURT', 69),
(19, 'BİLECİK', 11),
(20, 'BİNGÖL', 12),
(21, 'BİTLİS', 13),
(22, 'BOLU', 14),
(23, 'BURDUR', 15),
(24, 'ÇANAKKALE', 17),
(25, 'ÇANKIRI', 18),
(26, 'ÇORUM', 19),
(27, 'DENİZLİ', 20),
(28, 'DİYARBAKIR', 21),
(29, 'KOCAELİ', 41),
(30, 'KONYA', 42),
(31, 'KÜTAHYA', 43),
(32, 'MALATYA', 44),
(33, 'MANİSA', 45),
(34, 'MARDİN', 47),
(35, 'MERSİN', 33),
(36, 'MUĞLA', 48),
(37, 'MUŞ', 49),
(38, 'NEVŞEHİR', 50),
(39, 'NİĞDE', 51),
(40, 'ORDU', 52),
(41, 'OSMANİYE', 80),
(42, 'RİZE', 53),
(43, 'SAKARYA', 54),
(44, 'SAMSUN', 55),
(45, 'SİİRT', 56),
(46, 'SİNOP', 57),
(47, 'ŞIRNAK', 73),
(48, 'SİVAS', 58),
(49, 'TEKİRDAĞ', 59),
(50, 'TOKAT', 60),
(51, 'TRABZON', 61),
(52, 'TUNCELİ', 62),
(53, 'ŞANLIURFA', 63),
(54, 'UŞAK', 64),
(55, 'VAN', 65),
(56, 'YALOVA', 77),
(57, 'YOZGAT', 66),
(58, 'ZONGULDAK', 67),
(59, 'DÜZCE', 81),
(60, 'EDİRNE', 22),
(61, 'ELAZIĞ', 23),
(62, 'ERZİNCAN', 24),
(63, 'ERZURUM', 25),
(64, 'ESKİŞEHİR', 26),
(65, 'GAZİANTEP', 27),
(66, 'GİRESUN', 28),
(67, 'GÜMÜŞHANE', 29),
(68, 'HAKKARİ', 30),
(69, 'HATAY', 31),
(70, 'IĞDIR', 76),
(71, 'ISPARTA', 32),
(72, 'KAHRAMANMARAŞ', 46),
(73, 'KARABÜK', 78),
(74, 'KARAMAN', 70),
(75, 'KARS', 36),
(76, 'KASTAMONU', 37),
(77, 'KAYSERİ', 38),
(78, 'KİLİS', 79),
(79, 'KIRIKKALE', 71),
(80, 'KIRKLARELİ', 39),
(81, 'KIRŞEHİR', 40);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(40, '2014_10_12_000000_create_users_table', 1),
(41, '2014_10_12_100000_create_password_resets_table', 1),
(42, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(43, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(44, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(45, '2016_06_01_000004_create_oauth_clients_table', 1),
(46, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(47, '2019_08_19_000000_create_failed_jobs_table', 1),
(48, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(49, '2022_02_26_114024_create_movie_table', 1),
(50, '2022_02_26_114120_crate_ticketattendend_table', 1),
(51, '2022_02_26_114146_create_cinema_table', 1),
(52, '2022_02_26_114257_create_cinemaattendend_table', 1),
(53, '2022_02_26_114320_create_ticket_table', 1),
(54, '2022_02_26_114346_create_ticketbuying_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie`
--

CREATE TABLE `movie` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movieName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movieExp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startDate` timestamp NULL DEFAULT NULL,
  `endDate` timestamp NULL DEFAULT NULL,
  `flag1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `movie`
--

INSERT INTO `movie` (`id`, `movieName`, `movieExp`, `startDate`, `endDate`, `flag1`, `flag2`, `visible`, `created_at`, `updated_at`) VALUES
(8, 'High Life', 'bilim kurgu', '2022-02-25 21:00:00', '2022-03-25 21:00:00', '', '', 1, '2022-02-26 10:32:41', '2022-02-26 10:32:41'),
(9, 'Uncharted', 'macera aksiyon', '2022-02-25 21:00:00', '2022-03-25 21:00:00', '', '', 1, '2022-02-26 14:38:31', '2022-02-26 14:38:31');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0957d122f94e43cd41034467a4e10b20a534cc788a032f0c150bef7c101999584a1aed67eed3bba4', 1, '95b12a8f-e0ec-4c28-a6e4-f000af12f6a2', 'Login', '[]', 0, '2022-02-26 10:19:28', '2022-02-26 10:19:28', '2024-08-26 13:19:28');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('95b12a8f-e0ec-4c28-a6e4-f000af12f6a2', NULL, 'Laravel Personal Access Client', 'T4dnmoQTffHiswzkBBNb422JvYGdacczX4jKJWwv', NULL, 'http://localhost', 1, 0, 0, '2022-02-26 10:19:18', '2022-02-26 10:19:18'),
('95b12a8f-e94b-4113-91fd-68ed09c221e7', NULL, 'Laravel Password Grant Client', 'W3mf0ofjTnyDbMcjwqdxT6lt6CUJu12Ls3BHw538', 'users', 'http://localhost', 0, 1, 0, '2022-02-26 10:19:18', '2022-02-26 10:19:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '95b12a8f-e0ec-4c28-a6e4-f000af12f6a2', '2022-02-26 10:19:18', '2022-02-26 10:19:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ticket`
--

CREATE TABLE `ticket` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticketName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticketPrice` double(8,2) NOT NULL,
  `ticketDiscountPrice` double(8,2) NOT NULL,
  `ticketStartDate` timestamp NULL DEFAULT NULL,
  `ticketEndDate` timestamp NULL DEFAULT NULL,
  `movieId` int(11) NOT NULL,
  `flag2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `ticket`
--

INSERT INTO `ticket` (`id`, `ticketName`, `ticketPrice`, `ticketDiscountPrice`, `ticketStartDate`, `ticketEndDate`, `movieId`, `flag2`, `visible`, `created_at`, `updated_at`) VALUES
(1, 'ticket-1', 33.00, 23.00, '2022-02-25 21:00:00', '2022-03-25 21:00:00', 8, '', 1, '2022-02-26 14:43:56', '2022-02-26 14:43:56'),
(2, 'ticket-2', 33.00, 23.00, '2022-02-25 21:00:00', '2022-03-25 21:00:00', 9, '', 1, '2022-02-26 14:44:07', '2022-02-26 14:44:07');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ticket_attendend`
--

CREATE TABLE `ticket_attendend` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticketId` int(11) NOT NULL,
  `cinemaId` int(11) NOT NULL,
  `seatNo` int(11) NOT NULL,
  `movieId` int(11) NOT NULL,
  `flag2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visible` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `ticket_attendend`
--

INSERT INTO `ticket_attendend` (`id`, `ticketId`, `cinemaId`, `seatNo`, `movieId`, `flag2`, `visible`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(2, 1, 1, 2, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(3, 1, 1, 3, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(4, 1, 1, 4, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(5, 1, 1, 5, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(6, 1, 1, 6, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(7, 1, 1, 7, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(8, 1, 1, 8, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(9, 1, 1, 9, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(10, 1, 1, 10, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(11, 1, 1, 11, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(12, 1, 1, 12, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(13, 1, 1, 13, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(14, 1, 1, 14, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(15, 1, 1, 15, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(16, 1, 1, 16, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(17, 1, 1, 17, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(18, 1, 1, 18, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(19, 1, 1, 19, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(20, 1, 1, 20, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(21, 1, 1, 21, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(22, 1, 1, 22, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(23, 1, 1, 23, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(24, 1, 1, 24, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(25, 1, 1, 25, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(26, 1, 1, 26, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(27, 1, 1, 27, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(28, 1, 1, 28, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(29, 1, 1, 29, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(30, 1, 1, 30, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(31, 1, 1, 31, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(32, 1, 1, 32, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(33, 1, 1, 33, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(34, 1, 1, 34, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(35, 1, 1, 35, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(36, 1, 1, 36, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(37, 1, 1, 37, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(38, 1, 1, 38, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(39, 1, 1, 39, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(40, 1, 1, 40, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(41, 1, 1, 41, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(42, 1, 1, 42, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(43, 1, 1, 43, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(44, 1, 1, 44, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(45, 1, 1, 45, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(46, 1, 1, 46, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(47, 1, 1, 47, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(48, 1, 1, 48, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(49, 1, 1, 49, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(50, 1, 1, 50, 8, '', 1, '2022-02-26 14:45:55', '2022-02-26 14:45:55'),
(51, 2, 1, 1, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(52, 2, 1, 2, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(53, 2, 1, 3, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(54, 2, 1, 4, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(55, 2, 1, 5, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(56, 2, 1, 6, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(57, 2, 1, 7, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(58, 2, 1, 8, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(59, 2, 1, 9, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(60, 2, 1, 10, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(61, 2, 1, 11, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(62, 2, 1, 12, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(63, 2, 1, 13, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(64, 2, 1, 14, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(65, 2, 1, 15, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(66, 2, 1, 16, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(67, 2, 1, 17, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(68, 2, 1, 18, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(69, 2, 1, 19, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(70, 2, 1, 20, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(71, 2, 1, 21, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(72, 2, 1, 22, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(73, 2, 1, 23, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(74, 2, 1, 24, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(75, 2, 1, 25, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(76, 2, 1, 26, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(77, 2, 1, 27, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(78, 2, 1, 28, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(79, 2, 1, 29, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(80, 2, 1, 30, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(81, 2, 1, 31, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(82, 2, 1, 32, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(83, 2, 1, 33, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(84, 2, 1, 34, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(85, 2, 1, 35, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(86, 2, 1, 36, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(87, 2, 1, 37, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(88, 2, 1, 38, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(89, 2, 1, 39, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(90, 2, 1, 40, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(91, 2, 1, 41, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(92, 2, 1, 42, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(93, 2, 1, 43, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(94, 2, 1, 44, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(95, 2, 1, 45, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(96, 2, 1, 46, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(97, 2, 1, 47, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(98, 2, 1, 48, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(99, 2, 1, 49, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15'),
(100, 2, 1, 50, 9, '', 1, '2022-02-26 14:46:15', '2022-02-26 14:46:15');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ticket_buying`
--

CREATE TABLE `ticket_buying` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticketattendendId` int(11) NOT NULL,
  `cinemaId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `ticketCount` int(11) NOT NULL,
  `seatNo` int(11) NOT NULL,
  `expiryDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `ticket_buying`
--

INSERT INTO `ticket_buying` (`id`, `ticketattendendId`, `cinemaId`, `userId`, `ticketCount`, `seatNo`, `expiryDate`, `visible`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 4, 1, '2022-02-26 17:40:10', 1, '2022-02-26 15:25:51', '2022-02-26 15:25:51'),
(2, 2, 1, 1, 4, 2, '2022-02-26 14:40:10', 1, '2022-02-26 15:25:51', '2022-02-26 15:25:51'),
(3, 3, 1, 1, 4, 3, '2022-02-26 14:40:10', 1, '2022-02-26 15:25:51', '2022-02-26 15:25:51'),
(4, 4, 1, 1, 4, 4, '2022-02-26 14:40:10', 1, '2022-02-26 15:25:51', '2022-02-26 15:25:51');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'a', 'a@hhh.com', NULL, '$2y$10$m/E0NsJqvawliGAkITt3R.emUhhlxzy0XxjmyWWaMvYcf9KwDUg1i', NULL, '2022-02-26 10:18:55', '2022-02-26 10:18:55');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `cinema_attendend`
--
ALTER TABLE `cinema_attendend`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Tablo için indeksler `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Tablo için indeksler `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Tablo için indeksler `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Tablo için indeksler `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Tablo için indeksler `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `ticket_attendend`
--
ALTER TABLE `ticket_attendend`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `ticket_buying`
--
ALTER TABLE `ticket_buying`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `cinema`
--
ALTER TABLE `cinema`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `cinema_attendend`
--
ALTER TABLE `cinema_attendend`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Tablo için AUTO_INCREMENT değeri `movie`
--
ALTER TABLE `movie`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `ticket_attendend`
--
ALTER TABLE `ticket_attendend`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Tablo için AUTO_INCREMENT değeri `ticket_buying`
--
ALTER TABLE `ticket_buying`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
