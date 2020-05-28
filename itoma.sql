-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 28, 2020 at 06:53 PM
-- Server version: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itoma`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_made` date NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `number`, `year_made`, `model`) VALUES
(1, 'sdf468', '2005-05-28', 'Volkswagen Passat'),
(2, 'eyn671', '2014-07-09', 'BMW F30'),
(3, 'dfg971', '2014-05-28', 'Jeep Grand Cherooke'),
(4, 'qea176', '1997-07-09', 'Dodge Grand Caravan');

-- --------------------------------------------------------

--
-- Table structure for table `car_management`
--

DROP TABLE IF EXISTS `car_management`;
CREATE TABLE IF NOT EXISTS `car_management` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cars_id` int(10) UNSIGNED NOT NULL,
  `segments_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_management_cars_id_foreign` (`cars_id`),
  KEY `car_management_segments_id_foreign` (`segments_id`),
  KEY `car_management_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_management`
--

INSERT INTO `car_management` (`id`, `cars_id`, `segments_id`, `user_id`, `date_from`, `date_to`) VALUES
(1, 1, 2, 1, '2020-05-01', '2020-05-31'),
(2, 2, 1, 2, '2020-05-20', '2020-06-24'),
(3, 2, 2, 1, '2020-04-01', '2020-05-19'),
(4, 2, 3, 3, '2020-03-10', '2020-03-31'),
(5, 1, 3, 3, '2020-04-06', '2020-04-16'),
(6, 1, 2, 3, '2020-06-20', '2020-06-30'),
(7, 4, 3, 1, '2020-05-27', '2020-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `car_status`
--

DROP TABLE IF EXISTS `car_status`;
CREATE TABLE IF NOT EXISTS `car_status` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cars_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_status_cars_id_foreign` (`cars_id`),
  KEY `car_status_status_id_foreign` (`status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car_status`
--

INSERT INTO `car_status` (`id`, `cars_id`, `status_id`, `date_from`, `date_to`) VALUES
(1, 1, 4, '2020-05-01', '2020-06-30'),
(2, 2, 3, '2020-04-01', '2020-05-31'),
(3, 3, 5, '2020-05-01', '2020-07-31'),
(4, 4, 4, '2020-03-01', '2020-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2020_05_28_065848_create_cars_table', 1),
(3, '2020_05_28_070048_create_car_status_table', 1),
(4, '2020_05_28_070109_create_car_management_table', 1),
(5, '2020_05_28_070140_create_statuses_table', 1),
(6, '2020_05_28_070201_create_segments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `segments`
--

DROP TABLE IF EXISTS `segments`;
CREATE TABLE IF NOT EXISTS `segments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `segments`
--

INSERT INTO `segments` (`id`, `name`) VALUES
(1, 'Informatikos skyrius'),
(2, 'Saugumo skyrius'),
(3, 'Priežiūros skyrius');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `parent_id`) VALUES
(1, 'Awful', 1),
(2, 'Drive-able', 2),
(3, 'Average', 3),
(4, 'Good', 4),
(5, 'Perfect', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `segment_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_segment_id_foreign` (`segment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `segment_id`) VALUES
(1, 'Arvydas Brazdžionis', 1),
(2, 'Jonas Jonaitis', 2),
(3, 'Rokas Rokaitis', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
