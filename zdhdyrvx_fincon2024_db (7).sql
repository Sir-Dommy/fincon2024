-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 17, 2024 at 06:40 PM
-- Server version: 5.7.42
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zdhdyrvx_fincon2024_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'support@fincon2024.co.ke', NULL, '$2y$10$R2Jhg63vJAP/lMX9zDgZAevQ4yNiBdktQtF4TTa2SKiRVJhyZf4ZO', 'nfPRx6AfrXNgCqRNnpxuPNRXAwedDZvmH8Shhif4emUAjvmG2quSJj5Bs3ZG', '2023-04-08 17:04:53', '2023-04-08 17:04:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agendas`
--

CREATE TABLE `agendas` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_type` enum('arrival-registration','major-session','minor-session','break-session') NOT NULL,
  `agenda_type` enum('arrival-registration','major-session','minor-session','break-session') NOT NULL,
  `short_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `session_date` date NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `position` int(11) NOT NULL,
  `venue_room_id` int(11) NOT NULL,
  `contact_person` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('draft','scheduled','cancelled') NOT NULL,
  `cover_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agendas`
--

INSERT INTO `agendas` (`id`, `code`, `title`, `session_type`, `agenda_type`, `short_desc`, `session_date`, `from_time`, `to_time`, `position`, `venue_room_id`, `contact_person`, `phone`, `email`, `status`, `cover_img`, `event_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'REG1', 'Registration of Delegates', 'break-session', 'arrival-registration', 'Online Registration of Delegates and Exhibitors Currently Ongoing.', '2024-09-25', '07:30:00', '08:30:00', 1, 4, 'Collins', '0729908741', 'chegzcol@gmail.com', 'draft', '130624registration-of-delegates.jpg', 1, '2024-06-13 03:19:41', '2024-08-08 12:45:55', NULL),
(2, 'SESSION1', 'Official Opening', 'major-session', 'arrival-registration', '<u>Topics</u>\r\n<ul>\r\n<li>Financial inclusion-BETA approach</li>\r\n<li>Green finance/ climate change/ ESG</li>\r\n<li>Sector Regulatory Framework </li>\r\n<li>Sector funding (Government spearheaded) </li>\r\n</ul>\r\n<u>Panelist</u>\r\n<ul>\r\n<li>Amb. Gunnar Andreas Holm, Royal Norwegian Embassy in Nairobi </li>\r\n<li>Dr. Kamau Thuge, Governor CBK.</li>\r\n<li>Ambassador Sarah J. C. Serem CBS Chair, Post Office Savings Bank </li>\r\n<li>Tamara Cook, CEO FSD-K</li>\r\n<li>Oscar Murigi - Chairman AMFI-K</li>\r\n<li>CEO KDC </li>\r\n</ul>', '2024-09-25', '08:30:00', '10:00:00', 2, 1, 'Wanjiru Juliana', '+254 711 529575', 'info@fincon2024.co.ke', 'draft', '090824official-opening.png', 1, '2024-06-13 03:30:28', '2024-08-09 10:38:54', NULL),
(3, 'BREAK1', 'Health Break / Exhibition Tour / Investor Engagement', 'break-session', 'arrival-registration', 'Setting the Conference Tone', '2024-09-25', '10:30:00', '11:00:00', 3, 2, 'Wanjiru Juliana', '+254 711 529575', 'info@fincon2024.co.ke', 'draft', '140624health-break-exhibition-tour-investor-engagement.jpg', 1, '2024-06-13 03:33:08', '2024-08-09 14:54:27', NULL),
(4, 'SESSION2', 'Impact of Financial Inclusion in Kenya', 'minor-session', 'arrival-registration', '<p><b>Key Note:</b> Impact of financial inclusion in Kenya - To what extend has Kenya\'s financial inclusion been fair, inclusive and value adding.</p>', '2024-09-25', '11:00:00', '12:00:00', 4, 3, 'Wanjiru Juliana', '+254 711 529575', 'info@fincon2024.co.ke', 'draft', '130624technology-digitization-data.jpg', 1, '2024-06-13 03:38:53', '2024-08-09 14:57:10', NULL),
(5, 'SESSION3', 'Technology, Digitisation and Research', 'minor-session', 'arrival-registration', '<p><b>Key Note:</b> Positioning Research and Data for Sustainable Investments and effective inclusion  - decision making anchored on data.</p>', '2024-09-25', '12:15:00', '13:15:00', 5, 2, 'Beverly', '0777777777', 'bev@icloud.com', 'draft', '130624sectorial-dialogue-public-private-sector.jpeg', 1, '2024-06-13 03:42:51', '2024-08-09 14:59:36', NULL),
(6, 'BREAK2', 'Health Break / Exhibition Tour / Investor Engagement', 'break-session', 'arrival-registration', 'Health Break / Exhibition Tour / Investor Engagement', '2024-09-25', '13:15:00', '14:15:00', 6, 3, 'Wanjiru Juliana', '+254 711 529575', 'info@fincon2024.co.ke', 'draft', '140624health-break-exhibition-tour-investor-engagement.jpg', 1, '2024-06-13 03:45:12', '2024-08-09 15:00:16', NULL),
(7, 'SESSION4', 'Investor Engagement', 'minor-session', 'arrival-registration', '<p><b>Key Note:</b> Effective collaboration in driving sustainable inclusion - Interrogating perennial Informality of the sector and ease of doing Business.</p>', '2024-09-25', '14:15:00', '16:00:00', 7, 1, 'Wanjiru Juliana', '+254 711 529575', 'info@fincon2024.co.ke', 'draft', '130624keynote-speach.jpeg', 1, '2024-06-13 03:50:03', '2024-08-09 15:01:44', NULL),
(8, 'ARRIVALREG2', 'Investor Networking Breakfast', 'break-session', 'arrival-registration', 'Investor Networking Breakfast', '2024-09-26', '07:00:00', '08:30:00', 8, 1, 'Beverly Simiyu', '07722727', 'bev@icloud.com', 'draft', '160624investor-networking-breakfast.jpg', 1, '2024-06-13 03:53:20', '2024-08-09 15:03:32', NULL),
(9, 'SESSION5', 'Regulatory Disclosure', 'minor-session', 'arrival-registration', '<p><b>Key Note:</b> Enhancing financial inclusion through policies, regulations and national strategy - Interrogating effective policies, regulatory framework and national strategy - Bridging the regulatory gap for sustainable inclusion.</p>', '2024-09-26', '08:30:00', '10:30:00', 9, 2, 'Beverly Simiyu', '08888909999', 'bev@icloud.com', 'draft', '090824regulatory-disclosure.jpeg', 1, '2024-06-13 03:56:10', '2024-08-09 15:05:18', NULL),
(10, 'BREAK4', 'Health Break / Exhibition Tour / Investor Engagement', 'break-session', 'arrival-registration', 'Health Break / Exhibition Tour / Investor Engagement', '2024-09-26', '10:30:00', '11:00:00', 10, 3, 'Wanjiru Juliana', '+254 711 529575', 'info@fincon2024.co.ke', 'draft', '150624health-break-exhibition-tour-investor-engagement.jpg', 1, '2024-06-13 03:58:19', '2024-08-08 12:52:10', NULL),
(11, 'SESSION6', 'Livelihoods & Impact', 'minor-session', 'arrival-registration', '<p><b>Key Note:</b> Bridging Inclusion and Innovation to improve people\'s livelihoods at the bottom of the pyramid - The unmet financial need of key livelihood segments. (When do we say a household id financially included - interrogating the level of transformation.</p>', '2024-09-26', '11:00:00', '13:00:00', 11, 2, 'Wanjiru Juliana', '+254 711 529575', 'info@fincon2024.co.ke', 'draft', '130624closing-ceremony.jpeg', 1, '2024-06-13 03:59:25', '2024-08-08 12:52:34', NULL),
(12, 'BREAK5', 'Health Break / Exhibition Tour / Investor Engagement', 'break-session', 'arrival-registration', 'Health Break / Exhibition Tour / Investor Engagement', '2024-09-26', '13:00:00', '14:00:00', 12, 3, 'Wanjiru Juliana', '+254 711 529575', 'info@fincon2024.co.ke', 'draft', '130624networking-tea.jpeg', 1, '2024-06-13 04:01:51', '2024-08-08 12:53:00', NULL),
(13, 'SESSION7', 'Environmental Social Governance ESG/SEPM', 'minor-session', 'arrival-registration', '<p><b>Key Note:</b> Effective financial inclusion policies, regulations and national strategies to promote inclusive green finance in Kenya.</p>', '2024-09-26', '14:00:00', '15:00:00', 13, 3, 'Wanjiru Juliana', '+254721382644', 'info@fincon2024.co.ke', 'draft', '150624environmental-social-governance-esgsepm.jpg', 1, '2024-06-15 10:03:40', '2024-08-08 12:53:30', NULL),
(14, 'SESSION8', 'Official Closing', 'major-session', 'arrival-registration', '<p><b>Closing Ceremony</b> Oscar Murigi - Chair AMFI-K', '2024-09-26', '15:00:00', '16:00:00', 14, 1, 'Wanjiru Juliana', '+254721382644', 'info@fincon2024.co.ke', 'draft', '150624official-closing.jpg', 1, '2024-06-15 10:05:56', '2024-08-09 15:08:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agenda_speakers`
--

CREATE TABLE `agenda_speakers` (
  `id` int(11) NOT NULL,
  `agenda_id` int(11) NOT NULL,
  `speaker_id` int(11) NOT NULL,
  `speaker_type` enum('speaker','moderator','pannelist','assistant') NOT NULL,
  `topic` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_uploads`
--

CREATE TABLE `bank_uploads` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `upload_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank_uploads`
--

INSERT INTO `bank_uploads` (`id`, `order_id`, `user_id`, `upload_file`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 88, 651, 'banklisp1725722334.pdf', '2024-09-07 12:18:54', '2024-09-07 12:18:54', NULL),
(2, 89, 652, 'banklisp1725722777.pdf', '2024-09-07 12:26:17', '2024-09-07 12:26:17', NULL),
(3, 90, 653, 'banklisp1725722909.pdf', '2024-09-07 12:28:29', '2024-09-07 12:28:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `cover_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `desc`, `cover_img`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Exhibitiion', 'This is the vents where people come and exhibit their works. And i love it very much.', NULL, '2023-04-09 04:16:32', '2023-04-09 04:38:04', '2023-04-09 04:38:04'),
(2, 'Meetings', 'this is where people converge to discuss something of importance to them. What the hell.', NULL, '2023-04-09 04:22:42', '2023-08-15 17:16:13', NULL),
(3, 'Exhibitions', 'This is my favourite event of all time where people gather to listen to a musician perform their songs. I love it.', NULL, '2023-04-09 04:38:50', '2023-08-15 17:15:50', NULL),
(4, 'Conferences', 'Meeting are small events where people discuss things of importance', NULL, '2023-04-09 06:12:14', '2023-08-15 17:16:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `comment`, `parent_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'This is the first comment of the guest to see if a guest can really comment on stuff about national importance.', NULL, 19, '2023-04-29 10:47:54', '2023-04-29 10:47:54', NULL),
(2, 1, 'This is another comment that wil make the people of the nation to come and do all the things that are require for the benefit of the country.', NULL, 20, '2023-04-29 10:49:06', '2023-04-29 10:49:06', NULL),
(3, 1, 'This is comment of ichungwa to the poeple of azimio that tyhey may stop alll their demos so that they can have a dialoge and discuss the things that will benefit the country.', NULL, 21, '2023-04-29 10:50:38', '2023-04-29 10:50:38', NULL),
(4, 1, 'We like to comment', NULL, 12, '2023-04-29 10:53:20', '2023-04-29 10:53:20', NULL),
(5, 1, 'When i say that i want to comment to the people of the new club but they say that Maria is a piece of shit that can do all the work without knowing how to tell what is the difference between good and bad.', NULL, 12, '2023-04-29 15:03:58', '2023-04-29 15:03:58', NULL),
(6, 1, 'I like this comment from danston omari Ithink I will make him a good lawyer but hes fucked up', 1, 12, '2023-04-29 15:47:57', '2023-04-29 15:47:57', NULL),
(7, 1, 'But i can say that nothing is wrong man', 1, 12, '2023-04-29 15:50:16', '2023-04-29 15:50:16', NULL),
(8, 1, 'Olisa I will kick your ass man if you dont say am the president of the country', 2, 12, '2023-04-29 15:50:47', '2023-04-29 15:50:47', NULL),
(9, 1, 'Ichungwa I will say that the debate go on but you have to remove that guy from azimio who mught give out our secrest', 3, 12, '2023-04-29 15:52:34', '2023-04-29 15:52:34', NULL),
(10, 1, 'I go home ano', NULL, 12, '2023-04-29 15:52:50', '2023-04-29 15:52:50', NULL),
(11, 1, 'Dan you are an idiot to sday tha you can beat Ruto and he is the president who does not want to say hi', 1, 13, '2023-04-29 15:53:50', '2023-04-29 15:53:50', NULL),
(12, 1, 'Just go and sleep man I am the nigger who does it', 10, 13, '2023-04-29 15:54:13', '2023-04-29 15:54:13', NULL),
(13, 1, 'An this is my comment to the people who dont know how to play the game for the people who play the game for those who would like to go and dance with the', NULL, 13, '2023-04-29 15:55:02', '2023-04-29 15:55:02', NULL),
(14, 2, 'This is my comment to the people pf the Kitale town, who thinhk that hey can be the ruler of the town without my permission. let this be a message that you take in.', NULL, 13, '2023-04-29 16:40:33', '2023-04-29 16:40:33', NULL),
(15, 4, 'This is just a comment to this blog that you know must go on like a million things in the drum to make sure that all the people of the country are visiting the new place and church.', NULL, 22, '2023-05-01 11:40:06', '2023-05-01 11:40:06', NULL),
(16, 4, 'This is a comment taht I had wanted to do for you and you were not around for that.', NULL, 24, '2023-05-05 03:41:55', '2023-05-05 03:41:55', NULL),
(17, 4, 'This is a comment taht I had wanted to do for you and you were not around for that. And that is good.', NULL, 26, '2023-05-05 03:44:23', '2023-05-05 03:44:23', NULL),
(18, 4, 'This is a comment taht I had wanted to do for you and you were not around for that. And that is good.', NULL, 27, '2023-05-05 03:45:08', '2023-05-05 03:45:08', NULL),
(19, 4, 'This is a comment taht I had wanted to do for you and you were not around for that. And that is good.gg', NULL, 29, '2023-05-05 03:45:54', '2023-05-05 03:45:54', NULL),
(20, 4, 'This is the new thing that will make the people of the country to go for demonstration in the club for the purpose of things to go wrong.', NULL, 30, '2023-05-05 03:52:03', '2023-05-05 03:52:03', NULL),
(21, 4, 'This is the new thing that will make the people of the country to go for demonstration in the club for the purpose of things to go wrong.', NULL, 31, '2023-05-05 03:52:43', '2023-05-05 03:52:43', NULL),
(22, 4, 'This is the new thing that will make the people of the country to go for demonstration in the club for the purpose of things to go wrong.', NULL, 32, '2023-05-05 03:53:37', '2023-05-05 03:53:37', NULL),
(23, 4, 'This is the new thing that will make the people of the country to go for demonstration in the club for the purpose of things to go wrong.', NULL, 33, '2023-05-05 03:53:52', '2023-05-05 03:53:52', NULL),
(24, 4, 'This is a message to kithure my boss of security are dump to say that i cannot lead', NULL, 34, '2023-05-05 04:04:32', '2023-05-05 04:04:32', NULL),
(25, 2, 'This is a message to the people of Bungoma, if you dont vote me in I will not tbe the one to blame for your poverty.', NULL, 36, '2023-05-05 04:10:28', '2023-05-05 04:10:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `organizer_id` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_date` date NOT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_latitude` double DEFAULT NULL,
  `address_longitude` double DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci,
  `long_desc` text COLLATE utf8mb4_unicode_ci,
  `cover_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `code`, `title`, `slug`, `category_id`, `event_type_id`, `organizer_id`, `venue_id`, `from_date`, `start_time`, `to_date`, `end_time`, `address_address`, `address_latitude`, `address_longitude`, `website`, `short_desc`, `long_desc`, `cover_img`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'wSDlKe', 'Financial Inclusion Conference and Investor Exposition 2024', 'financial-inclusion-conference-and-investor-exposition-2024', 4, 1, 1, 1, '2024-09-25', '08:00', '2024-09-26', '20:00', NULL, NULL, NULL, 'http://fincon2024.co.ke', 'Theme: Enhancing financial inclusion - Bridging economic opportunities and Outcomes.', 'Theme: Enhancing financial inclusion - Bridging economic opportunities and Outcomes.', '1723734607financial-inclusion-conference-and-investor-exposition-2024.jpg', '2024-04-17 11:27:26', '2024-08-15 12:10:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_types`
--

INSERT INTO `event_types` (`id`, `name`, `desc`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Physical', 'This is the virtual event that people are using currently. I like it', '2023-04-09 06:24:56', '2023-04-09 06:33:32', NULL),
(2, 'Virtual', 'I like toi play with forms when they work', '2023-04-09 06:33:50', '2023-04-09 06:34:08', '2023-04-09 06:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `exhibitors`
--

CREATE TABLE `exhibitors` (
  `id` int(11) NOT NULL,
  `contact_person` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','active','inactive','terminated') NOT NULL,
  `company_logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exhibitors`
--

INSERT INTO `exhibitors` (`id`, `contact_person`, `company`, `country`, `phone`, `email`, `website`, `company_desc`, `status`, `company_logo`, `event_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test Person', 'Test Company', 'Kenya', '0722222222', 'test@mail.com', 'www.testwebsite.com', NULL, 'terminated', NULL, 1, '2024-06-14 08:12:05', '2024-06-14 08:12:05', NULL),
(2, 'George ndungu', 'Repotrans tech solutions', 'Kenya', '254727574812', 'repotranscompany@gmail.com', 'https://www.repotranstech.com', NULL, 'pending', NULL, 1, '2024-06-16 09:02:37', '2024-06-16 09:02:37', NULL),
(3, 'WILBERFORCE AMUGUNE', 'NDAKALA ADVISORY LLP', 'KENYA', '0706461393', 'wilberforce@ndakalaadvisory.co.ke', 'www.ndakalaadvisory.co.ke', NULL, 'pending', NULL, 1, '2024-06-17 07:12:56', '2024-06-17 07:12:56', NULL),
(4, 'Adrian Kariuki', 'Caritas Microfinance Bank', 'Kenya', '+254722425150', 'adrian.kariuki@caritas-mfb.co.ke', 'www.caritas-mfb.co.ke', NULL, 'pending', NULL, 1, '2024-06-18 04:38:04', '2024-06-18 04:38:04', NULL),
(5, 'BENARD KOECH', 'U&I MICROFINANCE BANK', 'Kenya', '0705111113', 'bkoech@uni-microfinance.co.ke', 'www.uni-microfinance.co.ke', NULL, 'pending', NULL, 1, '2024-06-19 07:07:16', '2024-06-19 07:07:16', NULL),
(6, 'Aggy', 'AMFi', 'Kenya', '0752657047', 'mbithiagness22@gmail.com', 'www.amfikenya.com', NULL, 'pending', NULL, 1, '2024-06-20 04:29:17', '2024-06-20 04:29:17', NULL),
(7, 'Laban Hihu Mwangi', 'hihulaban86@gmail.com', 'Kenya', '0722550206', 'hihulaban86@gmail.com', '600', NULL, 'pending', NULL, 1, '2024-06-21 11:08:42', '2024-06-21 11:08:42', NULL),
(8, 'Brian otieno omiele', 'platinum credit limited', 'Kenya', '0707937261', 'otienob674@gmail.com', NULL, NULL, 'pending', NULL, 1, '2024-06-23 04:58:16', '2024-06-23 04:58:16', NULL),
(9, 'Brian otieno omiele', 'platinum credit limited', 'Kenya', '0707937261', 'otienob674@gmail.com', NULL, NULL, 'pending', NULL, 1, '2024-06-23 04:58:41', '2024-06-23 04:58:41', NULL),
(10, 'Kennedy Karani', 'Indepth Research Institute  Limited', 'Kenya', '0792516105', 'outreach@indepthresearch.org', 'www.indepthresearch.org', NULL, 'pending', NULL, 1, '2024-06-23 17:09:54', '2024-06-23 17:09:54', NULL),
(11, 'Kennedy Karani', 'Indepth Research Institute Limited', 'Kenya', '0792516105', 'outreach@indepthresearch.org', 'https://www.indepthresearch.org/', NULL, 'pending', NULL, 1, '2024-06-24 03:15:06', '2024-06-24 03:15:06', NULL),
(12, 'Kennedy Karani', 'Indepth Research Institute Limited', 'Kenya', '0792516105', 'outreach@indepthresearch.org', 'https://www.indepthresearch.org/', NULL, 'pending', NULL, 1, '2024-06-24 03:15:50', '2024-06-24 03:15:50', NULL),
(13, 'Mercy Muthoni', 'PDM KENYA', 'Kenya', '0743753236', 'mmuthoni@pdmservices.co', NULL, NULL, 'pending', NULL, 1, '2024-06-26 08:46:03', '2024-06-26 08:46:03', NULL),
(14, 'Esdor Yahuma', 'STAR DISCOVER INSURANCE LTD', 'Kenya', '0729000408', 'eyahuma@stardiscovermicro.co.ke', 'https://www.starinsurance.co.ke/', NULL, 'pending', NULL, 1, '2024-07-29 09:25:48', '2024-07-29 09:25:48', NULL),
(15, 'Winnie Raingo', 'Jubilee Insurance', 'Kenya', '0780530144', 'winnie.raingo@advisor.jubileekenya.com', NULL, NULL, 'pending', NULL, 1, '2024-07-31 16:02:05', '2024-07-31 16:02:05', NULL),
(16, 'Andy Billy Onyango', 'Greenmove', 'Kenya', '+254793943619', 'andybilly2002@gmail.com', 'http://greenmove.unaux.com/', NULL, 'pending', NULL, 1, '2024-08-04 09:49:38', '2024-08-04 09:49:38', NULL),
(17, 'Andy Billy Onyango', 'Greenmove ltd', 'Kenya', '0793943619', 'andybilly2002@gmail.com', 'http://greenmove.unaux.com/', NULL, 'pending', NULL, 1, '2024-08-04 12:06:29', '2024-08-04 12:06:29', NULL),
(18, 'Caleb Kipkirui Bett', 'Sunesis Consulting Ltd', 'Kenya', '0780568899', 'sales@sunesiskenya.com', 'www.sunesiskenya.com', NULL, 'pending', NULL, 1, '2024-08-05 11:20:41', '2024-08-05 11:20:41', NULL),
(19, 'Faith Mungania', 'Craftmania Collections', 'KE', '+254702161603', 'fmungania80@gmail.com', NULL, NULL, 'pending', NULL, 1, '2024-08-06 08:21:41', '2024-08-06 08:21:41', NULL),
(20, 'Viona Awuor', 'UNICAF', 'Kenya', '+254725858524', 'v.ogol@kenya.unicaf.org', 'https://www.unicaf.org/about/unicaf-about-us/', NULL, 'pending', NULL, 1, '2024-08-16 02:55:40', '2024-08-16 02:55:40', NULL),
(21, 'Stephanie Nguku', 'Upscale Consulting', 'Kenya', '0722449386', 'snguku@upscaleconsulting.co.ke', 'Kilimani I Chania Avenue I Nairobi', NULL, 'pending', NULL, 1, '2024-08-19 10:44:09', '2024-08-19 10:44:09', NULL),
(22, 'Kristine Shihabira', 'Ndakala Advisory LLP', 'Kenya', '+254792605909', 'info@ndakalaadvisory.co.ke', 'www.ndakalaadvisory.co.ke', NULL, 'pending', NULL, 1, '2024-08-21 09:53:04', '2024-08-21 09:53:04', NULL),
(23, 'Nora Ikiugu', 'Mamlaka Hub and Spoke', 'Kenya', '0729712908', 'nora@mam-laka.com', 'https://mam-laka.com/', NULL, 'pending', NULL, 1, '2024-08-22 05:03:12', '2024-08-22 05:03:12', NULL),
(24, 'MAUREEN KAJUJU', 'RAFIKI MICROFINANCE BANK', 'KENYA', '+254721816130', 'mkajuju@rafiki.co.ke', 'www.rafikibank.co.ke', NULL, 'pending', NULL, 1, '2024-08-26 05:11:50', '2024-08-26 05:11:50', NULL),
(25, 'XXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXX@XXXXXXXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', NULL, 'pending', NULL, 1, '2024-08-26 07:20:21', '2024-08-26 07:20:21', NULL),
(26, 'Namonda Halubili', 'Yellow Card', 'Zambia', '26097158862', 'namonda@yellowcard.io', 'Yellowcard.io', NULL, 'pending', NULL, 1, '2024-08-26 08:16:07', '2024-08-26 08:16:07', NULL),
(27, 'Brian', 'Yellow Card', 'Kenya', '0724486178', 'brianalmasi84@gmail.com', 'https://yellowcard.io/', NULL, 'pending', NULL, 1, '2024-09-06 06:28:42', '2024-09-06 06:28:42', NULL),
(28, 'Jackline Chepz', 'Samsang', 'Kanya', '0723003706', 'jacklinechepz039@gmail.com', 'Nick.CM', NULL, 'pending', NULL, 1, '2024-09-06 10:18:15', '2024-09-06 10:18:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Social Investments', 'Social Investments', '2023-04-29 06:49:45', '2024-06-21 19:02:35', NULL),
(2, 'Financial Inclusion', 'Financial Inclusion', '2023-04-29 06:54:34', '2024-06-21 18:59:58', NULL),
(3, 'dfgfhtr', 'rhytjtrj tyhj hr', '2023-04-29 06:54:43', '2023-04-29 06:54:47', '2023-04-29 06:54:47');

-- --------------------------------------------------------

--
-- Table structure for table `group_posts`
--

CREATE TABLE `group_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_posts`
--

INSERT INTO `group_posts` (`id`, `group_id`, `post_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 2, 1, '2023-04-29 10:03:15', '2023-04-29 10:03:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `desc`, `country`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nairobi', 'Mathare N Rd', 'Kenya', '2024-04-17 11:11:19', '2024-04-17 11:11:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','pending','sent','failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `code`, `from_email`, `to_email`, `subject`, `message_content`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MSG-2024-06-24 05:04:56', 'support@fincon2024.co.ke', 'All', 'Testing Email', 'tertert', 'draft', '2024-06-24 02:04:56', '2024-06-24 02:04:56', NULL),
(2, 'MSG-2024-06-24 05:09:10', 'support@fincon2024.co.ke', 'All', 'assdd', 'ddffff', 'draft', '2024-06-24 02:09:10', '2024-06-24 02:09:10', NULL),
(3, 'MSG-2024-06-24 05:13:16', 'support@fincon2024.co.ke', 'All', 'Reminder Email to All Registered Delegates', 'Reminder Email to All Registered Delegates', 'draft', '2024-06-24 02:13:16', '2024-06-24 02:13:16', NULL),
(4, 'MSG-2024-06-24 05:21:32', 'support@fincon2024.co.ke', 'All', 'Registration Payment Reminder', 'Registration Payment Reminder', 'draft', '2024-06-24 02:21:32', '2024-06-24 02:21:32', NULL),
(5, 'MSG-2024-06-24 05:28:53', 'support@fincon2024.co.ke', 'All', 'Registration Reminder 1', 'Registration Reminder 1', 'draft', '2024-06-24 02:28:53', '2024-06-24 02:28:53', NULL),
(6, 'MSG-2024-06-24 06:30:56', 'support@fincon2024.co.ke', 'All', 'Reminder for other people with increased executiontime to 300 Again with offet', 'Reminder for other people with increased executiontime to 300 again', 'draft', '2024-06-24 03:30:56', '2024-06-24 03:30:56', NULL),
(7, 'MSG-2024-06-24 06:32:28', 'support@fincon2024.co.ke', 'All', 'REMINDER2', 'REMINDER2', 'draft', '2024-06-24 03:32:28', '2024-06-24 03:32:28', NULL),
(8, 'MSG-2024-06-24 06:39:45', 'support@fincon2024.co.ke', 'All', 'REMINDER 3', 'REMINDER 3', 'draft', '2024-06-24 03:39:45', '2024-06-24 03:39:45', NULL),
(9, 'MSG-2024-06-24 06:42:31', 'support@fincon2024.co.ke', 'All', 'Reminder 4', 'Reminder 4', 'draft', '2024-06-24 03:42:31', '2024-06-24 03:42:31', NULL),
(10, 'MSG-2024-06-24 06:54:33', 'support@fincon2024.co.ke', 'doriskimathi90@gmail.com', 'Remindere 5', 'Remindere 5', 'draft', '2024-06-24 03:54:33', '2024-06-24 03:54:33', NULL),
(11, 'MSG-2024-06-24 07:05:28', 'support@fincon2024.co.ke', 'kennedykimanzi015@gmail.com', 'REMINDER 7', 'REMINDER 7', 'draft', '2024-06-24 04:05:28', '2024-06-24 04:05:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2020_06_21_120813_create_admins_table', 1),
(9, '2023_04_08_212051_create_events_table', 2),
(10, '2023_04_08_213903_create_categories_table', 2),
(11, '2023_04_08_214457_create_event_types_table', 3),
(12, '2023_04_08_214749_create_organizers_table', 3),
(13, '2023_04_08_220511_create_venues_table', 3),
(14, '2023_04_08_221641_create_locations_table', 3),
(18, '2023_04_08_222107_create_tickets_table', 4),
(16, '2023_04_08_222559_create_customer_tickets_table', 3),
(19, '2023_04_10_113940_create_orders_table', 5),
(20, '2023_04_10_115113_create_order_items_table', 5),
(34, '2023_04_10_120035_create_order_ticket_details_table', 6),
(35, '2023_04_10_153754_create_posts_table', 6),
(36, '2023_04_10_154318_create_comments_table', 6),
(37, '2023_04_26_063609_create_tags_table', 6),
(38, '2023_04_26_072050_create_post_tags_table', 6),
(39, '2023_04_27_125849_create_groups_table', 6),
(40, '2023_04_27_130344_create_group_posts_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_s_t_k_s`
--

CREATE TABLE `mpesa_s_t_k_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `result_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merchant_request_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkout_request_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_receipt_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpesa_s_t_k_s`
--

INSERT INTO `mpesa_s_t_k_s` (`id`, `result_desc`, `result_code`, `merchant_request_id`, `checkout_request_id`, `amount`, `mpesa_receipt_number`, `transaction_date`, `phonenumber`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '34ab-403e-b643-0699f100208741695129', 'ws_CO_20082024161549840729908741', NULL, NULL, NULL, NULL, '2024-08-20 10:15:50', '2024-08-20 10:15:50'),
(2, NULL, NULL, '34ab-403e-b643-0699f100208741703655', 'ws_CO_20082024161938442729908741', NULL, NULL, NULL, NULL, '2024-08-20 10:19:38', '2024-08-20 10:19:38'),
(3, NULL, NULL, 'b7ce-4622-9675-9520b1cedd5762758973', 'ws_CO_20082024162154509729908741', NULL, NULL, NULL, NULL, '2024-08-20 10:21:54', '2024-08-20 10:21:54'),
(4, NULL, NULL, '69be-41a1-9cc1-b494e9e2076669769827', 'ws_CO_20082024162750151729908741', NULL, NULL, NULL, NULL, '2024-08-20 10:27:50', '2024-08-20 10:27:50'),
(5, NULL, NULL, '2766-4fba-b49a-c79072f32d7b69731561', 'ws_CO_20082024163821619729908741', NULL, NULL, NULL, NULL, '2024-08-20 10:38:22', '2024-08-20 10:38:22'),
(6, NULL, NULL, 'b7ce-4622-9675-9520b1cedd5762798346', 'ws_CO_20082024164940065729908741', NULL, NULL, NULL, NULL, '2024-08-20 10:49:40', '2024-08-20 10:49:40'),
(7, NULL, NULL, '9096-43a2-9c4e-15e6d7a8d8f6118553111', 'ws_CO_20082024170008196729908741', NULL, NULL, NULL, NULL, '2024-08-20 11:00:08', '2024-08-20 11:00:08'),
(8, NULL, NULL, 'f94f-4acd-a303-8fbbcf917962118926925', 'ws_CO_20082024170645781729908741', NULL, NULL, NULL, NULL, '2024-08-20 11:06:46', '2024-08-20 11:06:46'),
(9, NULL, NULL, '2a4a-467c-989e-6f5c5a331b4f69780034', 'ws_CO_20082024171136451729908741', NULL, NULL, NULL, NULL, '2024-08-20 11:11:36', '2024-08-20 11:11:36'),
(10, NULL, NULL, '4d94-4435-852d-74444a7fe48b62832520', 'ws_CO_20082024171236528729908741', NULL, NULL, NULL, NULL, '2024-08-20 11:12:36', '2024-08-20 11:12:36'),
(11, NULL, NULL, '34ab-403e-b643-0699f100208741863452', 'ws_CO_20082024173137976729908741', NULL, NULL, NULL, NULL, '2024-08-20 11:31:38', '2024-08-20 11:31:38'),
(12, NULL, NULL, 'b7ce-4622-9675-9520b1cedd5762911275', 'ws_CO_20082024180645452729908741', NULL, NULL, NULL, NULL, '2024-08-20 12:06:45', '2024-08-20 12:06:45'),
(13, NULL, NULL, '0528-4964-bbde-4f38e64fe5f173085246', 'ws_CO_22082024143927674729908741', NULL, NULL, NULL, NULL, '2024-08-22 08:39:28', '2024-08-22 08:39:28'),
(14, NULL, NULL, '34ab-403e-b643-0699f100208746783248', 'ws_CO_22082024145020631729908741', NULL, NULL, NULL, NULL, '2024-08-22 08:50:21', '2024-08-22 08:50:21'),
(15, NULL, NULL, '2766-4fba-b49a-c79072f32d7b74718629', 'ws_CO_23082024155412563741397946', NULL, NULL, NULL, NULL, '2024-08-23 09:54:15', '2024-08-23 09:54:15'),
(16, NULL, NULL, 'f94f-4acd-a303-8fbbcf917962166089535', 'ws_CO_07092024144101747729908741', NULL, NULL, NULL, NULL, '2024-09-07 08:41:02', '2024-09-07 08:41:02'),
(17, NULL, NULL, '34ab-403e-b643-0699f100208791485263', 'ws_CO_09092024102055217724803845', NULL, NULL, NULL, NULL, '2024-09-09 04:20:58', '2024-09-09 04:20:58'),
(18, NULL, NULL, '112b-4cf8-a0a0-4f49aab9f2db15831830', 'ws_CO_10092024110116900728552225', NULL, NULL, NULL, NULL, '2024-09-10 05:01:17', '2024-09-10 05:01:17'),
(19, NULL, NULL, 'feab-4d34-8ffb-457d02cd9bfc30158162', 'ws_CO_15092024164916495702540617', NULL, NULL, NULL, NULL, '2024-09-15 10:49:18', '2024-09-15 10:49:18'),
(20, NULL, NULL, 'c01d-43fe-967a-e1f71d81049d101884093', 'ws_CO_16092024131643926710488111', NULL, NULL, NULL, NULL, '2024-09-16 07:16:44', '2024-09-16 07:16:44');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trans_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `status` enum('open','pending','complete','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `trans_code`, `user_id`, `event_id`, `comments`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'iLT0250424', 1, 1, 'mpesa', 'pending', '2024-04-25 10:38:01', '2024-06-16 17:24:27', NULL),
(2, 'Culk060524', 4, 1, NULL, 'open', '2024-05-06 04:52:43', '2024-05-06 04:52:43', NULL),
(3, 'cTFx110524', 6, 1, 'bankdeposit', 'pending', '2024-05-11 03:41:35', '2024-06-16 17:26:25', NULL),
(4, '3MO4140524', 9, 1, NULL, 'open', '2024-05-14 15:16:11', '2024-05-14 15:16:11', NULL),
(5, 'j29j190524', 10, 1, NULL, 'open', '2024-05-19 14:31:47', '2024-05-19 14:31:47', NULL),
(6, 'awch290524', 15, 1, NULL, 'open', '2024-05-29 05:15:35', '2024-05-29 05:15:35', NULL),
(7, 'un6E040624', 18, 1, NULL, 'open', '2024-06-04 08:24:06', '2024-06-04 08:24:06', NULL),
(8, '5G8n050624', 21, 1, NULL, 'open', '2024-06-05 16:38:41', '2024-06-05 16:38:41', NULL),
(9, 'impV050624', 22, 1, NULL, 'open', '2024-06-05 17:47:33', '2024-06-05 17:47:33', NULL),
(10, 'hWQV050624', 22, 1, NULL, 'open', '2024-06-05 17:50:42', '2024-06-05 17:50:42', NULL),
(11, 'ZT5K050624', 22, 1, NULL, 'open', '2024-06-05 17:53:21', '2024-06-05 17:53:21', NULL),
(12, 'XgbX060624', 24, 1, 'bankdeposit', 'open', '2024-06-06 04:30:23', '2024-06-06 04:30:23', NULL),
(13, 'TESTMPESACODE12', 23, 1, 'mpesa', 'open', '2024-06-06 04:30:39', '2024-06-06 04:30:39', NULL),
(14, 'coCi060624', 25, 1, 'bankdeposit', 'open', '2024-06-06 04:36:10', '2024-06-06 04:36:10', NULL),
(15, 'i7UA060624', 26, 1, 'bankdeposit', 'open', '2024-06-06 04:45:41', '2024-06-06 04:45:41', NULL),
(16, 'HFYR74634RR', 27, 1, 'mpesa', 'open', '2024-06-06 04:48:23', '2024-06-06 04:48:23', NULL),
(17, 'LXwb120624', 44, 1, 'bankdeposit', 'open', '2024-06-12 04:20:39', '2024-06-12 04:20:39', NULL),
(18, '2rxQ120624', 45, 1, 'bankdeposit', 'open', '2024-06-12 04:44:48', '2024-06-12 04:44:48', NULL),
(19, 'BO9A120624', 46, 1, 'bankdeposit', 'open', '2024-06-12 04:55:05', '2024-06-12 04:55:05', NULL),
(20, '5645657RTYUT', 48, 1, 'mpesa', 'open', '2024-06-12 07:42:33', '2024-06-12 07:42:33', NULL),
(21, 'dffg4455667', 55, 1, 'mpesa', 'complete', '2024-06-13 17:09:19', '2024-06-17 09:52:35', NULL),
(22, 'l4lx140624', 56, 1, 'bankdeposit', 'open', '2024-06-14 03:17:51', '2024-06-14 03:17:51', NULL),
(23, 'iCEZ140624', 58, 1, 'bankdeposit', 'open', '2024-06-14 05:04:10', '2024-06-14 05:04:10', NULL),
(24, 'BANKCODE12', 66, 1, 'bankdeposit', 'pending', '2024-06-14 07:36:16', '2024-06-16 17:26:57', NULL),
(25, 'bankcode12334', 149, 1, 'bankdeposit', 'open', '2024-06-20 10:16:02', '2024-06-20 10:16:02', NULL),
(26, 'ghdfjghdfjgsd', 151, 1, 'mpesa', 'open', '2024-06-20 11:01:15', '2024-06-20 11:01:15', NULL),
(27, 'yrty7858586', 153, 1, 'bankdeposit', 'open', '2024-06-20 11:05:18', '2024-06-20 11:05:18', NULL),
(28, 'fghgfhy567', 155, 1, 'mpesa', 'open', '2024-06-20 12:50:29', '2024-06-20 12:50:29', NULL),
(29, 'djkdfgjfkg', 156, 1, 'bankdeposit', 'open', '2024-06-20 12:53:08', '2024-06-20 12:53:08', NULL),
(30, 'SFK14EKGYD', 148, 1, NULL, 'cancelled', '2024-06-20 12:59:18', '2024-06-22 09:17:08', NULL),
(31, 'SFL07O8K9M', 163, 1, 'mpesa', 'open', '2024-06-21 11:36:54', '2024-06-21 11:36:54', NULL),
(32, 'Upload later', 177, 1, 'bankdeposit', 'open', '2024-06-21 15:32:24', '2024-06-21 15:32:24', NULL),
(33, 'SFL590T7LT', 207, 1, 'mpesa', 'open', '2024-06-23 01:06:36', '2024-06-23 01:06:36', NULL),
(34, 'https://wise.com/fr/track/3eeb50f0acf84826820f4610082a5b64?utm_source=web&utm_medium=copy&utm_content=moneyTracker', 83, 1, 'bankdeposit', 'open', '2024-06-23 07:27:25', '2024-06-23 07:27:25', NULL),
(35, 'SPONSORS CATEGORY', 260, 1, 'bankdeposit', 'open', '2024-06-24 03:31:00', '2024-06-24 03:31:00', NULL),
(36, 'Q0003365', 88, 1, 'bankdeposit', 'open', '2024-06-24 03:47:48', '2024-06-24 03:47:48', NULL),
(37, 'SFO3H5LX7P', 273, 1, 'mpesa', 'open', '2024-06-24 06:45:01', '2024-06-24 06:45:01', NULL),
(38, '98617', 187, 1, 'bankdeposit', 'open', '2024-06-24 07:05:05', '2024-06-24 07:05:05', NULL),
(39, 'To be paid Later', 291, 1, 'bankdeposit', 'open', '2024-06-24 09:29:25', '2024-06-24 09:29:25', NULL),
(40, 'SFO2HZ54B0', 98, 1, 'mpesa', 'open', '2024-06-24 09:42:35', '2024-06-24 09:42:35', NULL),
(41, '45678', 299, 1, 'mpesa', 'open', '2024-06-24 13:30:48', '2024-06-24 13:30:48', NULL),
(42, 'B000100CITI', 307, 1, 'bankdeposit', 'open', '2024-06-24 16:26:19', '2024-06-24 16:26:19', NULL),
(43, 'SFP8K8E2FO', 297, 1, 'mpesa', 'open', '2024-06-25 02:45:18', '2024-06-25 02:45:18', NULL),
(44, 'SH5022W6Q2', 526, 1, 'mpesa', 'open', '2024-08-05 13:27:28', '2024-08-05 13:27:28', NULL),
(45, '01993874232009LJ', 543, 1, 'bankdeposit', 'open', '2024-08-20 05:23:55', '2024-08-20 05:23:55', NULL),
(46, '01993874232009L7', 568, 1, 'bankdeposit', 'open', '2024-08-20 05:39:22', '2024-08-20 05:39:22', NULL),
(47, 'bankdeposit2tKbYkSy2024-08-20 11:33:27', 569, 1, 'bankdeposit', 'open', '2024-08-20 08:33:27', '2024-08-20 08:33:27', NULL),
(48, 'mpesajrfc4eCS2024-08-20 11:33:44', 569, 1, 'mpesa', 'open', '2024-08-20 08:33:44', '2024-08-20 08:33:44', NULL),
(49, 'mpesa3TFQ3mCs2024-08-20 11:37:21', 569, 1, 'mpesa', 'open', '2024-08-20 08:37:21', '2024-08-20 08:37:21', NULL),
(50, 'bankdeposit0zZerbSn2024-08-20 11:40:43', 569, 1, 'bankdeposit', 'open', '2024-08-20 08:40:43', '2024-08-20 08:40:43', NULL),
(51, 'mpesaq3eiuRrc2024-08-20 11:40:50', 569, 1, 'mpesa', 'open', '2024-08-20 08:40:50', '2024-08-20 08:40:50', NULL),
(52, 'bankdeposit468534L82024-08-20 13:06:07', 571, 1, 'bankdeposit', 'open', '2024-08-20 10:06:07', '2024-08-20 10:06:07', NULL),
(53, 'mpesaB5yNuIeP2024-08-20 13:06:22', 571, 1, 'mpesa', 'open', '2024-08-20 10:06:22', '2024-08-20 10:06:22', NULL),
(54, 'mpesaJog9aVSb2024-08-20 13:19:22', 571, 1, 'mpesa', 'open', '2024-08-20 10:19:22', '2024-08-20 10:19:22', NULL),
(55, 'mpesaiVwNo1xt2024-08-20 13:21:47', 571, 1, 'mpesa', 'open', '2024-08-20 10:21:47', '2024-08-20 10:21:47', NULL),
(56, 'mpesamjh07yz82024-08-20 13:31:47', 571, 1, 'mpesa', 'open', '2024-08-20 10:31:47', '2024-08-20 10:31:47', NULL),
(57, 'mpesaY89tCGOW2024-08-20 13:38:12', 571, 1, 'mpesa', 'open', '2024-08-20 10:38:12', '2024-08-20 10:38:12', NULL),
(58, 'mpesaoTKoFMTT2024-08-20 13:49:29', 571, 1, 'mpesa', 'pending', '2024-08-20 10:49:29', '2024-08-20 10:49:40', NULL),
(59, 'mpesaVV2YEw8V2024-08-20 14:00:02', 571, 1, 'mpesa', 'pending', '2024-08-20 11:00:02', '2024-08-20 11:00:08', NULL),
(60, 'mpesaUQ3b59Jt2024-08-20 14:06:37', 571, 1, 'mpesa', 'pending', '2024-08-20 11:06:37', '2024-08-20 11:06:46', NULL),
(61, 'mpesaqEDmJWuT2024-08-20 14:11:28', 572, 1, 'mpesa', 'complete', '2024-08-20 11:11:28', '2024-08-20 11:17:46', NULL),
(62, 'mpesaS3nYyfhA2024-08-20 14:12:31', 572, 1, 'mpesa', 'pending', '2024-08-20 11:12:31', '2024-08-20 11:12:36', NULL),
(63, 'mpesaoTjeCGM32024-08-20 14:31:22', 573, 1, 'mpesa', 'complete', '2024-08-20 11:31:22', '2024-08-20 12:09:13', NULL),
(64, 'bankdeposit2OJVEddd2024-08-20 14:32:15', 573, 1, 'bankdeposit', 'open', '2024-08-20 11:32:15', '2024-08-20 11:32:15', NULL),
(65, 'yu787', 573, 1, 'bankdeposit', 'open', '2024-08-20 11:32:25', '2024-08-20 11:32:25', NULL),
(66, 'mpesaB3Z5bbVO2024-08-20 15:06:39', 573, 1, 'mpesa', 'pending', '2024-08-20 12:06:39', '2024-08-20 12:06:45', NULL),
(67, 'bankdepositDO0igibD2024-08-20 15:07:28', 573, 1, 'bankdeposit', 'open', '2024-08-20 12:07:28', '2024-08-20 12:07:28', NULL),
(68, 'uiu889', 573, 1, 'bankdeposit', 'open', '2024-08-20 12:07:38', '2024-08-20 12:07:38', NULL),
(69, 'bankdepositfywlG6Ym2024-08-20 15:12:48', 574, 1, 'bankdeposit', 'open', '2024-08-20 12:12:48', '2024-08-20 12:12:48', NULL),
(70, 'fhjfjfk', 574, 1, 'bankdeposit', 'complete', '2024-08-20 12:12:56', '2024-08-20 12:56:01', NULL),
(71, 'mpesaADmrbk4u2024-08-21 13:01:04', 575, 1, 'mpesa', 'open', '2024-08-21 10:01:04', '2024-08-21 10:01:04', NULL),
(72, 'mpesaGEPefXCu2024-08-22 11:34:42', 579, 1, 'mpesa', 'open', '2024-08-22 08:34:42', '2024-08-22 08:34:42', NULL),
(73, 'mpesavPKvUvxk2024-08-22 11:39:09', 580, 1, 'mpesa', 'pending', '2024-08-22 08:39:09', '2024-08-22 08:39:28', NULL),
(74, 'bankdepositpuaPIYLs2024-08-22 11:46:23', 581, 1, 'bankdeposit', 'open', '2024-08-22 08:46:23', '2024-08-22 08:46:23', NULL),
(75, 'testbank payment', 581, 1, 'bankdeposit', 'open', '2024-08-22 08:46:41', '2024-08-22 08:46:41', NULL),
(76, 'bankdepositS4jkTgf82024-08-22 11:47:26', 581, 1, 'bankdeposit', 'open', '2024-08-22 08:47:26', '2024-08-22 08:47:26', NULL),
(77, 'mpesabQW560Pi2024-08-22 11:47:37', 581, 1, 'mpesa', 'open', '2024-08-22 08:47:37', '2024-08-22 08:47:37', NULL),
(78, 'mpesaaCe8eHrb2024-08-22 11:50:05', 582, 1, 'mpesa', 'pending', '2024-08-22 08:50:05', '2024-08-22 08:50:21', NULL),
(79, 'bankdepositKGnlMBI42024-08-22 13:09:21', 584, 1, 'bankdeposit', 'open', '2024-08-22 10:09:21', '2024-08-22 10:09:21', NULL),
(80, 'mpesaeZdGLQ0h2024-08-23 12:53:52', 585, 1, 'mpesa', 'pending', '2024-08-23 09:53:52', '2024-08-23 09:54:15', NULL),
(81, 'bankdepositetP3DQWP2024-09-01 08:23:29', 599, 1, 'bankdeposit', 'open', '2024-09-01 05:23:29', '2024-09-01 05:23:29', NULL),
(82, 'bankdepositGDBEXODB2024-09-05 12:30:12', 624, 1, 'bankdeposit', 'open', '2024-09-05 09:30:12', '2024-09-05 09:30:12', NULL),
(83, 'bankdepositfc11vftT2024-09-06 07:19:39', 634, 1, 'bankdeposit', 'open', '2024-09-06 04:19:39', '2024-09-06 04:19:39', NULL),
(84, 'x18mJKqr', 648, 1, 'mpesa', 'complete', '2024-09-07 08:40:35', '2024-09-07 08:43:25', NULL),
(85, 'bankdepositunYAvUJh2024-09-07 11:47:36', 647, 1, 'bankdeposit', 'open', '2024-09-07 08:47:36', '2024-09-07 08:47:36', NULL),
(86, 'iHVheoGa', 649, 1, 'bankdeposit', 'open', '2024-09-07 11:44:26', '2024-09-07 11:44:26', NULL),
(87, 'PtbH9etw', 650, 1, 'bankdeposit', 'open', '2024-09-07 11:51:23', '2024-09-07 11:51:23', NULL),
(88, 'Vf3HpCQu', 651, 1, 'bankdeposit', 'open', '2024-09-07 12:14:42', '2024-09-07 12:14:42', NULL),
(89, 'fynMCS6C', 652, 1, 'bankdeposit', 'open', '2024-09-07 12:25:36', '2024-09-07 12:25:36', NULL),
(90, 'WPLfWSrp', 653, 1, 'bankdeposit', 'pending', '2024-09-07 12:28:18', '2024-09-07 12:28:29', NULL),
(91, 'NeG96nN0', 654, 1, 'mpesa', 'open', '2024-09-09 02:17:45', '2024-09-09 02:17:45', NULL),
(92, 'gXzjWG1U', 655, 1, 'mpesa', 'pending', '2024-09-09 04:20:22', '2024-09-09 04:20:58', NULL),
(93, 'mpesaQDmWusjE2024-09-09 10:23:58', 655, 1, 'mpesa', 'open', '2024-09-09 07:23:58', '2024-09-09 07:23:58', NULL),
(94, 'bankdepositppDu52wK2024-09-09 10:24:09', 655, 1, 'bankdeposit', 'open', '2024-09-09 07:24:09', '2024-09-09 07:24:09', NULL),
(95, '4AayL7lg', 656, 1, 'bankdeposit', 'open', '2024-09-09 07:25:09', '2024-09-09 07:25:09', NULL),
(96, 'mpesahXzIQLBA2024-09-10 07:59:19', 404, 1, 'mpesa', 'complete', '2024-09-10 04:59:19', '2024-09-10 05:59:20', NULL),
(97, 'MjDRPIZz', 657, 1, 'mpesa', 'open', '2024-09-12 03:19:23', '2024-09-12 03:19:23', NULL),
(98, 'wYwpWHSv', 658, 1, 'bankdeposit', 'open', '2024-09-12 06:26:11', '2024-09-12 06:26:11', NULL),
(99, 'bankdepositixbdDFu32024-09-12 09:45:32', 86, 1, 'bankdeposit', 'open', '2024-09-12 06:45:32', '2024-09-12 06:45:32', NULL),
(100, '4iWbg5Tp', 659, 1, 'mpesa', 'open', '2024-09-12 13:01:10', '2024-09-12 13:01:10', NULL),
(101, 'GkirSIBK', 660, 1, 'bankdeposit', 'open', '2024-09-12 13:02:32', '2024-09-12 13:02:32', NULL),
(102, 'fUq7sM82', 661, 1, 'bankdeposit', 'cancelled', '2024-09-12 13:03:40', '2024-09-12 13:05:40', NULL),
(103, 'YYlqLFzk', 662, 1, 'bankdeposit', 'open', '2024-09-12 13:06:33', '2024-09-12 13:06:33', NULL),
(104, 'JWtAErnx', 663, 1, 'bankdeposit', 'open', '2024-09-14 18:22:49', '2024-09-14 18:22:49', NULL),
(105, 'oh8JNudz', 664, 1, 'mpesa', 'pending', '2024-09-15 10:48:55', '2024-09-15 10:49:18', NULL),
(106, 'cSbTrVd9', 665, 1, 'mpesa', 'open', '2024-09-15 18:12:40', '2024-09-15 18:12:40', NULL),
(107, 'QRRysG62', 666, 1, 'mpesa', 'open', '2024-09-15 18:34:23', '2024-09-15 18:34:23', NULL),
(108, 'uG6HxmQp', 667, 1, 'mpesa', 'pending', '2024-09-16 07:16:21', '2024-09-16 07:16:44', NULL),
(109, 'yJOl1iGG', 668, 1, 'bankdeposit', 'open', '2024-09-17 04:44:34', '2024-09-17 04:44:34', NULL),
(110, 'Ry3F6qIE', 669, 1, 'bankdeposit', 'open', '2024-09-17 11:27:26', '2024-09-17 11:27:26', NULL),
(111, 'suOWEYh0', 670, 1, 'bankdeposit', 'open', '2024-09-17 12:29:44', '2024-09-17 12:29:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `currency` enum('KES','USD','EURO') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `ticket_id`, `qty`, `currency`, `price`, `comments`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'KES', 39300.00, 'Admin Updated Payment Record', 1, '2024-04-25 10:38:01', '2024-06-16 17:25:55', NULL),
(2, 2, 2, 1, 'USD', 400.00, NULL, 1, '2024-05-06 04:52:43', '2024-05-06 04:52:43', NULL),
(3, 3, 2, 1, 'USD', 400.00, 'Admin Updated Payment Record', 1, '2024-05-11 03:41:35', '2024-06-16 17:26:25', NULL),
(4, 4, 1, 1, 'USD', 300.00, NULL, 1, '2024-05-14 15:16:11', '2024-05-14 15:16:11', NULL),
(5, 5, 2, 1, 'USD', 400.00, NULL, 1, '2024-05-19 14:31:47', '2024-05-19 14:31:47', NULL),
(6, 6, 1, 1, 'USD', 300.00, NULL, 1, '2024-05-29 05:15:35', '2024-05-29 05:15:35', NULL),
(7, 7, 1, 1, 'USD', 300.00, NULL, 1, '2024-06-04 08:24:06', '2024-06-04 08:24:06', NULL),
(8, 8, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-05 16:38:41', '2024-06-05 16:38:41', NULL),
(9, 9, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-05 17:47:34', '2024-06-05 17:47:34', NULL),
(10, 10, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-05 17:50:43', '2024-06-05 17:50:43', NULL),
(11, 11, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-05 17:53:21', '2024-06-05 17:53:21', NULL),
(12, 12, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-06 04:30:23', '2024-06-06 04:30:23', NULL),
(13, 13, 1, 1, 'KES', 39300.00, NULL, 1, '2024-06-06 04:30:39', '2024-06-06 04:30:39', NULL),
(14, 14, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-06 04:36:10', '2024-06-06 04:36:10', NULL),
(15, 15, 1, 1, 'USD', 300.00, NULL, 1, '2024-06-06 04:45:41', '2024-06-06 04:45:41', NULL),
(16, 16, 2, 1, 'KES', 52400.00, NULL, 1, '2024-06-06 04:48:23', '2024-06-06 04:48:23', NULL),
(17, 17, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-12 04:20:40', '2024-06-12 04:20:40', NULL),
(18, 18, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-12 04:44:50', '2024-06-12 04:44:50', NULL),
(19, 19, 1, 1, 'USD', 300.00, NULL, 1, '2024-06-12 04:55:07', '2024-06-12 04:55:07', NULL),
(20, 20, 1, 1, 'KES', 39300.00, NULL, 1, '2024-06-12 07:42:33', '2024-06-12 07:42:33', NULL),
(21, 21, 1, 1, 'KES', 39500.00, 'Admin Updated Payment Record', 1, '2024-06-13 17:09:19', '2024-06-17 09:52:35', NULL),
(22, 22, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-14 03:17:51', '2024-06-14 03:17:51', NULL),
(23, 23, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-14 05:04:10', '2024-06-14 05:04:10', NULL),
(24, 24, 2, 1, 'USD', 400.00, 'Admin Updated Payment Record', 1, '2024-06-14 07:36:16', '2024-06-16 17:26:57', NULL),
(25, 25, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-20 10:16:02', '2024-06-20 10:16:02', NULL),
(26, 26, 1, 1, 'KES', 39300.00, NULL, 1, '2024-06-20 11:01:15', '2024-06-20 11:01:15', NULL),
(27, 27, 1, 1, 'USD', 300.00, NULL, 1, '2024-06-20 11:05:18', '2024-06-20 11:05:18', NULL),
(28, 28, 2, 1, 'KES', 52400.00, NULL, 1, '2024-06-20 12:50:29', '2024-06-20 12:50:29', NULL),
(29, 29, 1, 1, 'USD', 300.00, NULL, 1, '2024-06-20 12:53:08', '2024-06-20 12:53:08', NULL),
(30, 30, 1, 1, 'KES', 39300.00, NULL, 1, '2024-06-20 12:59:18', '2024-06-20 12:59:18', NULL),
(31, 31, 2, 1, 'KES', 52400.00, NULL, 1, '2024-06-21 11:36:54', '2024-06-21 11:36:54', NULL),
(32, 32, 1, 1, 'USD', 300.00, NULL, 1, '2024-06-21 15:32:24', '2024-06-21 15:32:24', NULL),
(33, 33, 1, 1, 'KES', 39300.00, NULL, 1, '2024-06-23 01:06:37', '2024-06-23 01:06:37', NULL),
(34, 34, 2, 1, 'USD', 400.00, NULL, 1, '2024-06-23 07:27:25', '2024-06-23 07:27:25', NULL),
(35, 35, 1, 1, 'USD', 300.00, NULL, 1, '2024-06-24 03:31:01', '2024-06-24 03:31:01', NULL),
(36, 36, 1, 1, 'USD', 300.00, NULL, 1, '2024-06-24 03:47:49', '2024-06-24 03:47:49', NULL),
(37, 37, 1, 1, 'KES', 39300.00, NULL, 1, '2024-06-24 06:45:01', '2024-06-24 06:45:01', NULL),
(38, 38, 1, 1, 'USD', 300.00, NULL, 1, '2024-06-24 07:05:05', '2024-06-24 07:05:05', NULL),
(39, 39, 1, 1, 'USD', 300.00, NULL, 1, '2024-06-24 09:29:26', '2024-06-24 09:29:26', NULL),
(40, 40, 1, 1, 'KES', 39300.00, NULL, 1, '2024-06-24 09:42:35', '2024-06-24 09:42:35', NULL),
(41, 41, 2, 1, 'KES', 52400.00, NULL, 1, '2024-06-24 13:30:48', '2024-06-24 13:30:48', NULL),
(42, 42, 1, 1, 'USD', 300.00, NULL, 1, '2024-06-24 16:26:19', '2024-06-24 16:26:19', NULL),
(43, 43, 2, 1, 'KES', 52400.00, NULL, 1, '2024-06-25 02:45:19', '2024-06-25 02:45:19', NULL),
(44, 44, 2, 1, 'KES', 52400.00, NULL, 1, '2024-08-05 13:27:29', '2024-08-05 13:27:29', NULL),
(45, 45, 2, 1, 'USD', 400.00, NULL, 1, '2024-08-20 05:23:55', '2024-08-20 05:23:55', NULL),
(46, 46, 2, 1, 'USD', 400.00, NULL, 1, '2024-08-20 05:39:22', '2024-08-20 05:39:22', NULL),
(47, 47, 1, 1, 'USD', 300.00, NULL, 1, '2024-08-20 08:33:27', '2024-08-20 08:33:27', NULL),
(48, 49, 1, 1, 'KES', 39000.00, NULL, 1, '2024-08-20 08:37:21', '2024-08-20 08:37:21', NULL),
(49, 50, 1, 1, 'USD', 300.00, NULL, 1, '2024-08-20 08:40:43', '2024-08-20 08:40:43', NULL),
(50, 51, 1, 1, 'KES', 39000.00, NULL, 1, '2024-08-20 08:40:50', '2024-08-20 08:40:50', NULL),
(51, 52, 2, 1, NULL, 400.00, NULL, 1, '2024-08-20 10:06:07', '2024-08-20 10:06:07', NULL),
(52, 53, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-20 10:06:22', '2024-08-20 10:06:22', NULL),
(53, 54, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-20 10:19:22', '2024-08-20 10:19:22', NULL),
(54, 55, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-20 10:21:47', '2024-08-20 10:21:47', NULL),
(55, 56, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-20 10:31:47', '2024-08-20 10:31:47', NULL),
(56, 57, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-20 10:38:12', '2024-08-20 10:38:12', NULL),
(57, 58, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-20 10:49:29', '2024-08-20 10:49:29', NULL),
(58, 59, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-20 11:00:02', '2024-08-20 11:00:02', NULL),
(59, 60, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-20 11:06:37', '2024-08-20 11:06:37', NULL),
(60, 61, 2, 1, 'KES', 52000.00, 'Admin Updated Payment Record', 1, '2024-08-20 11:11:28', '2024-08-20 11:19:01', NULL),
(61, 62, 1, 1, 'KES', 39000.00, NULL, 1, '2024-08-20 11:12:31', '2024-08-20 11:12:31', NULL),
(62, 63, 1, 1, 'KES', 39000.00, 'Admin Updated Payment Record', 1, '2024-08-20 11:31:23', '2024-08-20 12:09:13', NULL),
(63, 64, 1, 1, 'USD', 300.00, NULL, 1, '2024-08-20 11:32:15', '2024-08-20 11:32:15', NULL),
(64, 65, 1, 1, 'USD', 300.00, NULL, 1, '2024-08-20 11:32:25', '2024-08-20 11:32:25', NULL),
(65, 66, 1, 1, 'KES', 39000.00, NULL, 1, '2024-08-20 12:06:39', '2024-08-20 12:06:39', NULL),
(66, 67, 1, 1, 'USD', 300.00, NULL, 1, '2024-08-20 12:07:28', '2024-08-20 12:07:28', NULL),
(67, 68, 1, 1, 'USD', 300.00, NULL, 1, '2024-08-20 12:07:38', '2024-08-20 12:07:38', NULL),
(68, 69, 2, 1, NULL, 400.00, NULL, 1, '2024-08-20 12:12:48', '2024-08-20 12:12:48', NULL),
(69, 70, 2, 1, 'USD', 400.00, 'Admin Updated Payment Record', 1, '2024-08-20 12:12:56', '2024-08-20 12:56:01', NULL),
(70, 71, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-21 10:01:04', '2024-08-21 10:01:04', NULL),
(71, 72, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-22 08:34:42', '2024-08-22 08:34:42', NULL),
(72, 73, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-22 08:39:09', '2024-08-22 08:39:09', NULL),
(73, 74, 2, 1, NULL, 400.00, NULL, 1, '2024-08-22 08:46:23', '2024-08-22 08:46:23', NULL),
(74, 75, 2, 1, 'USD', 400.00, NULL, 1, '2024-08-22 08:46:41', '2024-08-22 08:46:41', NULL),
(75, 76, 2, 1, 'USD', 400.00, NULL, 1, '2024-08-22 08:47:26', '2024-08-22 08:47:26', NULL),
(76, 77, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-22 08:47:37', '2024-08-22 08:47:37', NULL),
(77, 78, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-22 08:50:05', '2024-08-22 08:50:05', NULL),
(78, 79, 2, 1, 'USD', 400.00, NULL, 1, '2024-08-22 10:09:21', '2024-08-22 10:09:21', NULL),
(79, 80, 2, 1, 'KES', 52000.00, NULL, 1, '2024-08-23 09:53:52', '2024-08-23 09:53:52', NULL),
(80, 81, 2, 1, 'USD', 400.00, NULL, 1, '2024-09-01 05:23:29', '2024-09-01 05:23:29', NULL),
(81, 82, 2, 1, 'USD', 400.00, NULL, 1, '2024-09-05 09:30:12', '2024-09-05 09:30:12', NULL),
(82, 83, 2, 1, NULL, 400.00, NULL, 1, '2024-09-06 04:19:39', '2024-09-06 04:19:39', NULL),
(83, 84, 2, 1, 'KES', 52000.00, 'Admin Updated Payment Record', 1, '2024-09-07 08:40:35', '2024-09-07 08:43:25', NULL),
(84, 85, 2, 1, NULL, 400.00, NULL, 1, '2024-09-07 08:47:36', '2024-09-07 08:47:36', NULL),
(85, 86, 2, 1, 'USD', 400.00, NULL, 1, '2024-09-07 11:44:26', '2024-09-07 11:44:26', NULL),
(86, 87, 2, 1, 'USD', 400.00, NULL, 1, '2024-09-07 11:51:23', '2024-09-07 11:51:23', NULL),
(87, 88, 1, 1, 'USD', 400.00, NULL, 1, '2024-09-07 12:14:42', '2024-09-07 12:14:42', NULL),
(88, 89, 2, 1, 'USD', 400.00, NULL, 1, '2024-09-07 12:25:36', '2024-09-07 12:25:36', NULL),
(89, 90, 2, 1, 'USD', 400.00, NULL, 1, '2024-09-07 12:28:18', '2024-09-07 12:28:18', NULL),
(90, 91, 2, 1, 'KES', 52000.00, NULL, 1, '2024-09-09 02:17:45', '2024-09-09 02:17:45', NULL),
(91, 92, 2, 1, 'KES', 52000.00, NULL, 1, '2024-09-09 04:20:23', '2024-09-09 04:20:23', NULL),
(92, 93, 2, 1, 'KES', 52000.00, NULL, 1, '2024-09-09 07:23:58', '2024-09-09 07:23:58', NULL),
(93, 94, 2, 1, 'USD', 400.00, NULL, 1, '2024-09-09 07:24:09', '2024-09-09 07:24:09', NULL),
(94, 95, 2, 1, 'USD', 400.00, NULL, 1, '2024-09-09 07:25:09', '2024-09-09 07:25:09', NULL),
(95, 96, 2, 1, 'KES', 52000.00, 'Admin Updated Payment Record', 1, '2024-09-10 04:59:19', '2024-09-10 05:59:20', NULL),
(96, 97, 1, 1, 'KES', 52000.00, NULL, 1, '2024-09-12 03:19:23', '2024-09-12 03:19:23', NULL),
(97, 98, 1, 1, 'USD', 400.00, NULL, 1, '2024-09-12 06:26:11', '2024-09-12 06:26:11', NULL),
(98, 99, 2, 1, NULL, 400.00, NULL, 1, '2024-09-12 06:45:32', '2024-09-12 06:45:32', NULL),
(99, 100, 1, 1, 'KES', 52000.00, NULL, 1, '2024-09-12 13:01:10', '2024-09-12 13:01:10', NULL),
(100, 101, 1, 1, 'USD', 400.00, NULL, 1, '2024-09-12 13:02:32', '2024-09-12 13:02:32', NULL),
(101, 102, 1, 1, 'USD', 400.00, 'Admin Updated Payment Record', 1, '2024-09-12 13:03:40', '2024-09-12 13:05:40', NULL),
(102, 103, 2, 1, 'USD', 400.00, NULL, 1, '2024-09-12 13:06:33', '2024-09-12 13:06:33', NULL),
(103, 104, 2, 1, 'USD', 400.00, NULL, 1, '2024-09-14 18:22:49', '2024-09-14 18:22:49', NULL),
(104, 105, 1, 1, 'KES', 52000.00, NULL, 1, '2024-09-15 10:48:55', '2024-09-15 10:48:55', NULL),
(105, 106, 1, 1, 'KES', 52000.00, NULL, 1, '2024-09-15 18:12:40', '2024-09-15 18:12:40', NULL),
(106, 107, 2, 1, 'KES', 52000.00, NULL, 1, '2024-09-15 18:34:23', '2024-09-15 18:34:23', NULL),
(107, 108, 1, 1, 'KES', 52000.00, NULL, 1, '2024-09-16 07:16:21', '2024-09-16 07:16:21', NULL),
(108, 109, 1, 1, 'USD', 400.00, NULL, 1, '2024-09-17 04:44:34', '2024-09-17 04:44:34', NULL),
(109, 110, 2, 1, 'USD', 400.00, NULL, 1, '2024-09-17 11:27:26', '2024-09-17 11:27:26', NULL),
(110, 111, 1, 1, 'USD', 400.00, NULL, 1, '2024-09-17 12:29:44', '2024-09-17 12:29:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_ticket_details`
--

CREATE TABLE `order_ticket_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_names` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_ticket_details`
--

INSERT INTO `order_ticket_details` (`id`, `order_item_id`, `surname`, `other_names`, `email`, `phone`, `company`, `job_title`, `address`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Test Person 1', NULL, 'support1@fincon2024.co.ke', '254729908751', 'Agusto & Co.', 'Regional Director for East Africa', 'naii', 'good thing', '2024-04-25 10:38:01', '2024-06-16 17:24:28', NULL),
(2, 2, 'Andrew Njiraini', NULL, 'anjiraini@flywheeladvisory.com', '0723869792', 'Flywheel Advisory', 'Director', NULL, NULL, '2024-05-06 04:52:43', '2024-05-06 04:52:43', NULL),
(3, 3, 'Test Person 2 Updated', NULL, 'chegzcol1@gmail.com', '0729908742', 'Colycom solutions', 'Ceo', NULL, NULL, '2024-05-11 03:41:35', '2024-06-16 17:26:25', NULL),
(4, 4, 'Monica Karanja', NULL, 'support@miceafrica.org', '0812334667', 'Mice Africa', 'Finance Officer', NULL, NULL, '2024-05-14 15:16:11', '2024-05-14 15:16:11', NULL),
(5, 5, 'Isaac Waithaka', NULL, 'inwaithaka@gmail.com', '0713280683', 'AllAccess MicroEnterprises Limited', 'Manager', NULL, NULL, '2024-05-19 14:31:47', '2024-05-19 14:31:47', NULL),
(6, 6, 'Blanche Wangari Kangeri', NULL, 'mbithe82@gmail.com', '0736392514', 'Esken Business Management Services', 'Director', NULL, NULL, '2024-05-29 05:15:35', '2024-05-29 05:15:35', NULL),
(7, 7, 'Test Person June', NULL, 'sales@smartwisetravel.co.ke', '0723665778', 'Smartwise Travel', 'Manager', NULL, NULL, '2024-06-04 08:24:06', '2024-06-04 08:24:06', NULL),
(8, 8, 'Test Person three', NULL, 'support@smartwisetravel.co.ke', '0729987700', 'Smartwise Travelf', 'Manager', NULL, NULL, '2024-06-05 16:38:41', '2024-06-05 16:38:41', NULL),
(9, 9, 'Test Person four', NULL, 'support@fincon2024.co.ke', '0712000999', 'Test Company', 'Test Manager', NULL, NULL, '2024-06-05 17:47:34', '2024-06-05 17:47:34', NULL),
(10, 10, 'Test Person four', NULL, 'support@fincon2024.co.ke', '0712000999', 'Test Company', 'Test manager', NULL, NULL, '2024-06-05 17:50:43', '2024-06-05 17:50:43', NULL),
(11, 11, 'Test Person four', NULL, 'support@fincon2024.co.ke', '0712000999', 'Test company', 'test job', NULL, NULL, '2024-06-05 17:53:21', '2024-06-05 17:53:21', NULL),
(12, 12, 'Humphrey Odendo', NULL, 'hodendo@greyapple.co.ke', '0721546652', 'Grey Apple', 'Event Planner', 'Ruaraka Housing Estate \r\nOff USIU Road', 'bankdeposit', '2024-06-06 04:30:23', '2024-06-06 04:30:23', NULL),
(13, 13, 'Allan Watts', NULL, 'sales@smartwisetravel.co.ke', '0729908766', 'Smartwise Travel', 'Manager', 'kitale', 'mpesa', '2024-06-06 04:30:39', '2024-06-06 04:30:39', NULL),
(14, 14, 'Test person ten', NULL, 'support@fincon2024.co.ke', '078888888888', 'Colyucom Solutions', 'Chif Executive Officer', 'NAIROBI', 'bankdeposit', '2024-06-06 04:36:10', '2024-06-06 04:36:10', NULL),
(15, 15, 'Test person elleven', NULL, 'support@fincon2024.co.ke', '0721999999', NULL, NULL, NULL, 'bankdeposit', '2024-06-06 04:45:41', '2024-06-06 04:45:41', NULL),
(16, 16, 'Test Person nine', NULL, 'support@fincon2024.co.ke', '0725678908', 'Smartwise Travelf', 'Manager', 'kitale', 'mpesa', '2024-06-06 04:48:23', '2024-06-06 04:48:23', NULL),
(17, 17, 'Collins Bukachi', NULL, 'collins.bukachi@libertylife.co.ke', '0728448202', 'Liberty Life Assurance Kenya Limited', 'Business Development Manager', NULL, 'bankdeposit', '2024-06-12 04:20:40', '2024-06-12 04:20:40', NULL),
(18, 18, 'TITUS KIPNGETICH', NULL, 'titus.kipngetich@libertylife.co.ke', '0716351132', 'LIBERTY LIFE ASSURANCE', 'BUSINESS DEVELOPMENT EXECUTIVE-AFFINITY', '30364-00100', 'bankdeposit', '2024-06-12 04:44:51', '2024-06-12 04:44:51', NULL),
(19, 19, 'Beverly Muvoka', NULL, 'beverly@greyapple.co.ke', '0722255806', 'Grey Apple Ltd', 'Business Development', 'USIU Rd Ruaraka Housing', 'bankdeposit', '2024-06-12 04:55:09', '2024-06-12 04:55:09', NULL),
(20, 20, 'Test Person 6', NULL, 'chegzcol@gmail.com', '0729908765', 'Colyucom Solutions', 'Manager', 'WDE', 'mpesa', '2024-06-12 07:42:34', '2024-06-12 07:42:34', NULL),
(21, 21, 'Test Person 8', NULL, 'info@miceafrica.org', '0729908746', 'Test Company', 'Test Manager', 'test', 'mpesa', '2024-06-13 17:09:19', '2024-06-13 17:09:19', NULL),
(22, 22, 'Samuel Kablit', NULL, 'sewoton@mercycorps.org', '0712846194', 'Mercy Corps', 'Senior Private Sector Engagement and Financial Inclusion Officer', NULL, 'bankdeposit', '2024-06-14 03:17:51', '2024-06-14 03:17:51', NULL),
(23, 23, 'Jackie Githiga', NULL, 'jackiegithiga@gmail.com', '0720753042', 'Hakikah link solutions', 'Managing Director', 'Nairobi', 'bankdeposit', '2024-06-14 05:04:10', '2024-06-14 05:04:10', NULL),
(24, 24, 'Test Person One', NULL, 'info@fincon2024.co.ke', '0729908444', 'Test Company', 'Test Manager', 'nairobi Kenya', 'bankdeposit', '2024-06-14 07:36:16', '2024-06-16 17:19:23', NULL),
(25, 25, 'Test Person 12', NULL, 'info@fincon2024.co.ke', '+254729908751', 'Test Company', 'Test Manager', 'Tedst address', 'bankdeposit', '2024-06-20 10:16:04', '2024-06-20 10:16:04', NULL),
(26, 26, 'Test Person  what', NULL, 'info@fincon2024.co.ke', '0711111111', 'Test Company', 'Test Manager', 'test Address', 'mpesa', '2024-06-20 11:01:15', '2024-06-20 11:01:15', NULL),
(27, 27, 'Test Person today', NULL, 'info@fincon2024.co.ke', '071222222', 'Test Company', 'Regional Director for East Africa', 'ddd', 'bankdeposit', '2024-06-20 11:05:19', '2024-06-20 11:05:19', NULL),
(28, 28, 'Test Person thur', NULL, 'info@fincon2024.co.ke', '0722222222', NULL, NULL, NULL, 'mpesa', '2024-06-20 12:50:29', '2024-06-20 12:50:29', NULL),
(29, 29, 'Test Person 7j', NULL, 'info@fincon2024.co.ke', '07288900000', 'Test Company', 'Test Manager', 'test', 'bankdeposit', '2024-06-20 12:53:08', '2024-06-20 12:53:08', NULL),
(30, 30, 'Tom Omedi', NULL, 'theomeden@gmail.com', '725889229', 'tester', 'mm', 'nn', 'mpesa', '2024-06-20 12:59:19', '2024-06-20 12:59:19', NULL),
(31, 31, 'MUUNGANO MICROFINANCE BANK PLC', NULL, 'info@muunganomfbank.co.ke', '0706974747', 'MUUNGANO MIICROFINANCE BANK PLC', 'CEO', 'PO BOX 355-10218, KANGARI', 'mpesa', '2024-06-21 11:36:55', '2024-06-21 11:36:55', NULL),
(32, 32, 'BONFACE ISINTA OMBUI', NULL, 'bonface@choice-bank.com', '0706169317', 'Choice Microfinance Bank', 'CEO', 'Magadi Road, Rongai', 'bankdeposit', '2024-06-21 15:32:24', '2024-06-21 15:32:24', NULL),
(33, 33, 'William Atemi', NULL, 'williamatemi@gmail.com', '0710578231', NULL, NULL, NULL, 'mpesa', '2024-06-23 01:06:37', '2024-06-23 01:06:37', NULL),
(34, 34, 'JULIEN LEROY', NULL, 'julien.leroy@gca-foundation.org', '0664488904', 'Grameen Credit Agricole Foundation', 'Advisor', 'Ngaparou\r\nSénégal', 'bankdeposit', '2024-06-23 07:27:25', '2024-06-23 07:27:25', NULL),
(35, 35, 'AMB. SARAH J.C SEREM, CBS', NULL, 'md@postbank.co.ke', '0713053976', 'POSTBANK', 'CHAIRPERSON', '16TH BANDA STREET', 'bankdeposit', '2024-06-24 03:31:01', '2024-06-24 03:31:01', NULL),
(36, 36, 'Iutung Denis', NULL, 'd.iutung@solutifinance.org', '+256782287238', 'Soluti Finance East Africa', 'Capacity Building Coordinator', 'Plot 1, Kololo Hill Drive, Kampala Uganda', 'bankdeposit', '2024-06-24 03:47:49', '2024-06-24 03:47:49', NULL),
(37, 37, 'Grace Karendi', NULL, 'grace.mwiti@modestycredit.co.ke', '0708426388', 'MODESTY CREDIT LIMITED', 'FINANCE OFFICER', 'Union Square Building, 2nd Floor,\r\nP.O BOX 607-60200 Meru', 'mpesa', '2024-06-24 06:45:02', '2024-06-24 06:45:02', NULL),
(38, 38, 'Dream Credit Limited', NULL, 'lilianwgachoki1@gmail.com', '+254722497892', 'Dream Credit Limited', 'Director', 'P.O.BOX 23676 00100 NAIROBI', 'bankdeposit', '2024-06-24 07:05:05', '2024-06-24 07:05:05', NULL),
(39, 39, 'Kahuro Mary Wangechi', NULL, 'Mkahuro@gfedha.co.ke', '0722739654', 'GreenLand Fedha LTD', 'Area Manager', 'Box 30213-00100', 'bankdeposit', '2024-06-24 09:29:26', '2024-06-24 09:29:26', NULL),
(40, 40, 'Johannes Ebert', NULL, 'johannes@juakali.io', '+254796279968', 'Juakali', 'Business Developer', 'A8, Ravine Gardens Complex\r\n00100 Nairobi', 'mpesa', '2024-06-24 09:42:35', '2024-06-24 09:42:35', NULL),
(41, 41, 'Kayanja Julius Mawejje', NULL, 'kayanjajmawejje@yahoo.com', '+256753205160', 'The Observer Media Limited', 'Reporter', 'Kampala - Uganda', 'mpesa', '2024-06-24 13:30:48', '2024-06-24 13:30:48', NULL),
(42, 42, 'Francis Kamundia', NULL, 'franciskamundia.w@gmail.com', '0726977415', 'Own', 'Shareholder', 'South B, Nairobi, Kenya', 'bankdeposit', '2024-06-24 16:26:20', '2024-06-24 16:26:20', NULL),
(43, 43, 'Alberto Rodriguez', NULL, 'arodriguez@globalpartnerships.org', '0705593189', 'Global Partnerships', 'Portfolio Director', 'Workify at ABC Place', 'mpesa', '2024-06-25 02:45:19', '2024-06-25 02:45:19', NULL),
(44, 44, 'Awuor Oduor', NULL, 'jilianmasha4@gmail.com', '0713664203', 'CAD', 'Project officer', '2033', 'mpesa', '2024-08-05 13:27:31', '2024-08-05 13:27:31', NULL),
(45, 45, 'Federica Malfa', NULL, 'federica.malfa@incofin.com', '+320479150428', 'Incofin Investment Management', 'Investment Manager Africa', 'Sneeuwbeslaan 20, 2610 Antwerpen, Belgium', 'bankdeposit', '2024-08-20 05:23:55', '2024-08-20 05:23:55', NULL),
(46, 46, 'Maureen Njeru', NULL, 'maureen.njeru@incofin.com', '0715285471', 'Incofin', 'Investment Officer', 'Nairobi', 'bankdeposit', '2024-08-20 05:39:22', '2024-08-20 05:39:22', NULL),
(47, 47, 'Test Person Aug', NULL, 'tester1@fincon2024.co.ke', '0721382643', 'Test COpmany', 'Test Job', 'Test Address', 'bankdeposit', '2024-08-20 08:33:27', '2024-08-20 08:33:27', NULL),
(48, 48, 'Test Person Aug', NULL, 'tester1@fincon2024.co.ke', '0721382643', 'Test COpmany', 'Test Job', 'Test Address', 'mpesa', '2024-08-20 08:37:22', '2024-08-20 08:37:22', NULL),
(49, 49, 'Test Person Aug', NULL, 'tester1@fincon2024.co.ke', '0721382643', 'Best Company', 'Best Job', 'Best Address', 'bankdeposit', '2024-08-20 08:40:44', '2024-08-20 08:40:44', NULL),
(50, 50, 'Test Person Aug', NULL, 'tester1@fincon2024.co.ke', '0721382643', 'Best Company', 'Best Job', 'Best Address', 'mpesa', '2024-08-20 08:40:50', '2024-08-20 08:40:50', NULL),
(51, 51, 'Test Person Aug 2', NULL, 'tester1@fincon2024.co.ke', '07237788899', 'Bester Compay', 'Bester Job', 'Bester Address', 'bankdeposit', '2024-08-20 10:06:07', '2024-08-20 10:06:07', NULL),
(52, 52, 'Test Person Aug 2', NULL, 'tester1@fincon2024.co.ke', '07237788899', 'Bester Compay', 'Bester Job', 'Bester Address', 'mpesa', '2024-08-20 10:06:22', '2024-08-20 10:06:22', NULL),
(53, 53, 'Test Person Aug 2', NULL, 'tester1@fincon2024.co.ke', '07237788899', 'Test COpmany', 'Test Job', 'fff', 'mpesa', '2024-08-20 10:19:22', '2024-08-20 10:19:22', NULL),
(54, 54, 'Test Person Aug 2', NULL, 'tester1@fincon2024.co.ke', '07237788899', 'Test COpmany', 'Test Job', 'sdgdfhf', 'mpesa', '2024-08-20 10:21:47', '2024-08-20 10:21:47', NULL),
(55, 55, 'Test Person Aug 2', NULL, 'tester1@fincon2024.co.ke', '07237788899', 'Test COpmany', 'Test Job', 'fgf', 'mpesa', '2024-08-20 10:31:47', '2024-08-20 10:31:47', NULL),
(56, 56, 'Test Person Aug 2', NULL, 'tester1@fincon2024.co.ke', '07237788899', 'Test COpmany', 'Test Job', 'fd', 'mpesa', '2024-08-20 10:38:12', '2024-08-20 10:38:12', NULL),
(57, 57, 'Test Person Aug 2', NULL, 'tester1@fincon2024.co.ke', '07237788899', 'Best Company', 'Best Job', 'kjk', 'mpesa', '2024-08-20 10:49:29', '2024-08-20 10:49:29', NULL),
(58, 58, 'Test Person Aug 2', NULL, 'tester1@fincon2024.co.ke', '07237788899', 'Bester Compay', 'Best Job', 'fff', 'mpesa', '2024-08-20 11:00:02', '2024-08-20 11:00:02', NULL),
(59, 59, 'Test Person Aug 2', NULL, 'tester1@fincon2024.co.ke', '07237788899', 'Bester Compay', 'Test Job', 'sdgfd', 'mpesa', '2024-08-20 11:06:37', '2024-08-20 11:06:37', NULL),
(60, 60, 'Better Test', NULL, 'tester1@fincon2024.co.ke', '08929283883', 'Bester Compay', 'Bester Job', 'hfdj', 'mpesa', '2024-08-20 11:11:28', '2024-08-20 11:11:28', NULL),
(61, 61, 'Better Test', NULL, 'tester1@fincon2024.co.ke', '08929283883', NULL, NULL, NULL, 'mpesa', '2024-08-20 11:12:31', '2024-08-20 11:12:31', NULL),
(62, 62, 'Todays Test', NULL, 'tester1@fincon2024.co.ke', '0723887990', NULL, NULL, NULL, 'mpesa', '2024-08-20 11:31:23', '2024-08-20 11:31:23', NULL),
(63, 63, 'Todays Test', NULL, 'tester1@fincon2024.co.ke', '0723887990', NULL, NULL, NULL, 'bankdeposit', '2024-08-20 11:32:15', '2024-08-20 11:32:15', NULL),
(64, 64, 'Todays Test', NULL, 'tester1@fincon2024.co.ke', '0723887990', NULL, NULL, NULL, 'bankdeposit', '2024-08-20 11:32:25', '2024-08-20 11:32:25', NULL),
(65, 65, 'Todays Test', NULL, 'tester1@fincon2024.co.ke', '0723887990', NULL, NULL, NULL, 'mpesa', '2024-08-20 12:06:39', '2024-08-20 12:06:39', NULL),
(66, 66, 'Todays Test', NULL, 'tester1@fincon2024.co.ke', '0723887990', NULL, NULL, NULL, 'bankdeposit', '2024-08-20 12:07:28', '2024-08-20 12:07:28', NULL),
(67, 67, 'Todays Test', NULL, 'tester1@fincon2024.co.ke', '0723887990', NULL, NULL, NULL, 'bankdeposit', '2024-08-20 12:07:38', '2024-08-20 12:07:38', NULL),
(68, 68, 'Tesuday Tester', NULL, 'tester1@fincon2024.co.ke', '07828289293', NULL, NULL, NULL, 'bankdeposit', '2024-08-20 12:12:48', '2024-08-20 12:12:48', NULL),
(69, 69, 'Tesuday Tester', NULL, 'tester1@fincon2024.co.ke', '07828289293', NULL, NULL, NULL, 'bankdeposit', '2024-08-20 12:12:56', '2024-08-20 12:12:56', NULL),
(70, 70, 'Noah Ndakala', NULL, 'noah@ndakalaadvisory.co.ke', '+254722220013', 'Ndakala Advisory LLP', 'Managing Partner', '246A Owashika Road, Lavington\r\nP.O Box 6512-00200', 'mpesa', '2024-08-21 10:01:04', '2024-08-21 10:01:04', NULL),
(71, 72, 'Last Tester Thursday', NULL, 'tester1@fincon2024.co.ke', '0788909876', 'Bester of my Compay', 'Best of my job', NULL, 'mpesa', '2024-08-22 08:39:09', '2024-08-22 08:39:09', NULL),
(72, 73, 'Test Person aug thurs', NULL, 'tester1@fincon2024.co.ke', '0723889009', 'Bester of my Compay', 'Best Job mnn', NULL, 'bankdeposit', '2024-08-22 08:46:23', '2024-08-22 08:46:23', NULL),
(73, 74, 'Test Person aug thurs', NULL, 'tester1@fincon2024.co.ke', '0723889009', 'Bester of my Compay', 'Best Job mnn', NULL, 'bankdeposit', '2024-08-22 08:46:41', '2024-08-22 08:46:41', NULL),
(74, 75, 'Test Person aug thurs', NULL, 'tester1@fincon2024.co.ke', '0723889009', 'Bester Compay', 'Bester Job', NULL, 'bankdeposit', '2024-08-22 08:47:26', '2024-08-22 08:47:26', NULL),
(75, 76, 'Test Person aug thurs', NULL, 'tester1@fincon2024.co.ke', '0723889009', 'Bester Compay', 'Bester Job', NULL, 'mpesa', '2024-08-22 08:47:37', '2024-08-22 08:47:37', NULL),
(76, 77, 'last test today', NULL, 'tester1@fincon2024.co.ke', '07889999098', 'Today Company', 'Today Job', NULL, 'mpesa', '2024-08-22 08:50:05', '2024-08-22 08:50:05', NULL),
(77, 78, 'WINNIE TERRY', NULL, 'info@tamfi.co.tz', '0752251188', 'Tanzania Association of Microfinance Institutions', 'Executive Director', NULL, 'bankdeposit', '2024-08-22 10:09:21', '2024-08-22 10:09:21', NULL),
(78, 79, 'Damaris Kimani', NULL, 'mwihakidamaris803@gmail.com', '0741397946', 'Grey Apple Limited', 'event marketing', NULL, 'mpesa', '2024-08-23 09:53:52', '2024-08-23 09:53:52', NULL),
(79, 80, 'Aayush Khanal', NULL, 'ayushkhanal166@gmail.com', '9745479915', NULL, NULL, NULL, 'bankdeposit', '2024-09-01 05:23:29', '2024-09-01 05:23:29', NULL),
(80, 81, 'Becky Mangla', NULL, 'becky@gmail.com', '+254719274495', 'Pngme', 'Growth Lead', NULL, 'bankdeposit', '2024-09-05 09:30:12', '2024-09-05 09:30:12', NULL),
(81, 82, 'WIINNIE TERRY', NULL, 'mclemence@tamfi.co.tz', '0675987923', 'TANZANIA ASSOCIATION OF MICROFINANCE INSTITUTIONS (TAMFI)', 'CEO', NULL, 'bankdeposit', '2024-09-06 04:19:39', '2024-09-06 04:19:39', NULL),
(82, 83, 'Test Raila Odinga', NULL, 'tester1@fincon2024.co.ke', '0723998009', 'Orange Democratic Movement', 'Party Leader', NULL, 'mpesa', '2024-09-07 08:40:35', '2024-09-07 08:40:35', NULL),
(83, 84, 'Sep Test', NULL, 'tester11@fincon2024.co.ke', '0728282929', 'jjj', 'jjj', NULL, 'bankdeposit', '2024-09-07 08:47:36', '2024-09-07 08:47:36', NULL),
(84, 85, 'Bank Deposit customer', NULL, 'tester1@fincon2024.co.ke', '072377768889', 'Bank Cmany', 'Bank Job title', NULL, 'bankdeposit', '2024-09-07 11:44:26', '2024-09-07 11:44:26', NULL),
(85, 86, 'Raila Bank', NULL, 'tester1@fincon2024.co.ke', '07236363748', 'test compny', 'test job', NULL, 'bankdeposit', '2024-09-07 11:51:23', '2024-09-07 11:51:23', NULL),
(86, 87, 'Ruto William', NULL, 'tester1@fincon2024.co.ke', '07890009887', 'rutonimocs', 'tujo', NULL, 'bankdeposit', '2024-09-07 12:14:42', '2024-09-07 12:14:42', NULL),
(87, 88, 'Testing Progress', NULL, 'progress@mail.com', '07290009887', 'progress company', 'progress title', NULL, 'bankdeposit', '2024-09-07 12:25:36', '2024-09-07 12:25:36', NULL),
(88, 89, 'Saturday progress', NULL, 'saturday@mail.com', '073838399484', 'company', 'job title', NULL, 'bankdeposit', '2024-09-07 12:28:18', '2024-09-07 12:28:18', NULL),
(89, 90, 'Morgan Abira', NULL, 'abiramorgan@gmail.com', '0719823680', NULL, NULL, NULL, 'mpesa', '2024-09-09 02:17:45', '2024-09-09 02:17:45', NULL),
(90, 91, 'Jane Ndegwa', NULL, 'jnd@exante.eu', '+254724803845', 'EXANTE', 'Senior Relationship Manager', NULL, 'mpesa', '2024-09-09 04:20:23', '2024-09-09 04:20:23', NULL),
(91, 92, 'Jane Ndegwa', NULL, 'jnd@exante.eu', '+254724803845', 'EXANTE', 'Senior Relationship Manager', 'Portomaso Tower, Annex Level 7\r\nVjal Portomaso', 'mpesa', '2024-09-09 07:23:58', '2024-09-09 07:23:58', NULL),
(92, 93, 'Jane Ndegwa', NULL, 'jnd@exante.eu', '+254724803845', 'EXANTE', 'Senior Relationship Manager', 'Portomaso Tower, Annex Level 7\r\nVjal Portomaso', 'bankdeposit', '2024-09-09 07:24:09', '2024-09-09 07:24:09', NULL),
(93, 94, 'Michael Elifura', NULL, 'michael@gmail.com', '0787322322', 'Elifura Company', 'Credit Manager', NULL, 'bankdeposit', '2024-09-09 07:25:09', '2024-09-09 07:25:09', NULL),
(94, 95, 'Susan Awuor', NULL, 'skeziah003@gmail.com', '0728552225', 'BLACK BOW CONSULT LTD', 'CHIEF OPERATIONS OFFICER', NULL, 'mpesa', '2024-09-10 04:59:19', '2024-09-10 04:59:19', NULL),
(95, 96, 'Joyce Okebaso', NULL, 'okebasoj@gmail.com', '0113890368', NULL, NULL, NULL, 'mpesa', '2024-09-12 03:19:23', '2024-09-12 03:19:23', NULL),
(96, 97, 'Rosemary.waweru', NULL, 'rosemary.waweru@fincredit.co.ke', '0725425500', 'Fincredit Ltd', 'Business Manager', NULL, 'bankdeposit', '2024-09-12 06:26:11', '2024-09-12 06:26:11', NULL),
(97, 98, 'Arnold Midung\'a', NULL, 'amidunga@gmail.com', '0720709711', 'Black bow Consult Limited', 'CEO', '3143', 'bankdeposit', '2024-09-12 06:45:32', '2024-09-12 06:45:32', NULL),
(98, 99, 'Humphrey Odendo', NULL, 'humphrey.odendo@icloud.com', '89999', 'GA', 'NA', NULL, 'mpesa', '2024-09-12 13:01:10', '2024-09-12 13:01:10', NULL),
(99, 100, 'Humphrey Odendo', NULL, 'humphreyodendo@icloud.com', '8899', 'GA', 'NA', NULL, 'bankdeposit', '2024-09-12 13:02:32', '2024-09-12 13:02:32', NULL),
(100, 101, 'Humphrey Odendo', NULL, 'humphreysodendo@icloud.com', '8888', 'hh', 'nn', NULL, 'bankdeposit', '2024-09-12 13:03:40', '2024-09-12 13:03:40', NULL),
(101, 102, 'Humphrey Odendo', NULL, 'humphreyzodendo@icloud.com', '8989', 'ga', 'na', NULL, 'bankdeposit', '2024-09-12 13:06:33', '2024-09-12 13:06:33', NULL),
(102, 103, 'Shatsima Kennedy', NULL, 'shatsimak@gmail.com', '254746097124', 'TAMALAKI MEDICAL', 'Director', NULL, 'bankdeposit', '2024-09-14 18:22:49', '2024-09-14 18:22:49', NULL),
(103, 104, 'Simon', NULL, 'simonedasi@gmail.com', '0702540617', '2580', '1234', NULL, 'mpesa', '2024-09-15 10:48:55', '2024-09-15 10:48:55', NULL),
(104, 105, 'Hanningtone soita', NULL, 'hanningtonhanny82@gmail.com', '0795340200', NULL, NULL, NULL, 'mpesa', '2024-09-15 18:12:40', '2024-09-15 18:12:40', NULL),
(105, 106, 'mwita peter shen', NULL, 'shem@gmail.com', '0710402856', 'any', 'any job', NULL, 'mpesa', '2024-09-15 18:34:23', '2024-09-15 18:34:23', NULL),
(106, 107, 'Stephen', NULL, 'mogitastephen722@gmail.com', '0710488111', '2888', '2525', NULL, 'mpesa', '2024-09-16 07:16:21', '2024-09-16 07:16:21', NULL),
(107, 108, 'Eric Njoroge', NULL, 'enjoroge@mespt.org', '+254720398569', 'MESPT', 'Head of Fund  Raising', NULL, 'bankdeposit', '2024-09-17 04:44:34', '2024-09-17 04:44:34', NULL),
(108, 109, 'Kathrin Gerner', NULL, 'kathrin.gerner@gmail.com', '+250784117414', 'Grameen Crédit Agricole Foundation', 'Investment Advisor', NULL, 'bankdeposit', '2024-09-17 11:27:26', '2024-09-17 11:27:26', NULL),
(109, 110, 'Monica Wangeci Ndungu', NULL, 'mwangeci@asa-ke.com', '+254724377960', 'ASA INTERNATIONAL KENYA LIMITED', 'CHIEF FINANCE OFFICER', NULL, 'bankdeposit', '2024-09-17 12:29:44', '2024-09-17 12:29:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organizers`
--

CREATE TABLE `organizers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_page` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_handle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci,
  `long_desc` text COLLATE utf8mb4_unicode_ci,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizers`
--

INSERT INTO `organizers` (`id`, `user_id`, `name`, `phone`, `email`, `website`, `fb_page`, `twitter_handle`, `youtube_channel`, `short_desc`, `long_desc`, `logo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 12, 'Greyapple Ltd', '0723556778', 'info@greyapple.co.ke', 'www.greyapple.co.ke', 'www.facebook.com/greyappleevents', 'www.twitter.com/greyappleltd', 'www.youtube.com/greyapple', 'This is the organizer that does good things that we can live for in the world', 'We love to organize events, from small one to the big ones', 'greyapple-ltd.jpg', '2023-04-09 10:29:18', '2023-04-09 10:32:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','active','inactive','terminated') CHARACTER SET latin1 NOT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `contact_person`, `phone`, `email`, `website`, `package_id`, `short_desc`, `status`, `company_logo`, `event_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'The National Treasury & Planning', 'Ndungu', '0727827827827', 'info@treasury.corg', 'https://www.treasury.go.ke/', 'Platinum', 'This is the ministry of treasury', 'active', '130624the-national-treasury-planning.png', 1, '2024-06-13 13:50:38', '2024-06-21 17:41:40', NULL),
(2, 'FSD Kenya', 'Beverly Simiyu', '+254721382644', 'g@gg.kk', 'https://www.fsdkenya.org/', 'Gold', 'FSD Kenya', 'active', '130624fsd-kenya.jpeg', 1, '2024-06-13 16:32:21', '2024-06-21 17:42:40', NULL),
(3, 'Post Bank', 'Beverly Simiyu', '+254721382644', 'bev@icloud.com', 'https://postbank.co.ke/', 'Category', 'Best Bank', 'active', '130624post-bank.png', 1, '2024-06-13 16:55:29', '2024-06-21 17:39:51', NULL),
(4, 'Momentum Credit', 'Beverly Simiyu', '0709 434 000', 'info@momentumcredit.co.ke', 'https://momentum.ke/', 'Category', 'Founded in March 2017, our mission has since evolved to become the leader in financing motor\r\nvehicle-related transactions across Africa. We deliver against this mission by unlocking\r\ncollateral held in our client’s motor vehicles – without needing to liquidate their asset.\r\nStrategic partnerships and category expertise enable us to pass on affordability and an\r\nincreasing range of solutions to serve motor vehicle owners over their vehicle’s lifetime. Our\r\nsolutions include; Logbook Loans, Motor import financing, a revolving credit facility secured by the motor\r\nvehicle asset, affordable insurance premium payment, key-to-key motor vehicle trade-in &\r\nautomotive repairs financing.', 'active', '140624momentum-credit.jpg', 1, '2024-06-14 03:52:31', '2024-06-14 03:56:47', NULL),
(5, 'Water.org', 'Beverly Simiyu', '0777777', 'info@water.org', 'https://water.org/', 'Platinum', 'Water.org is a global nonprofit organization working to bring water and sanitation to the world. We want to make it safe, accessible, and cost-effective.\r\n\r\nWe help people get access to safe water and sanitation through affordable financing, such as small loans. We give our everything every day to empower people in need with these life-changing resources – giving women hope, children health and families a bright future.', 'active', '140624waterorg.jpg', 1, '2024-06-14 10:15:55', '2024-06-14 10:15:55', NULL),
(6, 'Liberty Heritage Insurance Company', 'Beverly Simiyu', '0711028000', 'info@liberty.co.ke', 'https://www.liberty.co.ke/', 'Goldplus', 'We are a leading Insurance Company, affiliated to Liberty Group, a wealth management company represented in 18 African countries. We use our knowledge and actions to guide our customers on their journey to financial freedom. We believe in responding to the changing consumer and market needs through innovative solutions and technologically efficient processes.', 'active', '140624liberty-heritage-insurance-company.jpg', 1, '2024-06-14 11:05:02', '2024-06-14 11:11:58', NULL),
(7, 'Open Tech', 'Beverly Simiyu', '+254729908741', 'chegzcol@gmail.com', 'https://www.linkedin.com/company/opentech-global-services-ltd/?originalSubdomain=ke', 'Goldplus', 'Open Tech', 'active', '190624open-tech.jpg', 1, '2024-06-19 09:45:13', '2024-06-21 17:38:54', NULL),
(8, 'Premier Credit Limited', 'Beverly Simiyu', '+254729908741', 'chegzcol@gmail.com', 'https://premierkenya.co.ke/', 'Goldplus', 'Premier Kenya is a company in Kenya.', 'active', '200624premier-credit-limited.png', 1, '2024-06-20 08:57:10', '2024-06-20 08:57:10', NULL),
(9, 'Platinum Credit', 'Beverly Simiyu', '+254729908741', 'chegzcol@gmail.com', 'https://platinumcredit.co.ke/', 'Gold', 'Platinum Credit', 'active', '200624platinum-credit.png', 1, '2024-06-20 09:03:35', '2024-06-20 09:03:35', NULL),
(10, 'My Credit Ltd', NULL, '+254729908741', 'chegzcol@gmail.com', 'https://www.mycredit.co.ke/', 'Gold', 'MyCredit is a non-bank financial services company registered in Kenya under the Companies Act, Laws of Kenya.\r\n\r\nWe offer loans, guarantees, leasing and insurance services. We are a credit only finance company.', 'active', '200624my-credit-ltd.png', 1, '2024-06-20 09:07:10', '2024-06-20 09:07:10', NULL),
(11, 'Bimas kenya', 'Beverly Simiyu', '+254729908741', 'info@bimaskenya.com', 'https://www.bimaskenya.com/', 'Goldplus', 'Bimas Kenya is a human and enterprise development organization without religious, political or Governmental affiliations that provides access to financial and technical assistance services to clients for sustainable wealth creation.\r\nThe overall goal of BIMAS is to realize sustained economic growth and employment in the rural sector resulting in enhanced social welfare and increased income of the rural population in Kenya. This ultimately reduces poverty and improve people’s wellbeing sustainably.\r\n\r\nWe are a leading microfinance institution in Kenya with its Head office in Embu having 39 branches countrywide in 18 counties.', 'active', '200624bimas-kenya.png', 1, '2024-06-20 09:14:50', '2024-06-20 09:14:50', NULL),
(12, 'Aspekt', 'Beverly Simiyu', '+254729908741', 'chegzcol@gmail.com', 'https://aspekt.mk/', 'Goldplus', 'Aspekt', 'active', '200624aspekt.png', 1, '2024-06-20 09:48:24', '2024-06-21 17:46:31', NULL),
(13, 'Juhudi Kilimo', 'Beverly Simiyu', '+254 709 69 20 00', 'info@juhudikilimo.com', 'https://juhudikilimo.com/', 'Goldplus', 'Unlike traditional microfinance, which primarily provide loans for working capital to informal businesses, we finance specific agricultural assets that offer immediate and sustainable income for farmers.', 'active', '200624juhudi-kilimo.jpg', 1, '2024-06-20 09:52:19', '2024-06-20 09:52:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mindaugas.kaziulis@mogo.co.ke', '$2y$10$CpzX0.3ervNUHb3IgZD/QuCMH2NUlPFU4af0vbK/faNog/7/FVs1S', '2024-06-20 02:54:36'),
('phylisgepsconsult@gmail.com', '$2y$10$/CnNeVSin.HfB9uWGrP67u1wCgvmWsgxw5lV8d7m13Iqov4zlgSAy', '2024-06-21 08:31:59'),
('maumaugck@yahoo.com', '$2y$10$qSQ0cg7ZOilfXqfJ6vCg8.GZCS1tMY7KvtojPR7TUZsVG6d/opfCi', '2024-06-27 10:19:46'),
('lys.m.ilunga@gmail.com', '$2y$10$9zh/VSxuOgIbM8FqK4gB3.TQLiwKWDHEsmn2ditLHtOxY4t.NM8ZC', '2024-07-31 02:17:18'),
('skeziah003@gmail.com', '$2y$10$gKuwLOtvvmwu7E2K4DH5qONAm3cJDu/GulnyMdKmebN0LmBjpt/nC', '2024-09-10 04:55:50'),
('mwihakidamaris803@gmail.com', '$2y$10$djrTfYW/Pb9zJfqbuS65DeUpegRFwavigIBpMfVaUTvLeKiCdYYCi', '2024-09-10 04:56:29');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `trans_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `paymode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` enum('KES','USD','EURO') NOT NULL,
  `pay_amount` decimal(10,2) NOT NULL,
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pay_date` date NOT NULL,
  `status` enum('pending','accepted','rejected','cancelled') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `trans_code`, `order_id`, `paymode`, `currency`, `pay_amount`, `memo`, `pay_date`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'mpesaiVwNo1xt2024-08-20 13:21:47', 55, 'mpesa', 'KES', 52000.00, '0729908741 ws_CO_20082024162154509729908741 ws_CO_20082024162154509729908741 Test Person Aug 2', '2024-08-20', 'accepted', '2024-08-20 10:21:54', '2024-08-20 10:21:54', NULL),
(2, 'mpesaiVwNo1xt2024-08-20 13:21:47', 55, 'mpesa', 'KES', 52000.00, '0729908741 ws_CO_20082024162750151729908741 ws_CO_20082024162750151729908741 Test Person Aug 2', '2024-08-20', 'pending', '2024-08-20 10:27:50', '2024-08-20 10:27:50', NULL),
(3, 'mpesaY89tCGOW2024-08-20 13:38:12', 57, 'mpesa', 'KES', 52000.00, '0729908741 ws_CO_20082024163821619729908741 ws_CO_20082024163821619729908741 Test Person Aug 2', '2024-08-20', 'pending', '2024-08-20 10:38:22', '2024-08-20 10:38:22', NULL),
(4, 'mpesaoTKoFMTT2024-08-20 13:49:29', 58, 'mpesa', 'KES', 52000.00, '0729908741 ws_CO_20082024164940065729908741 ws_CO_20082024164940065729908741 Test Person Aug 2', '2024-08-20', 'pending', '2024-08-20 10:49:40', '2024-08-20 10:49:40', NULL),
(5, 'mpesaVV2YEw8V2024-08-20 14:00:02', 59, 'mpesa', 'KES', 52000.00, '0729908741 ws_CO_20082024170008196729908741 ws_CO_20082024170008196729908741 Test Person Aug 2', '2024-08-20', 'pending', '2024-08-20 11:00:08', '2024-08-20 11:00:08', NULL),
(6, 'mpesaUQ3b59Jt2024-08-20 14:06:37', 60, 'mpesa', 'KES', 52000.00, '0729908741 ws_CO_20082024170645781729908741 ws_CO_20082024170645781729908741 Test Person Aug 2', '2024-08-20', 'pending', '2024-08-20 11:06:46', '2024-08-20 11:06:46', NULL),
(7, 'mpesaqEDmJWuT2024-08-20 14:11:28', 61, 'mpesa', 'KES', 39000.00, '0729908741 ws_CO_20082024171136451729908741 ws_CO_20082024171136451729908741 Better Test', '2024-08-20', 'pending', '2024-08-20 11:11:36', '2024-08-20 11:11:36', NULL),
(8, 'mpesaS3nYyfhA2024-08-20 14:12:31', 62, 'mpesa', 'KES', 39000.00, '0729908741 ws_CO_20082024171236528729908741 ws_CO_20082024171236528729908741 Better Test', '2024-08-20', 'pending', '2024-08-20 11:12:36', '2024-08-20 11:12:36', NULL),
(9, 'mpesaoTjeCGM32024-08-20 14:31:22', 63, 'mpesa', 'KES', 39000.00, '0729908741 ws_CO_20082024173137976729908741 ws_CO_20082024173137976729908741 Todays Test', '2024-08-20', 'pending', '2024-08-20 11:31:38', '2024-08-20 11:31:38', NULL),
(10, 'mpesaB3Z5bbVO2024-08-20 15:06:39', 66, 'mpesa', 'KES', 39000.00, 'ws_CO_20082024180645452729908741', '2024-08-20', 'pending', '2024-08-20 12:06:45', '2024-08-20 12:06:45', NULL),
(11, 'mpesavPKvUvxk2024-08-22 11:39:09', 73, 'mpesa', 'KES', 52000.00, 'ws_CO_22082024143927674729908741', '2024-08-22', 'pending', '2024-08-22 08:39:28', '2024-08-22 08:39:28', NULL),
(12, 'mpesaaCe8eHrb2024-08-22 11:50:05', 78, 'mpesa', 'KES', 52000.00, 'ws_CO_22082024145020631729908741', '2024-08-22', 'pending', '2024-08-22 08:50:21', '2024-08-22 08:50:21', NULL),
(13, 'mpesaeZdGLQ0h2024-08-23 12:53:52', 80, 'mpesa', 'KES', 52000.00, 'ws_CO_23082024155412563741397946', '2024-08-23', 'pending', '2024-08-23 09:54:15', '2024-08-23 09:54:15', NULL),
(14, 'x18mJKqr', 84, 'mpesa', 'KES', 52000.00, 'ws_CO_07092024144101747729908741', '2024-09-07', 'pending', '2024-09-07 08:41:02', '2024-09-07 08:41:02', NULL),
(15, 'gXzjWG1U', 92, 'mpesa', 'KES', 52000.00, 'ws_CO_09092024102055217724803845', '2024-09-09', 'pending', '2024-09-09 04:20:58', '2024-09-09 04:20:58', NULL),
(16, 'mpesahXzIQLBA2024-09-10 07:59:19', 96, 'mpesa', 'KES', 52000.00, 'ws_CO_10092024110116900728552225', '2024-09-10', 'pending', '2024-09-10 05:01:17', '2024-09-10 05:01:17', NULL),
(17, 'oh8JNudz', 105, 'mpesa', 'KES', 39000.00, 'ws_CO_15092024164916495702540617', '2024-09-15', 'pending', '2024-09-15 10:49:18', '2024-09-15 10:49:18', NULL),
(18, 'uG6HxmQp', 108, 'mpesa', 'KES', 39000.00, 'ws_CO_16092024131643926710488111', '2024-09-16', 'pending', '2024-09-16 07:16:44', '2024-09-16 07:16:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_desc` text COLLATE utf8mb4_unicode_ci,
  `long_desc` text COLLATE utf8mb4_unicode_ci,
  `cover_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0KbMc068L6zhUBQoPIdl6emx0tIu3x97pLfa64Om', NULL, '161.35.246.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0VkVmlNMGxCSlQxaTZPWnB5NjBLWlZYeUJYSWttZHdzc2hLclZYVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721195891),
('1Ek3czOeyuUGV8SvJTS9nj9V6Ly62w3vmohi3xjH', 364, '154.122.33.251', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6Inl3MHNKSmZwYldyVWM3YTJLSXFBQnFqbzNGcnRKb3JXS0hiNlc0SUYiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMwOiJodHRwczovL2NoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozNjQ7czo4OiJldmVudF9pZCI7TjtzOjk6InRpY2tldF9pZCI7TjtzOjg6ImN1cnJlbmN5IjtOO3M6NToicHJpY2UiO047czozOiJxdHkiO047czo3OiJwYXltb2RlIjtzOjU6Im1wZXNhIjt9', 1721197560),
('1HqUcub8vRxtHyuYB9qMpFIzlOCMpXR3sOPKW44g', NULL, '135.148.100.196', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVRzWjhCcThYV1JsVlJPMjJDRWtSeFJWYjNpOElyOWswUVN2eEJ6QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721171237),
('2bNLSkG8brcpuKibOG5laMARVGMngA9XJOYOGl1o', NULL, '146.70.173.176', 'Python/3.9 aiohttp/3.8.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmZsc2hrVTd0dkQwU2xFakpQdEtXRUJjRlNLSHJka3NxTkxrR1BZYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721195668),
('2ls1sAW2NkTrQMd1QQx13krtVi4fvogpFrnGGiCW', NULL, '192.175.111.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHJxV1BpRFFsYzRoZGxXb1I1Q0RxQ3EwSGQ3Y0s0aFFiRk8xMWVQRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9jaGVnei5maW5jb24yMDI0LmNvLmtlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721172286),
('3OIyrSZiAkl6KAnmMwEWNDLHPIrvV2OUy76DZqBM', NULL, '93.174.93.114', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTlKaUVNT3JUU0pieU1KS2kxTEFsNHB1MVQyaWRaN2VBcU96QTdqMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721195683),
('40w3XJmbGmLft3MTdwPGXUsRWNIunSmpkBo05z9o', NULL, '129.153.125.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1RFR3VuMHlaRkVObm5RTVlpWDBHdnd1TEtTSjRnazJtM3NCM0EyaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721170033),
('6id3QFSoaUOHM2ScoCm7BoeGO9qzhZRBqik6zaON', NULL, '104.166.80.160', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGJBd2hqT1dnWnZ0MUlZOGdjZlJaSEFkRzNXUG5VNG9iNWl1ajVCYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721180988),
('73nsWuMVrilz9y3jyVGOpFdqOBa5ca41bxcXoEEJ', NULL, '51.178.81.195', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjZmdTM4SnYyWEhuSHVWc3U5cmMyMWpZZVVIOHZXNElDdHN1T1RVQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly93d3cuY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721195907),
('8NHFriOVaPpagcCoPNnZUovJ2fKE5KMTEv6rbtJh', NULL, '54.247.57.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmJRN0tYd0hacUVCaHdncTVpbzRIcDBwWG5wU1Z3MnJZZE9lQlZ4SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721180060),
('8r7lGhCv1pEHdwh2vLBKTAU7TaMRuVEsmPRf6Kqz', NULL, '37.59.164.99', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2FNdWg3TWZ5NElQemdzVk4xZFdIbVp3UHRsVEhmUnZLUHNVdFhIVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721185941),
('92TCgGP7c8VzPyChmQvddk6E40FCCdjdNQg0QKfH', NULL, '129.153.125.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE10UXFHTnAxNHJrclhYMWswTndEU2dyVzA3Y1pSMWlsczh5clJpeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721174510),
('9MPOy40hveTR8Cjh68XmmWqsaNMJwWlspeGPeqLE', NULL, '104.166.80.83', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWJFb0FIbHo3VjlVajlPdmR6Uk15NFNFOVRteUdxNHBzVXRzV3dMRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721186706),
('9TmIQxv0TrRhuxhltzexNYBOW0eYI0bGbEqcjURG', NULL, '31.6.10.234', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemhrWktyZlVURXgxa2RweEtCanh2TGpubllaaTczUEp4VjQ0YTI2UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly93d3cuY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721195905),
('AkLhVMXsNEofcaZg4T3PivgT4pWbKyRyyan522Iv', NULL, '116.70.228.250', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/83.0.4103.88 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSWszMEpXRURMNmFZaUxteXlQQXh2MGI3Zmp3aE1iWndOcndUM3VWaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721197701),
('BG5UqPXhbHCsUYTEuBWSP9Xwrs72ED8P4FT6kMuz', NULL, '154.122.33.251', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVpKeG1XSGlkMktpbU0zZEZsblpjSTA1VHFVa01TdGxzSGROY1hrUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721197898),
('Bow9lX9fxQ3ma9rmGKucdl51VVkoZDAyrYbt1lRu', NULL, '104.166.80.36', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTk5YZzNOTVFmOGFRYk9FaUJOYVIwWGM2OGJlM2dPeFF5Ymt0d3pjQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721181226),
('C4Uc67gTxDhntBIOIpLhY0eLLUAPd5YSlWOgdoDM', NULL, '146.70.225.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3EzZnNLelo1V2xzS2RrTE5Dd2ZrbTdRcWtBTkx4cW9SYjhYRnpaOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721179610),
('cgDxoahYarsZtUxvyCsnEg3a7417LzhxRVU6RHGM', NULL, '54.247.57.72', 'Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2d2QTNLZk1DbVlUeFA1eGZzWFBudFR1YXMzZ0hQN3JWajVEWU1ZeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721180060),
('cKf2P97vFSJ9wCBcWrFkzLSNWVjvPxgvncNlM18D', NULL, '135.148.100.196', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnhJMEFHc3RaakZRZERZR0FveHpGMEhGeGdGUHF4dFZLZWZoaTBoMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721171248),
('corFMT8uLqE6gZh4sUt3rSPFjGic6NlsPT0jHk1j', NULL, '192.175.111.228', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVE5HMTRoaExuTUtwcHVtOVo1RWdGTGtxWDE2SWVPNm9ickVtRm9YRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9jaGVnei5maW5jb24yMDI0LmNvLmtlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721172290),
('D6j73kUwVKRmUJ9ZaosGgTWhMq0koQgEfqspKJLm', 363, '105.160.111.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6IjlBb3c0bzlIbzVPMFFpQWxaYlBvTk16OEY3b3lVQVNVV2I5V0FyYTQiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM5OiJodHRwczovL2NoZWd6LmZpbmNvbjIwMjQuY28ua2UvcGF5bWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozNjM7czo4OiJldmVudF9pZCI7czoxOiIxIjtzOjk6InRpY2tldF9pZCI7czoxOiIxIjtzOjg6ImN1cnJlbmN5IjtzOjM6IlVTRCI7czo1OiJwcmljZSI7czo2OiI0MDAuMDAiO3M6MzoicXR5IjtzOjE6IjEiO3M6NzoicGF5bW9kZSI7czo1OiJtcGVzYSI7fQ==', 1721169560),
('dvYlonSK1xBMv6MRDP9LBQezu38S8DqHy98gZ1I5', NULL, '93.174.93.114', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGQ2S2g3NFpmVHI4bThvbHFFdnQ3aFRzb01FNDI0eWk1a0Q1M3VROSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721195686),
('FuEloMihk2nj5l9jT0avMw5BvsRLa7e8eBIUoupe', NULL, '54.247.57.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHlJdndmYTlKSzdVbTRIWmJnMnU3RVY0MGRybUR1OXJOeXo1b3NzdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721180046),
('Ghp5ensRFbeguuPT3MEJ4yd4GLHABDkevLPp5X8Q', NULL, '129.153.125.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUM5bjVwdkc2S0xRdGxZaXlES05xYktDVGVHNnJWc3UweTlyQ0xRYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721172506),
('go63uAXs3s5urk5HjiLniQEH7Ad7oprdLhW0rHEJ', NULL, '129.153.125.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkJ5M3JnV0Z4clZsa0c2aktUMDNTendxblp5bUExVHlQZHZ5R1o2SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721170034),
('hV4gZxHnb9CpuDf9INEAXVKI9K0CUbVLAZz192M2', NULL, '54.247.57.72', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFcxb3F6T2tTUTBCc2pHMHJoSThMdnlwOUZtQWk0S0YwQk1ZU0lMaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721180065),
('iANEde75RRsU30YvITfy4SIVSiqMGLA3dmViqYfU', NULL, '185.232.22.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36 Edg/121.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHVNbE5xUlgzcjNWdmFadFQ2eGFxaW11ZVVOc3NKRjJpWnlnQWoyMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly93d3cuY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721195904),
('IQHsl71gfin09VgyPPbTmvKd72ONzJQhrpbyPI02', NULL, '135.148.100.196', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGd4RmZqTHJLRmtINERsa29ZQklsdEFVNDU1bEY3Q29oajhGTTNUVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721171336),
('isk1SSsqHwCDP1PI95TIen8bl6O19u0xeVYOm2ur', NULL, '37.59.164.99', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY00wT1ZibVBDZ29GdTBib2dkTFpSMTI2WXNIMWxJUm0wNGN1WnpyMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721195639),
('jjdGBmPcMH4DkUtJz26G8E1yjQ5ZspRjKBx0Zfyq', NULL, '133.242.174.119', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWm85YTU3c3hGSzZkbmt3R1cyejhUQzNJZFJBTjc3YWh5NVdaUDV4cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721180352),
('kc90CRrBrTp4Mh9Y8cYi8ScEOAeguTOGTS9QwRFK', NULL, '5.164.29.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36 (scanner.ducks.party)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnk2NUlDTkI4SEhsWHJFQ0RsdnpUTVgwaTZkMTFuWHlUWDVmY0pzMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721175545),
('kKVS4Pyf5meaIMrUjUXjxgnTxZoJd0KxNXpUz1w5', NULL, '104.222.47.10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGZZWWhzenhIZGl2dG13Z2RFUDhDNGljQ3FNMXhmblczTEFKakZyUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721195772),
('lj7ahGUNFL3Ht02TZJMHRMHBCwjKwkcCC1oqhd9F', NULL, '64.15.129.126', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFczQzRiWDlVYUxuTDRnN0RZbUY0QmkyRWNSNE1ZU2tRRGFNR0k2eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9jaGVnei5maW5jb24yMDI0LmNvLmtlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721172289),
('M5sUQjWanKZIu4KC1esizO9cV8vHKrtIJoFiwkcd', NULL, '54.247.57.72', 'Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVlVaERRWlVMMkhqTGxVcGNsUlhOd1hpQTZSV0t0MzNlOTZwMklCeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721180040),
('MdAjkOo2XsOUiO2JDIgKlAfnIlkqMxmkn5w8XJk6', NULL, '185.253.162.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHIxR0FPUjBFbDN1NmlMZ09vblZ4N3FHY1kzMDdFSWp1ODd3a1dldCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721195776),
('mY3LehPrs0j1G1iz83dML5HTKOHlxcW2OPHkaBXT', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YToxMDp7czo2OiJfdG9rZW4iO3M6NDA6InRqZ29HQ1FIZ0N4aWZQczJXQWRrNkFMdTh3WERkckhURE9tZnJpS3oiO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvcGF5bWVudHMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O3M6ODoiZXZlbnRfaWQiO3M6MToiMSI7czo5OiJ0aWNrZXRfaWQiO3M6MToiMiI7czo4OiJjdXJyZW5jeSI7TjtzOjU6InByaWNlIjtzOjk6IjUyNTAwMC4wMCI7czozOiJxdHkiO3M6MToiMSI7czo3OiJwYXltb2RlIjtzOjU6Im1wZXNhIjt9', 1721168542),
('N7Jg2yP5duCioMI7QtZxjkoB2h2j4mOTZu6xSX79', NULL, '129.153.125.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUJOdlVuek92Z2FXM3diQklPd1pjN2dkUThoR3lqSXhQMkdnR2tGYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721172505),
('O09ElH2HryDTF4x1jWXDA3PR0eAwwvyijHj37uJK', NULL, '129.153.125.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0VEelplOEhSQWZ3b3Mwa284bmRPU081OVVYSHczSEF2eUo1b0x4eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721174520),
('POEwbEGpHMLd4x1z3oxsdsOy0yqxw5VLn7PEcI8F', NULL, '51.81.46.212', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiak9xMG5veG45Q2FPdHBZZko1NEs1dnUwZTJkQWJZN1NHdVdqNEI0diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721171400),
('PqAICMNrMLi7XPFOXAwYCuItb8lqUX9a8SDNTzyL', NULL, '64.15.129.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEgzNmUwQnpPd1o3c3Rhdkx0VTcwNURjR3NwdjBDQXdnQkNhOE53QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9jaGVnei5maW5jb24yMDI0LmNvLmtlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721172287),
('psUZ0Usb1juZjf84KHmZoSfFUre5icWJkZIGMrtk', NULL, '129.153.125.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmhsSzZ2SE5BNHIxOWdkZzZOOWhaVHgxNWNMeWhIRVJyZzhCSzg1NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721182628),
('QI73AwsmkuEjpBimrdAArKs1O52aFSWRiixOrjR1', NULL, '104.166.80.4', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0JmalU5REpEeXpCMW9uREFmSFJXVnFsbmZVd2g1bFFmZHdJT3FrUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721188660),
('qOAsDFDZoePxyf7bbKDvplnQeBQTaCNZ9aqM9Mna', NULL, '104.166.80.4', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVpIaEx1dnV6Vzc5a291cGhaeTlSRVhIZEE0MDVodFcxcVVFWktPQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721188659),
('qr5zh3TOI7MTESknlU7DhxYd6imKXAsVkDRVejBm', NULL, '161.35.246.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXk3bnVMUElrSjFsYnhJbUxtYjZlNGpuN0NQQ1lGTm1xNDM2eFViWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721196255),
('RR58bcb4v2wIy3QDPhhuzBU3HSkPV4UaW9A63hjf', NULL, '129.153.125.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUsybVdxZUZSVTZaZWRUcFlFOE1rMEZxNHB2bjJaQXhzUkJSaExSciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721174518),
('s01XG6rS3thYrfUgAc1c5rUjDhGE1QLgY5exSYe3', NULL, '165.231.253.252', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_2_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.2 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUJqemcwNkUyRmFOQVEwTXVLVkEzV0J5ekhhZnB5N3BscnB2aXVESSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly93d3cuY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721195905),
('STQlMKUfBbR9thdwfCGBfLvnXomG2duUNABg0yRJ', NULL, '49.98.132.60', 'Mozilla/5.0 (Android 10; Mobile; rv:109.0) Gecko/118.0 Firefox/118.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOFd1V0dTNzgyWUFORlRVa1dzenIyS2dPeXlOUExLY3RXR09qWmtmaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1721197309),
('txP4whgJqy40N8EUpSfiUyRwpbpBwS7hX4xrPjcb', NULL, '104.166.80.83', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGloN05OaG9zNHNnN0VrNVladGcxY0xhUVd6eXIxNFFxNkszU2pkTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721186705),
('u0RmT7aduEKsOTvBBXg4fnCOwlyKPDjWwSek9yQ7', NULL, '129.153.125.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3hvOGRmbzM2dXo4aTJvWk5YRE53eTQ1Mm1hTzMwVnNTdm1kc3RkVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721182629),
('UcEC3JQcS1w022bbIiaYi0mVtQZbCTnDGYrYglEz', NULL, '45.83.220.217', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUdqTHplY1ExTUNOalROa2RmZTZldzlJbldRdThrVU5RdWJJZFZXSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721180059),
('UeOm7VRNt0yRKNT5nKU2pOUoyKeROkA4yshf105V', NULL, '154.122.33.251', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGxnY2hya1hoaTV6c1E0TVlKYTlZR3JTQ3hjS1FFSEJZelMzRFk2QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721194433),
('w2bgnGIoYZmqdUrYdmRHJWQbazGTmXzbWnoXStL2', NULL, '67.21.32.150', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3RRZEJxVGZPR0xsakJGdzVGTVdmdE1iOUxSQjRaWmNmRVAwTU5QMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721196366),
('Y5Hx62TXhKPjBIPYrYEZKuDJV1l3atyjOQnBDfR4', NULL, '54.247.57.72', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjNoSlJZWE44Y0dJYkR5TXA5N3hJT0Z3YktXSk5IYnRsdU5XVFhVWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721180041),
('Yk2pdHyAYqpGZXr5AGHIUVwbe2yCgP4Iadmu05MN', NULL, '80.82.70.198', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmJIZzcxUU9WZ0paWXRiVEpZOWd1azJRSW10UGJQZ0VrN2hndHE2TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721195714),
('z2pLf6qlTFrRu6JGLOPU0y88NcLOBrQE3nt3CwLN', NULL, '49.98.132.60', 'Mozilla/5.0 (Android 10; Mobile; rv:109.0) Gecko/118.0 Firefox/118.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHpkWU41Rnl6MG9TMVk1YnJVMnRGUjZISXU4bnpTQThSSlFTVkpJMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721197311),
('zCzSMIYOHNAayn11kTMyBtbHbmf7Us7ABShXmBCX', NULL, '129.153.125.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnQzUlQyNnpETFk4VWNjMTE2dFJUSjdqZU1VYVg5Vzg4N2ZXNFg4NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vY2hlZ3ouZmluY29uMjAyNC5jby5rZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1721174511),
('ZD0yCYgVjsQ0flBgB2ayzCuRYWQvCO2ZHPV7f6HV', NULL, '94.102.49.206', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTJDMHphMGs4MEFtS05ZSURIRXozZlAzWEtNUHRqd2VLcTVjVGhXQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721195723),
('zP0cDzzFtAqQiqpBqJifZoqJLiiuG5qGuIG20gI8', NULL, '84.17.42.6', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQU9XSE9NYUJmYnFEaXF3cTYxdGxjWUkxcmMxOVQ2ZE1qcFd2Q3locSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmNoZWd6LmZpbmNvbjIwMjQuY28ua2UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1721195895);

-- --------------------------------------------------------

--
-- Table structure for table `speakers`
--

CREATE TABLE `speakers` (
  `id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yt_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ln_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `x_link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_desc` text,
  `long_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive','suspended') NOT NULL DEFAULT 'active',
  `profile_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `speakers`
--

INSERT INTO `speakers` (`id`, `name`, `job_title`, `company`, `phone`, `email`, `website`, `yt_link`, `fb_link`, `ln_link`, `x_link`, `short_desc`, `long_desc`, `status`, `profile_img`, `event_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'David Mukaru', 'CEO', 'Caritas Microfinance Bank.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'He has over 30 years of experience providing high level and executive leadership in microfinance and retail banking; that has led to empowering micro, small, medium, consumer and agri-businesses in Kenya; with over 10 years practical experience in executive management position excelling in leadership, business development, credit risk, credit administration and general credit operations.', '<P>He has over 30 years of experience providing high level and executive leadership in microfinance and retail banking; that has led to empowering micro, small, medium, consumer and agri-businesses in Kenya; with over 10 years practical experience in executive management position excelling in leadership, business development, credit risk, credit administration and general credit operations. </P>\r\n\r\n<P>Among successes, David has successfully turned around the micro credit and SME units; and also digitized the Bancassurance Business to achieve efficiency and productivity at Faulu MFB. As General Manager in Charge of Credit at Equity Bank Tanzania; supervised setting up of the Credit Department that was instrumental in achieving bank’s break even in a period of 2 years. As Head of Micro Credit in Equity Bank Kenya, established group lending unit, and successfully implemented youth and women loan and deposits products.  </P>\r\n<P>Highly skilled in setting up of Village Table Banking business model, product development, credit risk and credit operations, existing microfinance methodologies. Deep understanding and experience in setting up and managing microfinance programs in African context. Excellent track record in setting up financial services (Savings, Loans, Insurance, money transfer and enterprise training) products that benefit the unbanked Youth and Women. Excellent track record setting up financial education programs such Financial Education and Entrepreneurship training and business clubs</P>\r\n\r\n<P>An alumni of Microfinance Advanced Leadership (2010) program; Wharton Business School (University of Pennsylvania – USA). Master’s in Management of Agribusiness (MMA) Strathmore Business School. Graduated with a degree of Business Administration (Kenya Methodist University; Diploma in Business Administration from Mombasa Polytechnic University College and has attended many local and international courses and forum in the field of microfinance and commercial banking. He is also a Master Trainer in Financial Education.  </P>', 'active', '120624david-mukaru.png', 1, '2024-06-12 09:33:04', '2024-06-13 16:05:58', NULL),
(2, 'David Cracknell', 'Director', 'First Principles Consulting Limited', NULL, NULL, 'www.firstprinciplesinfinance.com.', NULL, NULL, NULL, NULL, 'David Cracknell is the Director of First Principles\r\nConsulting Limited, based in Nairobi and was\r\npreviously Managing Director (Africa) for MicroSave\r\n(MSC). His technical work focuses on financial\r\ninclusion, policy and regulation, strategic and\r\ninstitutional reviews, market research, pilot testing,\r\ndelivery channel diagnostics and service delivery, and\r\nwriting on microfinance and banking. He recently co-\r\npublished a book on Digital Financial Inclusion and\r\nMarket Development for AERC alongside other\r\nauthors.', '<p>David Cracknell is the Director of First Principles\r\nConsulting Limited, based in Nairobi and was\r\npreviously Managing Director (Africa) for MicroSave\r\n(MSC). His technical work focuses on financial\r\ninclusion, policy and regulation, strategic and\r\ninstitutional reviews, market research, pilot testing,\r\ndelivery channel diagnostics and service delivery, and\r\nwriting on microfinance and banking. He recently co-\r\npublished a book on Digital Financial Inclusion and\r\nMarket Development for AERC alongside other\r\nauthors. He has published over 70 blogs on financial\r\nservices on his website\r\n<a href=\"www.firstprinciplesinfinance.com\" target=\"_blank\">www.firstprinciplesinfinance.com</a>. He is a judge for\r\nthe Think Business Banking Awards, a keynote\r\nspeaker and board advisor. He has experience in over\r\n25 countries in Africa and Asia.</p>\r\n\r\n<p>His recent work includes strategy development for shared services, and for microfinance\r\ninstitutions. He works on digital agricultural finance. He has trained on ESG, assisted in the\r\ndevelopment of the National Financial Inclusion Strategy for South Sudan and prepared multi-\r\ncountry market feasibility studies. Earlier he worked through the National Treasury for SASRA, the\r\nSACCO Societies regulator on creating a policy and regulatory framework for shared services for\r\nSACCOs in Kenya, which is leading to the implementation of a shared technology platform for\r\nSACCOs.</p>\r\n\r\n<p>David has reviewed donors’ digital finance programs and performed country level studies leading\r\nto the creation of donor programs. At different times, he has worked building the capacity of\r\nCentral Banks, in Bangladesh, Uganda, Rwanda, Malawi and Zambia in digital financial services.</p>\r\n\r\n<p>David is fluent in English and has basic knowledge of Sinhalese and French. David has a Certificate in\r\nFinancial Technology from Oxford University Said Business School (UK), Post Graduate Diploma in\r\nBank Financial Management from the University of Sri Jayawardenapura (Sri Lanka), and a degree in\r\nEconomics from the University of Leicester (UK).</p>', 'active', '120624david-cracknell.jpg', 1, '2024-06-12 11:07:40', '2024-06-14 04:55:29', NULL),
(3, 'Ikechukwu (Ike) Godswill Iheagwam, B.Sc. (NGR), B.Sc. (UK), MSc, FCCA, CPA, CGA, LIFA.', 'Regional Director for East Africa', 'Agusto & Co.', '+254721382644', 'info@fincon2024.co.ke', 'https://www.miceafrica.org', NULL, NULL, NULL, NULL, 'Ike serves as the Regional Director for East Africa at Agusto & Co. and concurrently holds the position of Associate Director in the Corporate, Structured Finance and Sovereign Ratings Division. Additionally, he is a member of the Agusto & Co. Group Credit Rating Committee. Throughout his credit rating career, Ike has conducted evaluations for over 200 corporate entities and 40 sub-national governments, facilitating access to over USD3 billion from the capital markets in Sub-Saharan Africa. His expertise extends to sustainable and climate finance appraisals, green bond verification, sovereign credit assessments across sub-Saharan economies, and research covering various industries in Africa.', '<p>Ike serves as the Regional Director for East Africa at Agusto & Co. and concurrently holds the position of Associate Director in the Corporate, Structured Finance and Sovereign Ratings Division. Additionally, he is a member of the Agusto & Co. Group Credit Rating Committee. Throughout his credit rating career, Ike has conducted evaluations for over 200 corporate entities and 40 sub-national governments, facilitating access to over USD3 billion from the capital markets in Sub-Saharan Africa. His expertise extends to sustainable and climate finance appraisals, green bond verification, sovereign credit assessments across sub-Saharan economies, and research covering various industries in Africa.</p>\r\n\r\n<p>Prior to joining Agusto & Co, Ike worked as a credit and market intelligence analyst in the Private\r\nBanking unit of Access Bank Plc. He was a credit relationship officer at Guaranty Trust Bank Plc and\r\nalso an analyst in the Corporate Finance unit of Fidelity Bank Plc.</p>\r\n\r\n<p>He has trained over 2,000 participants (as a Senior Faculty Member at Agusto Consulting Limited –\r\na wholly-owned subsidiary of Agusto & Co.) from the private sector (financial services & real sector)\r\nand public sector on various financial management courses such as accounting, financial analysis,\r\ncore credit analysis, report writing, budgeting, corporate reporting, mergers & acquisitions, credit\r\nrisk management, macroeconomic analysis, project finance, structured finance, green, social and\r\nsustainable finance. He is also a member and has made presentations at the African Peer Review\r\nMechanism (APRM - a specialized agency of the African Union) workshops in Johannesburg, Addis\r\nAbaba & Lusaka, on credit rating development in Africa, and facilitated several social entrepreneurial\r\nworkshops in the course of his career.</p>\r\n\r\n<p>Ike holds two Bachelor of Science degrees - Banking & Finance (first-class honours) from Nnamdi\r\nAzikiwe University, Nigeria, and Applied Accounting (second-class honours) from Oxford Brookes\r\nUniversity, United Kingdom - and a Master of Science degree in Finance from the University of Lagos,\r\nNigeria. Ike is a Fellow of the Association of Chartered Certified Accountants (FCCA), United Kingdom,\r\nan Associate of the Chartered Professional Accountants (CPA) of Canada and a Chartered Associate\r\nof the Licensed International Financial Analyst (LIFA), Massachusetts, United States of America. He\r\nis also an alumnus of the Strathmore University Business School’s Senior Management Leadership\r\nProgram (SMLP’22), Kenya and the Nanyang Business School’s Leadership Program, Singapore.</p>\r\n\r\n<p>Ike is a highly analytical and versatile credit, finance & risk management professional with over\r\nfifteen (15) years of hands-on experience in financial analysis, credit ratings, corporate reporting,\r\ncompany reorganization & restructuring, structured product origination, financing & assessment,\r\ngreen and sustainable financing, domestic and international debt capital markets operations. He is\r\nalso passionate about training, value creation and sustainable development initiatives across Africa.\r\nHe is happily married and blessed with two beautiful daughters.</p>', 'active', '170924ikechukwu-ike-godswill-iheagwam-bsc-ngr-bsc-uk-msc-fcca-cpa-cga-lifa.jpg', 1, '2024-06-15 17:13:28', '2024-09-17 12:02:17', NULL),
(4, 'Susan Mang\'eni', 'PS', 'State Department for MSMEs Development', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'I will be speaking on Sector-Government engagement buy-in and support at the FinCon2024. See you there.', 'I will be speaking on Sector-Government engagement buy-in and support at the FinCon2024. See you there.', 'active', '170624susan-mangeni.png', 1, '2024-06-17 17:00:40', '2024-06-17 17:04:26', NULL),
(5, 'Symon Kamore', 'MD', 'SMEP Microfinance Bank PLC', '0729908741', 'info@fincon2024.co.ke', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Symon Kamore joined SMEP with a strong foundation in accounting, having begun his career as an internal auditor at Kimani Kiarie & Certified Public Accountants. He has played a pivotal role at SMEP, advancing from Internal Audit Manager in 2003 to Finance Manager in 2007, and then to Head of Finance in 2010. Due to his exceptional performance and alignment with SMEP’s core principles, Symon was appointed as the Managing Director of the Bank in 2015.', '<P>Symon Kamore joined SMEP with a strong foundation in accounting, having begun his career as an internal auditor at Kimani Kiarie & Certified Public Accountants. He has played a pivotal role at SMEP, advancing from Internal Audit Manager in 2003 to Finance Manager in 2007, and then to Head of Finance in 2010. Due to his exceptional performance and alignment with SMEP’s core principles, Symon was appointed as the Managing Director of the Bank in 2015.</P>\r\n<p>Under his leadership, SMEP has maintained its competitive edge in the market and successfully navigated its acquisition by Hope International. Symon\'s strategic vision and dedication have been instrumental in driving SMEP\'s growth and ensuring its continued success in the microfinance sector.</p>\r\n\r\n<h5><u>Education</u></h5>\r\n<ul>\r\n<li>Strategic Leadership for Microfinance Institutions*, Harvard Business School</li>\r\n<li>MBA in Strategic Management and Finance*, Daystar University</li>\r\n<li>Bachelor of Science in Education*, Egerton University</li>\r\n<li>Certified Public Accountant (CPA) (K)*</li>\r\n<li>Certified Information Systems Auditor (CISA)</li>\r\n<li>Member, Institute of Directors</li>\r\n</ul>', 'active', '180624symon-kamore.jpeg', 1, '2024-06-18 11:12:11', '2024-06-18 11:12:11', NULL),
(6, 'Dr. Patrick Gathondu', 'Member', 'Kenya Institute of Management', '0729908741', 'info@fincon2024.co.ke', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Dr. Patrick Gathondu has dedicated two decades to the microfinance industry, demonstrating transformative leadership and a steadfast commitment to financial inclusion. His efforts have significantly impacted the BIMAS community, providing essential financial services and fostering entrepreneurial growth.\r\nStarting as a credit officer in 2003, Dr. Gathondu gained a deep understanding of microfinance\'s foundational elements. Over the years, he has held key positions such as accountant, branch manager, and internal audit manager, giving him a well-rounded perspective of the industry.', '<p>Dr. Patrick Gathondu has dedicated two decades to the microfinance industry, demonstrating transformative leadership and a steadfast commitment to financial inclusion. His efforts have significantly impacted the BIMAS community, providing essential financial services and fostering entrepreneurial growth.</p>\r\n\r\n<p>Starting as a credit officer in 2003, Dr. Gathondu gained a deep understanding of microfinance\'s foundational elements. Over the years, he has held key positions such as accountant, branch manager, and internal audit manager, giving him a well-rounded perspective of the industry.</p>\r\n\r\n<p>Dr. Gathondu\'s academic achievements include a Bachelor of Arts in Economics and Sociology from the University of Nairobi, an MBA in Strategic Management from Kenya Methodist University, and a Doctorate in Business Administration with a focus on Leadership and Change Management from the United States International University, Africa (USIU-A). He is also a certified professional accountant (CPA (K)) and a full member of the Kenya Institute of Management.</p>\r\n\r\n<p>Through his strategic guidance, Dr. Gathondu has uplifted many lives by expanding access to vital financial services and nurturing the entrepreneurial spirit. His dedication to empowering communities and passion for social progress highlight his significant contributions to the microfinance sector.</p>', 'active', '180624dr-patrick-gathondu.png', 1, '2024-06-18 11:16:14', '2024-06-18 11:16:14', NULL),
(7, 'Tamara Cook', 'Chair', 'FSD Network Council', '0729908741', 'info@fincon2024.co.ke', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Tamara Cook was appointed the CEO of FSD Kenya in July 2019. She has been with FSD Kenya since 2014 as the Head of Digital Innovations with a focus on using finance to create value for low-income households, women and enterprises. With more than two decades of experience in inclusive finance, Tamara has also worked with the Bill & Melinda Gates Foundation, the World Bank’s Consultative Group to Assist the Poor (CGAP), and Equity Bank in Kenya. She has an MBA from INSEAD, a BA in International Affairs from George Washington University and is an Executive Coach. Tamara currently serves as the Chair of the FSD Network Council.', '<p>Tamara Cook was appointed the CEO of FSD Kenya in July 2019. She has been with FSD Kenya since 2014 as the Head of Digital Innovations with a focus on using finance to create value for low-income households, women and enterprises. With more than two decades of experience in inclusive finance, Tamara has also worked with the Bill & Melinda Gates Foundation, the World Bank’s Consultative Group to Assist the Poor (CGAP), and Equity Bank in Kenya. She has an MBA from INSEAD, a BA in International Affairs from George Washington University and is an Executive Coach. Tamara currently serves as the Chair of the FSD Network Council.</p>', 'active', '180624tamara-cook.jpg', 1, '2024-06-18 11:19:15', '2024-06-18 11:19:15', NULL),
(8, 'Oscar Murigi', 'Chairman', 'Association of Microfinance Institutions in Kenya (AMFI)', '+254 716147750', 'murigi@platinumcredit.co.ke', NULL, NULL, NULL, NULL, NULL, 'Mr Murigi is the current Chairman of Association of Microfinance Institutions in Kenya (AMFI)\r\n\r\nMr Murigi holds an MSC degree in Financial Management from the University of London and a Bcom (Accounting) degree from the University of Nairobi.\r\n\r\nIn addition, he holds CPAK professional qualifications. Has over 19 years of work experience in the financial sector in Kenya and United Kingdom. A former auditor with Deloitte & Touche and Ernst & Young in East Africa and United Kingdom (Banking and Capital Markets ) 2004 - 2015. Mr Murigi is a former Finance Director and Managing Director for Platinum Credit Ltd Kenya between 2015 - 2022. \r\n\r\nMr Murigi is currently the Operations Director for Platinum Group businesses in East Africa.', '<P>Mr Murigi is the current Chairman of Association of Microfinance Institutions in Kenya (AMFI)</P>\r\n\r\n<P>Mr Murigi holds an MSC degree in Financial Management from the University of London and a Bcom (Accounting) degree from the University of Nairobi.</P>\r\n\r\n<P>In addition, he holds CPAK professional qualifications. Has over 19 years of work experience in the financial sector in Kenya and United Kingdom. A former auditor with Deloitte & Touche and Ernst & Young in East Africa and United Kingdom (Banking and Capital Markets ) 2004 - 2015. Mr Murigi is a former Finance Director and Managing Director for Platinum Credit Ltd Kenya between 2015 - 2022.</P> \r\n\r\n<P>Mr Murigi is currently the Operations Director for Platinum Group businesses in East Africa.</P>', 'active', '190624oscar-murigi.JPG', 1, '2024-06-19 07:47:09', '2024-06-25 05:59:36', '2024-06-25 05:59:36'),
(9, 'Grace Mburu', 'Executive Director', 'Flywheel Advisory', '+254729908741', 'chegzcol@gmail.com', NULL, NULL, NULL, NULL, NULL, 'Grace Mburu is the Executive Director of Flywheel Advisory. She is a passionate financial crime risk practitioner with significant experience in governance, risk and compliance, from both industry and advisory. A forensic accountant by training, Grace’s expertise spans across anti-money laundering, countering financing of terrorism, combatting proliferation financing, forensic analysis and investigations, litigation support, dispute advisory and forensic expert witnessing. Grace has been invited as a guest speaker to address pertinent matters concerning illicit financial flows and money laundering in Africa by the Attorney General Alliance - Africa Programme in Accra, Ghana and by the ISACA (Information Systems Audit and Control Association) SheLeadsTech Program amongst others. Grace has advised and trained fintechs, central bankers, commercial bankers and financial intelligence units from various African countries, in a bid to strengthen the collective effort of fighting financial crime in the continent. Grace holds a Master of Science in Forensic Accounting, she is a Certified Anti-Money Laundering Specialist (ACAMS), a Fellow of the Association of Chartered Certified Accountants (ACCA), a Certified Fraud Examiner (ACFE) and a member of the Chartered Institute of Securities and Investments, (MCSI).', '<p>Grace Mburu is the Executive Director of Flywheel Advisory. She is a passionate financial crime risk practitioner with significant experience in governance, risk and compliance, from both industry and advisory. A forensic accountant by training, Grace’s expertise spans across anti-money laundering, countering financing of terrorism, combatting proliferation financing, forensic analysis and investigations, litigation support, dispute advisory and forensic expert witnessing. Grace has been invited as a guest speaker to address pertinent matters concerning illicit financial flows and money laundering in Africa by the Attorney General Alliance - Africa Programme in Accra, Ghana and by the ISACA (Information Systems Audit and Control Association) SheLeadsTech Program amongst others. Grace has advised and trained fintechs, central bankers, commercial bankers and financial intelligence units from various African countries, in a bid to strengthen the collective effort of fighting financial crime in the continent. Grace holds a Master of Science in Forensic Accounting, she is a Certified Anti-Money Laundering Specialist (ACAMS), a Fellow of the Association of Chartered Certified Accountants (ACCA), a Certified Fraud Examiner (ACFE) and a member of the Chartered Institute of Securities and Investments, (MCSI).</p>', 'active', '210624grace-mburu.jpg', 1, '2024-06-19 08:59:58', '2024-06-21 17:27:07', NULL),
(10, 'Patrick Lumumba', 'Group Director', 'Capacity Development', '+254729908741', 'chegzcol@gmail.com', NULL, NULL, NULL, NULL, NULL, 'Patrick is a development finance specialist with experience spanning over 20 years working directly with different financial institutions in Africa as well as international development organizations. Prior to joining African Guarantee Fund (AGF), he was the Head, Social Performance Management for Grameen Foundation covering the Africa Region.\r\nA Kenyan national, Patrick holds a Master’s Degree in Marketing from Kenyatta University, and is a Certified Expert in Climate Finance and a Certified Expert in SME Finance from Frankfurt School of Finance and Management.\r\nHe is passionate about impact and capacity enhancement along the different development finance value chains in Africa.', '<p>Patrick is a development finance specialist with experience spanning over 20 years working directly with different financial institutions in Africa as well as international development organizations. Prior to joining African Guarantee Fund (AGF), he was the Head, Social Performance Management for Grameen Foundation covering the Africa Region.</p>\r\n\r\n<p>A Kenyan national, Patrick holds a Master’s Degree in Marketing from Kenyatta University, and is a Certified Expert in Climate Finance and a Certified Expert in SME Finance from Frankfurt School of Finance and Management.</p>\r\n\r\n<p>He is passionate about impact and capacity enhancement along the different development finance value chains in Africa.</p>', 'active', '200624patrick-lumumba.jpg', 1, '2024-06-19 09:30:57', '2024-06-20 02:39:57', NULL),
(11, 'Makena Mworia', 'Managing Director', 'Inkomoko Kenya', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Makena is a holder of two master’s degrees – Master’s in Business Administration, an MSc in International Securities, Investment and Banking and a Bachelor’s degree in Financial Economics. She has over 16 years’ professional experience in the International Development and Financial service sectors in Europe and Africa. In particular, she has held senior leadership roles in international development, strategic planning, impact investing, program coordination and management, partnership building, public-private stakeholder management and managing cross functional teams in development organizations as well as multinational financial institutions. She is passionate about championing catalytic innovations that uplift marginalized groups and promote financial inclusion and sustainable development. This experience has enabled her to build global networks with several stakeholders and partners in the public, private and not for profit sectors.', 'Makena is a holder of two master’s degrees – Master’s in Business Administration, an MSc in International Securities, Investment and Banking and a Bachelor’s degree in Financial Economics. She has over 16 years’ professional experience in the International Development and Financial service sectors in Europe and Africa. In particular, she has held senior leadership roles in international development, strategic planning, impact investing, program coordination and management, partnership building, public-private stakeholder management and managing cross functional teams in development organizations as well as multinational financial institutions. She is passionate about championing catalytic innovations that uplift marginalized groups and promote financial inclusion and sustainable development. This experience has enabled her to build global networks with several stakeholders and partners in the public, private and not for profit sectors.', 'active', '170924makena-mworia.jpg', 1, '2024-06-20 08:43:14', '2024-09-17 12:00:05', NULL),
(12, 'Sheru W. Muuo', 'Research Associate', 'Sightsavers', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Sheru is a Research Associate supporting the East, Central and Southern Africa region within Sightsavers and is based in Nairobi, Kenya. She completed her Bachelor’s degree (First class) in Biochemistry from the University of Nairobi and Masters of Science degree in Public Health from the Jomo Kenyatta University of Agriculture and Technology. She has over 15 years of experience in leading or supporting research activities within different organisations such as the Nagasaki University Institute of Tropical Medicine – Kenya Medical Research Institute (NUITM- KEMRI), the African Population and Health Research Centre (APHRC), Global Programs for Research and Training (GPRT). She has worked in a wide variety of settings from rural areas, urban slums to refugee camps in Kenya. Most recently she led an assessment of financial inclusion of persons with disabilities in Migori and Nairobi counties, Kenya. Sheru is passionate about using her research to improve the lives of persons with disabilities in Africa.', '<p>Sheru is a Research Associate supporting the East, Central and Southern Africa region within Sightsavers and is based in Nairobi, Kenya. She completed her Bachelor’s degree (First class) in Biochemistry from the University of Nairobi and Masters of Science degree in Public Health from the Jomo Kenyatta University of Agriculture and Technology. She has over 15 years of experience in leading or supporting research activities within different organisations such as the Nagasaki University Institute of Tropical Medicine – Kenya Medical Research Institute (NUITM- KEMRI), the African Population and Health Research Centre (APHRC), Global Programs for Research and Training (GPRT). She has worked in a wide variety of settings from rural areas, urban slums to refugee camps in Kenya. Most recently she led an assessment of financial inclusion of persons with disabilities in Migori and Nairobi counties, Kenya. Sheru is passionate about using her research to improve the lives of persons with disabilities in Africa.</p>', 'active', '210624sheru-w-muuo.jpg', 1, '2024-06-21 17:16:00', '2024-08-14 06:03:12', '2024-08-14 06:03:12'),
(13, 'Jacqueline Mbabazi', 'Executive Director', 'the Association of Microfinance Institutions of Uganda (AMFIU', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Jacqueline is the Executive Director of the Association of Microfinance Institutions of Uganda (AMFIU). Her experience spans over 20 years in the areas of financial inclusion with specific focuses on microfinance, rural development, and support for small- and medium-sized enterprises. Prior to joining AMFIU, she worked with the Microfinance Outreach Plan Project under the Ministry of Finance, Planning, and Economic Development and began her career at the Microfinance Support Center Ltd., a government-owned credit wholesale lending company supported by the African Development Bank. Jacqueline has also served on various Boards and technical committees that include among others, the Uganda Microfinance Regulatory Authority, SOLUTI Finance East Africa Ltd, CERISE+Social Performance Task Force (SPTF), the MasterCard Foundation Micro and Small Enterprise Recovery Fund, and the National Advisory Council for Consumer Protection. Jacqueline is also a committee member of the inter-institutional Committee overseeing the implementation of the National Financial Inclusion Strategy for Uganda. She has a Masters degree in Business Administration and has received specialized training in microfinance and enterprise development from several in-country and international institutions.', '<p>Jacqueline is the Executive Director of the Association of Microfinance Institutions of Uganda (AMFIU). Her experience spans over 20 years in the areas of financial inclusion with specific focuses on microfinance, rural development, and support for small- and medium-sized enterprises. Prior to joining AMFIU, she worked with the Microfinance Outreach Plan Project under the Ministry of Finance, Planning, and Economic Development and began her career at the Microfinance Support Center Ltd., a government-owned credit wholesale lending company supported by the African Development Bank. Jacqueline has also served on various Boards and technical committees that include among others, the Uganda Microfinance Regulatory Authority, SOLUTI Finance East Africa Ltd, CERISE+Social Performance Task Force (SPTF), the MasterCard Foundation Micro and Small Enterprise Recovery Fund, and the National Advisory Council for Consumer Protection. Jacqueline is also a committee member of the inter-institutional Committee overseeing the implementation of the National Financial Inclusion Strategy for Uganda. She has a Masters degree in Business Administration and has received specialized training in microfinance and enterprise development from several in-country and international institutions.</p>', 'active', '210624jacqueline.png', 1, '2024-06-21 17:18:21', '2024-09-17 11:44:55', NULL),
(14, 'Jamilla', 'Senior Partnership Accounts Manager', 'Water.org', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Jamilla serves as the Senior Partnership Accounts Manager at Water.org, where she plays a key role in driving the region\'s business strategy focused on building partnerships with Financial Institutions across Africa. Her work is centered on assisting commercial banks, microfinance institutions, and networks in Africa to develop, pilot, and scale water and sanitation lending programs for households, MSME’s, and utilities.\r\nWith over 15 years of experience, Jamilla brings a wealth of expertise to her role. She holds an MBA from the University of Nairobi and a bachelor’s degree in education (Arts) from Kenyatta University.', '<p>Jamilla serves as the Senior Partnership Accounts Manager at Water.org, where she plays a key role in driving the region\'s business strategy focused on building partnerships with Financial Institutions across Africa. Her work is centered on assisting commercial banks, microfinance institutions, and networks in Africa to develop, pilot, and scale water and sanitation lending programs for households, MSME’s, and utilities.</p>\r\n<p>With over 15 years of experience, Jamilla brings a wealth of expertise to her role. She holds an MBA from the University of Nairobi and a bachelor’s degree in education (Arts) from Kenyatta University.</p>', 'active', '170924jamilla.jpg', 1, '2024-06-21 17:21:52', '2024-09-17 11:44:05', NULL),
(15, 'Andrew Kabucho', 'Investment manager', 'Kiva', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Andrew is currently an investment manager with Kiva, a US based impact focused asset manager that provides wholesale funding to microfinance institutions through their crowdfunding platform. He has over 9 years\' experience working in the impact investment sector having previously worked for other microfinance investment vehicles such as responsAbility and Incofin. He has facilitated over $100m in debt investments and technical assistance transactions to financial service providers across Sub-Saharan Africa for purposes of advancing financial inclusion.', '<p>Andrew is currently an investment manager with Kiva, a US based impact focused asset manager that provides wholesale funding to microfinance institutions through their crowdfunding platform. He has over 9 years\' experience working in the impact investment sector having previously worked for other microfinance investment vehicles such as responsAbility and Incofin. He has facilitated over $100m in debt investments and technical assistance transactions to financial service providers across Sub-Saharan Africa for purposes of advancing financial inclusion. </p>', 'active', '210624andrew-kabucho.jpg', 1, '2024-06-21 18:29:23', '2024-06-21 18:29:23', NULL),
(16, 'Kamal Budhabhatti', 'Founder and Chief Executive Officer', 'Craft Silicon Ltd. and Little', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Kamal Budhabhatti is a visionary entrepreneur who has made a significant impact in the field of technolo- gy and innovation. He serves as the Founder and Chief Executive Officer of two pioneering companies, Craft Silicon Ltd. and Little - Africa\'s first innovative Super- App platform.\r\nUnder Kamal\'s leadership, Craft Silicon Ltd. has emerged as a global software development and services powerhouse based in Kenya. The company has expanded its reach with development centers in India and the USA, reflecting its recognition as one of the largest software houses in emerging markets. Craft Silicon boasts a talented team of technology architects and domain experts who provide cutting-edge solutions to the banking, financial services, and insurance industries. Kamal\'s commit- ment to \'Innovative Thinking\' continues to drive groundbreaking solutions for Craft Silicon\'s 300+ customers across 45+ countries in Africa, Eastern Europe, and Asia.', '<p>Kamal Budhabhatti is a visionary entrepreneur who has made a significant impact in the field of technolo- gy and innovation. He serves as the Founder and Chief Executive Officer of two pioneering companies, Craft Silicon Ltd. and Little - Africa\'s first innovative Super- App platform.</p>\r\n\r\n<p>Under Kamal\'s leadership, Craft Silicon Ltd. has emerged as a global software development and services powerhouse based in Kenya. The company has expanded its reach with development centers in India and the USA, reflecting its recognition as one of the largest software houses in emerging markets. Craft Silicon boasts a talented team of technology architects and domain experts who provide cutting-edge solutions to the banking, financial services, and insurance industries. Kamal\'s commit- ment to \'Innovative Thinking\' continues to drive groundbreaking solutions for Craft Silicon\'s 300+ customers across 45+ countries in Africa, Eastern Europe, and Asia.</p>\r\n\r\n<p>In July 2016, Kamal launched Little, Africa\'s first inno- vative SuperApp platform, which seamlessly combines mobility, delivery, daily essentials, payments, and technology. Under his visionary leadership, Little has become the preferred everyday everything platform in Kenya, o􏰀ering comfortable, reliable, and a􏰀ordable services to both individuals and corporates. With over 3.1 million+ individual clients and 5,000+ corporate clients, Kamal continues to champion \'Innovative Thinking,\' delivering groundbreaking solutions to make Little the \'Everyday. Everything App.\'</p>\r\n\r\n<p>Kamal Budhabhatti is not just a CEO; he\'s a hands-on programmer skilled in C#, Java, and Mobile comput- ing. Beyond technology, he finds solace in adventure sports and air piloting. With a diverse range of inter- ests encompassing autobiographies, philosophy, technical literature, and management and success stories, he is also an avid reader. His motto, \"Associ- ates are the Assets of Craft Silicon and Little; with their commitment, even the impossible is possible,\" reflects his belief in the power of people. Kamal\'s exceptional leadership earned him the \'Africa Award 2010 for Entrepreneurship,\' and he received recogni- tion from the ICT Authority of Kenya for his technology innovation at Little during the Connected 2017 event.</p>', 'active', '220624kamal-budhabhatti.jpg', 1, '2024-06-22 10:22:07', '2024-06-22 10:22:07', NULL),
(17, 'Laban Hihu', 'Certified Public Accountant', NULL, '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Laban is a Certified Public Accountant (CPA K) with a Master\'s degree in Banking and Finance (Microfinance Option) and a Bachelor\'s degree in Business Administration, specializing in Accounting and Finance. He is currently pursuing a PhD in Organizational Leadership.\r\n\r\nWith over 20 years of progressive experience in microfinance institutions (MFIs), savings and credit cooperative societies, and community development institutions, Laban has honed his skills in overseeing the business and financial operations of these organizations. His responsibilities have included formulating and implementing sustainable fiscal strategies, directing and reviewing financial performance and budgeting activities, managing business marketing and operational activities, and ensuring compliance with statutory reporting requirements.', '<p>Laban is a Certified Public Accountant (CPA K) with a Master\'s degree in Banking and Finance (Microfinance Option) and a Bachelor\'s degree in Business Administration, specializing in Accounting and Finance. He is currently pursuing a PhD in Organizational Leadership.</p>\r\n\r\n<p>With over 20 years of progressive experience in microfinance institutions (MFIs), savings and credit cooperative societies, and community development institutions, Laban has honed his skills in overseeing the business and financial operations of these organizations. His responsibilities have included formulating and implementing sustainable fiscal strategies, directing and reviewing financial performance and budgeting activities, managing business marketing and operational activities, and ensuring compliance with statutory reporting requirements.</p>', 'active', '220624laban-hihu.jpeg', 1, '2024-06-22 10:47:36', '2024-06-22 10:47:36', NULL),
(18, 'Caroline Karanja', 'CEO', 'AMFI-KENYA', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'I will be speaking on: secure financing & investment opportunities, Take stock of key milestone & challenges in financial inclusion, Establish new networks & keep up with industry trends.', 'I will be speaking on: secure financing & investment opportunities, Take stock of key milestone & challenges in financial inclusion, Establish new networks & keep up with industry trends.', 'active', '220624caroline-karanja.jpeg', 1, '2024-06-22 10:51:25', '2024-06-25 05:42:23', '2024-06-25 05:42:23'),
(19, 'Curtis Musembi', 'Investments Manager', 'East & Southern Africa at Oikocredit', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Curtis serves as the Investments Manager, East & Southern Africa at Oikocredit, a global cooperative and social impact investor specializing in providing both debt and equity investments. Oikocredit’s primary focus is on promoting financial inclusion and contributing to the growth of the agriculture and renewable energy sectors.\r\nIn his previous role, Curtis was engaged with the Kenya Climate Innovation Centre, a World Bank initiative. During his tenure, he played a pivotal role in supporting Small and Medium Enterprises (SMEs) through acceleration programs and early-stage financing assistance. These programs specifically targeted innovative solutions in response to climate challenges.\r\nCurtis has also established a notable track record in credit during his time at Unaitas. With over 12 years of progressively advancing experience, he has consistently been at the forefront of financial inclusion efforts and impact-driven investments across the Sub-Saharan African region.\r\nCurtis holds a degree in Finance and Banking from Moi University and is a Certified Public Accountant (CPA-K). His passion is dedicated to uplifting communities from impoverishment through sustainable investment strategies and tailored financial solutions.', '<p>Curtis serves as the Investments Manager, East & Southern Africa at Oikocredit, a global cooperative and social impact investor specializing in providing both debt and equity investments. Oikocredit’s primary focus is on promoting financial inclusion and contributing to the growth of the agriculture and renewable energy sectors.</p>\r\n<p>In his previous role, Curtis was engaged with the Kenya Climate Innovation Centre, a World Bank initiative. During his tenure, he played a pivotal role in supporting Small and Medium Enterprises (SMEs) through acceleration programs and early-stage financing assistance. These programs specifically targeted innovative solutions in response to climate challenges.</p>\r\n<p>Curtis has also established a notable track record in credit during his time at Unaitas. With over 12 years of progressively advancing experience, he has consistently been at the forefront of financial inclusion efforts and impact-driven investments across the Sub-Saharan African region.\r\nCurtis holds a degree in Finance and Banking from Moi University and is a Certified Public Accountant (CPA-K). His passion is dedicated to uplifting communities from impoverishment through sustainable investment strategies and tailored financial solutions.</p>', 'active', '220624curtis-musembi.jpg', 1, '2024-06-22 10:57:44', '2024-06-22 10:57:44', NULL),
(20, 'Jan Martin Hunderi', 'CEO & Founder', 'Data Driven Finance Kenya Ltd', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'I will be a panelist in the discussion on the impact of financial inclusion in Kenya at the FinCon2024', 'I will be a panelist in the discussion on the impact of financial inclusion in Kenya at the FinCon2024', 'active', '220624jan-martin-hunderi.jpg', 1, '2024-06-22 11:01:09', '2024-06-22 11:01:09', NULL),
(21, 'Gideon Kipyakwai', 'CEO', 'Metropol Credit Reference Bureau Kenya', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Prior to this, he has served in different roles in academia, professional accountancy, public service management, ICT and banking, locally and in the US. \r\nHe has been in the credit information sharing space for nearly a decade and has passionately supported a myriad of initiatives that have led to increased financial literacy, automation and adoption of data-driven decisioning. Among his achievements is the work done at Metropol to increase access and affordability of credit for the common mwananchi. \r\n\r\nGideon is a trained banker with academic qualifications in science and business.  He holds a BSC (first class honours), MSC, MBA, CPA(K), CPS(K) and is currently studying for his Doctorate.\r\n\r\nHe is an avid reader who loves outdoor sports and adventure.', '<p>Prior to this, he has served in different roles in academia, professional accountancy, public service management, ICT and banking, locally and in the US. </p>\r\n<p>He has been in the credit information sharing space for nearly a decade and has passionately supported a myriad of initiatives that have led to increased financial literacy, automation and adoption of data-driven decisioning. Among his achievements is the work done at Metropol to increase access and affordability of credit for the common mwananchi. </p>\r\n\r\n<p>Gideon is a trained banker with academic qualifications in science and business.  He holds a BSC (first class honours), MSC, MBA, CPA(K), CPS(K) and is currently studying for his Doctorate.</p>\r\n\r\n<p>He is an avid reader who loves outdoor sports and adventure.</p>', 'active', '250624gideon-kipyakwai.jpg', 1, '2024-06-25 06:59:37', '2024-06-25 06:59:37', NULL),
(22, 'Mary Munyiri', 'Chief Executive Officer', 'ECLOF Kenya', '+254729908741', 'chegzcol@gmail.com', 'fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Mary joined ECLOF Kenya in 2011. She brought to ECLOF Kenya her over 20 years work\r\nexperience. She is currently the Chief Executive Officer of ECLOF Kenya. Prior to joining\r\nECLOF Kenya, she was the Head of Business Development Department in Faulu Microfinance\r\nBank. She was among the team that pioneered Faulu Kenya which is today one of the big\r\nmicrofinance institutions in Kenya.\r\nMary’s career began as a civil servant with the Government of Kenyan in the then Ministry of\r\nTrade. She then moved to manufacture firm and later settled in microfinance.  Her major\r\nexperience is in Microfinance, Microenterprise development and Community development', '<p>Mary joined ECLOF Kenya in 2011. She brought to ECLOF Kenya her over 20 years work\r\nexperience. She is currently the Chief Executive Officer of ECLOF Kenya. Prior to joining\r\nECLOF Kenya, she was the Head of Business Development Department in Faulu Microfinance\r\nBank. She was among the team that pioneered Faulu Kenya which is today one of the big\r\nmicrofinance institutions in Kenya.</p>\r\n<p>Mary’s career began as a civil servant with the Government of Kenyan in the then Ministry of\r\nTrade. She then moved to manufacture firm and later settled in microfinance.  Her major\r\nexperience is in Microfinance, Microenterprise development and Community development.</p>\r\n\r\n<p>Mary holds a Masters Degree in Banking and Finance (MF Option), a Bachelor Degree in\r\nBusiness Administration and a Higher Diploma in Psychological Counseling. She is also a\r\nCertified Executive Leadership Coach from CDI-Africa Group and has undertaken some special\r\ncourses which include: Corporate Governance and Effective leadership, Change management,\r\nProduct Review and Market Research, Strategic Thinking, From Good to Great; Seven Habits of\r\nHighly Effective People. Her passion is in leadership capacity building and institution\r\ndevelopment.</p>', 'active', '250624mary-munyiri.jpeg', 1, '2024-06-25 07:03:32', '2024-06-25 07:06:25', NULL),
(23, 'Adam Kasaine', 'CEO', 'Ed Partners Africa Ltd', '+254 711 529575', 'info@fincon2024.co.ke', 'Fincon2024.co.ke', NULL, NULL, NULL, NULL, 'Adam is a strategic leader in financial inclusion and impact investment, driving change to empower underserved populations. He has extensive experience in business operations, and revenue growth within the financial sector, his expertise spans banking operations, payment systems, lending, IT project management, and security. He has held key roles, including Head of Retail Banking at Bank of Africa and leadership positions at Consolidated Bank and Sidian Bank, where he developed strategies for Retail and SME business, payment channels, and led digitization initiatives.', 'Adam is a strategic leader in financial inclusion and impact investment, driving change to empower underserved populations. He has extensive experience in business operations, and revenue growth within the financial sector, his expertise spans banking operations, payment systems, lending, IT project management, and security. He has held key roles, including Head of Retail Banking at Bank of Africa and leadership positions at Consolidated Bank and Sidian Bank, where he developed strategies for Retail and SME business, payment channels, and led digitization initiatives. Adam holds an MBA from Daystar and a B.Sc. in Business Administration from United States International University Africa, bringing strategic insights, financial acumen, and a passion for community engagement to the global financial landscape.', 'active', '190824adam-kasaine.jpg', 1, '2024-08-19 04:24:27', '2024-08-19 04:24:27', NULL);
INSERT INTO `speakers` (`id`, `name`, `job_title`, `company`, `phone`, `email`, `website`, `yt_link`, `fb_link`, `ln_link`, `x_link`, `short_desc`, `long_desc`, `status`, `profile_img`, `event_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(24, 'Benson Kariuki Kitabu', 'Managing Director', 'Kenya Women Microfinance Bank (KWFT)', '0721382643', 'support@fincon2024.co.ke', 'https://kwftbank.com/', NULL, NULL, NULL, NULL, 'Kitabu is the Managing Director for Kenya Women Microfinance Bank (KWFT). Kitabu Joined KWFT in 1992 as an Accountant and has risen through the various positions including Director Finance and Strategy to the current position. He has a wealth of experience spanning over 30 years of experience in Strategy, Finance, Accounting, and Business Administration. \r\nHe holds a Masters of Business Administration degree in Finance and a Bachelor of Science Degree both from Moi University. Kitabu is a Certified Public Accountant CPA (K) and a Member of Institute of Certified Public Accountants (ICPAK).', '<p>Kitabu is the Managing Director for Kenya Women Microfinance Bank (KWFT). Kitabu Joined KWFT in 1992 as an Accountant and has risen through the various positions including Director Finance and Strategy to the current position. He has a wealth of experience spanning over 30 years of experience in Strategy, Finance, Accounting, and Business Administration. </p>\r\n<p>He holds a Masters of Business Administration degree in Finance and a Bachelor of Science Degree both from Moi University. Kitabu is a Certified Public Accountant CPA (K) and a Member of Institute of Certified Public Accountants (ICPAK). </p>\r\n<p>Kitabu is a visionary leader and was heavily involved in the transformation of KWFT to a regulated Microfinance Bank and thereafter in the successful implementation of strategies growing the Bank to its current asset base of over Kshs 25 billion.</p>\r\n<p>He oversees the overall operations, strategic direction, financial performance, regulatory compliance, and driving the bank’s growth and profitability while maintaining high standards of customer service, operational excellence and technological advancements in line with the Institution’s strategy.</p>\r\n<p>Kitabu is an active member of different professional bodies and is a respected and celebrated mentor in Strategy, Leadership, Sustainability and Finance. He has represented KWFT in various global and regional forums and seminars on diverse matters in Africa, Europe and Asia.</p>', 'active', '130924benson-kariuki-kitabu.jpg', 1, '2024-09-13 10:08:06', '2024-09-13 10:08:06', NULL),
(25, 'Mr. Fred Ruoro', 'Managing Director', 'CIC General Insurance Ltd', '0721382643', 'support@fincon2024.co.ke', 'https://ke.cicinsurancegroup.com/', NULL, NULL, NULL, NULL, 'Mr. Fred Ruoro is the Managing Director of CIC General Insurance Ltd. He holds a bachelor’s degree in Mathematics & Physics from the University of Nairobi. He is a senior certified insurance professional from the Australian & New Zealand Institute of Insurance and Finance and is a Fellow of the Life Management Institute. Fred holds an Advanced Diploma in Management Accounting from the Chartered Institute of Management Accountants (CIMA). He is a member of the General Insurance Council at the Association of Kenya Insurers (AKI). As a seasoned professional, he is a member of good standing of the Insurance Institute of Kenya (IIK).', 'Mr. Fred Ruoro is the Managing Director of CIC General Insurance Ltd. He holds a bachelor’s degree in Mathematics & Physics from the University of Nairobi. He is a senior certified insurance professional from the Australian & New Zealand Institute of Insurance and Finance and is a Fellow of the Life Management Institute. Fred holds an Advanced Diploma in Management Accounting from the Chartered Institute of Management Accountants (CIMA). He is a member of the General Insurance Council at the Association of Kenya Insurers (AKI). As a seasoned professional, he is a member of good standing of the Insurance Institute of Kenya (IIK).', 'active', '160924mr-fred-ruoro.jpg', 1, '2024-09-16 13:13:54', '2024-09-16 13:13:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Marketing', 'Marketing', '2023-04-29 09:53:46', '2023-04-29 09:53:46', NULL),
(2, 'Events', 'Events', '2023-04-29 09:53:54', '2023-04-29 09:53:54', NULL),
(3, 'MICE', 'MICE', '2023-04-29 09:54:04', '2023-04-29 09:54:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` enum('KES','USD','EURO') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `purchase_from` date DEFAULT NULL,
  `purchase_to` date DEFAULT NULL,
  `pax` int(11) DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `code`, `event_id`, `name`, `currency`, `price`, `purchase_from`, `purchase_to`, `pax`, `desc`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'JcqA180424', 1, 'Member Delegate', 'USD', 300.00, '2024-04-18', '2024-09-24', 1000, 'Select this option if you are a member of AMFI-KENYA', '2024-04-18 07:50:20', '2024-08-22 06:57:46', NULL),
(2, 'oT65220424', 1, 'Non-Member Delegate', 'USD', 400.00, '2024-04-22', '2024-09-24', 1000, 'Select this option if you NOT  a member of AMFI-KENYA', '2024-04-22 10:53:09', '2024-08-22 07:23:10', NULL),
(3, 'Hc6M220424', 1, 'Partner', 'KES', 0.00, '2024-04-22', '2024-06-25', 1000, 'This are the partners who hold our hands', '2024-04-22 10:53:51', '2024-04-29 08:17:51', '2024-04-29 08:17:51'),
(4, 'RcEj220424', 1, 'Speaker', 'KES', 0.00, '2024-04-22', '2024-06-25', 1000, 'This is for those speaking at the event.', '2024-04-22 10:54:24', '2024-04-29 08:17:56', '2024-04-29 08:17:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_verified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `gender`, `phone`, `profile_image`, `user_verified_at`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test Person 1', 'support1@fincon2024.co.ke', '2024-04-25 09:47:23', '$2y$10$x.COk/zwCkJ3nTzItoCsPuo2FsD0bRNDr3PUCGffuGgBiCp.VkL42', NULL, '254729908751', NULL, NULL, 2, NULL, '2024-04-25 09:41:21', '2024-04-25 09:47:23', NULL),
(2, 'Wesley Shimoli', 'wesleyshimoli@gmail.com', '2024-05-03 04:11:32', '$2y$10$wr1cQ5DIuvlygIHkYuEYAexlXtscKVSG2MpVR33ZgZQumDrs5oDxC', NULL, '254707998131', NULL, NULL, 1, NULL, '2024-05-03 04:10:40', '2024-06-24 03:07:44', NULL),
(3, 'Vincent Njuguna njuguna', 'vkiarie@motohopecapital.com', NULL, '$2y$10$ZQ63g0FS.472isU9MRhwV.VGPfOtsWHKGsyYHDh897/krD8aezSqe', NULL, '0725794040', NULL, NULL, 1, NULL, '2024-05-03 15:01:58', '2024-06-24 02:59:56', NULL),
(4, 'Andrew Njiraini', 'anjiraini@flywheeladvisory.com', '2024-05-06 04:51:43', '$2y$10$w/pGbzaQtundohsaPMg26uMjjQNJ.3cbS9vnReCgxoZEOdqCmBRjG', NULL, '0723869792', NULL, NULL, 1, NULL, '2024-05-06 04:51:29', '2024-06-24 02:59:58', NULL),
(5, 'Jackson Mureithi', 'jackson.mureithi@opentechglobal.co.ke', '2024-05-06 06:21:29', '$2y$10$AoPVvwl16TWjd.P/bR0nd.34UQoj6oAsP6U5w2DRjSk/6fc9IGgkq', NULL, '0706571617', NULL, NULL, 1, NULL, '2024-05-06 06:20:40', '2024-06-24 03:00:01', NULL),
(6, 'Test Person 2 Updated', 'chegzcol1@gmail.com', '2024-05-11 03:40:41', '$2y$10$tZo/CHM1DtBDKw1Wxb82jun/cLFZUT7YhLdQ1wievOhYYO/UC63pa', NULL, '0729908742', NULL, NULL, 2, NULL, '2024-05-11 03:39:25', '2024-06-12 11:01:55', NULL),
(7, 'Agnes Mbithi', 'Aggelishia@gmail.com', NULL, '$2y$10$xhD/Oh8Zq62Rxgdso0jUj..NO.0i.qgIGilmtTeNbJUyyoQUmwU5m', NULL, '0741755194', NULL, NULL, 1, NULL, '2024-05-14 06:29:14', '2024-06-24 03:00:03', NULL),
(8, 'NANCY CHOTERO', 'nchotero@amfikenya.com', '2024-05-14 08:40:06', '$2y$10$YqAnnPVyV6MrmOHuDQmvAOX2cJ1kBWvNgOHdJFy/eFiypaVx3cvI2', NULL, '0737409059', NULL, NULL, 1, NULL, '2024-05-14 08:39:04', '2024-06-24 03:00:06', NULL),
(9, 'Test Person 3', 'support1@miceafrica.org', '2024-05-14 14:51:11', '$2y$10$j/obg4z2x7Qbm2gg./wBgO4cYinRZ5FK4eaNlH49E6AKp//VXzcgG', NULL, '0812334667', NULL, NULL, 2, NULL, '2024-05-14 14:49:44', '2024-05-14 14:51:11', NULL),
(10, 'Isaac Waithaka', 'inwaithaka@gmail.com', '2024-05-19 14:30:33', '$2y$10$bqnulGmhbzTQx9JwTW9RQO9VKM2ekYB7AGnVcJKWBt9vbJJvOTLTi', NULL, '0713280683', NULL, NULL, 1, NULL, '2024-05-19 14:29:56', '2024-06-24 03:00:09', NULL),
(11, 'Grace Wambui', 'gpw@ddfinance.com', '2024-05-27 06:16:39', '$2y$10$rJJWYhcELkRpdOu39m6BDOvxqrbEv42D3hrmP9axFPlp4wq7jPyLC', NULL, '+254724479995', NULL, NULL, 1, NULL, '2024-05-27 05:59:31', '2024-06-24 03:00:12', NULL),
(12, 'Mercy Njagi', 'mn@ddfinance.com', '2024-05-27 06:13:46', '$2y$10$DWoEBQDFlqKfKG/wMTc7MOO/pCcBkiQmFmU/a4qc8GDhQbWkKfVfy', NULL, '+254711166562', NULL, NULL, 1, NULL, '2024-05-27 05:59:43', '2024-06-24 03:00:15', NULL),
(13, 'joyce kabura', 'joyce.kabura@ddfinance.com', NULL, '$2y$10$2qDq7V0f.F5WJLAwXQlmJOWIARibLM8VIFc7BxEhAF0L.SUMR49bC', NULL, '0721899548', NULL, NULL, 1, NULL, '2024-05-27 06:15:27', '2024-06-24 03:00:19', NULL),
(14, 'Emmanuel Aloo', 'aloo25emmanuel@gmail.com', NULL, '$2y$10$bhAUWIoc1pdX2ZeaZSAjj.iKOmELa6sPCY.siOuHD4xv6rsGPWsA.', NULL, '0706934558', NULL, NULL, 1, NULL, '2024-05-27 06:46:23', '2024-06-24 03:00:21', NULL),
(15, 'Blanche Wangari Kangeri', 'mbithe82@gmail.com', '2024-05-29 05:13:42', '$2y$10$0IDr1jWPHrKYl9HjfTs76Ol37eXiO8.8hk8l9MRU/DW8gaP6RFyE2', NULL, '+254736392514', NULL, NULL, 1, NULL, '2024-05-29 05:13:24', '2024-06-24 03:00:25', NULL),
(16, 'Sylviah Mwaura', 'smwaura@greenmaxcap.com', '2024-06-04 07:42:41', '$2y$10$fPysfEkxUISSI1Yetf.k8uuqwj2UEwM4uSdXkoAGKhCBAN1OcnGRW', NULL, '0721663852', NULL, NULL, 1, NULL, '2024-06-04 07:42:28', '2024-06-24 03:00:27', NULL),
(17, 'Jared Getenga', 'jared.getenga@ciskenya.co.ke', NULL, '$2y$10$qIaREWHjlM2YJEShMT1vKe7fwxWsUChTuklGFWq03WEN/FUTVdH3m', NULL, '0725388111', NULL, NULL, 1, NULL, '2024-06-04 08:09:19', '2024-06-24 03:00:29', NULL),
(18, 'Test Person June', 'sales1@smartwisetravel.co.ke', NULL, '$2y$10$pAgQOqBHVt9EgdW0THa7Y.bfK5vjydICOw/4Y6SU0ugc.1FtrrZ9O', NULL, '0723665778', NULL, NULL, 2, NULL, '2024-06-04 08:18:06', '2024-06-04 08:18:06', NULL),
(19, 'SHELMITH Wairimu THEURI', 'shello.theuri@gmail.com', NULL, '$2y$10$pSMJzSs98ry5HleSIpXnLujNMK2ZnkwznFnoeUvFyJJW7rrglqAOC', NULL, '+254726490269', NULL, NULL, 1, NULL, '2024-06-04 10:05:04', '2024-06-24 03:00:32', NULL),
(20, 'Raphael Akomeah', 'raphael@idpfoundation.org', NULL, '$2y$10$qYIAqNYtf0IqERNzbZ0Ol.65CxASQa5vmAknOiF0qwoHvkvtUmgLq', NULL, '+233243606889', NULL, NULL, 1, NULL, '2024-06-04 15:01:25', '2024-06-24 03:00:36', NULL),
(21, 'Test Person three', 'support1@smartwisetravel.co.ke', NULL, '$2y$10$47jeUGFwnyh.qDLy3CQU5uk/oWcviuBsReaxiaLAsg6x8VhvPgQgG', NULL, '0729987700', NULL, NULL, 2, NULL, '2024-06-05 16:36:47', '2024-06-05 16:36:47', NULL),
(22, 'Test Person four', 'support2@fincon2024.co.ke', NULL, '$2y$10$mz/xGVkIwt6Qhff1qI7st.MMbP5NqC9ncnlIhoOMPpexqo.u59zbS', NULL, '0712000999', NULL, NULL, 2, NULL, '2024-06-05 17:26:23', '2024-06-05 17:26:23', NULL),
(23, 'Allan Watts', 'sales@smartwisetravel.co.ke', NULL, '$2y$10$CKfdNFYfSuyrBfsOvPZzt.zLyK.6n6FB0whSlfZmYCrXZBrnRukv.', NULL, '0729908766', NULL, NULL, 1, NULL, '2024-06-06 02:48:35', '2024-06-24 03:00:40', NULL),
(24, 'Humphrey Odendo', 'hodendo@greyapple.co.ke', NULL, '$2y$10$qL75LLMR3rt/X7yn9c5niucTlK0pP3Y0IZgh6kV0pxvhiasEifYUS', NULL, '0721546652', NULL, NULL, 1, NULL, '2024-06-06 04:21:50', '2024-06-24 03:00:40', NULL),
(25, 'Test person ten', 'support4@fincon2024.co.ke', NULL, '$2y$10$7arb4IIMKswlgGQC7BeshOhOs7tXgXLDn0wXItnHzLUNgC6pKTxAW', NULL, '078888888888', NULL, NULL, 2, NULL, '2024-06-06 04:34:22', '2024-06-06 04:34:22', NULL),
(26, 'Test person elleven', 'support5@fincon2024.co.ke', NULL, '$2y$10$VB9tQ434hB3PMANsq4S2Ue6c7VxGYEnXJBhX/CsmPmeJCSZdnZbJu', NULL, '0721999999', NULL, NULL, 2, NULL, '2024-06-06 04:37:43', '2024-06-06 04:37:43', NULL),
(27, 'Test Person nine', 'support@fincon2024.co.ke', NULL, '$2y$10$tmX/4VM/eNeLcn/472sgv.fv5aQGZ2/fdO.lAnPBDHdzg5pzxa36W', NULL, '0725678908', NULL, NULL, 2, NULL, '2024-06-06 04:47:02', '2024-06-06 04:47:02', NULL),
(28, 'Felix Nyapeni', 'bosirenyapeni@gmail.com', NULL, '$2y$10$gI1wXX9xU0ahmv6BEaAV/uJAciNCgP05V6njLAkZg3c.yr1NlYTVq', NULL, '0720020453', NULL, NULL, 1, NULL, '2024-06-06 05:07:09', '2024-06-24 03:00:42', NULL),
(29, 'Jeff Temba', 'j.temba@samawaticapital.com', NULL, '$2y$10$qQ3fuHrRp675.4E0AEi3yuqlGFwpTmG5NRpUcSGnSfAyjfLw2nehi', NULL, '0724722461', NULL, NULL, 1, NULL, '2024-06-06 06:19:19', '2024-06-24 03:00:45', NULL),
(30, 'Caroline Karanja', 'ckaranja123@gmail.com', NULL, '$2y$10$BeAcNa.1g284i0yG2Y3dTe.L6EWUYmTwR0bkl/hz474eCowvgO5nq', NULL, '0722801275', NULL, NULL, 1, NULL, '2024-06-06 07:00:39', '2024-06-24 03:00:47', NULL),
(31, 'Betty Mulemia Simiyu', 'betty.s@edpartnersafrica.com', '2024-06-07 09:16:04', '$2y$10$KsY/9/xwp37Dm1/RIUFLHOifj0xeuw5.gt66DgX/I.0OPtzSXOkFy', NULL, '+254711656953', NULL, NULL, 1, NULL, '2024-06-07 09:15:36', '2024-06-24 03:00:50', NULL),
(32, 'maurinekauffmann', 'genevadeandre@ipbeyond.com', NULL, '$2y$10$bano64wNEr7AAkLKP96aPO3EcCmVw7BkFWchpeimcfA.5Y3G24CZq', NULL, '6361952208', NULL, NULL, 1, NULL, '2024-06-08 04:01:09', '2024-06-24 03:00:54', NULL),
(33, 'Olivia Fechner', 'olivia.fechner@enabling.ch', NULL, '$2y$10$hQ3t15y/g42ZA.YC3Pu5GOf3Kl.YlkHJeFViQoEr01mDDr0wZYk9e', NULL, '0791413643', NULL, NULL, 1, NULL, '2024-06-10 05:27:56', '2024-06-24 03:00:56', NULL),
(34, 'Alice Rullier', 'alice.rullier-maugue@credit-agricole-sa.fr', '2024-06-10 12:10:23', '$2y$10$I9HH0/4YE0TuOIT2ikEBLeJ5joNnZHMJ1.pv9J4LdrV6pUqUoLdgm', NULL, '+33689610394', NULL, NULL, 1, NULL, '2024-06-10 11:37:55', '2024-06-24 03:00:58', NULL),
(35, 'Abdulrahman Busera-Mohammed', 'thepatriotspeaks@gmail.com', NULL, '$2y$10$n7nyuvCtlWsKRZZps6Q2iOL4/kfv.8va5PW2Tpsxj1l6O8qPMNmcC', NULL, '0728042298', NULL, NULL, 1, NULL, '2024-06-10 11:58:30', '2024-06-24 03:01:01', NULL),
(36, 'Monica Gachucha', 'monicag@wyldeinternational.com', NULL, '$2y$10$oqQ9ZLU91LhUuTF9obe8N.pW/XzwnJVnBC6bDMwvyLdRGKUEAKP1C', NULL, '0722631557', NULL, NULL, 1, NULL, '2024-06-11 04:39:19', '2024-06-24 03:01:03', NULL),
(37, 'Sheru Wanyua Muuo', 'smuuo@sightsavers.org', NULL, '$2y$10$fdWXN8hHESDLwEJz4733meoYZBWZBnLW//oJLuomPugdp78tszgy.', NULL, '0723803595', NULL, NULL, 1, NULL, '2024-06-11 07:48:58', '2024-06-24 03:01:07', NULL),
(38, 'Chelsea Mmosi', 'chelsea.mmosi@pycs.co.ke', '2024-06-11 09:15:14', '$2y$10$zgZGtL3bR67RKC7j3MMIauIrWIfcA9eGm4CUdfBk9gqord0u9/lCu', NULL, '0797822447', NULL, NULL, 1, NULL, '2024-06-11 09:12:10', '2024-06-24 03:01:10', NULL),
(39, 'Joy Ogutu', 'jogutu@greenmaxcap.com', '2024-06-11 10:27:56', '$2y$10$dLoBPgpH0k57LGElANOPH.R8TFWDSo5O84xy5hFngiiLifhdD.w9u', NULL, '+254722974611', NULL, NULL, 1, NULL, '2024-06-11 10:09:28', '2024-06-24 03:01:12', NULL),
(40, 'Mercy Njoora', 'mnjoora@tenakata.com', '2024-06-11 11:15:57', '$2y$10$8vWMX/AlsrtNA79Z6mn2GeaoCVW6EVt3hkR4e/6q797Yzt3/qCo3u', NULL, '0110862219', NULL, NULL, 1, NULL, '2024-06-11 11:15:01', '2024-06-24 03:01:16', NULL),
(41, 'Dennis Gachirigua', 'dennis.gachirigua@gmail.com', '2024-08-06 12:39:43', '$2y$10$8fGYpuN.2.ODu7TFHdct3uPuK7gAA1jilhN.0.EiMiBwKSbMl5QlO', NULL, '+254725291881', NULL, NULL, 1, '9E0uXVkRle8WFaA9jg3j3y0yErIAKLBfc2n0MsFhbL7XpxuJJ8eMZoG7kcaP', '2024-06-11 14:40:24', '2024-08-06 12:39:43', NULL),
(42, 'Kennedy', 'kennedymkioko@gmail.com', NULL, '$2y$10$gEeBo75Mld4RUzlv0SMOcOhSBmRuwfRUsBlsQIENG7JceC8ttcBc2', NULL, '0722811724', NULL, NULL, 1, NULL, '2024-06-11 16:08:12', '2024-06-24 03:01:22', NULL),
(43, 'George Murage', 'ggichobi@gmail.com', NULL, '$2y$10$qgpretMHOBybcRAlis65NuDwSK6FlFKFNaTecKKFn5r1T7...vVWK', NULL, '254725734484', NULL, NULL, 1, NULL, '2024-06-11 18:08:56', '2024-06-24 03:01:25', NULL),
(44, 'Collins Bukachi', 'collins.bukachi@libertylife.co.ke', '2024-06-12 04:36:27', '$2y$10$F2NQ/QkMMBdrNz56B.ACwegMtzZa.36b/5BPPEiulQjFDsXem2.Fm', NULL, '0728448202', NULL, NULL, 1, NULL, '2024-06-12 04:03:20', '2024-06-24 03:01:28', NULL),
(45, 'TITUS KIPNGETICH', 'titus.kipngetich@libertylife.co.ke', '2024-06-12 05:29:00', '$2y$10$8yIc1X6PxKqZqPpDZ.f9aefzAn5xFyxG6AEkLNKE2tjgsqoxjSlxe', NULL, '0716351132', NULL, NULL, 1, NULL, '2024-06-12 04:40:56', '2024-06-24 03:01:31', NULL),
(46, 'Beverly Muvoka', 'beverly@greyapple.co.ke', '2024-06-12 04:55:56', '$2y$10$4mlhaGV8fCSNeWUCdUPfUeT12Aeu8H.Ur/PeYkYF14BlEMph9HHV.', NULL, '0722255806', NULL, NULL, 1, NULL, '2024-06-12 04:52:50', '2024-06-24 03:01:34', NULL),
(47, 'Lispah Maina', 'wagiatham@gmail.com', NULL, '$2y$10$JFI0fBjKZFyZMfzdNQvDVe2ONMP8zIBNYftbC4M2bvCbA8k2tgbSm', NULL, '0724338105', NULL, NULL, 1, NULL, '2024-06-12 05:21:04', '2024-06-24 03:01:39', NULL),
(48, 'Test Person 6', 'chegzcol@gmail.com', '2024-06-15 17:18:05', '$2y$10$4DFYgOeaiMPENXv40R0ZcuGRk/I9zLm4zUp15mC5fi9LqL77Pb1S2', NULL, '0729908765', NULL, NULL, 1, 'q1j2OQxvuuy8gkmGXonex06te9N28plVYFXX3xbhXb2S0FVg9rLaKE96EjTS', '2024-06-12 07:40:32', '2024-06-24 03:01:40', NULL),
(49, 'Kilonzo Mbwele', 'kilonzo.mbwele@enabling.ch', NULL, '$2y$10$h6Jy7T8y4SheHWyGrW25zufLFeunqQAWnjr0YRjxbSXEYbZvvs1uG', NULL, '+254722486580', NULL, NULL, 1, NULL, '2024-06-12 08:21:10', '2024-06-24 03:01:42', NULL),
(50, 'Agnes Mbithi', 'mbithiagness22@gmail.com', NULL, '$2y$10$Gfoj36hUwGSlyMQILXW7ZOcoBRJB9G36eaAiLsOyQoaIA4pMjjRAq', NULL, '0752657047', NULL, NULL, 1, NULL, '2024-06-13 04:54:03', '2024-06-24 03:01:45', NULL),
(51, 'Raphael Opiyo', 'raphael.kobieron@gmail.com', '2024-06-13 06:36:44', '$2y$10$JiAGUY8Wd8P0nplkN5C4EOYmxmS/QoSKb4cFTa/tRqA5N9J9ppk1a', NULL, '0721177402', NULL, NULL, 1, NULL, '2024-06-13 05:44:44', '2024-06-24 03:01:47', NULL),
(52, 'Pi Capital', 'felix.mutiso@pycs.co.ke', '2024-06-13 06:03:57', '$2y$10$YGAz4KHz2HMNhaOZLCqGBeNj/SlynEDkH6W5CO1p2CPIrEAX5nse.', NULL, '0794751192', NULL, NULL, 1, NULL, '2024-06-13 06:03:21', '2024-06-24 03:01:49', NULL),
(53, 'MOMENTUM', 'comms@momentumcredit.co.ke', '2024-06-13 09:02:22', '$2y$10$fKAKszEcXd5fTJKlKpkOAu/06dThG8nBy54SoSdycx/Q/jpjqReJ.', NULL, '0796412878', NULL, NULL, 1, NULL, '2024-06-13 08:50:43', '2024-06-24 03:01:52', NULL),
(54, 'Constatine Gathogo Mungai', 'constatine.mungai@enabling.ch', NULL, '$2y$10$Llnjp10CjBgqA6wfg3InoeGF9TRiH83N3bmtaARs.eWp36zheANQq', NULL, '0727478182', NULL, NULL, 1, NULL, '2024-06-13 11:25:16', '2024-06-24 03:01:55', NULL),
(55, 'Test Person 8', 'info@miceafrica.org', '2024-06-13 17:09:50', '$2y$10$g8bouGzsPXusOT5zuJ0aKOQ/Sy0/3.b3gs6V720a4DLCviJ1SRzlu', NULL, '0729908746', NULL, NULL, 1, NULL, '2024-06-13 17:06:24', '2024-06-24 03:07:47', NULL),
(56, 'Samuel Kablit', 'sewoton@mercycorps.org', '2024-06-14 04:02:34', '$2y$10$yYKqZc02CXRbIQN36X4vD.5XeYj5kA1Oy6y8gNs4y4gpYHxxOG7Mu', NULL, '0712846194', NULL, NULL, 1, NULL, '2024-06-14 03:08:41', '2024-06-24 03:07:50', NULL),
(57, 'Emily Maina', 'emilymaina117@gmail.com', NULL, '$2y$10$4JqFAgWVTVvEywcred0yCODbLRNWT.13h/HLSxeuhVk4rkBfcykfC', NULL, '0721963578', NULL, NULL, 1, NULL, '2024-06-14 04:28:52', '2024-06-24 03:07:52', NULL),
(58, 'Jackie Githiga', 'jackiegithiga@gmail.com', '2024-06-14 05:22:55', '$2y$10$3k7eqwAC1dw7iX0BC3ymGu22QmsVYEF7LQ5JzP9gqH410Gv355hNm', NULL, '0720753042', NULL, NULL, 1, NULL, '2024-06-14 05:02:07', '2024-06-24 03:07:54', NULL),
(59, 'Eve', 'ekerubo@scgv.org', '2024-06-14 05:07:27', '$2y$10$.DjdIDN6DPpXvql8GzA0D.J4NN1JroD75Ke4VhaZ2RD6Z2LZFlQDy', NULL, '0722632082', NULL, NULL, 1, NULL, '2024-06-14 05:02:25', '2024-06-24 03:07:56', NULL),
(60, 'Tom Gitau', 'gitautom@gmail.com', NULL, '$2y$10$RDK7ZOTR/26NnQnhWTMsXOYxtFELs/JWzNOPKkm0OxNWCBqhcC./a', NULL, '0707829616', NULL, NULL, 1, NULL, '2024-06-14 05:23:48', '2024-06-24 03:07:58', NULL),
(61, 'Michael Gordwin', 'mgordwin@mycredit.co.ke', NULL, '$2y$10$mqJOJNvKZ/SFubDUsqsEsezz5Kt.9XCbe2nZPmIIfritfzflF9nva', NULL, '0757931955', NULL, NULL, 1, NULL, '2024-06-14 05:25:50', '2024-06-24 03:08:01', NULL),
(62, 'MUCHIRI MUCHEMA', 'Muchiri.Muchema@outlook.com', NULL, '$2y$10$DtbdQW.kJ1n7prRJ8SRumO1wVRRz6NJYSbNaGdpssOqovW/bt74oe', NULL, '0716227126', NULL, NULL, 1, NULL, '2024-06-14 05:30:58', '2024-06-24 03:08:03', NULL),
(63, 'Tawanda Wenyika', 'wenyika@gmail.com', NULL, '$2y$10$DeDKz7Ki8OwdgbtBDNjqguhnIcsym2PeotaReZBSjXBm05Zqdnb3.', NULL, '+254717766033', NULL, NULL, 1, NULL, '2024-06-14 05:35:26', '2024-06-24 03:08:06', NULL),
(64, 'leonard kipngetich', 'leonardkipngetich1970@gmail.com', NULL, '$2y$10$wKcBhphXHKFO.rfb.WR4mOJs4gdZfH0KSE5MuBlaqEAiRey0FeymO', NULL, '0722768767', NULL, NULL, 1, NULL, '2024-06-14 06:20:51', '2024-06-24 03:08:09', NULL),
(65, 'Danny Ochieng', 'danny@fairfaxcarter.com', '2024-06-14 06:51:13', '$2y$10$OedLcE.FZL9irdUnh4am6OV5NGlUg86o8spP6y4WXJsVfltpFBuSm', NULL, '+971551143412', NULL, NULL, 1, NULL, '2024-06-14 06:45:49', '2024-06-24 03:08:11', NULL),
(66, 'Test Person One', 'info@finco2024.co.ke', '2024-06-14 07:38:23', '$2y$10$9t.dQvh.zQpVvjhJ91jdCuctK9ivb5grUWlD2RuMRD6Y8k0ou//oa', NULL, '0729908444', NULL, NULL, 1, NULL, '2024-06-14 06:47:59', '2024-06-24 03:08:14', NULL),
(67, 'Doris Kimathi', 'doriskimathi90@gmail.com', NULL, '$2y$10$tirgjIpS8TRxozmibx2IuO15HmGyCT3oE654rm30olEDyuXsgVHh.', NULL, '0724128999', NULL, NULL, 2, NULL, '2024-06-14 07:11:29', '2024-06-24 03:54:33', NULL),
(68, 'Dr Patrick Gathondu', 'pgathondu@bimaskenya.com', NULL, '$2y$10$Zn7WONTasYScu/WgPNovVeJCkeqVqIRR6C.GSy4dV.wT2PjQZb8/u', NULL, '0721541161', NULL, NULL, 2, NULL, '2024-06-14 07:37:21', '2024-06-24 04:14:29', NULL),
(69, 'Ngotho Alexander', 'kahorongotho@gmail.com', NULL, '$2y$10$2x2H/xTY.v7j9hGyCwV15OykxGoK6yid8sgN3Sd6GSfTQcd7MXobK', NULL, '0727122025', NULL, NULL, 2, NULL, '2024-06-14 07:42:23', '2024-06-24 04:14:32', NULL),
(70, 'ELIZABETH KARING\'A', 'liz@bimaskenya.com', NULL, '$2y$10$lOPQUhr9MIZnjU9voVjEO.cWhXUgV.GjADt9UIGSYjXRcm7zteYTS', NULL, '0724574552', NULL, NULL, 2, NULL, '2024-06-14 07:51:15', '2024-06-24 04:14:35', NULL),
(71, 'Abraham Karanja', 'abraham@bimaskenya.com', NULL, '$2y$10$jYEz6vrvmVAGVJfKAoKxoOqQUzAPyzcVm4H60O3qVhiCnQWlAGYua', NULL, '0720211623', NULL, NULL, 2, NULL, '2024-06-14 08:00:44', '2024-06-24 04:14:38', NULL),
(72, 'JAMES JUMA OMONDI', 'iamjuma.ke@gmail.com', NULL, '$2y$10$1Ax77LJp22YGklKrywUXUO7OFLChoMfXM1pHmvZVv1pierS3pztHm', NULL, '0710549093', NULL, NULL, 2, NULL, '2024-06-14 08:31:17', '2024-06-24 04:14:41', NULL),
(73, 'Martin Njeru', 'm.gichovi@albacapital.co.ke', NULL, '$2y$10$gNB226z4bd6Ri4Od4ifN9e3/5byhmYKEBimXLiNX.3dYTkcdEGNnO', NULL, '0721274891', NULL, NULL, 2, NULL, '2024-06-14 08:52:37', '2024-06-24 04:14:45', NULL),
(74, 'Paul Muhami', 'paul@kingdombusiness.co.ke', '2024-06-14 10:15:19', '$2y$10$Y2VOXqkGcVeXAZLsJwcoieQK1k/Vcvf6W.Ey0ZsE9KungEr9TqnFi', NULL, '254722236933', NULL, NULL, 2, NULL, '2024-06-14 09:58:42', '2024-06-24 04:14:50', NULL),
(75, 'Elizabeth Njeri Maina', 'lizmeshaline@gmail.com', NULL, '$2y$10$7p41fVatBjvNVzpSkqK1Fe3Zy7PCYbkPOwaFnDsrv52Ui3eBBGWd.', NULL, '0799007621', NULL, NULL, 2, NULL, '2024-06-14 10:35:11', '2024-06-24 04:14:53', NULL),
(76, 'Lena Mkoji', 'lena.mkoji@gmail.com', NULL, '$2y$10$ZpghaV4kZt11wSrGMFEtc.tFZr7JaFak7Hl.rcYruLAqMK5FBibNm', NULL, '+254720264357', NULL, NULL, 2, NULL, '2024-06-14 13:58:44', '2024-06-24 04:14:56', NULL),
(77, 'Betty Karimi', 'bkarimi@recolte.co.ke', NULL, '$2y$10$oks1AR3ptaCMkaX3eAmZQeEcQbxpX2TiybTlO4HFVf9TmbYEK/ONy', NULL, '0722440184', NULL, NULL, 2, NULL, '2024-06-14 16:08:20', '2024-06-24 04:14:59', NULL),
(78, 'Noah Ndakala', 'noahndakala2014@gmail.com', NULL, '$2y$10$aYvnTfbN5DgRuRYHLtUQUulj85EENFwPFTBVoN2iwJy0pjIla2OSC', NULL, '0722220013', NULL, NULL, 2, NULL, '2024-06-14 16:44:52', '2024-06-24 04:15:03', NULL),
(79, 'Jim Muyoti', 'jmuyoti320@gmail.com', NULL, '$2y$10$m1MGWyVmpLHIH7a.npXL8ediTK6ZHP1u0IjSljx1bpUle9/NFcdmy', NULL, '0703332495', NULL, NULL, 2, NULL, '2024-06-14 19:20:22', '2024-06-24 04:15:06', NULL),
(80, 'Felistus', 'felistus.njoki@mayfairasset.com', NULL, '$2y$10$d6kch0prxlAK0DGdCD/mL.baRzyAktvoZgp4v88gqfoFez2XHMFJy', NULL, '0722418806', NULL, NULL, 2, NULL, '2024-06-14 22:46:41', '2024-06-24 04:15:08', NULL),
(81, 'Brian Kimani', 'kahingakimani@gmail.com', NULL, '$2y$10$WJTqh5TaUVGGmOCpvfs2FOLN/bQnG/v3a70QeG0HjSnFzFwSzducy', NULL, '0795454754', NULL, NULL, 2, NULL, '2024-06-16 06:31:23', '2024-06-24 04:15:13', NULL),
(82, 'James Mueke', 'james.mueke@tsea.co.ke', '2024-06-16 09:25:15', '$2y$10$CLpcId0EQVC4vBdxQBuqF.BuOg2yILO68FSiCp8KZd8yoyb0JYMby', NULL, '0732761964', NULL, NULL, 2, NULL, '2024-06-16 09:11:02', '2024-06-24 04:15:17', NULL),
(83, 'LEROY', 'julien.leroy@gca-foundation.org', '2024-06-16 17:06:01', '$2y$10$3aBw7AFkpbQCRZZXWnLv0.nxYZgYfAiKHIqqHFtmlffs2h87GdDli', NULL, '+221777974185', NULL, NULL, 2, NULL, '2024-06-16 16:49:53', '2024-06-24 04:15:19', NULL),
(84, 'WILBERFORCE AMUGUNE SENELWA', 'wilberforce@ndakalaadvisory.co.ke', '2024-06-17 07:07:32', '$2y$10$t/yUWOCzyMJq5EMsYRJuLeRMq9mbE6j8VRllFkExoXS0TkEYb1JVy', NULL, '0706461393', NULL, NULL, 2, NULL, '2024-06-17 07:04:56', '2024-06-24 04:15:22', NULL),
(85, 'Florence Nasieku Lesoloyia', 'flesoloyia@mercycorps.org', '2024-06-17 07:09:52', '$2y$10$rT8S3tVf.tRhyCb.FnON/eMVTeZsFhkmGyJnhtYbTMcv3VBltPj5u', NULL, '0722911225', NULL, NULL, 2, NULL, '2024-06-17 07:06:26', '2024-06-24 04:15:25', NULL),
(86, 'Arnold Midung\'a', 'amidunga@gmail.com', '2024-06-17 07:51:56', '$2y$10$paQyuqXzEb4WUi9nNqIIve9AghuBfW5HtgkQelSbcJN2ClTFPikA6', NULL, '0720709711', NULL, NULL, 2, NULL, '2024-06-17 07:49:45', '2024-06-24 04:15:27', NULL),
(87, 'Paul Katende', 'p.katende@solutifinance.org', '2024-06-17 10:00:38', '$2y$10$yihMCg1Cm61VOR//4TjuGOgTHRUB4H/kJFGIm43Bx7s/wq/f8351.', NULL, '+256772484692', NULL, NULL, 2, NULL, '2024-06-17 09:56:14', '2024-06-24 04:15:31', NULL),
(88, 'Iutung Denis', 'd.iutung@solutifinance.org', '2024-06-17 10:03:25', '$2y$10$GgnER4hMpxhpGsmvA/Xr6Ok5N2/Kicvd//Ijn4nMkJwyDX3Gbq8Zm', NULL, '+256782287238', NULL, NULL, 2, NULL, '2024-06-17 09:59:46', '2024-06-24 04:15:34', NULL),
(89, 'Nita Gichure', 'nita.gichure@libertylife.co.ke', NULL, '$2y$10$fqmhXoMa8tVDFx9FScCK4eaMpqSEo/ayG0ZFqqPej6/tVHVH/X5EO', NULL, '0722351983', NULL, NULL, 2, NULL, '2024-06-17 22:17:51', '2024-06-24 04:15:38', NULL),
(90, 'Eliud wachira', 'ewachira@mespt.org', '2024-06-18 03:41:32', '$2y$10$I/sPOL7DLVpBi2euE4ejl.QYv8nCsBEGj90OUbbZtHnpEODjHswkW', NULL, '0738416785', NULL, NULL, 2, 'aejQMq9GpEbbGxSjMIs6cVbPSkh73iyLlAZBSCVxljiskHa5mXodmBDW98Dc', '2024-06-18 03:39:12', '2024-09-17 04:42:26', NULL),
(91, 'Jack Runo', 'jruno@mespt.org', '2024-06-18 04:15:15', '$2y$10$xNDhb2/3go1XRRwzmEjuWOFkn4rZxJAN22IPlP74UzNgE3qi6/jcq', NULL, '0705356342', NULL, NULL, 2, NULL, '2024-06-18 04:14:18', '2024-06-24 04:15:43', NULL),
(92, 'Adrian Kariuki', 'adrian.kariuki@caritas-mfb.co.ke', '2024-06-18 04:39:35', '$2y$10$M38MZO89ApanxCZQOrXm7.EF.kUxfL6zWaFa8QvYrzHgKsYm.h6pW', NULL, '+254722425150', NULL, NULL, 2, NULL, '2024-06-18 04:38:44', '2024-06-24 04:15:46', NULL),
(93, 'Caroline Kamau', 'ckamau@triplejump.eu', '2024-06-18 05:31:12', '$2y$10$4gb.q8Aw7p3OF7N0Xsm9butdD49NkEo7YFD9iEux8uensq5VNPxyi', NULL, '+254711145158', NULL, NULL, 2, NULL, '2024-06-18 04:56:14', '2024-06-24 04:15:49', NULL),
(94, 'Geofrey Mugo', 'info@frameworkconcepts.co.ke', NULL, '$2y$10$2cbE4RGGlUhXoS6mBbm9EOMTbl1deAYfVOlztdlxKMEWozchEJG0y', NULL, '0711539641', NULL, NULL, 2, NULL, '2024-06-18 05:05:00', '2024-06-24 04:15:53', NULL),
(95, 'Geofrey Mugo', 'taakilamugo@gmail.com', NULL, '$2y$10$c4klXweiSmPg1Gb2wAPJBe84uzFBSx8IF6RMX7b/Es101xgsc5HhC', NULL, '0703331491', NULL, NULL, 2, NULL, '2024-06-18 05:05:59', '2024-06-24 04:15:56', NULL),
(96, 'Brian Aleri', 'baleri@dime.co.ke', NULL, '$2y$10$0qIsR4u3oythTdfid2h6Gegm1B2cQ6lZ6mQ/W7GLKI1Zd2tKTpMKu', NULL, '0721898255', NULL, NULL, 2, NULL, '2024-06-18 05:11:35', '2024-06-24 04:16:01', NULL),
(97, 'Rose Wangui', 'varosewangui@gmail.com', NULL, '$2y$10$U5ZdteGF91l6LEQ9u77UpOqqrq4flF5e.ijTfpDEmbgLLiXHZnzz.', NULL, '+254726912626', NULL, NULL, 2, NULL, '2024-06-18 05:59:52', '2024-06-24 04:16:02', NULL),
(98, 'Johannes Ebert', 'johannes@juakali.io', '2024-06-18 07:37:48', '$2y$10$Ri0M.q.ajNmNxHJBgUTLCOyEursPQnQssE.8XMSrbkxzy4a8b.sJK', NULL, '+254796279968', NULL, NULL, 2, NULL, '2024-06-18 07:26:45', '2024-06-24 04:16:05', NULL),
(99, 'Margaret Gitura', 'margaret.gitura@newarkfron.ke', NULL, '$2y$10$f792HpSewtPCNRK/wY5gnOLUiFExKJTPAKEWX2u8uYq.Iz4hCAwkq', NULL, '+254715833596', NULL, NULL, 0, NULL, '2024-06-18 09:31:18', '2024-06-18 09:31:18', NULL),
(100, 'Gabriel.Olango', 'Gabriel.Olango@faulukenya.com', NULL, '$2y$10$3CcQMbe2j1ECDWdZ.dWHQ.qfdmVL9/FqSCcx7H8raNrqWKFIVELaW', NULL, '0723674141', NULL, NULL, 2, NULL, '2024-06-18 10:42:09', '2024-06-24 04:12:51', NULL),
(101, 'HAMILTON GINGRICH', 'hgingrich@choice-bank.com', '2024-06-18 12:04:52', '$2y$10$tmApdVmMZE6CplpPxJp4vuHHzT7xzGyj90McOlum0F6MXBSJNYZG.', NULL, '0705463116', NULL, NULL, 2, NULL, '2024-06-18 12:03:40', '2024-06-24 04:12:48', NULL),
(102, 'Adet N. Kachi', 'adetk@yehu.org', NULL, '$2y$10$04iGZwK4UENaBABzDZFZSuF/JN6jv7TOcwrt1ywOqigXLZ.Mf1rbu', NULL, '+254720365219', NULL, NULL, 2, NULL, '2024-06-18 13:00:01', '2024-06-24 04:12:45', NULL),
(103, 'Mary Mumba', 'mumbamarym@gmail.com', NULL, '$2y$10$jzL00/FRjADKw59gRbaJh.zDDdQXtmD1zR5VP.1ixZU84ADRmm5rG', NULL, '+260977804744', NULL, NULL, 2, NULL, '2024-06-18 13:37:09', '2024-06-24 04:12:42', NULL),
(104, 'Caroline Gathii', 'cgathii@firstideaconsulting.co.ke', NULL, '$2y$10$BepNePjOpL2GwSpEYV.v.uRjVZ2ocdsznrKyGAyJy/2ZGzIt8vybW', NULL, '0722943656', NULL, NULL, 2, NULL, '2024-06-18 13:55:07', '2024-06-24 04:12:39', NULL),
(105, 'Lina Ngige', 'lngige@acreafrica.com', '2024-06-18 16:45:54', '$2y$10$VXOVDnu4tKKxd/syT/ggdev/gKXuATc4ZdMkiYQ29S8uKnU8VSqnu', NULL, '0722670792', NULL, NULL, 2, NULL, '2024-06-18 16:44:37', '2024-06-24 04:12:37', NULL),
(106, 'Stephen Mwangi', 'Stephen.Mwangi@niobi.co', NULL, '$2y$10$DFrcehG4XPABv3/h2K1NB.I1ORpGrvaxIUMJRepocRW.stMjcbPxm', NULL, '+254721548378', NULL, NULL, 2, NULL, '2024-06-18 16:47:49', '2024-06-24 04:12:34', NULL),
(107, 'Margaret Gitura', 'meggyvile@gmail.com', '2024-06-20 04:43:41', '$2y$10$P5hYjjuefanaGkWUyUz2v.qThC1qXrXCgnrFVbvQaVbAwjUPCyToi', NULL, '0739911020', NULL, NULL, 2, NULL, '2024-06-18 17:01:34', '2024-06-24 04:12:31', NULL),
(108, 'Geoffrey Muendo Muli', 'muendomuli01@gmail.com', NULL, '$2y$10$Sz7mnwNTqS3S2vKOWzfBL.AjQSLJcuwzxGURjgLRP1hLCYy5LQZYq', NULL, '0728673801', NULL, NULL, 2, NULL, '2024-06-18 21:19:42', '2024-06-24 04:12:29', NULL),
(109, 'Mohammad Ahsan Habib', 'habib@asa-ke.com', '2024-06-19 03:45:48', '$2y$10$/bzwQ25qMLDU6UHQzWkAyOwbJitxjdUBh/DRUcZRRPKqoLNnnUZfy', NULL, '0768823090', NULL, NULL, 2, NULL, '2024-06-19 03:21:45', '2024-06-24 04:12:09', NULL),
(110, 'Mary Mathenge', 'mmathenge@hopeinternational.org', '2024-06-19 03:55:11', '$2y$10$8jL4bpq3R6PUTKlQaKm3S.szU3z4KNIFBUFersTWubCTpByCqzaLe', NULL, '0722407261', NULL, NULL, 2, NULL, '2024-06-19 03:51:10', '2024-06-24 04:12:05', NULL),
(111, 'Timothy Kabiru', 'kabiru@moneycloud.co.ke', '2024-06-19 03:55:38', '$2y$10$siucQb/kOh.fc94SmwhJN.tuRDpdZU4U/vSsCoVGdyNpCIRcoUDk2', NULL, '0722711915', NULL, NULL, 2, NULL, '2024-06-19 03:51:53', '2024-06-24 04:12:03', NULL),
(112, 'Reuben Mwaura', 'reuben_mwaura@visionfund.org', NULL, '$2y$10$AKoNAJTFjcjpuvjip9WvXuyIT1eh7o9DX9re60D00ASWwHJNpTRaO', NULL, '0720854877', NULL, NULL, 2, NULL, '2024-06-19 04:31:33', '2024-06-24 04:11:59', NULL),
(113, 'Everpenrope Wambui', 'everpenrope@gmail.com', NULL, '$2y$10$LIXiy1yn.3nu5Je/uFr3geqLaKs9z36B.NIG860uPId6L1pF9UTES', NULL, '0721280125', NULL, NULL, 2, NULL, '2024-06-19 04:51:49', '2024-06-24 04:11:56', NULL),
(114, 'Ascar Sudi', 'asudi@accion.org', '2024-07-30 03:24:21', '$2y$10$tRGRCOSTENS5qzTpR2J2Y.5APmx8WQvQgKrocOOM9TBKQlaFpMQ5O', NULL, '0717825106', NULL, NULL, 2, '3LXaE5sW2WAOmWKvJKuyD9iKp5J10VESXjfPJLbZI27xD7d7rdTJJ9SzgPdi', '2024-06-19 05:11:08', '2024-07-30 03:24:21', NULL),
(115, 'STEPHEN KANAKE', 'skanake@barakacredit.co.ke', NULL, '$2y$10$dFN1hHtmS5VMvcLVfI36wuJihfCAirY.JZitEBH62ND9eQ216aZj6', NULL, '0722893089', NULL, NULL, 2, NULL, '2024-06-19 05:54:41', '2024-06-24 04:11:51', NULL),
(116, 'Boniface  Karere', 'karereb@gmail.com', NULL, '$2y$10$aRM3aStOkP5wcUu..x.uP.ZvjCz0dhVMd/UQR9sJLfG3UnC1DG5UC', NULL, '0736215210', NULL, NULL, 2, NULL, '2024-06-19 09:33:47', '2024-06-24 04:11:48', NULL),
(117, 'Bernice Githinji', 'bernice.githinji@yehu.org', '2024-06-19 10:36:58', '$2y$10$q/.ukxFjb7b89BE/P9rLgei4NLcAH9hYDr1iGWLPuEdSSrM1/bWuO', NULL, '0720660267', NULL, NULL, 2, NULL, '2024-06-19 10:31:03', '2024-06-24 04:11:46', NULL),
(118, 'Charles Njoroge', 'info@jawabubiz.co.ke', NULL, '$2y$10$YFvCAQ5bDEQbntmCY7hFGOPwchnbaPvyZ0.4WVDX0nbsRZ8PRYU2G', NULL, '+254722628676', NULL, NULL, 2, NULL, '2024-06-19 11:41:28', '2024-06-24 04:11:44', NULL),
(119, 'MAKOPA MWASARIA', 'makopa.mwasaria@synesis.co.ke', '2024-06-25 04:56:15', '$2y$10$juhFu1KbbVDIOWSbPsE8KOXKY/TW4G/VYpiBWOiIyoOlLmDW91WXG', NULL, '0722641987', NULL, NULL, 2, NULL, '2024-06-19 12:00:57', '2024-06-25 04:56:15', NULL),
(120, 'Abel Masai', 'abel.masai@tendepay.com', NULL, '$2y$10$7B24TnqHRXo7OO2Ak7emle.gBERlEm8pIm2f2u/a1HdX7Ej7pVP7S', NULL, '0728922238', NULL, NULL, 2, NULL, '2024-06-19 12:04:48', '2024-06-24 04:11:37', NULL),
(121, 'Dominic Nyaramba', 'dnyaramba@gmail.com', '2024-06-19 13:31:58', '$2y$10$aeLJwhbmHWIcSJ3KnL6y4u7xQpXMRJOTLp544u8LlYNAUA6c6OGZm', NULL, '0731037282', NULL, NULL, 2, NULL, '2024-06-19 13:30:05', '2024-06-24 04:11:35', NULL),
(122, 'Dominic Nyaramba', 'dnyaramba@bconconsult.co.ke', NULL, '$2y$10$h15RDskMhoCRAT9CA90X7OhI62zlE.UEH859QbSdHlly/11Pgz0dW', NULL, '0716303035', NULL, NULL, 2, NULL, '2024-06-19 13:31:12', '2024-06-24 04:11:33', NULL),
(123, 'Patricia Wanjama', 'pw.njeri@gmail.com', NULL, '$2y$10$viVGbN3ZzvRHRI/IoQ5w1eUDh41asYT80YYyZmO6t2iD./vZ/gVNy', NULL, '0722315647', NULL, NULL, 2, NULL, '2024-06-19 13:40:03', '2024-06-24 04:11:30', NULL),
(124, 'Kamadi Victor', 'Kamadbill@yahoo.com', NULL, '$2y$10$59pzguMi6G.oGVvQM3zk8ueDlfDwrr3p7pAX/KdHiVaFZMDwXH52K', NULL, '0724025581', NULL, NULL, 2, NULL, '2024-06-19 14:00:50', '2024-06-24 04:11:28', NULL),
(125, 'George Mwongela', 'Georgekiokom@yahoo.com', NULL, '$2y$10$6zjg8a4DA4.IwZTUE3sUS.HLhxkjZL8l7Q2PqIvIdNjUuG5HRd/5e', NULL, '0717444061', NULL, NULL, 2, NULL, '2024-06-19 14:26:06', '2024-06-24 04:11:25', NULL),
(126, 'Martin  kimutai', 'kimmoody315@gmail.com', NULL, '$2y$10$k.r4NQwfUyiLvj5UYcK52O0tLYpZA238WieUxUfInu3eh5OLe30Z2', NULL, '0746707606', NULL, NULL, 2, NULL, '2024-06-19 14:43:10', '2024-06-24 04:11:23', NULL),
(127, 'Fredrick Ochieng Olumo', 'fred@uhai.health', NULL, '$2y$10$FXKg5P66yn.o4RlPY6ZRVeFE8V5rdeOMSx7xLoHD/8L5PAZ6AmmC6', NULL, '0724627010', NULL, NULL, 2, NULL, '2024-06-19 15:55:46', '2024-06-24 04:11:20', NULL),
(128, 'AMOS KIPRUTO', 'kamorogo@gmail.com', NULL, '$2y$10$FqjYWFl7Kt/DnI3pLPEiOeM0F5fOzPDukiYVNBbJmj2zEPEuBsp2W', NULL, '+254733805787', NULL, NULL, 2, NULL, '2024-06-19 17:34:35', '2024-06-24 04:11:18', NULL),
(129, 'Robert J Kapyepye', 'kapyepyerj@gmail.com', NULL, '$2y$10$5zl.aaBHY.hD7dJZkHWZs.FLXLunG.RVnIII8Mm2o3traSfSH90Na', NULL, '+265883378888', NULL, NULL, 2, NULL, '2024-06-19 17:36:20', '2024-06-24 04:11:15', NULL),
(130, 'Mercy Kanyi', 'wambui.kanyim@gmail.com', NULL, '$2y$10$kzXyXJsnz7g5DrSneV4VDezhElzputCSko2AATxs8Rp9rmZKELapC', NULL, '0792002119', NULL, NULL, 2, NULL, '2024-06-20 00:10:57', '2024-06-24 04:11:11', NULL),
(131, 'Kevin Kamemba', 'kam@womensworldbanking.org', '2024-06-21 03:23:39', '$2y$10$GPTh5pcwlfLes76n6NsxoOOEqg8GRhBIOPotcJVeKKxHdUKwD7nyi', NULL, '0720851714', NULL, NULL, 2, NULL, '2024-06-20 02:28:32', '2024-06-24 04:11:08', NULL),
(132, 'Mindo Kaziulis', 'mindaugas.kaziulis@mogo.co.ke', NULL, '$2y$10$uXmWOqzq8bkZTKJZ9.6nzumXRI2xO7u/TQKC34jfXhMFhnf/ycVQK', NULL, '0798232698', NULL, NULL, 2, NULL, '2024-06-20 02:52:36', '2024-06-24 04:11:03', NULL),
(133, 'Mellanie Nganga', 'melwangare@gmail.com', NULL, '$2y$10$haEIXq9GZVPQKcxChP7wIemosfCX53WHn9qlThrqbynBDvAJ.wxB6', NULL, '0721556468', NULL, NULL, 2, NULL, '2024-06-20 04:20:18', '2024-06-24 04:11:00', NULL),
(134, 'Kariuki Fernades Ndungu', 'fernades.kariuki@gmail.com', NULL, '$2y$10$qCWomJsP4qHYpUmhM7K3vuRyYHeopPC/kfv0EX.ABnjHOdcaoiysS', NULL, '0727010309', NULL, NULL, 2, NULL, '2024-06-20 04:26:11', '2024-06-24 04:10:57', NULL),
(135, 'Alex wachira njeri', 'Wachiraalex366@gmail.com', '2024-06-20 04:31:44', '$2y$10$kz.7jOxIovFIVCuawDgbKe14r.cIfUe7DoUyWKDVnyB.uD0Hpy7Eq', NULL, '0711714911', NULL, NULL, 2, NULL, '2024-06-20 04:30:14', '2024-06-24 04:10:55', NULL),
(136, 'Jackline Onyango', 'jackline.onyango@blueorchard.com', '2024-06-20 04:53:57', '$2y$10$50PLz3ILrTz75tsyiiKD8egeidPmpuzIc7KBtvcmYRk8SvpfnMjPu', NULL, '+254738677081', NULL, NULL, 2, NULL, '2024-06-20 04:48:58', '2024-06-24 04:10:52', NULL),
(137, 'Allan Kamau Mbugua', 'alantayne@gmail.com', NULL, '$2y$10$gOj0RFExDQmFCnJzgZoy.O51S2FnqUFPAN.ykXsKP5TDZYyXpeLMi', NULL, '254721343343', NULL, NULL, 2, NULL, '2024-06-20 05:39:31', '2024-06-24 04:10:48', NULL),
(138, 'Edna Mulwa', 'edna.mulwa@metropol.co.ke', NULL, '$2y$10$WolvQP1kNGRwCn7zaCpK4uykrRNx4OxfAUj9qIF26m2WxnQQy180O', NULL, '0725949221', NULL, NULL, 2, NULL, '2024-06-20 05:49:22', '2024-06-24 04:10:45', NULL),
(139, 'Lavenda Onyancha', 'lavenda.onyancha@aglowiscapital.com', NULL, '$2y$10$pXNBi8qBc/lGKe2mCg89yOC2vtDsPuxZmzk9qflX3mfthTWC3Olme', NULL, '0726080293', NULL, NULL, 2, NULL, '2024-06-20 06:24:46', '2024-06-24 04:10:42', NULL),
(140, 'Cecilia', 'cecilia.thuita@avadapay.com', NULL, '$2y$10$nryJ4cpBMOob8Y4r10zOfelqi.nrxG3KlkZhe5iUXFGC4PyrFEPdS', NULL, '+254722408590', NULL, NULL, 2, NULL, '2024-06-20 06:35:03', '2024-06-24 04:10:39', NULL),
(141, 'Sam Atuya', 'samuel.orero@metropol.co.ke', '2024-06-20 06:47:50', '$2y$10$MIr38vl1/ss2oIBcJNSJ1.sPnDr73w6e60Cr2zqPpRaF1bkn9bx1m', NULL, '0728051921', NULL, NULL, 2, NULL, '2024-06-20 06:43:09', '2024-06-24 04:10:36', NULL),
(142, 'David Owiro', 'david.owiro@controlrisks.com', NULL, '$2y$10$ExL3etMBiozPBw/SXN1ibeACe1yXwRec1wBvz4t0ojmYm1X7Dw87W', NULL, '0723771345', NULL, NULL, 2, NULL, '2024-06-20 06:56:58', '2024-06-24 04:10:34', NULL),
(143, 'Kariuki Fernades Ndungu', 'fernades.kariuki@mogo.co.ke', '2024-06-20 09:25:28', '$2y$10$Bar/UZbGZklk0bms2ub7weJU0cB/W/9fvryV2DcET7jYZqkbGn3Y2', NULL, '0748599990', NULL, NULL, 2, NULL, '2024-06-20 07:17:55', '2024-06-24 04:10:31', NULL),
(144, 'Lucy Mukami Kaaria', 'lucy.kaaria@gmail.com', NULL, '$2y$10$GgK0uXqQ3zOUXzczAa.kIONShZGSiPem6yxGth12S76WXlC/hxz8G', NULL, '0704381989', NULL, NULL, 2, NULL, '2024-06-20 07:54:41', '2024-06-24 04:10:28', NULL),
(145, 'Timothy Wafula Mulongo', 'tmulongo@kcbgroup.com', '2024-06-20 08:37:18', '$2y$10$fhv5MsuuJmifBU7sOBuKzOwWUllzZpfOPMOjCVuXMwEg/I81cFgha', NULL, '+254721814454', NULL, NULL, 2, NULL, '2024-06-20 08:32:41', '2024-06-24 04:10:25', NULL),
(146, 'George Gatitu Njenga', 'ggatitunjenga@gmail.com', NULL, '$2y$10$hXi4bGLjhXtTC7/ObXPUJ.oy9tac7qX/JVreaPWuVhImWS5BC81Ge', NULL, '+254706325672', NULL, NULL, 2, NULL, '2024-06-20 08:39:39', '2024-06-24 04:10:20', NULL),
(147, 'pauline', 'info@amfikenya.com', NULL, '$2y$10$Tdah1egc2eVzq3ZEUafQkuZMFLpQuZnMp50t2GJ29XgtbAAXANNMK', NULL, '0721549653', NULL, NULL, 2, NULL, '2024-06-20 09:43:02', '2024-06-24 04:10:18', NULL),
(148, 'Tom Omedi', 'theomeden@gmail.com', '2024-06-20 09:54:20', '$2y$10$a.yGtq2Jf0dkjdXO9uHwnefss.O8PeXNiEZCZJoGdajLvaIIE07fe', NULL, '725889229', NULL, NULL, 2, NULL, '2024-06-20 09:48:04', '2024-06-24 04:10:15', NULL),
(149, 'Test Person 12', 'info12@fincon2024.co.ke', '2024-06-20 10:20:23', '$2y$10$eUlSAkZnh05ovEhteP.jxe.jVA/hZIs2ciLnGYHHwcaPjt1mqNBGq', NULL, '+254729908751', NULL, NULL, 2, NULL, '2024-06-20 10:04:09', '2024-06-20 10:20:23', NULL),
(150, 'Davis Achiki', 'davisachiki@gmail.com', NULL, '$2y$10$2qN5JwzoaXplaMrdK.Vv0e1atzdr5qJ5Oqw1QCnQikC7YV5YGuIne', NULL, '0725370833', NULL, NULL, 2, NULL, '2024-06-20 10:17:36', '2024-06-24 03:49:17', NULL),
(151, 'Test Person  what', 'info22@fincon2024.co.ke', NULL, '$2y$10$6E61FI2JkIY1taTIN8BfHOalKvfKpevRWcDXOcH5NZl4bMQEYBy7G', NULL, '0711111111', NULL, NULL, 2, NULL, '2024-06-20 10:31:10', '2024-06-20 10:31:10', NULL),
(152, 'Seeta Shah', 'seeta.shah@fsdkenya.org', NULL, '$2y$10$lhoBWUaWRnBtOWeCkwZgwOBe61J79dLv4BFrrJGck2lzL099h12MO', NULL, '0722128519', NULL, NULL, 2, NULL, '2024-06-20 10:43:41', '2024-06-24 03:49:13', NULL),
(153, 'Test Person today', 'info33@fincon2024.co.ke', '2024-06-20 11:04:21', '$2y$10$tYI87eG0oAOs8FJXT/wNYeufgWWJWf3PJM52Zp9ZrdbIqn.8S.YM6', NULL, '071222222', NULL, NULL, 2, NULL, '2024-06-20 11:03:21', '2024-06-20 11:04:21', NULL),
(154, 'Arthur kinyanjui', 'arthurk@ixafrica.co.ke', NULL, '$2y$10$c2sM4H3mdnYWntdjrQGarePA1aDrDAovni7.2ad.n/1RTbulhH5ZW', NULL, '0726581388', NULL, NULL, 2, NULL, '2024-06-20 11:54:34', '2024-06-24 03:49:09', NULL),
(155, 'Test Person thur', 'info3356@fincon2024.co.ke', '2024-06-20 12:50:47', '$2y$10$kqDYO4JIx0mXVfmDG/DHme.O7mAiexi219k9fdLLden/N/zKCwdFu', NULL, '0722222222', NULL, NULL, 2, NULL, '2024-06-20 12:44:33', '2024-06-20 12:50:47', NULL),
(156, 'Test Person 7j', 'info@fincon2024.co.ke', '2024-06-20 12:53:19', '$2y$10$JDe3f/H03Y3cxQst2.NMWua.4JJMoJlofhZtWBbC5xIVuRB6JlyZW', NULL, '07288900000', NULL, NULL, 2, NULL, '2024-06-20 12:52:14', '2024-06-24 03:49:06', NULL),
(157, 'Samantha Macharia', 'machariasamantha23@gmail.com', NULL, '$2y$10$W9eVGxWe6h.YL6rl2HjN5.Le83x2DJoMW3MWTwwO6xhYCCLhe2MhC', NULL, '+254743950351', NULL, NULL, 2, NULL, '2024-06-20 16:54:01', '2024-06-24 03:49:05', NULL),
(158, 'CPA PHYLIS MWITI', 'phylisgepsconsult@gmail.com', NULL, '$2y$10$rPQmkl2B9DUwzLkT4tllruF.pxtq7uRtv1ZWmPxo1mXeDvZxQV.Pu', NULL, '0722819816', NULL, NULL, 2, NULL, '2024-06-20 17:31:09', '2024-06-24 03:49:01', NULL),
(159, 'James Fadhili Ngao', 'fadhilingao@gmail.com', '2024-06-20 18:38:55', '$2y$10$rQxs1kf.NRt0VUJ32HucB.CXBw3rY4W7Dvz42FATE4rKgiYdvA89W', NULL, '0710379282', NULL, NULL, 2, NULL, '2024-06-20 18:18:46', '2024-06-24 03:48:59', NULL),
(160, 'PATRICK GACHUHI', 'patrick@elevatecredit.africa', '2024-06-21 02:23:17', '$2y$10$43SB104YtGcEJuq/S0yW8u5yeprD31pyHDRP6HxE7h38wYIe5ecXi', NULL, '+254721869069', NULL, NULL, 2, NULL, '2024-06-21 02:21:47', '2024-06-24 03:48:57', NULL),
(161, 'Tom Kimani Muriranja', 'tomkim@presta.co.ke', NULL, '$2y$10$tMjr4ZMgkvpzVGjKleuIUOw.8lyCa16vEM/XzSPDlFsGBNVH6SN5S', NULL, '0729472421', NULL, NULL, 2, '1ZSFx7jcDHQQ0lzlWm9JbvJsB8EdqWoINxbwAQd0sKUEaVYUcpcGhFiL0npH', '2024-06-21 05:09:13', '2024-08-27 02:22:58', NULL),
(162, 'LYDIA KIBAARA', '\'lkkibaara@muunganomfbank.co.ke', NULL, '$2y$10$yi4Tl0T785.0HkxSn.uw4eTyvthMs7RY1oS5Keqybfgi9pCuBacmy', NULL, '0722412852', NULL, NULL, 2, NULL, '2024-06-21 06:06:44', '2024-06-24 03:48:49', NULL),
(163, 'MUUNGANO MICROFINANCE BANK PLC', 'info@muunganomfbank.co.ke', '2024-06-21 11:22:37', '$2y$10$uhNIoVdQRr6tR/VE1a9UbOELbw/QquVyHZeqAC4YG1wNKbxaEtiVO', NULL, '0706974747', NULL, NULL, 2, NULL, '2024-06-21 06:17:36', '2024-06-24 03:48:46', NULL),
(164, 'stella munyoro', 'stella.munyoro@hfgroup.co.ke', NULL, '$2y$10$HM.e3pOq4mdDDHCdcZvWP.5it7AEdbUvSroISS.r/S5XRKr/YWhyy', NULL, '0722831282', NULL, NULL, 2, NULL, '2024-06-21 06:23:30', '2024-06-24 03:48:44', NULL),
(165, 'Patrick Gachugu', 'pgachugu@muunganomfbank.co.ke', NULL, '$2y$10$5MEaych0/.wwet7/l8f0SeTordSMzQrOuzQ66LWsGFShRELxm9SdO', NULL, '0722214891', NULL, NULL, 2, NULL, '2024-06-21 07:39:50', '2024-06-24 03:48:42', NULL),
(166, 'salome wairimu', 'wairimusallym@gmail.com', NULL, '$2y$10$20ht0PMtkXHDwOFGCmmvkeEILS84aK664i2TrB/i/XWFATzfklNSK', NULL, '0714186221', NULL, NULL, 2, NULL, '2024-06-21 08:37:19', '2024-06-24 03:48:36', NULL),
(167, 'Caroline Karanja', 'ckaranja@amfikenya.com', NULL, '$2y$10$oqO5.wSmkObiobrGidq5EOOVnSoC8hvby5XeLrGCqgNlncnoKIJM2', NULL, '+254722801275', NULL, NULL, 2, NULL, '2024-06-21 09:22:23', '2024-06-24 03:48:34', NULL),
(168, 'Samuel Kimani', 'samuel@visrom.co.ke', NULL, '$2y$10$N0nPqID76h9PbNXo1gKBX.0inC1izSkmuo3YSjj/BWfxJZN2t.iQG', NULL, '+254727742642', NULL, NULL, 2, NULL, '2024-06-21 09:33:28', '2024-06-24 03:48:32', NULL),
(169, 'Laban hihu', 'hihulaban86@gmail.com', NULL, '$2y$10$i7NLEVdr6fyDRhTwww7okuK1iDPTgydvTaJDxTxejKXiJfIEjX5Hm', NULL, '0722550206', NULL, NULL, 2, NULL, '2024-06-21 09:53:25', '2024-06-24 03:48:29', NULL),
(170, 'Evelyn', 'evemuch@gmail.com', '2024-06-21 09:58:52', '$2y$10$J4TT5KYhjJjqoxfZuGiqD.2EVBUowKDSUhyU8AUQphvn2GD5cD6c2', NULL, '0725656812', NULL, NULL, 2, NULL, '2024-06-21 09:57:18', '2024-06-24 03:48:27', NULL),
(171, 'TYNKA', 'trispah@rafiki.co.ke', NULL, '$2y$10$AdhqfdLKtgIvTZ5MPXwngOofiHmKGJ4eKe0XvVePtEOSULpjt2fmO', NULL, '254734135466', NULL, NULL, 2, NULL, '2024-06-21 10:36:05', '2024-06-24 03:48:25', NULL),
(172, 'Martin Mungai', 'kimitimartin@gmail.com', NULL, '$2y$10$gk3wDvrYuLkIdxz2HPMo3eUdqjvclx4IHjhi9jqMlXECeT2DFpWQ6', NULL, '0718368268', NULL, NULL, 2, NULL, '2024-06-21 11:12:35', '2024-06-24 03:48:22', NULL),
(173, 'Geoffrey Kariuki Mboo', 'info@fanikishamicrofinancebank.com', NULL, '$2y$10$HuucR9mtMtj.RoEWu1YPUekVOw0yvictJ9Vq9ASJ7qdEAl92XBwky', NULL, '0716435951', NULL, NULL, 2, NULL, '2024-06-21 11:25:41', '2024-06-24 03:48:20', NULL),
(174, 'James Ndolo', 'kuljameson@gmail.com', NULL, '$2y$10$tfLw18.HqizzpA.VqrN9..dbG5uTz61WzbsyjRH/oSPS/vkb565Cm', NULL, '0100282015', NULL, NULL, 2, NULL, '2024-06-21 12:54:04', '2024-06-24 03:48:17', NULL),
(175, 'Immaculate Wanjiru', 'immaculate.wanjiru@proficientcredit.co.ke', NULL, '$2y$10$e5d9VWGIN.1S5i/y.vMOc.STAtvyudr0pVQ9fcxVFR2eMxsaT.4li', NULL, '0733891309', NULL, NULL, 2, NULL, '2024-06-21 14:33:11', '2024-06-24 03:48:15', NULL),
(176, 'Patrick Maina Muraguri', 'Pmuraguri@apticcredit.com', NULL, '$2y$10$SlJwWEFBNiN1aNHUfPTDOevZz3H0NfcoKVN0Xhy825bqAl5U4TL5u', NULL, '0721616304', NULL, NULL, 2, NULL, '2024-06-21 15:26:11', '2024-06-24 03:48:11', NULL),
(177, 'BONFACE OMBUI', 'bonface@choice-bank.com', '2024-06-21 15:34:51', '$2y$10$pMUnGtFkjWBXi114OMF4cOcxfHrunBjhiisjtSKypSmllrF9nm0Cy', NULL, '0706169317', NULL, NULL, 2, NULL, '2024-06-21 15:30:02', '2024-06-24 03:48:09', NULL),
(178, 'Esther', 'estherligawa17@gmail.com', NULL, '$2y$10$di/x9K8OFKH.RDff/Bclj.3T4pPSiTpVz7Gqlw2omL9MGyDHDbVAm', NULL, '0713872093', NULL, NULL, 2, NULL, '2024-06-21 15:40:58', '2024-06-24 03:48:07', NULL),
(179, 'Devis Musiu', 'de.devis.r@gmail.com', NULL, '$2y$10$d2aAPoEorktZfzorrwY5WursI7S4sUf1vJdlpfqe0sa4MpP2UTtxC', NULL, '0727770622', NULL, NULL, 2, NULL, '2024-06-21 17:03:43', '2024-06-24 03:48:04', NULL),
(180, 'Njeri Mwangi', 'njerimwangi.fx@gmail.com', NULL, '$2y$10$k.PsCEZ4I6lfgOFh0onLVe.zhIyebjD15RTdUyVDPOGMQIVUjxuda', NULL, '0719769469', NULL, NULL, 2, 'TqLp3TKua9dQVygsCcWsrRbkHuFnwjycbUnUt80EeRm6jLi3pT99O0nvchGo', '2024-06-21 17:37:04', '2024-06-24 11:05:50', NULL),
(181, 'Jane warau kamau', 'jwarau1@gmail.com', NULL, '$2y$10$JzFFafzTWETLLTWml3kqm.Ne/IMjjdnI1WBjA0uDUfshcby3MSb4y', NULL, '0721491255', NULL, NULL, 2, NULL, '2024-06-21 19:23:16', '2024-06-24 03:47:59', NULL),
(182, 'GRACE NDERITU', 'gnderituh@gmail.com', NULL, '$2y$10$Z9UCWHtjpunuml/I45qWoegETNX5DmaCOw1Xm.Xuz96c/.vChWNse', NULL, '0721708832', NULL, NULL, 2, NULL, '2024-06-22 00:26:49', '2024-06-24 03:47:56', NULL),
(183, 'JoyPatience Munene', 'munenejoypatience@gmail.com', NULL, '$2y$10$RyNvXQV6aMqi0P6g4tlwau4eNUzyY7Sq3XHMPRy.Uai.nx/5E5dJ.', NULL, '0724631091', NULL, NULL, 2, NULL, '2024-06-22 00:31:14', '2024-06-24 03:47:53', NULL),
(184, 'Hezron Munga', 'hezron.munga@gmail.com', NULL, '$2y$10$y1Hz8QeKtDb1iJx3e85EeeXn6SugXaNx4.pO5wrv7QzOd4atZ7aeO', NULL, '254721515313', NULL, NULL, 2, NULL, '2024-06-22 04:00:12', '2024-06-24 03:47:51', NULL),
(185, 'Anne Kimari', 'anne.kimari@finebridge.co.ke', NULL, '$2y$10$sf.KOByK160vhPLo9KdFbeorkhJcUxr4PY5Z3OQ5iFoOIjBVc3WVe', NULL, '0714606134', NULL, NULL, 2, NULL, '2024-06-22 04:21:06', '2024-06-24 03:47:48', NULL),
(186, 'Abdulmalik David', 'abdulmallik51@yahoo.com', NULL, '$2y$10$nurAknEqt0bU6WQVe0kv1ONjpqfh6IxZzSxkZSemPCS4wPwWAURzq', NULL, '0715108811', NULL, NULL, 2, NULL, '2024-06-22 04:27:54', '2024-06-24 03:47:45', NULL),
(187, 'Lilian Gachoki', 'lilianwgachoki1@gmail.com', NULL, '$2y$10$sQHjIg1hdsp6sItYICNW3eQOkMBa4BTz3IXcZhKWlUGyckFDCE49e', NULL, '+254722497892', NULL, NULL, 2, NULL, '2024-06-22 05:04:31', '2024-06-24 03:47:44', NULL),
(188, 'ANTONY MUGO', 'tonymugo8@gmail.com', '2024-06-22 06:39:24', '$2y$10$0YHRyRukLKeROSODbmwZzehgD2fXDHJ83rTOEu8U68mws22DU74l6', NULL, '0722816074', NULL, NULL, 2, NULL, '2024-06-22 06:33:43', '2024-06-24 03:47:41', NULL),
(189, 'Naphtaly Waruhiu', 'hortipmak@gmail.com', '2024-06-22 08:00:11', '$2y$10$jyHogiT9Nhi9SjpiE7cOuu7IU7KGkJLEcXw/z2amIyfo4DlZSANFO', NULL, '+254717182562', NULL, NULL, 2, NULL, '2024-06-22 07:39:22', '2024-06-24 03:47:38', NULL),
(190, 'Ogara Dick', 'jarapedhi17@gmail.com', NULL, '$2y$10$ksOqGkMPklEx.Bv2qgfBmOr9eoLZJlLDy5q49DqmWmsilCsCR8I.u', NULL, '+254705018675', NULL, NULL, 2, NULL, '2024-06-22 07:40:07', '2024-06-24 03:47:37', NULL),
(191, 'Pattedy Nyagah', 'neemaheep2010@gmail.com', NULL, '$2y$10$H0jpjs4yOqmoDS0g1ixPs.5M1y4Gt3rUZys/QEBqCsCW7mE/dIJly', NULL, '0726762954', NULL, NULL, 2, NULL, '2024-06-22 07:48:16', '2024-06-24 03:47:35', NULL),
(192, 'Victor Ndiwa', 'victorndiwa@gmail.com', NULL, '$2y$10$oq7v4DY/gssKnc0/qp2rmuZ2BCfsGQA9B6ueqFEUITgJNQa5mW0w2', NULL, '0727784479', NULL, NULL, 2, NULL, '2024-06-22 08:25:30', '2024-06-24 03:47:33', NULL),
(193, 'Edel Moraa', 'moraaedelle30@gmail.com', NULL, '$2y$10$Nl3oYTAdrcVtj/XiSucPMO4HIgm7FfZtb0QjpJgrmT.gFX.vILOtq', NULL, '0705172918', NULL, NULL, 2, NULL, '2024-06-22 08:53:57', '2024-06-24 03:47:31', NULL),
(194, 'kennedy Aguvasu', 'kennedy.aguvasu@gmail.com', '2024-06-22 09:14:51', '$2y$10$GeWyUAH4WT/UC9YcqT07tub9eUhf.9Jx6wY9TvwTeTy3pquYDrsim', NULL, '0720439396', NULL, NULL, 2, NULL, '2024-06-22 09:12:42', '2024-06-24 03:47:29', NULL),
(195, 'Chrispinus owino', 'owinochrispinus139@gmail.com', NULL, '$2y$10$3wrly6ezJF0iCNCRlpEiIO7s/lthkr40hrFEqKPUQcZNQbEsE1Q6q', NULL, '0741594704', NULL, NULL, 2, NULL, '2024-06-22 10:05:52', '2024-06-24 03:47:27', NULL),
(196, 'Abel', 'abelmeseret1@gmail.com', '2024-06-22 10:40:24', '$2y$10$A0Y93UmJ9TUN6pbl/EKeteYCUai7Kzofv.1dhb5pbcbh7yw0LPzDG', NULL, '+251941607599', NULL, NULL, 2, NULL, '2024-06-22 10:37:55', '2024-06-24 03:47:24', NULL),
(197, 'Mercymoy Bakana Getahun', 'mercymoymom@gmail.com', NULL, '$2y$10$7hcucSdvVBmmkQ3tlJPlI.1iwl9KCzoB3YzuHzBuEDIeuJLGmnRwK', NULL, '0938010039', NULL, NULL, 2, NULL, '2024-06-22 10:43:19', '2024-06-24 03:47:21', NULL),
(198, 'Joshua Bosita', 'joshua.bosita@gmail.com', NULL, '$2y$10$KRG6UGD513cGGWj9uQ9d3.k6X/PDHjzlRL0Cf4c1ojBvBUh6YEb4y', NULL, '0708781671', NULL, NULL, 2, NULL, '2024-06-22 10:52:37', '2024-06-24 03:47:18', NULL),
(199, 'Thomas Ochieng', 'ochiengt226@gmail.com', NULL, '$2y$10$iboEl4H/QP/5G3aQ62ncXOBk2wDan/Ns0b6VrtCBo7OPcMEmempLq', NULL, '0720933484', NULL, NULL, 2, NULL, '2024-06-22 11:49:37', '2024-06-24 03:47:16', NULL),
(200, 'Collen Mugodzva', 'cmugodzva@yahoo.com', NULL, '$2y$10$TFQ8oudkR./7gEto6zV.M.FpC7PHe1wN2bfwzsJDStTMCHhsuUaM2', NULL, '0027694388099', NULL, NULL, 2, NULL, '2024-06-22 11:55:03', '2024-06-24 03:47:13', NULL),
(201, 'Seith Abeka', 'seith@uonbi.ac.ke', NULL, '$2y$10$Kla2ZdgKuZTDxMbQ1z7GMezmYYKZUxSTHkR4KhObhAcFsYpAAQIGe', NULL, '0720877674', NULL, NULL, 2, NULL, '2024-06-22 16:52:05', '2024-06-24 03:47:11', NULL),
(202, 'Stephen Muriuki', 'stephen@kwikalat.com', NULL, '$2y$10$FeiAoUew62nPy2ve07uYxuvW1Pil4tSa5PF7vvKmQTNBVBTzS07K6', NULL, '0111308031', NULL, NULL, 2, NULL, '2024-06-22 17:52:49', '2024-06-24 03:47:08', NULL),
(203, 'Peter Mulei', 'petermulei40@gmail.com', NULL, '$2y$10$NlHLxb8Imz.aGweRUslpcOOa.fMCM23VfmvBLzytKCiWL0l.K4gRy', NULL, '+254722809175', NULL, NULL, 2, NULL, '2024-06-22 18:20:55', '2024-06-24 03:47:05', NULL),
(204, 'james wanyama', 'wafula.james@gmail.com', NULL, '$2y$10$75bXHJlzJpuAFf8J.Y4UDu29eJ4QefuQGRDBgkNTjTruMDSkBCddy', NULL, '0721248081', NULL, NULL, 2, NULL, '2024-06-22 18:21:17', '2024-06-24 03:47:02', NULL),
(205, 'Anthony Wafula Mwambu', 'awafula83@gmail.com', NULL, '$2y$10$PsMfqZ2lE0XyveaO1BDfZeUNInYYyfZxj/zIhro40Z05jK2HZmm4q', NULL, '0718844851', NULL, NULL, 2, NULL, '2024-06-23 00:32:17', '2024-06-24 03:46:58', NULL),
(206, 'Godłliving maro', 'maro.godliving@gmail.com', NULL, '$2y$10$Y9SuOOm5R.qhs1V.kyrnaOefjbTGsFjmKpAGwL42e1ronF4NfWW1S', NULL, '0767210109', NULL, NULL, 2, NULL, '2024-06-23 00:54:43', '2024-06-24 03:46:55', NULL),
(207, 'William Atemi', 'williamatemi@gmail.com', '2024-06-23 01:07:04', '$2y$10$yqD2Qsb7AvPRvRhgeFw4lOPjdm.NbrVJ6jhZSlLbT3lqvTPFGZ2m.', NULL, '0710578231', NULL, NULL, 2, NULL, '2024-06-23 01:05:20', '2024-06-24 03:46:52', NULL),
(208, 'Pius Nunda', 'topkwach@yahoo.com', NULL, '$2y$10$LPXxYogZLRq47l9lYJyzrehY1kFoflFCYy3j5ASfaIz1zdlJr/y/m', NULL, '+254721863542', NULL, NULL, 2, NULL, '2024-06-23 01:32:11', '2024-06-24 03:46:49', NULL),
(209, 'AskahBosire', 'oaskah@gmail.com', NULL, '$2y$10$Ht8pneE7QDVkcP72yvdYBexv0PYat2NDwO7d47fChbXuTU0k3V96m', NULL, '0715664589', NULL, NULL, 2, NULL, '2024-06-23 01:38:26', '2024-06-24 03:46:46', NULL),
(210, 'David Kijazi', 'djkijazi@bot.go.tz', NULL, '$2y$10$mMv8b/iG3J4HtvAwh5ZLzOIIW2CD/z0Ljs8Esf06yIl4fo6cgMj4u', NULL, '+255', NULL, NULL, 2, NULL, '2024-06-23 02:09:26', '2024-06-24 03:46:44', NULL),
(211, 'MICHAEL OKWISIA MUTENYO', 'mmutenyo@gmail.com', NULL, '$2y$10$ea.SMismD2q49PT3IAXOGeVCJRkzBkRZGaSc/s3y.RCtnS9vR.gB.', NULL, '0101024624', NULL, NULL, 2, NULL, '2024-06-23 02:26:26', '2024-06-24 03:46:42', NULL),
(212, 'Delfina  Kavata', 'delfinakavata@gmail.com', NULL, '$2y$10$jhhmWSuBhlgi62jc31Z3jecKFQgr1UhmwxFn7eMjyMJ4Xg6PXzovu', NULL, '0702027273', NULL, NULL, 2, NULL, '2024-06-23 03:13:57', '2024-06-24 03:46:39', NULL),
(213, 'William Adero', 'williesotty@gmail.com', NULL, '$2y$10$midl0QXNIYNS3K7VPfCj2uJEJJKnNGAmUAI5pYu26CBF4dlbv/VNW', NULL, '0733613666', NULL, NULL, 2, NULL, '2024-06-23 04:48:50', '2024-06-24 03:46:36', NULL),
(214, 'Mary Ndinda', 'ndinda16@gmail.com', NULL, '$2y$10$C7pI/vlDGPE2.ZVfMjnim.gjv5HFpyeN6T1dYCOzj/DlEswPLHKFa', NULL, '0700100797', NULL, NULL, 2, NULL, '2024-06-23 04:49:52', '2024-06-24 03:46:34', NULL),
(215, 'Brian otieno omiele', 'otienob674@gmail.com', NULL, '$2y$10$FZgoFvWU.pnKpQQBnebtouUyW7Q.iOp2E0C5VRwWTWB966eXFWFLi', NULL, '0707937261', NULL, NULL, 2, NULL, '2024-06-23 04:53:18', '2024-06-24 03:46:31', NULL),
(216, 'FRANKLINE MWARO', 'mwarofrank@gmail.com', NULL, '$2y$10$wq5ampYLyb8f7iosph8M5u1APvzkCW1YQrR.qHwf8xJp2ULHhPuuO', NULL, '0706443391', NULL, NULL, 2, NULL, '2024-06-23 05:07:35', '2024-06-24 03:46:29', NULL),
(217, 'Joseph Njogu', 'njogujoe88@gmail.com', NULL, '$2y$10$QBr3ZbnaBd5l1Lq5QYnz8O7GtH8zlOVvG9UWKuQmIDzso2Tg4ZtY2', NULL, '0720660362', NULL, NULL, 2, NULL, '2024-06-23 05:20:35', '2024-06-24 03:46:26', NULL),
(218, 'Lilian Ambani', 'lambani@bellmacconsulting.com', NULL, '$2y$10$5WIGXpIH3iDb5TCknfMyqO1xOMpvvofAIIVqafCoNb92te9146Ro.', NULL, '0729911053', NULL, NULL, 2, NULL, '2024-06-23 05:28:27', '2024-06-24 03:46:23', NULL),
(219, 'CATHERINE RITA KARIMI', 'cathyritak@gmail.com', NULL, '$2y$10$j9OhOVM.palZe4Ga2OuQg.s1kbZz0JaKrPeLGfcef14iKfUGrLp4K', NULL, '0738489990', NULL, NULL, 2, NULL, '2024-06-23 05:43:08', '2024-06-24 03:46:20', NULL),
(220, 'Ronald Ouma', 'olooronald@gmail.com', NULL, '$2y$10$gjwew82QE4qFq2G.x5dEuOdPFg.sBzHPfXXmUUiw2xVLQEqArD4ci', NULL, '0705390466', NULL, NULL, 2, NULL, '2024-06-23 05:45:33', '2024-06-24 03:46:18', NULL),
(221, 'Mercy Nehema', 'mnehema@gmail.com', NULL, '$2y$10$NUtjKS.WWcLdTpd4uvgHhej.oyM6wwwf3AG3C6Ll4HfO2g9SnjB2C', NULL, '0721274451', NULL, NULL, 2, NULL, '2024-06-23 06:10:23', '2024-06-24 03:46:15', NULL),
(222, 'JAFLET HETENYI', 'jafletomengo@gmail.com', '2024-06-23 06:13:19', '$2y$10$ujaZX/DJTBe2gfj1IqcDK.lEgvK8CO5RE2smDQwNlXPjM.OVNk3c.', NULL, '0713280423', NULL, NULL, 2, NULL, '2024-06-23 06:12:23', '2024-06-24 03:46:12', NULL),
(223, 'Beril Ogot', 'ogot.beril@gmail.com', NULL, '$2y$10$TAdksc.SIhHKxzL2RtJH.eJnOaXySrBV6k8FCwVgV04IsIrIAVkBy', NULL, '0726842115', NULL, NULL, 2, NULL, '2024-06-23 06:14:08', '2024-06-24 03:46:09', NULL),
(224, 'Marwa Marwa', 'petermarwa6@gmail.com', '2024-06-23 06:59:09', '$2y$10$4FY/dnXUyn4BkFvXcmbE7.8qj8cXLJvnY3uifD4VyfLDoms988Aim', NULL, '+254710433589', NULL, NULL, 2, NULL, '2024-06-23 06:57:11', '2024-06-24 03:46:06', NULL),
(225, 'Wambugu Githaiga', 'maumaugck@yahoo.com', NULL, '$2y$10$.qaGGmfPLXcwumIYx9nN8.12AUhg2UIpYtKaS0ASnrFdk7jYNUbRW', NULL, '0726912129', NULL, NULL, 2, NULL, '2024-06-23 07:30:18', '2024-06-24 03:46:03', NULL);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `gender`, `phone`, `profile_image`, `user_verified_at`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(226, 'Benard Were', 'benard.were@galamore.co.ke', NULL, '$2y$10$HkOLFuEvymV2S.KKRK.ao.YM68ejttL.iegG0/LhAHPIuUEhKXyUy', NULL, '+254720211669', NULL, NULL, 2, NULL, '2024-06-23 08:13:18', '2024-06-24 03:46:01', NULL),
(227, 'Samwel Naimasia', 'naimasia.samwel@giz.de', NULL, '$2y$10$YchGa/5j2aJlLcfo/2Ur2.lPPWf7CtBn8lQ/XqnyEZYLZEFkKUCge', NULL, '072387218', NULL, NULL, 2, NULL, '2024-06-23 08:21:22', '2024-06-24 03:45:58', NULL),
(228, 'Helen Kithinji', 'hkithinji@yahoo.com', NULL, '$2y$10$5CuRL4i4IMCp6gYt6z9QUexa9.4UIB.NDfXmvAZlaXJBRxhPCJo6K', NULL, '+254725749544', NULL, NULL, 2, NULL, '2024-06-23 09:20:55', '2024-06-24 03:45:55', NULL),
(229, 'Emmanuel Orony', 'oronyemmanuel@gmail.com', NULL, '$2y$10$9.vIUlyzkwXNikEJpEqLD.2GVo62q75zzPEZ.DDU4851/DA.zb5pu', NULL, '0718427467', NULL, NULL, 2, NULL, '2024-06-23 09:40:15', '2024-06-24 03:45:53', NULL),
(230, 'Rosemary Nyambura', 'rosemarynyambura801@gmail.com', NULL, '$2y$10$lYqwAQ1bnxJXO/AhRaKef.HvaacWaiQEMPKAVDCBSqxUYPDaS2sWW', NULL, '0798036819', NULL, NULL, 2, NULL, '2024-06-23 09:46:05', '2024-06-24 03:45:50', NULL),
(231, 'Joel Agutu', 'joelagutu@gmail.com', NULL, '$2y$10$S7allAFVVSlUYBPbFdkbV.mz8muqdNl/FYPX4mFwC1/T5qDd9PbXW', NULL, '0723120430', NULL, NULL, 2, NULL, '2024-06-23 10:15:22', '2024-06-24 03:45:47', NULL),
(232, 'Lawrence Moranga', 'lomoranga@gmail.com', NULL, '$2y$10$21Wl112EbMmZkamMF1tIoenArEvUVM8WCWTQ8tIXYRbuidp4O7.Ey', NULL, '070806216', NULL, NULL, 2, NULL, '2024-06-23 10:20:18', '2024-06-24 03:45:44', NULL),
(233, 'Daniel Kioko', 'kiokodaniel@gmail.com', NULL, '$2y$10$ewtfgCy3rnPV0jNfe8zJfu7SSgGpm4ogzpLqai74yU6MlwwvdgDbC', NULL, '0726758277', NULL, NULL, 2, NULL, '2024-06-23 10:25:04', '2024-06-24 03:45:42', NULL),
(234, 'IBRAHIM JUMA', 'ejuanyara@gmail.com', '2024-06-23 10:36:37', '$2y$10$3zzv2EVdNF.QpZ06n7GN4eI5JJV6HNaHU.gl9Cce2zVBxaPYTuRNy', NULL, '+254720582373', NULL, NULL, 2, NULL, '2024-06-23 10:35:52', '2024-06-24 03:45:40', NULL),
(235, 'Cavin Apodo', 'kevinodhiambo705@gmail.com', NULL, '$2y$10$buzlXpuqESHfA7Fg.tkTWeNF3c.Ie8kOmmURgwZjYHS2jGIjh9r2u', NULL, '0717627632', NULL, NULL, 2, NULL, '2024-06-23 12:08:04', '2024-06-24 03:45:38', NULL),
(236, 'Brian Baraza', 'adamsbrian858@gmail.com', NULL, '$2y$10$ne7Z101XRybH4MHasbSQ.ujizmeoXgerJOZg1gr5uvEU61Zb0NH/i', NULL, '0791172416', NULL, NULL, 2, NULL, '2024-06-23 12:27:55', '2024-06-24 03:45:35', NULL),
(237, 'Paul Njonge', 'creativeinc1@gmail.com', NULL, '$2y$10$FR2YmYz3/BFfsVpgp/fC0.0/FQj6T5.qfBkda4Qba67L9Q8Q6wNHG', NULL, '0728538991', NULL, NULL, 2, NULL, '2024-06-23 12:55:30', '2024-06-24 03:45:32', NULL),
(238, 'Achiko Omulokoli', 'aomulokoli@gmail.com', '2024-06-23 13:37:47', '$2y$10$N8eSFzUfBj0Be0gqHo9TVuq5JT7kQSv/DEWToleymvQ1eqE9w8eI6', NULL, '0725084667', NULL, NULL, 2, NULL, '2024-06-23 13:37:18', '2024-06-24 03:45:30', NULL),
(239, 'Richard Kivimae', 'richard@jiwambe.com', NULL, '$2y$10$9pNR/03ICk4Akfo2UkPq8ezpHp/Lw8Hj4a61zSgrS9tw4/2P3cP1S', NULL, '+254716639505', NULL, NULL, 2, NULL, '2024-06-23 13:56:36', '2024-06-24 03:45:27', NULL),
(240, 'PHYLIS ABIRI', 'pyhlkem@gmail.com', NULL, '$2y$10$DSJEYZpk0qCiShvqBb1okeurLhqaiBlTTBzfvTSy./rLtUkyyipQq', NULL, '0726537716', NULL, NULL, 2, NULL, '2024-06-23 13:58:50', '2024-06-24 03:45:25', NULL),
(241, 'Wakiuru Njuguna', 'wakiuru@hevafund.com', '2024-06-23 15:06:08', '$2y$10$/nz4e.w1p6.o23wETaqX2O2FpAnournNQvnBif3XXO/WZJpTZM8kO', NULL, '0780746157', NULL, NULL, 2, NULL, '2024-06-23 15:05:37', '2024-06-24 03:45:22', NULL),
(242, 'Gichigo James', 'jamesgichigo@gmail.com', NULL, '$2y$10$xJzdC8GvscpjpumH8BJ8Xub3MtnWUaroWkbMdJNlqf0RVyawLRmsa', NULL, '+254711535086', NULL, NULL, 2, NULL, '2024-06-23 15:43:38', '2024-06-24 03:45:19', NULL),
(243, 'victor Yebei', 'victoryebay5@gmail.com', NULL, '$2y$10$8ejFuVGL75KyvEUUHa3gIu0vdzavWaSZIXIuHHQRVNoLuXVftbELW', NULL, '0748679595', NULL, NULL, 2, NULL, '2024-06-23 15:47:11', '2024-06-24 03:42:31', NULL),
(244, 'Kevin odhiambo', 'kevinodembe@gmail.com', NULL, '$2y$10$A.TuPU0/QDJC6zkymAuZVeNyTK1rSy9Wf0phQ29pzHMZzlZb1CUSq', NULL, '0724441090', NULL, NULL, 2, NULL, '2024-06-23 16:27:01', '2024-06-24 03:42:29', NULL),
(245, 'Jeff Momanyi', 'jeff@ronforddigital.com', NULL, '$2y$10$enModu/kOd.1vtsuZfvLmOKRt4kar56BU/0kfGvLzqNek/JIVwRGy', NULL, '0721147223', NULL, NULL, 2, NULL, '2024-06-23 16:43:02', '2024-06-24 03:42:27', NULL),
(246, 'Eugene Muchai', 'eugenemuchai@gmail.com', NULL, '$2y$10$bT6frjtZbuZw0lhrLj/E8.k/el1qacT2xmv8lJ.Q85xjzseXS1JFy', NULL, '0723870697', NULL, NULL, 2, NULL, '2024-06-23 17:06:14', '2024-06-24 03:42:25', NULL),
(247, 'Precious Maina', 'preciousmaina930@gmail.com', '2024-06-23 17:09:24', '$2y$10$YhX0muqdT.m4atXynqWiheFYWjnH0t3N7LwbeGjYYJKRfDf4YXKSq', NULL, '+254713167414', NULL, NULL, 2, NULL, '2024-06-23 17:07:14', '2024-06-24 03:42:22', NULL),
(248, 'Jane Njeri Kamau', 'jnmwamburi@gmail.com', '2024-06-23 17:10:42', '$2y$10$n7MruCc9ZoSsW0gz8Dm74.b1PIo16sFlASD36cKfahd36b.RPUwuu', NULL, '0722620438', NULL, NULL, 2, NULL, '2024-06-23 17:09:22', '2024-06-24 03:42:20', NULL),
(249, 'Khamis Mahmoud', 'khamismhmd@gmail.com', NULL, '$2y$10$0wtOLr3WCE1sm7WBye7stOnXY1wYpf24M.05IjNlPMRmsNnksMsXa', NULL, '0712172006', NULL, NULL, 2, NULL, '2024-06-23 22:56:31', '2024-06-24 03:42:18', NULL),
(250, 'Elvis Bando', 'elvis@nobuk.africa', NULL, '$2y$10$9WGTp2T7TEpFEuNPkxesOOH75JsbopMctl6SMGh4v.09Sevoc4cB.', NULL, '+254729874366', NULL, NULL, 2, NULL, '2024-06-24 00:36:31', '2024-06-24 03:42:16', NULL),
(251, 'jefe m', 'tinimanjohi3@gmail.com', NULL, '$2y$10$JgdRC2kTYJ9BveOAU4tmTOLh7i7FOPW3Mg0ZNQtCRYzRkWwRoB2/6', NULL, '0799740535', NULL, NULL, 2, NULL, '2024-06-24 01:11:02', '2024-06-24 03:42:12', NULL),
(252, 'leonard Munyaneza', 'leonardmunyaneza57@gmail.com', NULL, '$2y$10$JuqcPGNJF3aP4bAQ4EvVouK/57iIR7kKl40uA1VTvSE7Gi3HRQtei', NULL, '0743467700', NULL, NULL, 2, NULL, '2024-06-24 01:54:17', '2024-06-24 03:42:10', NULL),
(253, 'Vince partasio', 'partasiolemein@gmail.com', NULL, '$2y$10$g8xk88syPKilC4xukfp47O0ytqx5asKxo33KzBv5FCvUGOWB4XwBi', NULL, '0748003234', NULL, NULL, 2, NULL, '2024-06-24 02:21:51', '2024-06-24 03:42:08', NULL),
(254, 'Eric Gichobi', 'egichobi@gmail.com', NULL, '$2y$10$1wq9TLZWxfaOmeEBQkMUP.f/l8CC0P96WwXTV3i6nQsRUOTJ9MkYa', NULL, '0720432614', NULL, NULL, 2, NULL, '2024-06-24 02:26:17', '2024-06-24 03:42:04', NULL),
(255, 'Aristarichus Kuria', 'aristarichus@yahoo.com', '2024-06-24 03:33:01', '$2y$10$/7dbz8CCpgm.HtOgGM4ZeuyTLHvaZVv2/AfXpzyLS3p2bnoq/6wDu', NULL, '0721383123', NULL, NULL, 2, NULL, '2024-06-24 02:34:27', '2024-06-24 03:42:02', NULL),
(256, 'Bernard Kivava', 'bkivava@juhudikilimo.com', NULL, '$2y$10$6rSRlAxv/hNtCq2vfo4Rb.yE8MK48.EsiOLNkyM5jZWG1vujWqPmu', NULL, '0722628108', NULL, NULL, 2, NULL, '2024-06-24 02:50:32', '2024-06-24 03:41:59', NULL),
(257, 'Oyugi Samson', 'oyugisamson1@gmail.com', NULL, '$2y$10$uKdyooV5xr.ze/QofKqEDuI9iRMW5UAG1knMWHxQLPSowo/YyNNzy', NULL, '0714775278', NULL, NULL, 2, NULL, '2024-06-24 03:07:21', '2024-06-24 03:41:56', NULL),
(258, 'Kevin Mutiso', 'kevin.mutiso@gmail.com', NULL, '$2y$10$ZN5sNJF0ijDtv/kekOjs3OFgybM.p599w6Bnl2PHWuZnU6e0dL7PO', NULL, '0722576432', NULL, NULL, 2, NULL, '2024-06-24 03:17:11', '2024-06-24 03:41:54', NULL),
(259, 'Benjamin Kimosop Kendagor', 'bkimosop.bk@gmail.com', '2024-06-24 04:16:30', '$2y$10$cbiMD1w2i2noBmN1k4Xb/umVnSKvybdy/6DRbnaeG3uKUqIdj.ggK', NULL, '0720762401', NULL, NULL, 2, NULL, '2024-06-24 03:25:15', '2024-06-24 04:16:30', NULL),
(260, 'AMB. SARAH J.C SEREM, CBS', 'md@postbank.co.ke', NULL, '$2y$10$NacPVArhxX1Awl6Fp9vkp.AkwcKbxytl7CziTn4//nB1gqjIeDRWG', NULL, '0713053976', NULL, NULL, 2, NULL, '2024-06-24 03:28:09', '2024-06-24 03:41:49', NULL),
(261, 'jameson akuma', 'jamesonobaigwa@gmail.com', NULL, '$2y$10$sBUVSBaepJhzXrLMlOFuoeSTb29Baxn1cGdb.wVKG3jRZ/KyX0n7y', NULL, '0711295913', NULL, NULL, 2, NULL, '2024-06-24 03:33:48', '2024-06-24 03:41:47', NULL),
(262, 'KENNEDY KIMANZI MUKITI', 'kennedykimanzi015@gmail.com', NULL, '$2y$10$RVYxbQuxs03PCO11GAEpeu/qr4iuFgRlPORQwpsa863AImtgYUH2S', NULL, '0718924213', NULL, NULL, 2, NULL, '2024-06-24 03:39:16', '2024-06-24 03:41:44', NULL),
(263, 'Wanjiku Karanja', 'wanjiku.karanja@fsdkenya.org', NULL, '$2y$10$NeAm7f8wJY.UGzzpk8wyZe.rFWMXXsNDTnKkH2gpLNPCh1q9Je1LC', NULL, '0720766143', NULL, NULL, 2, NULL, '2024-06-24 03:39:29', '2024-06-24 03:45:16', NULL),
(264, 'Antoine Griveaud', 'antoine@juakali.io', '2024-06-24 04:21:32', '$2y$10$xH3B.bfU/XQ6e3UWDwNLOuAg7HCd4smLu/ntRvWQLsUjMeEKscV4y', NULL, '+33769850511', NULL, NULL, 2, NULL, '2024-06-24 04:10:24', '2024-06-24 04:21:32', NULL),
(265, 'Nicaise TOSSOU', 'ntossou@globalpartnerships.org', '2024-06-24 04:24:14', '$2y$10$Y.L46Y2w.dGYW.zxkAVzYuwIGQotI/taVM7tMNcE7qDRgsDhxFony', NULL, '0703197576', NULL, NULL, 0, NULL, '2024-06-24 04:21:00', '2024-06-24 04:24:14', NULL),
(266, 'Ikechukwu Iheagwam', 'ikechukwuiheagwam@agusto.com', NULL, '$2y$10$GzIxn4pFVgXEzG4NYSeEYO0ZgnV7X.Upj5Z4X3ElyOcJP/RufrCOe', NULL, '+254793842397', NULL, NULL, 0, NULL, '2024-06-24 04:35:21', '2024-06-24 04:35:21', NULL),
(267, 'Chris Mwangi', 'chris.mwangi@sojitz.com', NULL, '$2y$10$OVcPAZCow.oaIv4O/n.wi.AgRct5E0bWb4bGQH9ZlQbd4NNc.d5ty', NULL, '0757465968', NULL, NULL, 0, NULL, '2024-06-24 04:36:25', '2024-06-24 04:36:25', NULL),
(268, 'Jimmy Nzivo', 'jimmynzivo@gmail.com', NULL, '$2y$10$sBwtuhmDSkZ46R3MDKEgeOW4IB.DHnR6Xhn5njAIU2s7Wx4vX4Fhi', NULL, '0725935981', NULL, NULL, 0, NULL, '2024-06-24 05:32:00', '2024-06-24 05:32:00', NULL),
(269, 'Kiarie Njoroge', 'fknjoroge@familybank.co.ke', NULL, '$2y$10$AMHtbumOJFl.QZkRvvkx3e3TWqYA90H0e9T0Uwehrd2T46PUW4hu2', NULL, '0720208340', NULL, NULL, 0, NULL, '2024-06-24 05:36:21', '2024-06-24 05:36:21', NULL),
(270, 'Jimmy Nzivo', 'jnzivo@situ.co.ke', NULL, '$2y$10$5qx43hKMMN.FG1OzecEpce73PLUDYRh9vN3H.Ye6oJD2spthx7AKa', NULL, '0111053870', NULL, NULL, 0, NULL, '2024-06-24 05:43:27', '2024-06-24 05:43:27', NULL),
(271, 'David Kamau', 'davidmkamau18@gmail.com', NULL, '$2y$10$nFrDN3MUZtuYE84bd2DOfucK7RGqOUnEQDc8bCIruBwV3cMe0q8V.', NULL, '+254701379432', NULL, NULL, 0, NULL, '2024-06-24 06:00:57', '2024-06-24 06:00:57', NULL),
(272, 'Dennis Ngigi', 'dennis@beem.africa', NULL, '$2y$10$a9p.CYvMlVuYAY8qh.KlJ.aocqMbRrx5UQJcuP6nkq0pOqiS0zrpa', NULL, '+254720122116', NULL, NULL, 0, NULL, '2024-06-24 06:32:14', '2024-06-24 06:32:14', NULL),
(273, 'Grace Karendi', 'grace.mwiti@modestycredit.co.ke', NULL, '$2y$10$xiBWlGsfsIto1mAaqqVocuikRZW414b67dbZyDk5zQyLaTBgKtdxa', NULL, '0708426388', NULL, NULL, 0, NULL, '2024-06-24 06:42:32', '2024-06-24 06:42:32', NULL),
(274, 'Jasper Gilo', 'gilojasper@yahoo.com', NULL, '$2y$10$MQNUa8LzPgkAJP6vr4ZnFOZbY32b/aPKGc8C7.kZra.bKHoFZlJd2', NULL, '0796912550', NULL, NULL, 0, NULL, '2024-06-24 06:43:46', '2024-06-24 06:43:46', NULL),
(275, 'Hilda Eboso', 'ebosohilda@gmail.com', NULL, '$2y$10$.edB3p9PJ83cV4srLvC0K.8OHGzCm.O6aoUkIVY.V7qpV2SbRFKka', NULL, '0723619765', NULL, NULL, 0, NULL, '2024-06-24 07:05:27', '2024-06-24 07:05:27', NULL),
(276, 'Paul Mwilu', 'Paul.Mwilu@heifer.org', NULL, '$2y$10$RgKmexHCtXdfn/VxYfGlDOu6o55WXb4p6aQvLYOgSl8M44w8vJ.XS', NULL, '0726902731', NULL, NULL, 0, NULL, '2024-06-24 07:07:17', '2024-06-24 07:07:17', NULL),
(277, 'Matthew Wanjiku', 'imattheaven@gmail.com', NULL, '$2y$10$wvCoJE9vLYZrJeD4mg9dvOa8J1nqtGgn/rsYeP.kPyCOkOQsCQg5S', NULL, '0799451453', NULL, NULL, 0, NULL, '2024-06-24 07:08:52', '2024-06-24 07:08:52', NULL),
(278, 'philip mokaya maonga', 'philipmokaya96@gmail.com', NULL, '$2y$10$mGM6KrbyOS2EXB1zvvhPj.k38lx4OaCLGy4jfdWRDSS8lVFbOjUL6', NULL, '0790247867', NULL, NULL, 0, NULL, '2024-06-24 07:13:53', '2024-06-24 07:13:53', NULL),
(279, 'Edwin Munene Thianyu', 'edwinthianyu@gmail.com', NULL, '$2y$10$rWDVFVa7qw9KZlx/aAH7JefmhQqvSITJJY94mfzXPl3XObqWFSoru', NULL, '0720622482', NULL, NULL, 0, NULL, '2024-06-24 07:25:28', '2024-06-24 07:25:28', NULL),
(280, 'PAUL KAGIRI', 'pkagiri@rafiki.co.ke', '2024-06-24 07:41:33', '$2y$10$EtoAHxMeVsfV3ierCXh4a.DfVfuT7qIQX..lPE.gBhsHiaxt99G2y', NULL, '0720334147', NULL, NULL, 0, NULL, '2024-06-24 07:27:17', '2024-06-24 07:41:33', NULL),
(281, 'Amos Onyango', 'amos.onyango@ngaoinsurance.co.ke', NULL, '$2y$10$r2nC6FbbRObQMCBIIoqo/ubLj4A7/KWVOwQiVhfzGiSsK2RSVSpuG', NULL, '0723906094', NULL, NULL, 0, NULL, '2024-06-24 07:41:26', '2024-06-24 07:41:26', NULL),
(282, 'Martha Musau', 'mmusau@apticcredit.com', NULL, '$2y$10$KO769gQe4jZpg49qjUXCKe2zUsTq2GrgRju2kb16rWJgCFQBNL4ry', NULL, '0720050370', NULL, NULL, 0, NULL, '2024-06-24 07:49:51', '2024-06-24 07:49:51', NULL),
(283, 'Angela Bwengi', 'angelab@inkomoko.com', NULL, '$2y$10$KhMODcOoZNyxrJWg.n7YFebcnLnoL2iySzKF5LvxplAeOXLam0w0q', NULL, '+254728109473', NULL, NULL, 0, NULL, '2024-06-24 08:04:41', '2024-06-24 08:04:41', NULL),
(284, 'Angela Bwengi', 'angelakmnt@gmail.com', NULL, '$2y$10$xwOLRDWdstC6AtsdOb5Y/uT4lr/o5MA/6EH9vbfcxF9jlzkLhayxC', NULL, '+254710684185', NULL, NULL, 0, NULL, '2024-06-24 08:05:31', '2024-06-24 08:05:31', NULL),
(285, 'Billy Osano Owino', 'billyo@nimblekenya.co.ke', NULL, '$2y$10$Bladh2SlbZKj9gYlc30DQeKPLd3M6.hnIc14M4JlE6UhAgHgf6P0a', NULL, '0705155919', NULL, NULL, 0, NULL, '2024-06-24 08:08:59', '2024-06-24 08:08:59', NULL),
(286, 'Patrick KairuT', 'kairu@creditschoolmanagement.com', NULL, '$2y$10$R9/S.z6WcWWwqoJ2q1D/ne0fUZe2u2xf15vjIs6rRFiCA/dwrawK2', NULL, '0722712669', NULL, NULL, 0, NULL, '2024-06-24 08:16:39', '2024-06-24 08:16:39', NULL),
(287, 'felix Muriithi', 'felixmuriithi14@gmail.com', NULL, '$2y$10$upsQ7lOdy4bVSeYVHSxf5.SK9Nvn62vmivrDcwmcuxN6CV0dP15Oi', NULL, '0706604257', NULL, NULL, 0, 'hHsQF3Uue0yhFelyHPeOWi0R7HZwAAcCjbuCQQP4EwzDf4thH2SnfP8ScmjQ', '2024-06-24 08:36:21', '2024-06-30 16:46:00', NULL),
(288, 'Rhea Kanaya', 'rhea@klaygroup.com', '2024-06-24 08:46:03', '$2y$10$q1wIoiIOCGLlGrAHI.lVoe59QyoyEXIxfJkL7O/hQZK2pEOdUwibO', NULL, '971586782434', NULL, NULL, 0, NULL, '2024-06-24 08:42:12', '2024-06-24 08:46:03', NULL),
(289, 'Cynthia Kasiera', 'kasieracynthia@gmail.com', NULL, '$2y$10$bseeGiVpHA4lXE4UYviQoeEvhxdC7lPlPBHiyvnEIvq/l/G2M2KIC', NULL, '0715460455', NULL, NULL, 0, NULL, '2024-06-24 09:10:35', '2024-06-24 09:10:35', NULL),
(290, 'Rahab Ndegwa', 'rahab.ndegwa@equitybank.co.ke', NULL, '$2y$10$b2NF9mnXji0S6seP4KNTWubFHuHVZanJ3OuNO08p29Y4c0G4ON5Qy', NULL, '0763749520', NULL, NULL, 0, NULL, '2024-06-24 09:18:00', '2024-06-24 09:18:00', NULL),
(291, 'Kahuro Mary Wangechi', 'Mkahuro@gfedha.co.ke', '2024-06-24 09:42:54', '$2y$10$F4NT11SuMDf.7M2cNN1rdut935uzG0UGtch8FBkxM2xQ9KJQQDNeq', NULL, '0722739654', NULL, NULL, 0, NULL, '2024-06-24 09:20:32', '2024-06-24 09:42:54', NULL),
(292, 'Privanus Katinhila', 'privaserena@gmail.com', NULL, '$2y$10$UILqc4iSuILRYA4RcDl5EOE.lUwl2RwfYQ8LgRnF/YA7atnMxZTN2', NULL, '0789646064', NULL, NULL, 0, NULL, '2024-06-24 09:21:39', '2024-06-24 09:21:39', NULL),
(293, 'Marie Claire Munyana', 'marieM@inkomoko.com', '2024-06-24 09:25:00', '$2y$10$Shmp0hpjvKm6Bnctc2GERuj2FXImjbmSpgkYYoqQ7A1nLp0mgmzZe', NULL, '+254707217759', NULL, NULL, 0, NULL, '2024-06-24 09:23:10', '2024-06-24 09:25:00', NULL),
(294, 'Farouk Ibrahim', 'ibrahim12farouk@gmail.com', NULL, '$2y$10$4DjJX4S1HDPoHslMcCo.7evhwx3fQAVkDjlTBj8Bz9lTT4J/FJLuy', NULL, '0714002311', NULL, NULL, 0, NULL, '2024-06-24 09:34:41', '2024-06-24 09:34:41', NULL),
(295, 'peter ndagara', 'peter.ndagara@equitybank.co.ke', NULL, '$2y$10$jWMaAuxYjZQF5HLjbR5iguj6xZ.Id07E1YMc7meK/bFcI/7h8C94i', NULL, '0763532154', NULL, NULL, 0, NULL, '2024-06-24 09:41:20', '2024-06-24 09:41:20', NULL),
(296, 'Collins Owiti', 'cowiti@water.org', NULL, '$2y$10$JpapTjJT2ENWwo7dvHfVx.9FoMsUZQpbuy5GFbklVHCv4jJWLZfo2', NULL, '0720797608', NULL, NULL, 0, NULL, '2024-06-24 10:29:30', '2024-06-24 10:29:30', NULL),
(297, 'Alberto Rodriguez', 'arodriguez@globalpartnerships.org', '2024-06-25 02:36:19', '$2y$10$9PnGtg0fmnQIYHEmGflph.mpzN0isEQNJIA5gLcnkIKNt1YRH/xDq', NULL, '0705593189', NULL, NULL, 0, NULL, '2024-06-24 11:22:54', '2024-06-25 02:36:19', NULL),
(298, 'Esther Mwende', 'estherpatrick44@gmail.com', NULL, '$2y$10$AcW17Xbwicq8wWLlVeWv2e5Ekn/9.J/es3Eh32UBvI.lmRnbZEzue', NULL, '0721994166', NULL, NULL, 0, NULL, '2024-06-24 13:15:04', '2024-06-24 13:15:04', NULL),
(299, 'Kayanja Julius Mawejje', 'kayanjajmawejje@yahoo.com', NULL, '$2y$10$z0WBRld7U2KOPhUz3mcM9OgTfd76Q805T8xQVaZIuOpygUUMNVh4a', NULL, '+256753205160', NULL, NULL, 0, NULL, '2024-06-24 13:28:18', '2024-06-24 13:28:18', NULL),
(300, 'Vandana Thottoli', 'vthottoli@snv.org', '2024-06-24 14:28:57', '$2y$10$84pFLDQK9.NOQsQDid.35e9W55QZ5EGnQTGQdeOMFp4awdfNEvH9a', NULL, '0731043443', NULL, NULL, 0, NULL, '2024-06-24 14:23:54', '2024-06-24 14:28:57', NULL),
(301, 'NGIGI NJOKI, HSC', 'bonifacengigi1@gmail.com', NULL, '$2y$10$wOiRZevZJFL95o7UeRtVP.n31PtY7L7UheMxzHavxyqXehnjvOz5a', NULL, '707562091', NULL, NULL, 0, NULL, '2024-06-24 15:41:15', '2024-06-24 15:41:15', NULL),
(302, 'Brian Njama Wachira', 'njamawachira@gmail.com', NULL, '$2y$10$.GqvcADi3QbXE5iMWCyYYe0ibJDaVbUqj0GuIXOInftSH91H.8JkG', NULL, '0708358309', NULL, NULL, 0, NULL, '2024-06-24 15:53:49', '2024-06-24 15:53:49', NULL),
(303, 'CLIVE MOKONO OMURWA', 'CLIVEOMURWA@GMAIL.COM', NULL, '$2y$10$quaZsMtNbcsTRCYtwfnRneuci6n8zAGsl.qVHLBi98U64kza9BqVK', NULL, '+254727542701', NULL, NULL, 0, NULL, '2024-06-24 16:08:49', '2024-06-24 16:08:49', NULL),
(304, 'Nyanaro Obare', 'nehemiahobash@gmail.com', NULL, '$2y$10$Vs8OFX9LBz85Ag8Df6ZwiO70BfSRjNU8eXt5S8NmZLl2XqQmfpteO', NULL, '0757259648', NULL, NULL, 0, NULL, '2024-06-24 16:11:42', '2024-06-24 16:11:42', NULL),
(305, 'George maina', 'mainageorge432@gmail.com', NULL, '$2y$10$PVlc.7JR/BslKliQEWD6peDEIuRQZ06OgoBB4lfxYVTP0xHS9ujMy', NULL, '0777683608', NULL, NULL, 0, NULL, '2024-06-24 16:18:33', '2024-06-24 16:18:33', NULL),
(306, 'Mukhongo Lalety', 'plalety@balozisacco.com', NULL, '$2y$10$JO2ObHrG4Ab96eDs4MqafeEWINfxe9UDMc38d38zzaew2YXBbyg2W', NULL, '0720331437', NULL, NULL, 0, NULL, '2024-06-24 16:19:45', '2024-06-24 16:19:45', NULL),
(307, 'Francis Kamundia', 'franciskamundia.w@gmail.com', NULL, '$2y$10$f.W6sfILgQ1CmGxbNoZk4e0nY4MtR8e54FvJ5HpaVqZx2EIGahPSi', NULL, '0726977415', NULL, NULL, 0, NULL, '2024-06-24 16:25:04', '2024-06-24 16:25:04', NULL),
(308, 'Reginah Wangui Ngahu', 'wanguimulika@gmail.com', NULL, '$2y$10$XjeCeVC7kL/7.RoAr7pfcuXLahZiroePl60OcMZDYqLYuLjW4zv/C', NULL, '0721401994', NULL, NULL, 0, NULL, '2024-06-24 16:32:35', '2024-06-24 16:32:35', NULL),
(309, 'Dickens Odera', 'dickens@ajirapay.finance', '2024-06-24 16:46:45', '$2y$10$Oib370mkwzbwUEc/aVAijevhyaVNA8SRSr.ZdpYSHz744M6QlqFzi', NULL, '+254799428820', NULL, NULL, 0, NULL, '2024-06-24 16:38:10', '2024-06-24 16:46:45', NULL),
(310, 'Qassim mohamed', 'noorqassim38@gmail.com', NULL, '$2y$10$4dtP/fAqJyO0Hlg82xe5Nurq920Azdta3aZqNFsBTfq2whXXkit9S', NULL, '0707175901', NULL, NULL, 0, NULL, '2024-06-24 16:38:59', '2024-06-24 16:38:59', NULL),
(311, 'lieselottehurtad', 'gemudeben1987@morozfs.store', NULL, '$2y$10$KbrCWWzdszSOWG7ilQMPzObp9PaaBCYuF.1emG3aOE8jRrcDfMc2e', NULL, '5058547586', NULL, NULL, 0, NULL, '2024-06-24 16:42:57', '2024-06-24 16:42:57', NULL),
(312, 'John Wakabira', 'wakabiraj@aua.ac.ke', NULL, '$2y$10$UH7GMAwGrFOMu6ofkBkycenvMp.8HlM4kMezCBXrX00Vb7WdixA1i', NULL, '0723151457', NULL, NULL, 0, NULL, '2024-06-24 17:10:11', '2024-06-24 17:10:11', NULL),
(313, 'Stephen Jamwa', 'jamwastephen@gmail.com', NULL, '$2y$10$Jj0JD/mwkaedQMlsL2zNsulRVgw8jNMpbIZLIzMJtrkhmwhxOq/oy', NULL, '+254722292399', NULL, NULL, 0, NULL, '2024-06-24 17:28:25', '2024-06-24 17:28:25', NULL),
(314, 'Suada sheikh', 'swaymumtazsheikh@gmail.com', '2024-06-24 18:00:07', '$2y$10$bBS7P7cDWZhco.Dqc42YDutz3h7AyIp4xC6nVIzcv1vS0jblptJzy', NULL, '0722275161', NULL, NULL, 0, NULL, '2024-06-24 17:57:29', '2024-06-24 18:00:07', NULL),
(315, 'Rodger Ssebutinde', 'sserodger@gmail.com', '2024-06-24 18:38:30', '$2y$10$LTFUF4FnT1AEf8DHCU1dkejF4XeiOuQjv5Sr06eY5oJ.Rdu.N2VSC', NULL, '+256779666086', NULL, NULL, 0, NULL, '2024-06-24 18:37:28', '2024-06-24 18:38:30', NULL),
(316, 'Charles', 'ngaridmajor001@gmail.com', NULL, '$2y$10$9lXyoel/mRECgdp.LMvc7O.2ZtveAMCK5nhedRGSgB.Nh6RuP2wKK', NULL, '0722711563', NULL, NULL, 0, NULL, '2024-06-24 18:57:05', '2024-06-24 18:57:05', NULL),
(317, 'Jayson Ashioya', 'jayson.ashioya@outlook.com', NULL, '$2y$10$2WHYQ/15B0Ao2K089Uj1jOdiA5ohtN3sgwdYUAadyaYayvacT7Uc6', NULL, '0104892070', NULL, NULL, 0, NULL, '2024-06-24 19:03:41', '2024-06-24 19:03:41', NULL),
(318, 'CHRISANT OTHOO SCHECKER', 'chrisantothoo@gmail.com', NULL, '$2y$10$eMA7vXDc6Jd8fjzkdRwUme2ezTykW7uowoNMRZWHXWVW6wNWvk7eK', NULL, '0729327263', NULL, NULL, 0, NULL, '2024-06-25 01:05:28', '2024-06-25 01:05:28', NULL),
(319, 'Eric Anyona Nyambati', 'erick.nyambati@bayes.co.ke', '2024-06-25 01:22:07', '$2y$10$jgo3b72AJBdJyRlRsBd3Ue150/YhLEnRwm.bmQCRSFKTYWmtVwxdm', NULL, '0726616285', NULL, NULL, 0, NULL, '2024-06-25 01:18:43', '2024-06-25 01:22:07', NULL),
(320, 'Cynthia Kipruto', 'Kiprutocynthia@gmail.com', '2024-06-25 02:18:53', '$2y$10$qwXec76yjulU9VJ7Fc6Xle6taXvk1nG1Or0TyQON3OqqTVJsItSWK', NULL, '+254795552103', NULL, NULL, 0, NULL, '2024-06-25 02:11:58', '2024-06-25 02:18:53', NULL),
(321, 'Abdullahi Abdikadir', 'abdullahiabdikadir160@gmail.com', NULL, '$2y$10$2h0mcHR8PprMZo7O3TJl4urNN8u/M1TeVq4wbcdY4NaV9UN0VJn4y', NULL, '0728165099', NULL, NULL, 0, NULL, '2024-06-25 02:12:30', '2024-06-25 02:12:30', NULL),
(322, 'BONAVENTURE ODERO', 'ootieno579@gmail.com', NULL, '$2y$10$Jkgwh7GIRQqknZWfZ9ZK9eWTnqcg3uNtYJcY0tURbU9WQqciAVury', NULL, '0758863022', NULL, NULL, 0, NULL, '2024-06-25 02:16:34', '2024-06-25 02:16:34', NULL),
(323, 'Oscar Bosco Wanjala', 'bossccoh@gmail.com', NULL, '$2y$10$tQShBhKCh4rYvxKIFPx5BuiFTrLekJ79z.o3U1uTak07l6DnQFLyK', NULL, '0753162000', NULL, NULL, 0, NULL, '2024-06-25 02:38:42', '2024-06-25 02:38:42', NULL),
(324, 'Dennis kipkoech Langat', 'dennislangat628@gmail.com', NULL, '$2y$10$8cK1yBQimkUfbPF2NLCSqe0wpl5hvBcp1s2.974ut8z52kK8QNGs6', NULL, '0768201035', NULL, NULL, 0, NULL, '2024-06-25 02:58:30', '2024-06-25 02:58:30', NULL),
(325, 'Godwin Nick Wafula', 'funyula80@gmail.com', NULL, '$2y$10$8E2f/Edn1ib1psODCp1xV.pyRPTv5lrsTDhwfLfo0YIZcO9ZJXjxS', NULL, '0721757419', NULL, NULL, 0, NULL, '2024-06-25 03:13:52', '2024-06-25 03:13:52', NULL),
(326, 'Namshon ombui', 'namsonombui@gmail.com', '2024-06-25 03:20:55', '$2y$10$wDptfpdOYuezx5J2cQtHaO.g3WLUcnxPMXMoVQPtIPXDbCuzqnB4a', NULL, '0115306839', NULL, NULL, 0, NULL, '2024-06-25 03:20:24', '2024-06-25 03:20:55', NULL),
(327, 'Elias Gichuru', 'eliastenny1@gmail.com', NULL, '$2y$10$N5rezt24ZO7Nr0hwEZDo0OOa0lVwTU3jgGNPhBaV9AnNUX5pbGhba', NULL, '0707643447', NULL, NULL, 0, NULL, '2024-06-25 03:20:31', '2024-06-25 03:20:31', NULL),
(328, 'Herald Aloo', 'heraldaloo14@gmail.com', NULL, '$2y$10$dqzx3riY6.DvDsG24bitX.u6uisepYpu/zD7m4HzXuD7h4vkLqUD2', NULL, '0729542451', NULL, NULL, 0, NULL, '2024-06-25 03:20:45', '2024-06-25 03:20:45', NULL),
(329, 'Dorothy', 'dosoi88@yahoo.com', NULL, '$2y$10$yMWW4bgMzwDhzqCmeY/RbuWM1JxLcKD6NFl6I2ysEMZ/oGj5SO.QS', NULL, '0713984466', NULL, NULL, 0, NULL, '2024-06-25 03:25:19', '2024-06-25 03:25:19', NULL),
(330, 'Daniel Muhia', 'dmuhia@mgkconsult.co.ke', NULL, '$2y$10$Xzqz54ebjQuYylkTLMcd6.YeRRmGwG4woHWLJQQEn9JCCqXhZmTdq', NULL, '+254722875999', NULL, NULL, 0, NULL, '2024-06-25 03:28:23', '2024-06-25 03:28:23', NULL),
(331, 'JAMES MWORIA', 'JAMES.MWORIA@GMAIL.COM', NULL, '$2y$10$Ta0lIP12D4Fa8bIGoONNMugPqFFeTqVk8iTkxwMT98f0KoUvGgIba', NULL, '0721815466', NULL, NULL, 0, NULL, '2024-06-25 03:37:46', '2024-06-25 03:37:46', NULL),
(332, 'Desmond Chebon', 'desmond@celcomafrica.com', NULL, '$2y$10$aY8RcOeqLIQ/OFJ2eM7WZO1ZjeVMNg6xTDeNigYJyt62PD6WgXyNO', NULL, '0724363325', NULL, NULL, 0, NULL, '2024-06-25 03:47:25', '2024-06-25 03:47:25', NULL),
(333, 'Clifford Omondi', 'cliffordalois002@gmail.com', NULL, '$2y$10$1UYv/gT.QIDvL4fE5ToOIu8.mK9JHEnyvY1v6MEU.6ixkt3s.f0h6', NULL, '0768464084', NULL, NULL, 0, NULL, '2024-06-25 04:32:29', '2024-06-25 04:32:29', NULL),
(334, 'Clifford Omondi', 'reignomondi@gmail.com', NULL, '$2y$10$zZa4dK1MfotJNnJ85r/TX.PLv6l6iRL1Gw82khIXDRnlkTb7PKDB.', NULL, '0706810407', NULL, NULL, 0, NULL, '2024-06-25 04:33:56', '2024-06-25 04:33:56', NULL),
(335, 'Brian Odhiambo', 'ochiengbrayo99@gmail.com', NULL, '$2y$10$2pPgMDLUQcD9OFQs8NlXmOckRQ/nL80Y2Rl4hDmCVRBPxP61UxLgu', NULL, '+254743927535', NULL, NULL, 0, NULL, '2024-06-25 04:45:48', '2024-06-25 04:45:48', NULL),
(336, 'Mohamed Almas', 'pamukira@gmail.com', NULL, '$2y$10$G97tosNeKhftTVfx756.k.LYroyoG4idRQKz1WenUAjH1IVulrwca', NULL, '0700874709', NULL, NULL, 0, NULL, '2024-06-25 05:28:22', '2024-06-25 05:28:22', NULL),
(337, 'DR TSOFA MWENI', 'fmweni@gmail.com', NULL, '$2y$10$9yt8lFBM/mqrIowqSoLwdu0bKloVdP25Spil3JgwvZVSTEBZHyRWO', NULL, '+254722683151', NULL, NULL, 0, NULL, '2024-06-25 05:39:22', '2024-06-25 05:39:22', NULL),
(338, 'Charles Ngonzo', 'charles2006.ngonzo@gmail.com', NULL, '$2y$10$qpkUj7Pbs.a9fQbgupNS8OSyYIIzAVBola.hBBMN9PYfAJgPrB9/u', NULL, '0700388593', NULL, NULL, 0, NULL, '2024-06-25 05:48:39', '2024-06-25 05:48:39', NULL),
(339, 'SHARON NJUGUNA', 'sharon@dealogicafrica.com', NULL, '$2y$10$S/0Wcclg7qhdkVEtMf8BR./xOGX0VR7BGotb4eVmtK46nfL0F.Fvy', NULL, '0795007748', NULL, NULL, 0, NULL, '2024-06-25 08:14:22', '2024-06-25 08:14:22', NULL),
(340, 'CELESTINE ASILIGWA LIVUZA', 'celestinelivuza@gmail.com', NULL, '$2y$10$gOxMCVgJHiFX2qnox.Fbsuq70jcFVF0mwef8TPbQDOPGw6SX47y22', NULL, '0719284434', NULL, NULL, 0, NULL, '2024-06-25 16:59:07', '2024-06-25 16:59:07', NULL),
(341, 'kamigarrido9', 'aeriel@seoneo.biz', NULL, '$2y$10$rFmuRoOLN2W0nCwmA6xWtujSmO970Pr9Uw7sFs6Le.mKpZXGzwqke', NULL, '4528763', NULL, NULL, 0, NULL, '2024-06-25 21:14:25', '2024-06-25 21:14:25', NULL),
(342, 'Samuel Orondo', 'orondosam@gmail.com', NULL, '$2y$10$JywlkywgQB/XuO/Xf9zC9.JL8.J2eGkt2RrCVrCa06hg.mLrC4mGq', NULL, '0795338685', NULL, NULL, 0, NULL, '2024-06-25 21:59:51', '2024-06-25 21:59:51', NULL),
(343, 'Dr. James Mushori', 'jameskenya23@yahoo.com', NULL, '$2y$10$FPD5hDbgFcUNJOoG8phuVuaggL5O5LtBrFKBsb2DDG4hCneRuFC32', NULL, '0721397073', NULL, NULL, 0, NULL, '2024-06-26 00:13:11', '2024-06-26 00:13:11', NULL),
(344, 'JOSEPH WAMBUGU', 'jowellltd@gmail.com', NULL, '$2y$10$wnFys4/UYKAL533iZMO.tux.Iv9aIosEmgJ8Uw1ya54sus6/EI5d6', NULL, '0728867259', NULL, NULL, 0, NULL, '2024-06-26 04:42:00', '2024-06-26 04:42:00', NULL),
(345, 'Felix Njagi', 'felixnjagi303@gmail.com', NULL, '$2y$10$sZ3afFPD5NmWrFxRpZjA3OhhjqCBlRR6nhUcsH7dbn49XhRkE9hIC', NULL, '0715603343', NULL, NULL, 0, NULL, '2024-06-26 11:23:29', '2024-06-26 11:23:29', NULL),
(346, 'Cliff Muthomi', 'cmuthomi48@gmail.com', NULL, '$2y$10$18RdXuU5442CLChXHzeIZOH88FWRCgSDwhx9SNho5kIMiJZjtM/2O', NULL, '0719673222', NULL, NULL, 0, NULL, '2024-06-26 11:23:46', '2024-06-26 11:23:46', NULL),
(347, 'William Kimari', 'solutions.wkconsulting@gmail.com', NULL, '$2y$10$Uo2NpcNJ92zqOB9uISvqUOY1qBrM1ID4lseBjSiY1lYoXkg5VICfq', NULL, '+254721424172', NULL, NULL, 0, NULL, '2024-06-26 11:28:15', '2024-06-26 11:28:15', NULL),
(348, 'Emma', 'Emma.Ouma@fao.org', NULL, '$2y$10$3IOnBRSTiNk3Han9hBEpTeVnqT6mXXuhNz.fEe2x8S2O0k5gkVxVK', NULL, '254743137859', NULL, NULL, 0, NULL, '2024-06-26 11:33:42', '2024-06-26 11:33:42', NULL),
(349, 'ADRIAN OMBASO', 'adrianombaso3@gmail.com', NULL, '$2y$10$6TnVPcoO2yX1Ypv5vIFhaOhmbl1uBLZ2cDNJTy8nk/BaaC.OZ.TV2', NULL, '0746827879', NULL, NULL, 0, NULL, '2024-06-26 13:35:42', '2024-06-26 13:35:42', NULL),
(350, 'hosea kandagor', 'hkandagor@gmail.com', '2024-06-26 15:07:53', '$2y$10$R8lTcnP/wWupotaXrTS09e4Jiq80QY5dE2ZhsVjGPuGgXETZJOXYO', NULL, '0720495628', NULL, NULL, 0, NULL, '2024-06-26 14:40:21', '2024-06-26 15:07:53', NULL),
(351, 'DAISY ILAVUSA NDEZWA', 'daisyilavusa72@gmail.com', NULL, '$2y$10$jK/qgn8.nYS9k.XyIFvcp.KjgBzE3.9LYgtCgYEcbVBsvLJ2nL/Ry', NULL, '0795470059', NULL, NULL, 0, NULL, '2024-06-26 18:11:28', '2024-06-26 18:11:28', NULL),
(352, 'GEOFFREY ODHIAMBO', 'odhiambogeoff98@gmail.com', NULL, '$2y$10$Oc.iVHlQOlWTrn873E1JeOOI4vAy.wLIT8JnhOEqDF5KansBZiXJy', NULL, '0798528570', NULL, NULL, 0, NULL, '2024-06-28 02:24:05', '2024-06-28 02:24:05', NULL),
(353, 'James Hokans', 'james@jiwambe.com', NULL, '$2y$10$.tvNwfVCx5W2qDOsWL7IHewpb8ELpTYAp74GJdfXPTREZLbW/RdF2', NULL, '0748724703', NULL, NULL, 0, NULL, '2024-06-30 15:59:38', '2024-06-30 15:59:38', NULL),
(354, 'dantemontero', 'charlietomholt4049@lingeriefashion.store', NULL, '$2y$10$xEtoJ53NT7kXmNEbcqXTYu6EdLWVeycVra5vANKcl9aBrZkMsC34S', NULL, '51118414', NULL, NULL, 0, NULL, '2024-07-03 04:06:10', '2024-07-03 04:06:10', NULL),
(355, 'Faith Kisambi', 'kisambifaith@gmail.com', NULL, '$2y$10$kMILLg2YuVCNOlFyk30jSehqnUkO.uOqERxGlTvcIOe8w1PSuMe6C', NULL, '0755181095', NULL, NULL, 0, NULL, '2024-07-03 15:45:28', '2024-07-03 15:45:28', NULL),
(356, 'PAULINE NJERI MURITHI', 'njeri.murithi@gmail.com', NULL, '$2y$10$OzT2mX.BrBW0sXtxe61cxOsWY8Oy92ECiakZJjjuR30dDIGyfPkvm', NULL, '+254723481499', NULL, NULL, 0, NULL, '2024-07-04 06:22:47', '2024-07-04 06:22:47', NULL),
(357, 'Charity Jepkosgei', 'jepkossycharity@gmail.com', NULL, '$2y$10$YWdpP/eGcSy9bNyd.SYxY.zn2oll9IdIPpERMrmhuoaafqVQudGIi', NULL, '0729759774', NULL, NULL, 0, NULL, '2024-07-07 02:35:10', '2024-07-07 02:35:10', NULL),
(358, 'Judy  Nyaga', 'kathoni.nyaga@outlook.com', NULL, '$2y$10$VHsWCxrSTXNiPDOVAmutqur/so/eFPX0SVVQaP/cNeUEtdW9QDnlu', NULL, '0715261122', NULL, NULL, 0, NULL, '2024-07-08 01:57:43', '2024-07-08 01:57:43', NULL),
(359, 'JANET KUTELI', 'Janetkuteli@fortunecredit.co.ke', NULL, '$2y$10$qDCP/L6hoCDe9uzlaJg4NeOS84RstUnKv7jgVXZTuJMdK43gLbObq', NULL, '0722982474', NULL, NULL, 0, NULL, '2024-07-10 05:00:41', '2024-07-10 05:00:41', NULL),
(360, 'RAMEEZ RAJA', 'rameez.raja2835@gmail.com', NULL, '$2y$10$Bgxc3aPBq2NOMrbtOp3jOOKQAKsTeKroF8txj.I0sj1ee9cyMh3e2', NULL, '+917520217120', NULL, NULL, 0, NULL, '2024-07-10 09:07:26', '2024-07-10 09:07:26', NULL),
(361, 'Julius Mutie Mutua', 'julius.mutua.kiilu@gmail.com', NULL, '$2y$10$tpWbRtMww7pFmxqJONXdAe6LaAqAHuxmzU4aCYqbm9IaoKzHOSyxm', NULL, '0710692930', NULL, NULL, 0, NULL, '2024-07-11 06:20:13', '2024-07-11 06:20:13', NULL),
(362, 'NDIKURIYO Fiston-René', 'ndikufistonrene@gmail.com', NULL, '$2y$10$Wsd24ezSP2P3DVgvHLEHTO/NZUgKkZszbehTfy91o/16QB6SRNPMe', NULL, '25761633656', NULL, NULL, 0, NULL, '2024-07-15 06:12:48', '2024-07-15 06:12:48', NULL),
(363, 'Test Person today', 'test@gmail.com', NULL, '$2y$12$0wmqlkxZT1jInUgBPIfl/eqdCAIbSLfZBULCqUp/ClKjvFyAqScui', NULL, '072222222', NULL, NULL, 0, NULL, '2024-07-16 19:39:07', '2024-07-16 19:39:07', NULL),
(364, 'anguka nayo', 'nayo@mail.com', NULL, '$2y$12$FiiV7zkWBIhmU8c/xOr.muvX8szlfkT/7e6ALKOHNYnMdlSlD2pl2', NULL, '0723838394', NULL, NULL, 0, NULL, '2024-07-17 02:38:38', '2024-07-17 02:38:38', NULL),
(365, 'Christabel Gichobi', 'christabel.gichobi@dlight.com', NULL, '$2y$10$wyyVLgs8c19hhB2A7PpHE.TZ0uq42jsjokx2zWthJFtOqqz4FBxc2', NULL, '0727639098', NULL, NULL, 0, NULL, '2024-07-17 10:09:35', '2024-07-17 10:09:35', NULL),
(366, 'Esther', 'esther.kimani@consultant.busara.global', NULL, '$2y$10$zV9.ayTq1Y6k5gRttZFKJe.L1CQ66uoq93UCN/fCgSzC54KenjxAa', NULL, '254720264371', NULL, NULL, 0, NULL, '2024-07-19 07:16:40', '2024-07-19 07:16:40', NULL),
(367, 'Tiemtore Soayouba', 'sayoubatiemtore@yahoo.fr', NULL, '$2y$10$rV.stwR9Kro4Sfymr3SO1.MIpqCtQWJoP/6K0v33pSKP7UTwpIC7e', NULL, '0022654222633', NULL, NULL, 0, NULL, '2024-07-20 03:48:20', '2024-07-20 03:48:20', NULL),
(368, 'Sylvia Jebet', 'sylviaj.chepsiror@gmail.com', NULL, '$2y$10$c7075vqUhjF5mxYXQwV3zu9/ApYD/CQj3J63aw4yhG6NCQRI8nSj.', NULL, '726087698', NULL, NULL, 0, NULL, '2024-07-24 06:53:17', '2024-07-24 06:53:17', NULL),
(369, 'Daniel Kimenyi', 'danielkimenyi@yahoo.com', NULL, '$2y$10$TeXPAo0I5C1TFCZwVdrTVeL8jwVoHtC750s2IkMHwsJ2Cp0Gul03a', NULL, '0705236496', NULL, NULL, 0, NULL, '2024-07-26 03:53:19', '2024-07-26 03:53:19', NULL),
(370, 'Elizabeth Anyango', 'elizabeth.anyango@outlook.com', NULL, '$2y$10$cvzUiP4Oqhp6xOJC8x/3LuSiYCZJD0G.dESq7T8gRi0OzPbB/ikri', NULL, '0711591065', NULL, NULL, 0, NULL, '2024-07-26 10:20:28', '2024-07-26 10:20:28', NULL),
(371, 'Feisal Ndungu', 'faysalma160@gmail.com', NULL, '$2y$10$vD1vnHSya/vlJ83my.Vuw.LvkU6aaDSZeytmJsMrLxn6oW8msT/Ay', NULL, '0716423534', NULL, NULL, 0, NULL, '2024-07-27 16:19:24', '2024-07-27 16:19:24', NULL),
(372, 'Pamela Bundi', 'pkananu@gmail.com', '2024-07-29 06:05:26', '$2y$10$h43aLLANg.IPUqQ31VXFOOh1l4.BNGDj9s2pFpgcYBn/M58/2MhgG', NULL, '+254722350237', NULL, NULL, 0, 'wLfYJNx4UMuCQpfafz9oE4abEAmMbR9xZkeC4qwmNFXUjkVKxwszPHI4nwAF', '2024-07-29 06:02:48', '2024-07-29 06:05:26', NULL),
(373, 'Stanley Mutinda', 'mutindastanley@gmail.com', NULL, '$2y$10$XUJmK7y5Mxy2JHgNWnRpSOQZL/Jrl/f5FzVJMtx4d6yEZyFzXDd4S', NULL, '0726723633', NULL, NULL, 0, NULL, '2024-07-29 06:13:53', '2024-07-29 06:13:53', NULL),
(374, 'Kefa Nyakundi', 'kefan@mtaji.co', NULL, '$2y$10$SL7t8bnxAVZDtncKPdmJIuWROufHdOf03ZNkochbv.js7EQWpttdS', NULL, '+254727993327', NULL, NULL, 0, NULL, '2024-07-29 06:26:19', '2024-07-29 06:26:19', NULL),
(375, 'KALII ERIC MUTUMU', 'erickmutumu@gmail.com', NULL, '$2y$10$X91zOaoTs.E7s5FWzMZp2esw2xb5A0WuDb.11KO1NjMCBXk9IMcCy', NULL, '0757393878', NULL, NULL, 0, NULL, '2024-07-29 07:07:36', '2024-07-29 07:07:36', NULL),
(376, 'Laura Nicole Wanjiru', 'nicolelaura04@gmail.com', '2024-07-29 07:12:18', '$2y$10$6RYnhD2nIyecG0xYZmZJNe5Csbgo.T4YH.aOfKzyreoj5OqEfGt7q', NULL, '+254713685554', NULL, NULL, 0, NULL, '2024-07-29 07:11:22', '2024-07-29 07:12:18', NULL),
(377, 'Jim Oduor', 'jim@icg.co.ke', '2024-07-29 07:41:02', '$2y$10$wsKTE63PfIZ5IvIxNJZWAeBc9EMwFt7GlDWMXsaCpD2VighLVKgV.', NULL, '+254722298722', NULL, NULL, 0, NULL, '2024-07-29 07:12:52', '2024-07-29 07:41:02', NULL),
(378, 'Benjamin Chipinde', 'chipindebenjamin@gmail.com', NULL, '$2y$10$CKbtzp1g.g8O0zfvSy6PL.PgHGQuy4JPJWMLJlRc8UQ5MxitFJ7na', NULL, '0701093842', NULL, NULL, 0, NULL, '2024-07-29 07:13:42', '2024-07-29 07:13:42', NULL),
(379, 'Josephine makau', 'makaujosephine@yahoo.com', NULL, '$2y$10$73esnTILLkTXA4ODWSqCN.xKqE5OCFZmPdBx7EzDOOzEaCrp0xm6K', NULL, '0729969153', NULL, NULL, 0, NULL, '2024-07-29 07:17:15', '2024-07-29 07:17:15', NULL),
(380, 'Johnson Mboya', 'Johnsonmboya26@gmail.com', NULL, '$2y$10$XKgmJnXG2ejXeX.9B2Dt/O/uAEB/bBS3W5CjsTENAa452wOy5Bwd6', NULL, '0790645502', NULL, NULL, 0, NULL, '2024-07-29 07:26:08', '2024-07-29 07:26:08', NULL),
(381, 'Shirlyn Mugambi', 'shirlynmugambi@gmail.com', '2024-07-29 07:27:01', '$2y$10$GidJYaqUqxqYK3eYl1t3..ZxjQQF4Zs2ikm/5Ph71QMgAWbZmu/bK', NULL, '0757424112', NULL, NULL, 0, NULL, '2024-07-29 07:26:10', '2024-07-29 07:27:01', NULL),
(382, 'Gregory Isaac', 'hazardgreg035@gmail.com', NULL, '$2y$10$pXEqXxgxKRJkgV5IY0oKCOsQxOwveelWIzYMgOVI654y7eiJEvowa', NULL, '+254725772852', NULL, NULL, 0, NULL, '2024-07-29 07:40:02', '2024-07-29 07:40:02', NULL),
(383, 'josweph wangondu', 'joseph.wangondu@vaal.co.ke', '2024-07-29 08:13:44', '$2y$10$ddmsb4GpZBMxoOVwyXBXNemSwkaZeAN5dg6uS1H3KwWT2cNXKyfx6', NULL, '0780934665', NULL, NULL, 0, NULL, '2024-07-29 08:07:52', '2024-07-29 08:13:44', NULL),
(384, 'Mishley Otiende', 'mishleyotiende@gmail.com', NULL, '$2y$10$SrM4O7bur4HRj9R2PJUAHeWWVf9kz92l/MnNLNaEVUUoP4cSJbT.G', NULL, '+254746034370', NULL, NULL, 0, NULL, '2024-07-29 08:12:34', '2024-07-29 08:12:34', NULL),
(385, 'Elizabeth Mughoi Shamba', 'shambamghoi@gmail.com', '2024-07-29 08:19:44', '$2y$10$1qopsb3AX1GjkA8i6nzIZ.6cPdyNiBLFquvF7VFHwzkOCl44QpkDS', NULL, '0114333641', NULL, NULL, 0, NULL, '2024-07-29 08:15:00', '2024-07-29 08:19:44', NULL),
(386, 'Amos Robert', 'amosmusyoka231@gmail.com', NULL, '$2y$10$RmtOr/vBcgVr9xWmz5aV1OABr6PiEj8qYqPOxWTbi82zrHbBEgbd.', NULL, '0746081189', NULL, NULL, 0, NULL, '2024-07-29 08:15:51', '2024-07-29 08:15:51', NULL),
(387, 'Beth Micah', 'beth@jambocapital.co.ke', NULL, '$2y$10$aH8N/uB/v4b.fTLXMI5.LuyOZfwKGKKwabM355OS7TZA004OikV1W', NULL, '0721384832', NULL, NULL, 0, NULL, '2024-07-29 08:32:12', '2024-07-29 08:32:12', NULL),
(388, 'Alexina Akinyi', 'alexinaochieng@gmail.com', NULL, '$2y$10$ezsgIj.8BtDLepU9/GzVA.2YT4aVE3QlvD6c9tmJmQWIfximcI0fC', NULL, '0715370726', NULL, NULL, 0, NULL, '2024-07-29 09:22:55', '2024-07-29 09:22:55', NULL),
(389, 'Kevin kegera', 'kevin@westernpay.io', NULL, '$2y$10$QUuwbVURAfWNoib1PXKg9udz4KvgWs.qlC9yFV1EJRM5Nn0H7Pol2', NULL, '0759077073', NULL, NULL, 0, NULL, '2024-07-29 09:26:05', '2024-07-29 09:26:05', NULL),
(390, 'Joy Ng\'endo', 'joyngendomuriuki@gmail.com', '2024-07-29 09:36:10', '$2y$10$ubYlASJNy3Nxh8Q2nmucheoTp8LuMEibS2oFLGilB/P80urpfmlZa', NULL, '0715760572', NULL, NULL, 0, NULL, '2024-07-29 09:29:03', '2024-07-29 09:36:10', NULL),
(391, 'Juliet Maina', 'julmaina@gmail.com', NULL, '$2y$10$cEXidxMA.syZL5hTObI97OC4uz9SBFtlslwbK8ESE.kMzPAeBITzy', NULL, '+254701103223', NULL, NULL, 0, NULL, '2024-07-29 09:57:26', '2024-07-29 09:57:26', NULL),
(392, 'Victor Macharia', 'victormacharia123@gmail.com', NULL, '$2y$10$7JBFvgX9vRtEqaKsQX9etuCxJYn/fTgFy0BqLp/n2c2QBx45L5PFq', NULL, '0786624874', NULL, NULL, 0, NULL, '2024-07-29 09:57:53', '2024-07-29 09:57:53', NULL),
(393, 'Titus Kwanusu Kilwake', 'tkwanusu@gmail.com', NULL, '$2y$10$/6FOvoh6drAHOYqm74tUiO8JMzlA4H.eUipX7IGMFQzG0drv/lUPS', NULL, '0729961495', NULL, NULL, 0, NULL, '2024-07-29 10:04:38', '2024-07-29 10:04:38', NULL),
(394, 'RAHAB WANJIRU', 'wanjiruryhab3@gmail.com', '2024-07-29 10:41:48', '$2y$10$MMlxXTorUjg5oe3fOM85Cuo/p7CERdTfXmmwZzFk7gkzX8TROaT0C', NULL, '0713382278', NULL, NULL, 0, NULL, '2024-07-29 10:08:08', '2024-07-29 10:41:48', NULL),
(395, 'Barlet Colly Jaji', 'refcon@rckkenya.org', '2024-07-29 11:09:19', '$2y$10$/Q9Wi/2xfgM3irZX57v1LezupUciGwkKm06jE32Khs..7.nKLCjaS', NULL, '+254723335656', NULL, NULL, 0, NULL, '2024-07-29 10:15:55', '2024-07-29 11:09:19', NULL),
(396, 'PETER KARISA Mwamburi', 'karypeters2018@gmail.com', NULL, '$2y$10$HY6jkSW7Pdn9k4vPcxxyoe0.yUgo8uCAPWugP9g0Sp5zpGRs7Mff2', NULL, '0743092414', NULL, NULL, 0, NULL, '2024-07-29 10:27:30', '2024-07-29 10:27:30', NULL),
(397, 'Japheth Musau', 'musaujapheth@gmail.com', NULL, '$2y$10$5C7G7pJEqXqaCXiSqExZR.ULXg3NpFgeXZOnT6bvGvW8FpnxbquDq', NULL, '+254722820025', NULL, NULL, 0, NULL, '2024-07-29 10:30:14', '2024-07-29 10:30:14', NULL),
(398, 'Stephen Opondo', 'stephen.opondo@outlook.com', NULL, '$2y$10$K2IruP9gK0mBOwpQmYh6a.2K4xm4on.WpmKcYTvk7QP3x9w5Kmjdu', NULL, '0711649997', NULL, NULL, 0, NULL, '2024-07-29 10:54:14', '2024-07-29 10:54:14', NULL),
(399, 'Isaac Mutiso', 'isaacmutiso12@gmail.com', NULL, '$2y$10$919pz8Y8NhtlLYZZ5v2.pu0Vy6IDJBFjI4t3t2akrbxz76GL0P0r.', NULL, '0726694418', NULL, NULL, 0, NULL, '2024-07-29 11:02:45', '2024-07-29 11:02:45', NULL),
(400, 'mercy njoroge', 'njorogemercyb@gmail.com', NULL, '$2y$10$SAu3Gh3bEnF0xP5i2zdC0ev9Yqj/txlnQU7aqJY/Gv6.MFiETD8IC', NULL, '0784858187', NULL, NULL, 0, NULL, '2024-07-29 11:36:07', '2024-07-29 11:36:07', NULL),
(401, 'Lindah Lucy', 'lindahlucy.3o@gmail.com', NULL, '$2y$10$Gk5urlJXOrFq.lTDXC/FSutAwjG4oAXnS0aKD9HF0Xr.MT9c7Irey', NULL, '0719254876', NULL, NULL, 0, NULL, '2024-07-29 11:51:10', '2024-07-29 11:51:10', NULL),
(402, 'Linda Makatiani', 'Linda@finance4families.com', NULL, '$2y$10$he4FhRgstY/tCl2xSh9KL.hq36OJU4PkrrCJKWGe7UK.lzWomYqcq', NULL, '0716435651', NULL, NULL, 0, NULL, '2024-07-29 15:18:42', '2024-07-29 15:18:42', NULL),
(403, 'ANNSTELLAH MAINA', 'annstellahwanjiru@gmail.com', '2024-07-30 01:24:26', '$2y$10$c9B.DakUvXAcgiqzySGirenNQM2iEPaOO65H9Q0HDJuCX6D1RTl8K', NULL, '0717731121', NULL, NULL, 0, NULL, '2024-07-30 01:23:22', '2024-07-30 01:24:26', NULL),
(404, 'Susan Awuor', 'skeziah003@gmail.com', '2024-09-10 04:56:41', '$2y$10$7gvuzdeLl2hQAso/y06pyOQtEd9TfYbtibn6iHQUH65sfBkXwA3Je', NULL, '0728552225', NULL, NULL, 0, 'GqyjD3ShbTNe8eJJ7QPCsA7N3zWe89JXhq44n54tpc6M1dwHlEvKjvxxerhP', '2024-07-30 01:25:29', '2024-09-10 04:56:41', NULL),
(405, 'Gillian Maigua', 'gillianmaigua@gmail.com', NULL, '$2y$10$80tJaEfk9bWSZQMKczevQ.2pkCbVNN0sYDCV2AjiL3AJ/b9uq/iyK', NULL, '0720057407', NULL, NULL, 0, NULL, '2024-07-30 01:40:29', '2024-07-30 01:40:29', NULL),
(406, 'Bodwin Etiang', 'semeetiang172@gmail.com', NULL, '$2y$10$pCxxt/Zm9V9XhXM4c4wOcOr0Dr2A8/1Ln3PcQH5DTt7i0s0bAA83u', NULL, '0711217126', NULL, NULL, 0, NULL, '2024-07-30 02:17:53', '2024-07-30 02:17:53', NULL),
(407, 'martin kirimi', 'kirimi@cradvocatesllp.com', NULL, '$2y$10$bSjfa/lVFpHujqwF3V3nq.NhlKfzitCVMO.FtoVUa7gvoZPLXZ1S2', NULL, '0792603759', NULL, NULL, 0, NULL, '2024-07-30 02:19:35', '2024-07-30 02:19:35', NULL),
(408, 'Sharon Limo', 'sharonlimo4@gmail.com', '2024-07-30 02:37:24', '$2y$10$hn6jvR2NS2BFyKj4wqsfaOM5xNoUvze8fTHigm6tPTlNLldGfBYHm', NULL, '0723396125', NULL, NULL, 0, NULL, '2024-07-30 02:35:29', '2024-07-30 02:37:24', NULL),
(409, 'CHRIS', 'chrismanyange1@gmail.com', NULL, '$2y$10$V.R1VcERCFDwyF1B7lHvv.OLOkAFdyEtjc11xYjJgiXesmDOJcv36', NULL, '0702556647', NULL, NULL, 0, NULL, '2024-07-30 03:15:59', '2024-07-30 03:15:59', NULL),
(410, 'Reslley Kerubo Oigara', 'oigarareslley@gmail.com', NULL, '$2y$10$eRg.X1LsKvmngmjt4W721ejo3B4xrkMFsfZQaGFCoOHUaO/xX4ITW', NULL, '0712676837', NULL, NULL, 0, NULL, '2024-07-30 03:25:09', '2024-07-30 03:25:09', NULL),
(411, 'Laura Odada', 'lauraodada@gmail.com', '2024-07-30 04:46:03', '$2y$10$qhEJSWiTht.ovghuOODzXuNv/qqDxD188sevf4th3dazB7wX.zQTO', NULL, '0716694106', NULL, NULL, 0, NULL, '2024-07-30 04:41:45', '2024-07-30 04:46:03', NULL),
(412, 'Peter  Gathathai Mwangi', 'petergathathai@gmail.com', NULL, '$2y$10$A8wOaqQ692rfZg8zBHPI/OUfIC2CklklS2AI9qwpw5P.okFWqeC42', NULL, '0729010587', NULL, NULL, 0, NULL, '2024-07-30 04:42:00', '2024-07-30 04:42:00', NULL),
(413, 'Anne Ombati', 'ombatianne@gmail.com', NULL, '$2y$10$mcL8OYoxJp0RX48EVyauE.JXI0JyjMJ4IHvk.KwwphA3uTKMiQhRO', NULL, '0717342121', NULL, NULL, 0, NULL, '2024-07-30 05:52:47', '2024-07-30 05:52:47', NULL),
(414, 'GRACE GACHOGU', 'gracegachogu30@gmail.com', '2024-08-24 15:53:41', '$2y$10$XB64xxgistuwPM3XMHoyr.w7FnQ5h5d7LjKWLj8gen/DI7PV0x7ye', NULL, '0794901526', NULL, NULL, 0, NULL, '2024-07-30 05:53:03', '2024-08-24 15:53:41', NULL),
(415, 'VINCENT UBELING', 'greenatmind7@gmail.com', '2024-07-30 06:01:16', '$2y$10$BgtqroBJH8q8efrqjPrzo.52.j.9nXfH9dL4z2Dehiudm9C5w/Acq', NULL, '0790828260', NULL, NULL, 0, NULL, '2024-07-30 05:59:06', '2024-07-30 06:01:16', NULL),
(416, 'Brenda Wambui Wanjiku', 'wanjikuofficialbrenda@gmail.com', NULL, '$2y$10$VZllXEo6IZd8wdxTB9/T7etaGqHvSSoUqrQrJdlydQdL90RsQCfi2', NULL, '+254742278668', NULL, NULL, 0, NULL, '2024-07-30 06:46:19', '2024-07-30 06:46:19', NULL),
(417, 'Anne Mwende', 'annemwende510@gmail.com', NULL, '$2y$10$vdsPxJ70kTwJzPm0CVZlqewyfXVEw7oU7x40fcytiOOSoycvJFUu2', NULL, '0707149997', NULL, NULL, 0, NULL, '2024-07-30 06:47:50', '2024-07-30 06:47:50', NULL),
(418, 'Ian Maina', 'iancharles38@gmail.com', NULL, '$2y$10$Z0IrYJeCTCuPkOsbdzt5pOHX64F.rb7m0RZFNqzYZA95hzL8VgpIa', NULL, '0714591366', NULL, NULL, 0, NULL, '2024-07-30 07:14:34', '2024-07-30 07:14:34', NULL),
(419, 'David Musau', 'davesau24@gmail.com', NULL, '$2y$10$aOtDhYETpefmBGSO/tvyCO2D.2pKRfyVJeoAKINOdRC8I/BRsiQ1G', NULL, '0711314273', NULL, NULL, 0, NULL, '2024-07-30 07:19:09', '2024-07-30 07:19:09', NULL),
(420, 'PATRICK MULWA MUSAU', 'patrick.musau+fincon@proton.me', NULL, '$2y$10$jmRadSlh98cUYDehHm56kek7tWQRmkjZlMluIOvT7elrNs/fNtW1K', NULL, '0706781214', NULL, NULL, 0, NULL, '2024-07-30 07:34:57', '2024-07-30 07:34:57', NULL),
(421, 'Esther Mawia Mwendwa', 'mwendwaesther5@gmail.com', NULL, '$2y$10$jpOQKJbd4fZ/HGwKy1qqkOpLaTNqdX1voBSwidecfluLy0dir721e', NULL, '0713834948', NULL, NULL, 0, NULL, '2024-07-30 07:36:54', '2024-07-30 07:36:54', NULL),
(422, 'Anne Buyanzi', 'info@atlasfiscalsolutions.com', NULL, '$2y$10$qK8pxmYZQe2CMxP7Wi/sOOj5WiL0jiVCgBLLBxut.B1G1iQwxP1wi', NULL, '0746190753', NULL, NULL, 0, NULL, '2024-07-30 07:38:24', '2024-07-30 07:38:24', NULL),
(423, 'Mercyline Chepkemoi Rotich', 'mercylinerotich50@yahoo.com', NULL, '$2y$10$V6.v17ZO/1.UjEQNiud.A.KaLxKHTGZEAxdPjONeGaHshkHTbwCBa', NULL, '0792510123', NULL, NULL, 0, NULL, '2024-07-30 07:39:08', '2024-07-30 07:39:08', NULL),
(424, 'Margaret Trinity', 'Magmarudi@gmail.com', NULL, '$2y$10$UIqJJEMzIS.ebu4JVP1pleZvkVUb6UQpvRaNJ0trRwrdJXzUCw4du', NULL, '0790003665', NULL, NULL, 0, NULL, '2024-07-30 07:47:31', '2024-07-30 07:47:31', NULL),
(425, 'Vinky', 'osorovinky12@gmail.com', NULL, '$2y$10$jk2OTjVCRDtzt0Av8UFSGOqzaxMj7fBbLpoOUZC.WDY3PSpuVJs32', NULL, '0712937525', NULL, NULL, 0, NULL, '2024-07-30 08:09:58', '2024-07-30 08:09:58', NULL),
(426, 'sidney Maleli', 'sidney.maleli@foresighttlc.co.ke', NULL, '$2y$10$JDuWmhT/LZ8.ASlCnjf52.lArzPaP.YvRxuWjU7ZT//4eQBM2qVum', NULL, '0739353681', NULL, NULL, 0, NULL, '2024-07-30 08:24:36', '2024-07-30 08:24:36', NULL),
(427, 'Daizy Maina', 'daizywairimu@gmail.com', '2024-07-30 09:21:14', '$2y$10$i53MfYsTVqF.MZwzLuOrM.2nomAY.l2n13X9aXvuc1HRjrAOr5wQm', NULL, '0798873774', NULL, NULL, 0, NULL, '2024-07-30 08:45:10', '2024-07-30 09:21:14', NULL),
(428, 'ADISU JEMAL', 'adjeismaul@gmail.com', '2024-07-30 10:41:53', '$2y$10$xbGot1FixMRvmv5OPlsn3u1rAQzkk8rtXjozjxMEjfxiZkx97mLmy', NULL, '+251911306545', NULL, NULL, 0, NULL, '2024-07-30 10:37:49', '2024-07-30 10:41:53', NULL),
(429, 'Pascaline Mulwa', 'pascaline.mulwa@gmail.com', NULL, '$2y$10$ZNYdcmee5ZEQ9zzoTVXiV.KqpT7GVQAeWJmxumBQEt4z8qC1UC9CC', NULL, '0759810964', NULL, NULL, 0, NULL, '2024-07-30 15:35:28', '2024-07-30 15:35:28', NULL),
(430, 'Amos Kimwetich Kiplagat', 'amkimkip002@gmail.com', NULL, '$2y$10$n1m69Mh2XwmWcXBkYFtnye2TK9M79NjlDE12CKsBy1OFupPTrKFcq', NULL, '0722832953', NULL, NULL, 0, NULL, '2024-07-30 17:33:40', '2024-07-30 17:33:40', NULL),
(431, 'Breath', 'breathwilton@gmail.com', NULL, '$2y$10$czA.6bwAbaku8NE0LhLfZeLuvYm0F4P6gQizgooZpjpNrDpl6tg4.', NULL, '0754632', NULL, NULL, 0, NULL, '2024-07-30 22:40:45', '2024-07-30 22:40:45', NULL),
(432, 'Hottensia mugure', 'hottensiamugure@gmail.com', NULL, '$2y$10$.JG4mAkob8hbx5eObPvdJeQHtWTMMbKumxntlzMGF280xyudsXWmK', NULL, '0701890511', NULL, NULL, 0, NULL, '2024-07-31 00:00:28', '2024-07-31 00:00:28', NULL),
(433, 'Lys', 'lys.m.ilunga@gmail.com', '2024-07-31 02:21:33', '$2y$10$2IDlfX3djtFgtcJEwvYz3uoHCr.Q60FBx5mJnn9FPXMRE/4GkbXee', NULL, '0728763290', NULL, NULL, 0, NULL, '2024-07-31 02:16:18', '2024-07-31 02:21:33', NULL),
(434, 'Faith Gathuku', 'nyawiragathuku4@gmail.com', NULL, '$2y$10$nKgBoF88AcqcORms5Aqzf.DQas3OsUoUXpLe1.d5vhV.ABrtqccmm', NULL, '0743088821', NULL, NULL, 0, NULL, '2024-07-31 02:38:56', '2024-07-31 02:38:56', NULL),
(435, 'Alice mwangi', 'alicewarigia313@gmail.com', '2024-07-31 03:02:52', '$2y$10$uteBhb1BYDqfXoT3cXZfI.m4Z17TbcbRr1a2qLihNHGLlosygf89a', NULL, '0790654050', NULL, NULL, 0, NULL, '2024-07-31 02:44:59', '2024-07-31 03:02:52', NULL),
(436, 'Sarah Matishoi', 'sarahmatishoi@gmail.com', '2024-07-31 03:05:02', '$2y$10$BXImMdbocAGDLKNjt/nXvOSCymL9ljMSQdXSQEGkOKy2xOABZa8JS', NULL, '0757444205', NULL, NULL, 0, NULL, '2024-07-31 03:01:23', '2024-07-31 03:05:02', NULL),
(437, 'Gladis Achieng', 'gladisachieng2021@gmail.com', NULL, '$2y$10$6P0rvqACV39hbo.6WBp5BO2YiZ71MUtAe9Hh95nLCYKqsfQzpyZGe', NULL, '0758611368', NULL, NULL, 0, NULL, '2024-07-31 03:02:26', '2024-07-31 03:02:26', NULL),
(438, 'Eric', 'emagale@acts-net.org', NULL, '$2y$10$ZFkiJ6sC5Wd3Su3OvdhWPuPFP3hI3hwhyxI8gKlrn1xmYR6prM.9C', NULL, '0721577295', NULL, NULL, 0, NULL, '2024-07-31 03:56:15', '2024-07-31 03:56:15', NULL),
(439, 'Khalfan Mgeituff', 'kmgeituff@gmail.com', NULL, '$2y$10$pMD3tj6N8TDmx7k9FDcI6.yMcJhINvqeDmlYepelcBagil2rt3AHm', NULL, '0702544111', NULL, NULL, 0, NULL, '2024-07-31 03:59:34', '2024-07-31 03:59:34', NULL),
(440, 'Khalfan Mgeituff', 'donkasam@yahoo.com', NULL, '$2y$10$ER9ZWSkyiqasz6ZtVHtjCeSwHxQwhXw9nCwPHaIosd0TpEHpzHnB6', NULL, '0788329670', NULL, NULL, 0, NULL, '2024-07-31 04:01:13', '2024-07-31 04:01:13', NULL),
(441, 'Lilian Muthithi', 'lisanteimiigu@gmail.com', '2024-07-31 04:11:21', '$2y$10$uQSgbV4ZwYG4M7YvVmHTROuaiydB6m9PK5WfzV3IkWOH2JkBJlgLO', NULL, '+254721700421', NULL, NULL, 0, NULL, '2024-07-31 04:07:39', '2024-07-31 04:11:21', NULL),
(442, 'Ridhwan Abdi', 'hassanridhwan393@gmail.com', NULL, '$2y$10$5Dhc2Q3OBpM0OKer3YLg9OAKLiURs9F.9SmxsCHT9U7PlNZYpTMXO', NULL, '0799209428', NULL, NULL, 0, NULL, '2024-07-31 04:37:49', '2024-07-31 04:37:49', NULL),
(443, 'Khadra Adan', 'khadraali015@gmail.com', NULL, '$2y$10$.9Ad5g/qWLg/cJPfy3QyuukVu0VQ06GWQyM5WO0HeT8/PYUrojotq', NULL, '0742165357', NULL, NULL, 0, NULL, '2024-07-31 04:45:58', '2024-07-31 04:45:58', NULL),
(444, 'Ann Murugi Njuguna', 'anniemurugie@gmail.com', NULL, '$2y$10$tKu228JbqFfpiZOzrrQmduquVD.4/AYOSQM1ejY8IOtINJ4mhUg9W', NULL, '0719388456', NULL, NULL, 0, NULL, '2024-07-31 04:54:30', '2024-07-31 04:54:30', NULL),
(445, 'Anne Wambui Mbugua', 'awambui.mbugua@gmail.com', NULL, '$2y$10$qBWjSJpOZgg9k1RNE10DEutnLUz1XY78ehzbG9Xcw.0JkFuGqQgQO', NULL, '+254704803482', NULL, NULL, 0, NULL, '2024-07-31 04:58:29', '2024-07-31 04:58:29', NULL),
(446, 'Sueann Mutio Muema', 'sueannmutio@gmail.com', NULL, '$2y$10$69nFOkWmrcAz0HCFIW3pduwoV/no53PoXHHNTWlD11DHxxCbAHHVC', NULL, '0726316159', NULL, NULL, 0, NULL, '2024-07-31 05:01:33', '2024-07-31 05:01:33', NULL),
(447, 'JUDITH NDUKU MUTUKU', 'ndukujudith2001@gmail.com', NULL, '$2y$10$p5cdzgpmzyt0g55awMsz9ekdP5BLbIZAV6sx0ev4r3VvXlYgues.K', NULL, '0799585860', NULL, NULL, 0, NULL, '2024-07-31 05:12:17', '2024-07-31 05:12:17', NULL),
(448, 'Fredrick Mutinda', 'fredrickmutiso9@gmail.com', '2024-07-31 05:14:20', '$2y$10$rd40aYgdvZ5yiodBUDXaZeFR/NG2lasWcIZnxGxVSqU2wShoGzIhe', NULL, '+254710806086', NULL, NULL, 0, NULL, '2024-07-31 05:12:22', '2024-07-31 05:14:20', NULL),
(449, 'Noah Kipkoech', 'noah.kipkoech@uthabitiafrica.org', NULL, '$2y$10$d7BLGYC.vFIFGaPc3I8AiulGtWXaq7qO4mINhUo7R13jxmKQWGdu6', NULL, '+254727563265', NULL, NULL, 0, NULL, '2024-07-31 05:31:24', '2024-07-31 05:31:24', NULL),
(450, 'Sylvia', 'oladijesupplies@gmail.com', '2024-07-31 05:42:04', '$2y$10$JMiVG7YIQmIJ8xwMZXDUm.GTeShNodTCiySYhvn7cmu67zcRT.QKu', NULL, '0717762570', NULL, NULL, 0, NULL, '2024-07-31 05:40:39', '2024-07-31 05:42:04', NULL),
(451, 'Enoch Omweri', 'enock.omweri@undp.org', NULL, '$2y$10$Y16OMRyp9w2BQ5nQQKBzYessRoEWTk8TEiIqlR/teEPU8adhN0pSi', NULL, '0722912172', NULL, NULL, 0, NULL, '2024-07-31 05:47:06', '2024-07-31 05:47:06', NULL),
(452, 'ESTHER NTHENYA', 'enthenya188@gmail.com', NULL, '$2y$10$nE/GvtNzv6lU2nsGfIhGru7n9.5p1ZUkDVYNuE92LmhdC7RT0FDt.', NULL, '0757679986', NULL, NULL, 0, NULL, '2024-07-31 05:53:56', '2024-07-31 05:53:56', NULL),
(453, 'Stanley Otieno', 'otienoomondi.law@gmail.com', NULL, '$2y$10$tzXLnywfQuC2s2gCi3gszO4aOFpvZ9u5iw9aRZdJ7eLUgIaz7bKjW', NULL, '0743161231', NULL, NULL, 0, NULL, '2024-07-31 05:58:39', '2024-07-31 05:58:39', NULL);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `gender`, `phone`, `profile_image`, `user_verified_at`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(454, 'Mike kimutai', 'mikekimtai11@gmail.com', '2024-07-31 06:05:56', '$2y$10$WrVD87EmzCkJk0aH0FtAc.BrzBuQfQ1yXO845rwjPjApkLapZv/ZW', NULL, '+254798103748', NULL, NULL, 0, NULL, '2024-07-31 05:59:26', '2024-07-31 06:05:56', NULL),
(455, 'Kibet Duncan', 'kotutduncan547@gmail.com', NULL, '$2y$10$FTcS38i9U1P53emylfUkNu7kAm5RxeMedN2n2p.xDPVdQsj.rtO9S', NULL, '0710111460', NULL, NULL, 0, NULL, '2024-07-31 06:13:30', '2024-07-31 06:13:30', NULL),
(456, 'Clinton Ochieng', 'clintonochieng643@gmail.com', '2024-07-31 08:43:50', '$2y$10$jNB7C0c1HnpcAOFgfCIciOqg4i6IZ/kRBhHh94A6xex1SMWqMAHIW', NULL, '0799630675', NULL, NULL, 0, NULL, '2024-07-31 06:16:42', '2024-07-31 08:43:50', NULL),
(457, 'Charles Muthui', 'cmuthui100@gmail.com', NULL, '$2y$10$PyHeaVzi7j6.7hds5MbZFeJv9VfdAJEU/ejP4ybcWA/E1w3quQf/y', NULL, '737873901', NULL, NULL, 0, NULL, '2024-07-31 07:24:39', '2024-07-31 07:24:39', NULL),
(458, 'Millicent Orenge', 'orengemaira001@gmail.com', NULL, '$2y$10$x2A52bxWfzqm21oRFEBjr.uVWfw4A6BkeFzv7cNtHPI16lMnUgCBu', NULL, '0713479999', NULL, NULL, 0, NULL, '2024-07-31 07:28:38', '2024-07-31 07:28:38', NULL),
(459, 'Ogutu Willis Odhiambo', 'oodhiambo@agra.org', '2024-07-31 07:39:27', '$2y$10$MEECRyKcPJniqy5DM.50necSfb/VbeJesb0fTUowg2i8pIhnxI8Lm', NULL, '+254728984442', NULL, NULL, 0, NULL, '2024-07-31 07:38:30', '2024-07-31 07:39:27', NULL),
(460, 'Shem Maina Ndegwa', 'shemmaina98@gmail.com', NULL, '$2y$10$b3mxx3pEutkEqU1zzKDSX.H.kd2rPPHpKoMXIhj.hM8Z0TUs8hd3a', NULL, '0741208540', NULL, NULL, 0, NULL, '2024-07-31 08:03:16', '2024-07-31 08:03:16', NULL),
(461, 'LAWRENCE MURIITHI', 'ACECADDESIGNS@GMAIL.COM', NULL, '$2y$10$9OjWdMNv2vaqk8P3.zMlAO.5JfO4NJbDpLXIfb36lGu3tf682wMIe', NULL, '0714593173', NULL, NULL, 0, NULL, '2024-07-31 09:12:56', '2024-07-31 09:12:56', NULL),
(462, 'Meshack Munyoroku', 'meshack.wachira@gmail.com', NULL, '$2y$10$6aO24q6jvU2.wYfHUHSD9eC/IyS9Lv3H8xFJkVMohtIaFu.v.v4hC', NULL, '0722535700', NULL, NULL, 0, NULL, '2024-07-31 09:26:55', '2024-07-31 09:26:55', NULL),
(463, 'John Njenga', 'njemajohn@gmail.com', NULL, '$2y$10$7pXhdKZ/ypCgy76/JFCNPOOrJ1UnSsiFY15.3.xCeMAoTy06eYNua', NULL, '0727303577', NULL, NULL, 0, NULL, '2024-07-31 09:32:43', '2024-07-31 09:32:43', NULL),
(464, 'Milka Mputhia', 'mputhiamilka@gmail.com', NULL, '$2y$10$j2AZhqo3kfOwXcRj1IyyjuTNyYw2VURHrN2E8EN1UQgZxqT65ehg6', NULL, '0705065432', NULL, NULL, 0, NULL, '2024-07-31 09:54:13', '2024-07-31 09:54:13', NULL),
(465, 'Margaret Wanjiru Mwangi', 'amargaret.b@gmail.com', NULL, '$2y$10$EKYKWi6Qz1WOQZZMD73B2evHpdOSR3Zda5RBDB2QqId2er9MwgwFC', NULL, '0717718869', NULL, NULL, 0, NULL, '2024-07-31 10:52:26', '2024-07-31 10:52:26', NULL),
(466, 'Faith Wangari Kinyanjui', 'kinyanjuifaith263@gmail.com', '2024-07-31 11:11:01', '$2y$10$Tf.gfptDjc6L3ldWNYbrVu9GvhwfByLqGK1hwO1v13/QdzhNzRM9G', NULL, '0792872696', NULL, NULL, 0, NULL, '2024-07-31 11:06:54', '2024-07-31 11:11:01', NULL),
(467, 'Ian Gichuhi', 'gichuhii4@gmail.com', NULL, '$2y$10$3lJYl.JwG3FHBQq4C3N97u4wbgf5vv/SVR/trrVEmS/X9.78lkKKK', NULL, '0703557402', NULL, NULL, 0, NULL, '2024-07-31 11:15:20', '2024-07-31 11:15:20', NULL),
(468, 'Teresiah Njeri Ngigi', 'ntessy66@yahoo.com', NULL, '$2y$10$3GtykxZy2NYWBT1znvXMneauMa/ixyaWPIIujvSyra3venqCpfeCK', NULL, '0725254688', NULL, NULL, 0, NULL, '2024-07-31 11:19:42', '2024-07-31 11:19:42', NULL),
(469, 'John K\'opiyo', 'kopiyoj2011@gmail.com', NULL, '$2y$10$2P2gNP.xeuvFETXxfp72FevSpBAB1.nntqvnd.d/xy1U9d00jEpf2', NULL, '0720348105', NULL, NULL, 0, NULL, '2024-07-31 13:04:10', '2024-07-31 13:04:10', NULL),
(470, 'CAROLINE MWENDE JAMES', 'caromwende676@gmail.com', NULL, '$2y$10$PgkX6cciYFKuSXIdRivCpOovYXPeESxV1TXiIoaCgqzTmhiR38yKq', NULL, '0741739462', NULL, NULL, 0, NULL, '2024-07-31 13:28:33', '2024-07-31 13:28:33', NULL),
(471, 'EMMANUEL WAFULA SIMIYU', 'emmanuelw988@gmail.com', NULL, '$2y$10$XqHfKTfBmRf5kBrHZx2u0.qH8zCcEWV3bp8Z603SE0UwAI0mr5/3m', NULL, '0714760986', NULL, NULL, 0, NULL, '2024-07-31 13:46:58', '2024-07-31 13:46:58', NULL),
(472, 'Gideon Mwangi', 'gideon@smartcode.co.ke', '2024-07-31 14:05:22', '$2y$10$ZlSIiHUP/PlXxZuzyX5eL.C5XDTSllPyhp47gQlTpt04q0g2/ynZi', NULL, '+25479040471', NULL, NULL, 0, NULL, '2024-07-31 14:04:38', '2024-07-31 14:05:22', NULL),
(473, 'JA Oguta', 'tappwaltd@gmail.com', '2024-07-31 14:51:43', '$2y$10$5zkbNffMtWjutQFI1GbWLesoQdw8J4/WLrabUpjl29N4fOXeUbGce', NULL, '0725625900', NULL, NULL, 0, NULL, '2024-07-31 14:40:16', '2024-07-31 14:51:43', NULL),
(474, 'Cavin Opiyo', 'Copiyo@strathmore.edu', NULL, '$2y$10$MPIjppTI0HJGA/kEO1DnDO64ZuQI0pFPD7Vb/I2vmwr596Hb2Hh.a', NULL, '+254738288150', NULL, NULL, 0, NULL, '2024-07-31 15:29:16', '2024-07-31 15:29:16', NULL),
(475, 'ANDREW ABONYO', 'andrewabonyo1@gmail.com', NULL, '$2y$10$2KMI/SnyLV.F1AciIRnO8e7LtsMqlKznJkPwW3eyLxnVzwn4balJi', NULL, '0707453454', NULL, NULL, 0, NULL, '2024-07-31 15:30:15', '2024-07-31 15:30:15', NULL),
(476, 'Virginiah Gitome', 'lemmik33@gmail.com', NULL, '$2y$10$cYv0jcVGP/PIRwBERvgFg.71n5.zOCQJZSE/LnXJ.4MFZXuBQVsde', NULL, '+254701163818', NULL, NULL, 0, NULL, '2024-07-31 15:40:30', '2024-07-31 15:40:30', NULL),
(477, 'Nancy Mutisya', 'mutisyanancy549@gmail.com', NULL, '$2y$10$OG1RAHKkeThzJxEWbeV5EOVmf7YP4KWZNuEAiBk0jZn7xPn2yb/B.', NULL, '0769541512', NULL, NULL, 0, NULL, '2024-07-31 15:47:13', '2024-07-31 15:47:13', NULL),
(478, 'Walter Barasa', 'barasamakokha@gmail.com', NULL, '$2y$10$DKcR3.jPObJQnwj6HBAjTerMxq.qb9.ckLiFRVXnqPmofG./YFACu', NULL, '0728933495', NULL, NULL, 0, NULL, '2024-07-31 15:57:16', '2024-07-31 15:57:16', NULL),
(479, 'Elizabeth Kimaru', 'ekimaru@spu.ac.ke', NULL, '$2y$10$kOptlS4sRdZdaT/vdUMoXeX6kIYz4UYGxgISwVYzqKZydYhzHihfC', NULL, '0720270573', NULL, NULL, 0, NULL, '2024-07-31 16:30:51', '2024-07-31 16:30:51', NULL),
(480, 'Elizabeth Kimaru', 'echema89@gmail.com', NULL, '$2y$10$MBOMIR20fPrYQQMjqndNfezt8qsNIaFeWhCYQZ1LQcOhF0zl7bPji', NULL, '0722314900', NULL, NULL, 0, NULL, '2024-07-31 16:37:36', '2024-07-31 16:37:36', NULL),
(481, 'Kudzai Mubaiwa', 'kudzi@investorsaint.co.zw', NULL, '$2y$10$Ekag3yKHwyREcSWiX/nIYOCOU4EzB7cnOmhIGv/dtUX6A8HFUmZie', NULL, '00263772526543', NULL, NULL, 0, NULL, '2024-07-31 21:06:45', '2024-07-31 21:06:45', NULL),
(482, 'Philemon Victor Odera', 'victorphilemon001@gmail.com', '2024-07-31 23:19:36', '$2y$10$Dt7MsYyvuo7RC4mD7gaEtelVECfq63iPWzN/GYO5FkdQVCHXUB8PG', NULL, '0741103341', NULL, NULL, 0, NULL, '2024-07-31 23:16:26', '2024-07-31 23:19:36', NULL),
(483, 'Development Dynamics', 'experience@dd.co.ke', NULL, '$2y$10$c7TdsX3niiUaEvUzWclUKuw8Rdq119yPdSIb4Esc7OLWlfkN8A99u', NULL, '+254101440883', NULL, NULL, 0, NULL, '2024-07-31 23:32:46', '2024-07-31 23:32:46', NULL),
(484, 'Tabitha Gitahi', '21799.2021@students.ku.ac.ke', NULL, '$2y$10$d5LLZBsIZB/Q5fHYMQjbleXlHPa8J9onVfvBWCGN7IfaM0poGNALm', NULL, '0712216292', NULL, NULL, 0, NULL, '2024-08-01 01:03:23', '2024-08-01 01:03:23', NULL),
(485, 'Faith  Mabera', 'fmabera@gmail.com', NULL, '$2y$10$EiMUaBiVbpkznqDcN5ZlQe1ZqqISxLqAk6HUU7SKdh5CZkSz2EpSS', NULL, '0713416022', NULL, NULL, 0, NULL, '2024-08-01 01:04:36', '2024-08-01 01:04:36', NULL),
(486, 'Edwin Michira Mokua', 'michira.edwin@gmail.com', NULL, '$2y$10$F8FGKTLRZKvLEayYIQf3UOw0NThxqmGwDyhZPF6/58OU8.VGqiqDK', NULL, '+254716895937', NULL, NULL, 0, NULL, '2024-08-01 02:16:49', '2024-08-01 02:16:49', NULL),
(487, 'Don Shamboks', 'dshamboks@gmail.com', NULL, '$2y$10$I5B3WVJka4luCa1woxlmhO4A./ZtbQ82RX/iSc0LHY8L/F2aXgTXG', NULL, '0759053997', NULL, NULL, 0, NULL, '2024-08-01 02:40:37', '2024-08-01 02:40:37', NULL),
(488, 'Gladys Njuguna', 'Marsharh76@gmail.com', '2024-08-01 02:59:00', '$2y$10$fVxznLUNRib7XYn4qN/Hhe3y6K61e/Oyo4b7Ol7jWA4cYd2LuNcl.', NULL, '0723159470', NULL, NULL, 0, NULL, '2024-08-01 02:55:13', '2024-08-01 02:59:00', NULL),
(489, 'Seth Kipsang Mutuba', 'mutubaseth@bbpsk.or.ke', NULL, '$2y$10$xm7wIq/KB9cAuxbB3p04guD4.wysXaCiN1E917tqZ3hhx7/P6d8c.', NULL, '0719729569', NULL, NULL, 0, NULL, '2024-08-01 03:33:46', '2024-08-01 03:33:46', NULL),
(490, 'Elizabeth Akinyi', 'akinyielizabeth88@gmail.com', NULL, '$2y$10$clNJD/mUgPb76lPGrq9XsuOgexrri9AvogdOrZql6oCqNFOvO/LAq', NULL, '+254716702580', NULL, NULL, 0, NULL, '2024-08-01 03:36:21', '2024-08-01 03:36:21', NULL),
(491, 'Kohl Wabuko', 'wabukokohl@gmail.com', NULL, '$2y$10$woQz1wAJxNeWXU55M8l6NOrryprCwjnsRdHWLF25yC/KnRt4s6IKO', NULL, '0703267775', NULL, NULL, 0, NULL, '2024-08-01 03:53:20', '2024-08-01 03:53:20', NULL),
(492, 'Tonny K. Mutai', 'yatormutai@gmail.com', NULL, '$2y$10$mBLYzwJkhJoNmGhhg4nwwOEvdkqgLRAtKHeoy4PfXgFVp8TFbKPV6', NULL, '0723424364', NULL, NULL, 0, NULL, '2024-08-01 04:53:43', '2024-08-01 04:53:43', NULL),
(493, 'Gilbert Apollo', 'oduorgilbert2003@gmail.com', NULL, '$2y$10$nxcvZCOhshE1EhfET/v1MusXUszbhCMtgkCfsZYFkJn5wDACwoK0.', NULL, '0112726107', NULL, NULL, 0, NULL, '2024-08-01 04:56:26', '2024-08-01 04:56:26', NULL),
(494, 'Pamela Munyoki', 'pammunyoki1@gmail.com', NULL, '$2y$10$WqFWXY5GXOHWHkFp43tZ4.1Ol7WJfwTNrRcRLuz9QL1ssaJ00GjfG', NULL, '0728440828', NULL, NULL, 0, NULL, '2024-08-01 04:56:28', '2024-08-01 04:56:28', NULL),
(495, 'Magdaline Karau', 'magdaline.karau@kutrrh.go.ke', NULL, '$2y$10$S7q7CjH0E2ZFiVZpMMrFdOigl0c9WUKpkvRAEu8MSRUq/P6aUvHmS', NULL, '0748104528', NULL, NULL, 0, NULL, '2024-08-01 05:16:17', '2024-08-01 05:16:17', NULL),
(496, 'BENJAMIN MUMO', 'benjaminmumomulatya@outlook.com', '2024-08-01 05:30:01', '$2y$10$ATaN0dl3nm7iP9TDc18AD.1ELVTDhMh45BS.Nvi3pl37RagSc4lE.', NULL, '+254757336113', NULL, NULL, 0, NULL, '2024-08-01 05:26:23', '2024-08-01 05:30:01', NULL),
(497, 'Alice Betty Angwech', 'alice.angwech@gmail.com', NULL, '$2y$10$0Uzplq9MDcNL2kVFIrAP0upHIEU1fFG9tHbmCGNY7m2CxqfS75Yf.', NULL, '+256784286740', NULL, NULL, 0, NULL, '2024-08-01 05:37:09', '2024-08-01 05:37:09', NULL),
(498, 'Fridah Gitau', 'fri.gitau@gmail.com', NULL, '$2y$10$Mf3AbVPXwQx18IadwEsF/.930.DIYF/h6mJVmPWG12jHB.PIYevSK', NULL, '+254707000930', NULL, NULL, 0, NULL, '2024-08-01 05:45:44', '2024-08-01 05:45:44', NULL),
(499, 'Fridah', 'fgitau@agrifrontier.com', NULL, '$2y$10$fkw/tTOnieIQKjNpFHH5AOzfZnDxn39S9wyXkQqPTndn0qYurIn0S', NULL, '0707000930', NULL, NULL, 0, NULL, '2024-08-01 05:51:27', '2024-08-01 05:51:27', NULL),
(500, 'Judith Biyaki', 'jdmarende@gmail.com', NULL, '$2y$10$L7cRmxp7tlVnJLfX/vlCiekviiciMFWuimVAvgX60Tw4as6cgOhtm', NULL, '0717503000', NULL, NULL, 0, NULL, '2024-08-01 05:54:13', '2024-08-01 05:54:13', NULL),
(501, 'Sharon Chepkemboi', 'sharon@exelient.co.ke', NULL, '$2y$10$iDp8bDv0Vpf5CSVhqJVGOebXBLp.PwyduSKWUxR2j8VXM2jesex7u', NULL, '0700940087', NULL, NULL, 0, NULL, '2024-08-01 06:00:20', '2024-08-01 06:00:20', NULL),
(502, 'Nune Abdi', 'abdinune99@gmail.com', NULL, '$2y$10$KkODOBRUQ6iRBhg9NXkOSeuBSwG/cRAVWehO1hmDAKjeHjYrxR7nu', NULL, '0796922553', NULL, NULL, 0, NULL, '2024-08-01 06:12:32', '2024-08-01 06:12:32', NULL),
(503, 'Nune Abdi', 'nuneyabdi77@gmail.com', NULL, '$2y$10$odrVyomPqlzz2y/fXU3FVO734WDhR6rnparqwhfO11pPnq8NA.2Ka', NULL, '+254796922553', NULL, NULL, 0, NULL, '2024-08-01 06:15:22', '2024-08-01 06:15:22', NULL),
(504, 'Jackson Kamau', 'jackson.kamau@microsave.net', '2024-08-01 06:53:37', '$2y$10$2quHiB0ibDfj71s0IsHt5Owm3C3nH5h8vQjbYr3ZWecQ.D1boMgf6', NULL, '+254710464628', NULL, NULL, 0, NULL, '2024-08-01 06:49:55', '2024-08-01 06:53:37', NULL),
(505, 'Kathleen Raizer', 'kathleen.onani@strathmore.edu', NULL, '$2y$10$u5MMVlgV8rvVPrsNi1f2a.ElCvi9/LiQ0ADlxOwjUL9sVpTZA17IG', NULL, '0707850464', NULL, NULL, 0, NULL, '2024-08-01 06:56:51', '2024-08-01 06:56:51', NULL),
(506, 'Philip Anyanya Kegode', 'anyanya@motrack.co.ke', '2024-08-01 07:59:01', '$2y$10$MKvjiokq5myxZWQFUCoh/uyCEhcKolBlqBIvA72WGkhsd8EI9E1T6', NULL, '+254725141796', NULL, NULL, 0, NULL, '2024-08-01 06:59:10', '2024-08-01 07:59:01', NULL),
(507, 'Andrea Peres Lentaaya', 'lentaayaandrea@gmail.com', NULL, '$2y$10$jx9e1PURedvW0UkwSP3/xer6lWqEu3IE5unbY.qY4UD145PElVtWi', NULL, '0742527366', NULL, NULL, 0, NULL, '2024-08-01 07:04:32', '2024-08-01 07:04:32', NULL),
(508, 'Martin Opiyo', 'martinopiyo507@gmail.com', NULL, '$2y$10$6YQu1lBg4yiZdjgHlzovVOIOPFlV.KKG0AyzzmY/Z9axVFI/4fX06', NULL, '0716774001', NULL, NULL, 0, NULL, '2024-08-01 07:29:23', '2024-08-01 07:29:23', NULL),
(509, 'Dainah Kinya', 'Smartcitysltd@gmail.com', NULL, '$2y$10$19LeX.NvFzEpNcm/6ANbnuhWEz4U2Sig2B6mtL2ioig8G8Kdtz6oG', NULL, '0725944780', NULL, NULL, 0, NULL, '2024-08-01 07:32:03', '2024-08-01 07:32:03', NULL),
(510, 'Dainah Kinya', 'd.kinya87@gmail.com', NULL, '$2y$10$59POZvwuoQ7Cys4bKdUFQeaWedNz1YvJz7hNdl0qnS0ITOAwbzwtK', NULL, '+254725944780', NULL, NULL, 0, NULL, '2024-08-01 07:36:18', '2024-08-01 07:36:18', NULL),
(511, 'Muiruri waweru', 'muiruriwaweru33@gmail.com', NULL, '$2y$10$v4RoeB94vap5jOmcOQnhIOrf16NB9Gg6VFwhyZ715JfO6vISuLXHG', NULL, '0748259520', NULL, NULL, 0, NULL, '2024-08-01 07:36:34', '2024-08-01 07:36:34', NULL),
(512, 'Herbert Thuo', 'hthuo@ansa.co.ke', NULL, '$2y$10$aThabn.zRuNG.J6/wiIBFu580VY0v7LEGsAikqsxo5BtqOkZTZhrq', NULL, '0720405080', NULL, NULL, 0, NULL, '2024-08-01 07:42:30', '2024-08-01 07:42:30', NULL),
(513, 'Eunice Alividza Silikhani', 'eunicealividza19@gmail.com', NULL, '$2y$10$cKABRBIqxcZUVpqpQ5O2GedkzyyrDheML97Ygvdv3Rw2B69KGlORq', NULL, '0112486986', NULL, NULL, 0, NULL, '2024-08-01 07:59:31', '2024-08-01 07:59:31', NULL),
(514, 'Eunice Alividza Silikhani', 'Eunice.Silikhani@strathmore.edu', NULL, '$2y$10$P1JN1pAhL/HWxJcEwPFleOm0OfyWbf519hkTWK6IjY4v6RYdc/C1e', NULL, '0779728478', NULL, NULL, 0, NULL, '2024-08-01 08:02:32', '2024-08-01 08:02:32', NULL),
(515, 'Laban Rukenya', 'labanvin08@gmail.com', '2024-08-01 13:39:34', '$2y$10$LRShBcnF6PPrUSp3c2j5nuMSXWEbjcPLYgry0yMAB.GNHMIQ0.xwm', NULL, '+254723486060', NULL, NULL, 0, NULL, '2024-08-01 09:25:15', '2024-08-01 13:39:34', NULL),
(516, 'Laban Rukenya', 'kingvince254@gmail.com', NULL, '$2y$10$8FoMB5FCMJrBj3QNxKb9deelYHyMQ4bV.78MWxvBIumbhTPDgdFdW', NULL, '0723486060', NULL, NULL, 0, NULL, '2024-08-01 09:26:20', '2024-08-01 09:26:20', NULL),
(517, 'Morine Malalo', 'morine.malalo@certi-trust.com', NULL, '$2y$10$SpAkKvmWsYKxsSnTdslUfOT0xfsX.UpayoAgfYXQI93o39vnb/ST.', NULL, '0708905793', NULL, NULL, 0, NULL, '2024-08-01 10:53:15', '2024-08-01 10:53:15', NULL),
(518, 'Edith Aoko', 'edithaoko@gmail.com', NULL, '$2y$10$NTwv5wbs/wn5L7WLzyCuoOjdSDfzK2ddzYYORjRTYkjE/PVRQECg.', NULL, '0791579141', NULL, NULL, 0, NULL, '2024-08-01 12:41:21', '2024-08-01 12:41:21', NULL),
(519, 'Kapoto Karei', 'kapotokarei@gmail.com', NULL, '$2y$10$enhkUt8U/EB9DaOTTVXI8uocM6hyZlxDK5dfrTFowq7bk/svZvZTq', NULL, '0722965449', NULL, NULL, 0, NULL, '2024-08-02 11:49:06', '2024-08-02 11:49:06', NULL),
(520, 'Loise Muigai', 'loise.muigai@enabling.ch', NULL, '$2y$10$bIsAYNKV4L8uTEkDzvQPP.m2zFKOMPlVjHUfWSXXlbeuyi7Hbh37W', NULL, '0724731413', NULL, NULL, 0, NULL, '2024-08-02 16:34:25', '2024-08-02 16:34:25', NULL),
(521, 'Everlyne Wandeto', 'egwandeto@gmail.com', NULL, '$2y$10$Zag8tfYSDc.C2MjoOVfWl.WHlVks2jMzr/T63DiGo72NCMOOZ2GPa', NULL, '0715225790', NULL, NULL, 0, NULL, '2024-08-03 14:01:04', '2024-08-03 14:01:04', NULL),
(522, 'Andy Billy Onyango', 'andybilly2002@gmail.com', '2024-08-04 12:02:46', '$2y$10$inl3THoDNgNx5WlC5V8H.uyjHF7lDsZG4/.VmuyJnB.KImD6mHWae', NULL, '+254793943619', NULL, NULL, 0, NULL, '2024-08-04 09:46:57', '2024-08-04 12:02:46', NULL),
(523, 'Samuel Opiyo', 'samuelatong89@gmail.com', '2024-08-09 12:38:06', '$2y$10$8.2gWjllDRXbkGrYkgFfheRWqLBJHipJZ/Ptv5rhigv5kFMIo0yV.', NULL, '0716393142', NULL, NULL, 0, NULL, '2024-08-04 10:28:40', '2024-08-09 12:38:06', NULL),
(524, 'BENSON MAINA', 'maina.benson9@gmail.com', '2024-08-04 16:38:20', '$2y$10$zUKya.wlbsjederLePNKvOnqSa3xLAIxgesCB9oKGnZcUq41tw/Du', NULL, '0724759855', NULL, NULL, 0, 'bKHKO7bA10nGdZdExv8NF7qPNYkLMBhx5iAkkZF4i9KmE4Fvc58utol1SWpP', '2024-08-04 16:31:08', '2024-08-04 16:38:20', NULL),
(525, 'Caleb Kipkirui Bett', 'caleb.bett@sunesiskenya.com', '2024-08-05 11:23:17', '$2y$10$XyL2RFdyeX7PYETBVEnY5uA3qFEZQb3jasjkd78B24BE/5XOX5Jsq', NULL, '0723315706', NULL, NULL, 0, NULL, '2024-08-05 11:21:14', '2024-08-05 11:23:17', NULL),
(526, 'Awuor Oduor', 'jilianmasha4@gmail.com', '2024-08-05 13:37:21', '$2y$10$RIUUvLz69daw7RKWEk1jbu1xbQJJj7oN9EQh.u.466CGK5OIiz3ci', NULL, '0713664203', NULL, NULL, 0, NULL, '2024-08-05 13:24:47', '2024-08-05 13:37:21', NULL),
(527, 'jimmy muyoti', 'jimmyboydnino@gmail.com', NULL, '$2y$10$kPfxzRSGWGx2EYt2EOfzWuj3aoWOFrBH0OYZV9W11kagsQCjsEnV2', NULL, '0717539103', NULL, NULL, 0, NULL, '2024-08-06 04:09:52', '2024-08-06 04:09:52', NULL),
(528, 'Valentine Owiti Odek', 'valentineodek13@gmail.com', NULL, '$2y$10$LKZhdFzaV7XQ/2eBj0EDSOP9PNmho.63YkDNOO6d0t3xTR3WGRcwm', NULL, '0725494389', NULL, NULL, 0, NULL, '2024-08-06 07:25:47', '2024-08-06 07:25:47', NULL),
(529, 'Mohamed Adan', 'mohaa5104@gmail.com', '2024-08-06 08:14:46', '$2y$10$7rCuxu85LimH0ijTmrnNpeobLVrmYcE2/fxeReumpXArZ4CJhsHTS', NULL, '+254725838049', NULL, NULL, 0, NULL, '2024-08-06 08:14:04', '2024-08-06 08:14:46', NULL),
(530, 'Gerishom Boiyo', 'gerishom.boiyo@solidaarisuus.fi', NULL, '$2y$10$Fb07M98F5jmcISx8saXF7OFgoLfZ3bil15vhNNG1KD/4vlx/ou/Tm', NULL, '0746858875', NULL, NULL, 0, NULL, '2024-08-06 08:28:49', '2024-08-06 08:28:49', NULL),
(531, 'Nancy Akinyi Kung\'a', 'atotna@gmail.com', NULL, '$2y$10$uNTl/r7YBRVaa7WLHpGIA.P/y8Cno/LUqnOiJG7aQldPLICfw/xlq', NULL, '+254722266631', NULL, NULL, 0, NULL, '2024-08-06 10:43:38', '2024-08-06 10:43:38', NULL),
(532, 'PETER WERE', 'wereodindi@gmail.com', NULL, '$2y$10$94MCxo/VLFXFS88hAd7Mu.TjGcA1JCeEN5fCxJJ6qcjqJ11rQLa6e', NULL, '0713297772', NULL, NULL, 0, NULL, '2024-08-06 12:26:53', '2024-08-06 12:26:53', NULL),
(533, 'Joseph gubo', 'gubojoseph@yahoo.com', NULL, '$2y$10$rG9L.m.RElVQGzKFQyCxc.IVmXDTZZCxpCI5LNH47u.w4zwsXbanq', NULL, '0721829243', NULL, NULL, 0, NULL, '2024-08-06 13:48:31', '2024-08-06 13:48:31', NULL),
(534, 'JOSHUA                Adem', 'ademjoshua5@gmail.com', NULL, '$2y$10$fFM0glwPkBP4eTJuTbFb4OPxD/Dnd39BlsS9MsN5GFjt7PuDabqCm', NULL, '+254735011247', NULL, NULL, 0, NULL, '2024-08-07 08:41:14', '2024-08-07 08:41:14', NULL),
(535, 'JOSHUA         ADEM', 'hopehospicecommunity@gmail.com', NULL, '$2y$10$Kvux5mRX1E/oyYBmmqU8o.p34LZ/RCL8nphCGuqn0urdgcTAnSI.C', NULL, '+254703624826', NULL, NULL, 0, NULL, '2024-08-07 08:51:57', '2024-08-07 08:51:57', NULL),
(536, 'Lilian Maina', 'lilian.maina@absa.africa', NULL, '$2y$10$pphb.yobrKE3rmlvRepY/e7ZnhmokVutCzZWcfdm7wCq5y7E4CPNe', NULL, '0702114102', NULL, NULL, 0, NULL, '2024-08-08 03:26:28', '2024-08-08 03:26:28', NULL),
(537, 'Kennedy', 'mrgken.km@gmail.com', NULL, '$2y$10$uSpugI2L6EMflZSzJQ/yPeu3LTX4Mx8LxKAKz5S5VFogkDcrOimPu', NULL, '0717438027', NULL, NULL, 0, NULL, '2024-08-08 06:32:07', '2024-08-08 06:32:07', NULL),
(538, 'Lucy Ngaira', 'ngairalucy@gmail.com', NULL, '$2y$10$QQYiMRuAMo5kF/WuIL5ZUu29ND.LHgOiR2b7rhGrxLhvLHug6gDVK', NULL, '0722960265', NULL, NULL, 0, NULL, '2024-08-08 08:21:15', '2024-08-08 08:21:15', NULL),
(539, 'Lucy Kariru', 'lucykariru46@gmail.com', NULL, '$2y$10$n2kW8.mxOd4lUsLjFKMogOcndbv1Pd4cPIFFSmBK3MSbkloYn4cFi', NULL, '0114621158', NULL, NULL, 0, NULL, '2024-08-08 12:22:08', '2024-08-08 12:22:08', NULL),
(540, 'Arthur Alaka', 'ogwenoarthur350@gmail.com', '2024-08-08 13:49:46', '$2y$10$OgJa8aTDV7UXbBvf6vk5KOUQLeIYeIDsMHzC.kxDd/K0O0qOknNaS', NULL, '0743653181', NULL, NULL, 0, NULL, '2024-08-08 13:18:13', '2024-08-08 13:49:46', NULL),
(541, 'lottiestace69', 'revapressley@t.woeishyang.com', NULL, '$2y$10$G8xrbVtsCXzaEsS6sCBJkec.lQmc1W5eo/A3qh8r/KT5EnNS6DUFq', NULL, '375810179', NULL, NULL, 0, NULL, '2024-08-08 22:33:03', '2024-08-08 22:33:03', NULL),
(542, 'Charity-Carol  Koech', 'charity.koech@umba.com', '2024-08-09 05:31:27', '$2y$10$9WSCPdVtdAP/77hfokWHP.4OodOyBNhwfZC4r6sgvzwC6a9t1t/Ze', NULL, '+254723085000', NULL, NULL, 0, NULL, '2024-08-09 05:28:56', '2024-08-09 05:31:27', NULL),
(543, 'Federica Malfa', 'federica.malfa@incofin.com', '2024-08-09 10:55:00', '$2y$10$BU3EX.Zz82eAbUVDGrUnNugvo3EUVywiWYVVxVw5et9UtpcfeMSb6', NULL, '+320479150428', NULL, NULL, 0, NULL, '2024-08-09 10:28:57', '2024-08-09 10:55:00', NULL),
(544, 'Dipankar Acharya', 'dipankar.acharya@apainsurance.org', NULL, '$2y$10$2p.q7b8UHOChNxYn3PNl6OnTdXIWR39ebNkXsHzdz8uiIfBIRsGIO', NULL, '0113527347', NULL, NULL, 0, NULL, '2024-08-09 11:13:12', '2024-08-09 11:13:12', NULL),
(545, 'Brian', 'brian.onyino@gmail.com', NULL, '$2y$10$9TyJm/w/6cB2UqcVEl9kiudF3fXK/WJOLIgUlkNynXrJ49rJYdFtS', NULL, '+254725797673', NULL, NULL, 0, NULL, '2024-08-09 16:03:20', '2024-08-09 16:03:20', NULL),
(546, 'Alvin Biko', 'bikojuma10@gmail.com', NULL, '$2y$10$Elw8htMxRelqZSu8H2QIUO3oxJFbWri7iXk4zLF6HWD6oBTl4F0eS', NULL, '0742695215', NULL, NULL, 0, NULL, '2024-08-10 04:35:10', '2024-08-10 04:35:10', NULL),
(547, 'Sylvia Wanjiru Opiyo', 'swanjiru9090@gmail.com', NULL, '$2y$10$2iazmLmkAFXM7rScR7E.UOXSxqOFNTNOB2AgqKxYFKBCiDk.Ws.Uy', NULL, '0769851172', NULL, NULL, 0, NULL, '2024-08-10 05:44:46', '2024-08-10 05:44:46', NULL),
(548, 'Sylvia Wanjiru Opiyo', 'swanjiru90@gmail.com', NULL, '$2y$10$HyQ.QNRb83aGNDh9uvIbme62rYZSglwoQDdOWjaAunKGWkB/NK4/W', NULL, '+256783622473', NULL, NULL, 0, NULL, '2024-08-10 05:47:56', '2024-08-10 05:47:56', NULL),
(549, 'Stella Chepngeno', 'snenoh@gmail.com', '2024-08-11 13:16:48', '$2y$10$PcQ.sITsfyHFRpHdtqxeCOHGIwVKGEU967q3pUxcT9NtMoqNGl4vC', NULL, '0725862535', NULL, NULL, 0, NULL, '2024-08-11 13:03:26', '2024-08-11 13:16:48', NULL),
(550, 'MUUO TONNY', 'muuotonny22@gmail.com', NULL, '$2y$10$lV8BQB96.aFCNtHsx6PDs...Rb4Jrehmh4sH8Z4IKpgUcugk8RWvu', NULL, '0748707247', NULL, NULL, 0, NULL, '2024-08-12 05:32:09', '2024-08-12 05:32:09', NULL),
(551, 'Rose Gathu', 'gathu.nyokabi@gmail.com', NULL, '$2y$10$rN6v/k2qNvbOlpAaWKbHi.ukoJdzfz8zJfzZeGfUXr.kFFYRlCQjy', NULL, '0741513217', NULL, NULL, 0, NULL, '2024-08-12 07:05:22', '2024-08-12 07:05:22', NULL),
(552, 'GEORGE MBURU', 'repotranscompany@gmail.com', '2024-08-13 15:04:17', '$2y$10$Q7fpm8Zet8glCMcZef.b4eCJkuKrY5etiILgws3U9WH4cgDW.b3GC', NULL, '0732659220', NULL, NULL, 0, NULL, '2024-08-13 14:12:30', '2024-08-13 15:04:17', NULL),
(553, 'Anne Mwasi', 'annemwasi@gmail.com', NULL, '$2y$10$NKtwAGV97fGJM0octLAcz.MMGusb4IqxuPP/vHpOLtCNm0nSjIy7q', NULL, '0722870101', NULL, NULL, 0, NULL, '2024-08-14 04:38:05', '2024-08-14 04:38:05', NULL),
(554, 'Vikaran UBhi', 'vikaran@paystack.com', '2024-08-14 08:17:12', '$2y$10$g8sYQd9WbOZORRdwZCdGQudcwv1gwCfiHkouLSHsOH2QlAAbWmn3C', NULL, '0715783663', NULL, NULL, 0, NULL, '2024-08-14 08:16:55', '2024-08-14 08:17:12', NULL),
(555, 'Andrew Mbote Mbugua', 'andrew.mbote@gmail.com', NULL, '$2y$10$Vjq/rSPxt7uDm.Hkan5QRO8HiALWB7dzcFVcnD09eGU.yGiUI/uGG', NULL, '0708849968', NULL, NULL, 0, NULL, '2024-08-14 08:33:26', '2024-08-14 08:33:26', NULL),
(556, 'Emmanuel', 'Emmanuel.murai@avenews-gt.com', NULL, '$2y$10$mSGM1aG.rYJaNZ9RstaJge0m/8RMf5gcxGYFOLMSdwrWtVV6Xxsva', NULL, '0720699604', NULL, NULL, 0, NULL, '2024-08-14 11:01:10', '2024-08-14 11:01:10', NULL),
(557, 'Faith Waweru', 'faithwaweru41@gmail.com', NULL, '$2y$10$y35/MW4ZbF9gSyUEzQ939usXdpXecrs31CpynWyUcaKKvaCkuD1RO', NULL, '0742751983', NULL, NULL, 0, NULL, '2024-08-14 16:21:21', '2024-08-14 16:21:21', NULL),
(558, 'Faith Waweru', 'imanifaith328@gmail.com', NULL, '$2y$10$ECYNeLHUadoYczB8bX0R6OepBxLM0uvIfSiSmNT7/ixXy8T22kjaS', NULL, '0756961789', NULL, NULL, 0, NULL, '2024-08-14 16:23:21', '2024-08-14 16:23:21', NULL),
(559, 'Mike Kamau', 'mike.kamau@certi-trust.com', NULL, '$2y$10$lICUEyCY0b971vtDxvtSOuU/pnxk5M9yZPdqim3pkpW1sBhrsmR9m', NULL, '0722327178', NULL, NULL, 0, NULL, '2024-08-16 01:07:43', '2024-08-16 01:07:43', NULL),
(560, 'Karen Maina', 'Karennyandia@gmail.com', NULL, '$2y$10$UZAwA.1qnyF6ylHbfG2oyuZ7iIuFHItw555Wps0ukWTRvFoNc3NgW', NULL, '+254729871816', NULL, NULL, 0, NULL, '2024-08-16 17:09:56', '2024-08-16 17:09:56', NULL),
(561, 'Karen Maina', 'kaymaish@gmail.com', NULL, '$2y$10$qLnGzqssrTfc0ni1BHmuOuUDLjtmFqiT9BKPh99TbPAS4ORrUyHXm', NULL, '0729871816', NULL, NULL, 0, NULL, '2024-08-16 17:11:29', '2024-08-16 17:11:29', NULL),
(562, 'Akalanka Ranathunga', 'akalanka08@gmail.com', '2024-08-19 10:11:16', '$2y$10$l1H0XHYkRJtNO0Ptd7hS0OwQKT7F2ssSYBchkqy6DIk52xAHfe3Xy', NULL, '+254115756197', NULL, NULL, 0, NULL, '2024-08-19 10:10:22', '2024-08-19 10:11:16', NULL),
(563, 'Stephanie Nguku', 'snguku@upscaleconsulting.co.ke', '2024-08-19 11:10:05', '$2y$10$C3TiNUiegv9aJnaXaFBI/O29m3Av4TvPMvuDgBuEmC15y13zJrE0m', NULL, '0722449386', NULL, NULL, 0, NULL, '2024-08-19 10:45:34', '2024-08-19 11:10:05', NULL),
(564, 'Manan', 'mananbhatnagar12@gmail.com', NULL, '$2y$10$WozhiMVdS4RmVmirzcm6i.aBVCDQcbbfBRiooYmkd2LUvF2b2QJH2', NULL, '0708724581', NULL, NULL, 0, NULL, '2024-08-19 16:51:22', '2024-08-19 16:51:22', NULL),
(565, 'Manan', 'mananbhatnagar68@gmail.com', NULL, '$2y$10$G6.NPMQZMJwEjVzQ8bSdFeHunLlW3AxZO8yROCOfAirrei8hLE4tS', NULL, '+254708724581', NULL, NULL, 0, NULL, '2024-08-19 16:52:49', '2024-08-19 16:52:49', NULL),
(566, 'juliana Wanjiru', 'julietwchege@gmail.com', NULL, '$2y$10$GV07nCbuuOLU7iLqg98ksOluv1oYxhT0Yj1wLB0VHkQZh6LiTYVgS', NULL, '0711529575', NULL, NULL, 0, NULL, '2024-08-20 04:36:01', '2024-08-20 04:36:01', NULL),
(567, 'Shehnain Aboo', 'shehnain@angani.co', NULL, '$2y$10$fJofPlg1AJ/zHJh3.Dc7euVrg3IjZNGholdXQJTU2iD8q2PBvWp5W', NULL, '0721786999', NULL, NULL, 0, NULL, '2024-08-20 05:01:49', '2024-08-20 05:01:49', NULL),
(568, 'Maureen Njeru', 'maureen.njeru@incofin.com', '2024-08-20 06:09:26', '$2y$10$tBdnRMKipXWPPv5E15KL3OC4aWawttrLK.jc0eO7k5/ZsfT4c23LO', NULL, '0715285471', NULL, NULL, 0, NULL, '2024-08-20 05:28:31', '2024-08-20 06:09:26', NULL),
(569, 'Test Person Aug', 'tester2@fincon2024.co.ke', NULL, '$2y$10$58GwKpM8waB3d2NQa5w/OeT1JP/vQ.moNy4jwHRVH.t5d89aHW6eS', NULL, '0721382643', NULL, NULL, 0, NULL, '2024-08-20 07:08:49', '2024-08-20 07:08:49', NULL),
(570, 'Jane Waithera Maina', 'waithera@rckkenya.org', NULL, '$2y$10$umQILN6LwUrIztN/OFzKSevME.Hmz4cizvicNLovDo1kn3XXcWHOS', NULL, '0721697107', NULL, NULL, 0, NULL, '2024-08-20 09:40:10', '2024-08-20 09:40:10', NULL),
(571, 'Test Person Aug 2', 'tester3@fincon2024.co.ke', '2024-08-20 10:31:06', '$2y$10$9uQ0IL1idkurDCm.jDiuhuIkkC/PgbwX4iyWMgqXYf.GOwbOJDBDa', NULL, '07237788899', NULL, NULL, 0, NULL, '2024-08-20 10:03:48', '2024-08-20 10:31:06', NULL),
(572, 'Better Test', 'tester4@fincon2024.co.ke', '2024-08-20 11:10:53', '$2y$10$HGbe30sa1jiouBrIY8Vl2uomYGC.q7eDh/hPw3.I8isD9E2vccobC', NULL, '08929283883', NULL, NULL, 0, NULL, '2024-08-20 11:09:48', '2024-08-20 11:10:53', NULL),
(573, 'Todays Test', 'tester5@fincon2024.co.ke', '2024-08-20 11:30:42', '$2y$10$ur0NDZaNj5NP1c7MWmHPruqGbS0/GXOcTTBRqcK7Oj5AOexwAQW3a', NULL, '0723887990', NULL, NULL, 0, NULL, '2024-08-20 11:22:15', '2024-08-20 11:30:42', NULL),
(574, 'Tesuday Tester', 'tester6@fincon2024.co.ke', '2024-08-20 12:13:11', '$2y$10$YJhrsBkcUtas/OWQ0bRZQetb4BaVmV7FTyc.EbDkhwKHvwNXdxFIC', NULL, '07828289293', NULL, NULL, 0, NULL, '2024-08-20 12:11:55', '2024-08-20 12:13:11', NULL),
(575, 'Noah Ndakala', 'noah@ndakalaadvisory.co.ke', '2024-08-21 10:02:57', '$2y$10$Pynpcuvr67wO40zj3as7T.OWJyIwfLHV9qgPKFYCOLrtZK4Yuz15G', NULL, '+254722220013', NULL, NULL, 0, NULL, '2024-08-21 09:56:18', '2024-08-21 10:02:57', NULL),
(576, 'shadspafford84', 'gabrielebavin@anonmails.de', NULL, '$2y$10$G1dEHYDGS50mf8OMzh/lSeqXWq85REy4UTZGB0rLK4pB.a0HYGzK.', NULL, '3823652014', NULL, NULL, 0, NULL, '2024-08-21 19:16:43', '2024-08-21 19:16:43', NULL),
(577, 'DESMOND CHEBON', 'desmond.chebon@craftsilicon.com', NULL, '$2y$10$iludE3gK5kuxBvSlXcjyie2SeKymf29E6c8/Up/j4coRGXJI0EMlG', NULL, '+254724363325', NULL, NULL, 0, NULL, '2024-08-22 04:32:03', '2024-08-22 04:32:03', NULL),
(578, 'Moses Murage', 'moses@craftsilicon.com', '2024-08-22 04:32:40', '$2y$10$zunUY44Rn7m4yaV3/7truu1QzpF1oxLUwepguEEliqJxCqCloTYhO', NULL, '0722770495', NULL, NULL, 0, NULL, '2024-08-22 04:32:09', '2024-08-22 04:32:40', NULL),
(579, 'Thursday Tester', 'tester7@fincon2024.co.ke', NULL, '$2y$10$l/I7ivODzTFk2Vdj1ImHZ.SrwGIQPV0FC35Kh1J7xGi7Fqc2mljb.', NULL, '07112233445', NULL, NULL, 0, NULL, '2024-08-22 06:39:50', '2024-08-22 06:39:50', NULL),
(580, 'Last Tester Thursday', 'tester8@fincon2024.co.ke', NULL, '$2y$10$Sq1rEYGMHWf8usd6FSSzk.aGDH1gaUoCmX.M0JWd4.8Hw24/wQJdW', NULL, '0788909876', NULL, NULL, 0, NULL, '2024-08-22 08:38:31', '2024-08-22 08:38:31', NULL),
(581, 'Test Person aug thurs', 'tester9@fincon2024.co.ke', '2024-08-22 08:46:52', '$2y$10$qovrShdOJ/Mu9GrLaqE1nebEyvdiYC06NsUTNS4PMXiYqbX6g3y3C', NULL, '0723889009', NULL, NULL, 0, NULL, '2024-08-22 08:41:49', '2024-08-22 08:46:52', NULL),
(582, 'last test today', 'tester10@fincon2024.co.ke', '2024-08-22 08:50:44', '$2y$10$HjGpMiS/Rd7Kqe.9Y2MBs.c0gyt9rdSc6WdIjQg.VJ25M1OuA2xuy', NULL, '07889999098', NULL, NULL, 0, NULL, '2024-08-22 08:49:16', '2024-08-22 08:50:44', NULL),
(583, 'WINNIE TERRY', 'wterry@tamfi.co.tz', NULL, '$2y$10$ZRFMfy.kpzJY2I6QXcMRqefanXbfq56WBPOeD9lBLFULmH4O85xEy', NULL, '+255752251188', NULL, NULL, 0, NULL, '2024-08-22 10:02:24', '2024-08-22 10:02:24', NULL),
(584, 'WINNIE TERRY', 'info@tamfi.co.tz', NULL, '$2y$10$HKdQ6o4jfLWKebmJEGhkcuLP9JV2lWTpJeRgGmG6HdDWrUUAQt98a', NULL, '0752251188', NULL, NULL, 0, NULL, '2024-08-22 10:08:29', '2024-08-22 10:08:29', NULL),
(585, 'Damaris Kimani', 'mwihakidamaris803@gmail.com', NULL, '$2y$10$c42.PXRaYZuLjdce3G27hew63jcWQch3dabNAv5ZVgLWNIo7XLDdi', NULL, '0741397946', NULL, NULL, 0, NULL, '2024-08-23 09:52:07', '2024-08-23 09:52:07', NULL),
(586, 'Erick owaka', 'erick.owaka@gmail.com', NULL, '$2y$10$P3W5ezGOgQ1yVeeeRt4kKeB2IJOt3/Ln9KtF74mh0JsE1QjJTo3xu', NULL, '0733381008', NULL, NULL, 0, NULL, '2024-08-23 14:28:27', '2024-08-23 14:28:27', NULL),
(587, 'Cynthia Mungai', 'avonlink23@gmail.com', NULL, '$2y$10$ATDV5YOmuCN4iy76S4cB5.hWmOVkJ1.SH2x0aohLtjgeDGe9lpGJi', NULL, '0706859775', NULL, NULL, 0, NULL, '2024-08-25 12:07:54', '2024-08-25 12:07:54', NULL),
(588, 'George Kariuki', 'georgenk09@gmail.com', NULL, '$2y$10$d.bejRKSgmonRRqFAspxGus1ryq9a.6huz1UAYfoWZ7.ff14sfaye', NULL, '0722569147', NULL, NULL, 0, NULL, '2024-08-25 13:50:59', '2024-08-25 13:50:59', NULL),
(589, 'Peter Ndue', 'pndue@aecfafrica.org', '2024-08-27 05:58:05', '$2y$10$xl5HJ53gZ7MH9UCChijfNOzV4ZrvphvtOlpFrXdCve4h4ZnFUBIHu', NULL, '0702680195', NULL, NULL, 0, NULL, '2024-08-27 05:47:30', '2024-08-27 05:58:05', NULL),
(590, 'Lui Apul', 'lui@edigicom.org', '2024-08-28 08:34:54', '$2y$10$6NfIAsNuQbn0LqgdbzmzA..kNLMdfOrzv6LD6Ldnbo.ZOIfdA3RjC', NULL, '+254777530678', NULL, NULL, 0, NULL, '2024-08-28 08:33:12', '2024-08-28 08:34:54', NULL),
(591, 'Samwel T. Otieno', 'otienotambo@gmail.com', NULL, '$2y$10$yC.5QrOukPr8DX8clj6Vd.yFSAtFA4dxoBaEgZrb.8eRMZZaVm.WS', NULL, '+254722570639', NULL, NULL, 0, NULL, '2024-08-28 10:25:42', '2024-08-28 10:25:42', NULL),
(592, 'Nelson Khalumi oluku', 'Knelsn@gmail.com', NULL, '$2y$10$7UdD2U65NqA8yHCdguVA3uYrmChrjiMrYk2kzDV7orMjB830GaJSu', NULL, '0722620325', NULL, NULL, 0, NULL, '2024-08-29 02:09:30', '2024-08-29 02:09:30', NULL),
(593, 'Dancun Okongo', 'dancun.okongo@ke.ey.com', NULL, '$2y$10$rxGLsUpyZESr4d9wXfHaEui08KcPKgQ48gUCKLESMU5TGr6xLhVtm', NULL, '0710526562', NULL, NULL, 0, NULL, '2024-08-29 02:25:49', '2024-08-29 02:25:49', NULL),
(594, 'MARY MBITHE MULI', 'mary.m@edpartnersafrica.com', '2024-08-29 05:55:22', '$2y$10$u9opTKo54ZInBPqXLuSqH.TWuSbSenVqddKCYy9FPh08pqDUZRJei', NULL, '0729847913', NULL, NULL, 0, NULL, '2024-08-29 05:54:36', '2024-08-29 05:55:22', NULL),
(595, 'MARIA SARIA', 'maria.saria@ymail.com', NULL, '$2y$10$OEx8/vy5cGGpuu2Dw9D0GusC9TkAaovkQQ8ltKL61v/xhspUWUg.2', NULL, '+255767211518', NULL, NULL, 0, NULL, '2024-08-30 15:04:16', '2024-08-30 15:04:16', NULL),
(596, 'Sheila Cadogan', 'sheilac@adroit.law', NULL, '$2y$10$MU7b8E31HleOcvIHRIVGFeJZYjZZJLA5Qh8pgZAsDj1sQtugiPX86', NULL, '+254735076464', NULL, NULL, 0, NULL, '2024-08-31 11:02:08', '2024-08-31 11:02:08', NULL),
(597, 'Hattie', 'wambui.hattie@eclectics.io', NULL, '$2y$10$K/.KBfVIAiRZfi1ktc4R4OvGSZEtMEBMflPwj3LxIZztN3m6GVDz6', NULL, '254701725257', NULL, NULL, 0, NULL, '2024-08-31 12:50:34', '2024-08-31 12:50:34', NULL),
(598, 'Makori Kemonde Nyangau', 'makoriadvocacy@gmail.com', '2024-08-31 14:31:24', '$2y$10$x2sdB7wJA5PKleKgT7rV9e3ziLK1JXp.ohY1fL6bONxNnb9uI0wK.', NULL, '+254722538927', NULL, NULL, 0, NULL, '2024-08-31 14:17:18', '2024-08-31 14:31:24', NULL),
(599, 'Aayush Khanal', 'ayushkhanal166@gmail.com', '2024-09-01 05:26:42', '$2y$10$gE5dOuY9AYK/Ofi9.66fWOlrDQsFGu7KXatIbMIkLZJL5ObNZybLC', NULL, '9745479915', NULL, NULL, 0, NULL, '2024-09-01 05:22:32', '2024-09-01 05:26:42', NULL),
(600, 'Tonny Julius Missokia', 'tonny.missokia@lainafinance.com', NULL, '$2y$10$leYHWAt69mgWGgdPA7xNy.pX4k4zWindHMs1/2G.zKAlf2NDGNz26', NULL, '+255684512512', NULL, NULL, 0, NULL, '2024-09-01 12:11:03', '2024-09-01 12:11:03', NULL),
(601, 'Jared Gekonge', 'gekongej@letshego.com', NULL, '$2y$10$ePr2AL2NJV9Ci4tXKCnsMON0/2YtrwMxYfY1d/AtapOvTtfJ0pSni', NULL, '0727261899', NULL, NULL, 0, 'w00gM81PGrnKxx23XeEN9xzFXDFUJHCgKR8Nvfb7B6OxDEPb4jWdfRr3b9Gg', '2024-09-01 22:44:54', '2024-09-01 23:08:12', NULL),
(602, 'Allan Mukui', 'ngugi.allan@gmail.com', NULL, '$2y$10$5pcH.3IXzYGYuiQsHaRqXeu0UMMaokG4DsKMpBjdkVlxzWzJ6.9LK', NULL, '0717296625', NULL, NULL, 0, NULL, '2024-09-02 02:00:36', '2024-09-02 02:00:36', NULL),
(603, 'Paul Mwangi', 'paulmwangiie1@gmail.com', '2024-09-02 03:34:37', '$2y$10$3Xucp4KpKhHk017pRcUvYeBI.eb9L071og7c4m3EDyCjYqA53Tl1a', NULL, '0720748523', NULL, NULL, 0, NULL, '2024-09-02 03:26:17', '2024-09-02 03:34:37', NULL),
(604, 'Paul M Mwangi', 'sshg_laikipia@yahoo.com', NULL, '$2y$10$Qglr3PDpWVCqVbsOXdGOOOFoNeloXyGgEzEiaWc8nAFH56voCh7/6', NULL, '0742592037', NULL, NULL, 0, NULL, '2024-09-02 03:29:22', '2024-09-02 03:29:22', NULL),
(605, 'Hussein Abshir', 'huseinn.abshir@gmail.com', NULL, '$2y$10$WcbGnQxOzg1T2KZoZ/v.VutGHKkgFtFxKZtlKdLoLbMLpT8OhQczO', NULL, '+254742027333', NULL, NULL, 0, NULL, '2024-09-02 10:19:15', '2024-09-02 10:19:15', NULL),
(606, 'Khamisi Ndegwa', 'kndegwa@wemaarmicroenterprise.co.ke', NULL, '$2y$10$qEdizhJGoPgC7n4gGHqpnuiEjCtS2ZD500MJhpR56VMnB4TC77Lhy', NULL, '0718450366', NULL, NULL, 0, NULL, '2024-09-03 00:32:05', '2024-09-03 00:32:05', NULL),
(607, 'Michael Otieno Okinyo', 'michaelokinyo11@gmail.com', NULL, '$2y$10$AVXQEhbDC5Mh6ASUP6IPJev9mh.BaV0TtnywT10WFdnzuuLBO3LYK', NULL, '0768584933', NULL, NULL, 0, NULL, '2024-09-03 09:01:29', '2024-09-03 09:01:29', NULL),
(608, 'Modechai Nyerere', 'mnyerere@kepsa.or.ke', NULL, '$2y$10$KTXI45dFvterh6qvFIlbX.8KpJjKbeQzP4rw2/mBLpTu5oY9tlUo6', NULL, '0700748976', NULL, NULL, 0, NULL, '2024-09-04 02:39:55', '2024-09-04 02:39:55', NULL),
(609, 'Betty  Mwende', 'bettymwende201@gmail.com', NULL, '$2y$10$Bd..64rAVF0NPHrS5k//uOGPYItUUyVjpD2IX6dHAWm9dBFnHdeUy', NULL, '0797257066', NULL, NULL, 0, NULL, '2024-09-04 05:14:09', '2024-09-04 05:14:09', NULL),
(610, 'Dennis', 'seanreginold@protonmail.com', NULL, '$2y$10$94Acx690JOSlQE6rGYYr..Qv/5jBELH/lJ2QYBO1u./eEBxUbSluW', NULL, '0705411829', NULL, NULL, 0, NULL, '2024-09-04 05:32:54', '2024-09-04 05:32:54', NULL),
(611, 'Ebenezer Mutungwa', 'ebem@softype.com', NULL, '$2y$10$9TpHiwiOE20hMO7rp6h3ZOQJkTwCeFISMX/18xt39Gy4vm/aJbngG', NULL, '0720940174', NULL, NULL, 0, NULL, '2024-09-04 06:18:44', '2024-09-04 06:18:44', NULL),
(612, 'Japheth Mursi', 'jmursi@usiu.ac.ke', NULL, '$2y$10$e38LFH6ovEH5NcQPVeu7KuQCcNCOc5390Q6uHRi/BdHnKGsn7/yOS', NULL, '0710469003', NULL, NULL, 0, NULL, '2024-09-04 08:58:18', '2024-09-04 08:58:18', NULL),
(613, 'WINNIE TERRY', 'winedtz@gmail.com', NULL, '$2y$10$K20GVahWto/m2vXdkZucCunfT1YfDQFosMZXQZ5uwB6SAwr6CeXM2', NULL, '0715251188', NULL, NULL, 0, NULL, '2024-09-04 09:18:48', '2024-09-04 09:18:48', NULL),
(614, 'Brian cheruiyot', 'brian.cheruiyot@fsdkenya.org', '2024-09-04 15:05:42', '$2y$10$MrsLD4wJjTjcn8W.Hv9.vu.82E6.qWDiatVhX8OIS7RXBvDFJ7yAi', NULL, '+254708709725', NULL, NULL, 0, 'L4rgSQb2YBgdZSzweoB1UHmF3LxYuP43rq3nawhmRWGyMSjv9bPPQfvgEMYA', '2024-09-04 14:37:03', '2024-09-04 15:05:42', NULL),
(615, 'Brian Koech', 'brayantkoche@gmail.com', NULL, '$2y$10$LE/V.tjCdqsbzoZ3kgAnweOvhojvJDGcV87.5Qk3T2hAMkzzYrtM.', NULL, '0706847835', NULL, NULL, 0, NULL, '2024-09-05 05:56:23', '2024-09-05 05:56:23', NULL),
(616, 'Kevin Njeru', 'kevin.njeru@abcthebank.com', NULL, '$2y$10$RJ6qSjOZyQ0SxvjxtMEWNembZakyQ5uh9UTb1Lmj5h04y6fw8rRM6', NULL, '0722980011', NULL, NULL, 0, NULL, '2024-09-05 06:20:49', '2024-09-05 06:20:49', NULL),
(617, 'Vincent Ochieng', 'vincentowino746@gmail.com', NULL, '$2y$10$eUCU9ihH3u9vUmBsRmltfO1CyJf7.3zJYc1WmViFNpCn6Gw6ckaJ2', NULL, '0710394764', NULL, NULL, 0, NULL, '2024-09-05 06:24:11', '2024-09-05 06:24:11', NULL),
(618, 'mukiri mwirigi', 'mukiri.mwirigi@neurallabs.africa', NULL, '$2y$10$hIAYe.Lx/05ajKSH9mGyIemjNxBZsj1KdvG316rGb2oGRUlsra/Wi', NULL, '0700187599', NULL, NULL, 0, NULL, '2024-09-05 06:38:32', '2024-09-05 06:38:32', NULL),
(619, 'gaddy ole', 'gaddyole8@gmail.com', NULL, '$2y$10$s.HavNjgBe0YL4qYkGWCjeEOtmi8fGhr2cZRVsYAE2D3XuXfrGGNG', NULL, '0790590176', NULL, NULL, 0, NULL, '2024-09-05 07:21:56', '2024-09-05 07:21:56', NULL),
(620, 'Wickliffe Musau', 'nmusau@outlook.com', NULL, '$2y$10$cFy1qmXg1ZLXk2v0fgQax.IlMyry5mEcrmDASOrRy3Fzt8ovRCkTq', NULL, '0715211903', NULL, NULL, 0, NULL, '2024-09-05 07:45:20', '2024-09-05 07:45:20', NULL),
(621, 'Levis', 'levissimiyu254@gmail.com', NULL, '$2y$10$QT6lpIzkKEQghPQN2kpWF.a1EDZZTaYAuXiHNbAM2C9jSPvx5Ktke', NULL, '0791500898', NULL, NULL, 0, NULL, '2024-09-05 08:12:52', '2024-09-05 08:12:52', NULL),
(622, 'Ian clifford aduor', 'clif@gmail.com', NULL, '$2y$10$RnoF9dTKmW2mytyPsOBbeuBr3wg5.2dh7h.dQuEqgVM54dwiN/aMS', NULL, '0797619012', NULL, NULL, 0, NULL, '2024-09-05 08:55:01', '2024-09-05 08:55:01', NULL),
(623, 'Amos simiyu waswa', 'amoswasw@gmail.com', NULL, '$2y$10$.Bwj.33DR/hUu9WoLOwbGOYrI7b4l/qP932ZSa8spY54FYfjktsVu', NULL, '0752123939', NULL, NULL, 0, NULL, '2024-09-05 09:16:48', '2024-09-05 09:16:48', NULL),
(624, 'Becky Mangla', 'becky@gmail.com', NULL, '$2y$10$732P6MoMzuzA3vvHYVrDkOtbPSA30s26XwoC8ls/e0R4JWY92djDW', NULL, '+254719274495', NULL, NULL, 0, NULL, '2024-09-05 09:23:49', '2024-09-05 09:23:49', NULL),
(625, 'Martin Mbogo', 'martin1mbogo@gmail.com', NULL, '$2y$10$wQjw.YTWph8i6qLFUSvD1OCkcTl3BgTwroPvP.uoqaLXLQSlcxWJW', NULL, '0725826659', NULL, NULL, 0, NULL, '2024-09-05 09:36:26', '2024-09-05 09:36:26', NULL),
(626, 'IKECHUKWU GODSWILL IHEAGWAM', 'ikechukwu.iheagwam@gmail.com', NULL, '$2y$10$gUNuDNNudKORNje7Slkc2eDqWj3KM5CmMVumJ4NtXbEnFGWe7bEi.', NULL, '0793842397', NULL, NULL, 0, NULL, '2024-09-05 11:19:38', '2024-09-05 11:19:38', NULL),
(627, 'Dennis Mutinda', 'emkadkim@gmail.com', NULL, '$2y$10$AFL6HyiJuXaqhqDZe0W3F..KRXFYDneKyIJtoZoEpuYnFl8zrzUQy', NULL, '0715500098', NULL, NULL, 0, NULL, '2024-09-05 13:15:48', '2024-09-05 13:15:48', NULL),
(628, 'James Chihambakwe', 'cj@exante.eu', NULL, '$2y$10$xUdoZtMEx.lOFg2qM0fVveTeUau9wBBO10u8mOiCpkzSL6OsnrDkK', NULL, '+263775604304', NULL, NULL, 0, NULL, '2024-09-05 14:31:32', '2024-09-05 14:31:32', NULL),
(629, 'Gabriel Mwangi', 'gabscorp123@gmail.com', NULL, '$2y$10$/2P/CCuXqOTg8HUwNWUf9O8XwI4ucRD6e0qZ0ePrsKYcuUEtNLseC', NULL, '0701766206', NULL, NULL, 0, NULL, '2024-09-05 15:18:16', '2024-09-05 15:18:16', NULL),
(630, 'Elius', 'eliuskipkoech5@gmail.com', NULL, '$2y$10$btXBR6OrNSCrpkLihJu15uoCYbHm13ZaCc6TMvUv/R3gGv54PShju', NULL, '0711478502', NULL, NULL, 0, NULL, '2024-09-05 16:53:37', '2024-09-05 16:53:37', NULL),
(631, 'Phylis Njongoro', 'phylis@vestedworld.com', NULL, '$2y$10$HGZI/qQNwBOdoyttM2P0h.qGPHagpgO87usVig0g7mjU/KbvtcxGa', NULL, '0719105816', NULL, NULL, 0, NULL, '2024-09-05 17:04:13', '2024-09-05 17:04:13', NULL),
(632, 'kiti chigiri', 'kc@peupe.io', NULL, '$2y$10$Gv0pk/U9wGkVeVzF2bMLIeIfkA5joMYD/sdJfdXd0pNVMofeic2Nu', NULL, '0721561222', NULL, NULL, 0, NULL, '2024-09-05 17:23:38', '2024-09-05 17:23:38', NULL),
(633, 'Erick', 'erickikimario@gmail.com', NULL, '$2y$10$a6EmEA8cR5.nWhXFXa7cvOeZzYYOgzo9orF/uc5XgKcMZN2sMtmO.', NULL, '0743219282', NULL, NULL, 0, NULL, '2024-09-05 17:43:52', '2024-09-05 17:43:52', NULL),
(634, 'WIINNIE TERRY', 'mclemence@tamfi.co.tz', NULL, '$2y$10$xl0oYxYpoVzGgOPJLjS3kuqIjgd4NJevRKeJrMtx7agl5612/LO1u', NULL, '0675987923', NULL, NULL, 0, NULL, '2024-09-06 04:17:34', '2024-09-06 04:17:34', NULL),
(635, 'Edward mburu', 'edwardnmburu@gmail.com', NULL, '$2y$10$OWEwJNaDnyigHJ.oj2kHiek5pWTg4d4m6IaelEZz11sdhmWgBe9EW', NULL, '0769462337', NULL, NULL, 0, NULL, '2024-09-06 05:50:56', '2024-09-06 05:50:56', NULL),
(636, 'Jairo ouko', 'jairoouko@gmail.com', NULL, '$2y$10$RpTcaCVH/dBn.biEy800LOq3q3/SRb7J5rz1HskpwDdg8zeQ5GqB2', NULL, '0790200541', NULL, NULL, 0, NULL, '2024-09-06 07:27:26', '2024-09-06 07:27:26', NULL),
(637, 'Juliana Nekulu Odenyo', 'ssekanjakojuly@Gmail.com', '2024-09-06 07:56:19', '$2y$10$/rquq9euS2IsIenIvaw32u2J61mWLvbsA0BY679bzr0Zo0US80reS', NULL, '+254728491946', NULL, NULL, 0, NULL, '2024-09-06 07:52:30', '2024-09-06 07:56:19', NULL),
(638, 'MAINA EMELDA WANJIKU', 'howellemelda7@gmail.com', NULL, '$2y$10$o4KuNjjv7CZdMZ9zwI58m.QpLb1d5rP03tStbEMQGZGP3GoHReMpu', NULL, '+254707737654', NULL, NULL, 0, NULL, '2024-09-06 08:16:28', '2024-09-06 08:16:28', NULL),
(639, 'HAMISI RUMBA', 'khamsohmanyayah@gmail.com', NULL, '$2y$10$BlG0xngJIzkWWqTxxeavCeCcGbXjY0olhnCOOEdELkQCi85pR2EUO', NULL, '0799459553', NULL, NULL, 0, NULL, '2024-09-06 09:22:53', '2024-09-06 09:22:53', NULL),
(640, 'Kevin mokua', 'kevinmokua596@gmail.com', NULL, '$2y$10$ztIknJSESr7dZYKzBvrEIOm/xpaL0Pk3VZrlqFitPpuJ6bT2KIAwa', NULL, '0769375334', NULL, NULL, 0, NULL, '2024-09-06 09:49:32', '2024-09-06 09:49:32', NULL),
(641, 'Banfil', 'kingbash38k@gmail.com', NULL, '$2y$10$JhoAZgmyXXoMQPZsq8bXZ.qxNL1InAjo3DyEHH5SHrxJWkbJm5Y7S', NULL, '0715537679', NULL, NULL, 0, NULL, '2024-09-06 09:58:46', '2024-09-06 09:58:46', NULL),
(642, 'Elinorah', 'elnorahnyange480@gmail.com', NULL, '$2y$10$R35wDFoJi0Ujs0wimkl5hu.4s7Il8RmnUKxGFeqrcieIAqKq4HmSm', NULL, '0703769807', NULL, NULL, 0, NULL, '2024-09-06 10:02:44', '2024-09-06 10:02:44', NULL),
(643, 'Meshack akuma mwenga', 'meshackakumao6@gmail.com', NULL, '$2y$10$5GtQkPF0HOnrmRltoJPqt.UuMMp42OwSLbtGk66RohqTtUqo8HdCq', NULL, '0114221878', NULL, NULL, 0, NULL, '2024-09-06 10:14:42', '2024-09-06 10:14:42', NULL),
(644, 'Venesa zighe mshighati', 'verastecy641@gmail.com', NULL, '$2y$10$.mfbyTr1zYKEZ2bu0VrFm..7odHBuBcoHiTQWAl8genbeE5t9ojg2', NULL, '0757154511', NULL, NULL, 0, NULL, '2024-09-06 10:22:19', '2024-09-06 10:22:19', NULL),
(645, 'Michael Weru', 'michael.weru@kenbright.africa', '2024-09-06 10:39:33', '$2y$10$ReCtA65SywfvObcxwSH.f.WA8lN/wTjHSGjrLMYLQmPWMF68l6uVW', NULL, '254721403950', NULL, NULL, 0, NULL, '2024-09-06 10:38:37', '2024-09-06 10:39:33', NULL),
(646, 'Felix kiptoo', 'felixkiptoo369@mail.com', NULL, '$2y$10$PmLeu4K0ywGuSlftwE2Dc.YfK95WRJVaT6NCEIYpO65jxKKEWrCk6', NULL, '0799024724', NULL, NULL, 0, NULL, '2024-09-06 11:10:17', '2024-09-06 11:10:17', NULL),
(647, 'Sep Test', 'tester11@fincon2024.co.ke', NULL, '$2y$10$9O3WDUWSngVmHthRVl2/PeJZwXyFu2Z7lWfX34brV/TXL4SIc1KSe', NULL, '0728282929', NULL, NULL, 0, NULL, '2024-09-07 07:27:28', '2024-09-07 07:27:28', NULL),
(648, 'Test Raila Odinga', 'tester12@fincon2024.co.ke', NULL, '$2y$10$vFzhK2Jo5ks/5Oj63F1p6u6a1LUAnEdKSpZnH/a6ZKlDTHtpka4gW', NULL, '0723998009', NULL, NULL, 0, NULL, '2024-09-07 08:40:35', '2024-09-07 08:40:35', NULL),
(649, 'Bank Deposit customer', 'tester13@fincon2024.co.ke', NULL, '$2y$10$7Ba7vNjFG5P.1kRthSLeJe8ipM8IUqXGtTRkiDWQBgJXwmb57qU0K', NULL, '072377768889', NULL, NULL, 0, NULL, '2024-09-07 11:44:26', '2024-09-07 11:44:26', NULL),
(650, 'Raila Bank', 'tester14@fincon2024.co.ke', NULL, '$2y$10$G88oJnCSQPooy/AR9bsQ4.pqwmunD7f0rnBGRgfSZMmS1EkQcDLye', NULL, '07236363748', NULL, NULL, 0, NULL, '2024-09-07 11:51:23', '2024-09-07 11:51:23', NULL),
(651, 'Ruto William', 'tester1@fincon2024.co.ke', NULL, '$2y$10$yr3Ae6AUgynM7RlWqPSmAO33RamMvrTj7yIvOcF5V3MOSe0ysRGDa', NULL, '07890009887', NULL, NULL, 0, NULL, '2024-09-07 12:14:42', '2024-09-07 12:14:42', NULL),
(652, 'Testing Progress', 'progress@mail.com', NULL, '$2y$10$BBmRGdRBcj6HcAsMuq51kO9PaDJAxDjfkCxOZtCArFWCVVRxdkQIW', NULL, '07290009887', NULL, NULL, 0, NULL, '2024-09-07 12:25:36', '2024-09-07 12:25:36', NULL),
(653, 'Saturday progress', 'saturday@mail.com', NULL, '$2y$10$ECU.4RFJIDwxB8rYTRS.r.eBFJRW5gk9O4bdu.XyjQhN.A54gJk6y', NULL, '073838399484', NULL, NULL, 0, NULL, '2024-09-07 12:28:18', '2024-09-07 12:28:18', NULL),
(654, 'Morgan Abira', 'abiramorgan@gmail.com', NULL, '$2y$10$NqLcIIdg0LIjqVytqQRPiOKnlGc7kiw3j4TnJJYZ5SodWOlP.ctFu', NULL, '0719823680', NULL, NULL, 0, NULL, '2024-09-09 02:17:45', '2024-09-09 02:17:45', NULL),
(655, 'Jane Ndegwa', 'jnd@exante.eu', '2024-09-09 06:53:32', '$2y$10$fCIgbbKiudreJc6GYyPOmeL6n.XNDhk9rO8upMPO0j835mrdcTk6q', NULL, '+254724803845', NULL, NULL, 0, '1alPlYeT73211maNqzDf8QCwF7qel9Qt1rY8Ro2aQl9P1eL8TNWg0bLx6HQs', '2024-09-09 04:20:22', '2024-09-09 06:53:32', NULL),
(656, 'Michael Elifura', 'michael@gmail.com', NULL, '$2y$10$HGu8YrPvCf8uS5eyfIAIo.AcyA9TPfKrXBPxRJRZyPK2leh1sMBEC', NULL, '0787322322', NULL, NULL, 0, NULL, '2024-09-09 07:25:09', '2024-09-09 07:25:09', NULL),
(657, 'Joyce Okebaso', 'okebasoj@gmail.com', NULL, '$2y$10$IflVlNH6wgzFSC2rz/6gauQcZp.dhjOaIQRoBSi40RJ9.KEYs3Hz.', NULL, '0113890368', NULL, NULL, 0, NULL, '2024-09-12 03:19:23', '2024-09-12 03:19:23', NULL),
(658, 'Rosemary.waweru', 'rosemary.waweru@fincredit.co.ke', NULL, '$2y$10$sEsiqES/iNkye/wNssBVreOoYxib3q03jnbLiZ9CqeH0YNhvRdbsC', NULL, '0725425500', NULL, NULL, 0, 'di6hZ4hZvYmjqeq5Ur8QJPaQDnkj4SbmSLUEYALgK98nAUSvyEUez8t3Jfkn', '2024-09-12 06:26:11', '2024-09-12 06:48:55', NULL),
(659, 'Humphrey Odendo', 'humphrey.odendo@icloud.com', NULL, '$2y$10$AZHxcQR5WdcPI0GmOiyU7.x2DBpBpyLlFh1wihwGevoKnasTAUbmK', NULL, '89999', NULL, NULL, 0, NULL, '2024-09-12 13:01:10', '2024-09-12 13:01:10', NULL),
(660, 'Humphrey Odendo', 'humphreyodendo@icloud.com', NULL, '$2y$10$OkU4CEQnGC4Xtfg1pg5mQOIyRKrJJjGrotDMZF4aQR0QvSJiExm92', NULL, '8899', NULL, NULL, 0, NULL, '2024-09-12 13:02:32', '2024-09-12 13:02:32', NULL),
(661, 'Humphrey Odendo', 'humphreysodendo@icloud.com', NULL, '$2y$10$KewSFA.mYebHhh633LguI.k64ZNFuT/4.d/7umhblJ/tmptQo/lba', NULL, '8888', NULL, NULL, 0, NULL, '2024-09-12 13:03:40', '2024-09-12 13:03:40', NULL),
(662, 'Humphrey Odendo', 'humphreyzodendo@icloud.com', NULL, '$2y$10$SSWvjnFS0yEOaouZRpqeyOsJ2DvTLfMcWpb1hIT9YpuaUK9xD5smC', NULL, '8989', NULL, NULL, 0, NULL, '2024-09-12 13:06:33', '2024-09-12 13:06:33', NULL),
(663, 'Shatsima Kennedy', 'shatsimak@gmail.com', NULL, '$2y$10$WbjYlJy4vguV1Nl7HJhK7O3qugJit.z4vsUlvYWZyhJFmvlXIInde', NULL, '254746097124', NULL, NULL, 0, NULL, '2024-09-14 18:22:49', '2024-09-14 18:22:49', NULL),
(664, 'Simon', 'simonedasi@gmail.com', NULL, '$2y$10$jTtuFCau8R8n3VzwiDXgPuYRummUZgUO9nGODSMa0Z8LNo3mKti1C', NULL, '0702540617', NULL, NULL, 0, NULL, '2024-09-15 10:48:55', '2024-09-15 10:48:55', NULL),
(665, 'Hanningtone soita', 'hanningtonhanny82@gmail.com', NULL, '$2y$10$ACnBclBWGFlchr6ICkBG.uY4YdiC2Qw0Y/3gAen8bGATG9L0uRzVq', NULL, '0795340200', NULL, NULL, 0, NULL, '2024-09-15 18:12:40', '2024-09-15 18:12:40', NULL),
(666, 'mwita peter shen', 'shem@gmail.com', NULL, '$2y$10$E/ipD0kruWg6vyG2bRm8uOxoDNqmj.FAk9LtphcB0K621SzJzFoZK', NULL, '0710402856', NULL, NULL, 0, NULL, '2024-09-15 18:34:23', '2024-09-15 18:34:23', NULL),
(667, 'Stephen', 'mogitastephen722@gmail.com', NULL, '$2y$10$Cld4LzJ3PSLE7Vb3UdOrS.EpT2lV0LcV1xcKAsFdrdBkV2Ci72aNm', NULL, '0710488111', NULL, NULL, 0, NULL, '2024-09-16 07:16:21', '2024-09-16 07:16:21', NULL),
(668, 'Eric Njoroge', 'enjoroge@mespt.org', NULL, '$2y$10$QgoOHUnP4I19IGtAam2yieoicYK8IBPafc2rnXAAah.Llzsiwr2Ya', NULL, '+254720398569', NULL, NULL, 0, NULL, '2024-09-17 04:44:34', '2024-09-17 04:44:34', NULL),
(669, 'Kathrin Gerner', 'kathrin.gerner@gmail.com', '2024-09-17 11:49:06', '$2y$10$5aqb.8hEo0V.aR.bXmxxweZ5SKhBF.QNiX0.T7TnZnFhEZisfQfUO', NULL, '+250784117414', NULL, NULL, 0, 'UZACxJCuJhtzHD1x0U2avTya1cFmtroRdxcVFGkmkbDFPnz7YzpazuI5kj1f', '2024-09-17 11:27:26', '2024-09-17 11:49:06', NULL),
(670, 'Monica Wangeci Ndungu', 'mwangeci@asa-ke.com', NULL, '$2y$10$ECF7Ra9HRJs7p8qXjtlRT.5XSdFopxWPwgh.Hnh5Ygdu6XHXQMZiS', NULL, '+254724377960', NULL, NULL, 0, NULL, '2024-09-17 12:29:44', '2024-09-17 12:29:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `url_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`id`, `name`, `desc`, `phone`, `email`, `location_id`, `url_link`, `cover_img`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kenya School of Monetary Studies', 'Kenya School of Monetary Studies (KSMS) was established as a School of the Central Bank of Kenya and registered in 1997 as a corporate entity, limited by guarantee; under the Companies Act (Chapter 486 of the Laws of Kenya); with the primary mandate to build capacity for the banking industry and support the Bank deliver on its core mandate of fostering a stable and well-functioning financial system.', '020 8646000', 'info@ksms.or.ke', 1, 'https://ksms.or.ke/', '170424kenya-school-of-monetary-studies.jpg', '2024-04-17 11:15:05', '2024-04-17 11:15:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `venue_rooms`
--

CREATE TABLE `venue_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `venue_id` int(11) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `size` decimal(10,2) DEFAULT NULL,
  `max_capacity` int(11) DEFAULT NULL,
  `auditorium` int(11) DEFAULT NULL,
  `classroom` int(11) DEFAULT NULL,
  `u_shape` int(11) DEFAULT NULL,
  `reception` int(11) DEFAULT NULL,
  `banquet` int(11) DEFAULT NULL,
  `cover_img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venue_rooms`
--

INSERT INTO `venue_rooms` (`id`, `venue_id`, `name`, `description`, `address`, `size`, `max_capacity`, `auditorium`, `classroom`, `u_shape`, `reception`, `banquet`, `cover_img`, `published`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Plenary room', 'Plenary room.\r\nAudio visual aids – LCD Projector and Laptop.\r\nStationery – A note pad and pen per participant.\r\nTwo ½ lit. Bottles of mineral water per participant per day.\r\nMeals: Two tea/coffee breaks, three course buffet lunch with a soft drink.', 'Near Entrace', 343254.00, 500, 500, 400, 120, 300, 400, '140624plenary-room.jpg', 0, '2024-06-14 12:29:37', '2024-06-14 12:29:37', NULL),
(2, 1, 'Seminar Rooms', 'Audio visual aids – LCD Projector and Laptop.\r\nStationery – A note pad and pen per participant.', 'Seminar Rooms', 2005.00, 200, 200, 150, 120, 200, 200, '140624seminar-rooms.jpg', 0, '2024-06-14 12:31:43', '2024-06-14 12:31:43', NULL),
(3, 1, 'Boardrooms', 'Audio visual aids – LCD Projector and Laptop.\r\nStationery – A note pad and pen per participant.', 'Boardrooms', 6456.00, 100, 100, 100, 100, 0, 0, '140624boardrooms.jpg', 0, '2024-06-14 12:33:42', '2024-06-14 12:33:42', NULL),
(4, 1, 'Registration Area - Main Gate', 'Gate Area Usually used for registration of delegates.', 'Gate', 2390.00, 10, 10, 10, 10, 10, 10, '140624registration-area-main-gate.jpeg', 0, '2024-06-14 16:30:24', '2024-06-14 16:30:24', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agenda_speakers`
--
ALTER TABLE `agenda_speakers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_uploads`
--
ALTER TABLE `bank_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `events_code_unique` (`code`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_types_name_unique` (`name`);

--
-- Indexes for table `exhibitors`
--
ALTER TABLE `exhibitors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_name_unique` (`name`);

--
-- Indexes for table `group_posts`
--
ALTER TABLE `group_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mpesa_s_t_k_s`
--
ALTER TABLE `mpesa_s_t_k_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_trans_code_unique` (`trans_code`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_ticket_details`
--
ALTER TABLE `order_ticket_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizers`
--
ALTER TABLE `organizers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organizers_name_unique` (`name`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `speakers`
--
ALTER TABLE `speakers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tickets_code_unique` (`code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venue_rooms`
--
ALTER TABLE `venue_rooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agendas`
--
ALTER TABLE `agendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `agenda_speakers`
--
ALTER TABLE `agenda_speakers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_uploads`
--
ALTER TABLE `bank_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exhibitors`
--
ALTER TABLE `exhibitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `group_posts`
--
ALTER TABLE `group_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `mpesa_s_t_k_s`
--
ALTER TABLE `mpesa_s_t_k_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `order_ticket_details`
--
ALTER TABLE `order_ticket_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `organizers`
--
ALTER TABLE `organizers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `speakers`
--
ALTER TABLE `speakers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=671;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `venue_rooms`
--
ALTER TABLE `venue_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
