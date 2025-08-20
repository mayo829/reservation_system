-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2025 at 09:12 AM
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
-- Database: `qloapps`
--

-- --------------------------------------------------------

--
-- Table structure for table `qlo_access`
--

CREATE TABLE `qlo_access` (
  `id_profile` int(10) UNSIGNED NOT NULL,
  `id_tab` int(10) UNSIGNED NOT NULL,
  `view` int(11) NOT NULL,
  `add` int(11) NOT NULL,
  `edit` int(11) NOT NULL,
  `delete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_accessory`
--

CREATE TABLE `qlo_accessory` (
  `id_product_1` int(10) UNSIGNED NOT NULL,
  `id_product_2` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_address`
--

CREATE TABLE `qlo_address` (
  `id_address` int(10) UNSIGNED NOT NULL,
  `id_country` int(10) UNSIGNED NOT NULL,
  `id_state` int(10) UNSIGNED DEFAULT NULL,
  `id_customer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_manufacturer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_supplier` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_warehouse` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_hotel` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `alias` varchar(32) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `other` text DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `phone_mobile` varchar(32) DEFAULT NULL,
  `vat_number` varchar(32) DEFAULT NULL,
  `dni` varchar(16) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `auto_generated` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_address`
--

INSERT INTO `qlo_address` (`id_address`, `id_country`, `id_state`, `id_customer`, `id_manufacturer`, `id_supplier`, `id_warehouse`, `id_hotel`, `alias`, `company`, `lastname`, `firstname`, `address1`, `address2`, `postcode`, `city`, `other`, `phone`, `phone_mobile`, `vat_number`, `dni`, `date_add`, `date_upd`, `active`, `deleted`, `auto_generated`) VALUES
(1, 21, 1, 1, 0, 0, 0, 0, 'My Address', '', 'Doe', 'John', '16, Main street', '2nd floor', '25389', 'Demo City', '', '0102030405', '', '', '', '2025-08-07 02:32:20', '2025-08-07 02:32:20', 1, 0, 0),
(2, 21, 2, 0, 0, 0, 0, 1, 'The Hotel Prime', '', 'The Hotel Prime', 'The Hotel Prime', 'Monticello Dr, Montgomery, 10010', '', '77010', 'Anchorage', '', '0987654321', '', '', '', '2025-08-07 02:32:23', '2025-08-17 05:35:29', 1, 0, 0),
(3, 21, 1, 0, 0, 0, 0, 2, 'Luxury Lisbon Apartment T', '', 'Luxury Lisbon Apartment T', 'Luxury Lisbon Apartment T', 'R. Luciano Cordeiro 54, 1150-069 Lisboa, Santo Antonio, Lisbon', '', '48121', 'Lisboa', '', '123123123', '', '', '', '2025-08-08 06:09:40', '2025-08-14 04:16:05', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_address_format`
--

CREATE TABLE `qlo_address_format` (
  `id_country` int(10) UNSIGNED NOT NULL,
  `format` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_address_format`
--

INSERT INTO `qlo_address_format` (`id_country`, `format`) VALUES
(1, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(2, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(3, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(4, 'firstname lastname\ncompany\naddress1\naddress2\ncity State:name postcode\nCountry:name\nphone\nphone_mobile'),
(5, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(6, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(7, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(8, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(9, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(10, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone\nphone_mobile'),
(11, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone\nphone_mobile'),
(12, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(13, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(14, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(15, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(16, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(17, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\ncity\npostcode\nCountry:name\nphone\nphone_mobile'),
(18, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(19, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(20, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(21, 'firstname lastname\ncompany\naddress1 address2\ncity, State:name postcode\nCountry:name\nphone\nphone_mobile'),
(22, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(23, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(24, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(25, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(26, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(27, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(28, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(29, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(30, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(31, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(32, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(33, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(34, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(35, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(36, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(37, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(38, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(39, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(40, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(41, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(42, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(43, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(44, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone\nphone_mobile'),
(45, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(46, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(47, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(48, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(49, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(50, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(51, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(52, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(53, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(54, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(55, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(56, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(57, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(58, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(59, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(60, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(61, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(62, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(63, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(64, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(65, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(66, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(67, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(68, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(69, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(70, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(71, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(72, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(73, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(74, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(75, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(76, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(77, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(78, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(79, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(80, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(81, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(82, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(83, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(84, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(85, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(86, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(87, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(88, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(89, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(90, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(91, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(92, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(93, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(94, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(95, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(96, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(97, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(98, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(99, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(100, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(101, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(102, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(103, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(104, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(105, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(106, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(107, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(108, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(109, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(110, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(111, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone\nphone_mobile'),
(112, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(113, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(114, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(115, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(116, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(117, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(118, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(119, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(120, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(121, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(122, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(123, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(124, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(125, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(126, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(127, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(128, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(129, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(130, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(131, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(132, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(133, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(134, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(135, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(136, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(137, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(138, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(139, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(140, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(141, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(142, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(143, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(144, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(145, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone\nphone_mobile'),
(146, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(147, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(148, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(149, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(150, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(151, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(152, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(153, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(154, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(155, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(156, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(157, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(158, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(159, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(160, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(161, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(162, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(163, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(164, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(165, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(166, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(167, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(168, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(169, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(170, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(171, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(172, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(173, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(174, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(175, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(176, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(177, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(178, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(179, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(180, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(181, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(182, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(183, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(184, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(185, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(186, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(187, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(188, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(189, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(190, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(191, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(192, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(193, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(194, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(195, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(196, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(197, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(198, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(199, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(200, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(201, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(202, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(203, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(204, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(205, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(206, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(207, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(208, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(209, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(210, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(211, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(212, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(213, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(214, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(215, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(216, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(217, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(218, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(219, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(220, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(221, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(222, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(223, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(224, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(225, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(226, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(227, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(228, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(229, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(230, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(231, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(232, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(233, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(234, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(235, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(236, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(237, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(238, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(239, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(240, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(241, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(242, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(243, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile'),
(244, 'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone\nphone_mobile');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_alias`
--

CREATE TABLE `qlo_alias` (
  `id_alias` int(10) UNSIGNED NOT NULL,
  `alias` varchar(255) NOT NULL,
  `search` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_alias`
--

INSERT INTO `qlo_alias` (`id_alias`, `alias`, `search`, `active`) VALUES
(1, 'bloose', 'blouse', 1),
(2, 'blues', 'blouse', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_attachment`
--

CREATE TABLE `qlo_attachment` (
  `id_attachment` int(10) UNSIGNED NOT NULL,
  `file` varchar(40) NOT NULL,
  `file_name` varchar(128) NOT NULL,
  `file_size` bigint(10) UNSIGNED NOT NULL DEFAULT 0,
  `mime` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_attachment_lang`
--

CREATE TABLE `qlo_attachment_lang` (
  `id_attachment` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_attribute`
--

CREATE TABLE `qlo_attribute` (
  `id_attribute` int(10) UNSIGNED NOT NULL,
  `id_attribute_group` int(10) UNSIGNED NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_attribute_group`
--

CREATE TABLE `qlo_attribute_group` (
  `id_attribute_group` int(10) UNSIGNED NOT NULL,
  `is_color_group` tinyint(1) NOT NULL DEFAULT 0,
  `group_type` enum('select','radio','color') NOT NULL DEFAULT 'select',
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_attribute_group_lang`
--

CREATE TABLE `qlo_attribute_group_lang` (
  `id_attribute_group` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `public_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_attribute_group_shop`
--

CREATE TABLE `qlo_attribute_group_shop` (
  `id_attribute_group` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_attribute_impact`
--

CREATE TABLE `qlo_attribute_impact` (
  `id_attribute_impact` int(10) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `id_attribute` int(11) UNSIGNED NOT NULL,
  `weight` decimal(20,6) NOT NULL,
  `price` decimal(17,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_attribute_lang`
--

CREATE TABLE `qlo_attribute_lang` (
  `id_attribute` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_attribute_shop`
--

CREATE TABLE `qlo_attribute_shop` (
  `id_attribute` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_carrier`
--

CREATE TABLE `qlo_carrier` (
  `id_carrier` int(10) UNSIGNED NOT NULL,
  `id_reference` int(10) UNSIGNED NOT NULL,
  `id_tax_rules_group` int(10) UNSIGNED DEFAULT 0,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `shipping_handling` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `range_behavior` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_module` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_free` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `shipping_external` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `need_range` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `external_module_name` varchar(64) DEFAULT NULL,
  `shipping_method` int(2) NOT NULL DEFAULT 0,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `max_width` int(10) DEFAULT 0,
  `max_height` int(10) DEFAULT 0,
  `max_depth` int(10) DEFAULT 0,
  `max_weight` decimal(20,6) DEFAULT 0.000000,
  `grade` int(10) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_carrier_group`
--

CREATE TABLE `qlo_carrier_group` (
  `id_carrier` int(10) UNSIGNED NOT NULL,
  `id_group` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_carrier_lang`
--

CREATE TABLE `qlo_carrier_lang` (
  `id_carrier` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `delay` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_carrier_shop`
--

CREATE TABLE `qlo_carrier_shop` (
  `id_carrier` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_carrier_tax_rules_group_shop`
--

CREATE TABLE `qlo_carrier_tax_rules_group_shop` (
  `id_carrier` int(11) UNSIGNED NOT NULL,
  `id_tax_rules_group` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_carrier_zone`
--

CREATE TABLE `qlo_carrier_zone` (
  `id_carrier` int(10) UNSIGNED NOT NULL,
  `id_zone` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart`
--

CREATE TABLE `qlo_cart` (
  `id_cart` int(10) UNSIGNED NOT NULL,
  `id_shop_group` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_carrier` int(10) UNSIGNED NOT NULL,
  `delivery_option` text NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `id_address_delivery` int(10) UNSIGNED NOT NULL,
  `id_address_invoice` int(10) UNSIGNED NOT NULL,
  `id_currency` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) UNSIGNED NOT NULL,
  `id_guest` int(10) UNSIGNED NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `recyclable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `gift` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `gift_message` text DEFAULT NULL,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT 0,
  `allow_seperated_package` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_advance_payment` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_cart_rule`
--

CREATE TABLE `qlo_cart_cart_rule` (
  `id_cart` int(10) UNSIGNED NOT NULL,
  `id_cart_rule` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_customer_guest`
--

CREATE TABLE `qlo_cart_customer_guest` (
  `id_customer_guest_detail` int(10) UNSIGNED NOT NULL,
  `id_cart` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_product`
--

CREATE TABLE `qlo_cart_product` (
  `id_cart` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_address_delivery` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_shop` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `id_product_attribute` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_rule`
--

CREATE TABLE `qlo_cart_rule` (
  `id_cart_rule` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quantity_per_user` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `priority` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `partial_use` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `code` varchar(254) NOT NULL,
  `minimum_amount` decimal(17,2) NOT NULL DEFAULT 0.00,
  `minimum_amount_tax` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_amount_currency` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `minimum_amount_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `country_restriction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `carrier_restriction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `group_restriction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `cart_rule_restriction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `product_restriction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `shop_restriction` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `reduction_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `reduction_amount` decimal(17,2) NOT NULL DEFAULT 0.00,
  `reduction_tax` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `reduction_currency` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reduction_product` int(10) NOT NULL DEFAULT 0,
  `gift_product` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `gift_product_attribute` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `highlight` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_rule_carrier`
--

CREATE TABLE `qlo_cart_rule_carrier` (
  `id_cart_rule` int(10) UNSIGNED NOT NULL,
  `id_carrier` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_rule_combination`
--

CREATE TABLE `qlo_cart_rule_combination` (
  `id_cart_rule_1` int(10) UNSIGNED NOT NULL,
  `id_cart_rule_2` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_rule_country`
--

CREATE TABLE `qlo_cart_rule_country` (
  `id_cart_rule` int(10) UNSIGNED NOT NULL,
  `id_country` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_rule_group`
--

CREATE TABLE `qlo_cart_rule_group` (
  `id_cart_rule` int(10) UNSIGNED NOT NULL,
  `id_group` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_rule_lang`
--

CREATE TABLE `qlo_cart_rule_lang` (
  `id_cart_rule` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_rule_product_rule`
--

CREATE TABLE `qlo_cart_rule_product_rule` (
  `id_product_rule` int(10) UNSIGNED NOT NULL,
  `id_product_rule_group` int(10) UNSIGNED NOT NULL,
  `type` enum('products','categories','attributes','manufacturers','suppliers') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_rule_product_rule_group`
--

CREATE TABLE `qlo_cart_rule_product_rule_group` (
  `id_product_rule_group` int(10) UNSIGNED NOT NULL,
  `id_cart_rule` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_rule_product_rule_value`
--

CREATE TABLE `qlo_cart_rule_product_rule_value` (
  `id_product_rule` int(10) UNSIGNED NOT NULL,
  `id_item` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cart_rule_shop`
--

CREATE TABLE `qlo_cart_rule_shop` (
  `id_cart_rule` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_category`
--

CREATE TABLE `qlo_category` (
  `id_category` int(10) UNSIGNED NOT NULL,
  `id_parent` int(10) UNSIGNED NOT NULL,
  `id_shop_default` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `level_depth` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `nleft` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `nright` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_root_category` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_category`
--

INSERT INTO `qlo_category` (`id_category`, `id_parent`, `id_shop_default`, `level_depth`, `nleft`, `nright`, `active`, `date_add`, `date_upd`, `position`, `is_root_category`) VALUES
(1, 0, 1, 0, 1, 30, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0, 0),
(2, 1, 1, 1, 2, 29, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0, 1),
(3, 2, 1, 2, 3, 18, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0, 0),
(4, 2, 1, 2, 19, 28, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0, 0),
(5, 3, 1, 3, 4, 17, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23', 0, 0),
(6, 5, 1, 4, 5, 10, 1, '2025-08-07 02:32:23', '2025-08-14 04:16:05', 0, 0),
(8, 18, 1, 6, 13, 14, 1, '2025-08-07 02:32:23', '2025-08-17 05:35:29', 0, 0),
(9, 4, 1, 3, 20, 21, 1, '2025-08-07 02:32:27', '2025-08-07 02:32:27', 0, 0),
(10, 4, 1, 3, 22, 23, 1, '2025-08-07 02:32:27', '2025-08-07 02:32:27', 0, 0),
(11, 4, 1, 3, 24, 25, 1, '2025-08-07 02:32:28', '2025-08-07 02:32:28', 0, 0),
(12, 4, 1, 3, 26, 27, 1, '2025-08-07 02:32:28', '2025-08-07 02:32:28', 0, 0),
(15, 16, 1, 6, 7, 8, 1, '2025-08-08 06:09:40', '2025-08-14 04:16:05', 0, 0),
(16, 6, 1, 5, 6, 9, 1, '2025-08-14 04:16:05', '2025-08-17 05:35:29', 0, 0),
(17, 5, 1, 4, 11, 16, 1, '2025-08-17 05:35:29', '2025-08-17 05:35:29', 0, 0),
(18, 17, 1, 5, 12, 15, 1, '2025-08-17 05:35:29', '2025-08-17 05:35:29', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_category_group`
--

CREATE TABLE `qlo_category_group` (
  `id_category` int(10) UNSIGNED NOT NULL,
  `id_group` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_category_group`
--

INSERT INTO `qlo_category_group` (`id_category`, `id_group`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(6, 3),
(8, 1),
(8, 2),
(8, 3),
(9, 1),
(9, 2),
(9, 3),
(10, 1),
(10, 2),
(10, 3),
(11, 1),
(11, 2),
(11, 3),
(12, 1),
(12, 2),
(12, 3),
(15, 1),
(15, 2),
(15, 3),
(16, 1),
(16, 2),
(16, 3),
(17, 1),
(17, 2),
(17, 3),
(18, 1),
(18, 2),
(18, 3);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_category_lang`
--

CREATE TABLE `qlo_category_lang` (
  `id_category` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text DEFAULT NULL,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_category_lang`
--

INSERT INTO `qlo_category_lang` (`id_category`, `id_shop`, `id_lang`, `name`, `description`, `link_rewrite`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, 1, 1, 'Root', '', 'root', '', '', ''),
(2, 1, 1, 'Home', '', 'home', '', '', ''),
(3, 1, 1, 'Locations', '', 'locations', '', '', ''),
(4, 1, 1, 'Services', '', 'services', '', '', ''),
(5, 1, 1, 'United States', 'This category are for hotels only', 'united-states', '', '', ''),
(6, 1, 1, 'Alabama', 'This category are for hotels only', 'alabama', '', '', ''),
(8, 1, 1, 'The Hotel Prime', 'This category are for hotels only', 'the-hotel-prime', '', '', ''),
(9, 1, 1, 'Restaurant', 'This category are for hotels only', 'restaurant', '', '', ''),
(10, 1, 1, 'Transfers', 'This category are for hotels only', 'transfers', '', '', ''),
(11, 1, 1, 'Activities', 'This category are for hotels only', 'activities', '', '', ''),
(12, 1, 1, 'Operational charges', 'This category are for hotels only', 'operational-charges', '', '', ''),
(15, 1, 1, 'Luxury Lisbon Apartment T2', 'Hotel Branch Category', 'luxury-lisbon-apartment-t2', '', '', ''),
(16, 1, 1, 'Lisboa', 'Hotel Branch Category', 'lisboa', '', '', ''),
(17, 1, 1, 'Alaska', 'Hotel Branch Category', 'alaska', '', '', ''),
(18, 1, 1, 'Anchorage', 'Hotel Branch Category', 'anchorage', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_category_product`
--

CREATE TABLE `qlo_category_product` (
  `id_category` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_category_product`
--

INSERT INTO `qlo_category_product` (`id_category`, `id_product`, `position`) VALUES
(2, 1, 0),
(2, 2, 1),
(2, 3, 2),
(2, 4, 3),
(2, 11, 4),
(3, 1, 0),
(3, 2, 1),
(3, 3, 2),
(3, 4, 3),
(3, 11, 4),
(5, 1, 0),
(5, 2, 1),
(5, 3, 2),
(5, 4, 3),
(5, 11, 4),
(6, 11, 0),
(8, 1, 0),
(8, 2, 1),
(8, 3, 2),
(8, 4, 3),
(9, 9, 0),
(9, 10, 1),
(10, 7, 0),
(10, 8, 1),
(12, 5, 0),
(12, 6, 1),
(15, 11, 0),
(16, 11, 0),
(17, 1, 0),
(17, 2, 1),
(17, 3, 2),
(17, 4, 3),
(18, 1, 0),
(18, 2, 1),
(18, 3, 2),
(18, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_category_shop`
--

CREATE TABLE `qlo_category_shop` (
  `id_category` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_category_shop`
--

INSERT INTO `qlo_category_shop` (`id_category`, `id_shop`, `position`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 0),
(4, 1, 1),
(5, 1, 0),
(6, 1, 0),
(8, 1, 0),
(9, 1, 0),
(10, 1, 1),
(11, 1, 2),
(12, 1, 3),
(15, 1, 0),
(16, 1, 0),
(17, 1, 1),
(18, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cms`
--

CREATE TABLE `qlo_cms` (
  `id_cms` int(10) UNSIGNED NOT NULL,
  `id_cms_category` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `indexation` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_cms`
--

INSERT INTO `qlo_cms` (`id_cms`, `id_cms_category`, `position`, `active`, `indexation`) VALUES
(1, 1, 0, 1, 0),
(2, 1, 1, 1, 0),
(3, 1, 2, 1, 0),
(4, 1, 3, 1, 0),
(5, 1, 4, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cms_category`
--

CREATE TABLE `qlo_cms_category` (
  `id_cms_category` int(10) UNSIGNED NOT NULL,
  `id_parent` int(10) UNSIGNED NOT NULL,
  `level_depth` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_cms_category`
--

INSERT INTO `qlo_cms_category` (`id_cms_category`, `id_parent`, `level_depth`, `active`, `date_add`, `date_upd`, `position`) VALUES
(1, 0, 1, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cms_category_lang`
--

CREATE TABLE `qlo_cms_category_lang` (
  `id_cms_category` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(128) NOT NULL,
  `description` text DEFAULT NULL,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_cms_category_lang`
--

INSERT INTO `qlo_cms_category_lang` (`id_cms_category`, `id_lang`, `id_shop`, `name`, `description`, `link_rewrite`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(1, 1, 1, 'Home', '', 'home', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cms_category_shop`
--

CREATE TABLE `qlo_cms_category_shop` (
  `id_cms_category` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_cms_category_shop`
--

INSERT INTO `qlo_cms_category_shop` (`id_cms_category`, `id_shop`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cms_lang`
--

CREATE TABLE `qlo_cms_lang` (
  `id_cms` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `meta_title` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `link_rewrite` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_cms_lang`
--

INSERT INTO `qlo_cms_lang` (`id_cms`, `id_lang`, `id_shop`, `meta_title`, `meta_description`, `meta_keywords`, `content`, `link_rewrite`) VALUES
(1, 1, 1, 'Policies', 'Our policies of hotel bookings', 'conditions, policy, guidelines, protocol, rule', '<h2 class=\"page-heading bottom-indent\">Policies</h2>\n      <div>\n      <p style=\"border-left:2px solid #808080;padding-left:5px;\">This page contains demo content for illustrative purposes only. Any resemblance to actual products, services, or events is purely coincidental. Thank you for your understanding.</p>\n      <hr /></div>\n      <div>\n      <p class=\"page-subheading\">Reservation Policy:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-10\">Guests must provide valid credit card details to secure a reservation.</li>\n      <li class=\"margin-btm-10\">Cancellation policies vary based on room type and rate plan.</li>\n      <li class=\"margin-btm-10\">Changes to reservations may be subject to availability and additional charges.</li>\n      </ul>\n      <p class=\"page-subheading\">Check-in and Check-out Times:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-10\">Check-in time: 11:00 AM</li>\n      <li class=\"margin-btm-10\">Check-out time: 10:30 AM</li>\n      <li class=\"margin-btm-10\">Early check-in and late check-out requests are subject to availability and may incur additional charges.</li>\n      </ul>\n      <p class=\"page-subheading\">Payment Policy:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-10\">Payment for the entire stay is due upon check-in.</li>\n      <li class=\"margin-btm-10\">Acceptable forms of payment: credit cards, cash, etc.</li>\n      <li class=\"margin-btm-10\">A security deposit may be required upon arrival.</li>\n      </ul>\n      <p class=\"page-subheading\">Cancellation and No-show Policy:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-10\">Cancellations made 7 days prior to arrival are eligible for a full refund.</li>\n      <li class=\"margin-btm-10\">No-shows will be charged the full amount of the reservation.</li>\n      </ul>\n      <p class=\"page-subheading\">Pet Policy:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-10\">Pets are welcome with prior arrangement.</li>\n      <li class=\"margin-btm-10\">Additional charges may apply for pet-friendly accommodations.</li>\n      <li class=\"margin-btm-10\">Guests are responsible for any damages caused by their pets.</li>\n      </ul>\n      <p class=\"page-subheading\">Smoking Policy:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-10\">Our hotel is smoke-free. Smoking is strictly prohibited indoors.</li>\n      <li class=\"margin-btm-10\">Designated smoking areas are available outside the premises.</li>\n      </ul>\n      <p class=\"page-subheading\">Privacy Policy:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-10\">We are committed to protecting your privacy and personal information.</li>\n      <li class=\"margin-btm-10\">Information collected during booking and stay is used solely for operational purposes.</li>\n      </ul>\n      <p class=\"page-subheading\">Accessibility Policy:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-10\">Our hotel is committed to providing accessible accommodations and facilities for guests with disabilities.</li>\n      <li class=\"margin-btm-10\">Please contact us directly for specific accessibility requests.</li>\n      </ul>\n      <p class=\"page-subheading\">Additional Policies:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-10\">Use of hotel facilities such as the gym, spa, pool, etc.</li>\n      <li class=\"margin-btm-10\">Conduct and behavior expectations while on hotel premises.</li>\n      </ul>\n      </div>\n    ', 'policies'),
(2, 1, 1, 'Legal Notice', 'Legal notice', 'notice, legal, credits', '\n      <h2 class=\"page-heading bottom-indent\"><strong>Legal Notice</strong></h2>\n      <div>\n      <p style=\"border-left:2px solid #808080;padding-left:5px;\">This page contains demo content for illustrative purposes only. Any resemblance to actual products, services, or events is purely coincidental. Thank you for your understanding.</p>\n      <hr /></div>\n      <p class=\"margin-btm-30 page-subheading\">Website Terms of Use:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-20\">The content of the pages of this website is for your general information and use only. It is subject to change without notice.</li>\n      <li class=\"margin-btm-20\">Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness, or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors, and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.</li>\n      <li class=\"margin-btm-20\">Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services, or information available through this website meet your specific requirements.</li>\n      </ul>\n      <p class=\"page-subheading\">Intellectual Property:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-20\">This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance, and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.</li>\n      <li class=\"margin-btm-20\">All trademarks reproduced in this website, which are not the property of, or licensed to the operator, are acknowledged on the website.</li>\n      </ul>\n      <p class=\"page-subheading\">Privacy Policy:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-20\">Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and disclose information about you.</li>\n      </ul>\n      <p class=\"page-subheading\">Limitation of Liability:</p>\n      <ul class=\"margin-btm-30\">\n      <li class=\"margin-btm-20\">Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness, or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors, and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.</li>\n      <li class=\"margin-btm-20\">Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services, or information available through this website meet your specific requirements.</li>\n      </ul>\n    ', 'legal-notice'),
(3, 1, 1, 'Terms and Conditions', 'Our Terms and Conditions', 'conditions, terms, use, sell', '\n      <h2 class=\"page-heading bottom-indent\">Terms and Conditions</h2>\n      <div>\n      <p style=\"border-left:2px solid #808080;padding-left:5px;\">This page contains demo content for illustrative purposes only. Any resemblance to actual products, services, or events is purely coincidental. Thank you for your understanding.</p>\n      <hr /></div>\n      <div>\n      <h3 class=\"page-subheading\"><strong>Cancellation Policy:</strong></h3>\n      <div>\n      <ul>\n      <li><span>Free Cancellation: Up to 48 hours before arrival for standard rates.</span></li>\n      <li><span>Bookings made with a non-refundable rate cannot be canceled or modified.</span></li>\n      <li><span>Cancellations within 24 hours of arrival will incur a fee of one night\'s stay.</span></li>\n      </ul>\n      </div>\n      <br />\n      <h3 class=\"page-subheading\"><strong>Changes to Bookings:</strong></h3>\n      <div>\n      <ul>\n      <li><span>A fee of $25 may apply to change your reservation dates after booking.</span></li>\n      <li><span>Changes to room type or number of guests are subject to availability at the hotel.</span></li>\n      </ul>\n      </div>\n      <br />\n      <h3 class=\"page-subheading\"><strong>Guest Responsibility:</strong></h3>\n      <div>\n      <ul>\n      <li><span>All guests must present a valid government-issued photo ID at check-in.</span></li>\n      <li><span>The maximum occupancy for the room type is 2 adults.</span></li>\n      <li><span>Smoking and alcohol are strictly prohibited in all guest rooms and public areas.</span></li>\n      </ul>\n      </div>\n      </div>\n    ', 'terms-and-conditions-of-use'),
(4, 1, 1, 'About Us', 'Learn more about us', 'about us, informations', '<h2 class=\"page-heading bottom-indent\">About Us</h2><div>\n      <p style=\"border-left:2px solid #808080;padding-left:5px;\">This page contains demo content for illustrative purposes only. Any resemblance to actual products, services, or events is purely coincidental. Thank you for your understanding.</p>\n      <hr /></div>\n      <div class=\"row\">\n      <div class=\"col-xs-12 col-sm-8\">\n      <div class=\"cms-block\">\n      <div class=\"margin-btm-30\">\n      <p class=\"dark\">Welcome to our sanctuary of luxury and tranquility, where every stay is crafted to provide an unparalleled experience. Whether you\'re seeking a relaxing getaway, a productive business trip, or a memorable event, we are dedicated to making your visit exceptional.</p>\n      </div>\n      <div class=\"margin-btm-30\">\n      <p class=\"page-subheading\">Our Story</p>\n      <p>Inspired by serene surroundings and rich local culture, our hotel combines modern comfort with timeless elegance. Our thoughtfully designed rooms, impeccable service, and attention to detail reflect our commitment to providing a haven for travelers.</p>\n      </div>\n      <div class=\"margin-btm-30\">\n      <p class=\"page-subheading\">Our Mission</p>\n      <p>Our mission is to create a home away from home, offering personalized service and luxurious amenities tailored to your needs. Your comfort and satisfaction are our top priorities, and we strive to exceed your expectations at every turn.</p>\n      </div>\n      <div class=\"margin-btm-30\">\n      <p class=\"page-subheading\">Our Amenities</p>\n      <p>Indulge in the finest amenities during your stay. Relax in elegantly appointed rooms and suites with breathtaking views. Savor gourmet dining at our on-site restaurant, unwind with a cocktail at our stylish bar, and rejuvenate at our state-of-the-art spa and fitness center. Enjoy our serene outdoor pool, lush gardens, and modern business facilities to cater to all your needs.</p>\n      </div>\n      <div class=\"margin-btm-30\">\n      <p class=\"page-subheading\">Our Team</p>\n      <p>Our dedicated team of hospitality professionals is here to serve you with a passion for excellence. From personalized concierge services to meticulous housekeeping, every member of our team is committed to making your stay extraordinary.</p>\n      </div>\n      <div class=\"margin-btm-30\">\n      <p class=\"page-subheading\">Join Us</p>\n      <p>Discover the charm and elegance of our hotel for yourself. Whether visiting for leisure or business, we invite you to experience our warm hospitality and luxurious accommodations. Book your stay with us today and let us make your visit unforgettable.</p>\n      </div>\n      </div>\n      </div>\n      <div class=\"col-xs-12 col-sm-4\">\n      <div class=\"cms-box\">\n      <p class=\"page-subheading\">Testimonials</p>\n      <div class=\"testimonials\">\n      <div class=\"inner\"><span class=\"before\">“</span>Hotel Prime surpassed my expectations in every way. The Executive Room was not only luxurious but also provided a peaceful retreat with its stunning lake views. The attention to detail and personalized service made my stay truly memorable. I highly recommend Hotel Prime for both business and leisure travelers looking for a blend of comfort and sophistication<span class=\"after\">”</span></div>\n      </div>\n      <p><strong class=\"dark\">Calrk Kent</strong></p>\n      <div class=\"testimonials\">\n      <div class=\"inner\"><span class=\"before\">“</span>As a frequent traveler, I can confidently say Hotel Prime stands out for its tranquil environment and exceptional hospitality. The View Room provided a perfect retreat with its stunning cityscape views and comfortable accommodations.<span class=\"after\">”</span></div>\n      </div>\n      <p><strong class=\"dark\">john Doe</strong></p>\n      </div>\n      </div>\n      </div>\n    ', 'about-us'),
(5, 1, 1, 'Secure payment', 'Our secure payment method', 'secure payment, ssl, visa, mastercard, paypal', '<h2 class=\"page-heading bottom-indent\">Secure payment</h2>\n      <div>\n      <p style=\"border-left:2px solid #808080;padding-left:5px;\">This page contains demo content for illustrative purposes only. Any resemblance to actual products, services, or events is purely coincidental. Thank you for your understanding.</p>\n      <hr /></div>\n      <div>We prioritize your security. All transactions made on our website are encrypted using Secure Socket Layer (SSL) technology to ensure your personal information and payment details are protected. We accept major credit cards and provide a secure environment for a seamless booking experience. For any inquiries regarding payment security, feel free to contact our customer support team.</div>\n    ', 'secure-payment');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cms_role`
--

CREATE TABLE `qlo_cms_role` (
  `id_cms_role` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_cms` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cms_role_lang`
--

CREATE TABLE `qlo_cms_role_lang` (
  `id_cms_role` int(11) UNSIGNED NOT NULL,
  `id_lang` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_cms_shop`
--

CREATE TABLE `qlo_cms_shop` (
  `id_cms` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_cms_shop`
--

INSERT INTO `qlo_cms_shop` (`id_cms`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_compare`
--

CREATE TABLE `qlo_compare` (
  `id_compare` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_compare_product`
--

CREATE TABLE `qlo_compare_product` (
  `id_compare` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_configuration`
--

CREATE TABLE `qlo_configuration` (
  `id_configuration` int(10) UNSIGNED NOT NULL,
  `id_shop_group` int(11) UNSIGNED DEFAULT NULL,
  `id_shop` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(254) NOT NULL,
  `value` text DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_configuration`
--

INSERT INTO `qlo_configuration` (`id_configuration`, `id_shop_group`, `id_shop`, `name`, `value`, `date_add`, `date_upd`) VALUES
(1, NULL, NULL, 'PS_LANG_DEFAULT', '1', '2025-08-07 02:32:13', '2025-08-07 02:32:13'),
(2, NULL, NULL, 'PS_VERSION_DB', '1.6.1.23', '2025-08-07 02:32:13', '2025-08-07 02:32:13'),
(3, NULL, NULL, 'PS_INSTALL_VERSION', '1.6.1.23', '2025-08-07 02:32:13', '2025-08-07 02:32:13'),
(4, NULL, NULL, 'QLO_VERSION_DB', '1.7.0.0', '2025-08-07 02:32:13', '2025-08-07 02:32:13'),
(5, NULL, NULL, 'QLO_INSTALL_VERSION', '1.7.0.0', '2025-08-07 02:32:13', '2025-08-07 02:32:13'),
(6, NULL, NULL, 'PS_GROUP_FEATURE_ACTIVE', '1', '2025-08-07 02:32:16', '2025-08-07 02:32:16'),
(7, NULL, NULL, 'PS_SEARCH_INDEXATION', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, NULL, NULL, 'PS_ONE_PHONE_AT_LEAST', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, NULL, NULL, 'PS_CART_FOLLOWING', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, NULL, NULL, 'PS_CARRIER_DEFAULT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, NULL, NULL, 'PS_CURRENCY_DEFAULT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, NULL, NULL, 'PS_COUNTRY_DEFAULT', '21', '0000-00-00 00:00:00', '2025-08-07 02:32:18'),
(13, NULL, NULL, 'PS_REWRITING_SETTINGS', '1', '0000-00-00 00:00:00', '2025-08-07 02:32:18'),
(14, NULL, NULL, 'PS_ORDER_OUT_OF_STOCK', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, NULL, NULL, 'PS_LAST_QTIES', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, NULL, NULL, 'PS_CART_REDIRECT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, NULL, NULL, 'PS_CONDITIONS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, NULL, NULL, 'PS_RECYCLABLE_PACK', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, NULL, NULL, 'PS_GIFT_WRAPPING', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, NULL, NULL, 'PS_GIFT_WRAPPING_PRICE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, NULL, NULL, 'PS_STOCK_MANAGEMENT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, NULL, NULL, 'PS_NAVIGATION_PIPE', '>', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, NULL, NULL, 'PS_PRODUCTS_PER_PAGE', '12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, NULL, NULL, 'PS_HOTEL_IMAGES_PER_PAGE', '9', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, NULL, NULL, 'PS_PURCHASE_MINIMUM', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, NULL, NULL, 'PS_PRODUCTS_ORDER_WAY', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, NULL, NULL, 'PS_PRODUCTS_ORDER_BY', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, NULL, NULL, 'PS_DISPLAY_QTIES', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, NULL, NULL, 'PS_SHIPPING_HANDLING', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, NULL, NULL, 'PS_SHIPPING_FREE_PRICE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, NULL, NULL, 'PS_SHIPPING_FREE_WEIGHT', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, NULL, NULL, 'PS_SHIPPING_METHOD', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, NULL, NULL, 'PS_TAX', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, NULL, NULL, 'PS_SHOP_ENABLE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, NULL, NULL, 'PS_ALLOW_EMP', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, NULL, NULL, 'PS_ALLOW_EMP_MAX_ATTEMPTS', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, NULL, NULL, 'PS_NB_DAYS_NEW_PRODUCT', '20', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, NULL, NULL, 'PS_KPI_BEST_SELLING_ROOM_TYPE_NB_DAYS', '30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, NULL, NULL, 'PS_SSL_ENABLED', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, NULL, NULL, 'PS_WEIGHT_UNIT', 'kg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, NULL, NULL, 'PS_BLOCK_CART_AJAX', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, NULL, NULL, 'PS_ORDER_RETURN', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, NULL, NULL, 'PS_ORDER_RETURN_NB_DAYS', '14', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, NULL, NULL, 'PS_MAIL_TYPE', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, NULL, NULL, 'PS_PRODUCT_PICTURE_MAX_SIZE', '8388608', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, NULL, NULL, 'PS_PRODUCT_PICTURE_WIDTH', '64', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, NULL, NULL, 'PS_PRODUCT_PICTURE_HEIGHT', '64', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, NULL, NULL, 'PS_INVOICE_PREFIX', '#IN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, NULL, NULL, 'PS_INVCE_INVOICE_ADDR_RULES', '{\"avoid\":[]}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, NULL, NULL, 'PS_INVCE_DELIVERY_ADDR_RULES', '{\"avoid\":[]}', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, NULL, NULL, 'PS_DELIVERY_PREFIX', '#DE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, NULL, NULL, 'PS_DELIVERY_NUMBER', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, NULL, NULL, 'PS_RETURN_PREFIX', '#RE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, NULL, NULL, 'PS_INVOICE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, NULL, NULL, 'PS_PASSWD_TIME_BACK', '360', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, NULL, NULL, 'PS_PASSWD_TIME_FRONT', '360', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, NULL, NULL, 'PS_DISP_UNAVAILABLE_ATTR', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, NULL, NULL, 'PS_SEARCH_MINWORDLEN', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, NULL, NULL, 'PS_SEARCH_BLACKLIST', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, NULL, NULL, 'PS_SEARCH_WEIGHT_PNAME', '6', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, NULL, NULL, 'PS_SEARCH_WEIGHT_REF', '10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, NULL, NULL, 'PS_SEARCH_WEIGHT_SHORTDESC', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, NULL, NULL, 'PS_SEARCH_WEIGHT_DESC', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, NULL, NULL, 'PS_SEARCH_WEIGHT_CNAME', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, NULL, NULL, 'PS_SEARCH_WEIGHT_MNAME', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, NULL, NULL, 'PS_SEARCH_WEIGHT_TAG', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, NULL, NULL, 'PS_SEARCH_WEIGHT_ATTRIBUTE', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, NULL, NULL, 'PS_SEARCH_WEIGHT_FEATURE', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, NULL, NULL, 'PS_SEARCH_AJAX', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, NULL, NULL, 'PS_TIMEZONE', 'US/Eastern', '0000-00-00 00:00:00', '2025-08-07 02:32:18'),
(71, NULL, NULL, 'PS_THEME_V11', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, NULL, NULL, 'PRESTASTORE_LIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, NULL, NULL, 'PS_TIN_ACTIVE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, NULL, NULL, 'PS_SHOW_ALL_MODULES', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, NULL, NULL, 'PS_BACKUP_ALL', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, NULL, NULL, 'PS_1_3_UPDATE_DATE', '2011-12-27 10:20:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, NULL, NULL, 'PS_PRICE_ROUND_MODE', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, NULL, NULL, 'PS_1_3_2_UPDATE_DATE', '2011-12-27 10:20:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, NULL, NULL, 'PS_CONDITIONS_CMS_ID', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, NULL, NULL, 'PS_ORDER_LIST_PRICE_DISPLAY_CURRENCY', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, NULL, NULL, 'PS_ALLOW_ADD_ALL_SERVICES_IN_BOOKING', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, NULL, NULL, 'PS_ALLOW_CREATE_CUSTOM_SERVICES_IN_BOOKING', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, NULL, NULL, 'TRACKING_DIRECT_TRAFFIC', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, NULL, NULL, 'PS_META_KEYWORDS', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, NULL, NULL, 'PS_DISPLAY_JQZOOM', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, NULL, NULL, 'PS_VOLUME_UNIT', 'cl', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, NULL, NULL, 'PS_CIPHER_ALGORITHM', '0', '0000-00-00 00:00:00', '2025-08-07 02:32:18'),
(88, NULL, NULL, 'PS_ATTRIBUTE_CATEGORY_DISPLAY', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, NULL, NULL, 'PS_CUSTOMER_SERVICE_FILE_UPLOAD', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, NULL, NULL, 'PS_CUSTOMER_SERVICE_SIGNATURE', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, NULL, NULL, 'PS_BLOCK_BESTSELLERS_DISPLAY', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, NULL, NULL, 'PS_BLOCK_NEWPRODUCTS_DISPLAY', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, NULL, NULL, 'PS_BLOCK_SPECIALS_DISPLAY', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, NULL, NULL, 'PS_STOCK_MVT_REASON_DEFAULT', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, NULL, NULL, 'PS_COMPARATOR_MAX_ITEM', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, NULL, NULL, 'PS_ORDER_PROCESS_TYPE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, NULL, NULL, 'PS_SPECIFIC_PRICE_PRIORITIES', 'id_shop;id_currency;id_country;id_group', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, NULL, NULL, 'PS_TAX_DISPLAY', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, NULL, NULL, 'PS_SMARTY_FORCE_COMPILE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, NULL, NULL, 'PS_DISTANCE_UNIT', 'km', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, NULL, NULL, 'PS_STORES_DISPLAY_CMS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, NULL, NULL, 'PS_STORES_DISPLAY_FOOTER', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, NULL, NULL, 'PS_STORES_SIMPLIFIED', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, NULL, NULL, 'SHOP_LOGO_WIDTH', '243', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, NULL, NULL, 'SHOP_LOGO_HEIGHT', '120', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, NULL, NULL, 'EDITORIAL_IMAGE_WIDTH', '530', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, NULL, NULL, 'EDITORIAL_IMAGE_HEIGHT', '228', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, NULL, NULL, 'PS_STATSDATA_CUSTOMER_PAGESVIEWS', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, NULL, NULL, 'PS_STATSDATA_PAGESVIEWS', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, NULL, NULL, 'PS_STATSDATA_PLUGINS', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, NULL, NULL, 'PS_GEOLOCATION_ENABLED', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, NULL, NULL, 'PS_ALLOWED_COUNTRIES', 'AF;ZA;AX;AL;DZ;DE;AD;AO;AI;AQ;AG;AN;SA;AR;AM;AW;AU;AT;AZ;BS;BH;BD;BB;BY;BE;BZ;BJ;BM;BT;BO;BA;BW;BV;BR;BN;BG;BF;MM;BI;KY;KH;CM;CA;CV;CF;CL;CN;CX;CY;CC;CO;KM;CG;CD;CK;KR;KP;CR;CI;HR;CU;DK;DJ;DM;EG;IE;SV;AE;EC;ER;ES;EE;ET;FK;FO;FJ;FI;FR;GA;GM;GE;GS;GH;GI;GR;GD;GL;GP;GU;GT;GG;GN;GQ;GW;GY;GF;HT;HM;HN;HK;HU;IM;MU;VG;VI;IN;ID;IR;IQ;IS;IL;IT;JM;JP;JE;JO;KZ;KE;KG;KI;KW;LA;LS;LV;LB;LR;LY;LI;LT;LU;MO;MK;MG;MY;MW;MV;ML;MT;MP;MA;MH;MQ;MR;YT;MX;FM;MD;MC;MN;ME;MS;MZ;NA;NR;NP;NI;NE;NG;NU;NF;NO;NC;NZ;IO;OM;UG;UZ;PK;PW;PS;PA;PG;PY;NL;PE;PH;PN;PL;PF;PR;PT;QA;DO;CZ;RE;RO;GB;RU;RW;EH;BL;KN;SM;MF;PM;VA;VC;LC;SB;WS;AS;ST;SN;RS;SC;SL;SG;SK;SI;SO;SD;LK;SE;CH;SR;SJ;SZ;SY;TJ;TW;TZ;TD;TF;TH;TL;TG;TK;TO;TT;TN;TM;TC;TR;TV;UA;UY;US;VU;VE;VN;WF;YE;ZM;ZW', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, NULL, NULL, 'PS_GEOLOCATION_BEHAVIOR', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, NULL, NULL, 'PS_LOCALE_LANGUAGE', 'en', '0000-00-00 00:00:00', '2025-08-07 02:32:18'),
(115, NULL, NULL, 'PS_LOCALE_COUNTRY', 'us', '0000-00-00 00:00:00', '2025-08-07 02:32:18'),
(116, NULL, NULL, 'PS_ATTACHMENT_MAXIMUM_SIZE', '8', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, NULL, NULL, 'PS_SMARTY_CACHE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, NULL, NULL, 'PS_DIMENSION_UNIT', 'ft', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, NULL, NULL, 'PS_GUEST_CHECKOUT_ENABLED', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, NULL, NULL, 'PS_OVERBOOKING_ORDER_ACTION', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, NULL, NULL, 'PS_MAX_OVERBOOKING_PER_HOTEL_PER_DAY', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, NULL, NULL, 'PS_ORDER_CONF_MAIL_TO_CUSTOMER', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, NULL, NULL, 'PS_ORDER_CONF_MAIL_TO_SUPERADMIN', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, NULL, NULL, 'PS_ORDER_CONF_MAIL_TO_HOTEL_MANAGER', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, NULL, NULL, 'PS_ORDER_CONF_MAIL_TO_EMPLOYEE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, NULL, NULL, 'PS_DISPLAY_SUPPLIERS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, NULL, NULL, 'PS_DISPLAY_BEST_SELLERS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, NULL, NULL, 'PS_CATALOG_MODE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, NULL, NULL, 'PS_GEOLOCATION_WHITELIST', '127;209.185.108;209.185.253;209.85.238;209.85.238.11;209.85.238.4;216.239.33.96;216.239.33.97;216.239.33.98;216.239.33.99;216.239.37.98;216.239.37.99;216.239.39.98;216.239.39.99;216.239.41.96;216.239.41.97;216.239.41.98;216.239.41.99;216.239.45.4;216.239.46;216.239.51.96;216.239.51.97;216.239.51.98;216.239.51.99;216.239.53.98;216.239.53.99;216.239.57.96;91.240.109;216.239.57.97;216.239.57.98;216.239.57.99;216.239.59.98;216.239.59.99;216.33.229.163;64.233.173.193;64.233.173.194;64.233.173.195;64.233.173.196;64.233.173.197;64.233.173.198;64.233.173.199;64.233.173.200;64.233.173.201;64.233.173.202;64.233.173.203;64.233.173.204;64.233.173.205;64.233.173.206;64.233.173.207;64.233.173.208;64.233.173.209;64.233.173.210;64.233.173.211;64.233.173.212;64.233.173.213;64.233.173.214;64.233.173.215;64.233.173.216;64.233.173.217;64.233.173.218;64.233.173.219;64.233.173.220;64.233.173.221;64.233.173.222;64.233.173.223;64.233.173.224;64.233.173.225;64.233.173.226;64.233.173.227;64.233.173.228;64.233.173.229;64.233.173.230;64.233.173.231;64.233.173.232;64.233.173.233;64.233.173.234;64.233.173.235;64.233.173.236;64.233.173.237;64.233.173.238;64.233.173.239;64.233.173.240;64.233.173.241;64.233.173.242;64.233.173.243;64.233.173.244;64.233.173.245;64.233.173.246;64.233.173.247;64.233.173.248;64.233.173.249;64.233.173.250;64.233.173.251;64.233.173.252;64.233.173.253;64.233.173.254;64.233.173.255;64.68.80;64.68.81;64.68.82;64.68.83;64.68.84;64.68.85;64.68.86;64.68.87;64.68.88;64.68.89;64.68.90.1;64.68.90.10;64.68.90.11;64.68.90.12;64.68.90.129;64.68.90.13;64.68.90.130;64.68.90.131;64.68.90.132;64.68.90.133;64.68.90.134;64.68.90.135;64.68.90.136;64.68.90.137;64.68.90.138;64.68.90.139;64.68.90.14;64.68.90.140;64.68.90.141;64.68.90.142;64.68.90.143;64.68.90.144;64.68.90.145;64.68.90.146;64.68.90.147;64.68.90.148;64.68.90.149;64.68.90.15;64.68.90.150;64.68.90.151;64.68.90.152;64.68.90.153;64.68.90.154;64.68.90.155;64.68.90.156;64.68.90.157;64.68.90.158;64.68.90.159;64.68.90.16;64.68.90.160;64.68.90.161;64.68.90.162;64.68.90.163;64.68.90.164;64.68.90.165;64.68.90.166;64.68.90.167;64.68.90.168;64.68.90.169;64.68.90.17;64.68.90.170;64.68.90.171;64.68.90.172;64.68.90.173;64.68.90.174;64.68.90.175;64.68.90.176;64.68.90.177;64.68.90.178;64.68.90.179;64.68.90.18;64.68.90.180;64.68.90.181;64.68.90.182;64.68.90.183;64.68.90.184;64.68.90.185;64.68.90.186;64.68.90.187;64.68.90.188;64.68.90.189;64.68.90.19;64.68.90.190;64.68.90.191;64.68.90.192;64.68.90.193;64.68.90.194;64.68.90.195;64.68.90.196;64.68.90.197;64.68.90.198;64.68.90.199;64.68.90.2;64.68.90.20;64.68.90.200;64.68.90.201;64.68.90.202;64.68.90.203;64.68.90.204;64.68.90.205;64.68.90.206;64.68.90.207;64.68.90.208;64.68.90.21;64.68.90.22;64.68.90.23;64.68.90.24;64.68.90.25;64.68.90.26;64.68.90.27;64.68.90.28;64.68.90.29;64.68.90.3;64.68.90.30;64.68.90.31;64.68.90.32;64.68.90.33;64.68.90.34;64.68.90.35;64.68.90.36;64.68.90.37;64.68.90.38;64.68.90.39;64.68.90.4;64.68.90.40;64.68.90.41;64.68.90.42;64.68.90.43;64.68.90.44;64.68.90.45;64.68.90.46;64.68.90.47;64.68.90.48;64.68.90.49;64.68.90.5;64.68.90.50;64.68.90.51;64.68.90.52;64.68.90.53;64.68.90.54;64.68.90.55;64.68.90.56;64.68.90.57;64.68.90.58;64.68.90.59;64.68.90.6;64.68.90.60;64.68.90.61;64.68.90.62;64.68.90.63;64.68.90.64;64.68.90.65;64.68.90.66;64.68.90.67;64.68.90.68;64.68.90.69;64.68.90.7;64.68.90.70;64.68.90.71;64.68.90.72;64.68.90.73;64.68.90.74;64.68.90.75;64.68.90.76;64.68.90.77;64.68.90.78;64.68.90.79;64.68.90.8;64.68.90.80;64.68.90.9;64.68.91;64.68.92;66.249.64;66.249.65;66.249.66;66.249.67;66.249.68;66.249.69;66.249.70;66.249.71;66.249.72;66.249.73;66.249.78;66.249.79;72.14.199;8.6.48', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, NULL, NULL, 'PS_LOGS_BY_EMAIL', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, NULL, NULL, 'PS_COOKIE_CHECKIP', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, NULL, NULL, 'PS_STORES_CENTER_LAT', '25.948969', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, NULL, NULL, 'PS_STORES_CENTER_LONG', '-80.226439', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, NULL, NULL, 'PS_USE_ECOTAX', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, NULL, NULL, 'PS_CANONICAL_REDIRECT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, NULL, NULL, 'PS_IMG_UPDATE_TIME', '1324977642', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, NULL, NULL, 'PS_BACKUP_DROP_TABLE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, NULL, NULL, 'PS_OS_AWAITING_PAYMENT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, NULL, NULL, 'PS_OS_PAYMENT_ACCEPTED', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, NULL, NULL, 'PS_OS_PROCESSING', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, NULL, NULL, 'PS_OS_CANCELED', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, NULL, NULL, 'PS_OS_REFUND', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, NULL, NULL, 'PS_OS_ERROR', '6', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, NULL, NULL, 'PS_OS_OUTOFSTOCK', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, NULL, NULL, 'PS_OS_OUTOFSTOCK_PAID', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, NULL, NULL, 'PS_OS_OVERBOOKING_PAID', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, NULL, NULL, 'PS_OS_PARTIAL_PAYMENT_ACCEPTED', '8', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, NULL, NULL, 'PS_OS_AWAITING_REMOTE_PAYMENT', '9', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, NULL, NULL, 'PS_OS_WS_PAYMENT', '10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, NULL, NULL, 'PS_OS_REMOTE_PAYMENT_ACCEPTED', '10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, NULL, NULL, 'PS_OS_OUTOFSTOCK_UNPAID', '11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, NULL, NULL, 'PS_OS_OVERBOOKING_UNPAID', '11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, NULL, NULL, 'PS_OS_OVERBOOKING_PARTIAL_PAID', '12', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, NULL, NULL, 'PS_ORS_PENDING', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, NULL, NULL, 'PS_ORS_DENIED', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, NULL, NULL, 'PS_ORS_REFUNDED', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, NULL, NULL, 'PS_LEGACY_IMAGES', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, NULL, NULL, 'PS_IMAGE_QUALITY', 'png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, NULL, NULL, 'PS_PNG_QUALITY', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, NULL, NULL, 'PS_JPEG_QUALITY', '90', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, NULL, NULL, 'PS_COOKIE_LIFETIME_FO', '480', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, NULL, NULL, 'PS_COOKIE_LIFETIME_BO', '480', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, NULL, NULL, 'PS_COOKIE_SAMESITE', 'Lax', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, NULL, NULL, 'PS_RESTRICT_DELIVERED_COUNTRIES', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, NULL, NULL, 'PS_SHOW_NEW_ORDERS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, NULL, NULL, 'PS_SHOW_NEW_CUSTOMERS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, NULL, NULL, 'PS_SHOW_NEW_MESSAGES', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, NULL, NULL, 'PS_FEATURE_FEATURE_ACTIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, NULL, NULL, 'PS_COMBINATION_FEATURE_ACTIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, NULL, NULL, 'PS_SPECIFIC_PRICE_FEATURE_ACTIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, NULL, NULL, 'PS_SCENE_FEATURE_ACTIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, NULL, NULL, 'PS_VIRTUAL_PROD_FEATURE_ACTIVE', '1', '0000-00-00 00:00:00', '2025-08-07 02:32:23'),
(173, NULL, NULL, 'PS_CUSTOMIZATION_FEATURE_ACTIVE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, NULL, NULL, 'PS_CART_RULE_FEATURE_ACTIVE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, NULL, NULL, 'PS_PACK_FEATURE_ACTIVE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, NULL, NULL, 'PS_ALIAS_FEATURE_ACTIVE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, NULL, NULL, 'PS_TAX_ADDRESS_TYPE', 'id_address_invoice', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, NULL, NULL, 'PS_SHOP_DEFAULT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, NULL, NULL, 'PS_CARRIER_DEFAULT_SORT', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, NULL, NULL, 'PS_STOCK_MVT_INC_REASON_DEFAULT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, NULL, NULL, 'PS_STOCK_MVT_DEC_REASON_DEFAULT', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, NULL, NULL, 'PS_ADVANCED_STOCK_MANAGEMENT', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, NULL, NULL, 'PS_ADMINREFRESH_NOTIFICATION', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, NULL, NULL, 'PS_STOCK_MVT_TRANSFER_TO', '7', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, NULL, NULL, 'PS_STOCK_MVT_TRANSFER_FROM', '6', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, NULL, NULL, 'PS_CARRIER_DEFAULT_ORDER', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, NULL, NULL, 'PS_STOCK_MVT_SUPPLY_ORDER', '8', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, NULL, NULL, 'PS_STOCK_CUSTOMER_ORDER_REASON', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, NULL, NULL, 'PS_UNIDENTIFIED_GROUP', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, NULL, NULL, 'PS_GUEST_GROUP', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, NULL, NULL, 'PS_CUSTOMER_GROUP', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, NULL, NULL, 'PS_SMARTY_CONSOLE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, NULL, NULL, 'PS_INVOICE_MODEL', 'invoice', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, NULL, NULL, 'PS_LIMIT_UPLOAD_IMAGE_VALUE', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, NULL, NULL, 'PS_LIMIT_UPLOAD_FILE_VALUE', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, NULL, NULL, 'MB_PAY_TO_EMAIL', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, NULL, NULL, 'MB_SECRET_WORD', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, NULL, NULL, 'MB_HIDE_LOGIN', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, NULL, NULL, 'MB_ID_LOGO', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, NULL, NULL, 'MB_ID_LOGO_WALLET', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, NULL, NULL, 'MB_PARAMETERS', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, NULL, NULL, 'MB_PARAMETERS_2', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, NULL, NULL, 'MB_DISPLAY_MODE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, NULL, NULL, 'MB_CANCEL_URL', 'http://www.yoursite.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, NULL, NULL, 'MB_LOCAL_METHODS', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, NULL, NULL, 'MB_INTER_METHODS', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, NULL, NULL, 'BANK_WIRE_CURRENCIES', '2,1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, NULL, NULL, 'CHEQUE_CURRENCIES', '2,1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, NULL, NULL, 'PRODUCTS_VIEWED_NBR', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, NULL, NULL, 'BLOCK_CATEG_DHTML', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, NULL, NULL, 'BLOCK_CATEG_MAX_DEPTH', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, NULL, NULL, 'MANUFACTURER_DISPLAY_FORM', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, NULL, NULL, 'MANUFACTURER_DISPLAY_TEXT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, NULL, NULL, 'MANUFACTURER_DISPLAY_TEXT_NB', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, NULL, NULL, 'NEW_PRODUCTS_NBR', '8', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, NULL, NULL, 'PS_TOKEN_ENABLE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, NULL, NULL, 'PS_STATS_RENDER', 'graphnvd3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, NULL, NULL, 'PS_STATS_OLD_CONNECT_AUTO_CLEAN', 'never', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, NULL, NULL, 'PS_STATS_GRID_RENDER', 'gridhtml', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, NULL, NULL, 'BLOCKTAGS_NBR', '10', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, NULL, NULL, 'HOTEL_CHECKUP_DESCRIPTIONS_LT', '100', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, NULL, NULL, 'HOTEL_CHECKUP_DESCRIPTIONS_GT', '400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, NULL, NULL, 'HOTEL_CHECKUP_IMAGES_LT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, NULL, NULL, 'HOTEL_CHECKUP_IMAGES_GT', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, NULL, NULL, 'HOTEL_CHECKUP_ORDERS_LT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, NULL, NULL, 'HOTEL_CHECKUP_ORDERS_GT', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, NULL, NULL, 'HOTEL_CHECKUP_TOTAL_ROOMS_LT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, NULL, NULL, 'HOTEL_CHECKUP_TOTAL_ROOMS_GT', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, NULL, NULL, 'ROOM_TYPE_CHECKUP_DESCRIPTIONS_LT', '100', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, NULL, NULL, 'ROOM_TYPE_CHECKUP_DESCRIPTIONS_GT', '400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, NULL, NULL, 'ROOM_TYPE_CHECKUP_IMAGES_LT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, NULL, NULL, 'ROOM_TYPE_CHECKUP_IMAGES_GT', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, NULL, NULL, 'ROOM_TYPE_CHECKUP_ORDERS_LT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, NULL, NULL, 'ROOM_TYPE_CHECKUP_ORDERS_GT', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, NULL, NULL, 'ROOM_TYPE_CHECKUP_TOTAL_ROOMS_LT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, NULL, NULL, 'ROOM_TYPE_CHECKUP_TOTAL_ROOMS_GT', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, NULL, NULL, 'SERVICE_CHECKUP_DESCRIPTIONS_SHORT_LT', '50', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, NULL, NULL, 'SERVICE_CHECKUP_DESCRIPTIONS_GT', '150', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, NULL, NULL, 'SERVICE_CHECKUP_IMAGES_LT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, NULL, NULL, 'SERVICE_CHECKUP_IMAGES_GT', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, NULL, NULL, 'SERVICE_CHECKUP_ORDERS_LT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, NULL, NULL, 'SERVICE_CHECKUP_ORDERS_GT', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, NULL, NULL, 'FOOTER_CMS', '0_3|0_4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, NULL, NULL, 'FOOTER_BLOCK_ACTIVATION', '0_3|0_4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, NULL, NULL, 'FOOTER_POWEREDBY', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, NULL, NULL, 'BLOCKADVERT_LINK', 'https://qloapps.com/', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, NULL, NULL, 'BLOCKADVERT_IMG_EXT', 'jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, NULL, NULL, 'MOD_BLOCKTOPMENU_ITEMS', 'CAT3,CAT8,CAT5,LNK1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, NULL, NULL, 'MOD_BLOCKTOPMENU_SEARCH', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, NULL, NULL, 'BLOCKSOCIAL_FACEBOOK', 'https://www.facebook.com/qloapps', '0000-00-00 00:00:00', '2025-08-07 02:32:32'),
(251, NULL, NULL, 'BLOCKSOCIAL_TWITTER', 'https://twitter.com/qloapps', '0000-00-00 00:00:00', '2025-08-07 02:32:32'),
(252, NULL, NULL, 'SUPPLIER_DISPLAY_TEXT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, NULL, NULL, 'SUPPLIER_DISPLAY_TEXT_NB', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, NULL, NULL, 'SUPPLIER_DISPLAY_FORM', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, NULL, NULL, 'BLOCK_CATEG_NBR_COLUMN_FOOTER', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, NULL, NULL, 'UPGRADER_BACKUPDB_FILENAME', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, NULL, NULL, 'UPGRADER_BACKUPFILES_FILENAME', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, NULL, NULL, 'BLOCKREINSURANCE_NBBLOCKS', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, NULL, NULL, 'PS_BASE_DISTANCE_UNIT', 'm', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, NULL, NULL, 'PS_SHOP_DOMAIN', 'localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, NULL, NULL, 'PS_SHOP_DOMAIN_SSL', 'localhost', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, NULL, NULL, 'PS_SHOP_NAME', 'Lisboa Hotels', '0000-00-00 00:00:00', '2025-08-07 02:32:18'),
(263, NULL, NULL, 'PS_SHOP_EMAIL', 'hotelprime@htl.com', '0000-00-00 00:00:00', '2025-08-07 02:32:22'),
(264, NULL, NULL, 'PS_MAIL_METHOD', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, NULL, NULL, 'PS_MAIL_SUBJECT_PREFIX', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, NULL, NULL, 'PS_SHOP_ACTIVITY', NULL, '0000-00-00 00:00:00', '2025-08-07 02:32:18'),
(267, NULL, NULL, 'PS_LOGO', 'logo.jpg', '0000-00-00 00:00:00', '2025-08-07 02:32:22'),
(268, NULL, NULL, 'PS_FAVICON', 'favicon.ico', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, NULL, NULL, 'PS_STORES_ICON', 'logo_stores.gif', '0000-00-00 00:00:00', '2025-08-07 02:32:22'),
(270, NULL, NULL, 'PS_ROOT_CATEGORY', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, NULL, NULL, 'PS_HOME_CATEGORY', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, NULL, NULL, 'PS_LOCATIONS_CATEGORY', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, NULL, NULL, 'PS_SERVICE_CATEGORY', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, NULL, NULL, 'PS_CONFIGURATION_AGREMENT', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, NULL, NULL, 'PS_MAIL_SERVER', 'smtp.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, NULL, NULL, 'PS_MAIL_USER', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, NULL, NULL, 'PS_MAIL_PASSWD', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, NULL, NULL, 'PS_MAIL_SMTP_ENCRYPTION', 'off', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, NULL, NULL, 'PS_MAIL_SMTP_PORT', '25', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, NULL, NULL, 'PS_MAIL_COLOR', '#db3484', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, NULL, NULL, 'NW_SALT', 'NpRqfffnuPa8EnXX', '0000-00-00 00:00:00', '2025-08-07 02:32:32'),
(282, NULL, NULL, 'PS_PAYMENT_LOGO_CMS_ID', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, NULL, NULL, 'HOME_FEATURED_NBR', '8', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, NULL, NULL, 'SEK_MIN_OCCURENCES', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, NULL, NULL, 'SEK_FILTER_KW', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, NULL, NULL, 'PS_ALLOW_MOBILE_DEVICE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, NULL, NULL, 'PS_CUSTOMER_CREATION_EMAIL', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, NULL, NULL, 'PS_SMARTY_CONSOLE_KEY', 'SMARTY_DEBUG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, NULL, NULL, 'PS_DASHBOARD_USE_PUSH', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, NULL, NULL, 'PS_ATTRIBUTE_ANCHOR_SEPARATOR', '-', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, NULL, NULL, 'CONF_AVERAGE_PRODUCT_MARGIN', '40', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, NULL, NULL, 'PS_DASHBOARD_SIMULATION', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, NULL, NULL, 'PS_QUICK_VIEW', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, NULL, NULL, 'PS_USE_HTMLPURIFIER', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, NULL, NULL, 'PS_SMARTY_CACHING_TYPE', 'filesystem', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, NULL, NULL, 'PS_SMARTY_CLEAR_CACHE', 'everytime', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, NULL, NULL, 'PS_DETECT_LANG', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, NULL, NULL, 'PS_DETECT_COUNTRY', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, NULL, NULL, 'PS_ROUND_TYPE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, NULL, NULL, 'PS_PRICE_DISPLAY_PRECISION', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, NULL, NULL, 'PS_LOG_EMAILS', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, NULL, NULL, 'PS_CUSTOMER_BIRTHDATE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, NULL, NULL, 'PS_CUSTOMER_NWSL', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, NULL, NULL, 'PS_CUSTOMER_OPTIN', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, NULL, NULL, 'PS_KPI_FREQUENT_CUSTOMER_NB_ORDERS', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, NULL, NULL, 'PS_KPI_REVPAC_NB_DAYS', '30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, NULL, NULL, 'PS_KPI_CONVERSION_RATE_NB_DAYS', '30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, NULL, NULL, 'PS_ORDER_KPI_AVG_ORDER_VALUE_NB_DAYS', '30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, NULL, NULL, 'PS_ORDER_KPI_PER_VISITOR_PROFIT_NB_DAYS', '30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, NULL, NULL, 'PS_KPI_NEW_CUSTOMERS_NB_DAYS', '30', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, NULL, NULL, 'PS_PACK_STOCK_TYPE', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, NULL, NULL, 'PS_LOG_MODULE_PERFS_MODULO', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, NULL, NULL, 'PS_DISALLOW_HISTORY_REORDERING', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, NULL, NULL, 'PS_DISPLAY_PRODUCT_WEIGHT', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, NULL, NULL, 'PS_PRODUCT_WEIGHT_PRECISION', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, NULL, NULL, 'PS_ADVANCED_PAYMENT_API', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, NULL, NULL, 'PS_SERVICE_PRODUCT_CATEGORY_FILTER', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, NULL, NULL, 'PS_BACKDATE_ORDER_SUPERADMIN', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, NULL, NULL, 'PS_BACKDATE_ORDER_EMPLOYEES', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, NULL, NULL, 'PS_CUSTOMER_SERVICE_REQUIRED_NAME', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, NULL, NULL, 'PS_CUSTOMER_SERVICE_DISPLAY_NAME', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, NULL, NULL, 'PS_CUSTOMER_SERVICE_REQUIRED_PHONE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, NULL, NULL, 'PS_CUSTOMER_SERVICE_DISPLAY_PHONE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, NULL, NULL, 'PS_CUSTOMER_SERVICE_DISPLAY_CONTACT', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, NULL, NULL, 'PS_STANDARD_PRODUCT_ORDER_ADDRESS_PREFRENCE', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, NULL, NULL, 'PS_CUSTOMER_GUEST_MAX_LIMIT', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, NULL, NULL, 'PS_SSL_ENABLED_EVERYWHERE', '0', '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(328, NULL, NULL, 'PRICE_DISPLAY_METHOD', '1', '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(329, NULL, NULL, 'WK_HOTEL_LOCATION_ENABLE', '1', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(330, NULL, NULL, 'WK_HOTEL_NAME_ENABLE', '1', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(331, NULL, NULL, 'WK_HOTEL_NAME_SEARCH_THRESHOLD', '5', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(332, NULL, NULL, 'WK_SEARCH_AUTO_FOCUS_NEXT_FIELD', '1', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(333, NULL, NULL, 'WK_ROOM_LEFT_WARNING_NUMBER', '10', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(334, NULL, NULL, 'WK_HTL_ESTABLISHMENT_YEAR', '2010', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(335, NULL, NULL, 'PS_SHOP_ADDR1', 'The Hotel Prime, Monticello Dr, Montgomery, 10010', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(336, NULL, NULL, 'PS_SHOP_PHONE', '0987654321', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(337, NULL, NULL, 'WK_CUSTOMER_SUPPORT_PHONE_NUMBER', '0987654321', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(338, NULL, NULL, 'WK_CUSTOMER_SUPPORT_EMAIL', 'hotelprime@htl.com', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(339, NULL, NULL, 'WK_DISPLAY_CONTACT_PAGE_HOTEL_LIST', '0', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(340, NULL, NULL, 'WK_TITLE_HEADER_BLOCK', 'Hotel Prime', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(341, NULL, NULL, 'WK_CONTENT_HEADER_BLOCK', 'Our hotel is the perfect destination for both business and leisure travelers seeking a memorable stay.', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(342, NULL, NULL, 'WK_HOTEL_HEADER_IMAGE', 'hotel_header_image.jpg', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(343, NULL, NULL, 'WK_ALLOW_ADVANCED_PAYMENT', '1', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(344, NULL, NULL, 'WK_ADVANCED_PAYMENT_GLOBAL_MIN_AMOUNT', '10', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(345, NULL, NULL, 'WK_ADVANCED_PAYMENT_INC_TAX', '1', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(346, NULL, NULL, 'WK_GLOBAL_CHILD_MAX_AGE', '15', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(347, NULL, NULL, 'WK_GLOBAL_MAX_CHILD_IN_ROOM', '0', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(348, NULL, NULL, 'PS_MAX_CHECKOUT_OFFSET', '365', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(349, NULL, NULL, 'PS_MIN_BOOKING_OFFSET', '0', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(350, NULL, NULL, 'HTL_FEATURE_PRICING_PRIORITY', 'specific_date;special_day;date_range', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(351, NULL, NULL, 'WK_GOOGLE_ACTIVE_MAP', '0', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(352, NULL, NULL, 'WK_MAP_HOTEL_ACTIVE_ONLY', '1', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(353, NULL, NULL, 'PS_LOGO_MAIL', 'logo_mail.jpg', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(354, NULL, NULL, 'PS_LOGO_INVOICE', 'logo_invoice.jpg', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(355, NULL, NULL, 'WK_HTL_CHAIN_NAME', NULL, '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(356, NULL, NULL, 'WK_HTL_TAG_LINE', NULL, '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(357, NULL, NULL, 'WK_HTL_SHORT_DESC', NULL, '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(358, NULL, NULL, 'WK_DIMENSION_UNIT', NULL, '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(359, NULL, NULL, 'PS_FRONT_SEARCH_TYPE', '1', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(360, NULL, NULL, 'PS_FRONT_OWS_SEARCH_ALGO_TYPE', '1', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(361, NULL, NULL, 'PS_FRONT_ROOM_UNIT_SELECTION_TYPE', '1', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(362, NULL, NULL, 'PS_BACKOFFICE_SEARCH_TYPE', '1', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(363, NULL, NULL, 'PS_BACKOFFICE_OWS_SEARCH_ALGO_TYPE', '2', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(364, NULL, NULL, 'PS_BACKOFFICE_ROOM_BOOKING_TYPE', '1', '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(365, NULL, NULL, 'WK_PRIMARY_HOTEL', '1', '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(366, NULL, NULL, 'BLOCKSOCIAL_RSS', NULL, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(367, NULL, NULL, 'BLOCKSOCIAL_YOUTUBE', NULL, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(368, NULL, NULL, 'BLOCKSOCIAL_PINTEREST', NULL, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(369, NULL, NULL, 'BLOCKSOCIAL_VIMEO', NULL, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(370, NULL, NULL, 'BLOCKSOCIAL_INSTAGRAM', NULL, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(371, NULL, NULL, 'SHOW_AMENITIES_FILTER', '1', '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(372, NULL, NULL, 'SHOW_PRICE_FILTER', '1', '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(373, NULL, NULL, 'HOTEL_INTERIOR_HEADING', NULL, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(374, NULL, NULL, 'HOTEL_INTERIOR_DESCRIPTION', NULL, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(375, NULL, NULL, 'HOTEL_AMENITIES_HEADING', NULL, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(376, NULL, NULL, 'HOTEL_AMENITIES_DESCRIPTION', NULL, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(377, NULL, NULL, 'HOTEL_ROOM_DISPLAY_HEADING', NULL, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(378, NULL, NULL, 'HOTEL_ROOM_DISPLAY_DESCRIPTION', NULL, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(379, NULL, NULL, 'HOTEL_TESIMONIAL_BLOCK_HEADING', NULL, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(380, NULL, NULL, 'HOTEL_TESIMONIAL_BLOCK_CONTENT', NULL, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(381, NULL, NULL, 'CONF_BANKWIRE_FIXED', '0.2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(382, NULL, NULL, 'CONF_BANKWIRE_VAR', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(383, NULL, NULL, 'CONF_BANKWIRE_FIXED_FOREIGN', '0.2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(384, NULL, NULL, 'CONF_BANKWIRE_VAR_FOREIGN', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(385, NULL, NULL, 'CONF_CHEQUE_FIXED', '0.2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(386, NULL, NULL, 'CONF_CHEQUE_VAR', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(387, NULL, NULL, 'CONF_CHEQUE_FIXED_FOREIGN', '0.2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(388, NULL, NULL, 'CONF_CHEQUE_VAR_FOREIGN', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(389, NULL, NULL, 'QHR_ADMIN_APPROVAL_ENABLED', '1', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(390, NULL, NULL, 'QHR_MAX_IMAGES_PER_REVIEW', '5', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(391, NULL, NULL, 'QHR_REVIEWS_AT_ONCE', '5', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(392, NULL, NULL, 'QHR_REVIEW_APPROVAL_EMAIL_ENABLED', '0', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(393, NULL, NULL, 'QHR_REVIEW_MGMT_REPLY_EMAIL_ENABLED', '0', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(394, NULL, NULL, 'WK_SHOW_FOOTER_NAVIGATION_BLOCK', '1', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(395, NULL, NULL, 'DASHACTIVITY_CART_ACTIVE', '30', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(396, NULL, NULL, 'DASHACTIVITY_CART_ABANDONED_MIN', '24', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(397, NULL, NULL, 'DASHACTIVITY_CART_ABANDONED_MAX', '48', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(398, NULL, NULL, 'DASHACTIVITY_VISITOR_ONLINE', '30', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(399, NULL, NULL, 'DASHPRODUCT_NBR_SHOW_LAST_ORDER', '10', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(400, NULL, NULL, 'DASHPRODUCT_NBR_SHOW_BEST_SELLER', '10', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(401, NULL, NULL, 'DASHPRODUCT_NBR_SHOW_MOST_VIEWED', '10', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(402, NULL, NULL, 'DASHPRODUCT_NBR_SHOW_TOP_SEARCH', '10', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(403, NULL, NULL, 'PS_DASHGOALS_CURRENT_YEAR', '2025', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(404, NULL, NULL, 'PS_BLOCK_CART_XSELL_LIMIT', '12', '2025-08-07 02:32:34', '2025-08-07 02:32:34'),
(405, NULL, NULL, 'PS_BLOCK_CART_SHOW_CROSSSELLING', '1', '2025-08-07 02:32:34', '2025-08-07 02:32:34'),
(406, NULL, NULL, 'PS_WEBSERVICE', '1', '2025-08-07 02:41:02', '2025-08-07 02:41:02'),
(407, NULL, NULL, 'PS_WEBSERVICE_CGI_HOST', '0', '2025-08-07 02:41:02', '2025-08-07 02:41:02');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_configuration_kpi`
--

CREATE TABLE `qlo_configuration_kpi` (
  `id_configuration_kpi` int(10) UNSIGNED NOT NULL,
  `id_shop_group` int(11) UNSIGNED DEFAULT NULL,
  `id_shop` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `value` text DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_configuration_kpi`
--

INSERT INTO `qlo_configuration_kpi` (`id_configuration_kpi`, `id_shop_group`, `id_shop`, `name`, `value`, `date_add`, `date_upd`) VALUES
(1, NULL, NULL, 'DASHGOALS_TRAFFIC_01_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(2, NULL, NULL, 'DASHGOALS_CONVERSION_01_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(3, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_01_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(4, NULL, NULL, 'DASHGOALS_TRAFFIC_02_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(5, NULL, NULL, 'DASHGOALS_CONVERSION_02_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(6, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_02_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(7, NULL, NULL, 'DASHGOALS_TRAFFIC_03_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(8, NULL, NULL, 'DASHGOALS_CONVERSION_03_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(9, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_03_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(10, NULL, NULL, 'DASHGOALS_TRAFFIC_04_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(11, NULL, NULL, 'DASHGOALS_CONVERSION_04_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(12, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_04_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(13, NULL, NULL, 'DASHGOALS_TRAFFIC_05_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(14, NULL, NULL, 'DASHGOALS_CONVERSION_05_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(15, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_05_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(16, NULL, NULL, 'DASHGOALS_TRAFFIC_06_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(17, NULL, NULL, 'DASHGOALS_CONVERSION_06_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(18, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_06_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(19, NULL, NULL, 'DASHGOALS_TRAFFIC_07_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(20, NULL, NULL, 'DASHGOALS_CONVERSION_07_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(21, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_07_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(22, NULL, NULL, 'DASHGOALS_TRAFFIC_08_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(23, NULL, NULL, 'DASHGOALS_CONVERSION_08_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(24, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_08_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(25, NULL, NULL, 'DASHGOALS_TRAFFIC_09_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(26, NULL, NULL, 'DASHGOALS_CONVERSION_09_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(27, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_09_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(28, NULL, NULL, 'DASHGOALS_TRAFFIC_10_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(29, NULL, NULL, 'DASHGOALS_CONVERSION_10_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(30, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_10_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(31, NULL, NULL, 'DASHGOALS_TRAFFIC_11_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(32, NULL, NULL, 'DASHGOALS_CONVERSION_11_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(33, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_11_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(34, NULL, NULL, 'DASHGOALS_TRAFFIC_12_2025', '600', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(35, NULL, NULL, 'DASHGOALS_CONVERSION_12_2025', '2', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(36, NULL, NULL, 'DASHGOALS_AVG_CART_VALUE_12_2025', '80', '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(37, NULL, NULL, 'DISABLED_ROOM_TYPES', '0', '2025-08-08 20:33:47', '2025-08-17 05:37:57'),
(38, NULL, NULL, 'DISABLED_ROOM_TYPES_EXPIRE', '1755430685', '2025-08-08 20:33:47', '2025-08-17 05:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_configuration_kpi_lang`
--

CREATE TABLE `qlo_configuration_kpi_lang` (
  `id_configuration_kpi` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `value` text DEFAULT NULL,
  `date_upd` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_configuration_lang`
--

CREATE TABLE `qlo_configuration_lang` (
  `id_configuration` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `value` text DEFAULT NULL,
  `date_upd` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_configuration_lang`
--

INSERT INTO `qlo_configuration_lang` (`id_configuration`, `id_lang`, `value`, `date_upd`) VALUES
(48, 1, '#IN', NULL),
(51, 1, '#DE', NULL),
(53, 1, '#RE', NULL),
(59, 1, 'a|about|above|after|again|against|all|am|an|and|any|are|aren|as|at|be|because|been|before|being|below|between|both|but|by|can|cannot|could|couldn|did|didn|do|does|doesn|doing|don|down|during|each|few|for|from|further|had|hadn|has|hasn|have|haven|having|he|ll|her|here|hers|herself|him|himself|his|how|ve|if|in|into|is|isn|it|its|itself|let|me|more|most|mustn|my|myself|no|nor|not|of|off|on|once|only|or|other|ought|our|ours|ourselves|out|over|own|same|shan|she|should|shouldn|so|some|such|than|that|the|their|theirs|them|themselves|then|there|these|they|re|this|those|through|to|too|under|until|up|very|was|wasn|we|were|weren|what|when|where|which|while|who|whom|why|with|won|would|wouldn|you|your|yours|yourself|yourselves', NULL),
(84, 1, '0', NULL),
(90, 1, 'Dear Customer,\r\n\r\nRegards,\r\nCustomer service', NULL),
(355, 1, 'Hotel Prime', '2025-08-07 02:32:22'),
(356, 1, 'A place where comfort and luxury are blended with nature!', '2025-08-07 02:32:22'),
(357, 1, 'We offer elegant rooms, gourmet dining, and attentive service for a memorable stay.', '2025-08-07 02:32:22'),
(358, 1, 'ft', '2025-08-07 02:32:22'),
(373, 1, 'Explore the Interiors!', '2025-08-07 02:32:32'),
(374, 1, 'Step into the sophisticated elegance of our hotel, where every detail is designed with your comfort in mind.', '2025-08-07 02:32:32'),
(375, 1, 'Amenities', '2025-08-07 02:32:33'),
(376, 1, 'Experience luxury at our hotel with top-notch amenities. Enjoy our fitness center, rejuvenating spa, serene outdoor pool, and exquisite dining.', '2025-08-07 02:32:33'),
(377, 1, 'Our Rooms', '2025-08-07 02:32:33'),
(378, 1, 'Relax in the comfort of our rooms. With modern amenities, serene decor, and stunning lake or city views, each room offers a peaceful retreat for your stay.', '2025-08-07 02:32:33'),
(379, 1, 'What our guests say?', '2025-08-07 02:32:33'),
(380, 1, 'Here are some valuable feedbacks from our guests.', '2025-08-07 02:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_connections`
--

CREATE TABLE `qlo_connections` (
  `id_connections` int(10) UNSIGNED NOT NULL,
  `id_shop_group` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_guest` int(10) UNSIGNED NOT NULL,
  `id_page` int(10) UNSIGNED NOT NULL,
  `ip_address` bigint(20) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_connections`
--

INSERT INTO `qlo_connections` (`id_connections`, `id_shop_group`, `id_shop`, `id_guest`, `id_page`, `ip_address`, `date_add`, `http_referer`) VALUES
(1, 1, 1, 1, 1, 2130706433, '2025-08-07 02:32:20', 'https://www.qloapps.com'),
(2, 1, 1, 2, 1, 0, '2025-08-08 05:04:45', ''),
(3, 1, 1, 2, 1, 0, '2025-08-08 06:06:24', ''),
(4, 1, 1, 2, 1, 0, '2025-08-08 07:33:26', ''),
(5, 1, 1, 2, 1, 0, '2025-08-08 15:18:03', ''),
(6, 1, 1, 2, 2, 0, '2025-08-08 20:48:21', ''),
(7, 1, 1, 2, 2, 0, '2025-08-08 22:06:15', ''),
(8, 1, 1, 2, 2, 0, '2025-08-08 22:06:15', ''),
(9, 1, 1, 2, 1, 0, '2025-08-12 22:56:07', ''),
(10, 1, 1, 2, 1, 0, '2025-08-19 17:35:45', ''),
(11, 1, 1, 2, 1, 0, '2025-08-19 18:55:18', ''),
(12, 1, 1, 2, 1, 0, '2025-08-20 03:01:16', '');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_connections_page`
--

CREATE TABLE `qlo_connections_page` (
  `id_connections` int(10) UNSIGNED NOT NULL,
  `id_page` int(10) UNSIGNED NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_connections_source`
--

CREATE TABLE `qlo_connections_source` (
  `id_connections_source` int(10) UNSIGNED NOT NULL,
  `id_connections` int(10) UNSIGNED NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `request_uri` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_connections_source`
--

INSERT INTO `qlo_connections_source` (`id_connections_source`, `id_connections`, `http_referer`, `request_uri`, `keywords`, `date_add`) VALUES
(1, 3, 'http://localhost:3000/', '', '', '2025-08-08 06:27:38');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_contact`
--

CREATE TABLE `qlo_contact` (
  `id_contact` int(10) UNSIGNED NOT NULL,
  `email` varchar(128) NOT NULL,
  `customer_service` tinyint(1) NOT NULL DEFAULT 0,
  `position` tinyint(2) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_contact`
--

INSERT INTO `qlo_contact` (`id_contact`, `email`, `customer_service`, `position`) VALUES
(1, 'queuebots1@gmail.com', 1, 0),
(2, 'queuebots1@gmail.com', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_contact_lang`
--

CREATE TABLE `qlo_contact_lang` (
  `id_contact` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_contact_lang`
--

INSERT INTO `qlo_contact_lang` (`id_contact`, `id_lang`, `name`, `description`) VALUES
(1, 1, 'Webmaster', 'If a technical problem occurs on this website'),
(2, 1, 'Customer service', 'For any query regarding a hotel or a booking');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_contact_shop`
--

CREATE TABLE `qlo_contact_shop` (
  `id_contact` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_contact_shop`
--

INSERT INTO `qlo_contact_shop` (`id_contact`, `id_shop`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_country`
--

CREATE TABLE `qlo_country` (
  `id_country` int(10) UNSIGNED NOT NULL,
  `id_zone` int(10) UNSIGNED NOT NULL,
  `id_currency` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `iso_code` varchar(3) NOT NULL,
  `call_prefix` int(10) NOT NULL DEFAULT 0,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `contains_states` tinyint(1) NOT NULL DEFAULT 0,
  `need_identification_number` tinyint(1) NOT NULL DEFAULT 0,
  `need_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `zip_code_format` varchar(12) NOT NULL DEFAULT '',
  `display_tax_label` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_country`
--

INSERT INTO `qlo_country` (`id_country`, `id_zone`, `id_currency`, `iso_code`, `call_prefix`, `active`, `contains_states`, `need_identification_number`, `need_zip_code`, `zip_code_format`, `display_tax_label`) VALUES
(1, 1, 0, 'DE', 49, 0, 0, 0, 1, 'NNNNN', 1),
(2, 1, 0, 'AT', 43, 0, 0, 0, 1, 'NNNN', 1),
(3, 1, 0, 'BE', 32, 0, 0, 0, 1, 'NNNN', 1),
(4, 2, 0, 'CA', 1, 0, 1, 0, 1, 'LNL NLN', 0),
(5, 3, 0, 'CN', 86, 0, 0, 0, 1, 'NNNNNN', 1),
(6, 1, 0, 'ES', 34, 0, 0, 1, 1, 'NNNNN', 1),
(7, 1, 0, 'FI', 358, 0, 0, 0, 1, 'NNNNN', 1),
(8, 1, 0, 'FR', 33, 0, 0, 0, 1, 'NNNNN', 1),
(9, 1, 0, 'GR', 30, 0, 0, 0, 1, 'NNNNN', 1),
(10, 1, 0, 'IT', 39, 0, 1, 0, 1, 'NNNNN', 1),
(11, 3, 0, 'JP', 81, 0, 1, 0, 1, 'NNN-NNNN', 1),
(12, 1, 0, 'LU', 352, 0, 0, 0, 1, 'NNNN', 1),
(13, 1, 0, 'NL', 31, 0, 0, 0, 1, 'NNNN LL', 1),
(14, 1, 0, 'PL', 48, 0, 0, 0, 1, 'NN-NNN', 1),
(15, 1, 0, 'PT', 351, 0, 0, 0, 1, 'NNNN-NNN', 1),
(16, 1, 0, 'CZ', 420, 0, 0, 0, 1, 'NNN NN', 1),
(17, 1, 0, 'GB', 44, 0, 0, 0, 1, '', 1),
(18, 1, 0, 'SE', 46, 0, 0, 0, 1, 'NNN NN', 1),
(19, 7, 0, 'CH', 41, 0, 0, 0, 1, 'NNNN', 1),
(20, 1, 0, 'DK', 45, 0, 0, 0, 1, 'NNNN', 1),
(21, 2, 0, 'US', 1, 1, 1, 0, 1, 'NNNNN', 0),
(22, 3, 0, 'HK', 852, 0, 0, 0, 0, '', 1),
(23, 7, 0, 'NO', 47, 0, 0, 0, 1, 'NNNN', 1),
(24, 5, 0, 'AU', 61, 0, 0, 0, 1, 'NNNN', 1),
(25, 3, 0, 'SG', 65, 0, 0, 0, 1, 'NNNNNN', 1),
(26, 1, 0, 'IE', 353, 0, 0, 0, 0, '', 1),
(27, 5, 0, 'NZ', 64, 0, 0, 0, 1, 'NNNN', 1),
(28, 3, 0, 'KR', 82, 0, 0, 0, 1, 'NNNNN', 1),
(29, 3, 0, 'IL', 972, 0, 0, 0, 1, 'NNNNNNN', 1),
(30, 4, 0, 'ZA', 27, 0, 0, 0, 1, 'NNNN', 1),
(31, 4, 0, 'NG', 234, 0, 0, 0, 1, '', 1),
(32, 4, 0, 'CI', 225, 0, 0, 0, 1, '', 1),
(33, 4, 0, 'TG', 228, 0, 0, 0, 1, '', 1),
(34, 6, 0, 'BO', 591, 0, 0, 0, 1, '', 1),
(35, 4, 0, 'MU', 230, 0, 0, 0, 1, '', 1),
(36, 1, 0, 'RO', 40, 0, 0, 0, 1, 'NNNNNN', 1),
(37, 1, 0, 'SK', 421, 0, 0, 0, 1, 'NNN NN', 1),
(38, 4, 0, 'DZ', 213, 0, 0, 0, 1, 'NNNNN', 1),
(39, 2, 0, 'AS', 0, 0, 0, 0, 1, '', 1),
(40, 7, 0, 'AD', 376, 0, 0, 0, 1, 'CNNN', 1),
(41, 4, 0, 'AO', 244, 0, 0, 0, 0, '', 1),
(42, 8, 0, 'AI', 0, 0, 0, 0, 1, '', 1),
(43, 2, 0, 'AG', 0, 0, 0, 0, 1, '', 1),
(44, 6, 0, 'AR', 54, 0, 1, 0, 1, 'LNNNNLLL', 1),
(45, 3, 0, 'AM', 374, 0, 0, 0, 1, 'NNNN', 1),
(46, 8, 0, 'AW', 297, 0, 0, 0, 1, '', 1),
(47, 3, 0, 'AZ', 994, 0, 0, 0, 1, 'CNNNN', 1),
(48, 2, 0, 'BS', 0, 0, 0, 0, 1, '', 1),
(49, 3, 0, 'BH', 973, 0, 0, 0, 1, '', 1),
(50, 3, 0, 'BD', 880, 0, 0, 0, 1, 'NNNN', 1),
(51, 2, 0, 'BB', 0, 0, 0, 0, 1, 'CNNNNN', 1),
(52, 7, 0, 'BY', 0, 0, 0, 0, 1, 'NNNNNN', 1),
(53, 8, 0, 'BZ', 501, 0, 0, 0, 0, '', 1),
(54, 4, 0, 'BJ', 229, 0, 0, 0, 0, '', 1),
(55, 2, 0, 'BM', 0, 0, 0, 0, 1, '', 1),
(56, 3, 0, 'BT', 975, 0, 0, 0, 1, '', 1),
(57, 4, 0, 'BW', 267, 0, 0, 0, 1, '', 1),
(58, 6, 0, 'BR', 55, 0, 0, 0, 1, 'NNNNN-NNN', 1),
(59, 3, 0, 'BN', 673, 0, 0, 0, 1, 'LLNNNN', 1),
(60, 4, 0, 'BF', 226, 0, 0, 0, 1, '', 1),
(61, 3, 0, 'MM', 95, 0, 0, 0, 1, '', 1),
(62, 4, 0, 'BI', 257, 0, 0, 0, 1, '', 1),
(63, 3, 0, 'KH', 855, 0, 0, 0, 1, 'NNNNN', 1),
(64, 4, 0, 'CM', 237, 0, 0, 0, 1, '', 1),
(65, 4, 0, 'CV', 238, 0, 0, 0, 1, 'NNNN', 1),
(66, 4, 0, 'CF', 236, 0, 0, 0, 1, '', 1),
(67, 4, 0, 'TD', 235, 0, 0, 0, 1, '', 1),
(68, 6, 0, 'CL', 56, 0, 0, 0, 1, 'NNN-NNNN', 1),
(69, 6, 0, 'CO', 57, 0, 0, 0, 1, 'NNNNNN', 1),
(70, 4, 0, 'KM', 269, 0, 0, 0, 1, '', 1),
(71, 4, 0, 'CD', 242, 0, 0, 0, 1, '', 1),
(72, 4, 0, 'CG', 243, 0, 0, 0, 1, '', 1),
(73, 8, 0, 'CR', 506, 0, 0, 0, 1, 'NNNNN', 1),
(74, 7, 0, 'HR', 385, 0, 0, 0, 1, 'NNNNN', 1),
(75, 8, 0, 'CU', 53, 0, 0, 0, 1, '', 1),
(76, 1, 0, 'CY', 357, 0, 0, 0, 1, 'NNNN', 1),
(77, 4, 0, 'DJ', 253, 0, 0, 0, 1, '', 1),
(78, 8, 0, 'DM', 0, 0, 0, 0, 1, '', 1),
(79, 8, 0, 'DO', 0, 0, 0, 0, 1, '', 1),
(80, 3, 0, 'TL', 670, 0, 0, 0, 1, '', 1),
(81, 6, 0, 'EC', 593, 0, 0, 0, 1, 'CNNNNNN', 1),
(82, 4, 0, 'EG', 20, 0, 0, 0, 1, 'NNNNN', 1),
(83, 8, 0, 'SV', 503, 0, 0, 0, 1, '', 1),
(84, 4, 0, 'GQ', 240, 0, 0, 0, 1, '', 1),
(85, 4, 0, 'ER', 291, 0, 0, 0, 1, '', 1),
(86, 1, 0, 'EE', 372, 0, 0, 0, 1, 'NNNNN', 1),
(87, 4, 0, 'ET', 251, 0, 0, 0, 1, '', 1),
(88, 8, 0, 'FK', 0, 0, 0, 0, 1, 'LLLL NLL', 1),
(89, 7, 0, 'FO', 298, 0, 0, 0, 1, '', 1),
(90, 5, 0, 'FJ', 679, 0, 0, 0, 1, '', 1),
(91, 4, 0, 'GA', 241, 0, 0, 0, 1, '', 1),
(92, 4, 0, 'GM', 220, 0, 0, 0, 1, '', 1),
(93, 3, 0, 'GE', 995, 0, 0, 0, 1, 'NNNN', 1),
(94, 4, 0, 'GH', 233, 0, 0, 0, 1, '', 1),
(95, 8, 0, 'GD', 0, 0, 0, 0, 1, '', 1),
(96, 7, 0, 'GL', 299, 0, 0, 0, 1, '', 1),
(97, 7, 0, 'GI', 350, 0, 0, 0, 1, '', 1),
(98, 8, 0, 'GP', 590, 0, 0, 0, 1, '', 1),
(99, 5, 0, 'GU', 0, 0, 0, 0, 1, '', 1),
(100, 8, 0, 'GT', 502, 0, 0, 0, 1, '', 1),
(101, 7, 0, 'GG', 0, 0, 0, 0, 1, 'LLN NLL', 1),
(102, 4, 0, 'GN', 224, 0, 0, 0, 1, '', 1),
(103, 4, 0, 'GW', 245, 0, 0, 0, 1, '', 1),
(104, 6, 0, 'GY', 592, 0, 0, 0, 1, '', 1),
(105, 8, 0, 'HT', 509, 0, 0, 0, 1, '', 1),
(106, 5, 0, 'HM', 0, 0, 0, 0, 1, '', 1),
(107, 7, 0, 'VA', 379, 0, 0, 0, 1, 'NNNNN', 1),
(108, 8, 0, 'HN', 504, 0, 0, 0, 1, '', 1),
(109, 7, 0, 'IS', 354, 0, 0, 0, 1, 'NNN', 1),
(110, 3, 0, 'IN', 91, 0, 0, 0, 1, 'NNN NNN', 1),
(111, 3, 0, 'ID', 62, 0, 1, 0, 1, 'NNNNN', 1),
(112, 3, 0, 'IR', 98, 0, 0, 0, 1, 'NNNNN-NNNNN', 1),
(113, 3, 0, 'IQ', 964, 0, 0, 0, 1, 'NNNNN', 1),
(114, 7, 0, 'IM', 0, 0, 0, 0, 1, 'CN NLL', 1),
(115, 8, 0, 'JM', 0, 0, 0, 0, 1, '', 1),
(116, 7, 0, 'JE', 0, 0, 0, 0, 1, 'CN NLL', 1),
(117, 3, 0, 'JO', 962, 0, 0, 0, 1, '', 1),
(118, 3, 0, 'KZ', 7, 0, 0, 0, 1, 'NNNNNN', 1),
(119, 4, 0, 'KE', 254, 0, 0, 0, 1, '', 1),
(120, 5, 0, 'KI', 686, 0, 0, 0, 1, '', 1),
(121, 3, 0, 'KP', 850, 0, 0, 0, 1, '', 1),
(122, 3, 0, 'KW', 965, 0, 0, 0, 1, '', 1),
(123, 3, 0, 'KG', 996, 0, 0, 0, 1, '', 1),
(124, 3, 0, 'LA', 856, 0, 0, 0, 1, '', 1),
(125, 1, 0, 'LV', 371, 0, 0, 0, 1, 'C-NNNN', 1),
(126, 3, 0, 'LB', 961, 0, 0, 0, 1, '', 1),
(127, 4, 0, 'LS', 266, 0, 0, 0, 1, '', 1),
(128, 4, 0, 'LR', 231, 0, 0, 0, 1, '', 1),
(129, 4, 0, 'LY', 218, 0, 0, 0, 1, '', 1),
(130, 1, 0, 'LI', 423, 0, 0, 0, 1, 'NNNN', 1),
(131, 1, 0, 'LT', 370, 0, 0, 0, 1, 'NNNNN', 1),
(132, 3, 0, 'MO', 853, 0, 0, 0, 0, '', 1),
(133, 7, 0, 'MK', 389, 0, 0, 0, 1, '', 1),
(134, 4, 0, 'MG', 261, 0, 0, 0, 1, '', 1),
(135, 4, 0, 'MW', 265, 0, 0, 0, 1, '', 1),
(136, 3, 0, 'MY', 60, 0, 0, 0, 1, 'NNNNN', 1),
(137, 3, 0, 'MV', 960, 0, 0, 0, 1, '', 1),
(138, 4, 0, 'ML', 223, 0, 0, 0, 1, '', 1),
(139, 1, 0, 'MT', 356, 0, 0, 0, 1, 'LLL NNNN', 1),
(140, 5, 0, 'MH', 692, 0, 0, 0, 1, '', 1),
(141, 8, 0, 'MQ', 596, 0, 0, 0, 1, '', 1),
(142, 4, 0, 'MR', 222, 0, 0, 0, 1, '', 1),
(143, 1, 0, 'HU', 36, 0, 0, 0, 1, 'NNNN', 1),
(144, 4, 0, 'YT', 262, 0, 0, 0, 1, '', 1),
(145, 2, 0, 'MX', 52, 0, 1, 1, 1, 'NNNNN', 1),
(146, 5, 0, 'FM', 691, 0, 0, 0, 1, '', 1),
(147, 7, 0, 'MD', 373, 0, 0, 0, 1, 'C-NNNN', 1),
(148, 7, 0, 'MC', 377, 0, 0, 0, 1, '980NN', 1),
(149, 3, 0, 'MN', 976, 0, 0, 0, 1, '', 1),
(150, 7, 0, 'ME', 382, 0, 0, 0, 1, 'NNNNN', 1),
(151, 8, 0, 'MS', 0, 0, 0, 0, 1, '', 1),
(152, 4, 0, 'MA', 212, 0, 0, 0, 1, 'NNNNN', 1),
(153, 4, 0, 'MZ', 258, 0, 0, 0, 1, '', 1),
(154, 4, 0, 'NA', 264, 0, 0, 0, 1, '', 1),
(155, 5, 0, 'NR', 674, 0, 0, 0, 1, '', 1),
(156, 3, 0, 'NP', 977, 0, 0, 0, 1, '', 1),
(157, 8, 0, 'AN', 599, 0, 0, 0, 1, '', 1),
(158, 5, 0, 'NC', 687, 0, 0, 0, 1, '', 1),
(159, 8, 0, 'NI', 505, 0, 0, 0, 1, 'NNNNNN', 1),
(160, 4, 0, 'NE', 227, 0, 0, 0, 1, '', 1),
(161, 5, 0, 'NU', 683, 0, 0, 0, 1, '', 1),
(162, 5, 0, 'NF', 0, 0, 0, 0, 1, '', 1),
(163, 5, 0, 'MP', 0, 0, 0, 0, 1, '', 1),
(164, 3, 0, 'OM', 968, 0, 0, 0, 1, '', 1),
(165, 3, 0, 'PK', 92, 0, 0, 0, 1, '', 1),
(166, 5, 0, 'PW', 680, 0, 0, 0, 1, '', 1),
(167, 3, 0, 'PS', 0, 0, 0, 0, 1, '', 1),
(168, 8, 0, 'PA', 507, 0, 0, 0, 1, 'NNNNNN', 1),
(169, 5, 0, 'PG', 675, 0, 0, 0, 1, '', 1),
(170, 6, 0, 'PY', 595, 0, 0, 0, 1, '', 1),
(171, 6, 0, 'PE', 51, 0, 0, 0, 1, '', 1),
(172, 3, 0, 'PH', 63, 0, 0, 0, 1, 'NNNN', 1),
(173, 5, 0, 'PN', 0, 0, 0, 0, 1, 'LLLL NLL', 1),
(174, 8, 0, 'PR', 0, 0, 0, 0, 1, 'NNNNN', 1),
(175, 3, 0, 'QA', 974, 0, 0, 0, 1, '', 1),
(176, 4, 0, 'RE', 262, 0, 0, 0, 1, '', 1),
(177, 7, 0, 'RU', 7, 0, 0, 0, 1, 'NNNNNN', 1),
(178, 4, 0, 'RW', 250, 0, 0, 0, 1, '', 1),
(179, 8, 0, 'BL', 0, 0, 0, 0, 1, '', 1),
(180, 8, 0, 'KN', 0, 0, 0, 0, 1, '', 1),
(181, 8, 0, 'LC', 0, 0, 0, 0, 1, '', 1),
(182, 8, 0, 'MF', 0, 0, 0, 0, 1, '', 1),
(183, 8, 0, 'PM', 508, 0, 0, 0, 1, '', 1),
(184, 8, 0, 'VC', 0, 0, 0, 0, 1, '', 1),
(185, 5, 0, 'WS', 685, 0, 0, 0, 1, '', 1),
(186, 7, 0, 'SM', 378, 0, 0, 0, 1, 'NNNNN', 1),
(187, 4, 0, 'ST', 239, 0, 0, 0, 1, '', 1),
(188, 3, 0, 'SA', 966, 0, 0, 0, 1, '', 1),
(189, 4, 0, 'SN', 221, 0, 0, 0, 1, '', 1),
(190, 7, 0, 'RS', 381, 0, 0, 0, 1, 'NNNNN', 1),
(191, 4, 0, 'SC', 248, 0, 0, 0, 1, '', 1),
(192, 4, 0, 'SL', 232, 0, 0, 0, 1, '', 1),
(193, 1, 0, 'SI', 386, 0, 0, 0, 1, 'C-NNNN', 1),
(194, 5, 0, 'SB', 677, 0, 0, 0, 1, '', 1),
(195, 4, 0, 'SO', 252, 0, 0, 0, 1, '', 1),
(196, 8, 0, 'GS', 0, 0, 0, 0, 1, 'LLLL NLL', 1),
(197, 3, 0, 'LK', 94, 0, 0, 0, 1, 'NNNNN', 1),
(198, 4, 0, 'SD', 249, 0, 0, 0, 1, '', 1),
(199, 8, 0, 'SR', 597, 0, 0, 0, 1, '', 1),
(200, 7, 0, 'SJ', 0, 0, 0, 0, 1, '', 1),
(201, 4, 0, 'SZ', 268, 0, 0, 0, 1, '', 1),
(202, 3, 0, 'SY', 963, 0, 0, 0, 1, '', 1),
(203, 3, 0, 'TW', 886, 0, 0, 0, 1, 'NNNNN', 1),
(204, 3, 0, 'TJ', 992, 0, 0, 0, 1, '', 1),
(205, 4, 0, 'TZ', 255, 0, 0, 0, 1, '', 1),
(206, 3, 0, 'TH', 66, 0, 0, 0, 1, 'NNNNN', 1),
(207, 5, 0, 'TK', 690, 0, 0, 0, 1, '', 1),
(208, 5, 0, 'TO', 676, 0, 0, 0, 1, '', 1),
(209, 6, 0, 'TT', 0, 0, 0, 0, 1, '', 1),
(210, 4, 0, 'TN', 216, 0, 0, 0, 1, '', 1),
(211, 7, 0, 'TR', 90, 0, 0, 0, 1, 'NNNNN', 1),
(212, 3, 0, 'TM', 993, 0, 0, 0, 1, '', 1),
(213, 8, 0, 'TC', 0, 0, 0, 0, 1, 'LLLL NLL', 1),
(214, 5, 0, 'TV', 688, 0, 0, 0, 1, '', 1),
(215, 4, 0, 'UG', 256, 0, 0, 0, 1, '', 1),
(216, 1, 0, 'UA', 380, 0, 0, 0, 1, 'NNNNN', 1),
(217, 3, 0, 'AE', 971, 0, 0, 0, 1, '', 1),
(218, 6, 0, 'UY', 598, 0, 0, 0, 1, '', 1),
(219, 3, 0, 'UZ', 998, 0, 0, 0, 1, '', 1),
(220, 5, 0, 'VU', 678, 0, 0, 0, 1, '', 1),
(221, 6, 0, 'VE', 58, 0, 0, 0, 1, '', 1),
(222, 3, 0, 'VN', 84, 0, 0, 0, 1, 'NNNNNN', 1),
(223, 2, 0, 'VG', 0, 0, 0, 0, 1, 'CNNNN', 1),
(224, 2, 0, 'VI', 0, 0, 0, 0, 1, '', 1),
(225, 5, 0, 'WF', 681, 0, 0, 0, 1, '', 1),
(226, 4, 0, 'EH', 0, 0, 0, 0, 1, '', 1),
(227, 3, 0, 'YE', 967, 0, 0, 0, 1, '', 1),
(228, 4, 0, 'ZM', 260, 0, 0, 0, 1, '', 1),
(229, 4, 0, 'ZW', 263, 0, 0, 0, 1, '', 1),
(230, 7, 0, 'AL', 355, 0, 0, 0, 1, 'NNNN', 1),
(231, 3, 0, 'AF', 93, 0, 0, 0, 1, 'NNNN', 1),
(232, 5, 0, 'AQ', 0, 0, 0, 0, 1, '', 1),
(233, 1, 0, 'BA', 387, 0, 0, 0, 1, '', 1),
(234, 5, 0, 'BV', 0, 0, 0, 0, 1, '', 1),
(235, 5, 0, 'IO', 0, 0, 0, 0, 1, 'LLLL NLL', 1),
(236, 1, 0, 'BG', 359, 0, 0, 0, 1, 'NNNN', 1),
(237, 8, 0, 'KY', 0, 0, 0, 0, 1, '', 1),
(238, 3, 0, 'CX', 0, 0, 0, 0, 1, '', 1),
(239, 3, 0, 'CC', 0, 0, 0, 0, 1, '', 1),
(240, 5, 0, 'CK', 682, 0, 0, 0, 1, '', 1),
(241, 6, 0, 'GF', 594, 0, 0, 0, 1, '', 1),
(242, 5, 0, 'PF', 689, 0, 0, 0, 1, '', 1),
(243, 5, 0, 'TF', 0, 0, 0, 0, 1, '', 1),
(244, 7, 0, 'AX', 0, 0, 0, 0, 1, 'NNNNN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_country_lang`
--

CREATE TABLE `qlo_country_lang` (
  `id_country` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_country_lang`
--

INSERT INTO `qlo_country_lang` (`id_country`, `id_lang`, `name`) VALUES
(1, 1, 'Germany'),
(2, 1, 'Austria'),
(3, 1, 'Belgium'),
(4, 1, 'Canada'),
(5, 1, 'China'),
(6, 1, 'Spain'),
(7, 1, 'Finland'),
(8, 1, 'France'),
(9, 1, 'Greece'),
(10, 1, 'Italy'),
(11, 1, 'Japan'),
(12, 1, 'Luxemburg'),
(13, 1, 'Netherlands'),
(14, 1, 'Poland'),
(15, 1, 'Portugal'),
(16, 1, 'Czech Republic'),
(17, 1, 'United Kingdom'),
(18, 1, 'Sweden'),
(19, 1, 'Switzerland'),
(20, 1, 'Denmark'),
(21, 1, 'United States'),
(22, 1, 'HongKong'),
(23, 1, 'Norway'),
(24, 1, 'Australia'),
(25, 1, 'Singapore'),
(26, 1, 'Ireland'),
(27, 1, 'New Zealand'),
(28, 1, 'South Korea'),
(29, 1, 'Israel'),
(30, 1, 'South Africa'),
(31, 1, 'Nigeria'),
(32, 1, 'Ivory Coast'),
(33, 1, 'Togo'),
(34, 1, 'Bolivia'),
(35, 1, 'Mauritius'),
(36, 1, 'Romania'),
(37, 1, 'Slovakia'),
(38, 1, 'Algeria'),
(39, 1, 'American Samoa'),
(40, 1, 'Andorra'),
(41, 1, 'Angola'),
(42, 1, 'Anguilla'),
(43, 1, 'Antigua and Barbuda'),
(44, 1, 'Argentina'),
(45, 1, 'Armenia'),
(46, 1, 'Aruba'),
(47, 1, 'Azerbaijan'),
(48, 1, 'Bahamas'),
(49, 1, 'Bahrain'),
(50, 1, 'Bangladesh'),
(51, 1, 'Barbados'),
(52, 1, 'Belarus'),
(53, 1, 'Belize'),
(54, 1, 'Benin'),
(55, 1, 'Bermuda'),
(56, 1, 'Bhutan'),
(57, 1, 'Botswana'),
(58, 1, 'Brazil'),
(59, 1, 'Brunei'),
(60, 1, 'Burkina Faso'),
(61, 1, 'Burma (Myanmar)'),
(62, 1, 'Burundi'),
(63, 1, 'Cambodia'),
(64, 1, 'Cameroon'),
(65, 1, 'Cape Verde'),
(66, 1, 'Central African Republic'),
(67, 1, 'Chad'),
(68, 1, 'Chile'),
(69, 1, 'Colombia'),
(70, 1, 'Comoros'),
(71, 1, 'Congo, Dem. Republic'),
(72, 1, 'Congo, Republic'),
(73, 1, 'Costa Rica'),
(74, 1, 'Croatia'),
(75, 1, 'Cuba'),
(76, 1, 'Cyprus'),
(77, 1, 'Djibouti'),
(78, 1, 'Dominica'),
(79, 1, 'Dominican Republic'),
(80, 1, 'East Timor'),
(81, 1, 'Ecuador'),
(82, 1, 'Egypt'),
(83, 1, 'El Salvador'),
(84, 1, 'Equatorial Guinea'),
(85, 1, 'Eritrea'),
(86, 1, 'Estonia'),
(87, 1, 'Ethiopia'),
(88, 1, 'Falkland Islands'),
(89, 1, 'Faroe Islands'),
(90, 1, 'Fiji'),
(91, 1, 'Gabon'),
(92, 1, 'Gambia'),
(93, 1, 'Georgia'),
(94, 1, 'Ghana'),
(95, 1, 'Grenada'),
(96, 1, 'Greenland'),
(97, 1, 'Gibraltar'),
(98, 1, 'Guadeloupe'),
(99, 1, 'Guam'),
(100, 1, 'Guatemala'),
(101, 1, 'Guernsey'),
(102, 1, 'Guinea'),
(103, 1, 'Guinea-Bissau'),
(104, 1, 'Guyana'),
(105, 1, 'Haiti'),
(106, 1, 'Heard Island and McDonald Islands'),
(107, 1, 'Vatican City State'),
(108, 1, 'Honduras'),
(109, 1, 'Iceland'),
(110, 1, 'India'),
(111, 1, 'Indonesia'),
(112, 1, 'Iran'),
(113, 1, 'Iraq'),
(114, 1, 'Man Island'),
(115, 1, 'Jamaica'),
(116, 1, 'Jersey'),
(117, 1, 'Jordan'),
(118, 1, 'Kazakhstan'),
(119, 1, 'Kenya'),
(120, 1, 'Kiribati'),
(121, 1, 'Korea, Dem. Republic of'),
(122, 1, 'Kuwait'),
(123, 1, 'Kyrgyzstan'),
(124, 1, 'Laos'),
(125, 1, 'Latvia'),
(126, 1, 'Lebanon'),
(127, 1, 'Lesotho'),
(128, 1, 'Liberia'),
(129, 1, 'Libya'),
(130, 1, 'Liechtenstein'),
(131, 1, 'Lithuania'),
(132, 1, 'Macau'),
(133, 1, 'Macedonia'),
(134, 1, 'Madagascar'),
(135, 1, 'Malawi'),
(136, 1, 'Malaysia'),
(137, 1, 'Maldives'),
(138, 1, 'Mali'),
(139, 1, 'Malta'),
(140, 1, 'Marshall Islands'),
(141, 1, 'Martinique'),
(142, 1, 'Mauritania'),
(143, 1, 'Hungary'),
(144, 1, 'Mayotte'),
(145, 1, 'Mexico'),
(146, 1, 'Micronesia'),
(147, 1, 'Moldova'),
(148, 1, 'Monaco'),
(149, 1, 'Mongolia'),
(150, 1, 'Montenegro'),
(151, 1, 'Montserrat'),
(152, 1, 'Morocco'),
(153, 1, 'Mozambique'),
(154, 1, 'Namibia'),
(155, 1, 'Nauru'),
(156, 1, 'Nepal'),
(157, 1, 'Netherlands Antilles'),
(158, 1, 'New Caledonia'),
(159, 1, 'Nicaragua'),
(160, 1, 'Niger'),
(161, 1, 'Niue'),
(162, 1, 'Norfolk Island'),
(163, 1, 'Northern Mariana Islands'),
(164, 1, 'Oman'),
(165, 1, 'Pakistan'),
(166, 1, 'Palau'),
(167, 1, 'Palestinian Territories'),
(168, 1, 'Panama'),
(169, 1, 'Papua New Guinea'),
(170, 1, 'Paraguay'),
(171, 1, 'Peru'),
(172, 1, 'Philippines'),
(173, 1, 'Pitcairn'),
(174, 1, 'Puerto Rico'),
(175, 1, 'Qatar'),
(176, 1, 'Reunion Island'),
(177, 1, 'Russian Federation'),
(178, 1, 'Rwanda'),
(179, 1, 'Saint Barthelemy'),
(180, 1, 'Saint Kitts and Nevis'),
(181, 1, 'Saint Lucia'),
(182, 1, 'Saint Martin'),
(183, 1, 'Saint Pierre and Miquelon'),
(184, 1, 'Saint Vincent and the Grenadines'),
(185, 1, 'Samoa'),
(186, 1, 'San Marino'),
(187, 1, 'São Tomé and Príncipe'),
(188, 1, 'Saudi Arabia'),
(189, 1, 'Senegal'),
(190, 1, 'Serbia'),
(191, 1, 'Seychelles'),
(192, 1, 'Sierra Leone'),
(193, 1, 'Slovenia'),
(194, 1, 'Solomon Islands'),
(195, 1, 'Somalia'),
(196, 1, 'South Georgia and the South Sandwich Islands'),
(197, 1, 'Sri Lanka'),
(198, 1, 'Sudan'),
(199, 1, 'Suriname'),
(200, 1, 'Svalbard and Jan Mayen'),
(201, 1, 'Swaziland'),
(202, 1, 'Syria'),
(203, 1, 'Taiwan'),
(204, 1, 'Tajikistan'),
(205, 1, 'Tanzania'),
(206, 1, 'Thailand'),
(207, 1, 'Tokelau'),
(208, 1, 'Tonga'),
(209, 1, 'Trinidad and Tobago'),
(210, 1, 'Tunisia'),
(211, 1, 'Turkey'),
(212, 1, 'Turkmenistan'),
(213, 1, 'Turks and Caicos Islands'),
(214, 1, 'Tuvalu'),
(215, 1, 'Uganda'),
(216, 1, 'Ukraine'),
(217, 1, 'United Arab Emirates'),
(218, 1, 'Uruguay'),
(219, 1, 'Uzbekistan'),
(220, 1, 'Vanuatu'),
(221, 1, 'Venezuela'),
(222, 1, 'Vietnam'),
(223, 1, 'Virgin Islands (British)'),
(224, 1, 'Virgin Islands (U.S.)'),
(225, 1, 'Wallis and Futuna'),
(226, 1, 'Western Sahara'),
(227, 1, 'Yemen'),
(228, 1, 'Zambia'),
(229, 1, 'Zimbabwe'),
(230, 1, 'Albania'),
(231, 1, 'Afghanistan'),
(232, 1, 'Antarctica'),
(233, 1, 'Bosnia and Herzegovina'),
(234, 1, 'Bouvet Island'),
(235, 1, 'British Indian Ocean Territory'),
(236, 1, 'Bulgaria'),
(237, 1, 'Cayman Islands'),
(238, 1, 'Christmas Island'),
(239, 1, 'Cocos (Keeling) Islands'),
(240, 1, 'Cook Islands'),
(241, 1, 'French Guiana'),
(242, 1, 'French Polynesia'),
(243, 1, 'French Southern Territories'),
(244, 1, 'Åland Islands');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_country_shop`
--

CREATE TABLE `qlo_country_shop` (
  `id_country` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_country_shop`
--

INSERT INTO `qlo_country_shop` (`id_country`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_currency`
--

CREATE TABLE `qlo_currency` (
  `id_currency` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `iso_code` varchar(3) NOT NULL DEFAULT '0',
  `iso_code_num` varchar(3) NOT NULL DEFAULT '0',
  `sign` varchar(8) NOT NULL,
  `blank` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `format` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `decimals` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `conversion_rate` decimal(13,6) NOT NULL,
  `deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_currency`
--

INSERT INTO `qlo_currency` (`id_currency`, `name`, `iso_code`, `iso_code_num`, `sign`, `blank`, `format`, `decimals`, `conversion_rate`, `deleted`, `active`) VALUES
(1, 'Dollar', 'USD', '840', '$', 0, 1, 1, 1.000000, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_currency_shop`
--

CREATE TABLE `qlo_currency_shop` (
  `id_currency` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_currency_shop`
--

INSERT INTO `qlo_currency_shop` (`id_currency`, `id_shop`, `conversion_rate`) VALUES
(1, 1, 1.000000);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_customer`
--

CREATE TABLE `qlo_customer` (
  `id_customer` int(10) UNSIGNED NOT NULL,
  `id_shop_group` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_gender` int(10) UNSIGNED NOT NULL,
  `id_default_group` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `id_lang` int(10) UNSIGNED DEFAULT NULL,
  `id_risk` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `company` varchar(64) DEFAULT NULL,
  `siret` varchar(14) DEFAULT NULL,
  `ape` varchar(5) DEFAULT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT current_timestamp(),
  `birthday` date DEFAULT NULL,
  `newsletter` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ip_registration_newsletter` varchar(15) DEFAULT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `optin` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `website` varchar(128) DEFAULT NULL,
  `outstanding_allow_amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `show_public_prices` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `max_payment_days` int(10) UNSIGNED NOT NULL DEFAULT 60,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `note` text DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_customer`
--

INSERT INTO `qlo_customer` (`id_customer`, `id_shop_group`, `id_shop`, `id_gender`, `id_default_group`, `id_lang`, `id_risk`, `company`, `siret`, `ape`, `firstname`, `lastname`, `email`, `passwd`, `last_passwd_gen`, `birthday`, `newsletter`, `ip_registration_newsletter`, `newsletter_date_add`, `optin`, `website`, `outstanding_allow_amount`, `show_public_prices`, `max_payment_days`, `secure_key`, `note`, `phone`, `active`, `is_guest`, `deleted`, `date_add`, `date_upd`) VALUES
(1, 1, 1, 1, 3, 1, 0, '', '', '', 'John', 'Doe', 'pub@qloapps.com', '9e7f54ac8c1b1828ca7ebcd5a3fc0969', '2025-08-07 00:32:20', '1995-08-07', 1, '', '2025-08-07 02:32:20', 1, '', 0.000000, 0, 0, '54417735b8d07952699e12d92962a9c5', '', '1234567890', 1, 0, 0, '2025-08-07 02:32:20', '2025-08-07 02:32:20');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_customer_group`
--

CREATE TABLE `qlo_customer_group` (
  `id_customer` int(10) UNSIGNED NOT NULL,
  `id_group` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_customer_group`
--

INSERT INTO `qlo_customer_group` (`id_customer`, `id_group`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_customer_guest_detail`
--

CREATE TABLE `qlo_customer_guest_detail` (
  `id_customer_guest_detail` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) UNSIGNED NOT NULL,
  `id_gender` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_customer_message`
--

CREATE TABLE `qlo_customer_message` (
  `id_customer_message` int(10) UNSIGNED NOT NULL,
  `id_customer_thread` int(11) DEFAULT NULL,
  `id_employee` int(10) UNSIGNED DEFAULT NULL,
  `message` mediumtext NOT NULL,
  `id_product` int(10) UNSIGNED DEFAULT NULL,
  `file_name` varchar(18) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `user_agent` varchar(128) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `private` tinyint(4) NOT NULL DEFAULT 0,
  `read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_customer_message_sync_imap`
--

CREATE TABLE `qlo_customer_message_sync_imap` (
  `md5_header` varbinary(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_customer_thread`
--

CREATE TABLE `qlo_customer_thread` (
  `id_customer_thread` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `id_contact` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) UNSIGNED DEFAULT NULL,
  `id_employee` int(10) UNSIGNED DEFAULT NULL,
  `id_order` int(10) UNSIGNED DEFAULT NULL,
  `user_name` varchar(128) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT 1,
  `email` varchar(128) NOT NULL,
  `token` varchar(12) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_customization`
--

CREATE TABLE `qlo_customization` (
  `id_customization` int(10) UNSIGNED NOT NULL,
  `id_product_attribute` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_address_delivery` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_cart` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `quantity_refunded` int(11) NOT NULL DEFAULT 0,
  `quantity_returned` int(11) NOT NULL DEFAULT 0,
  `in_cart` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_customization_field`
--

CREATE TABLE `qlo_customization_field` (
  `id_customization_field` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_customization_field_lang`
--

CREATE TABLE `qlo_customization_field_lang` (
  `id_customization_field` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_customized_data`
--

CREATE TABLE `qlo_customized_data` (
  `id_customization` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL,
  `index` int(3) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_date_range`
--

CREATE TABLE `qlo_date_range` (
  `id_date_range` int(10) UNSIGNED NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_delivery`
--

CREATE TABLE `qlo_delivery` (
  `id_delivery` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED DEFAULT NULL,
  `id_shop_group` int(10) UNSIGNED DEFAULT NULL,
  `id_carrier` int(10) UNSIGNED NOT NULL,
  `id_range_price` int(10) UNSIGNED DEFAULT NULL,
  `id_range_weight` int(10) UNSIGNED DEFAULT NULL,
  `id_zone` int(10) UNSIGNED NOT NULL,
  `price` decimal(20,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_employee`
--

CREATE TABLE `qlo_employee` (
  `id_employee` int(10) UNSIGNED NOT NULL,
  `id_profile` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT current_timestamp(),
  `stats_date_from` date DEFAULT NULL,
  `stats_date_to` date DEFAULT NULL,
  `stats_compare_from` date DEFAULT NULL,
  `stats_compare_to` date DEFAULT NULL,
  `stats_compare_option` int(1) UNSIGNED NOT NULL DEFAULT 1,
  `preselect_date_range` varchar(32) DEFAULT NULL,
  `bo_color` varchar(32) DEFAULT NULL,
  `bo_theme` varchar(32) DEFAULT NULL,
  `bo_css` varchar(64) DEFAULT NULL,
  `default_tab` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bo_width` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `bo_menu` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `optin` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `id_last_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_last_customer_message` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_last_customer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `last_connection_date` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_employee`
--

INSERT INTO `qlo_employee` (`id_employee`, `id_profile`, `id_lang`, `lastname`, `firstname`, `email`, `passwd`, `last_passwd_gen`, `stats_date_from`, `stats_date_to`, `stats_compare_from`, `stats_compare_to`, `stats_compare_option`, `preselect_date_range`, `bo_color`, `bo_theme`, `bo_css`, `default_tab`, `bo_width`, `bo_menu`, `active`, `optin`, `id_last_order`, `id_last_customer_message`, `id_last_customer`, `last_connection_date`) VALUES
(1, 1, 1, 'Bots', 'Queue', 'queuebots1@gmail.com', 'a8101b0d17832a25d4855162f8140c5d', '2025-08-07 00:32:18', '2025-07-07', '2025-08-07', '0000-00-00', '0000-00-00', 1, NULL, NULL, 'default', 'admin-theme.css', 1, 0, 1, 1, 1, 0, 0, 0, '2025-08-20');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_employee_shop`
--

CREATE TABLE `qlo_employee_shop` (
  `id_employee` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_employee_shop`
--

INSERT INTO `qlo_employee_shop` (`id_employee`, `id_shop`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_feature`
--

CREATE TABLE `qlo_feature` (
  `id_feature` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_feature`
--

INSERT INTO `qlo_feature` (`id_feature`, `position`) VALUES
(1, 0),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_feature_lang`
--

CREATE TABLE `qlo_feature_lang` (
  `id_feature` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_feature_lang`
--

INSERT INTO `qlo_feature_lang` (`id_feature`, `id_lang`, `name`) VALUES
(7, 1, 'Gym'),
(2, 1, 'News Paper'),
(3, 1, 'Power BackUp'),
(4, 1, 'Refrigerator'),
(5, 1, 'Restaurant'),
(6, 1, 'Room Service'),
(1, 1, 'Wi-Fi');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_feature_product`
--

CREATE TABLE `qlo_feature_product` (
  `id_feature` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_feature_value` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_feature_product`
--

INSERT INTO `qlo_feature_product` (`id_feature`, `id_product`, `id_feature_value`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(2, 1, 2),
(2, 2, 2),
(2, 3, 2),
(2, 4, 2),
(3, 1, 3),
(3, 2, 3),
(3, 3, 3),
(3, 4, 3),
(4, 1, 4),
(4, 2, 4),
(4, 3, 4),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_feature_shop`
--

CREATE TABLE `qlo_feature_shop` (
  `id_feature` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_feature_shop`
--

INSERT INTO `qlo_feature_shop` (`id_feature`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_feature_value`
--

CREATE TABLE `qlo_feature_value` (
  `id_feature_value` int(10) UNSIGNED NOT NULL,
  `id_feature` int(10) UNSIGNED NOT NULL,
  `custom` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_feature_value`
--

INSERT INTO `qlo_feature_value` (`id_feature_value`, `id_feature`, `custom`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 4, 0),
(5, 5, 0),
(6, 6, 0),
(7, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_feature_value_lang`
--

CREATE TABLE `qlo_feature_value_lang` (
  `id_feature_value` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_feature_value_lang`
--

INSERT INTO `qlo_feature_value_lang` (`id_feature_value`, `id_lang`, `value`) VALUES
(1, 1, '1.jpg'),
(2, 1, '2.jpg'),
(3, 1, '3.jpg'),
(4, 1, '4.jpg'),
(5, 1, '5.jpg'),
(6, 1, '6.jpg'),
(7, 1, '7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_gender`
--

CREATE TABLE `qlo_gender` (
  `id_gender` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_gender`
--

INSERT INTO `qlo_gender` (`id_gender`, `type`) VALUES
(1, 0),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_gender_lang`
--

CREATE TABLE `qlo_gender_lang` (
  `id_gender` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_gender_lang`
--

INSERT INTO `qlo_gender_lang` (`id_gender`, `id_lang`, `name`) VALUES
(1, 1, 'Mr.'),
(2, 1, 'Mrs.');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_group`
--

CREATE TABLE `qlo_group` (
  `id_group` int(10) UNSIGNED NOT NULL,
  `reduction` decimal(17,2) NOT NULL DEFAULT 0.00,
  `price_display_method` tinyint(4) NOT NULL DEFAULT 0,
  `show_prices` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_group`
--

INSERT INTO `qlo_group` (`id_group`, `reduction`, `price_display_method`, `show_prices`, `date_add`, `date_upd`) VALUES
(1, 0.00, 1, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:18'),
(2, 0.00, 1, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:18'),
(3, 0.00, 1, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:18');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_group_lang`
--

CREATE TABLE `qlo_group_lang` (
  `id_group` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_group_lang`
--

INSERT INTO `qlo_group_lang` (`id_group`, `id_lang`, `name`) VALUES
(1, 1, 'Visitor'),
(2, 1, 'Guest'),
(3, 1, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_group_reduction`
--

CREATE TABLE `qlo_group_reduction` (
  `id_group_reduction` mediumint(8) UNSIGNED NOT NULL,
  `id_group` int(10) UNSIGNED NOT NULL,
  `id_category` int(10) UNSIGNED NOT NULL,
  `reduction` decimal(4,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_group_shop`
--

CREATE TABLE `qlo_group_shop` (
  `id_group` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_group_shop`
--

INSERT INTO `qlo_group_shop` (`id_group`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_guest`
--

CREATE TABLE `qlo_guest` (
  `id_guest` int(10) UNSIGNED NOT NULL,
  `id_operating_system` int(10) UNSIGNED DEFAULT NULL,
  `id_web_browser` int(10) UNSIGNED DEFAULT NULL,
  `id_customer` int(10) UNSIGNED DEFAULT NULL,
  `javascript` tinyint(1) DEFAULT 0,
  `screen_resolution_x` smallint(5) UNSIGNED DEFAULT NULL,
  `screen_resolution_y` smallint(5) UNSIGNED DEFAULT NULL,
  `screen_color` tinyint(3) UNSIGNED DEFAULT NULL,
  `sun_java` tinyint(1) DEFAULT NULL,
  `adobe_flash` tinyint(1) DEFAULT NULL,
  `adobe_director` tinyint(1) DEFAULT NULL,
  `apple_quicktime` tinyint(1) DEFAULT NULL,
  `real_player` tinyint(1) DEFAULT NULL,
  `windows_media` tinyint(1) DEFAULT NULL,
  `accept_language` varchar(8) DEFAULT NULL,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_guest`
--

INSERT INTO `qlo_guest` (`id_guest`, `id_operating_system`, `id_web_browser`, `id_customer`, `javascript`, `screen_resolution_x`, `screen_resolution_y`, `screen_color`, `sun_java`, `adobe_flash`, `adobe_director`, `apple_quicktime`, `real_player`, `windows_media`, `accept_language`, `mobile_theme`) VALUES
(1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(2, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'en', 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_hook`
--

CREATE TABLE `qlo_hook` (
  `id_hook` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text DEFAULT NULL,
  `position` tinyint(1) NOT NULL DEFAULT 1,
  `live_edit` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_hook`
--

INSERT INTO `qlo_hook` (`id_hook`, `name`, `title`, `description`, `position`, `live_edit`) VALUES
(1, 'displayPayment', 'Payment', 'This hook displays new elements on the payment page', 1, 1),
(2, 'actionValidateOrder', 'New orders', '', 1, 0),
(3, 'displayMaintenance', 'Maintenance Page', 'This hook displays new elements on the maintenance page', 1, 0),
(4, 'actionPaymentConfirmation', 'Payment confirmation', 'This hook displays new elements after the payment is validated', 1, 0),
(5, 'displayPaymentReturn', 'Payment return', '', 1, 0),
(6, 'actionUpdateQuantity', 'Quantity update', 'Quantity is updated only when a customer effectively places their order', 1, 0),
(7, 'displayRightColumn', 'Right column blocks', 'This hook displays new elements in the right-hand column', 1, 1),
(8, 'displayLeftColumn', 'Left column blocks', 'This hook displays new elements in the left-hand column', 1, 1),
(9, 'displayHome', 'Homepage content', 'This hook displays new elements on the homepage', 1, 1),
(10, 'Header', 'Pages html head section', 'This hook adds additional elements in the head section of your pages (head section of html)', 1, 0),
(11, 'actionCartSave', 'Cart creation and update', 'This hook is displayed when a product is added to the cart or if the cart\'s content is modified', 1, 0),
(12, 'actionAuthentication', 'Successful customer authentication', 'This hook is displayed after a customer successfully signs in', 1, 0),
(13, 'actionProductAdd', 'Product creation', 'This hook is displayed after a product is created', 1, 0),
(14, 'actionProductUpdate', 'Product update', 'This hook is displayed after a product has been updated', 1, 0),
(15, 'displayTop', 'Top of pages', 'This hook displays additional elements at the top of your pages', 1, 0),
(16, 'displayRightColumnProduct', 'New elements on the product page (right column)', 'This hook displays new elements in the right-hand column of the product page', 1, 0),
(17, 'actionProductDelete', 'Product deletion', 'This hook is called when a product is deleted', 1, 0),
(18, 'displayFooterProduct', 'Product footer', 'This hook adds new blocks under the product\'s description', 1, 1),
(19, 'displayInvoice', 'Invoice', 'This hook displays new blocks on the invoice (order)', 1, 0),
(20, 'actionOrderStatusUpdate', 'Order status update - Event', 'This hook launches modules when the status of an order changes.', 1, 0),
(21, 'displayAdminOrder', 'Display new elements in the Back Office, tab AdminOrder', 'This hook launches modules when the AdminOrder tab is displayed in the Back Office', 1, 0),
(22, 'displayAdminOrderTabOrder', 'Display new elements in Back Office, AdminOrder, panel Order', 'This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Order panel tabs', 1, 0),
(23, 'displayAdminOrderTabShip', 'Display new elements in Back Office, AdminOrder, panel Shipping', 'This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Shipping panel tabs', 1, 0),
(24, 'displayAdminOrderContentOrder', 'Display new elements in Back Office, AdminOrder, panel Order', 'This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Order panel content', 1, 0),
(25, 'displayAdminOrderContentShip', 'Display new elements in Back Office, AdminOrder, panel Shipping', 'This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Shipping panel content', 1, 0),
(26, 'displayFooter', 'Footer', 'This hook displays new blocks in the footer', 1, 0),
(27, 'displayPDFInvoice', 'PDF Invoice', 'This hook allows you to display additional information on PDF invoices', 1, 0),
(28, 'displayInvoiceLegalFreeText', 'PDF Invoice - Legal Free Text', 'This hook allows you to modify the legal free text on PDF invoices', 1, 0),
(29, 'displayAdminCustomers', 'Display new elements in the Back Office, tab AdminCustomers', 'This hook launches modules when the AdminCustomers tab is displayed in the Back Office', 1, 0),
(30, 'displayOrderConfirmation', 'Order confirmation page', 'This hook is called within an order\'s confirmation page', 1, 0),
(31, 'actionCustomerAccountAdd', 'Successful customer account creation', 'This hook is called when a new customer creates an account successfully', 1, 0),
(32, 'displayCustomerAccount', 'Customer account displayed in Front Office', 'This hook displays new elements on the customer account page', 1, 0),
(33, 'displayCustomerIdentityForm', 'Customer identity form displayed in Front Office', 'This hook displays new elements on the form to update a customer identity', 1, 0),
(34, 'actionOrderSlipAdd', 'Order slip creation', 'This hook is called when a new credit slip is added regarding client order', 1, 0),
(35, 'displayProductTab', 'Tabs on product page', 'This hook is called on the product page\'s tab', 1, 0),
(36, 'displayProductTabContent', 'Tabs content on the product page', 'This hook is called on the product page\'s tab', 1, 0),
(37, 'displayShoppingCartFooter', 'Shopping cart footer', 'This hook displays some specific information on the shopping cart\'s page', 1, 0),
(38, 'displayCustomerAccountForm', 'Customer account creation form', 'This hook displays some information on the form to create a customer account', 1, 0),
(39, 'displayAdminStatsModules', 'Stats - Modules', '', 1, 0),
(40, 'displayAdminStatsGraphEngine', 'Graph engines', '', 1, 0),
(41, 'actionOrderReturn', 'Returned product', 'This hook is displayed when a customer returns a product ', 1, 0),
(42, 'displayProductButtons', 'Product page actions', 'This hook adds new action buttons on the product page', 1, 0),
(43, 'displayBackOfficeHome', 'Administration panel homepage', 'This hook is displayed on the admin panel\'s homepage', 1, 0),
(44, 'displayAdminStatsGridEngine', 'Grid engines', '', 1, 0),
(45, 'actionWatermark', 'Watermark', '', 1, 0),
(46, 'actionProductCancel', 'Product cancelled', 'This hook is called when you cancel a product in an order', 1, 0),
(47, 'displayLeftColumnProduct', 'New elements on the product page (left column)', 'This hook displays new elements in the left-hand column of the product page', 1, 0),
(48, 'actionProductOutOfStock', 'Out-of-stock product', 'This hook displays new action buttons if a product is out of stock', 1, 0),
(49, 'actionProductAttributeUpdate', 'Product attribute update', 'This hook is displayed when a product\'s attribute is updated', 1, 0),
(50, 'displayCarrierList', 'Extra carrier (module mode)', '', 1, 0),
(51, 'displayShoppingCart', 'Shopping cart - Additional button', 'This hook displays new action buttons within the shopping cart', 1, 0),
(52, 'actionSearch', 'Search', '', 1, 0),
(53, 'displayBeforePayment', 'Redirect during the order process', 'This hook redirects the user to the module instead of displaying payment modules', 1, 0),
(54, 'actionCarrierUpdate', 'Carrier Update', 'This hook is called when a carrier is updated', 1, 0),
(55, 'actionOrderStatusPostUpdate', 'Post update of order status', '', 1, 0),
(56, 'displayCustomerAccountFormTop', 'Block above the form for create an account', 'This hook is displayed above the customer\'s account creation form', 1, 0),
(57, 'displayBackOfficeHeader', 'Administration panel header', 'This hook is displayed in the header of the admin panel', 1, 0),
(58, 'displayBackOfficeTop', 'Administration panel hover the tabs', 'This hook is displayed on the roll hover of the tabs within the admin panel', 1, 0),
(59, 'displayBackOfficeFooter', 'Administration panel footer', 'This hook is displayed within the admin panel\'s footer', 1, 0),
(60, 'actionProductAttributeDelete', 'Product attribute deletion', 'This hook is displayed when a product\'s attribute is deleted', 1, 0),
(61, 'actionCarrierProcess', 'Carrier process', '', 1, 0),
(62, 'actionOrderDetail', 'Order detail', 'This hook is used to set the follow-up in Smarty when an order\'s detail is called', 1, 0),
(63, 'displayBeforeCarrier', 'Before carriers list', 'This hook is displayed before the carrier list in Front Office', 1, 0),
(64, 'displayOrderDetail', 'Order detail', 'This hook is displayed within the order\'s details in Front Office', 1, 0),
(65, 'actionPaymentCCAdd', 'Payment CC added', '', 1, 0),
(66, 'displayProductComparison', 'Extra product comparison', '', 1, 0),
(67, 'actionCategoryAdd', 'Category creation', 'This hook is displayed when a category is created', 1, 0),
(68, 'actionCategoryUpdate', 'Category modification', 'This hook is displayed when a category is modified', 1, 0),
(69, 'actionCategoryDelete', 'Category deletion', 'This hook is displayed when a category is deleted', 1, 0),
(70, 'actionBeforeAuthentication', 'Before authentication', 'This hook is displayed before the customer\'s authentication', 1, 0),
(71, 'actionSubmitIdentityBefore', 'Before identity modification', 'This hook is called before customer\'s identity modification', 1, 0),
(72, 'displayCartRoomImageAfter', 'After cart room image on checkout page', 'This hook is displayed after cart room image on checkout page', 1, 0),
(73, 'displayPaymentTop', 'Top of payment page', 'This hook is displayed at the top of the payment page', 1, 0),
(74, 'actionHtaccessCreate', 'After htaccess creation', 'This hook is displayed after the htaccess creation', 1, 0),
(75, 'actionAdminMetaSave', 'After saving the configuration in AdminMeta', 'This hook is displayed after saving the configuration in AdminMeta', 1, 0),
(76, 'displayAttributeGroupForm', 'Add fields to the form \'attribute group\'', 'This hook adds fields to the form \'attribute group\'', 1, 0),
(77, 'actionAttributeGroupSave', 'Saving an attribute group', 'This hook is called while saving an attributes group', 1, 0),
(78, 'actionAttributeGroupDelete', 'Deleting attribute group', 'This hook is called while deleting an attributes  group', 1, 0),
(79, 'displayFeatureForm', 'Add fields to the form \'feature\'', 'This hook adds fields to the form \'feature\'', 1, 0),
(80, 'actionFeatureSave', 'Saving attributes\' features', 'This hook is called while saving an attributes features', 1, 0),
(81, 'actionFeatureDelete', 'Deleting attributes\' features', 'This hook is called while deleting an attributes features', 1, 0),
(82, 'actionProductSave', 'Saving products', 'This hook is called while saving products', 1, 0),
(83, 'actionProductListOverride', 'Assign a products list to a category', 'This hook assigns a products list to a category', 1, 0),
(84, 'displayAttributeGroupPostProcess', 'On post-process in admin attribute group', 'This hook is called on post-process in admin attribute group', 1, 0),
(85, 'displayFeaturePostProcess', 'On post-process in admin feature', 'This hook is called on post-process in admin feature', 1, 0),
(86, 'displayFeatureValueForm', 'Add fields to the form \'feature value\'', 'This hook adds fields to the form \'feature value\'', 1, 0),
(87, 'displayFeatureValuePostProcess', 'On post-process in admin feature value', 'This hook is called on post-process in admin feature value', 1, 0),
(88, 'actionFeatureValueDelete', 'Deleting attributes\' features\' values', 'This hook is called while deleting an attributes features value', 1, 0),
(89, 'actionFeatureValueSave', 'Saving an attributes features value', 'This hook is called while saving an attributes features value', 1, 0),
(90, 'displayAttributeForm', 'Add fields to the form \'attribute value\'', 'This hook adds fields to the form \'attribute value\'', 1, 0),
(91, 'actionAttributePostProcess', 'On post-process in admin feature value', 'This hook is called on post-process in admin feature value', 1, 0),
(92, 'actionAttributeDelete', 'Deleting an attributes features value', 'This hook is called while deleting an attributes features value', 1, 0),
(93, 'actionAttributeSave', 'Saving an attributes features value', 'This hook is called while saving an attributes features value', 1, 0),
(94, 'actionTaxManager', 'Tax Manager Factory', '', 1, 0),
(95, 'displayMyAccountBlock', 'My account block', 'This hook displays extra information within the \'my account\' block\"', 1, 0),
(96, 'actionModuleInstallBefore', 'actionModuleInstallBefore', '', 1, 0),
(97, 'actionModuleInstallAfter', 'actionModuleInstallAfter', '', 1, 0),
(98, 'displayHomeTab', 'Home Page Tabs', 'This hook displays new elements on the homepage tabs', 1, 1),
(99, 'displayHomeTabContent', 'Home Page Tabs Content', 'This hook displays new elements on the homepage tabs content', 1, 1),
(100, 'displayTopColumn', 'Top column blocks', 'This hook displays new elements in the top of columns', 1, 1),
(101, 'displayBackOfficeCategory', 'Display new elements in the Back Office, tab AdminCategories', 'This hook launches modules when the AdminCategories tab is displayed in the Back Office', 1, 0),
(102, 'displayProductListFunctionalButtons', 'Display new elements in the Front Office, products list', 'This hook launches modules when the products list is displayed in the Front Office', 1, 0),
(103, 'displayNav', 'Navigation', '', 1, 1),
(104, 'displayOverrideTemplate', 'Change the default template of current controller', '', 1, 0),
(105, 'actionAdminLoginControllerSetMedia', 'Set media on admin login page header', 'This hook is called after adding media to admin login page header', 1, 0),
(106, 'actionOrderEdited', 'Order edited', 'This hook is called when an order is edited.', 1, 0),
(107, 'actionEmailAddBeforeContent', 'Add extra content before mail content', 'This hook is called just before fetching mail template', 1, 0),
(108, 'actionEmailAddAfterContent', 'Add extra content after mail content', 'This hook is called just after fetching mail template', 1, 0),
(109, 'displayCartExtraProductActions', 'Extra buttons in shopping cart', 'This hook adds extra buttons to the product lines, in the shopping cart', 1, 0),
(110, 'displayAfterHookTop', 'displayAfterHookTop', '', 1, 1),
(111, 'actionOrderHistoryAddAfter', 'actionOrderHistoryAddAfter', '', 0, 0),
(112, 'actionObjectProductDeleteBefore', 'actionObjectProductDeleteBefore', '', 0, 0),
(113, 'displayAfterDefautlFooterHook', 'displayAfterDefautlFooterHook', '', 1, 1),
(114, 'addWebserviceResources', 'addWebserviceResources', '', 0, 0),
(115, 'actionObjectLanguageAddAfter', 'actionObjectLanguageAddAfter', '', 0, 0),
(116, 'actionObjectProfileAddAfter', 'actionObjectProfileAddAfter', '', 0, 0),
(117, 'actionObjectProfileDeleteBefore', 'actionObjectProfileDeleteBefore', '', 0, 0),
(118, 'actionObjectGroupDeleteBefore', 'actionObjectGroupDeleteBefore', '', 0, 0),
(119, 'actionCartSummary', 'actionCartSummary', '', 0, 0),
(120, 'actionFrontControllerSetMedia', 'actionFrontControllerSetMedia', '', 0, 0),
(121, 'displayExternalNavigationHook', 'displayExternalNavigationHook', '', 1, 1),
(122, 'displayAfterHeaderHotelDesc', 'displayAfterHeaderHotelDesc', '', 1, 1),
(123, 'displayAddModuleSettingLink', 'displayAddModuleSettingLink', '', 1, 1),
(124, 'displayFooterNotificationHook', 'displayFooterNotificationHook', '', 1, 1),
(125, 'registerGDPRConsent', 'registerGDPRConsent', '', 0, 0),
(126, 'actionExportGDPRData', 'actionExportGDPRData', '', 0, 0),
(127, 'actionObjectCustomerUpdateBefore', 'actionObjectCustomerUpdateBefore', '', 0, 0),
(128, 'actionDeleteGDPRCustomer', 'actionDeleteGDPRCustomer', '', 0, 0),
(129, 'actionCustomerCartRulesModifier', 'actionCustomerCartRulesModifier', '', 0, 0),
(130, 'actionValidateCartRule', 'actionValidateCartRule', '', 0, 0),
(131, 'actionObjectCustomerDeleteAfter', 'actionObjectCustomerDeleteAfter', '', 0, 0),
(132, 'displayFooterMostLeftBlock', 'displayFooterMostLeftBlock', '', 1, 1),
(133, 'addOtherModuleSetting', 'addOtherModuleSetting', '', 0, 0),
(134, 'displayFooterExploreSectionHook', 'displayFooterExploreSectionHook', '', 1, 1),
(135, 'actionCleanData', 'actionCleanData', '', 0, 0),
(136, 'displayPaymentEU', 'displayPaymentEU', '', 1, 1),
(138, 'actionModuleRegisterHookAfter', 'actionModuleRegisterHookAfter', '', 0, 0),
(139, 'actionModuleUnRegisterHookAfter', 'actionModuleUnRegisterHookAfter', '', 0, 0),
(140, 'displayFooterBefore', 'displayFooterBefore', '', 1, 1),
(141, 'displayRoomTypeDetailRoomTypeNameAfter', 'displayRoomTypeDetailRoomTypeNameAfter', '', 1, 1),
(142, 'actionRoomBookingStatusUpdateAfter', 'actionRoomBookingStatusUpdateAfter', '', 0, 0),
(143, 'displayBookingAction', 'displayBookingAction', '', 1, 1),
(144, 'displayAdminAfterHeader', 'displayAdminAfterHeader', '', 1, 1),
(145, 'displayFooterPaymentInfo', 'displayFooterPaymentInfo', '', 1, 1),
(146, 'actionObjectCMSUpdateAfter', 'actionObjectCMSUpdateAfter', '', 0, 0),
(147, 'actionObjectCMSDeleteAfter', 'actionObjectCMSDeleteAfter', '', 0, 0),
(148, 'displayDefaultNavigationHook', 'displayDefaultNavigationHook', '', 1, 1),
(149, 'displayNavigationHook', 'displayNavigationHook', '', 1, 1),
(150, 'dashboardTop', 'dashboardTop', '', 0, 0),
(151, 'dashboardZoneTwo', 'dashboardZoneTwo', '', 0, 0),
(152, 'dashboardData', 'dashboardData', '', 0, 0),
(153, 'actionAdminControllerSetMedia', 'actionAdminControllerSetMedia', '', 0, 0),
(154, 'dashboardZoneOne', 'dashboardZoneOne', '', 0, 0),
(155, 'actionObjectOrderAddAfter', 'actionObjectOrderAddAfter', '', 0, 0),
(156, 'actionObjectCustomerAddAfter', 'actionObjectCustomerAddAfter', '', 0, 0),
(157, 'actionObjectCustomerMessageAddAfter', 'actionObjectCustomerMessageAddAfter', '', 0, 0),
(158, 'actionObjectCustomerThreadAddAfter', 'actionObjectCustomerThreadAddAfter', '', 0, 0),
(159, 'actionObjectOrderReturnAddAfter', 'actionObjectOrderReturnAddAfter', '', 0, 0),
(160, 'actionCartListOverride', 'actionCartListOverride', '', 0, 0),
(161, 'displayAdminListBefore', 'displayAdminListBefore', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_hook_alias`
--

CREATE TABLE `qlo_hook_alias` (
  `id_hook_alias` int(10) UNSIGNED NOT NULL,
  `alias` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_hook_alias`
--

INSERT INTO `qlo_hook_alias` (`id_hook_alias`, `alias`, `name`) VALUES
(1, 'payment', 'displayPayment'),
(2, 'newOrder', 'actionValidateOrder'),
(3, 'paymentConfirm', 'actionPaymentConfirmation'),
(4, 'paymentReturn', 'displayPaymentReturn'),
(5, 'updateQuantity', 'actionUpdateQuantity'),
(6, 'rightColumn', 'displayRightColumn'),
(7, 'leftColumn', 'displayLeftColumn'),
(8, 'home', 'displayHome'),
(9, 'displayHeader', 'Header'),
(10, 'cart', 'actionCartSave'),
(11, 'authentication', 'actionAuthentication'),
(12, 'addproduct', 'actionProductAdd'),
(13, 'updateproduct', 'actionProductUpdate'),
(14, 'top', 'displayTop'),
(15, 'extraRight', 'displayRightColumnProduct'),
(16, 'deleteproduct', 'actionProductDelete'),
(17, 'productfooter', 'displayFooterProduct'),
(18, 'invoice', 'displayInvoice'),
(19, 'updateOrderStatus', 'actionOrderStatusUpdate'),
(20, 'adminOrder', 'displayAdminOrder'),
(21, 'footer', 'displayFooter'),
(22, 'PDFInvoice', 'displayPDFInvoice'),
(23, 'adminCustomers', 'displayAdminCustomers'),
(24, 'orderConfirmation', 'displayOrderConfirmation'),
(25, 'createAccount', 'actionCustomerAccountAdd'),
(26, 'customerAccount', 'displayCustomerAccount'),
(27, 'orderSlip', 'actionOrderSlipAdd'),
(28, 'productTab', 'displayProductTab'),
(29, 'productTabContent', 'displayProductTabContent'),
(30, 'shoppingCart', 'displayShoppingCartFooter'),
(31, 'createAccountForm', 'displayCustomerAccountForm'),
(32, 'AdminStatsModules', 'displayAdminStatsModules'),
(33, 'GraphEngine', 'displayAdminStatsGraphEngine'),
(34, 'orderReturn', 'actionOrderReturn'),
(35, 'productActions', 'displayProductButtons'),
(36, 'backOfficeHome', 'displayBackOfficeHome'),
(37, 'GridEngine', 'displayAdminStatsGridEngine'),
(38, 'watermark', 'actionWatermark'),
(39, 'cancelProduct', 'actionProductCancel'),
(40, 'extraLeft', 'displayLeftColumnProduct'),
(41, 'productOutOfStock', 'actionProductOutOfStock'),
(42, 'updateProductAttribute', 'actionProductAttributeUpdate'),
(43, 'extraCarrier', 'displayCarrierList'),
(44, 'shoppingCartExtra', 'displayShoppingCart'),
(45, 'search', 'actionSearch'),
(46, 'backBeforePayment', 'displayBeforePayment'),
(47, 'updateCarrier', 'actionCarrierUpdate'),
(48, 'postUpdateOrderStatus', 'actionOrderStatusPostUpdate'),
(49, 'createAccountTop', 'displayCustomerAccountFormTop'),
(50, 'backOfficeHeader', 'displayBackOfficeHeader'),
(51, 'backOfficeTop', 'displayBackOfficeTop'),
(52, 'backOfficeFooter', 'displayBackOfficeFooter'),
(53, 'deleteProductAttribute', 'actionProductAttributeDelete'),
(54, 'processCarrier', 'actionCarrierProcess'),
(55, 'orderDetail', 'actionOrderDetail'),
(56, 'beforeCarrier', 'displayBeforeCarrier'),
(57, 'orderDetailDisplayed', 'displayOrderDetail'),
(58, 'paymentCCAdded', 'actionPaymentCCAdd'),
(59, 'extraProductComparison', 'displayProductComparison'),
(60, 'categoryAddition', 'actionCategoryAdd'),
(61, 'categoryUpdate', 'actionCategoryUpdate'),
(62, 'categoryDeletion', 'actionCategoryDelete'),
(63, 'beforeAuthentication', 'actionBeforeAuthentication'),
(64, 'paymentTop', 'displayPaymentTop'),
(65, 'afterCreateHtaccess', 'actionHtaccessCreate'),
(66, 'afterSaveAdminMeta', 'actionAdminMetaSave'),
(67, 'attributeGroupForm', 'displayAttributeGroupForm'),
(68, 'afterSaveAttributeGroup', 'actionAttributeGroupSave'),
(69, 'afterDeleteAttributeGroup', 'actionAttributeGroupDelete'),
(70, 'featureForm', 'displayFeatureForm'),
(71, 'afterSaveFeature', 'actionFeatureSave'),
(72, 'afterDeleteFeature', 'actionFeatureDelete'),
(73, 'afterSaveProduct', 'actionProductSave'),
(74, 'productListAssign', 'actionProductListOverride'),
(75, 'postProcessAttributeGroup', 'displayAttributeGroupPostProcess'),
(76, 'postProcessFeature', 'displayFeaturePostProcess'),
(77, 'featureValueForm', 'displayFeatureValueForm'),
(78, 'postProcessFeatureValue', 'displayFeatureValuePostProcess'),
(79, 'afterDeleteFeatureValue', 'actionFeatureValueDelete'),
(80, 'afterSaveFeatureValue', 'actionFeatureValueSave'),
(81, 'attributeForm', 'displayAttributeForm'),
(82, 'postProcessAttribute', 'actionAttributePostProcess'),
(83, 'afterDeleteAttribute', 'actionAttributeDelete'),
(84, 'afterSaveAttribute', 'actionAttributeSave'),
(85, 'taxManager', 'actionTaxManager'),
(86, 'myAccountBlock', 'displayMyAccountBlock');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_hook_module`
--

CREATE TABLE `qlo_hook_module` (
  `id_module` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_hook` int(10) UNSIGNED NOT NULL,
  `position` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_hook_module`
--

INSERT INTO `qlo_hook_module` (`id_module`, `id_shop`, `id_hook`, `position`) VALUES
(1, 1, 10, 1),
(1, 1, 15, 1),
(1, 1, 26, 1),
(1, 1, 55, 1),
(1, 1, 57, 1),
(1, 1, 82, 1),
(1, 1, 103, 1),
(1, 1, 110, 1),
(1, 1, 111, 1),
(1, 1, 112, 1),
(1, 1, 113, 1),
(1, 1, 114, 1),
(1, 1, 115, 1),
(1, 1, 116, 1),
(1, 1, 117, 1),
(1, 1, 118, 1),
(1, 1, 119, 1),
(1, 1, 120, 1),
(1, 1, 121, 1),
(2, 1, 8, 1),
(2, 1, 122, 1),
(2, 1, 123, 1),
(3, 1, 26, 1),
(3, 1, 31, 1),
(3, 1, 124, 1),
(3, 1, 125, 1),
(3, 1, 126, 1),
(3, 1, 127, 1),
(3, 1, 128, 1),
(3, 1, 129, 1),
(3, 1, 130, 1),
(3, 1, 131, 1),
(4, 1, 132, 1),
(5, 1, 133, 1),
(6, 1, 9, 1),
(6, 1, 134, 1),
(8, 1, 17, 1),
(8, 1, 135, 1),
(10, 1, 1, 1),
(10, 1, 5, 1),
(10, 1, 136, 1),
(12, 1, 138, 1),
(12, 1, 139, 1),
(15, 1, 35, 1),
(15, 1, 36, 1),
(15, 1, 140, 1),
(15, 1, 141, 1),
(15, 1, 142, 1),
(15, 1, 143, 1),
(15, 1, 144, 1),
(18, 1, 145, 1),
(20, 1, 146, 1),
(20, 1, 147, 1),
(20, 1, 148, 1),
(20, 1, 149, 1),
(21, 1, 150, 1),
(21, 1, 151, 1),
(21, 1, 152, 1),
(21, 1, 153, 1),
(22, 1, 154, 1),
(23, 1, 155, 1),
(23, 1, 156, 1),
(23, 1, 157, 1),
(23, 1, 158, 1),
(23, 1, 159, 1),
(27, 1, 52, 1),
(30, 1, 40, 1),
(32, 1, 39, 1),
(51, 1, 160, 1),
(53, 1, 2, 1),
(53, 1, 161, 1),
(2, 1, 10, 2),
(2, 1, 110, 2),
(2, 1, 120, 2),
(5, 1, 8, 2),
(6, 1, 115, 2),
(7, 1, 9, 2),
(7, 1, 134, 2),
(8, 1, 82, 2),
(11, 1, 1, 2),
(11, 1, 5, 2),
(11, 1, 136, 2),
(13, 1, 103, 2),
(13, 1, 121, 2),
(15, 1, 57, 2),
(15, 1, 135, 2),
(20, 1, 15, 2),
(22, 1, 152, 2),
(22, 1, 153, 2),
(24, 1, 55, 2),
(24, 1, 151, 2),
(27, 1, 155, 2),
(29, 1, 154, 2),
(33, 1, 39, 2),
(3, 1, 10, 3),
(7, 1, 115, 3),
(8, 1, 9, 3),
(8, 1, 134, 3),
(12, 1, 8, 3),
(13, 1, 120, 3),
(14, 1, 103, 3),
(14, 1, 121, 3),
(16, 1, 26, 3),
(23, 1, 152, 3),
(23, 1, 153, 3),
(23, 1, 154, 3),
(25, 1, 151, 3),
(34, 1, 39, 3),
(35, 1, 15, 3),
(53, 1, 57, 3),
(1, 1, 8, 4),
(5, 1, 10, 4),
(8, 1, 115, 4),
(9, 1, 9, 4),
(9, 1, 134, 4),
(14, 1, 120, 4),
(17, 1, 26, 4),
(24, 1, 152, 4),
(24, 1, 153, 4),
(26, 1, 151, 4),
(35, 1, 39, 4),
(44, 1, 15, 4),
(52, 1, 121, 4),
(9, 1, 115, 5),
(12, 1, 10, 5),
(15, 1, 120, 5),
(19, 1, 26, 5),
(25, 1, 152, 5),
(25, 1, 153, 5),
(27, 1, 151, 5),
(36, 1, 39, 5),
(51, 1, 15, 5),
(20, 1, 26, 6),
(20, 1, 115, 6),
(26, 1, 152, 6),
(26, 1, 153, 6),
(29, 1, 151, 6),
(37, 1, 39, 6),
(51, 1, 10, 6),
(52, 1, 15, 6),
(27, 1, 152, 7),
(27, 1, 153, 7),
(28, 1, 151, 7),
(31, 1, 26, 7),
(38, 1, 39, 7),
(52, 1, 10, 7),
(28, 1, 152, 8),
(28, 1, 153, 8),
(39, 1, 39, 8),
(29, 1, 152, 9),
(29, 1, 153, 9),
(40, 1, 39, 9),
(30, 1, 153, 10),
(41, 1, 39, 10),
(38, 1, 153, 11),
(42, 1, 39, 11),
(43, 1, 39, 12),
(53, 1, 153, 12),
(44, 1, 39, 13),
(45, 1, 39, 14),
(46, 1, 39, 15),
(47, 1, 39, 16),
(48, 1, 39, 17),
(49, 1, 39, 18),
(50, 1, 39, 19);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_hook_module_exceptions`
--

CREATE TABLE `qlo_hook_module_exceptions` (
  `id_hook_module_exceptions` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_module` int(10) UNSIGNED NOT NULL,
  `id_hook` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_hook_module_exceptions`
--

INSERT INTO `qlo_hook_module_exceptions` (`id_hook_module_exceptions`, `id_shop`, `id_module`, `id_hook`, `file_name`) VALUES
(1, 1, 12, 8, 'category');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_access`
--

CREATE TABLE `qlo_htl_access` (
  `id_profile` int(10) UNSIGNED NOT NULL,
  `id_hotel` int(10) UNSIGNED NOT NULL,
  `access` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_access`
--

INSERT INTO `qlo_htl_access` (`id_profile`, `id_hotel`, `access`) VALUES
(1, 1, 1),
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_advance_payment`
--

CREATE TABLE `qlo_htl_advance_payment` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `payment_type` tinyint(4) NOT NULL,
  `value` decimal(20,6) NOT NULL,
  `id_currency` int(11) NOT NULL,
  `tax_include` tinyint(4) NOT NULL,
  `calculate_from` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_advance_payment`
--

INSERT INTO `qlo_htl_advance_payment` (`id`, `id_product`, `payment_type`, `value`, `id_currency`, `tax_include`, `calculate_from`, `active`, `date_add`, `date_upd`) VALUES
(1, 1, 0, 0.000000, 0, 0, 0, 0, '2025-08-07 02:32:24', '2025-08-08 21:38:27'),
(2, 2, 0, 0.000000, 0, 0, 0, 0, '2025-08-07 02:32:25', '2025-08-07 02:32:25'),
(3, 3, 0, 0.000000, 0, 0, 0, 0, '2025-08-07 02:32:26', '2025-08-07 02:32:26'),
(4, 4, 0, 0.000000, 0, 0, 0, 0, '2025-08-07 02:32:27', '2025-08-17 05:37:56'),
(5, 11, 1, 0.000000, 0, 1, 0, 1, '2025-08-14 04:12:05', '2025-08-17 05:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_bed_type`
--

CREATE TABLE `qlo_htl_bed_type` (
  `id_bed_type` int(11) NOT NULL,
  `length` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `width` decimal(20,6) NOT NULL DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_bed_type`
--

INSERT INTO `qlo_htl_bed_type` (`id_bed_type`, `length`, `width`) VALUES
(1, 6.250000, 3.160000),
(2, 6.660000, 3.160000),
(3, 6.250000, 4.500000),
(4, 6.660000, 5.000000),
(5, 6.660000, 6.330000),
(6, 7.000000, 6.000000),
(7, 6.250000, 3.160000),
(8, 6.250000, 4.500000),
(9, 6.660000, 5.000000);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_bed_type_lang`
--

CREATE TABLE `qlo_htl_bed_type_lang` (
  `id_bed_type` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_lang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_bed_type_lang`
--

INSERT INTO `qlo_htl_bed_type_lang` (`id_bed_type`, `name`, `id_lang`) VALUES
(1, 'Twin Bed', 1),
(2, 'Twin XL Bed', 1),
(3, 'Full Bed', 1),
(4, 'Queen Bed', 1),
(5, 'King Bed', 1),
(6, 'California King Bed', 1),
(7, 'Bunk Bed', 1),
(8, 'Sofa Bed', 1),
(9, 'Murphy Bed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_booking_demands`
--

CREATE TABLE `qlo_htl_booking_demands` (
  `id_booking_demand` int(11) NOT NULL,
  `id_htl_booking` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit_price_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_price_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_price_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `price_calc_method` int(11) UNSIGNED DEFAULT 0,
  `id_tax_rules_group` int(11) UNSIGNED DEFAULT 0,
  `tax_computation_method` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_booking_demands_tax`
--

CREATE TABLE `qlo_htl_booking_demands_tax` (
  `id_booking_demand` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `unit_amount` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `total_amount` decimal(16,6) NOT NULL DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_booking_detail`
--

CREATE TABLE `qlo_htl_booking_detail` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_order_detail` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `booking_type` tinyint(4) NOT NULL,
  `id_status` int(11) NOT NULL,
  `comment` text NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `planned_check_out` datetime NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `total_price_tax_excl` decimal(20,6) NOT NULL,
  `total_price_tax_incl` decimal(20,6) NOT NULL,
  `total_paid_amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `is_back_order` tinyint(4) NOT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `room_type_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` varchar(12) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `check_in_time` varchar(32) DEFAULT NULL,
  `check_out_time` varchar(32) DEFAULT NULL,
  `room_num` varchar(225) DEFAULT NULL,
  `adults` smallint(6) NOT NULL DEFAULT 0,
  `children` smallint(6) NOT NULL DEFAULT 0,
  `child_ages` text NOT NULL,
  `is_refunded` tinyint(1) NOT NULL DEFAULT 0,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_booking_document`
--

CREATE TABLE `qlo_htl_booking_document` (
  `id_htl_booking_document` int(11) NOT NULL,
  `id_htl_booking` int(11) NOT NULL,
  `title` varchar(32) NOT NULL DEFAULT '',
  `file_type` tinyint(1) NOT NULL DEFAULT 0,
  `file_name` varchar(8) NOT NULL DEFAULT '',
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_branch_features`
--

CREATE TABLE `qlo_htl_branch_features` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_hotel` int(10) UNSIGNED NOT NULL,
  `feature_id` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_branch_features`
--

INSERT INTO `qlo_htl_branch_features` (`id`, `id_hotel`, `feature_id`, `date_add`, `date_upd`) VALUES
(43, 2, '113', '2025-08-14 04:16:05', '2025-08-14 04:16:05'),
(44, 2, '114', '2025-08-14 04:16:05', '2025-08-14 04:16:05'),
(45, 2, '115', '2025-08-14 04:16:05', '2025-08-14 04:16:05'),
(46, 2, '116', '2025-08-14 04:16:05', '2025-08-14 04:16:05'),
(47, 2, '117', '2025-08-14 04:16:05', '2025-08-14 04:16:05'),
(48, 2, '118', '2025-08-14 04:16:05', '2025-08-14 04:16:05'),
(49, 2, '119', '2025-08-14 04:16:05', '2025-08-14 04:16:05'),
(50, 2, '120', '2025-08-14 04:16:05', '2025-08-14 04:16:05'),
(51, 2, '121', '2025-08-14 04:16:05', '2025-08-14 04:16:05'),
(55, 1, '11', '2025-08-17 05:35:29', '2025-08-17 05:35:29'),
(56, 1, '12', '2025-08-17 05:35:29', '2025-08-17 05:35:29'),
(57, 1, '14', '2025-08-17 05:35:29', '2025-08-17 05:35:29');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_branch_info`
--

CREATE TABLE `qlo_htl_branch_info` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_category` int(10) UNSIGNED NOT NULL,
  `email` varchar(128) NOT NULL,
  `check_in` varchar(255) DEFAULT NULL,
  `check_out` varchar(255) DEFAULT NULL,
  `rating` int(2) UNSIGNED NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `map_formated_address` text NOT NULL,
  `map_input_text` text NOT NULL,
  `active_refund` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `fax` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_branch_info`
--

INSERT INTO `qlo_htl_branch_info` (`id`, `id_category`, `email`, `check_in`, `check_out`, `rating`, `active`, `latitude`, `longitude`, `map_formated_address`, `map_input_text`, `active_refund`, `fax`, `date_add`, `date_upd`) VALUES
(1, 8, 'hotelprime@htl.com', '12:00', '11:00', 3, 1, 0.00000000, 0.00000000, '', '', 0, '', '2025-08-07 02:32:23', '2025-08-17 05:35:29'),
(2, 15, '123123@gmail.com', '12:00', '03:10', 5, 1, 0.00000000, 0.00000000, '', '', 0, '', '2025-08-08 06:09:39', '2025-08-14 04:16:05');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_branch_info_lang`
--

CREATE TABLE `qlo_htl_branch_info_lang` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `policies` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_branch_info_lang`
--

INSERT INTO `qlo_htl_branch_info_lang` (`id`, `id_lang`, `hotel_name`, `short_description`, `description`, `policies`) VALUES
(1, 1, 'The Hotel Prime', 'The Hotel Prime is the perfect destination for both business and leisure travelers seeking a memorable stay.', '<div>\r\n<h4><strong>Welcome to The Hotel Prime!</strong></h4>\r\n<br />\r\n<div>Our hotel is the perfect destination for both business and leisure travelers seeking a memorable stay.</div>\r\n<br />\r\n<div>Benefits of staying at The Hotel Prime!</div>\r\n<br />\r\n<div><strong>Accommodation:</strong></div>\r\n<div>Indulge in our well-appointed rooms and suites, exquisitely designed to provide a tranquil haven after a long day of exploration or meetings. Each room is tastefully furnished with modern amenities, including a plush bed, a spacious work desk, high-speed Wi-Fi, a TV, and a private bathroom adorned with luxurious toiletries.</div>\r\n<br />\r\n<div><strong>Dining:</strong></div>\r\n<div>Savor a delightful culinary experience at our onsite restaurant, where our world-class chefs craft delectable dishes using the finest ingredients. Whether you crave international flavors or local specialties, our diverse menu is sure to satisfy every palate. Enjoy a romantic dinner for two or gather with friends and family in our inviting dining ambiance.</div>\r\n<br />\r\n<div><strong>Facilities:</strong></div>\r\n<div>We believe in providing our guests with a range of facilities to enhance their stay. Take a refreshing dip in our sparkling swimming pool, work up a sweat in our state-of-the-art fitness center, or unwind with a rejuvenating spa treatment. Our attentive staff is always on hand to ensure your needs are met with utmost care and professionalism.</div>\r\n<br />\r\n<div><strong>Events and Meetings:</strong></div>\r\n<div>Host your next corporate event or special occasion in our versatile event spaces, equipped with the latest audiovisual technology and flexible seating arrangements. From intimate boardroom meetings to grand celebrations, our dedicated event planners will assist you in creating a seamless and successful gathering.</div>\r\n<br />\r\n<div><strong>Location:</strong></div>\r\n<div>Conveniently located close to major attractions and business districts, our hotel offers easy access to Alabamas vibrant shopping districts, cultural landmarks, and entertainment venues. Whether you\'re here for business or leisure, our prime location ensures that you\'re never far from the action.</div>\r\n<br />\r\n<div><strong>Exceptional Service:</strong></div>\r\n<div>At The Hotel Prime, we take pride in delivering exceptional service to our guests. From the moment you step through our doors, our friendly and knowledgeable staff will cater to your every need, ensuring a memorable and personalized stay.</div>\r\n<br />\r\n<div><strong>Book Your Stay:</strong></div>\r\n<div>Ready to experience the epitome of luxury and comfort? Book your stay at The Hotel Prime today and let us create an unforgettable experience for you. Whether you\'re traveling solo, with a loved one, or with a group, our hotel is dedicated to surpassing your expectations and making your stay truly exceptional.</div>\r\n</div>', '<div>\r\n<div>- Accommodation will only be provided to guests whose details are registered with the hotel front desk.</div>\r\n<div>- Guests are required to show a valid photo identification during check-in.</div>\r\n<div>- GST / Taxes are charged extra and applicable as per government directives.</div>\r\n<div>- 100 % advance Payment deposit at the time of Check-in.</div>\r\n<div>- The check-in time is 12:00 PM &amp; check-out time is 11:00 AM. (Subject to availability, early check-in, and late check-out will be considered)</div>\r\n<div>- The hotel may deny further accommodation to a guest who does not prove to be decent and comply with the hotel policy and rules.</div>\r\n<div>- The guest has to bear any loss caused by them to the hotel property.</div>\r\n</div>'),
(2, 1, 'Luxury Lisbon Apartment T2', 'Luxury Lisbon Apartment T2 in Lisboa offers a convenient location with Rossio a 19-minute walk away and Dona Maria II National Theater 0.6 mi nearby. Humberto Delgado Airport is 4.3 mi from the property.', '<h3 class=\"e7addce19e f531cf0753\">About this property</h3>\r\n<p class=\"b99b6ef58f f1152bae71\"><b>Prime City Center Location:</b> Luxury Lisbon Apartment T2 in Lisboa offers a convenient location with Rossio a 19-minute walk away and Dona Maria II National Theater 0.6 mi nearby. Humberto Delgado Airport is 4.3 mi from the property.</p>\r\n<p class=\"b99b6ef58f f1152bae71\"><b>Exceptional Facilities:</b> Guests enjoy beachfront access, spa facilities, and free WiFi. Additional amenities include a hot tub, private check-in and check-out, concierge service, and free on-site parking.</p>\r\n<p class=\"b99b6ef58f f1152bae71\"><b>Spacious Accommodations:</b> The apartment features two bedrooms, two bathrooms, and a comfortable living room. Equipped with air-conditioning, a fully fitted kitchen, and modern amenities, it ensures a pleasant stay.</p>\r\n<p class=\"b99b6ef58f f1152bae71\"><b>Nearby Attractions:</b> Explore nearby landmarks such as Miradouro da Senhora do Monte (1.2 mi) and St. George\'s Castle (1.9 mi). Guests can also enjoy activities like skiing and cycling.</p>', '');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_branch_refund_rules`
--

CREATE TABLE `qlo_htl_branch_refund_rules` (
  `id_hotel_refund_rule` int(11) NOT NULL,
  `id_refund_rule` int(10) UNSIGNED NOT NULL,
  `id_hotel` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_cart_booking_data`
--

CREATE TABLE `qlo_htl_cart_booking_data` (
  `id` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_guest` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_currency` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `booking_type` tinyint(4) NOT NULL,
  `comment` text NOT NULL,
  `is_back_order` tinyint(4) NOT NULL,
  `extra_demands` text NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `adults` smallint(6) NOT NULL,
  `children` smallint(6) NOT NULL,
  `child_ages` text NOT NULL,
  `is_refunded` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_custom_navigation_link`
--

CREATE TABLE `qlo_htl_custom_navigation_link` (
  `id_navigation_link` int(11) NOT NULL,
  `link` text NOT NULL,
  `is_custom_link` tinyint(1) NOT NULL,
  `id_cms` int(11) NOT NULL DEFAULT 0,
  `position` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `show_at_navigation` tinyint(1) NOT NULL DEFAULT 0,
  `show_at_footer` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `qlo_htl_custom_navigation_link`
--

INSERT INTO `qlo_htl_custom_navigation_link` (`id_navigation_link`, `link`, `is_custom_link`, `id_cms`, `position`, `show_at_navigation`, `show_at_footer`, `active`, `date_add`, `date_upd`) VALUES
(1, 'index', 0, 0, 0, 1, 0, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(2, 'http://localhost/qloapps/our-properties', 1, 0, 1, 1, 0, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(3, '/qloapps/#hotelInteriorBlock', 1, 0, 2, 1, 0, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(4, '/qloapps/#hotelAmenitiesBlock', 1, 0, 3, 1, 0, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(5, '/qloapps/#hotelRoomsBlock', 1, 0, 4, 1, 0, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(6, '/qloapps/#hotelTestimonialBlock', 1, 0, 5, 1, 0, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(7, '', 0, 1, 6, 0, 1, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(8, '', 0, 2, 7, 1, 1, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(9, '', 0, 3, 8, 0, 1, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(10, '', 0, 4, 9, 1, 1, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(11, '', 0, 5, 10, 0, 1, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(12, 'contact', 0, 0, 11, 1, 0, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_custom_navigation_link_lang`
--

CREATE TABLE `qlo_htl_custom_navigation_link_lang` (
  `id_navigation_link` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_custom_navigation_link_lang`
--

INSERT INTO `qlo_htl_custom_navigation_link_lang` (`id_navigation_link`, `id_lang`, `name`) VALUES
(1, 1, 'Home'),
(2, 1, 'Our Properties'),
(3, 1, 'Interior'),
(4, 1, 'Amenities'),
(5, 1, 'Rooms'),
(6, 1, 'Testimonials'),
(7, 1, ''),
(8, 1, ''),
(9, 1, ''),
(10, 1, ''),
(11, 1, ''),
(12, 1, 'Contact Us');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_features`
--

CREATE TABLE `qlo_htl_features` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_feature_id` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `active` int(2) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_features`
--

INSERT INTO `qlo_htl_features` (`id`, `parent_feature_id`, `position`, `active`, `date_add`, `date_upd`) VALUES
(9, 0, 2, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(10, 9, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(11, 9, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(12, 9, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(13, 9, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(14, 9, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(64, 0, 9, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(65, 64, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(66, 64, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(67, 64, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(92, 0, 11, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(93, 92, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(94, 92, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(95, 92, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(96, 92, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(97, 92, 0, 1, '2025-08-07 02:32:23', '2025-08-07 02:32:23'),
(111, 0, 1, 1, '2025-08-14 04:04:10', '2025-08-14 04:04:38'),
(113, 111, 0, 1, '2025-08-14 04:04:38', '2025-08-14 04:04:38'),
(114, 111, 0, 1, '2025-08-14 04:04:38', '2025-08-14 04:04:38'),
(115, 111, 0, 1, '2025-08-14 04:04:38', '2025-08-14 04:04:38'),
(116, 111, 0, 1, '2025-08-14 04:04:38', '2025-08-14 04:04:38'),
(117, 111, 0, 1, '2025-08-14 04:04:38', '2025-08-14 04:04:38'),
(118, 111, 0, 1, '2025-08-14 04:04:38', '2025-08-14 04:04:38'),
(119, 111, 0, 1, '2025-08-14 04:04:38', '2025-08-14 04:04:38'),
(120, 111, 0, 1, '2025-08-14 04:04:38', '2025-08-14 04:04:38'),
(121, 111, 0, 1, '2025-08-14 04:04:38', '2025-08-14 04:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_features_block_data`
--

CREATE TABLE `qlo_htl_features_block_data` (
  `id_features_block` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_features_block_data`
--

INSERT INTO `qlo_htl_features_block_data` (`id_features_block`, `active`, `position`, `date_add`, `date_upd`) VALUES
(1, 1, 0, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(2, 1, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(3, 1, 2, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(4, 1, 3, '2025-08-07 02:32:33', '2025-08-07 02:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_features_block_data_lang`
--

CREATE TABLE `qlo_htl_features_block_data_lang` (
  `id_features_block` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `feature_title` text NOT NULL,
  `feature_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_features_block_data_lang`
--

INSERT INTO `qlo_htl_features_block_data_lang` (`id_features_block`, `id_lang`, `feature_title`, `feature_description`) VALUES
(1, 1, 'Luxurious Rooms', 'Experience unparalleled comfort in our luxurious rooms, featuring premium amenities and stunning views of the lake or cityscape.'),
(2, 1, 'World class chefs', 'Experience culinary excellence with world-class chefs, where gourmet dishes are crafted from the finest local ingredients.'),
(3, 1, 'Restaurants', 'Savor exquisite dining at our restaurant, where a delightful menu is crafted from the finest local ingredients.'),
(4, 1, 'Gym & Spa', 'Rejuvenate with our state-of-the-art gym and spa, offering a sanctuary for relaxation and fitness.');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_features_lang`
--

CREATE TABLE `qlo_htl_features_lang` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_features_lang`
--

INSERT INTO `qlo_htl_features_lang` (`id`, `id_lang`, `name`) VALUES
(9, 1, 'Complementary'),
(10, 1, 'Internet Access Free'),
(11, 1, 'Transfer Available'),
(12, 1, 'NewsPaper In Lobby'),
(13, 1, 'Shopping Drop Facility'),
(14, 1, 'Welcome Drinks'),
(64, 1, 'Parking'),
(65, 1, 'Parking (Surcharge)'),
(66, 1, 'Parking Facilities Available'),
(67, 1, 'Valet service'),
(92, 1, 'Water Amenities'),
(93, 1, 'Swimming Pool'),
(94, 1, 'Jacuzzi'),
(95, 1, 'Private / Plunge Pool'),
(96, 1, 'Sauna'),
(97, 1, 'Whirlpool Bath / Shower Cubicle'),
(111, 1, 'General'),
(113, 1, 'The entire place is yours'),
(114, 1, '1141 ft² size'),
(115, 1, 'Airport shuttle'),
(116, 1, 'Free on-site parking'),
(117, 1, 'Private bathroom'),
(118, 1, 'Free Wifi'),
(119, 1, 'Hot tub'),
(120, 1, 'Pet friendly'),
(121, 1, 'Air conditioning');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_footer_payment_block_info`
--

CREATE TABLE `qlo_htl_footer_payment_block_info` (
  `id_payment_block` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_footer_payment_block_info`
--

INSERT INTO `qlo_htl_footer_payment_block_info` (`id_payment_block`, `name`, `active`, `position`, `date_add`, `date_upd`) VALUES
(1, 'Visa', 1, 0, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(2, 'American Express', 1, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(3, 'MasterCard', 1, 2, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(4, 'Paypal', 1, 3, '2025-08-07 02:32:33', '2025-08-07 02:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_image`
--

CREATE TABLE `qlo_htl_image` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_hotel` int(10) UNSIGNED NOT NULL,
  `cover` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_image`
--

INSERT INTO `qlo_htl_image` (`id`, `id_hotel`, `cover`) VALUES
(2, 2, 0),
(3, 2, 0),
(4, 2, 0),
(5, 2, 0),
(6, 2, 0),
(7, 2, 0),
(8, 2, 0),
(9, 2, 0),
(10, 2, 0),
(11, 2, 0),
(12, 2, 0),
(13, 2, 0),
(14, 2, 0),
(15, 2, 0),
(16, 2, 0),
(17, 2, 0),
(18, 2, 0),
(19, 2, 0),
(20, 2, 0),
(21, 2, 0),
(22, 2, 0),
(23, 2, 0),
(24, 2, 0),
(25, 2, 1),
(26, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_interior_image`
--

CREATE TABLE `qlo_htl_interior_image` (
  `id_interior_image` int(11) NOT NULL,
  `name` text NOT NULL,
  `display_name` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_interior_image`
--

INSERT INTO `qlo_htl_interior_image` (`id_interior_image`, `name`, `display_name`, `active`, `position`, `date_add`, `date_upd`) VALUES
(1, '1', 'Dummy Image 1', 1, 0, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(2, '2', 'Dummy Image 2', 1, 1, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(3, '3', 'Dummy Image 3', 1, 2, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(4, '4', 'Dummy Image 4', 1, 3, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(5, '5', 'Dummy Image 5', 1, 4, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(6, '6', 'Dummy Image 6', 1, 5, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(7, '7', 'Dummy Image 7', 1, 6, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(8, '8', 'Dummy Image 8', 1, 7, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(9, '9', 'Dummy Image 9', 1, 8, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(10, '10', 'Dummy Image 10', 1, 9, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(11, '11', 'Dummy Image 11', 1, 10, '2025-08-07 02:32:32', '2025-08-07 02:32:32'),
(12, '12', 'Dummy Image 12', 1, 11, '2025-08-07 02:32:32', '2025-08-07 02:32:32');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_order_refund_rules`
--

CREATE TABLE `qlo_htl_order_refund_rules` (
  `id_refund_rule` int(11) NOT NULL,
  `payment_type` int(2) UNSIGNED NOT NULL,
  `deduction_value_full_pay` decimal(20,6) NOT NULL,
  `deduction_value_adv_pay` decimal(20,6) NOT NULL,
  `days` decimal(35,0) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_order_refund_rules_lang`
--

CREATE TABLE `qlo_htl_order_refund_rules_lang` (
  `id_refund_rule` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_order_restrict_date`
--

CREATE TABLE `qlo_htl_order_restrict_date` (
  `id` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `use_global_max_checkout_offset` tinyint(1) NOT NULL,
  `max_checkout_offset` int(11) NOT NULL,
  `use_global_min_booking_offset` tinyint(1) NOT NULL,
  `min_booking_offset` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_order_restrict_date`
--

INSERT INTO `qlo_htl_order_restrict_date` (`id`, `id_hotel`, `use_global_max_checkout_offset`, `max_checkout_offset`, `use_global_min_booking_offset`, `min_booking_offset`, `date_add`, `date_upd`) VALUES
(1, 1, 1, 0, 1, 0, '2025-08-08 06:10:08', '2025-08-17 05:35:29'),
(2, 2, 1, 0, 1, 0, '2025-08-14 03:50:01', '2025-08-14 04:16:05');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_block_data`
--

CREATE TABLE `qlo_htl_room_block_data` (
  `id_room_block` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `position` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_room_block_data`
--

INSERT INTO `qlo_htl_room_block_data` (`id_room_block`, `id_product`, `active`, `position`, `date_add`, `date_upd`) VALUES
(1, 2, 1, 0, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(2, 3, 1, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(3, 1, 1, 2, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(4, 4, 0, 3, '2025-08-07 02:32:33', '2025-08-17 05:36:36');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_disable_dates`
--

CREATE TABLE `qlo_htl_room_disable_dates` (
  `id` int(11) NOT NULL,
  `id_room_type` int(11) NOT NULL,
  `id_room` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `reason` text DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_information`
--

CREATE TABLE `qlo_htl_room_information` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `room_num` varchar(225) NOT NULL,
  `id_status` int(11) NOT NULL,
  `floor` text NOT NULL,
  `comment` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_room_information`
--

INSERT INTO `qlo_htl_room_information` (`id`, `id_product`, `id_hotel`, `room_num`, `id_status`, `floor`, `comment`, `date_add`, `date_upd`) VALUES
(1, 1, 1, 'GR-101', 1, 'First', '', '2025-08-07 02:32:24', '2025-08-08 21:38:27'),
(2, 1, 1, 'GR-102', 1, 'First', '', '2025-08-07 02:32:24', '2025-08-08 21:38:27'),
(3, 1, 1, 'GR-103', 1, 'First', '', '2025-08-07 02:32:24', '2025-08-08 21:38:27'),
(4, 1, 1, 'GR-104', 1, 'First', '', '2025-08-07 02:32:24', '2025-08-08 21:38:27'),
(5, 1, 1, 'GR-105', 1, 'First', '', '2025-08-07 02:32:24', '2025-08-08 21:38:27'),
(6, 2, 1, 'DR-101', 1, 'First', '', '2025-08-07 02:32:25', '2025-08-07 02:32:25'),
(7, 2, 1, 'DR-102', 1, 'First', '', '2025-08-07 02:32:25', '2025-08-07 02:32:25'),
(8, 2, 1, 'DR-103', 1, 'First', '', '2025-08-07 02:32:25', '2025-08-07 02:32:25'),
(9, 2, 1, 'DR-104', 1, 'First', '', '2025-08-07 02:32:25', '2025-08-07 02:32:25'),
(10, 2, 1, 'DR-105', 1, 'First', '', '2025-08-07 02:32:25', '2025-08-07 02:32:25'),
(11, 3, 1, 'ER-101', 1, 'First', '', '2025-08-07 02:32:26', '2025-08-07 02:32:26'),
(12, 3, 1, 'ER-102', 1, 'First', '', '2025-08-07 02:32:26', '2025-08-07 02:32:26'),
(13, 3, 1, 'ER-103', 1, 'First', '', '2025-08-07 02:32:26', '2025-08-07 02:32:26'),
(14, 3, 1, 'ER-104', 1, 'First', '', '2025-08-07 02:32:26', '2025-08-07 02:32:26'),
(15, 3, 1, 'ER-105', 1, 'First', '', '2025-08-07 02:32:26', '2025-08-07 02:32:26'),
(16, 4, 1, 'LR-101', 1, 'First', '', '2025-08-07 02:32:27', '2025-08-07 02:32:27'),
(17, 4, 1, 'LR-102', 1, 'First', '', '2025-08-07 02:32:27', '2025-08-07 02:32:27'),
(18, 4, 1, 'LR-103', 1, 'First', '', '2025-08-07 02:32:27', '2025-08-07 02:32:27'),
(19, 4, 1, 'LR-104', 1, 'First', '', '2025-08-07 02:32:27', '2025-08-07 02:32:27'),
(20, 4, 1, 'LR-105', 1, 'First', '', '2025-08-07 02:32:27', '2025-08-07 02:32:27'),
(21, 1, 1, 'GR-106', 1, '', '', '2025-08-08 20:55:46', '2025-08-08 21:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_status`
--

CREATE TABLE `qlo_htl_room_status` (
  `id` int(11) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type`
--

CREATE TABLE `qlo_htl_room_type` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `adults` smallint(6) NOT NULL DEFAULT 2,
  `children` smallint(6) NOT NULL DEFAULT 0,
  `max_adults` smallint(6) NOT NULL DEFAULT 2,
  `max_children` smallint(6) NOT NULL DEFAULT 0,
  `max_guests` smallint(6) NOT NULL DEFAULT 2,
  `min_los` smallint(6) NOT NULL DEFAULT 1,
  `max_los` smallint(6) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_room_type`
--

INSERT INTO `qlo_htl_room_type` (`id`, `id_product`, `id_hotel`, `adults`, `children`, `max_adults`, `max_children`, `max_guests`, `min_los`, `max_los`, `date_add`, `date_upd`) VALUES
(1, 1, 1, 2, 2, 2, 2, 4, 1, 0, '2025-08-07 02:32:24', '2025-08-08 21:38:27'),
(2, 2, 1, 2, 2, 2, 2, 4, 1, 0, '2025-08-07 02:32:25', '2025-08-07 02:32:25'),
(3, 3, 1, 2, 2, 2, 2, 4, 1, 0, '2025-08-07 02:32:26', '2025-08-07 02:32:26'),
(4, 4, 1, 2, 2, 2, 2, 4, 1, 0, '2025-08-07 02:32:27', '2025-08-17 05:37:56'),
(5, 11, 2, 2, 0, 2, 0, 2, 1, 0, '2025-08-14 04:11:09', '2025-08-17 05:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_bed_type`
--

CREATE TABLE `qlo_htl_room_type_bed_type` (
  `id_room_type_bed_type` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_bed_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_room_type_bed_type`
--

INSERT INTO `qlo_htl_room_type_bed_type` (`id_room_type_bed_type`, `id_product`, `id_bed_type`) VALUES
(1, 1, 4),
(2, 2, 4),
(3, 2, 5),
(4, 3, 5),
(5, 3, 6),
(6, 4, 6),
(7, 4, 8),
(8, 11, 1),
(9, 11, 4),
(10, 11, 8);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_demand`
--

CREATE TABLE `qlo_htl_room_type_demand` (
  `id_room_type_demand` int(11) NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_global_demand` int(10) UNSIGNED NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_demand_price`
--

CREATE TABLE `qlo_htl_room_type_demand_price` (
  `id_room_type_demand_price` int(11) NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_global_demand` int(10) UNSIGNED NOT NULL,
  `id_option` int(10) UNSIGNED NOT NULL,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_feature_pricing`
--

CREATE TABLE `qlo_htl_room_type_feature_pricing` (
  `id_feature_price` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL DEFAULT 0,
  `id_guest` int(11) NOT NULL DEFAULT 0,
  `id_room` int(11) NOT NULL DEFAULT 0,
  `impact_way` tinyint(1) NOT NULL,
  `impact_type` tinyint(1) NOT NULL,
  `impact_value` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_feature_pricing_group`
--

CREATE TABLE `qlo_htl_room_type_feature_pricing_group` (
  `id_feature_price` int(10) UNSIGNED NOT NULL,
  `id_group` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_feature_pricing_lang`
--

CREATE TABLE `qlo_htl_room_type_feature_pricing_lang` (
  `id_feature_price` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `feature_price_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_feature_pricing_restriction`
--

CREATE TABLE `qlo_htl_room_type_feature_pricing_restriction` (
  `id_feature_price_restriction` int(11) NOT NULL,
  `id_feature_price` int(11) NOT NULL,
  `is_special_days_exists` tinyint(1) NOT NULL,
  `date_selection_type` tinyint(1) NOT NULL,
  `special_days` text DEFAULT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_global_demand`
--

CREATE TABLE `qlo_htl_room_type_global_demand` (
  `id_global_demand` int(11) NOT NULL,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `id_tax_rules_group` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price_calc_method` tinyint(1) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_global_demand_advance_option`
--

CREATE TABLE `qlo_htl_room_type_global_demand_advance_option` (
  `id_option` int(11) NOT NULL,
  `id_global_demand` int(11) NOT NULL,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_global_demand_advance_option_lang`
--

CREATE TABLE `qlo_htl_room_type_global_demand_advance_option_lang` (
  `id_option` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_global_demand_lang`
--

CREATE TABLE `qlo_htl_room_type_global_demand_lang` (
  `id_global_demand` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_restriction_date_range`
--

CREATE TABLE `qlo_htl_room_type_restriction_date_range` (
  `id_rt_restriction` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `min_los` smallint(6) UNSIGNED NOT NULL DEFAULT 1,
  `max_los` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_service_product`
--

CREATE TABLE `qlo_htl_room_type_service_product` (
  `id_room_type_service_product` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `position` smallint(2) UNSIGNED NOT NULL DEFAULT 0,
  `id_element` int(11) UNSIGNED NOT NULL,
  `element_type` tinyint(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_room_type_service_product`
--

INSERT INTO `qlo_htl_room_type_service_product` (`id_room_type_service_product`, `id_product`, `position`, `id_element`, `element_type`) VALUES
(1, 5, 0, 1, 2),
(2, 5, 0, 2, 2),
(3, 5, 0, 3, 2),
(4, 5, 0, 4, 2),
(5, 6, 1, 1, 2),
(6, 6, 1, 2, 2),
(7, 6, 1, 3, 2),
(8, 6, 1, 4, 2),
(9, 7, 2, 1, 2),
(10, 7, 2, 2, 2),
(11, 7, 2, 3, 2),
(12, 7, 2, 4, 2),
(13, 8, 3, 1, 2),
(14, 8, 3, 2, 2),
(15, 8, 3, 3, 2),
(16, 8, 3, 4, 2),
(17, 9, 4, 1, 2),
(18, 9, 4, 2, 2),
(19, 9, 4, 3, 2),
(20, 9, 4, 4, 2),
(21, 10, 5, 1, 2),
(22, 10, 5, 2, 2),
(23, 10, 5, 3, 2),
(24, 10, 5, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_room_type_service_product_price`
--

CREATE TABLE `qlo_htl_room_type_service_product_price` (
  `id_room_type_service_product_price` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `id_tax_rules_group` int(11) UNSIGNED NOT NULL,
  `id_element` int(11) UNSIGNED NOT NULL,
  `element_type` tinyint(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_room_type_service_product_price`
--

INSERT INTO `qlo_htl_room_type_service_product_price` (`id_room_type_service_product_price`, `id_product`, `price`, `id_tax_rules_group`, `id_element`, `element_type`) VALUES
(1, 5, 250.000000, 0, 1, 2),
(2, 6, 250.000000, 1, 1, 2),
(3, 7, 50.000000, 1, 1, 2),
(4, 8, 200.000000, 1, 1, 2),
(5, 9, 350.000000, 1, 1, 2),
(6, 10, 450.000000, 1, 1, 2),
(7, 5, 250.000000, 0, 4, 2),
(8, 6, 250.000000, 1, 4, 2),
(9, 7, 50.000000, 1, 4, 2),
(10, 8, 200.000000, 1, 4, 2),
(11, 9, 350.000000, 1, 4, 2),
(12, 10, 450.000000, 1, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_settings_link`
--

CREATE TABLE `qlo_htl_settings_link` (
  `id_settings_link` int(11) NOT NULL,
  `icon` varchar(32) NOT NULL,
  `link` text NOT NULL,
  `new_window` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `unremovable` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_settings_link`
--

INSERT INTO `qlo_htl_settings_link` (`id_settings_link`, `icon`, `link`, `new_window`, `position`, `unremovable`, `active`, `date_add`, `date_upd`) VALUES
(1, 'icon-cogs', 'index.php?controller=AdminHotelGeneralSettings', 0, 0, 1, 1, '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(2, 'icon-dollar', 'index.php?controller=AdminHotelFeaturePricesSettings', 0, 2, 1, 1, '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(3, 'icon-plus-square', 'index.php?controller=AdminRoomTypeGlobalDemand', 0, 3, 1, 1, '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(4, 'icon-file-text', 'index.php?controller=AdminAboutHotelBlockSetting', 0, 4, 0, 1, '2025-08-07 02:32:22', '2025-08-07 02:32:22'),
(5, 'icon-th-list', 'index.php?controller=AdminFeaturesModuleSetting', 0, 5, 0, 1, '2025-08-07 02:32:22', '2025-08-07 02:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_settings_link_lang`
--

CREATE TABLE `qlo_htl_settings_link_lang` (
  `id_settings_link` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `hint` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_settings_link_lang`
--

INSERT INTO `qlo_htl_settings_link_lang` (`id_settings_link`, `id_lang`, `name`, `hint`) VALUES
(1, 1, 'General Settings', 'Configure Your hotel general settings using this option.'),
(2, 1, 'Advanced Price Rules', 'Here set Advanced price rules for specific dates.'),
(3, 1, 'Additional Facilities', 'Here create Additional facilities and their prices for room types.'),
(4, 1, 'Hotel Interior Block', 'Configure Hotel Interior block. You can display hotel interior images using this block. This block will be displayed on home page.'),
(5, 1, 'Hotel Amenities Block', 'Configure Hotels Amenities settings. You can display hotel amenities images using this block. This block will be displayed on home page.');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_testimonials_block_data`
--

CREATE TABLE `qlo_htl_testimonials_block_data` (
  `id_testimonial_block` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_testimonials_block_data`
--

INSERT INTO `qlo_htl_testimonials_block_data` (`id_testimonial_block`, `name`, `designation`, `active`, `position`, `date_add`, `date_upd`) VALUES
(1, 'Steve Rogers', 'Eon Comics CEO', 1, 0, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(2, 'Calrk Kent', 'Ken Comics Kal', 1, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(3, 'John Doe', 'Jan Comics Joe', 1, 2, '2025-08-07 02:32:33', '2025-08-07 02:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_htl_testimonials_block_data_lang`
--

CREATE TABLE `qlo_htl_testimonials_block_data_lang` (
  `id_testimonial_block` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `testimonial_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_htl_testimonials_block_data_lang`
--

INSERT INTO `qlo_htl_testimonials_block_data_lang` (`id_testimonial_block`, `id_lang`, `testimonial_content`) VALUES
(1, 1, 'As a frequent traveler, I can confidently say Hotel Prime stands out for its tranquil environment and exceptional hospitality. The View Room provided a perfect retreat with its stunning cityscape views and comfortable accommodations.'),
(2, 1, 'Hotel Prime surpassed my expectations in every way. The Executive Room was not only luxurious but also provided a peaceful retreat with its stunning lake views. The attention to detail and personalized service made my stay truly memorable. I highly recommend Hotel Prime for both business and leisure travelers looking for a blend of comfort and sophistication.'),
(3, 1, 'My stay at Hotel Prime was absolutely rejuvenating. The Executive Room was spacious, elegant, and offered breathtaking lake views. The staff’s attention to detail and impeccable service made my business trip both productive and relaxing.');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_image`
--

CREATE TABLE `qlo_image` (
  `id_image` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `position` smallint(2) UNSIGNED NOT NULL DEFAULT 0,
  `cover` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_image`
--

INSERT INTO `qlo_image` (`id_image`, `id_product`, `position`, `cover`) VALUES
(1, 1, 1, 1),
(2, 1, 2, NULL),
(3, 1, 3, NULL),
(4, 1, 4, NULL),
(5, 2, 1, 1),
(6, 2, 2, NULL),
(7, 2, 3, NULL),
(8, 2, 4, NULL),
(9, 3, 1, 1),
(10, 3, 2, NULL),
(11, 3, 3, NULL),
(12, 3, 4, NULL),
(13, 4, 1, 1),
(14, 4, 2, NULL),
(15, 4, 3, NULL),
(16, 4, 4, NULL),
(17, 4, 5, NULL),
(18, 5, 1, 1),
(19, 6, 1, 1),
(20, 7, 1, 1),
(21, 8, 1, 1),
(22, 9, 1, 1),
(23, 10, 1, 1),
(24, 11, 2, NULL),
(25, 11, 3, NULL),
(26, 11, 4, NULL),
(27, 11, 5, NULL),
(28, 11, 6, NULL),
(29, 11, 7, NULL),
(30, 11, 8, NULL),
(32, 11, 9, NULL),
(33, 11, 10, NULL),
(34, 11, 11, NULL),
(35, 11, 12, NULL),
(36, 11, 13, NULL),
(39, 11, 14, NULL),
(40, 11, 15, NULL),
(41, 11, 16, NULL),
(42, 11, 17, NULL),
(43, 11, 18, NULL),
(45, 11, 1, 1),
(47, 11, 19, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_image_lang`
--

CREATE TABLE `qlo_image_lang` (
  `id_image` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `legend` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_image_lang`
--

INSERT INTO `qlo_image_lang` (`id_image`, `id_lang`, `legend`) VALUES
(1, 1, ''),
(2, 1, ''),
(3, 1, ''),
(4, 1, ''),
(5, 1, ''),
(6, 1, ''),
(7, 1, ''),
(8, 1, ''),
(9, 1, ''),
(10, 1, ''),
(11, 1, ''),
(12, 1, ''),
(13, 1, ''),
(14, 1, ''),
(15, 1, ''),
(16, 1, ''),
(17, 1, ''),
(18, 1, ''),
(19, 1, ''),
(20, 1, ''),
(21, 1, ''),
(22, 1, ''),
(23, 1, ''),
(24, 1, 'Luxury'),
(25, 1, 'Luxury'),
(26, 1, 'Luxury'),
(27, 1, 'Luxury'),
(28, 1, 'Luxury'),
(29, 1, 'Luxury'),
(30, 1, 'Luxury'),
(32, 1, 'Luxury'),
(33, 1, 'Luxury'),
(34, 1, 'Luxury'),
(35, 1, 'Luxury'),
(36, 1, 'Luxury'),
(39, 1, 'Luxury'),
(40, 1, 'Luxury'),
(41, 1, 'Luxury'),
(42, 1, 'Luxury'),
(43, 1, 'Luxury'),
(45, 1, 'Luxury'),
(47, 1, 'Luxury');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_image_shop`
--

CREATE TABLE `qlo_image_shop` (
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_image` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL,
  `cover` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_image_shop`
--

INSERT INTO `qlo_image_shop` (`id_product`, `id_image`, `id_shop`, `cover`) VALUES
(1, 2, 1, NULL),
(1, 3, 1, NULL),
(1, 4, 1, NULL),
(1, 1, 1, 1),
(2, 6, 1, NULL),
(2, 7, 1, NULL),
(2, 8, 1, NULL),
(2, 5, 1, 1),
(3, 10, 1, NULL),
(3, 11, 1, NULL),
(3, 12, 1, NULL),
(3, 9, 1, 1),
(4, 14, 1, NULL),
(4, 15, 1, NULL),
(4, 16, 1, NULL),
(4, 17, 1, NULL),
(4, 13, 1, 1),
(5, 18, 1, 1),
(6, 19, 1, 1),
(7, 20, 1, 1),
(8, 21, 1, 1),
(9, 22, 1, 1),
(10, 23, 1, 1),
(11, 24, 1, NULL),
(11, 25, 1, NULL),
(11, 26, 1, NULL),
(11, 27, 1, NULL),
(11, 28, 1, NULL),
(11, 29, 1, NULL),
(11, 30, 1, NULL),
(11, 32, 1, NULL),
(11, 33, 1, NULL),
(11, 34, 1, NULL),
(11, 35, 1, NULL),
(11, 36, 1, NULL),
(11, 39, 1, NULL),
(11, 40, 1, NULL),
(11, 41, 1, NULL),
(11, 42, 1, NULL),
(11, 43, 1, NULL),
(11, 47, 1, NULL),
(11, 45, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_image_type`
--

CREATE TABLE `qlo_image_type` (
  `id_image_type` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `width` int(10) UNSIGNED NOT NULL,
  `height` int(10) UNSIGNED NOT NULL,
  `products` tinyint(1) NOT NULL DEFAULT 1,
  `categories` tinyint(1) NOT NULL DEFAULT 1,
  `hotels` tinyint(1) NOT NULL DEFAULT 1,
  `manufacturers` tinyint(1) NOT NULL DEFAULT 1,
  `suppliers` tinyint(1) NOT NULL DEFAULT 1,
  `scenes` tinyint(1) NOT NULL DEFAULT 1,
  `stores` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_image_type`
--

INSERT INTO `qlo_image_type` (`id_image_type`, `name`, `width`, `height`, `products`, `categories`, `hotels`, `manufacturers`, `suppliers`, `scenes`, `stores`) VALUES
(1, 'cart_default', 80, 80, 1, 0, 0, 0, 0, 0, 0),
(2, 'small_default', 98, 98, 1, 0, 1, 1, 1, 0, 0),
(3, 'medium_default', 125, 125, 1, 1, 1, 1, 1, 0, 1),
(4, 'home_default', 250, 250, 1, 0, 0, 0, 0, 0, 0),
(5, 'large_default', 720, 720, 1, 0, 1, 1, 1, 0, 0),
(6, 'thickbox_default', 800, 800, 1, 0, 0, 0, 0, 0, 0),
(7, 'category_default', 870, 217, 0, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_import_match`
--

CREATE TABLE `qlo_import_match` (
  `id_import_match` int(10) NOT NULL,
  `name` varchar(32) NOT NULL,
  `match` text NOT NULL,
  `skip` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_lang`
--

CREATE TABLE `qlo_lang` (
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `iso_code` char(2) NOT NULL,
  `language_code` char(5) NOT NULL,
  `date_format_lite` char(32) NOT NULL DEFAULT 'Y-m-d',
  `date_format_full` char(32) NOT NULL DEFAULT 'Y-m-d H:i:s',
  `is_rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_lang`
--

INSERT INTO `qlo_lang` (`id_lang`, `name`, `active`, `iso_code`, `language_code`, `date_format_lite`, `date_format_full`, `is_rtl`) VALUES
(1, 'English (English)', 1, 'en', 'en-us', 'm/d/Y', 'm/d/Y H:i:s', 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_lang_shop`
--

CREATE TABLE `qlo_lang_shop` (
  `id_lang` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_lang_shop`
--

INSERT INTO `qlo_lang_shop` (`id_lang`, `id_shop`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_log`
--

CREATE TABLE `qlo_log` (
  `id_log` int(10) UNSIGNED NOT NULL,
  `severity` tinyint(1) NOT NULL,
  `error_code` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `object_type` varchar(32) DEFAULT NULL,
  `object_id` int(10) UNSIGNED DEFAULT NULL,
  `id_employee` int(10) UNSIGNED DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_log`
--

INSERT INTO `qlo_log` (`id_log`, `severity`, `error_code`, `message`, `object_type`, `object_id`, `id_employee`, `date_add`, `date_upd`) VALUES
(1, 1, 0, 'Back Office connection from ::1', '', 0, 1, '2025-08-07 02:33:33', '2025-08-07 02:33:33'),
(2, 1, 0, 'Back Office connection from ::1', '', 0, 1, '2025-08-07 02:33:37', '2025-08-07 02:33:37'),
(3, 1, 0, 'WebserviceKey addition', 'WebserviceKey', 1, 1, '2025-08-07 02:40:57', '2025-08-07 02:40:57'),
(4, 1, 0, 'Back Office connection from ::1', '', 0, 1, '2025-08-07 03:15:33', '2025-08-07 03:15:33'),
(5, 1, 0, 'Product modification', 'Product', 1, 1, '2025-08-08 20:33:46', '2025-08-08 20:33:46'),
(6, 1, 0, 'Product modification', 'Product', 1, 1, '2025-08-08 20:55:00', '2025-08-08 20:55:00'),
(7, 1, 0, 'Product modification', 'Product', 1, 1, '2025-08-08 20:55:46', '2025-08-08 20:55:46'),
(8, 1, 0, 'Product modification', 'Product', 1, 1, '2025-08-08 21:38:27', '2025-08-08 21:38:27'),
(9, 1, 0, 'Product addition', 'Product', 11, 1, '2025-08-14 04:11:09', '2025-08-14 04:11:09'),
(10, 1, 0, 'Product modification', 'Product', 11, 1, '2025-08-14 04:12:05', '2025-08-14 04:12:05'),
(11, 1, 0, 'Product modification', 'Product', 11, 1, '2025-08-14 04:12:54', '2025-08-14 04:12:54'),
(12, 1, 0, 'Product modification', 'Product', 11, 1, '2025-08-14 04:13:14', '2025-08-14 04:13:14'),
(13, 1, 0, 'Product modification', 'Product', 11, 1, '2025-08-14 04:22:01', '2025-08-14 04:22:01'),
(14, 1, 0, 'Product modification', 'Product', 11, 1, '2025-08-14 04:31:18', '2025-08-14 04:31:18'),
(15, 1, 0, 'Product modification', 'Product', 11, 1, '2025-08-14 04:32:00', '2025-08-14 04:32:00'),
(16, 1, 0, 'Product modification', 'Product', 11, 1, '2025-08-14 04:32:34', '2025-08-14 04:32:34'),
(17, 1, 0, 'Product modification', 'Product', 11, 1, '2025-08-14 04:33:03', '2025-08-14 04:33:03'),
(18, 1, 0, 'Product modification', 'Product', 4, 1, '2025-08-17 05:36:36', '2025-08-17 05:36:36'),
(19, 1, 0, 'Product modification', 'Product', 4, 1, '2025-08-17 05:37:56', '2025-08-17 05:37:56'),
(20, 1, 0, 'Product modification', 'Product', 11, 1, '2025-08-17 05:38:04', '2025-08-17 05:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_mail`
--

CREATE TABLE `qlo_mail` (
  `id_mail` int(11) UNSIGNED NOT NULL,
  `recipient` varchar(126) NOT NULL,
  `template` varchar(62) NOT NULL,
  `subject` varchar(254) NOT NULL,
  `id_lang` int(11) UNSIGNED NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_maintenance_access`
--

CREATE TABLE `qlo_maintenance_access` (
  `id_maintenance_access` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `email` varchar(128) NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_manufacturer`
--

CREATE TABLE `qlo_manufacturer` (
  `id_manufacturer` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_manufacturer_lang`
--

CREATE TABLE `qlo_manufacturer_lang` (
  `id_manufacturer` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_manufacturer_shop`
--

CREATE TABLE `qlo_manufacturer_shop` (
  `id_manufacturer` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_memcached_servers`
--

CREATE TABLE `qlo_memcached_servers` (
  `id_memcached_server` int(11) UNSIGNED NOT NULL,
  `ip` varchar(254) NOT NULL,
  `port` int(11) UNSIGNED NOT NULL,
  `weight` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_message`
--

CREATE TABLE `qlo_message` (
  `id_message` int(10) UNSIGNED NOT NULL,
  `id_cart` int(10) UNSIGNED DEFAULT NULL,
  `id_customer` int(10) UNSIGNED NOT NULL,
  `id_employee` int(10) UNSIGNED DEFAULT NULL,
  `id_order` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `private` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_message_readed`
--

CREATE TABLE `qlo_message_readed` (
  `id_message` int(10) UNSIGNED NOT NULL,
  `id_employee` int(10) UNSIGNED NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_meta`
--

CREATE TABLE `qlo_meta` (
  `id_meta` int(10) UNSIGNED NOT NULL,
  `page` varchar(64) NOT NULL,
  `configurable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_meta`
--

INSERT INTO `qlo_meta` (`id_meta`, `page`, `configurable`) VALUES
(1, 'pagenotfound', 1),
(2, 'best-sales', 1),
(3, 'contact', 1),
(4, 'index', 1),
(5, 'manufacturer', 1),
(6, 'new-products', 1),
(7, 'password', 1),
(8, 'prices-drop', 1),
(9, 'sitemap', 1),
(10, 'supplier', 1),
(11, 'address', 1),
(12, 'addresses', 1),
(13, 'authentication', 1),
(14, 'cart', 1),
(15, 'discount', 1),
(16, 'history', 1),
(17, 'order-detail', 1),
(18, 'identity', 1),
(19, 'my-account', 1),
(20, 'order-follow', 1),
(21, 'order-slip', 1),
(22, 'order', 1),
(23, 'search', 1),
(24, 'stores', 1),
(25, 'order-opc', 1),
(26, 'guest-tracking', 1),
(27, 'order-confirmation', 1),
(28, 'product', 0),
(29, 'category', 0),
(30, 'cms', 0),
(31, 'module-cheque-payment', 0),
(32, 'module-cheque-validation', 0),
(33, 'module-bankwire-validation', 0),
(34, 'module-bankwire-payment', 0),
(35, 'module-cashondelivery-validation', 0),
(36, 'products-comparison', 1),
(37, 'our-properties', 1),
(38, 'module-blocknewsletter-verification', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_meta_lang`
--

CREATE TABLE `qlo_meta_lang` (
  `id_meta` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `url_rewrite` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_meta_lang`
--

INSERT INTO `qlo_meta_lang` (`id_meta`, `id_shop`, `id_lang`, `title`, `description`, `keywords`, `url_rewrite`) VALUES
(1, 1, 1, '404 error', 'This page cannot be found', '', 'page-not-found'),
(2, 1, 1, 'Best sales', 'Our best sales', '', 'best-sales'),
(3, 1, 1, 'Contact us', 'Use our form to contact us', '', 'contact-us'),
(4, 1, 1, 'Hotel Prime', 'A place where comfort and luxury are blended with nature!', '', ''),
(5, 1, 1, 'Manufacturers', 'Manufacturers list', '', 'manufacturers'),
(6, 1, 1, 'New products', 'Our new products', '', 'new-products'),
(7, 1, 1, 'Forgot your password', 'Enter the e-mail address you use to sign in to receive an e-mail with a new password', '', 'password-recovery'),
(8, 1, 1, 'Prices drop', 'Our special products', '', 'prices-drop'),
(9, 1, 1, 'Sitemap', 'Lost ? Find what your are looking for', '', 'sitemap'),
(10, 1, 1, 'Suppliers', 'Suppliers list', '', 'supplier'),
(11, 1, 1, 'Address', '', '', 'address'),
(12, 1, 1, 'Addresses', '', '', 'addresses'),
(13, 1, 1, 'Login', '', '', 'login'),
(14, 1, 1, 'Cart', '', '', 'cart'),
(15, 1, 1, 'Discount', '', '', 'discount'),
(16, 1, 1, 'Order history', '', '', 'order-history'),
(17, 1, 1, 'Booking details', '', '', 'order-detail'),
(18, 1, 1, 'Identity', '', '', 'identity'),
(19, 1, 1, 'My account', '', '', 'my-account'),
(20, 1, 1, 'Order follow', '', '', 'order-follow'),
(21, 1, 1, 'Credit slip', '', '', 'credit-slip'),
(22, 1, 1, 'Order', '', '', 'order'),
(23, 1, 1, 'Search', '', '', 'search'),
(24, 1, 1, 'Stores', '', '', 'stores'),
(25, 1, 1, 'Order', '', '', 'quick-order'),
(26, 1, 1, 'Guest tracking', '', '', 'guest-tracking'),
(27, 1, 1, 'Order confirmation', '', '', 'order-confirmation'),
(36, 1, 1, 'Products Comparison', '', '', 'products-comparison'),
(37, 1, 1, 'Our Properties', '', '', 'our-properties'),
(38, 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_module`
--

CREATE TABLE `qlo_module` (
  `id_module` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `version` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_module`
--

INSERT INTO `qlo_module` (`id_module`, `name`, `active`, `version`) VALUES
(1, 'hotelreservationsystem', 1, '1.7.0'),
(2, 'wkroomsearchblock', 1, '1.1.5'),
(3, 'blocknewsletter', 1, '2.3.1'),
(4, 'blocksocial', 1, '1.2.2'),
(5, 'wkhotelfilterblock', 1, '1.0.7'),
(6, 'wkabouthotelblock', 1, '1.2.0'),
(7, 'wkhotelfeaturesblock', 1, '2.0.8'),
(8, 'wkhotelroom', 1, '1.2.0'),
(9, 'wktestimonialblock', 1, '1.1.8'),
(10, 'bankwire', 1, '1.1.7'),
(11, 'cheque', 1, '2.6.8'),
(12, 'blockmyaccount', 1, '1.4.3'),
(13, 'blockcurrencies', 1, '1.1.1'),
(14, 'blocklanguages', 1, '1.6.1'),
(15, 'qlohotelreview', 1, '1.0.2'),
(16, 'wkfooterlangcurrencyblock', 1, '1.0.2'),
(17, 'wkfooterpaymentinfoblockcontainer', 1, '1.0.2'),
(18, 'wkfooterpaymentblock', 1, '1.1.6'),
(19, 'wkfooternotificationblock', 1, '1.0.2'),
(20, 'blocknavigationmenu', 1, '1.1.4'),
(21, 'dashguestcycle', 1, '1.0.3'),
(22, 'dashoccupancy', 1, '1.0.3'),
(23, 'dashactivity', 1, '1.0.4'),
(24, 'dashtrends', 1, '1.0.4'),
(25, 'dashavailability', 1, '1.0.3'),
(26, 'dashperformance', 1, '1.0.3'),
(27, 'dashproducts', 1, '1.0.4'),
(28, 'dashgoals', 1, '1.0.3'),
(29, 'dashinsights', 1, '1.0.2'),
(30, 'graphnvd3', 1, '1.5.4'),
(31, 'statsdata', 1, '1.6.4'),
(32, 'statsvisits', 1, '1.6.3'),
(33, 'statsorigin', 1, '1.4.3'),
(34, 'statslive', 1, '1.3.3'),
(35, 'sekeywords', 1, '1.4.3'),
(36, 'statssales', 1, '1.3.4'),
(37, 'statspersonalinfos', 1, '1.4.3'),
(38, 'statsforecast', 1, '1.4.5'),
(39, 'statsbestcategories', 1, '1.5.5'),
(40, 'statsproduct', 1, '1.5.4'),
(41, 'statscheckup', 1, '1.5.4'),
(42, 'statscatalog', 1, '1.4.3'),
(43, 'statsbestproducts', 1, '1.5.5'),
(44, 'pagesnotfound', 1, '1.5.2'),
(45, 'statsnewsletter', 1, '1.4.4'),
(46, 'statsregistrations', 1, '1.4.3'),
(47, 'statsbestvouchers', 1, '1.5.3'),
(48, 'statsbestcustomers', 1, '1.5.4'),
(49, 'statsequipment', 1, '1.3.3'),
(50, 'qlostatsserviceproducts', 1, '1.0.1'),
(51, 'blockcart', 1, '1.6.7'),
(52, 'blockuserinfo', 1, '1.0.1'),
(53, 'qlochannelmanagerconnector', 1, '1.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_modules_perfs`
--

CREATE TABLE `qlo_modules_perfs` (
  `id_modules_perfs` int(11) UNSIGNED NOT NULL,
  `session` int(11) UNSIGNED NOT NULL,
  `module` varchar(62) NOT NULL,
  `method` varchar(126) NOT NULL,
  `time_start` double UNSIGNED NOT NULL,
  `time_end` double UNSIGNED NOT NULL,
  `memory_start` int(10) UNSIGNED NOT NULL,
  `memory_end` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_module_access`
--

CREATE TABLE `qlo_module_access` (
  `id_profile` int(10) UNSIGNED NOT NULL,
  `id_module` int(10) UNSIGNED NOT NULL,
  `view` tinyint(1) NOT NULL DEFAULT 0,
  `configure` tinyint(1) NOT NULL DEFAULT 0,
  `uninstall` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_module_country`
--

CREATE TABLE `qlo_module_country` (
  `id_module` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_country` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_module_country`
--

INSERT INTO `qlo_module_country` (`id_module`, `id_shop`, `id_country`) VALUES
(10, 1, 21),
(11, 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_module_currency`
--

CREATE TABLE `qlo_module_currency` (
  `id_module` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_currency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_module_currency`
--

INSERT INTO `qlo_module_currency` (`id_module`, `id_shop`, `id_currency`) VALUES
(10, 1, 1),
(11, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_module_group`
--

CREATE TABLE `qlo_module_group` (
  `id_module` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_group` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_module_group`
--

INSERT INTO `qlo_module_group` (`id_module`, `id_shop`, `id_group`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(2, 1, 1),
(2, 1, 2),
(2, 1, 3),
(3, 1, 1),
(3, 1, 2),
(3, 1, 3),
(4, 1, 1),
(4, 1, 2),
(4, 1, 3),
(5, 1, 1),
(5, 1, 2),
(5, 1, 3),
(6, 1, 1),
(6, 1, 2),
(6, 1, 3),
(7, 1, 1),
(7, 1, 2),
(7, 1, 3),
(8, 1, 1),
(8, 1, 2),
(8, 1, 3),
(9, 1, 1),
(9, 1, 2),
(9, 1, 3),
(10, 1, 1),
(10, 1, 2),
(10, 1, 3),
(11, 1, 1),
(11, 1, 2),
(11, 1, 3),
(12, 1, 1),
(12, 1, 2),
(12, 1, 3),
(13, 1, 1),
(13, 1, 2),
(13, 1, 3),
(14, 1, 1),
(14, 1, 2),
(14, 1, 3),
(15, 1, 1),
(15, 1, 2),
(15, 1, 3),
(16, 1, 1),
(16, 1, 2),
(16, 1, 3),
(17, 1, 1),
(17, 1, 2),
(17, 1, 3),
(18, 1, 1),
(18, 1, 2),
(18, 1, 3),
(19, 1, 1),
(19, 1, 2),
(19, 1, 3),
(20, 1, 1),
(20, 1, 2),
(20, 1, 3),
(21, 1, 1),
(21, 1, 2),
(21, 1, 3),
(22, 1, 1),
(22, 1, 2),
(22, 1, 3),
(23, 1, 1),
(23, 1, 2),
(23, 1, 3),
(24, 1, 1),
(24, 1, 2),
(24, 1, 3),
(25, 1, 1),
(25, 1, 2),
(25, 1, 3),
(26, 1, 1),
(26, 1, 2),
(26, 1, 3),
(27, 1, 1),
(27, 1, 2),
(27, 1, 3),
(28, 1, 1),
(28, 1, 2),
(28, 1, 3),
(29, 1, 1),
(29, 1, 2),
(29, 1, 3),
(30, 1, 1),
(30, 1, 2),
(30, 1, 3),
(31, 1, 1),
(31, 1, 2),
(31, 1, 3),
(32, 1, 1),
(32, 1, 2),
(32, 1, 3),
(33, 1, 1),
(33, 1, 2),
(33, 1, 3),
(34, 1, 1),
(34, 1, 2),
(34, 1, 3),
(35, 1, 1),
(35, 1, 2),
(35, 1, 3),
(36, 1, 1),
(36, 1, 2),
(36, 1, 3),
(37, 1, 1),
(37, 1, 2),
(37, 1, 3),
(38, 1, 1),
(38, 1, 2),
(38, 1, 3),
(39, 1, 1),
(39, 1, 2),
(39, 1, 3),
(40, 1, 1),
(40, 1, 2),
(40, 1, 3),
(41, 1, 1),
(41, 1, 2),
(41, 1, 3),
(42, 1, 1),
(42, 1, 2),
(42, 1, 3),
(43, 1, 1),
(43, 1, 2),
(43, 1, 3),
(44, 1, 1),
(44, 1, 2),
(44, 1, 3),
(45, 1, 1),
(45, 1, 2),
(45, 1, 3),
(46, 1, 1),
(46, 1, 2),
(46, 1, 3),
(47, 1, 1),
(47, 1, 2),
(47, 1, 3),
(48, 1, 1),
(48, 1, 2),
(48, 1, 3),
(49, 1, 1),
(49, 1, 2),
(49, 1, 3),
(50, 1, 1),
(50, 1, 2),
(50, 1, 3),
(51, 1, 1),
(51, 1, 2),
(51, 1, 3),
(52, 1, 1),
(52, 1, 2),
(52, 1, 3),
(53, 1, 1),
(53, 1, 2),
(53, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_module_preference`
--

CREATE TABLE `qlo_module_preference` (
  `id_module_preference` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `interest` tinyint(1) DEFAULT NULL,
  `favorite` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_module_shop`
--

CREATE TABLE `qlo_module_shop` (
  `id_module` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL,
  `enable_device` tinyint(1) NOT NULL DEFAULT 7
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_module_shop`
--

INSERT INTO `qlo_module_shop` (`id_module`, `id_shop`, `enable_device`) VALUES
(1, 1, 7),
(2, 1, 7),
(3, 1, 7),
(4, 1, 7),
(5, 1, 7),
(6, 1, 7),
(7, 1, 7),
(8, 1, 7),
(9, 1, 7),
(10, 1, 7),
(11, 1, 7),
(12, 1, 7),
(13, 1, 7),
(14, 1, 7),
(15, 1, 7),
(16, 1, 7),
(17, 1, 7),
(18, 1, 7),
(19, 1, 7),
(20, 1, 7),
(21, 1, 7),
(22, 1, 7),
(23, 1, 7),
(24, 1, 7),
(25, 1, 7),
(26, 1, 7),
(27, 1, 7),
(28, 1, 7),
(29, 1, 7),
(30, 1, 7),
(31, 1, 7),
(32, 1, 7),
(33, 1, 7),
(34, 1, 7),
(35, 1, 7),
(36, 1, 7),
(37, 1, 7),
(38, 1, 7),
(39, 1, 7),
(40, 1, 7),
(41, 1, 7),
(42, 1, 7),
(43, 1, 7),
(44, 1, 7),
(45, 1, 7),
(46, 1, 7),
(47, 1, 7),
(48, 1, 7),
(49, 1, 7),
(50, 1, 7),
(51, 1, 7),
(52, 1, 7),
(53, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_newsletter`
--

CREATE TABLE `qlo_newsletter` (
  `id` int(6) NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `id_shop_group` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `email` varchar(255) NOT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `ip_registration_newsletter` varchar(15) NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_operating_system`
--

CREATE TABLE `qlo_operating_system` (
  `id_operating_system` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_operating_system`
--

INSERT INTO `qlo_operating_system` (`id_operating_system`, `name`) VALUES
(1, 'Windows XP'),
(2, 'Windows Vista'),
(3, 'Windows 7'),
(4, 'Windows 8'),
(5, 'MacOsX'),
(6, 'Linux'),
(7, 'Android');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_orders`
--

CREATE TABLE `qlo_orders` (
  `id_order` int(10) UNSIGNED NOT NULL,
  `reference` varchar(9) DEFAULT NULL,
  `id_shop_group` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_carrier` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) UNSIGNED NOT NULL,
  `id_cart` int(10) UNSIGNED NOT NULL,
  `id_currency` int(10) UNSIGNED NOT NULL,
  `id_address_delivery` int(10) UNSIGNED NOT NULL,
  `id_address_invoice` int(10) UNSIGNED NOT NULL,
  `id_address_tax` int(10) UNSIGNED NOT NULL,
  `current_state` int(10) UNSIGNED NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `payment` varchar(255) NOT NULL,
  `payment_type` tinyint(10) UNSIGNED NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT 1.000000,
  `module` varchar(255) DEFAULT NULL,
  `recyclable` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `gift` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `gift_message` text DEFAULT NULL,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_number` varchar(64) DEFAULT NULL,
  `total_discounts` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_discounts_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_discounts_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid_real` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_products` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_products_wt` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `carrier_tax_rate` decimal(10,3) NOT NULL DEFAULT 0.000,
  `total_wrapping` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_wrapping_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_wrapping_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `round_mode` tinyint(1) NOT NULL DEFAULT 2,
  `round_type` tinyint(1) NOT NULL DEFAULT 1,
  `invoice_number` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `delivery_number` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `invoice_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `valid` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_advance_payment` tinyint(1) NOT NULL DEFAULT 0,
  `advance_paid_amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `with_occupancy` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_carrier`
--

CREATE TABLE `qlo_order_carrier` (
  `id_order_carrier` int(11) NOT NULL,
  `id_order` int(11) UNSIGNED NOT NULL,
  `id_carrier` int(11) UNSIGNED NOT NULL,
  `id_order_invoice` int(11) UNSIGNED DEFAULT NULL,
  `weight` decimal(20,6) DEFAULT NULL,
  `shipping_cost_tax_excl` decimal(20,6) DEFAULT NULL,
  `shipping_cost_tax_incl` decimal(20,6) DEFAULT NULL,
  `tracking_number` varchar(64) DEFAULT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_cart_rule`
--

CREATE TABLE `qlo_order_cart_rule` (
  `id_order_cart_rule` int(10) UNSIGNED NOT NULL,
  `id_order` int(10) UNSIGNED NOT NULL,
  `id_cart_rule` int(10) UNSIGNED NOT NULL,
  `id_order_invoice` int(10) UNSIGNED DEFAULT 0,
  `name` varchar(254) NOT NULL,
  `value` decimal(17,2) NOT NULL DEFAULT 0.00,
  `value_tax_excl` decimal(17,2) NOT NULL DEFAULT 0.00,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_customer_guest_detail`
--

CREATE TABLE `qlo_order_customer_guest_detail` (
  `id_order_customer_guest_detail` int(10) UNSIGNED NOT NULL,
  `id_order` int(10) UNSIGNED NOT NULL,
  `id_gender` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_detail`
--

CREATE TABLE `qlo_order_detail` (
  `id_order_detail` int(10) UNSIGNED NOT NULL,
  `id_order` int(10) UNSIGNED NOT NULL,
  `id_order_invoice` int(11) DEFAULT NULL,
  `id_warehouse` int(10) UNSIGNED DEFAULT 0,
  `id_shop` int(11) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_attribute_id` int(10) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_quantity_in_stock` int(10) NOT NULL DEFAULT 0,
  `product_quantity_refunded` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_quantity_return` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_quantity_reinjected` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `reduction_percent` decimal(10,2) NOT NULL DEFAULT 0.00,
  `reduction_amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `reduction_amount_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `reduction_amount_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `group_reduction` decimal(10,2) NOT NULL DEFAULT 0.00,
  `product_quantity_discount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `is_booking_product` tinyint(1) NOT NULL DEFAULT 0,
  `selling_preference_type` tinyint(1) NOT NULL DEFAULT 1,
  `product_auto_add` tinyint(1) NOT NULL DEFAULT 0,
  `product_price_addition_type` tinyint(1) NOT NULL DEFAULT 0,
  `product_allow_multiple_quantity` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `product_price_calculation_method` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `product_ean13` varchar(13) DEFAULT NULL,
  `product_upc` varchar(12) DEFAULT NULL,
  `product_reference` varchar(32) DEFAULT NULL,
  `product_supplier_reference` varchar(32) DEFAULT NULL,
  `product_weight` decimal(20,6) NOT NULL,
  `id_tax_rules_group` int(11) UNSIGNED DEFAULT 0,
  `tax_computation_method` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `tax_name` varchar(16) NOT NULL,
  `tax_rate` decimal(10,3) NOT NULL DEFAULT 0.000,
  `ecotax` decimal(21,6) NOT NULL DEFAULT 0.000000,
  `ecotax_tax_rate` decimal(5,3) NOT NULL DEFAULT 0.000,
  `discount_quantity_applied` tinyint(1) NOT NULL DEFAULT 0,
  `download_hash` varchar(255) DEFAULT NULL,
  `download_nb` int(10) UNSIGNED DEFAULT 0,
  `download_deadline` datetime DEFAULT NULL,
  `total_price_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_price_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_price_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_price_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `purchase_supplier_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `original_product_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `original_wholesale_price` decimal(20,6) NOT NULL DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_detail_tax`
--

CREATE TABLE `qlo_order_detail_tax` (
  `id_order_detail` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `unit_amount` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `total_amount` decimal(16,6) NOT NULL DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_history`
--

CREATE TABLE `qlo_order_history` (
  `id_order_history` int(10) UNSIGNED NOT NULL,
  `id_employee` int(10) UNSIGNED NOT NULL,
  `id_order` int(10) UNSIGNED NOT NULL,
  `id_order_state` int(10) UNSIGNED NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_invoice`
--

CREATE TABLE `qlo_order_invoice` (
  `id_order_invoice` int(11) UNSIGNED NOT NULL,
  `id_order` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `delivery_number` int(11) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `total_discount_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_discount_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_paid_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_products` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_products_wt` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_shipping_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `shipping_tax_computation_method` int(10) UNSIGNED NOT NULL,
  `total_wrapping_tax_excl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `total_wrapping_tax_incl` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `shop_address` text DEFAULT NULL,
  `invoice_address` text DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_invoice_payment`
--

CREATE TABLE `qlo_order_invoice_payment` (
  `id_order_invoice` int(11) UNSIGNED NOT NULL,
  `id_order_payment` int(11) UNSIGNED NOT NULL,
  `id_order_payment_detail` int(11) UNSIGNED NOT NULL,
  `id_order` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_invoice_tax`
--

CREATE TABLE `qlo_order_invoice_tax` (
  `id_order_invoice` int(11) NOT NULL,
  `type` varchar(15) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `amount` decimal(10,6) NOT NULL DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_message`
--

CREATE TABLE `qlo_order_message` (
  `id_order_message` int(10) UNSIGNED NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_message_lang`
--

CREATE TABLE `qlo_order_message_lang` (
  `id_order_message` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_payment`
--

CREATE TABLE `qlo_order_payment` (
  `id_order_payment` int(11) NOT NULL,
  `order_reference` varchar(9) DEFAULT NULL,
  `id_currency` int(10) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_type` int(10) UNSIGNED NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT 1.000000,
  `transaction_id` varchar(254) DEFAULT NULL,
  `card_number` varchar(254) DEFAULT NULL,
  `card_brand` varchar(254) DEFAULT NULL,
  `card_expiration` char(7) DEFAULT NULL,
  `card_holder` varchar(254) DEFAULT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_payment_detail`
--

CREATE TABLE `qlo_order_payment_detail` (
  `id_order_payment_detail` int(10) UNSIGNED NOT NULL,
  `id_order_payment` int(10) UNSIGNED NOT NULL,
  `id_order` int(10) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_return`
--

CREATE TABLE `qlo_order_return` (
  `id_order_return` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) UNSIGNED NOT NULL,
  `id_order` int(10) UNSIGNED NOT NULL,
  `state` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `id_transaction` varchar(100) NOT NULL DEFAULT '',
  `payment_mode` varchar(255) NOT NULL DEFAULT '',
  `refunded_amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `question` text NOT NULL,
  `by_admin` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `id_return_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `return_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_return_detail`
--

CREATE TABLE `qlo_order_return_detail` (
  `id_order_return_detail` int(10) UNSIGNED NOT NULL,
  `id_order_return` int(10) UNSIGNED NOT NULL,
  `id_htl_booking` int(11) NOT NULL,
  `id_service_product_order_detail` int(11) NOT NULL,
  `refunded_amount` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `id_order_detail` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_customization` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_quantity` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_return_state`
--

CREATE TABLE `qlo_order_return_state` (
  `id_order_return_state` int(10) UNSIGNED NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  `send_email_to_customer` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `send_email_to_superadmin` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `send_email_to_employee` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `send_email_to_hotelier` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `denied` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `refunded` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `module_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_order_return_state`
--

INSERT INTO `qlo_order_return_state` (`id_order_return_state`, `color`, `send_email_to_customer`, `send_email_to_superadmin`, `send_email_to_employee`, `send_email_to_hotelier`, `denied`, `refunded`, `module_name`) VALUES
(1, '#4169E1', 1, 1, 1, 1, 0, 0, ''),
(2, '#DC143C', 1, 1, 1, 1, 1, 0, ''),
(3, '#108510', 1, 1, 1, 1, 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_return_state_lang`
--

CREATE TABLE `qlo_order_return_state_lang` (
  `id_order_return_state` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `customer_template` varchar(64) NOT NULL,
  `admin_template` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_order_return_state_lang`
--

INSERT INTO `qlo_order_return_state_lang` (`id_order_return_state`, `id_lang`, `name`, `customer_template`, `admin_template`) VALUES
(1, 1, 'Pending', 'order_refund_pending_customer', 'order_refund_pending_admin'),
(2, 1, 'Denied', 'order_refund_denied_customer', 'order_refund_denied_admin'),
(3, 1, 'Completed', 'order_refund_completed_customer', 'order_refund_completed_admin');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_slip`
--

CREATE TABLE `qlo_order_slip` (
  `id_order_slip` int(10) UNSIGNED NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT 1.000000,
  `id_customer` int(10) UNSIGNED NOT NULL,
  `id_order` int(10) UNSIGNED NOT NULL,
  `total_products_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_products_tax_incl` decimal(20,6) DEFAULT NULL,
  `total_shipping_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_shipping_tax_incl` decimal(20,6) DEFAULT NULL,
  `shipping_cost` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(10,2) NOT NULL,
  `shipping_cost_amount` decimal(10,2) NOT NULL,
  `partial` tinyint(1) NOT NULL,
  `redeem_status` tinyint(1) NOT NULL DEFAULT 0,
  `id_cart_rule` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `order_slip_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_slip_detail`
--

CREATE TABLE `qlo_order_slip_detail` (
  `id_order_slip` int(10) UNSIGNED NOT NULL,
  `id_order_detail` int(10) UNSIGNED NOT NULL,
  `id_htl_booking` int(10) UNSIGNED NOT NULL,
  `id_service_product_order_detail` int(10) UNSIGNED NOT NULL,
  `product_quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unit_price_tax_excl` decimal(20,6) DEFAULT NULL,
  `unit_price_tax_incl` decimal(20,6) DEFAULT NULL,
  `total_price_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_price_tax_incl` decimal(20,6) DEFAULT NULL,
  `amount_tax_excl` decimal(20,6) DEFAULT NULL,
  `amount_tax_incl` decimal(20,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_slip_detail_tax`
--

CREATE TABLE `qlo_order_slip_detail_tax` (
  `id_order_slip_detail` int(11) UNSIGNED NOT NULL,
  `id_tax` int(11) UNSIGNED NOT NULL,
  `unit_amount` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `total_amount` decimal(16,6) NOT NULL DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_state`
--

CREATE TABLE `qlo_order_state` (
  `id_order_state` int(10) UNSIGNED NOT NULL,
  `invoice` tinyint(1) UNSIGNED DEFAULT 0,
  `send_email` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `module_name` varchar(255) DEFAULT NULL,
  `color` varchar(32) DEFAULT NULL,
  `unremovable` tinyint(1) UNSIGNED NOT NULL,
  `hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `logable` tinyint(1) NOT NULL DEFAULT 0,
  `delivery` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `shipped` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `paid` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `pdf_invoice` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `pdf_delivery` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_order_state`
--

INSERT INTO `qlo_order_state` (`id_order_state`, `invoice`, `send_email`, `module_name`, `color`, `unremovable`, `hidden`, `logable`, `delivery`, `shipped`, `paid`, `pdf_invoice`, `pdf_delivery`, `deleted`) VALUES
(1, 0, 1, '', '#4169E1', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 1, 1, '', '#32CD32', 1, 0, 1, 0, 0, 1, 1, 0, 0),
(3, 1, 1, '', '#FF8C00', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 0, 1, '', '#DC143C', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 1, 1, '', '#ec2e15', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 0, 1, '', '#8f0621', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 1, 0, '', '#FF69B4', 1, 0, 0, 0, 0, 1, 0, 0, 0),
(8, 1, 1, '', '#F0B656', 1, 0, 1, 0, 0, 0, 0, 0, 0),
(9, 0, 0, '', '#4169E1', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 1, 0, '', '#32CD32', 1, 0, 1, 0, 0, 0, 0, 0, 0),
(11, 0, 0, '', '#FF69B4', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 0, 0, '', '#FF69B4', 1, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_order_state_lang`
--

CREATE TABLE `qlo_order_state_lang` (
  `id_order_state` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `template` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_order_state_lang`
--

INSERT INTO `qlo_order_state_lang` (`id_order_state`, `id_lang`, `name`, `template`) VALUES
(1, 1, 'Awaiting payment', 'awaiting_payment'),
(2, 1, 'Complete payment received', 'payment_accepted'),
(3, 1, 'Processing in progress', 'processing'),
(4, 1, 'Canceled', 'order_canceled'),
(5, 1, 'Refunded', 'refund'),
(6, 1, 'Payment error', 'payment_error'),
(7, 1, 'Overbooking (Paid)', ''),
(8, 1, 'Partial payment received', 'partial_payment_accepted'),
(9, 1, 'Awaiting remote payment', ''),
(10, 1, 'Remote payment accepted', 'payment_accepted'),
(11, 1, 'Overbooking (Not paid)', ''),
(12, 1, 'Overbooking (Partial payment)', '');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_pack`
--

CREATE TABLE `qlo_pack` (
  `id_product_pack` int(10) UNSIGNED NOT NULL,
  `id_product_item` int(10) UNSIGNED NOT NULL,
  `id_product_attribute_item` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_page`
--

CREATE TABLE `qlo_page` (
  `id_page` int(10) UNSIGNED NOT NULL,
  `id_page_type` int(10) UNSIGNED NOT NULL,
  `id_object` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_page`
--

INSERT INTO `qlo_page` (`id_page`, `id_page_type`, `id_object`) VALUES
(1, 1, NULL),
(2, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_pagenotfound`
--

CREATE TABLE `qlo_pagenotfound` (
  `id_pagenotfound` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `id_shop_group` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `request_uri` varchar(256) NOT NULL,
  `http_referer` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_pagenotfound`
--

INSERT INTO `qlo_pagenotfound` (`id_pagenotfound`, `id_shop`, `id_shop_group`, `request_uri`, `http_referer`, `date_add`) VALUES
(1, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/autoload/uniform.default.css.map', '', '2025-08-08 06:27:38'),
(2, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/modules/blocknewsletter/blocknewsletter.css.map', '', '2025-08-08 06:27:38'),
(3, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/product_list.css.map', '', '2025-08-08 06:27:38'),
(4, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/global.css.map', '', '2025-08-08 06:27:38'),
(5, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/modules/blockcart/blockcart.css.map', '', '2025-08-08 06:27:38'),
(6, 1, 1, '/qloapps/js/daterangepicker/moment.min.js.map', '', '2025-08-08 06:27:39'),
(7, 1, 1, '/qloapps/js/daterangepicker/moment.min.js.map', '', '2025-08-08 20:48:21'),
(8, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/autoload/uniform.default.css.map', '', '2025-08-08 20:48:21'),
(9, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/modules/blocknewsletter/blocknewsletter.css.map', '', '2025-08-08 20:48:21'),
(10, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/modules/blockcart/blockcart.css.map', '', '2025-08-08 20:48:21'),
(11, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/print.css.map', '', '2025-08-08 20:48:21'),
(12, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/product.css.map', '', '2025-08-08 20:48:21'),
(13, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/global.css.map', '', '2025-08-08 20:48:21'),
(14, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/global.css.map', '', '2025-08-08 22:06:15'),
(15, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/autoload/uniform.default.css.map', '', '2025-08-08 22:06:15'),
(16, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/modules/blocknewsletter/blocknewsletter.css.map', '', '2025-08-08 22:06:15'),
(17, 1, 1, '/qloapps/themes/hotel-reservation-theme/css/modules/blockcart/blockcart.css.map', '', '2025-08-08 22:06:15'),
(18, 1, 1, '/qloapps/js/daterangepicker/moment.min.js.map', '', '2025-08-08 22:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_page_type`
--

CREATE TABLE `qlo_page_type` (
  `id_page_type` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_page_type`
--

INSERT INTO `qlo_page_type` (`id_page_type`, `name`) VALUES
(1, 'index'),
(2, 'pagenotfound');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_page_viewed`
--

CREATE TABLE `qlo_page_viewed` (
  `id_page` int(10) UNSIGNED NOT NULL,
  `id_shop_group` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `id_shop` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `id_date_range` int(10) UNSIGNED NOT NULL,
  `counter` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product`
--

CREATE TABLE `qlo_product` (
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_supplier` int(10) UNSIGNED DEFAULT NULL,
  `id_manufacturer` int(10) UNSIGNED DEFAULT NULL,
  `id_category_default` int(10) UNSIGNED DEFAULT NULL,
  `id_shop_default` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `id_tax_rules_group` int(11) UNSIGNED NOT NULL,
  `on_sale` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `online_only` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `ecotax` decimal(17,6) NOT NULL DEFAULT 0.000000,
  `quantity` int(10) NOT NULL DEFAULT 0,
  `minimal_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `allow_multiple_quantity` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `max_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `price_calculation_method` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unity` varchar(255) DEFAULT NULL,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `additional_shipping_cost` decimal(20,2) NOT NULL DEFAULT 0.00,
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `width` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `height` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `depth` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `weight` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `out_of_stock` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `quantity_discount` tinyint(1) DEFAULT 0,
  `customizable` tinyint(2) NOT NULL DEFAULT 0,
  `uploadable_files` tinyint(4) NOT NULL DEFAULT 0,
  `text_fields` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `redirect_type` enum('','404','301','302') NOT NULL DEFAULT '',
  `id_product_redirected` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `available_for_order` tinyint(1) NOT NULL DEFAULT 1,
  `auto_add_to_cart` tinyint(1) NOT NULL DEFAULT 0,
  `price_addition_type` tinyint(1) NOT NULL DEFAULT 1,
  `show_at_front` tinyint(1) NOT NULL DEFAULT 1,
  `selling_preference_type` tinyint(1) NOT NULL DEFAULT 1,
  `price_display_method` tinyint(1) NOT NULL DEFAULT 1,
  `available_date` date NOT NULL DEFAULT '0000-00-00',
  `condition` enum('new','used','refurbished') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT 1,
  `indexed` tinyint(1) NOT NULL DEFAULT 0,
  `visibility` enum('both','catalog','search','none') NOT NULL DEFAULT 'both',
  `cache_is_pack` tinyint(1) NOT NULL DEFAULT 0,
  `cache_has_attachments` tinyint(1) NOT NULL DEFAULT 0,
  `is_virtual` tinyint(1) NOT NULL DEFAULT 0,
  `booking_product` tinyint(1) NOT NULL DEFAULT 1,
  `cache_default_attribute` int(10) UNSIGNED DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `advanced_stock_management` tinyint(1) NOT NULL DEFAULT 0,
  `pack_stock_type` int(11) UNSIGNED NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_product`
--

INSERT INTO `qlo_product` (`id_product`, `id_supplier`, `id_manufacturer`, `id_category_default`, `id_shop_default`, `id_tax_rules_group`, `on_sale`, `online_only`, `ean13`, `upc`, `ecotax`, `quantity`, `minimal_quantity`, `allow_multiple_quantity`, `max_quantity`, `price_calculation_method`, `price`, `wholesale_price`, `unity`, `unit_price_ratio`, `additional_shipping_cost`, `reference`, `supplier_reference`, `location`, `width`, `height`, `depth`, `weight`, `out_of_stock`, `quantity_discount`, `customizable`, `uploadable_files`, `text_fields`, `active`, `redirect_type`, `id_product_redirected`, `available_for_order`, `auto_add_to_cart`, `price_addition_type`, `show_at_front`, `selling_preference_type`, `price_display_method`, `available_date`, `condition`, `show_price`, `indexed`, `visibility`, `cache_is_pack`, `cache_has_attachments`, `is_virtual`, `booking_product`, `cache_default_attribute`, `date_add`, `date_upd`, `advanced_stock_management`, `pack_stock_type`) VALUES
(1, 0, 0, 8, 1, 1, 0, 0, '', '', 0.000000, 0, 1, 0, 0, 0, 1024.000000, 0.000000, '', 0.000000, 0.00, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '404', 0, 1, 0, 0, 1, 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 1, 1, 0, '2025-08-07 02:32:23', '2025-08-08 21:38:27', 0, 3),
(2, 0, 0, 8, 1, 1, 0, 0, '', '', 0.000000, 0, 1, 0, 0, 0, 1500.000000, 0.000000, '', 0.000000, 0.00, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '', 0, 1, 0, 0, 1, 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 1, 1, 0, '2025-08-07 02:32:24', '2025-08-17 05:35:29', 0, 3),
(3, 0, 0, 8, 1, 1, 0, 0, '', '', 0.000000, 0, 1, 0, 0, 0, 2000.000000, 0.000000, '', 0.000000, 0.00, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '', 0, 1, 0, 0, 1, 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 1, 1, 0, '2025-08-07 02:32:25', '2025-08-17 05:35:29', 0, 3),
(4, 0, 0, 8, 1, 1, 0, 0, '', '', 0.000000, 0, 1, 0, 0, 0, 2500.000000, 0.000000, '', 0.000000, 0.00, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '404', 0, 1, 0, 0, 1, 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 1, 1, 0, '2025-08-07 02:32:26', '2025-08-17 05:37:56', 0, 3),
(5, 0, 0, 12, 1, 0, 0, 0, '', '', 0.000000, 0, 1, 0, 0, 2, 250.000000, 0.000000, '', 0.000000, 0.00, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '', 0, 1, 1, 1, 0, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 1, 0, 0, '2025-08-07 02:32:28', '2025-08-07 02:32:28', 0, 3),
(6, 0, 0, 12, 1, 1, 0, 0, '', '', 0.000000, 0, 1, 0, 0, 1, 250.000000, 0.000000, '', 0.000000, 0.00, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '', 0, 1, 1, 2, 0, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 1, 0, 0, '2025-08-07 02:32:28', '2025-08-07 02:32:28', 0, 3),
(7, 0, 0, 10, 1, 1, 0, 0, '', '', 0.000000, 0, 1, 0, 0, 1, 50.000000, 0.000000, '', 0.000000, 0.00, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '', 0, 1, 0, 1, 1, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 1, 0, 0, '2025-08-07 02:32:29', '2025-08-07 02:32:29', 0, 3),
(8, 0, 0, 10, 1, 1, 0, 0, '', '', 0.000000, 0, 1, 0, 0, 1, 200.000000, 0.000000, '', 0.000000, 0.00, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '', 0, 1, 0, 1, 1, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 1, 0, 0, '2025-08-07 02:32:30', '2025-08-07 02:32:30', 0, 3),
(9, 0, 0, 9, 1, 1, 0, 0, '', '', 0.000000, 0, 1, 0, 0, 2, 350.000000, 0.000000, '', 0.000000, 0.00, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '', 0, 1, 0, 1, 1, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 1, 0, 0, '2025-08-07 02:32:31', '2025-08-07 02:32:31', 0, 3),
(10, 0, 0, 9, 1, 1, 0, 0, '', '', 0.000000, 0, 1, 0, 0, 2, 450.000000, 0.000000, '', 0.000000, 0.00, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '', 0, 1, 0, 1, 1, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 1, 0, 0, '2025-08-07 02:32:31', '2025-08-07 02:32:31', 0, 3),
(11, 0, 0, 15, 1, 1, 0, 0, '', '', 0.000000, 0, 1, 0, 0, 0, 257.000000, 0.000000, '', 0.000000, 0.00, '', '', '', 0.000000, 0.000000, 0.000000, 0.000000, 2, 0, 0, 0, 0, 1, '404', 0, 1, 0, 0, 1, 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, 1, 1, 0, '2025-08-14 04:11:09', '2025-08-17 05:38:04', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_attachment`
--

CREATE TABLE `qlo_product_attachment` (
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_attachment` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_attribute`
--

CREATE TABLE `qlo_product_attribute` (
  `id_product_attribute` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `ecotax` decimal(17,6) NOT NULL DEFAULT 0.000000,
  `quantity` int(10) NOT NULL DEFAULT 0,
  `weight` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_impact` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `default_on` tinyint(1) UNSIGNED DEFAULT NULL,
  `minimal_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `available_date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_attribute_combination`
--

CREATE TABLE `qlo_product_attribute_combination` (
  `id_attribute` int(10) UNSIGNED NOT NULL,
  `id_product_attribute` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_attribute_image`
--

CREATE TABLE `qlo_product_attribute_image` (
  `id_product_attribute` int(10) UNSIGNED NOT NULL,
  `id_image` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_attribute_shop`
--

CREATE TABLE `qlo_product_attribute_shop` (
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_product_attribute` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `ecotax` decimal(17,6) NOT NULL DEFAULT 0.000000,
  `weight` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unit_price_impact` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `default_on` tinyint(1) UNSIGNED DEFAULT NULL,
  `minimal_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `available_date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_carrier`
--

CREATE TABLE `qlo_product_carrier` (
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_carrier_reference` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_country_tax`
--

CREATE TABLE `qlo_product_country_tax` (
  `id_product` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_download`
--

CREATE TABLE `qlo_product_download` (
  `id_product_download` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `display_filename` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_expiration` datetime DEFAULT NULL,
  `nb_days_accessible` int(10) UNSIGNED DEFAULT NULL,
  `nb_downloadable` int(10) UNSIGNED DEFAULT 1,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `is_shareable` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_group_reduction_cache`
--

CREATE TABLE `qlo_product_group_reduction_cache` (
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_group` int(10) UNSIGNED NOT NULL,
  `reduction` decimal(4,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_lang`
--

CREATE TABLE `qlo_product_lang` (
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `description_short` text DEFAULT NULL,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `available_now` varchar(255) DEFAULT NULL,
  `available_later` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_product_lang`
--

INSERT INTO `qlo_product_lang` (`id_product`, `id_shop`, `id_lang`, `description`, `description_short`, `link_rewrite`, `meta_description`, `meta_keywords`, `meta_title`, `name`, `available_now`, `available_later`) VALUES
(1, 1, 1, '<p>Make yourself at home in our spacious General Rooms, tailored for families or groups seeking comfort and convenience. This accommodation offers multiple bedrooms, ensuring everyone has their own space to relax and recharge. The cozy living area is perfect for bonding over games or movie nights, while the well-equipped kitchenette allows for effortless meal preparation. Each room is equipped with flat-screen TVs and complimentary Wi-Fi, ensuring everyone stays entertained and connected throughout their stay. Ideal for creating lasting memories together in a setting of warmth and hospitality.</p>', 'Our General Rooms offer space and comfort with multiple bedrooms and a cozy living area. Enjoy flat-screen TVs, complimentary Wi-Fi, and a kitchenette for a perfect family getaway.', 'general-rooms', '', '', '', 'General Rooms', '', ''),
(2, 1, 1, 'Experience the epitome of luxury in our Deluxe Room. Gaze out over serene waters from the comfort of your spacious accommodation, furnished with a plush king-sized bed and elegant decor. Whether unwinding in the sitting area or enjoying modern amenities like complimentary Wi-Fi and a flat-screen TV, every detail ensures your stay is both relaxing and indulgent. Perfect for guests seeking a peaceful retreat with breathtaking views and refined comfort.', 'Enjoy lake views from our Deluxe Rooms with a king-sized bed, elegant furnishings, and a spacious sitting area. Perfect for guests seeking comfort, luxury, and modern amenities.', 'delux-rooms', '', '', '', 'Delux Rooms', '', ''),
(3, 1, 1, 'Elevate your stay with the expansive comfort of our Executive Room. Designed for discerning travelers, this room features separate living and sleeping areas adorned with sophisticated furnishings and luxurious touches. Pamper yourself in the deluxe bathroom, complete with a soaking tub and premium toiletries. Enjoy exclusive access to our executive lounge for unwinding with complimentary refreshments and tranquil surroundings. Ideal for business travelers or those seeking extra space and privacy in a setting of unparalleled sophistication.', 'Indulge in our Executive Rooms, featuring separate living and sleeping areas, a luxurious bathroom, and exclusive lounge access. Ideal for business travelers seeking privacy', 'executive-rooms', '', '', '', 'Executive Rooms', '', ''),
(4, 1, 1, '<p>Indulge in ultimate tranquility in our Luxury Room, where expansive vistas and serene surroundings create a peaceful oasis. Wake up to panoramic views complemented by elegant decor and a comfortable queen-sized bed. Whether catching up on work at the well-appointed workspace or simply relaxing in serene ambiance, this room offers a luxurious retreat for both business and leisure travelers alike. Perfect for those seeking comfort, style, and breathtaking views in an unparalleled setting.</p>', 'Retreat to tranquility in our Luxury Rooms with expansive views. Featuring a queen-sized bed, workspace, and serene decor, perfect for business and leisure travelers alike.', 'luxury-rooms', '', '', '', 'Ultra Premium Rooms', '', ''),
(5, 1, 1, 'Ensure a comfortable stay with our room maintenance service, keeping your accommodation pristine and hassle-free throughout your visit.', 'Ensure a comfortable stay with our room maintenance service, keeping your accommodation pristine and hassle-free throughout your visit.', 'room-maintenance-fees', '', '', '', 'Room Maintenance Fees', '', ''),
(6, 1, 1, 'Navigate our website effortlessly with seamless handling, ensuring reliable, high-speed access for an enjoyable browsing experience throughout your online journey.', 'Navigate our website effortlessly with seamless handling, ensuring reliable, high-speed access for an enjoyable browsing experience throughout your online journey.', 'internet-handling-charges', '', '', '', 'Internet Handling Charges', '', ''),
(7, 1, 1, 'Experience convenience from touchdown to check-in with our efficient airport shuttle service, whisking you to your accommodation with ease and comfort.', 'Experience convenience from touchdown to check-in with our efficient airport shuttle service, whisking you to your accommodation with ease and comfort.', 'airport-shuttle', '', '', '', 'Airport Shuttle', '', ''),
(8, 1, 1, 'Explore the city conveniently with our cab-on-demand service, giving you the freedom to travel and discover local attractions at your own pace.', 'Explore the city conveniently with our cab-on-demand service, giving you the freedom to travel and discover local attractions at your own pace.', 'cab-on-demand', '', '', '', 'Cab on Demand', '', ''),
(9, 1, 1, 'Start your day right with a delicious and hearty breakfast, thoughtfully prepared to fuel your adventures and make your mornings exceptional.', 'Start your day right with a delicious and hearty breakfast, thoughtfully prepared to fuel your adventures and make your mornings exceptional.', 'breakfast', '', '', '', 'Breakfast', '', ''),
(10, 1, 1, 'Wind down in the evening with a delectable dinner spread, offering a culinary journey that delights your taste buds and completes your day with satisfaction.', 'Wind down in the evening with a delectable dinner spread, offering a culinary journey that delights your taste buds and completes your day with satisfaction.', 'dinner', '', '', '', 'Dinner', '', ''),
(11, 1, 1, '<p>Make yourself at home in our spacious Luxury Room, tailored for families or groups seeking comfort and convenience. This accommodation offers multiple bedrooms, ensuring everyone has their own space to relax and recharge. The cozy living area is perfect for bonding over games or movie nights, while the well-equipped kitchenette allows for effortless meal preparation. Each room is equipped with flat-screen TVs and complimentary Wi-Fi, ensuring everyone stays entertained and connected throughout their stay. Ideal for creating lasting memories together in a setting of warmth and hospitality.</p>', 'Two-Bedroom Apartment:\r\nBedroom 1: queen bed\r\nBedroom 2: twin beds\r\nLiving room 1: sofa bed', 'luxury', '', '', '', 'Luxury Rooms', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_option`
--

CREATE TABLE `qlo_product_option` (
  `id_product_option` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `price_impact` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_option_lang`
--

CREATE TABLE `qlo_product_option_lang` (
  `id_product_option` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_sale`
--

CREATE TABLE `qlo_product_sale` (
  `id_product` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sale_nbr` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `date_upd` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_shop`
--

CREATE TABLE `qlo_product_shop` (
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL,
  `id_category_default` int(10) UNSIGNED DEFAULT NULL,
  `id_tax_rules_group` int(11) UNSIGNED NOT NULL,
  `on_sale` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `online_only` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `ecotax` decimal(17,6) NOT NULL DEFAULT 0.000000,
  `minimal_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `allow_multiple_quantity` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `max_quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `price_calculation_method` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `unity` varchar(255) DEFAULT NULL,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `additional_shipping_cost` decimal(20,2) NOT NULL DEFAULT 0.00,
  `customizable` tinyint(2) NOT NULL DEFAULT 0,
  `uploadable_files` tinyint(4) NOT NULL DEFAULT 0,
  `text_fields` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `redirect_type` enum('','404','301','302') NOT NULL DEFAULT '',
  `id_product_redirected` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `available_for_order` tinyint(1) NOT NULL DEFAULT 1,
  `auto_add_to_cart` tinyint(1) NOT NULL DEFAULT 0,
  `price_addition_type` tinyint(1) NOT NULL DEFAULT 1,
  `show_at_front` tinyint(1) NOT NULL DEFAULT 1,
  `price_display_method` tinyint(1) NOT NULL DEFAULT 1,
  `available_date` date NOT NULL DEFAULT '0000-00-00',
  `condition` enum('new','used','refurbished') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT 1,
  `indexed` tinyint(1) NOT NULL DEFAULT 0,
  `visibility` enum('both','catalog','search','none') NOT NULL DEFAULT 'both',
  `cache_default_attribute` int(10) UNSIGNED DEFAULT NULL,
  `advanced_stock_management` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `pack_stock_type` int(11) UNSIGNED NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_product_shop`
--

INSERT INTO `qlo_product_shop` (`id_product`, `id_shop`, `id_category_default`, `id_tax_rules_group`, `on_sale`, `online_only`, `ecotax`, `minimal_quantity`, `allow_multiple_quantity`, `max_quantity`, `price_calculation_method`, `price`, `wholesale_price`, `unity`, `unit_price_ratio`, `additional_shipping_cost`, `customizable`, `uploadable_files`, `text_fields`, `active`, `redirect_type`, `id_product_redirected`, `available_for_order`, `auto_add_to_cart`, `price_addition_type`, `show_at_front`, `price_display_method`, `available_date`, `condition`, `show_price`, `indexed`, `visibility`, `cache_default_attribute`, `advanced_stock_management`, `date_add`, `date_upd`, `pack_stock_type`) VALUES
(1, 1, 8, 1, 0, 0, 0.000000, 1, 0, 0, 0, 1024.000000, 0.000000, '', 0.000000, 0.00, 0, 0, 0, 1, '404', 0, 1, 0, 0, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, '2025-08-07 02:32:23', '2025-08-08 21:38:27', 3),
(2, 1, 8, 1, 0, 0, 0.000000, 1, 0, 0, 0, 1500.000000, 0.000000, '', 0.000000, 0.00, 0, 0, 0, 1, '', 0, 1, 0, 0, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, '2025-08-07 02:32:24', '2025-08-17 05:35:29', 3),
(3, 1, 8, 1, 0, 0, 0.000000, 1, 0, 0, 0, 2000.000000, 0.000000, '', 0.000000, 0.00, 0, 0, 0, 1, '', 0, 1, 0, 0, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, '2025-08-07 02:32:25', '2025-08-17 05:35:29', 3),
(4, 1, 8, 1, 0, 0, 0.000000, 1, 0, 0, 0, 2500.000000, 0.000000, '', 0.000000, 0.00, 0, 0, 0, 1, '404', 0, 1, 0, 0, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, '2025-08-07 02:32:26', '2025-08-17 05:37:56', 3),
(5, 1, 12, 0, 0, 0, 0.000000, 1, 0, 0, 2, 250.000000, 0.000000, '', 0.000000, 0.00, 0, 0, 0, 1, '', 0, 1, 1, 1, 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, '2025-08-07 02:32:28', '2025-08-07 02:32:28', 3),
(6, 1, 12, 1, 0, 0, 0.000000, 1, 0, 0, 1, 250.000000, 0.000000, '', 0.000000, 0.00, 0, 0, 0, 1, '', 0, 1, 1, 2, 0, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, '2025-08-07 02:32:28', '2025-08-07 02:32:28', 3),
(7, 1, 10, 1, 0, 0, 0.000000, 1, 0, 0, 1, 50.000000, 0.000000, '', 0.000000, 0.00, 0, 0, 0, 1, '', 0, 1, 0, 1, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, '2025-08-07 02:32:29', '2025-08-07 02:32:29', 3),
(8, 1, 10, 1, 0, 0, 0.000000, 1, 0, 0, 1, 200.000000, 0.000000, '', 0.000000, 0.00, 0, 0, 0, 1, '', 0, 1, 0, 1, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, '2025-08-07 02:32:30', '2025-08-07 02:32:30', 3),
(9, 1, 9, 1, 0, 0, 0.000000, 1, 0, 0, 2, 350.000000, 0.000000, '', 0.000000, 0.00, 0, 0, 0, 1, '', 0, 1, 0, 1, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, '2025-08-07 02:32:31', '2025-08-07 02:32:31', 3),
(10, 1, 9, 1, 0, 0, 0.000000, 1, 0, 0, 2, 450.000000, 0.000000, '', 0.000000, 0.00, 0, 0, 0, 1, '', 0, 1, 0, 1, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, '2025-08-07 02:32:31', '2025-08-07 02:32:31', 3),
(11, 1, 15, 1, 0, 0, 0.000000, 1, 0, 0, 0, 257.000000, 0.000000, '', 0.000000, 0.00, 0, 0, 0, 1, '404', 0, 1, 0, 0, 1, 1, '0000-00-00', 'new', 1, 1, 'both', 0, 0, '2025-08-14 04:11:09', '2025-08-17 05:38:04', 3);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_supplier`
--

CREATE TABLE `qlo_product_supplier` (
  `id_product_supplier` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `id_product_attribute` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `id_supplier` int(11) UNSIGNED NOT NULL,
  `product_supplier_reference` varchar(32) DEFAULT NULL,
  `product_supplier_price_te` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `id_currency` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_product_tag`
--

CREATE TABLE `qlo_product_tag` (
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_tag` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_profile`
--

CREATE TABLE `qlo_profile` (
  `id_profile` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_profile`
--

INSERT INTO `qlo_profile` (`id_profile`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_profile_lang`
--

CREATE TABLE `qlo_profile_lang` (
  `id_lang` int(10) UNSIGNED NOT NULL,
  `id_profile` int(10) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_profile_lang`
--

INSERT INTO `qlo_profile_lang` (`id_lang`, `id_profile`, `name`) VALUES
(1, 1, 'SuperAdmin');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_qcmc_channel_manager_booking`
--

CREATE TABLE `qlo_qcmc_channel_manager_booking` (
  `id_channel_manager_booking` int(10) UNSIGNED NOT NULL,
  `id_order` int(11) UNSIGNED NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_qhr_category`
--

CREATE TABLE `qlo_qhr_category` (
  `id_category` int(10) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_qhr_category`
--

INSERT INTO `qlo_qhr_category` (`id_category`, `active`, `date_add`, `date_upd`) VALUES
(1, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33'),
(2, 1, '2025-08-07 02:32:33', '2025-08-07 02:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_qhr_category_lang`
--

CREATE TABLE `qlo_qhr_category_lang` (
  `id_category` int(10) NOT NULL,
  `id_lang` int(10) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_qhr_category_lang`
--

INSERT INTO `qlo_qhr_category_lang` (`id_category`, `id_lang`, `name`) VALUES
(1, 1, 'Food'),
(2, 1, 'Room Service');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_qhr_hotel_review`
--

CREATE TABLE `qlo_qhr_hotel_review` (
  `id_hotel_review` int(10) NOT NULL,
  `id_hotel` int(10) NOT NULL,
  `id_order` int(10) NOT NULL,
  `rating` float UNSIGNED NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status_abusive` tinyint(1) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_qhr_review_category_rating`
--

CREATE TABLE `qlo_qhr_review_category_rating` (
  `id_hotel_review` int(10) NOT NULL,
  `id_category` int(10) NOT NULL,
  `rating` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_qhr_review_reply`
--

CREATE TABLE `qlo_qhr_review_reply` (
  `id_review_reply` int(10) NOT NULL,
  `id_hotel_review` int(10) NOT NULL,
  `id_employee` int(10) NOT NULL DEFAULT 0,
  `message` text NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_qhr_review_report`
--

CREATE TABLE `qlo_qhr_review_report` (
  `id_hotel_review` int(10) NOT NULL,
  `id_customer` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_qhr_review_usefulness`
--

CREATE TABLE `qlo_qhr_review_usefulness` (
  `id_hotel_review` int(10) NOT NULL,
  `id_customer` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_quick_access`
--

CREATE TABLE `qlo_quick_access` (
  `id_quick_access` int(10) UNSIGNED NOT NULL,
  `new_window` tinyint(1) NOT NULL DEFAULT 0,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_quick_access`
--

INSERT INTO `qlo_quick_access` (`id_quick_access`, `new_window`, `link`) VALUES
(1, 0, 'index.php?controller=AdminProducts&addproduct'),
(2, 0, 'index.php?controller=AdminCartRules&addcart_rule');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_quick_access_lang`
--

CREATE TABLE `qlo_quick_access_lang` (
  `id_quick_access` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_quick_access_lang`
--

INSERT INTO `qlo_quick_access_lang` (`id_quick_access`, `id_lang`, `name`) VALUES
(1, 1, 'New room type'),
(2, 1, 'New voucher');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_range_price`
--

CREATE TABLE `qlo_range_price` (
  `id_range_price` int(10) UNSIGNED NOT NULL,
  `id_carrier` int(10) UNSIGNED NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_range_weight`
--

CREATE TABLE `qlo_range_weight` (
  `id_range_weight` int(10) UNSIGNED NOT NULL,
  `id_carrier` int(10) UNSIGNED NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_referrer`
--

CREATE TABLE `qlo_referrer` (
  `id_referrer` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `http_referer_regexp` varchar(64) DEFAULT NULL,
  `http_referer_like` varchar(64) DEFAULT NULL,
  `request_uri_regexp` varchar(64) DEFAULT NULL,
  `request_uri_like` varchar(64) DEFAULT NULL,
  `http_referer_regexp_not` varchar(64) DEFAULT NULL,
  `http_referer_like_not` varchar(64) DEFAULT NULL,
  `request_uri_regexp_not` varchar(64) DEFAULT NULL,
  `request_uri_like_not` varchar(64) DEFAULT NULL,
  `base_fee` decimal(5,2) NOT NULL DEFAULT 0.00,
  `percent_fee` decimal(5,2) NOT NULL DEFAULT 0.00,
  `click_fee` decimal(5,2) NOT NULL DEFAULT 0.00,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_referrer_cache`
--

CREATE TABLE `qlo_referrer_cache` (
  `id_connections_source` int(11) UNSIGNED NOT NULL,
  `id_referrer` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_referrer_shop`
--

CREATE TABLE `qlo_referrer_shop` (
  `id_referrer` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `cache_visitors` int(11) DEFAULT NULL,
  `cache_visits` int(11) DEFAULT NULL,
  `cache_pages` int(11) DEFAULT NULL,
  `cache_registrations` int(11) DEFAULT NULL,
  `cache_orders` int(11) DEFAULT NULL,
  `cache_sales` decimal(17,2) DEFAULT NULL,
  `cache_reg_rate` decimal(5,4) DEFAULT NULL,
  `cache_order_rate` decimal(5,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_request_sql`
--

CREATE TABLE `qlo_request_sql` (
  `id_request_sql` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `sql` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_required_field`
--

CREATE TABLE `qlo_required_field` (
  `id_required_field` int(11) NOT NULL,
  `object_name` varchar(32) NOT NULL,
  `field_name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_risk`
--

CREATE TABLE `qlo_risk` (
  `id_risk` int(11) UNSIGNED NOT NULL,
  `percent` tinyint(3) NOT NULL,
  `color` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_risk`
--

INSERT INTO `qlo_risk` (`id_risk`, `percent`, `color`) VALUES
(1, 0, '#32CD32'),
(2, 35, '#FF8C00'),
(3, 75, '#DC143C'),
(4, 100, '#ec2e15');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_risk_lang`
--

CREATE TABLE `qlo_risk_lang` (
  `id_risk` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_risk_lang`
--

INSERT INTO `qlo_risk_lang` (`id_risk`, `id_lang`, `name`) VALUES
(1, 1, 'None'),
(2, 1, 'Low'),
(3, 1, 'Medium'),
(4, 1, 'High');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_scene`
--

CREATE TABLE `qlo_scene` (
  `id_scene` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_scene_category`
--

CREATE TABLE `qlo_scene_category` (
  `id_scene` int(10) UNSIGNED NOT NULL,
  `id_category` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_scene_lang`
--

CREATE TABLE `qlo_scene_lang` (
  `id_scene` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_scene_products`
--

CREATE TABLE `qlo_scene_products` (
  `id_scene` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `x_axis` int(4) NOT NULL,
  `y_axis` int(4) NOT NULL,
  `zone_width` int(3) NOT NULL,
  `zone_height` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_scene_shop`
--

CREATE TABLE `qlo_scene_shop` (
  `id_scene` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_search_engine`
--

CREATE TABLE `qlo_search_engine` (
  `id_search_engine` int(10) UNSIGNED NOT NULL,
  `server` varchar(64) NOT NULL,
  `getvar` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_search_engine`
--

INSERT INTO `qlo_search_engine` (`id_search_engine`, `server`, `getvar`) VALUES
(1, 'google', 'q'),
(2, 'aol', 'q'),
(3, 'yandex', 'text'),
(4, 'ask.com', 'q'),
(5, 'nhl.com', 'q'),
(6, 'yahoo', 'p'),
(7, 'baidu', 'wd'),
(8, 'lycos', 'query'),
(9, 'exalead', 'q'),
(10, 'search.live', 'q'),
(11, 'voila', 'rdata'),
(12, 'altavista', 'q'),
(13, 'bing', 'q'),
(14, 'daum', 'q'),
(15, 'eniro', 'search_word'),
(16, 'naver', 'query'),
(17, 'msn', 'q'),
(18, 'netscape', 'query'),
(19, 'cnn', 'query'),
(20, 'about', 'terms'),
(21, 'mamma', 'query'),
(22, 'alltheweb', 'q'),
(23, 'virgilio', 'qs'),
(24, 'alice', 'qs'),
(25, 'najdi', 'q'),
(26, 'mama', 'query'),
(27, 'seznam', 'q'),
(28, 'onet', 'qt'),
(29, 'szukacz', 'q'),
(30, 'yam', 'k'),
(31, 'pchome', 'q'),
(32, 'kvasir', 'q'),
(33, 'sesam', 'q'),
(34, 'ozu', 'q'),
(35, 'terra', 'query'),
(36, 'mynet', 'q'),
(37, 'ekolay', 'q'),
(38, 'rambler', 'words');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_search_index`
--

CREATE TABLE `qlo_search_index` (
  `id_product` int(11) UNSIGNED NOT NULL,
  `id_word` int(11) UNSIGNED NOT NULL,
  `weight` smallint(4) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_search_index`
--

INSERT INTO `qlo_search_index` (`id_product`, `id_word`, `weight`) VALUES
(1, 3, 1),
(1, 11, 1),
(1, 18, 1),
(1, 19, 1),
(1, 20, 1),
(1, 21, 1),
(1, 22, 1),
(1, 23, 1),
(1, 24, 1),
(1, 25, 1),
(1, 26, 1),
(1, 27, 1),
(1, 28, 1),
(1, 29, 1),
(1, 32, 1),
(1, 33, 1),
(1, 34, 1),
(1, 35, 1),
(1, 36, 1),
(1, 37, 1),
(1, 38, 1),
(1, 40, 1),
(1, 41, 1),
(1, 42, 1),
(1, 43, 1),
(1, 44, 1),
(1, 45, 1),
(1, 46, 1),
(1, 47, 1),
(1, 48, 1),
(1, 49, 1),
(1, 50, 1),
(1, 51, 1),
(1, 52, 1),
(1, 53, 1),
(1, 54, 1),
(1, 55, 1),
(1, 56, 1),
(1, 57, 1),
(1, 4, 2),
(1, 5, 2),
(1, 6, 2),
(1, 7, 2),
(1, 8, 2),
(1, 9, 2),
(1, 10, 2),
(1, 12, 2),
(1, 13, 2),
(1, 14, 2),
(1, 15, 2),
(1, 16, 2),
(1, 17, 2),
(1, 30, 2),
(1, 31, 2),
(1, 39, 2),
(1, 293, 3),
(1, 294, 3),
(1, 1, 8),
(1, 2, 8),
(1, 295, 8),
(2, 11, 1),
(2, 12, 1),
(2, 13, 1),
(2, 15, 1),
(2, 28, 1),
(2, 44, 1),
(2, 49, 1),
(2, 59, 1),
(2, 66, 1),
(2, 72, 1),
(2, 73, 1),
(2, 74, 1),
(2, 75, 1),
(2, 76, 1),
(2, 77, 1),
(2, 78, 1),
(2, 79, 1),
(2, 80, 1),
(2, 81, 1),
(2, 82, 1),
(2, 83, 1),
(2, 84, 1),
(2, 85, 1),
(2, 86, 1),
(2, 87, 1),
(2, 88, 1),
(2, 89, 1),
(2, 90, 1),
(2, 91, 1),
(2, 92, 1),
(2, 10, 2),
(2, 17, 2),
(2, 22, 2),
(2, 26, 2),
(2, 60, 2),
(2, 61, 2),
(2, 62, 2),
(2, 63, 2),
(2, 64, 2),
(2, 65, 2),
(2, 67, 2),
(2, 68, 2),
(2, 69, 2),
(2, 70, 2),
(2, 71, 2),
(2, 5, 3),
(2, 21, 3),
(2, 58, 6),
(2, 2, 7),
(3, 4, 1),
(3, 5, 1),
(3, 11, 1),
(3, 15, 1),
(3, 49, 1),
(3, 55, 1),
(3, 61, 1),
(3, 66, 1),
(3, 81, 1),
(3, 108, 1),
(3, 109, 1),
(3, 121, 1),
(3, 122, 1),
(3, 123, 1),
(3, 124, 1),
(3, 125, 1),
(3, 126, 1),
(3, 127, 1),
(3, 128, 1),
(3, 129, 1),
(3, 130, 1),
(3, 131, 1),
(3, 132, 1),
(3, 133, 1),
(3, 134, 1),
(3, 135, 1),
(3, 136, 1),
(3, 137, 1),
(3, 138, 1),
(3, 139, 1),
(3, 140, 1),
(3, 9, 2),
(3, 26, 2),
(3, 44, 2),
(3, 50, 2),
(3, 110, 2),
(3, 111, 2),
(3, 112, 2),
(3, 113, 2),
(3, 114, 2),
(3, 115, 2),
(3, 116, 2),
(3, 117, 2),
(3, 118, 2),
(3, 120, 2),
(3, 21, 3),
(3, 119, 3),
(3, 2, 7),
(3, 107, 9),
(4, 5, 1),
(4, 26, 1),
(4, 29, 1),
(4, 38, 1),
(4, 55, 1),
(4, 65, 1),
(4, 80, 1),
(4, 87, 1),
(4, 89, 1),
(4, 91, 1),
(4, 108, 1),
(4, 109, 1),
(4, 113, 1),
(4, 137, 1),
(4, 139, 1),
(4, 161, 1),
(4, 162, 1),
(4, 163, 1),
(4, 164, 1),
(4, 165, 1),
(4, 166, 1),
(4, 167, 1),
(4, 168, 1),
(4, 169, 1),
(4, 170, 1),
(4, 171, 1),
(4, 172, 1),
(4, 173, 1),
(4, 174, 1),
(4, 17, 2),
(4, 44, 2),
(4, 63, 2),
(4, 64, 2),
(4, 69, 2),
(4, 79, 2),
(4, 90, 2),
(4, 118, 2),
(4, 119, 2),
(4, 122, 2),
(4, 156, 2),
(4, 157, 2),
(4, 158, 2),
(4, 159, 2),
(4, 160, 2),
(4, 60, 3),
(4, 75, 3),
(4, 293, 3),
(4, 294, 3),
(4, 133, 6),
(4, 996, 6),
(4, 2, 7),
(4, 295, 8),
(5, 28, 2),
(5, 48, 2),
(5, 49, 2),
(5, 168, 2),
(5, 206, 2),
(5, 207, 2),
(5, 208, 2),
(5, 209, 2),
(5, 210, 2),
(5, 211, 2),
(5, 212, 2),
(5, 213, 3),
(5, 214, 3),
(5, 205, 6),
(5, 44, 8),
(5, 204, 8),
(6, 30, 2),
(6, 48, 2),
(6, 72, 2),
(6, 117, 2),
(6, 222, 2),
(6, 223, 2),
(6, 224, 2),
(6, 225, 2),
(6, 226, 2),
(6, 227, 2),
(6, 228, 2),
(6, 229, 2),
(6, 230, 2),
(6, 231, 2),
(6, 232, 2),
(6, 213, 3),
(6, 220, 6),
(6, 221, 8),
(6, 214, 9),
(7, 5, 2),
(7, 27, 2),
(7, 28, 2),
(7, 72, 2),
(7, 207, 2),
(7, 241, 2),
(7, 242, 2),
(7, 243, 2),
(7, 244, 2),
(7, 245, 2),
(7, 246, 3),
(7, 239, 8),
(7, 240, 8),
(8, 207, 2),
(8, 254, 2),
(8, 255, 2),
(8, 256, 2),
(8, 257, 2),
(8, 258, 2),
(8, 259, 2),
(8, 260, 2),
(8, 261, 2),
(8, 262, 2),
(8, 263, 2),
(8, 246, 3),
(8, 252, 8),
(8, 253, 8),
(9, 20, 2),
(9, 267, 2),
(9, 268, 2),
(9, 269, 2),
(9, 270, 2),
(9, 271, 2),
(9, 272, 2),
(9, 273, 2),
(9, 274, 2),
(9, 275, 2),
(9, 276, 2),
(9, 277, 2),
(9, 278, 3),
(9, 266, 8),
(10, 232, 2),
(10, 268, 2),
(10, 281, 2),
(10, 282, 2),
(10, 283, 2),
(10, 284, 2),
(10, 285, 2),
(10, 286, 2),
(10, 287, 2),
(10, 288, 2),
(10, 289, 2),
(10, 290, 2),
(10, 291, 2),
(10, 278, 3),
(10, 280, 8),
(11, 4, 1),
(11, 5, 1),
(11, 6, 1),
(11, 7, 1),
(11, 8, 1),
(11, 10, 1),
(11, 12, 1),
(11, 13, 1),
(11, 14, 1),
(11, 15, 1),
(11, 16, 1),
(11, 17, 1),
(11, 20, 1),
(11, 21, 1),
(11, 22, 1),
(11, 23, 1),
(11, 24, 1),
(11, 25, 1),
(11, 26, 1),
(11, 27, 1),
(11, 28, 1),
(11, 29, 1),
(11, 32, 1),
(11, 33, 1),
(11, 34, 1),
(11, 35, 1),
(11, 36, 1),
(11, 37, 1),
(11, 38, 1),
(11, 40, 1),
(11, 41, 1),
(11, 42, 1),
(11, 43, 1),
(11, 45, 1),
(11, 46, 1),
(11, 47, 1),
(11, 48, 1),
(11, 49, 1),
(11, 50, 1),
(11, 51, 1),
(11, 52, 1),
(11, 53, 1),
(11, 54, 1),
(11, 55, 1),
(11, 56, 1),
(11, 57, 1),
(11, 157, 1),
(11, 414, 1),
(11, 417, 1),
(11, 418, 1),
(11, 419, 1),
(11, 9, 2),
(11, 30, 2),
(11, 31, 2),
(11, 39, 2),
(11, 64, 2),
(11, 44, 3),
(11, 415, 3),
(11, 423, 3),
(11, 416, 4),
(11, 2, 6),
(11, 69, 10);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_search_word`
--

CREATE TABLE `qlo_search_word` (
  `id_word` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `word` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_search_word`
--

INSERT INTO `qlo_search_word` (`id_word`, `id_shop`, `id_lang`, `word`) VALUES
(117, 1, 1, 'access'),
(28, 1, 1, 'accommodation'),
(448, 1, 1, 'accommodations'),
(463, 1, 1, 'activities'),
(441, 1, 1, 'additional'),
(126, 1, 1, 'adorned'),
(275, 1, 1, 'adventures'),
(450, 1, 1, 'air'),
(239, 1, 1, 'airport'),
(160, 1, 1, 'alike'),
(40, 1, 1, 'allows'),
(462, 1, 1, 'also'),
(173, 1, 1, 'ambiance'),
(71, 1, 1, 'amenities'),
(416, 1, 1, 'apartment'),
(171, 1, 1, 'appointed'),
(10, 1, 1, 'area'),
(112, 1, 1, 'areas'),
(262, 1, 1, 'attractions'),
(429, 1, 1, 'away'),
(114, 1, 1, 'bathroom'),
(449, 1, 1, 'bathrooms'),
(438, 1, 1, 'beachfront'),
(64, 1, 1, 'bed'),
(415, 1, 1, 'bedroom'),
(7, 1, 1, 'bedrooms'),
(418, 1, 1, 'beds'),
(34, 1, 1, 'bonding'),
(266, 1, 1, 'breakfast'),
(91, 1, 1, 'breathtaking'),
(230, 1, 1, 'browsing'),
(289, 1, 1, 'buds'),
(118, 1, 1, 'business'),
(252, 1, 1, 'cab'),
(461, 1, 1, 'castle'),
(169, 1, 1, 'catching'),
(421, 1, 1, 'center'),
(214, 1, 1, 'charges'),
(242, 1, 1, 'check'),
(255, 1, 1, 'city'),
(5, 1, 1, 'comfort'),
(168, 1, 1, 'comfortable'),
(167, 1, 1, 'complemented'),
(130, 1, 1, 'complete'),
(290, 1, 1, 'completes'),
(15, 1, 1, 'complimentary'),
(445, 1, 1, 'concierge'),
(451, 1, 1, 'conditioning'),
(47, 1, 1, 'connected'),
(27, 1, 1, 'convenience'),
(425, 1, 1, 'convenient'),
(256, 1, 1, 'conveniently'),
(8, 1, 1, 'cozy'),
(163, 1, 1, 'create'),
(51, 1, 1, 'creating'),
(286, 1, 1, 'culinary'),
(465, 1, 1, 'cycling'),
(268, 1, 1, 'day'),
(79, 1, 1, 'decor'),
(283, 1, 1, 'delectable'),
(436, 1, 1, 'delgado'),
(270, 1, 1, 'delicious'),
(287, 1, 1, 'delights'),
(58, 1, 1, 'delux'),
(61, 1, 1, 'deluxe'),
(253, 1, 1, 'demand'),
(123, 1, 1, 'designed'),
(85, 1, 1, 'detail'),
(280, 1, 1, 'dinner'),
(124, 1, 1, 'discerning'),
(260, 1, 1, 'discover'),
(430, 1, 1, 'dona'),
(245, 1, 1, 'ease'),
(243, 1, 1, 'efficient'),
(41, 1, 1, 'effortless'),
(224, 1, 1, 'effortlessly'),
(65, 1, 1, 'elegant'),
(121, 1, 1, 'elevate'),
(11, 1, 1, 'enjoy'),
(229, 1, 1, 'enjoyable'),
(82, 1, 1, 'enjoying'),
(206, 1, 1, 'ensure'),
(86, 1, 1, 'ensures'),
(30, 1, 1, 'ensuring'),
(46, 1, 1, 'entertained'),
(73, 1, 1, 'epitome'),
(39, 1, 1, 'equipped'),
(282, 1, 1, 'evening'),
(84, 1, 1, 'every'),
(31, 1, 1, 'everyone'),
(277, 1, 1, 'exceptional'),
(115, 1, 1, 'exclusive'),
(107, 1, 1, 'executive'),
(122, 1, 1, 'expansive'),
(72, 1, 1, 'experience'),
(254, 1, 1, 'explore'),
(138, 1, 1, 'extra'),
(437, 1, 1, 'facilities'),
(24, 1, 1, 'families'),
(18, 1, 1, 'family'),
(125, 1, 1, 'features'),
(109, 1, 1, 'featuring'),
(205, 1, 1, 'fees'),
(453, 1, 1, 'fitted'),
(12, 1, 1, 'flat'),
(211, 1, 1, 'free'),
(258, 1, 1, 'freedom'),
(274, 1, 1, 'fuel'),
(452, 1, 1, 'fully'),
(77, 1, 1, 'furnished'),
(66, 1, 1, 'furnishings'),
(35, 1, 1, 'games'),
(74, 1, 1, 'gaze'),
(1, 1, 1, 'general'),
(460, 1, 1, 'george'),
(19, 1, 1, 'getaway'),
(257, 1, 1, 'giving'),
(25, 1, 1, 'groups'),
(68, 1, 1, 'guests'),
(221, 1, 1, 'handling'),
(210, 1, 1, 'hassle'),
(271, 1, 1, 'hearty'),
(227, 1, 1, 'high'),
(21, 1, 1, 'home'),
(57, 1, 1, 'hospitality'),
(443, 1, 1, 'hot'),
(293, 1, 1, 'hotel'),
(435, 1, 1, 'humberto'),
(50, 1, 1, 'ideal'),
(442, 1, 1, 'include'),
(108, 1, 1, 'indulge'),
(88, 1, 1, 'indulgent'),
(220, 1, 1, 'internet'),
(232, 1, 1, 'journey'),
(295, 1, 1, 'jpg'),
(208, 1, 1, 'keeping'),
(62, 1, 1, 'king'),
(454, 1, 1, 'kitchen'),
(16, 1, 1, 'kitchenette'),
(59, 1, 1, 'lake'),
(456, 1, 1, 'landmarks'),
(52, 1, 1, 'lasting'),
(159, 1, 1, 'leisure'),
(83, 1, 1, 'like'),
(424, 1, 1, 'lisboa'),
(423, 1, 1, 'lisbon'),
(9, 1, 1, 'living'),
(261, 1, 1, 'local'),
(422, 1, 1, 'location'),
(116, 1, 1, 'lounge'),
(113, 1, 1, 'luxurious'),
(69, 1, 1, 'luxury'),
(204, 1, 1, 'maintenance'),
(20, 1, 1, 'make'),
(431, 1, 1, 'maria'),
(42, 1, 1, 'meal'),
(53, 1, 1, 'memories'),
(427, 1, 1, 'minute'),
(457, 1, 1, 'miradouro'),
(70, 1, 1, 'modern'),
(459, 1, 1, 'monte'),
(276, 1, 1, 'mornings'),
(36, 1, 1, 'movie'),
(6, 1, 1, 'multiple'),
(432, 1, 1, 'national'),
(222, 1, 1, 'navigate'),
(434, 1, 1, 'nearby'),
(37, 1, 1, 'nights'),
(164, 1, 1, 'oasis'),
(3, 1, 1, 'offer'),
(285, 1, 1, 'offering'),
(29, 1, 1, 'offers'),
(231, 1, 1, 'online'),
(213, 1, 1, 'operational'),
(263, 1, 1, 'pace'),
(129, 1, 1, 'pamper'),
(166, 1, 1, 'panoramic'),
(447, 1, 1, 'parking'),
(89, 1, 1, 'peaceful'),
(17, 1, 1, 'perfect'),
(455, 1, 1, 'pleasant'),
(78, 1, 1, 'plush'),
(133, 1, 1, 'premium'),
(43, 1, 1, 'preparation'),
(273, 1, 1, 'prepared'),
(294, 1, 1, 'prime'),
(209, 1, 1, 'pristine'),
(120, 1, 1, 'privacy'),
(444, 1, 1, 'private'),
(420, 1, 1, 'property'),
(819, 1, 1, 'propertyprime'),
(157, 1, 1, 'queen'),
(33, 1, 1, 'recharge'),
(92, 1, 1, 'refined'),
(135, 1, 1, 'refreshments'),
(32, 1, 1, 'relax'),
(87, 1, 1, 'relaxing'),
(226, 1, 1, 'reliable'),
(278, 1, 1, 'restaurant'),
(90, 1, 1, 'retreat'),
(269, 1, 1, 'right'),
(44, 1, 1, 'room'),
(2, 1, 1, 'rooms'),
(426, 1, 1, 'rossio'),
(291, 1, 1, 'satisfaction'),
(13, 1, 1, 'screen'),
(225, 1, 1, 'seamless'),
(26, 1, 1, 'seeking'),
(458, 1, 1, 'senhora'),
(110, 1, 1, 'separate'),
(75, 1, 1, 'serene'),
(207, 1, 1, 'service'),
(55, 1, 1, 'setting'),
(240, 1, 1, 'shuttle'),
(172, 1, 1, 'simply'),
(446, 1, 1, 'site'),
(67, 1, 1, 'sitting'),
(63, 1, 1, 'sized'),
(464, 1, 1, 'skiing'),
(111, 1, 1, 'sleeping'),
(131, 1, 1, 'soaking'),
(419, 1, 1, 'sofa'),
(127, 1, 1, 'sophisticated'),
(140, 1, 1, 'sophistication'),
(439, 1, 1, 'spa'),
(4, 1, 1, 'space'),
(22, 1, 1, 'spacious'),
(228, 1, 1, 'speed'),
(284, 1, 1, 'spread'),
(267, 1, 1, 'start'),
(49, 1, 1, 'stay'),
(45, 1, 1, 'stays'),
(174, 1, 1, 'style'),
(137, 1, 1, 'surroundings'),
(23, 1, 1, 'tailored'),
(288, 1, 1, 'taste'),
(433, 1, 1, 'theater'),
(272, 1, 1, 'thoughtfully'),
(48, 1, 1, 'throughout'),
(54, 1, 1, 'together'),
(134, 1, 1, 'toiletries'),
(241, 1, 1, 'touchdown'),
(128, 1, 1, 'touches'),
(136, 1, 1, 'tranquil'),
(156, 1, 1, 'tranquility'),
(246, 1, 1, 'transfers'),
(259, 1, 1, 'travel'),
(119, 1, 1, 'travelers'),
(132, 1, 1, 'tub'),
(14, 1, 1, 'tvs'),
(417, 1, 1, 'twin'),
(414, 1, 1, 'two'),
(161, 1, 1, 'ultimate'),
(996, 1, 1, 'ultra'),
(139, 1, 1, 'unparalleled'),
(81, 1, 1, 'unwinding'),
(60, 1, 1, 'views'),
(212, 1, 1, 'visit'),
(162, 1, 1, 'vistas'),
(165, 1, 1, 'wake'),
(428, 1, 1, 'walk'),
(56, 1, 1, 'warmth'),
(76, 1, 1, 'waters'),
(223, 1, 1, 'website'),
(38, 1, 1, 'well'),
(80, 1, 1, 'whether'),
(244, 1, 1, 'whisking'),
(440, 1, 1, 'wifi'),
(281, 1, 1, 'wind'),
(170, 1, 1, 'work'),
(158, 1, 1, 'workspace');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_sekeyword`
--

CREATE TABLE `qlo_sekeyword` (
  `id_sekeyword` int(10) UNSIGNED NOT NULL,
  `id_shop` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `id_shop_group` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `keyword` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_service_product_cart_detail`
--

CREATE TABLE `qlo_service_product_cart_detail` (
  `id_service_product_cart_detail` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) UNSIGNED NOT NULL,
  `id_cart` int(11) UNSIGNED NOT NULL,
  `id_hotel` int(11) UNSIGNED NOT NULL,
  `htl_cart_booking_id` int(11) UNSIGNED NOT NULL,
  `id_product_option` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_service_product_order_detail`
--

CREATE TABLE `qlo_service_product_order_detail` (
  `id_service_product_order_detail` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_order_detail` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `id_htl_booking_detail` int(11) NOT NULL,
  `id_product_option` int(11) NOT NULL,
  `tax_computation_method` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `id_tax_rules_group` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `unit_price_tax_excl` decimal(20,6) NOT NULL,
  `unit_price_tax_incl` decimal(20,6) NOT NULL,
  `total_price_tax_excl` decimal(20,6) NOT NULL,
  `total_price_tax_incl` decimal(20,6) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) UNSIGNED NOT NULL,
  `auto_added` tinyint(1) UNSIGNED NOT NULL,
  `is_refunded` tinyint(1) NOT NULL DEFAULT 0,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_shop`
--

CREATE TABLE `qlo_shop` (
  `id_shop` int(11) UNSIGNED NOT NULL,
  `id_shop_group` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `id_category` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_theme` int(1) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_shop`
--

INSERT INTO `qlo_shop` (`id_shop`, `id_shop_group`, `name`, `id_category`, `id_theme`, `active`, `deleted`) VALUES
(1, 1, 'Lisboa Hotels', 2, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_shop_group`
--

CREATE TABLE `qlo_shop_group` (
  `id_shop_group` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `share_customer` tinyint(1) NOT NULL,
  `share_order` tinyint(1) NOT NULL,
  `share_stock` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_shop_group`
--

INSERT INTO `qlo_shop_group` (`id_shop_group`, `name`, `share_customer`, `share_order`, `share_stock`, `active`, `deleted`) VALUES
(1, 'Default', 0, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_shop_url`
--

CREATE TABLE `qlo_shop_url` (
  `id_shop_url` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL,
  `domain` varchar(150) NOT NULL,
  `domain_ssl` varchar(150) NOT NULL,
  `physical_uri` varchar(256) NOT NULL,
  `virtual_uri` varchar(256) NOT NULL,
  `main` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_shop_url`
--

INSERT INTO `qlo_shop_url` (`id_shop_url`, `id_shop`, `domain`, `domain_ssl`, `physical_uri`, `virtual_uri`, `main`, `active`) VALUES
(1, 1, 'localhost', 'localhost', '/qloapps/', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_smarty_cache`
--

CREATE TABLE `qlo_smarty_cache` (
  `id_smarty_cache` char(40) NOT NULL,
  `name` char(40) NOT NULL,
  `cache_id` varchar(254) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_smarty_last_flush`
--

CREATE TABLE `qlo_smarty_last_flush` (
  `type` enum('compile','template') NOT NULL,
  `last_flush` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_smarty_lazy_cache`
--

CREATE TABLE `qlo_smarty_lazy_cache` (
  `template_hash` varchar(32) NOT NULL DEFAULT '',
  `cache_id` varchar(255) NOT NULL DEFAULT '',
  `compile_id` varchar(32) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_specific_price`
--

CREATE TABLE `qlo_specific_price` (
  `id_specific_price` int(10) UNSIGNED NOT NULL,
  `id_specific_price_rule` int(11) UNSIGNED NOT NULL,
  `id_cart` int(11) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_shop_group` int(11) UNSIGNED NOT NULL,
  `id_currency` int(10) UNSIGNED NOT NULL,
  `id_country` int(10) UNSIGNED NOT NULL,
  `id_group` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) UNSIGNED NOT NULL,
  `id_htl_cart_booking` int(10) UNSIGNED NOT NULL,
  `id_product_attribute` int(10) UNSIGNED NOT NULL,
  `price` decimal(20,6) NOT NULL,
  `from_quantity` mediumint(8) UNSIGNED NOT NULL,
  `reduction` decimal(20,6) NOT NULL,
  `reduction_tax` tinyint(1) NOT NULL DEFAULT 1,
  `reduction_type` enum('amount','percentage') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_specific_price_priority`
--

CREATE TABLE `qlo_specific_price_priority` (
  `id_specific_price_priority` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `priority` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_specific_price_priority`
--

INSERT INTO `qlo_specific_price_priority` (`id_specific_price_priority`, `id_product`, `priority`) VALUES
(1, 1, 'id_shop;id_currency;id_country;id_group'),
(5, 11, 'id_shop;id_currency;id_country;id_group'),
(13, 4, 'id_shop;id_currency;id_country;id_group');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_specific_price_rule`
--

CREATE TABLE `qlo_specific_price_rule` (
  `id_specific_price_rule` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `id_currency` int(10) UNSIGNED NOT NULL,
  `id_country` int(10) UNSIGNED NOT NULL,
  `id_group` int(10) UNSIGNED NOT NULL,
  `from_quantity` mediumint(8) UNSIGNED NOT NULL,
  `price` decimal(20,6) DEFAULT NULL,
  `reduction` decimal(20,6) NOT NULL,
  `reduction_tax` tinyint(1) NOT NULL DEFAULT 1,
  `reduction_type` enum('amount','percentage') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_specific_price_rule_condition`
--

CREATE TABLE `qlo_specific_price_rule_condition` (
  `id_specific_price_rule_condition` int(11) UNSIGNED NOT NULL,
  `id_specific_price_rule_condition_group` int(11) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_specific_price_rule_condition_group`
--

CREATE TABLE `qlo_specific_price_rule_condition_group` (
  `id_specific_price_rule_condition_group` int(11) UNSIGNED NOT NULL,
  `id_specific_price_rule` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_state`
--

CREATE TABLE `qlo_state` (
  `id_state` int(10) UNSIGNED NOT NULL,
  `id_country` int(11) UNSIGNED NOT NULL,
  `id_zone` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `iso_code` varchar(7) NOT NULL,
  `tax_behavior` smallint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_state`
--

INSERT INTO `qlo_state` (`id_state`, `id_country`, `id_zone`, `name`, `iso_code`, `tax_behavior`, `active`) VALUES
(1, 21, 2, 'Alabama', 'AL', 0, 1),
(2, 21, 2, 'Alaska', 'AK', 0, 1),
(3, 21, 2, 'Arizona', 'AZ', 0, 1),
(4, 21, 2, 'Arkansas', 'AR', 0, 1),
(5, 21, 2, 'California', 'CA', 0, 1),
(6, 21, 2, 'Colorado', 'CO', 0, 1),
(7, 21, 2, 'Connecticut', 'CT', 0, 1),
(8, 21, 2, 'Delaware', 'DE', 0, 1),
(9, 21, 2, 'Florida', 'FL', 0, 1),
(10, 21, 2, 'Georgia', 'GA', 0, 1),
(11, 21, 2, 'Hawaii', 'HI', 0, 1),
(12, 21, 2, 'Idaho', 'ID', 0, 1),
(13, 21, 2, 'Illinois', 'IL', 0, 1),
(14, 21, 2, 'Indiana', 'IN', 0, 1),
(15, 21, 2, 'Iowa', 'IA', 0, 1),
(16, 21, 2, 'Kansas', 'KS', 0, 1),
(17, 21, 2, 'Kentucky', 'KY', 0, 1),
(18, 21, 2, 'Louisiana', 'LA', 0, 1),
(19, 21, 2, 'Maine', 'ME', 0, 1),
(20, 21, 2, 'Maryland', 'MD', 0, 1),
(21, 21, 2, 'Massachusetts', 'MA', 0, 1),
(22, 21, 2, 'Michigan', 'MI', 0, 1),
(23, 21, 2, 'Minnesota', 'MN', 0, 1),
(24, 21, 2, 'Mississippi', 'MS', 0, 1),
(25, 21, 2, 'Missouri', 'MO', 0, 1),
(26, 21, 2, 'Montana', 'MT', 0, 1),
(27, 21, 2, 'Nebraska', 'NE', 0, 1),
(28, 21, 2, 'Nevada', 'NV', 0, 1),
(29, 21, 2, 'New Hampshire', 'NH', 0, 1),
(30, 21, 2, 'New Jersey', 'NJ', 0, 1),
(31, 21, 2, 'New Mexico', 'NM', 0, 1),
(32, 21, 2, 'New York', 'NY', 0, 1),
(33, 21, 2, 'North Carolina', 'NC', 0, 1),
(34, 21, 2, 'North Dakota', 'ND', 0, 1),
(35, 21, 2, 'Ohio', 'OH', 0, 1),
(36, 21, 2, 'Oklahoma', 'OK', 0, 1),
(37, 21, 2, 'Oregon', 'OR', 0, 1),
(38, 21, 2, 'Pennsylvania', 'PA', 0, 1),
(39, 21, 2, 'Rhode Island', 'RI', 0, 1),
(40, 21, 2, 'South Carolina', 'SC', 0, 1),
(41, 21, 2, 'South Dakota', 'SD', 0, 1),
(42, 21, 2, 'Tennessee', 'TN', 0, 1),
(43, 21, 2, 'Texas', 'TX', 0, 1),
(44, 21, 2, 'Utah', 'UT', 0, 1),
(45, 21, 2, 'Vermont', 'VT', 0, 1),
(46, 21, 2, 'Virginia', 'VA', 0, 1),
(47, 21, 2, 'Washington', 'WA', 0, 1),
(48, 21, 2, 'West Virginia', 'WV', 0, 1),
(49, 21, 2, 'Wisconsin', 'WI', 0, 1),
(50, 21, 2, 'Wyoming', 'WY', 0, 1),
(51, 21, 2, 'Puerto Rico', 'PR', 0, 1),
(52, 21, 2, 'US Virgin Islands', 'VI', 0, 1),
(53, 21, 2, 'District of Columbia', 'DC', 0, 1),
(54, 145, 2, 'Aguascalientes', 'AGS', 0, 1),
(55, 145, 2, 'Baja California', 'BCN', 0, 1),
(56, 145, 2, 'Baja California Sur', 'BCS', 0, 1),
(57, 145, 2, 'Campeche', 'CAM', 0, 1),
(58, 145, 2, 'Chiapas', 'CHP', 0, 1),
(59, 145, 2, 'Chihuahua', 'CHH', 0, 1),
(60, 145, 2, 'Coahuila', 'COA', 0, 1),
(61, 145, 2, 'Colima', 'COL', 0, 1),
(62, 145, 2, 'Distrito Federal', 'DIF', 0, 1),
(63, 145, 2, 'Durango', 'DUR', 0, 1),
(64, 145, 2, 'Guanajuato', 'GUA', 0, 1),
(65, 145, 2, 'Guerrero', 'GRO', 0, 1),
(66, 145, 2, 'Hidalgo', 'HID', 0, 1),
(67, 145, 2, 'Jalisco', 'JAL', 0, 1),
(68, 145, 2, 'Estado de México', 'MEX', 0, 1),
(69, 145, 2, 'Michoacán', 'MIC', 0, 1),
(70, 145, 2, 'Morelos', 'MOR', 0, 1),
(71, 145, 2, 'Nayarit', 'NAY', 0, 1),
(72, 145, 2, 'Nuevo León', 'NLE', 0, 1),
(73, 145, 2, 'Oaxaca', 'OAX', 0, 1),
(74, 145, 2, 'Puebla', 'PUE', 0, 1),
(75, 145, 2, 'Querétaro', 'QUE', 0, 1),
(76, 145, 2, 'Quintana Roo', 'ROO', 0, 1),
(77, 145, 2, 'San Luis Potosí', 'SLP', 0, 1),
(78, 145, 2, 'Sinaloa', 'SIN', 0, 1),
(79, 145, 2, 'Sonora', 'SON', 0, 1),
(80, 145, 2, 'Tabasco', 'TAB', 0, 1),
(81, 145, 2, 'Tamaulipas', 'TAM', 0, 1),
(82, 145, 2, 'Tlaxcala', 'TLA', 0, 1),
(83, 145, 2, 'Veracruz', 'VER', 0, 1),
(84, 145, 2, 'Yucatán', 'YUC', 0, 1),
(85, 145, 2, 'Zacatecas', 'ZAC', 0, 1),
(86, 4, 2, 'Ontario', 'ON', 0, 1),
(87, 4, 2, 'Quebec', 'QC', 0, 1),
(88, 4, 2, 'British Columbia', 'BC', 0, 1),
(89, 4, 2, 'Alberta', 'AB', 0, 1),
(90, 4, 2, 'Manitoba', 'MB', 0, 1),
(91, 4, 2, 'Saskatchewan', 'SK', 0, 1),
(92, 4, 2, 'Nova Scotia', 'NS', 0, 1),
(93, 4, 2, 'New Brunswick', 'NB', 0, 1),
(94, 4, 2, 'Newfoundland and Labrador', 'NL', 0, 1),
(95, 4, 2, 'Prince Edward Island', 'PE', 0, 1),
(96, 4, 2, 'Northwest Territories', 'NT', 0, 1),
(97, 4, 2, 'Yukon', 'YT', 0, 1),
(98, 4, 2, 'Nunavut', 'NU', 0, 1),
(99, 44, 6, 'Buenos Aires', 'B', 0, 1),
(100, 44, 6, 'Catamarca', 'K', 0, 1),
(101, 44, 6, 'Chaco', 'H', 0, 1),
(102, 44, 6, 'Chubut', 'U', 0, 1),
(103, 44, 6, 'Ciudad de Buenos Aires', 'C', 0, 1),
(104, 44, 6, 'Córdoba', 'X', 0, 1),
(105, 44, 6, 'Corrientes', 'W', 0, 1),
(106, 44, 6, 'Entre Ríos', 'E', 0, 1),
(107, 44, 6, 'Formosa', 'P', 0, 1),
(108, 44, 6, 'Jujuy', 'Y', 0, 1),
(109, 44, 6, 'La Pampa', 'L', 0, 1),
(110, 44, 6, 'La Rioja', 'F', 0, 1),
(111, 44, 6, 'Mendoza', 'M', 0, 1),
(112, 44, 6, 'Misiones', 'N', 0, 1),
(113, 44, 6, 'Neuquén', 'Q', 0, 1),
(114, 44, 6, 'Río Negro', 'R', 0, 1),
(115, 44, 6, 'Salta', 'A', 0, 1),
(116, 44, 6, 'San Juan', 'J', 0, 1),
(117, 44, 6, 'San Luis', 'D', 0, 1),
(118, 44, 6, 'Santa Cruz', 'Z', 0, 1),
(119, 44, 6, 'Santa Fe', 'S', 0, 1),
(120, 44, 6, 'Santiago del Estero', 'G', 0, 1),
(121, 44, 6, 'Tierra del Fuego', 'V', 0, 1),
(122, 44, 6, 'Tucumán', 'T', 0, 1),
(123, 10, 1, 'Agrigento', 'AG', 0, 1),
(124, 10, 1, 'Alessandria', 'AL', 0, 1),
(125, 10, 1, 'Ancona', 'AN', 0, 1),
(126, 10, 1, 'Aosta', 'AO', 0, 1),
(127, 10, 1, 'Arezzo', 'AR', 0, 1),
(128, 10, 1, 'Ascoli Piceno', 'AP', 0, 1),
(129, 10, 1, 'Asti', 'AT', 0, 1),
(130, 10, 1, 'Avellino', 'AV', 0, 1),
(131, 10, 1, 'Bari', 'BA', 0, 1),
(132, 10, 1, 'Barletta-Andria-Trani', 'BT', 0, 1),
(133, 10, 1, 'Belluno', 'BL', 0, 1),
(134, 10, 1, 'Benevento', 'BN', 0, 1),
(135, 10, 1, 'Bergamo', 'BG', 0, 1),
(136, 10, 1, 'Biella', 'BI', 0, 1),
(137, 10, 1, 'Bologna', 'BO', 0, 1),
(138, 10, 1, 'Bolzano', 'BZ', 0, 1),
(139, 10, 1, 'Brescia', 'BS', 0, 1),
(140, 10, 1, 'Brindisi', 'BR', 0, 1),
(141, 10, 1, 'Cagliari', 'CA', 0, 1),
(142, 10, 1, 'Caltanissetta', 'CL', 0, 1),
(143, 10, 1, 'Campobasso', 'CB', 0, 1),
(144, 10, 1, 'Carbonia-Iglesias', 'CI', 0, 1),
(145, 10, 1, 'Caserta', 'CE', 0, 1),
(146, 10, 1, 'Catania', 'CT', 0, 1),
(147, 10, 1, 'Catanzaro', 'CZ', 0, 1),
(148, 10, 1, 'Chieti', 'CH', 0, 1),
(149, 10, 1, 'Como', 'CO', 0, 1),
(150, 10, 1, 'Cosenza', 'CS', 0, 1),
(151, 10, 1, 'Cremona', 'CR', 0, 1),
(152, 10, 1, 'Crotone', 'KR', 0, 1),
(153, 10, 1, 'Cuneo', 'CN', 0, 1),
(154, 10, 1, 'Enna', 'EN', 0, 1),
(155, 10, 1, 'Fermo', 'FM', 0, 1),
(156, 10, 1, 'Ferrara', 'FE', 0, 1),
(157, 10, 1, 'Firenze', 'FI', 0, 1),
(158, 10, 1, 'Foggia', 'FG', 0, 1),
(159, 10, 1, 'Forlì-Cesena', 'FC', 0, 1),
(160, 10, 1, 'Frosinone', 'FR', 0, 1),
(161, 10, 1, 'Genova', 'GE', 0, 1),
(162, 10, 1, 'Gorizia', 'GO', 0, 1),
(163, 10, 1, 'Grosseto', 'GR', 0, 1),
(164, 10, 1, 'Imperia', 'IM', 0, 1),
(165, 10, 1, 'Isernia', 'IS', 0, 1),
(166, 10, 1, 'L\'Aquila', 'AQ', 0, 1),
(167, 10, 1, 'La Spezia', 'SP', 0, 1),
(168, 10, 1, 'Latina', 'LT', 0, 1),
(169, 10, 1, 'Lecce', 'LE', 0, 1),
(170, 10, 1, 'Lecco', 'LC', 0, 1),
(171, 10, 1, 'Livorno', 'LI', 0, 1),
(172, 10, 1, 'Lodi', 'LO', 0, 1),
(173, 10, 1, 'Lucca', 'LU', 0, 1),
(174, 10, 1, 'Macerata', 'MC', 0, 1),
(175, 10, 1, 'Mantova', 'MN', 0, 1),
(176, 10, 1, 'Massa', 'MS', 0, 1),
(177, 10, 1, 'Matera', 'MT', 0, 1),
(178, 10, 1, 'Medio Campidano', 'VS', 0, 1),
(179, 10, 1, 'Messina', 'ME', 0, 1),
(180, 10, 1, 'Milano', 'MI', 0, 1),
(181, 10, 1, 'Modena', 'MO', 0, 1),
(182, 10, 1, 'Monza e della Brianza', 'MB', 0, 1),
(183, 10, 1, 'Napoli', 'NA', 0, 1),
(184, 10, 1, 'Novara', 'NO', 0, 1),
(185, 10, 1, 'Nuoro', 'NU', 0, 1),
(186, 10, 1, 'Ogliastra', 'OG', 0, 1),
(187, 10, 1, 'Olbia-Tempio', 'OT', 0, 1),
(188, 10, 1, 'Oristano', 'OR', 0, 1),
(189, 10, 1, 'Padova', 'PD', 0, 1),
(190, 10, 1, 'Palermo', 'PA', 0, 1),
(191, 10, 1, 'Parma', 'PR', 0, 1),
(192, 10, 1, 'Pavia', 'PV', 0, 1),
(193, 10, 1, 'Perugia', 'PG', 0, 1),
(194, 10, 1, 'Pesaro-Urbino', 'PU', 0, 1),
(195, 10, 1, 'Pescara', 'PE', 0, 1),
(196, 10, 1, 'Piacenza', 'PC', 0, 1),
(197, 10, 1, 'Pisa', 'PI', 0, 1),
(198, 10, 1, 'Pistoia', 'PT', 0, 1),
(199, 10, 1, 'Pordenone', 'PN', 0, 1),
(200, 10, 1, 'Potenza', 'PZ', 0, 1),
(201, 10, 1, 'Prato', 'PO', 0, 1),
(202, 10, 1, 'Ragusa', 'RG', 0, 1),
(203, 10, 1, 'Ravenna', 'RA', 0, 1),
(204, 10, 1, 'Reggio Calabria', 'RC', 0, 1),
(205, 10, 1, 'Reggio Emilia', 'RE', 0, 1),
(206, 10, 1, 'Rieti', 'RI', 0, 1),
(207, 10, 1, 'Rimini', 'RN', 0, 1),
(208, 10, 1, 'Roma', 'RM', 0, 1),
(209, 10, 1, 'Rovigo', 'RO', 0, 1),
(210, 10, 1, 'Salerno', 'SA', 0, 1),
(211, 10, 1, 'Sassari', 'SS', 0, 1),
(212, 10, 1, 'Savona', 'SV', 0, 1),
(213, 10, 1, 'Siena', 'SI', 0, 1),
(214, 10, 1, 'Siracusa', 'SR', 0, 1),
(215, 10, 1, 'Sondrio', 'SO', 0, 1),
(216, 10, 1, 'Taranto', 'TA', 0, 1),
(217, 10, 1, 'Teramo', 'TE', 0, 1),
(218, 10, 1, 'Terni', 'TR', 0, 1),
(219, 10, 1, 'Torino', 'TO', 0, 1),
(220, 10, 1, 'Trapani', 'TP', 0, 1),
(221, 10, 1, 'Trento', 'TN', 0, 1),
(222, 10, 1, 'Treviso', 'TV', 0, 1),
(223, 10, 1, 'Trieste', 'TS', 0, 1),
(224, 10, 1, 'Udine', 'UD', 0, 1),
(225, 10, 1, 'Varese', 'VA', 0, 1),
(226, 10, 1, 'Venezia', 'VE', 0, 1),
(227, 10, 1, 'Verbano-Cusio-Ossola', 'VB', 0, 1),
(228, 10, 1, 'Vercelli', 'VC', 0, 1),
(229, 10, 1, 'Verona', 'VR', 0, 1),
(230, 10, 1, 'Vibo Valentia', 'VV', 0, 1),
(231, 10, 1, 'Vicenza', 'VI', 0, 1),
(232, 10, 1, 'Viterbo', 'VT', 0, 1),
(233, 111, 3, 'Aceh', 'AC', 0, 1),
(234, 111, 3, 'Bali', 'BA', 0, 1),
(235, 111, 3, 'Bangka', 'BB', 0, 1),
(236, 111, 3, 'Banten', 'BT', 0, 1),
(237, 111, 3, 'Bengkulu', 'BE', 0, 1),
(238, 111, 3, 'Central Java', 'JT', 0, 1),
(239, 111, 3, 'Central Kalimantan', 'KT', 0, 1),
(240, 111, 3, 'Central Sulawesi', 'ST', 0, 1),
(241, 111, 3, 'Coat of arms of East Java', 'JI', 0, 1),
(242, 111, 3, 'East kalimantan', 'KI', 0, 1),
(243, 111, 3, 'East Nusa Tenggara', 'NT', 0, 1),
(244, 111, 3, 'Lambang propinsi', 'GO', 0, 1),
(245, 111, 3, 'Jakarta', 'JK', 0, 1),
(246, 111, 3, 'Jambi', 'JA', 0, 1),
(247, 111, 3, 'Lampung', 'LA', 0, 1),
(248, 111, 3, 'Maluku', 'MA', 0, 1),
(249, 111, 3, 'North Maluku', 'MU', 0, 1),
(250, 111, 3, 'North Sulawesi', 'SA', 0, 1),
(251, 111, 3, 'North Sumatra', 'SU', 0, 1),
(252, 111, 3, 'Papua', 'PA', 0, 1),
(253, 111, 3, 'Riau', 'RI', 0, 1),
(254, 111, 3, 'Lambang Riau', 'KR', 0, 1),
(255, 111, 3, 'Southeast Sulawesi', 'SG', 0, 1),
(256, 111, 3, 'South Kalimantan', 'KS', 0, 1),
(257, 111, 3, 'South Sulawesi', 'SN', 0, 1),
(258, 111, 3, 'South Sumatra', 'SS', 0, 1),
(259, 111, 3, 'West Java', 'JB', 0, 1),
(260, 111, 3, 'West Kalimantan', 'KB', 0, 1),
(261, 111, 3, 'West Nusa Tenggara', 'NB', 0, 1),
(262, 111, 3, 'Lambang Provinsi Papua Barat', 'PB', 0, 1),
(263, 111, 3, 'West Sulawesi', 'SR', 0, 1),
(264, 111, 3, 'West Sumatra', 'SB', 0, 1),
(265, 111, 3, 'Yogyakarta', 'YO', 0, 1),
(266, 11, 3, 'Aichi', '23', 0, 1),
(267, 11, 3, 'Akita', '05', 0, 1),
(268, 11, 3, 'Aomori', '02', 0, 1),
(269, 11, 3, 'Chiba', '12', 0, 1),
(270, 11, 3, 'Ehime', '38', 0, 1),
(271, 11, 3, 'Fukui', '18', 0, 1),
(272, 11, 3, 'Fukuoka', '40', 0, 1),
(273, 11, 3, 'Fukushima', '07', 0, 1),
(274, 11, 3, 'Gifu', '21', 0, 1),
(275, 11, 3, 'Gunma', '10', 0, 1),
(276, 11, 3, 'Hiroshima', '34', 0, 1),
(277, 11, 3, 'Hokkaido', '01', 0, 1),
(278, 11, 3, 'Hyogo', '28', 0, 1),
(279, 11, 3, 'Ibaraki', '08', 0, 1),
(280, 11, 3, 'Ishikawa', '17', 0, 1),
(281, 11, 3, 'Iwate', '03', 0, 1),
(282, 11, 3, 'Kagawa', '37', 0, 1),
(283, 11, 3, 'Kagoshima', '46', 0, 1),
(284, 11, 3, 'Kanagawa', '14', 0, 1),
(285, 11, 3, 'Kochi', '39', 0, 1),
(286, 11, 3, 'Kumamoto', '43', 0, 1),
(287, 11, 3, 'Kyoto', '26', 0, 1),
(288, 11, 3, 'Mie', '24', 0, 1),
(289, 11, 3, 'Miyagi', '04', 0, 1),
(290, 11, 3, 'Miyazaki', '45', 0, 1),
(291, 11, 3, 'Nagano', '20', 0, 1),
(292, 11, 3, 'Nagasaki', '42', 0, 1),
(293, 11, 3, 'Nara', '29', 0, 1),
(294, 11, 3, 'Niigata', '15', 0, 1),
(295, 11, 3, 'Oita', '44', 0, 1),
(296, 11, 3, 'Okayama', '33', 0, 1),
(297, 11, 3, 'Okinawa', '47', 0, 1),
(298, 11, 3, 'Osaka', '27', 0, 1),
(299, 11, 3, 'Saga', '41', 0, 1),
(300, 11, 3, 'Saitama', '11', 0, 1),
(301, 11, 3, 'Shiga', '25', 0, 1),
(302, 11, 3, 'Shimane', '32', 0, 1),
(303, 11, 3, 'Shizuoka', '22', 0, 1),
(304, 11, 3, 'Tochigi', '09', 0, 1),
(305, 11, 3, 'Tokushima', '36', 0, 1),
(306, 11, 3, 'Tokyo', '13', 0, 1),
(307, 11, 3, 'Tottori', '31', 0, 1),
(308, 11, 3, 'Toyama', '16', 0, 1),
(309, 11, 3, 'Wakayama', '30', 0, 1),
(310, 11, 3, 'Yamagata', '06', 0, 1),
(311, 11, 3, 'Yamaguchi', '35', 0, 1),
(312, 11, 3, 'Yamanashi', '19', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_stock`
--

CREATE TABLE `qlo_stock` (
  `id_stock` int(11) UNSIGNED NOT NULL,
  `id_warehouse` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `id_product_attribute` int(11) UNSIGNED NOT NULL,
  `reference` varchar(32) NOT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `physical_quantity` int(11) UNSIGNED NOT NULL,
  `usable_quantity` int(11) UNSIGNED NOT NULL,
  `price_te` decimal(20,6) DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_stock_available`
--

CREATE TABLE `qlo_stock_available` (
  `id_stock_available` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `id_product_attribute` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL,
  `id_shop_group` int(11) UNSIGNED NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT 0,
  `depends_on_stock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `out_of_stock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_stock_available`
--

INSERT INTO `qlo_stock_available` (`id_stock_available`, `id_product`, `id_product_attribute`, `id_shop`, `id_shop_group`, `quantity`, `depends_on_stock`, `out_of_stock`) VALUES
(1, 1, 0, 1, 0, 999999999, 0, 1),
(2, 2, 0, 1, 0, 999999999, 0, 1),
(3, 3, 0, 1, 0, 999999999, 0, 1),
(4, 4, 0, 1, 0, 999999999, 0, 1),
(5, 5, 0, 1, 0, 999999999, 0, 1),
(6, 6, 0, 1, 0, 999999999, 0, 1),
(7, 7, 0, 1, 0, 999999999, 0, 1),
(8, 8, 0, 1, 0, 999999999, 0, 1),
(9, 9, 0, 1, 0, 999999999, 0, 1),
(10, 10, 0, 1, 0, 999999999, 0, 1),
(11, 11, 0, 1, 0, 999999999, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_stock_mvt`
--

CREATE TABLE `qlo_stock_mvt` (
  `id_stock_mvt` bigint(20) UNSIGNED NOT NULL,
  `id_stock` int(11) UNSIGNED NOT NULL,
  `id_order` int(11) UNSIGNED DEFAULT NULL,
  `id_supply_order` int(11) UNSIGNED DEFAULT NULL,
  `id_stock_mvt_reason` int(11) UNSIGNED NOT NULL,
  `id_employee` int(11) UNSIGNED NOT NULL,
  `employee_lastname` varchar(32) DEFAULT '',
  `employee_firstname` varchar(32) DEFAULT '',
  `physical_quantity` int(11) UNSIGNED NOT NULL,
  `date_add` datetime NOT NULL,
  `sign` tinyint(1) NOT NULL DEFAULT 1,
  `price_te` decimal(20,6) DEFAULT 0.000000,
  `last_wa` decimal(20,6) DEFAULT 0.000000,
  `current_wa` decimal(20,6) DEFAULT 0.000000,
  `referer` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_stock_mvt_reason`
--

CREATE TABLE `qlo_stock_mvt_reason` (
  `id_stock_mvt_reason` int(11) UNSIGNED NOT NULL,
  `sign` tinyint(1) NOT NULL DEFAULT 1,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_stock_mvt_reason`
--

INSERT INTO `qlo_stock_mvt_reason` (`id_stock_mvt_reason`, `sign`, `date_add`, `date_upd`, `deleted`) VALUES
(1, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0),
(2, -1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0),
(3, -1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0),
(4, -1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0),
(5, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0),
(6, -1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0),
(7, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0),
(8, 1, '2025-08-07 02:32:16', '2025-08-07 02:32:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_stock_mvt_reason_lang`
--

CREATE TABLE `qlo_stock_mvt_reason_lang` (
  `id_stock_mvt_reason` int(11) UNSIGNED NOT NULL,
  `id_lang` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_stock_mvt_reason_lang`
--

INSERT INTO `qlo_stock_mvt_reason_lang` (`id_stock_mvt_reason`, `id_lang`, `name`) VALUES
(1, 1, 'Increase'),
(2, 1, 'Decrease'),
(3, 1, 'Customer Order'),
(4, 1, 'Regulation following an inventory of stock'),
(5, 1, 'Regulation following an inventory of stock'),
(6, 1, 'Transfer to another warehouse'),
(7, 1, 'Transfer from another warehouse'),
(8, 1, 'Supply Order');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_store`
--

CREATE TABLE `qlo_store` (
  `id_store` int(10) UNSIGNED NOT NULL,
  `id_country` int(10) UNSIGNED NOT NULL,
  `id_state` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `postcode` varchar(12) NOT NULL,
  `latitude` decimal(13,8) DEFAULT NULL,
  `longitude` decimal(13,8) DEFAULT NULL,
  `hours` varchar(254) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_store_shop`
--

CREATE TABLE `qlo_store_shop` (
  `id_store` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_supplier`
--

CREATE TABLE `qlo_supplier` (
  `id_supplier` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_supplier_lang`
--

CREATE TABLE `qlo_supplier_lang` (
  `id_supplier` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_supplier_shop`
--

CREATE TABLE `qlo_supplier_shop` (
  `id_supplier` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_supply_order`
--

CREATE TABLE `qlo_supply_order` (
  `id_supply_order` int(11) UNSIGNED NOT NULL,
  `id_supplier` int(11) UNSIGNED NOT NULL,
  `supplier_name` varchar(64) NOT NULL,
  `id_lang` int(11) UNSIGNED NOT NULL,
  `id_warehouse` int(11) UNSIGNED NOT NULL,
  `id_supply_order_state` int(11) UNSIGNED NOT NULL,
  `id_currency` int(11) UNSIGNED NOT NULL,
  `id_ref_currency` int(11) UNSIGNED NOT NULL,
  `reference` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `date_delivery_expected` datetime DEFAULT NULL,
  `total_te` decimal(20,6) DEFAULT 0.000000,
  `total_with_discount_te` decimal(20,6) DEFAULT 0.000000,
  `total_tax` decimal(20,6) DEFAULT 0.000000,
  `total_ti` decimal(20,6) DEFAULT 0.000000,
  `discount_rate` decimal(20,6) DEFAULT 0.000000,
  `discount_value_te` decimal(20,6) DEFAULT 0.000000,
  `is_template` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_supply_order_detail`
--

CREATE TABLE `qlo_supply_order_detail` (
  `id_supply_order_detail` int(11) UNSIGNED NOT NULL,
  `id_supply_order` int(11) UNSIGNED NOT NULL,
  `id_currency` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `id_product_attribute` int(11) UNSIGNED NOT NULL,
  `reference` varchar(32) NOT NULL,
  `supplier_reference` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `exchange_rate` decimal(20,6) DEFAULT 0.000000,
  `unit_price_te` decimal(20,6) DEFAULT 0.000000,
  `quantity_expected` int(11) UNSIGNED NOT NULL,
  `quantity_received` int(11) UNSIGNED NOT NULL,
  `price_te` decimal(20,6) DEFAULT 0.000000,
  `discount_rate` decimal(20,6) DEFAULT 0.000000,
  `discount_value_te` decimal(20,6) DEFAULT 0.000000,
  `price_with_discount_te` decimal(20,6) DEFAULT 0.000000,
  `tax_rate` decimal(20,6) DEFAULT 0.000000,
  `tax_value` decimal(20,6) DEFAULT 0.000000,
  `price_ti` decimal(20,6) DEFAULT 0.000000,
  `tax_value_with_order_discount` decimal(20,6) DEFAULT 0.000000,
  `price_with_order_discount_te` decimal(20,6) DEFAULT 0.000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_supply_order_history`
--

CREATE TABLE `qlo_supply_order_history` (
  `id_supply_order_history` int(11) UNSIGNED NOT NULL,
  `id_supply_order` int(11) UNSIGNED NOT NULL,
  `id_employee` int(11) UNSIGNED NOT NULL,
  `employee_lastname` varchar(32) DEFAULT '',
  `employee_firstname` varchar(32) DEFAULT '',
  `id_state` int(11) UNSIGNED NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_supply_order_receipt_history`
--

CREATE TABLE `qlo_supply_order_receipt_history` (
  `id_supply_order_receipt_history` int(11) UNSIGNED NOT NULL,
  `id_supply_order_detail` int(11) UNSIGNED NOT NULL,
  `id_employee` int(11) UNSIGNED NOT NULL,
  `employee_lastname` varchar(32) DEFAULT '',
  `employee_firstname` varchar(32) DEFAULT '',
  `id_supply_order_state` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) UNSIGNED NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_supply_order_state`
--

CREATE TABLE `qlo_supply_order_state` (
  `id_supply_order_state` int(11) UNSIGNED NOT NULL,
  `delivery_note` tinyint(1) NOT NULL DEFAULT 0,
  `editable` tinyint(1) NOT NULL DEFAULT 0,
  `receipt_state` tinyint(1) NOT NULL DEFAULT 0,
  `pending_receipt` tinyint(1) NOT NULL DEFAULT 0,
  `enclosed` tinyint(1) NOT NULL DEFAULT 0,
  `color` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_supply_order_state`
--

INSERT INTO `qlo_supply_order_state` (`id_supply_order_state`, `delivery_note`, `editable`, `receipt_state`, `pending_receipt`, `enclosed`, `color`) VALUES
(1, 0, 1, 0, 0, 0, '#faab00'),
(2, 1, 0, 0, 0, 0, '#273cff'),
(3, 0, 0, 0, 1, 0, '#ff37f5'),
(4, 0, 0, 1, 1, 0, '#ff3e33'),
(5, 0, 0, 1, 0, 1, '#00d60c'),
(6, 0, 0, 0, 0, 1, '#666666');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_supply_order_state_lang`
--

CREATE TABLE `qlo_supply_order_state_lang` (
  `id_supply_order_state` int(11) UNSIGNED NOT NULL,
  `id_lang` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_supply_order_state_lang`
--

INSERT INTO `qlo_supply_order_state_lang` (`id_supply_order_state`, `id_lang`, `name`) VALUES
(1, 1, '1 - Creation in progress'),
(2, 1, '2 - Order validated'),
(3, 1, '3 - Pending receipt'),
(4, 1, '4 - Order received in part'),
(5, 1, '5 - Order received completely'),
(6, 1, '6 - Order canceled');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_tab`
--

CREATE TABLE `qlo_tab` (
  `id_tab` int(10) UNSIGNED NOT NULL,
  `id_parent` int(11) NOT NULL,
  `class_name` varchar(64) NOT NULL,
  `module` varchar(64) DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `hide_host_mode` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_tab`
--

INSERT INTO `qlo_tab` (`id_tab`, `id_parent`, `class_name`, `module`, `position`, `active`, `hide_host_mode`) VALUES
(1, 0, 'AdminDashboard', NULL, 0, 1, 0),
(2, -1, 'AdminCms', NULL, 0, 1, 0),
(3, -1, 'AdminCmsCategories', NULL, 1, 1, 0),
(4, -1, 'AdminSearch', NULL, 2, 1, 0),
(5, -1, 'AdminLogin', NULL, 3, 1, 0),
(6, -1, 'AdminShop', NULL, 4, 1, 0),
(7, -1, 'AdminShopUrl', NULL, 5, 1, 0),
(8, 0, 'AdminCatalog', NULL, 1, 1, 0),
(9, 0, 'AdminParentOrders', NULL, 2, 1, 0),
(10, 0, 'AdminParentCustomer', NULL, 3, 1, 0),
(11, 0, 'AdminPriceRule', NULL, 4, 1, 0),
(12, 0, 'AdminParentModules', NULL, 7, 1, 0),
(13, 0, 'AdminParentLocalization', NULL, 8, 1, 0),
(14, 0, 'AdminParentPreferences', NULL, 9, 1, 0),
(15, 0, 'AdminTools', NULL, 10, 1, 0),
(16, 0, 'AdminAdmin', NULL, 11, 1, 0),
(17, 0, 'AdminStock', NULL, 12, 1, 0),
(18, 8, 'AdminProducts', NULL, 0, 1, 0),
(19, 8, 'AdminNormalProducts', NULL, 1, 1, 0),
(20, 8, 'AdminCategories', NULL, 2, 1, 0),
(21, 8, 'AdminFeatures', NULL, 3, 1, 0),
(22, 9, 'AdminOrders', NULL, 0, 1, 0),
(23, 9, 'AdminInvoices', NULL, 1, 1, 0),
(24, 9, 'AdminSlip', NULL, 2, 1, 0),
(25, 9, 'AdminStatuses', NULL, 3, 1, 0),
(26, 9, 'AdminOrderMessage', NULL, 4, 1, 0),
(27, 10, 'AdminCustomers', NULL, 0, 1, 0),
(28, 10, 'AdminAddresses', NULL, 1, 1, 0),
(29, 10, 'AdminGroups', NULL, 2, 1, 0),
(30, 10, 'AdminCarts', NULL, 3, 1, 0),
(31, 10, 'AdminCustomerThreads', NULL, 4, 1, 0),
(32, 10, 'AdminContacts', NULL, 5, 1, 0),
(33, 10, 'AdminGenders', NULL, 6, 1, 0),
(34, 10, 'AdminOutstanding', NULL, 7, 0, 0),
(35, 11, 'AdminCartRules', NULL, 0, 1, 0),
(36, 11, 'AdminSpecificPriceRule', NULL, 1, 1, 0),
(37, 13, 'AdminLocalization', NULL, 0, 1, 0),
(38, 13, 'AdminLanguages', NULL, 1, 1, 0),
(39, 13, 'AdminZones', NULL, 2, 1, 0),
(40, 13, 'AdminCountries', NULL, 3, 1, 0),
(41, 13, 'AdminStates', NULL, 4, 1, 0),
(42, 13, 'AdminCurrencies', NULL, 5, 1, 0),
(43, 13, 'AdminTaxes', NULL, 6, 1, 0),
(44, 13, 'AdminTaxRulesGroup', NULL, 7, 1, 0),
(45, 13, 'AdminTranslations', NULL, 8, 1, 0),
(46, 12, 'AdminModules', NULL, 0, 1, 0),
(47, 12, 'AdminModulesCatalog', NULL, 1, 1, 0),
(48, 12, 'AdminModulesPositions', NULL, 2, 1, 0),
(49, 12, 'AdminPayment', NULL, 3, 1, 0),
(50, 14, 'AdminPreferences', NULL, 0, 1, 0),
(51, 14, 'AdminOrderPreferences', NULL, 1, 1, 0),
(52, 14, 'AdminPPreferences', NULL, 2, 1, 0),
(53, 14, 'AdminCustomerPreferences', NULL, 3, 1, 0),
(54, 14, 'AdminThemes', NULL, 4, 1, 0),
(55, 14, 'AdminMeta', NULL, 5, 1, 0),
(56, 14, 'AdminCmsContent', NULL, 6, 1, 0),
(57, 14, 'AdminImages', NULL, 7, 1, 0),
(58, 14, 'AdminSearchConf', NULL, 8, 1, 0),
(59, 14, 'AdminMaintenance', NULL, 9, 1, 0),
(60, 14, 'AdminGeolocation', NULL, 10, 1, 0),
(61, 15, 'AdminInformation', NULL, 0, 1, 0),
(62, 15, 'AdminPerformance', NULL, 1, 1, 0),
(63, 15, 'AdminEmails', NULL, 2, 1, 0),
(64, 15, 'AdminShopGroup', NULL, 3, 0, 0),
(65, 15, 'AdminImport', NULL, 4, 1, 0),
(66, 15, 'AdminBackup', NULL, 5, 1, 0),
(67, 15, 'AdminRequestSql', NULL, 6, 1, 0),
(68, 15, 'AdminLogs', NULL, 7, 1, 0),
(69, 15, 'AdminWebservice', NULL, 8, 1, 0),
(70, 16, 'AdminAdminPreferences', NULL, 0, 1, 0),
(71, 16, 'AdminQuickAccesses', NULL, 1, 1, 0),
(72, 16, 'AdminEmployees', NULL, 2, 1, 0),
(73, 16, 'AdminProfiles', NULL, 3, 1, 0),
(74, 16, 'AdminAccess', NULL, 4, 1, 0),
(75, 16, 'AdminTabs', NULL, 5, 1, 0),
(76, 0, 'AdminStats', NULL, 13, 1, 0),
(77, 17, 'AdminWarehouses', NULL, 0, 1, 0),
(78, 17, 'AdminStockManagement', NULL, 1, 1, 0),
(79, 17, 'AdminStockMvt', NULL, 2, 1, 0),
(80, 17, 'AdminStockInstantState', NULL, 3, 1, 0),
(81, 17, 'AdminStockCover', NULL, 4, 1, 0),
(82, 17, 'AdminStockConfiguration', NULL, 5, 1, 0),
(83, 0, 'AdminHotelReservationSystemManagement', 'hotelreservationsystem', 5, 1, 0),
(84, 83, 'AdminAddHotel', 'hotelreservationsystem', 1, 1, 0),
(85, 83, 'AdminHotelRoomsBooking', 'hotelreservationsystem', 2, 1, 0),
(86, 83, 'AdminHotelFeatures', 'hotelreservationsystem', 3, 1, 0),
(87, 83, 'AdminOrderRefundRules', 'hotelreservationsystem', 4, 1, 0),
(88, 83, 'AdminOrderRefundRequests', 'hotelreservationsystem', 5, 1, 0),
(89, 83, 'AdminHotelConfigurationSetting', 'hotelreservationsystem', 6, 1, 0),
(90, 8, 'AdminHotelBedTypes', 'hotelreservationsystem', 4, 1, 0),
(91, 89, 'AdminHotelGeneralSettings', 'hotelreservationsystem', 1, 1, 0),
(92, 89, 'AdminHotelFeaturePricesSettings', 'hotelreservationsystem', 2, 1, 0),
(93, 89, 'AdminRoomTypeGlobalDemand', 'hotelreservationsystem', 3, 1, 0),
(94, -1, 'AdminBookingDocument', 'hotelreservationsystem', 6, 1, 0),
(95, -1, 'AdminParentNewsletter', 'blocknewsletter', 7, 1, 0),
(96, 95, 'AdminNewsletter', 'blocknewsletter', 1, 1, 0),
(97, -1, 'AdminAboutHotelBlockSetting', 'wkabouthotelblock', 8, 1, 0),
(98, -1, 'AdminFeaturesModuleSetting', 'wkhotelfeaturesblock', 9, 1, 0),
(99, -1, 'AdminHotelRoomModuleSetting', 'wkhotelroom', 10, 1, 0),
(100, -1, 'AdminTestimonialsModuleSetting', 'wktestimonialblock', 11, 1, 0),
(101, -1, 'AdminParentHotelReview', 'qlohotelreview', 12, 1, 0),
(102, 101, 'AdminHotelReviewCategory', 'qlohotelreview', 1, 1, 0),
(103, 101, 'AdminHotelReviewHotelReview', 'qlohotelreview', 2, 1, 0),
(104, -1, 'AdminFooterPaymentBlockSetting', 'wkfooterpaymentblock', 13, 1, 0),
(105, -1, 'AdminCustomNavigationLinkSetting', 'blocknavigationmenu', 14, 1, 0),
(106, -1, 'AdminDashgoals', 'dashgoals', 15, 1, 0),
(107, 0, 'AdminQloappsChannelManagerConnector', 'qlochannelmanagerconnector', 6, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_tab_lang`
--

CREATE TABLE `qlo_tab_lang` (
  `id_tab` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_tab_lang`
--

INSERT INTO `qlo_tab_lang` (`id_tab`, `id_lang`, `name`) VALUES
(1, 1, 'Dashboard'),
(2, 1, 'CMS Pages'),
(3, 1, 'CMS Categories'),
(4, 1, 'Search'),
(5, 1, 'Login'),
(6, 1, 'Shops'),
(7, 1, 'Shop URLs'),
(8, 1, 'Catalog'),
(9, 1, 'Orders'),
(10, 1, 'Customers'),
(11, 1, 'Manage Discounts'),
(12, 1, 'Modules and Services'),
(13, 1, 'Localization'),
(14, 1, 'Preferences'),
(15, 1, 'Advanced Parameters'),
(16, 1, 'Administration'),
(17, 1, 'Stock'),
(18, 1, 'Manage Room Types'),
(19, 1, 'Manage Service Products'),
(20, 1, 'Categories'),
(21, 1, 'Features'),
(22, 1, 'Orders'),
(23, 1, 'Invoices'),
(24, 1, 'Credit Slips'),
(25, 1, 'Statuses'),
(26, 1, 'Order Messages'),
(27, 1, 'Customers'),
(28, 1, 'Addresses'),
(29, 1, 'Groups'),
(30, 1, 'Booking Carts'),
(31, 1, 'Customer Service'),
(32, 1, 'Contacts'),
(33, 1, 'Titles'),
(34, 1, 'Outstanding'),
(35, 1, 'Cart Rules'),
(36, 1, 'Catalog Price Rules'),
(37, 1, 'Localization'),
(38, 1, 'Languages'),
(39, 1, 'Zones'),
(40, 1, 'Countries'),
(41, 1, 'States'),
(42, 1, 'Currencies'),
(43, 1, 'Taxes'),
(44, 1, 'Tax Rules'),
(45, 1, 'Translations'),
(46, 1, 'Manage Modules'),
(47, 1, 'Modules Catalog'),
(48, 1, 'Positions'),
(49, 1, 'Payment'),
(50, 1, 'General'),
(51, 1, 'Orders'),
(52, 1, 'Room Types'),
(53, 1, 'Customers'),
(54, 1, 'Themes'),
(55, 1, 'SEO & URLs'),
(56, 1, 'CMS'),
(57, 1, 'Images'),
(58, 1, 'Search'),
(59, 1, 'Maintenance'),
(60, 1, 'Geolocation'),
(61, 1, 'Configuration Information'),
(62, 1, 'Performance'),
(63, 1, 'E-mail'),
(64, 1, 'Multistore'),
(65, 1, 'CSV Import'),
(66, 1, 'DB Backup'),
(67, 1, 'SQL Manager'),
(68, 1, 'Logs'),
(69, 1, 'Webservice'),
(70, 1, 'Preferences'),
(71, 1, 'Quick Access'),
(72, 1, 'Employees'),
(73, 1, 'Profiles'),
(74, 1, 'Permissions'),
(75, 1, 'Menus'),
(76, 1, 'Stats'),
(77, 1, 'Warehouses'),
(78, 1, 'Stock Management'),
(79, 1, 'Stock Movement'),
(80, 1, 'Instant Stock Status'),
(81, 1, 'Stock Coverage'),
(82, 1, 'Configuration'),
(83, 1, 'Hotel Reservation System'),
(84, 1, 'Manage Hotel'),
(85, 1, 'Book Now'),
(86, 1, 'Manage Hotel Features'),
(87, 1, 'Manage Order Refund Rules'),
(88, 1, 'Manage Order Refund Requests'),
(89, 1, 'General Settings'),
(90, 1, 'Bed Types'),
(91, 1, 'Hotel General Configuration'),
(92, 1, 'Advanced Price Rules'),
(93, 1, 'Additional Demand Configuration'),
(94, 1, 'Booking Documents'),
(95, 1, 'Newsletter'),
(96, 1, 'Configuration'),
(97, 1, 'Hotel Description Configuration'),
(98, 1, 'Hotel Amenities Configurations'),
(99, 1, 'Manage Hotel Rooms Display'),
(100, 1, 'Testimonial configuration'),
(101, 1, 'Hotel Reviews'),
(102, 1, 'Configuration'),
(103, 1, 'Reviews'),
(104, 1, 'Manage Footer Payment Block'),
(105, 1, 'Manage Custom Navigation Links'),
(106, 1, 'Dashgoals'),
(107, 1, 'Channel Manager');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_tab_module_preference`
--

CREATE TABLE `qlo_tab_module_preference` (
  `id_tab_module_preference` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `id_tab` int(11) NOT NULL,
  `module` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_tag`
--

CREATE TABLE `qlo_tag` (
  `id_tag` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_tag_count`
--

CREATE TABLE `qlo_tag_count` (
  `id_group` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_tag` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_lang` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `id_shop` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `counter` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_tax`
--

CREATE TABLE `qlo_tax` (
  `id_tax` int(10) UNSIGNED NOT NULL,
  `rate` decimal(10,3) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_tax`
--

INSERT INTO `qlo_tax` (`id_tax`, `rate`, `active`, `deleted`) VALUES
(1, 4.000, 1, 0),
(2, 0.000, 1, 0),
(3, 6.600, 1, 0),
(4, 6.000, 1, 0),
(5, 8.250, 1, 0),
(6, 2.900, 1, 0),
(7, 0.000, 1, 0),
(8, 0.000, 1, 0),
(9, 6.000, 1, 0),
(10, 4.000, 1, 0),
(11, 4.000, 1, 0),
(12, 6.000, 1, 0),
(13, 6.250, 1, 0),
(14, 7.000, 1, 0),
(15, 6.000, 1, 0),
(16, 5.300, 1, 0),
(17, 6.000, 1, 0),
(18, 4.000, 1, 0),
(19, 5.000, 1, 0),
(20, 6.000, 1, 0),
(21, 6.250, 1, 0),
(22, 6.000, 1, 0),
(23, 6.875, 1, 0),
(24, 7.000, 1, 0),
(25, 4.225, 1, 0),
(26, 0.000, 1, 0),
(27, 5.500, 1, 0),
(28, 6.850, 1, 0),
(29, 0.000, 1, 0),
(30, 7.000, 1, 0),
(31, 5.125, 1, 0),
(32, 4.000, 1, 0),
(33, 5.500, 1, 0),
(34, 5.000, 1, 0),
(35, 5.500, 1, 0),
(36, 4.500, 1, 0),
(37, 0.000, 1, 0),
(38, 6.000, 1, 0),
(39, 7.000, 1, 0),
(40, 6.000, 1, 0),
(41, 4.000, 1, 0),
(42, 7.000, 1, 0),
(43, 6.250, 1, 0),
(44, 4.750, 1, 0),
(45, 6.000, 1, 0),
(46, 4.000, 1, 0),
(47, 6.500, 1, 0),
(48, 6.000, 1, 0),
(49, 5.000, 1, 0),
(50, 4.000, 1, 0),
(51, 5.500, 1, 0),
(52, 6.000, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_tax_lang`
--

CREATE TABLE `qlo_tax_lang` (
  `id_tax` int(10) UNSIGNED NOT NULL,
  `id_lang` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_tax_lang`
--

INSERT INTO `qlo_tax_lang` (`id_tax`, `id_lang`, `name`) VALUES
(1, 1, 'Sales-taxes US-AL 4%'),
(2, 1, 'Sales-taxes US-AK 0%'),
(3, 1, 'Sales-taxes US-AZ 6.6%'),
(4, 1, 'Sales-taxes US-AR 6%'),
(5, 1, 'Sales-taxes US-CA 8.25%'),
(6, 1, 'Sales-taxes US-CO 2.9%'),
(7, 1, 'Sales-taxes US-CT 0%'),
(8, 1, 'Sales-taxes US-DE 0%'),
(9, 1, 'Sales-taxes US-FL 6%'),
(10, 1, 'Sales-taxes US-GA 4%'),
(11, 1, 'Sales-taxes US-HI 4%'),
(12, 1, 'Sales-taxes US-ID 6%'),
(13, 1, 'Sales-taxes US-IL 6.25%'),
(14, 1, 'Sales-taxes US-IN 7%'),
(15, 1, 'Sales-taxes US-IA 6%'),
(16, 1, 'Sales-taxes US-KS 5.3%'),
(17, 1, 'Sales-taxes US-KY 6%'),
(18, 1, 'Sales-taxes US-LA 4%'),
(19, 1, 'Sales-taxes US-ME 5%'),
(20, 1, 'Sales-taxes US-MD 6%'),
(21, 1, 'Sales-taxes US-MA 6.25%'),
(22, 1, 'Sales-taxes US-MI 6%'),
(23, 1, 'Sales-taxes US-MN 6.875%'),
(24, 1, 'Sales-taxes US-MS 7%'),
(25, 1, 'Sales-taxes US-MO 4.225%'),
(26, 1, 'Sales-taxes US-MT 0.0%'),
(27, 1, 'Sales-taxes US-NE 5.5%'),
(28, 1, 'Sales-taxes US-NV 6.85%'),
(29, 1, 'Sales-taxes US-NH 0%'),
(30, 1, 'Sales-taxes US-NJ 7%'),
(31, 1, 'Sales-taxes US-NM 5.125%'),
(32, 1, 'Sales-taxes US-NY 4%'),
(33, 1, 'Sales-taxes US-NC 5.5%'),
(34, 1, 'Sales-taxes US-ND 5%'),
(35, 1, 'Sales-taxes US-OH 5.5%'),
(36, 1, 'Sales-taxes US-OK 4.5%'),
(37, 1, 'Sales-taxes US-OR 0%'),
(38, 1, 'Sales-taxes US-PA 6%'),
(39, 1, 'Sales-taxes US-RI 7%'),
(40, 1, 'Sales-taxes US-SC 6%'),
(41, 1, 'Sales-taxes US-SD 4%'),
(42, 1, 'Sales-taxes US-TN 7%'),
(43, 1, 'Sales-taxes US-TX 6.25%'),
(44, 1, 'Sales-taxes US-UT 4.75%'),
(45, 1, 'Sales-taxes US-VT 6%'),
(46, 1, 'Sales-taxes US-VA 4%'),
(47, 1, 'Sales-taxes US-WA 6.5%'),
(48, 1, 'Sales-taxes US-WV 6%'),
(49, 1, 'Sales-taxes US-WI 5%'),
(50, 1, 'Sales-taxes US-WY 4%'),
(51, 1, 'Sales-taxes US-PR 5.5%'),
(52, 1, 'Sales-taxes US-DC 6%');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_tax_rule`
--

CREATE TABLE `qlo_tax_rule` (
  `id_tax_rule` int(11) NOT NULL,
  `id_tax_rules_group` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `zipcode_from` varchar(12) NOT NULL,
  `zipcode_to` varchar(12) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `behavior` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_tax_rule`
--

INSERT INTO `qlo_tax_rule` (`id_tax_rule`, `id_tax_rules_group`, `id_country`, `id_state`, `zipcode_from`, `zipcode_to`, `id_tax`, `behavior`, `description`) VALUES
(1, 1, 21, 1, '0', '0', 1, 1, ''),
(2, 2, 21, 2, '0', '0', 2, 1, ''),
(3, 3, 21, 3, '0', '0', 3, 1, ''),
(4, 4, 21, 4, '0', '0', 4, 1, ''),
(5, 5, 21, 5, '0', '0', 5, 1, ''),
(6, 6, 21, 6, '0', '0', 6, 1, ''),
(7, 7, 21, 7, '0', '0', 7, 1, ''),
(8, 8, 21, 8, '0', '0', 8, 1, ''),
(9, 9, 21, 9, '0', '0', 9, 1, ''),
(10, 10, 21, 10, '0', '0', 10, 1, ''),
(11, 11, 21, 11, '0', '0', 11, 1, ''),
(12, 12, 21, 12, '0', '0', 12, 1, ''),
(13, 13, 21, 13, '0', '0', 13, 1, ''),
(14, 14, 21, 14, '0', '0', 14, 1, ''),
(15, 15, 21, 15, '0', '0', 15, 1, ''),
(16, 16, 21, 16, '0', '0', 16, 1, ''),
(17, 17, 21, 17, '0', '0', 17, 1, ''),
(18, 18, 21, 18, '0', '0', 18, 1, ''),
(19, 19, 21, 19, '0', '0', 19, 1, ''),
(20, 20, 21, 20, '0', '0', 20, 1, ''),
(21, 21, 21, 21, '0', '0', 21, 1, ''),
(22, 22, 21, 22, '0', '0', 22, 1, ''),
(23, 23, 21, 23, '0', '0', 23, 1, ''),
(24, 24, 21, 24, '0', '0', 24, 1, ''),
(25, 25, 21, 25, '0', '0', 25, 1, ''),
(26, 26, 21, 26, '0', '0', 26, 1, ''),
(27, 27, 21, 27, '0', '0', 27, 1, ''),
(28, 28, 21, 28, '0', '0', 28, 1, ''),
(29, 29, 21, 29, '0', '0', 29, 1, ''),
(30, 30, 21, 30, '0', '0', 30, 1, ''),
(31, 31, 21, 31, '0', '0', 31, 1, ''),
(32, 32, 21, 32, '0', '0', 32, 1, ''),
(33, 33, 21, 33, '0', '0', 33, 1, ''),
(34, 34, 21, 34, '0', '0', 34, 1, ''),
(35, 35, 21, 35, '0', '0', 35, 1, ''),
(36, 36, 21, 36, '0', '0', 36, 1, ''),
(37, 37, 21, 37, '0', '0', 37, 1, ''),
(38, 38, 21, 38, '0', '0', 38, 1, ''),
(39, 39, 21, 39, '0', '0', 39, 1, ''),
(40, 40, 21, 40, '0', '0', 40, 1, ''),
(41, 41, 21, 41, '0', '0', 41, 1, ''),
(42, 42, 21, 42, '0', '0', 42, 1, ''),
(43, 43, 21, 43, '0', '0', 43, 1, ''),
(44, 44, 21, 44, '0', '0', 44, 1, ''),
(45, 45, 21, 45, '0', '0', 45, 1, ''),
(46, 46, 21, 46, '0', '0', 46, 1, ''),
(47, 47, 21, 47, '0', '0', 47, 1, ''),
(48, 48, 21, 48, '0', '0', 48, 1, ''),
(49, 49, 21, 49, '0', '0', 49, 1, ''),
(50, 50, 21, 50, '0', '0', 50, 1, ''),
(51, 51, 21, 51, '0', '0', 51, 1, ''),
(52, 52, 21, 53, '0', '0', 52, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_tax_rules_group`
--

CREATE TABLE `qlo_tax_rules_group` (
  `id_tax_rules_group` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  `deleted` tinyint(1) UNSIGNED NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_tax_rules_group`
--

INSERT INTO `qlo_tax_rules_group` (`id_tax_rules_group`, `name`, `active`, `deleted`, `date_add`, `date_upd`) VALUES
(1, 'US-AL Rate (4%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(2, 'US-AK Rate (0%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(3, 'US-AZ Rate (6.6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(4, 'US-AR Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(5, 'US-CA Rate (8.25%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(6, 'US-CO Rate (2.9%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(7, 'US-CT Rate (0%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(8, 'US-DE Rate (0%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(9, 'US-FL Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(10, 'US-GA Rate (4%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(11, 'US-HI Rate (4%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(12, 'US-ID Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(13, 'US-IL Rate (6.25%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(14, 'US-IN Rate (7%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(15, 'US-IA Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(16, 'US-KS Rate (5.3%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(17, 'US-KY Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(18, 'US-LA Rate (4%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(19, 'US-ME Rate (5%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(20, 'US-MD Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(21, 'US-MA Rate (6.25%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(22, 'US-MI Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(23, 'US-MN Rate (6.875%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(24, 'US-MS Rate (7%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(25, 'US-MO Rate (4.225%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(26, 'US-MT Rate (0%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(27, 'US-NE Rate (5.5%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(28, 'US-NV Rate (6.85%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(29, 'US-NH Rate (0%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(30, 'US-NJ Rate (7%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(31, 'US-NM Rate (5.125%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(32, 'US-NY Rate (4%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(33, 'US-NC Rate (5.5%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(34, 'US-ND Rate (5%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(35, 'US-OH Rate (5.5%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(36, 'US-OK Rate (4.5%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(37, 'US-OR Rate (0%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(38, 'US-PA Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(39, 'US-RI Rate (7%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(40, 'US-SC Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(41, 'US-SD Rate (4%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(42, 'US-TN Rate (7%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(43, 'US-TX Rate (6.25%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(44, 'US-UT Rate (4.75%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(45, 'US-VT Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(46, 'US-VA Rate (4%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(47, 'US-WA Rate (6.5%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(48, 'US-WV Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(49, 'US-WI Rate (5%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(50, 'US-WY Rate (4%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(51, 'US-PR Rate (5.5%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18'),
(52, 'US-DC Rate (6%)', 1, 0, '2025-08-07 02:32:18', '2025-08-07 02:32:18');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_tax_rules_group_shop`
--

CREATE TABLE `qlo_tax_rules_group_shop` (
  `id_tax_rules_group` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_tax_rules_group_shop`
--

INSERT INTO `qlo_tax_rules_group_shop` (`id_tax_rules_group`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_theme`
--

CREATE TABLE `qlo_theme` (
  `id_theme` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `directory` varchar(64) NOT NULL,
  `responsive` tinyint(1) NOT NULL DEFAULT 0,
  `default_left_column` tinyint(1) NOT NULL DEFAULT 0,
  `default_right_column` tinyint(1) NOT NULL DEFAULT 0,
  `product_per_page` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_theme`
--

INSERT INTO `qlo_theme` (`id_theme`, `name`, `directory`, `responsive`, `default_left_column`, `default_right_column`, `product_per_page`) VALUES
(1, 'hotel-reservation-theme', 'hotel-reservation-theme', 1, 1, 0, 12);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_theme_meta`
--

CREATE TABLE `qlo_theme_meta` (
  `id_theme_meta` int(11) NOT NULL,
  `id_theme` int(11) NOT NULL,
  `id_meta` int(10) UNSIGNED NOT NULL,
  `left_column` tinyint(1) NOT NULL DEFAULT 1,
  `right_column` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_theme_meta`
--

INSERT INTO `qlo_theme_meta` (`id_theme_meta`, `id_theme`, `id_meta`, `left_column`, `right_column`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 2, 1, 0),
(3, 1, 3, 0, 0),
(4, 1, 4, 0, 0),
(5, 1, 5, 1, 0),
(6, 1, 6, 1, 0),
(7, 1, 7, 0, 0),
(8, 1, 8, 1, 0),
(9, 1, 9, 1, 0),
(10, 1, 10, 0, 0),
(11, 1, 11, 0, 0),
(12, 1, 12, 0, 0),
(13, 1, 13, 0, 0),
(14, 1, 14, 0, 0),
(15, 1, 15, 0, 0),
(16, 1, 16, 0, 0),
(17, 1, 17, 0, 0),
(18, 1, 18, 0, 0),
(19, 1, 19, 0, 0),
(20, 1, 20, 0, 0),
(21, 1, 21, 0, 0),
(22, 1, 22, 0, 0),
(23, 1, 23, 1, 0),
(24, 1, 24, 0, 0),
(25, 1, 25, 0, 0),
(26, 1, 26, 0, 0),
(27, 1, 27, 0, 0),
(28, 1, 28, 0, 0),
(29, 1, 29, 1, 0),
(30, 1, 30, 0, 0),
(31, 1, 31, 0, 0),
(32, 1, 32, 0, 0),
(33, 1, 33, 0, 0),
(34, 1, 34, 0, 0),
(35, 1, 35, 0, 0),
(36, 1, 38, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_theme_specific`
--

CREATE TABLE `qlo_theme_specific` (
  `id_theme` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL,
  `entity` int(11) UNSIGNED NOT NULL,
  `id_object` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_timezone`
--

CREATE TABLE `qlo_timezone` (
  `id_timezone` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_timezone`
--

INSERT INTO `qlo_timezone` (`id_timezone`, `name`) VALUES
(1, 'Africa/Abidjan'),
(2, 'Africa/Accra'),
(3, 'Africa/Addis_Ababa'),
(4, 'Africa/Algiers'),
(5, 'Africa/Asmara'),
(6, 'Africa/Asmera'),
(7, 'Africa/Bamako'),
(8, 'Africa/Bangui'),
(9, 'Africa/Banjul'),
(10, 'Africa/Bissau'),
(11, 'Africa/Blantyre'),
(12, 'Africa/Brazzaville'),
(13, 'Africa/Bujumbura'),
(14, 'Africa/Cairo'),
(15, 'Africa/Casablanca'),
(16, 'Africa/Ceuta'),
(17, 'Africa/Conakry'),
(18, 'Africa/Dakar'),
(19, 'Africa/Dar_es_Salaam'),
(20, 'Africa/Djibouti'),
(21, 'Africa/Douala'),
(22, 'Africa/El_Aaiun'),
(23, 'Africa/Freetown'),
(24, 'Africa/Gaborone'),
(25, 'Africa/Harare'),
(26, 'Africa/Johannesburg'),
(27, 'Africa/Kampala'),
(28, 'Africa/Khartoum'),
(29, 'Africa/Kigali'),
(30, 'Africa/Kinshasa'),
(31, 'Africa/Lagos'),
(32, 'Africa/Libreville'),
(33, 'Africa/Lome'),
(34, 'Africa/Luanda'),
(35, 'Africa/Lubumbashi'),
(36, 'Africa/Lusaka'),
(37, 'Africa/Malabo'),
(38, 'Africa/Maputo'),
(39, 'Africa/Maseru'),
(40, 'Africa/Mbabane'),
(41, 'Africa/Mogadishu'),
(42, 'Africa/Monrovia'),
(43, 'Africa/Nairobi'),
(44, 'Africa/Ndjamena'),
(45, 'Africa/Niamey'),
(46, 'Africa/Nouakchott'),
(47, 'Africa/Ouagadougou'),
(48, 'Africa/Porto-Novo'),
(49, 'Africa/Sao_Tome'),
(50, 'Africa/Timbuktu'),
(51, 'Africa/Tripoli'),
(52, 'Africa/Tunis'),
(53, 'Africa/Windhoek'),
(54, 'America/Adak'),
(55, 'America/Anchorage '),
(56, 'America/Anguilla'),
(57, 'America/Antigua'),
(58, 'America/Araguaina'),
(59, 'America/Argentina/Buenos_Aires'),
(60, 'America/Argentina/Catamarca'),
(61, 'America/Argentina/ComodRivadavia'),
(62, 'America/Argentina/Cordoba'),
(63, 'America/Argentina/Jujuy'),
(64, 'America/Argentina/La_Rioja'),
(65, 'America/Argentina/Mendoza'),
(66, 'America/Argentina/Rio_Gallegos'),
(67, 'America/Argentina/Salta'),
(68, 'America/Argentina/San_Juan'),
(69, 'America/Argentina/San_Luis'),
(70, 'America/Argentina/Tucuman'),
(71, 'America/Argentina/Ushuaia'),
(72, 'America/Aruba'),
(73, 'America/Asuncion'),
(74, 'America/Atikokan'),
(75, 'America/Atka'),
(76, 'America/Bahia'),
(77, 'America/Barbados'),
(78, 'America/Belem'),
(79, 'America/Belize'),
(80, 'America/Blanc-Sablon'),
(81, 'America/Boa_Vista'),
(82, 'America/Bogota'),
(83, 'America/Boise'),
(84, 'America/Buenos_Aires'),
(85, 'America/Cambridge_Bay'),
(86, 'America/Campo_Grande'),
(87, 'America/Cancun'),
(88, 'America/Caracas'),
(89, 'America/Catamarca'),
(90, 'America/Cayenne'),
(91, 'America/Cayman'),
(92, 'America/Chicago'),
(93, 'America/Chihuahua'),
(94, 'America/Coral_Harbour'),
(95, 'America/Cordoba'),
(96, 'America/Costa_Rica'),
(97, 'America/Cuiaba'),
(98, 'America/Curacao'),
(99, 'America/Danmarkshavn'),
(100, 'America/Dawson'),
(101, 'America/Dawson_Creek'),
(102, 'America/Denver'),
(103, 'America/Detroit'),
(104, 'America/Dominica'),
(105, 'America/Edmonton'),
(106, 'America/Eirunepe'),
(107, 'America/El_Salvador'),
(108, 'America/Ensenada'),
(109, 'America/Fort_Wayne'),
(110, 'America/Fortaleza'),
(111, 'America/Glace_Bay'),
(112, 'America/Godthab'),
(113, 'America/Goose_Bay'),
(114, 'America/Grand_Turk'),
(115, 'America/Grenada'),
(116, 'America/Guadeloupe'),
(117, 'America/Guatemala'),
(118, 'America/Guayaquil'),
(119, 'America/Guyana'),
(120, 'America/Halifax'),
(121, 'America/Havana'),
(122, 'America/Hermosillo'),
(123, 'America/Indiana/Indianapolis'),
(124, 'America/Indiana/Knox'),
(125, 'America/Indiana/Marengo'),
(126, 'America/Indiana/Petersburg'),
(127, 'America/Indiana/Tell_City'),
(128, 'America/Indiana/Vevay'),
(129, 'America/Indiana/Vincennes'),
(130, 'America/Indiana/Winamac'),
(131, 'America/Indianapolis'),
(132, 'America/Inuvik'),
(133, 'America/Iqaluit'),
(134, 'America/Jamaica'),
(135, 'America/Jujuy'),
(136, 'America/Juneau'),
(137, 'America/Kentucky/Louisville'),
(138, 'America/Kentucky/Monticello'),
(139, 'America/Knox_IN'),
(140, 'America/La_Paz'),
(141, 'America/Lima'),
(142, 'America/Los_Angeles'),
(143, 'America/Louisville'),
(144, 'America/Maceio'),
(145, 'America/Managua'),
(146, 'America/Manaus'),
(147, 'America/Marigot'),
(148, 'America/Martinique'),
(149, 'America/Mazatlan'),
(150, 'America/Mendoza'),
(151, 'America/Menominee'),
(152, 'America/Merida'),
(153, 'America/Mexico_City'),
(154, 'America/Miquelon'),
(155, 'America/Moncton'),
(156, 'America/Monterrey'),
(157, 'America/Montevideo'),
(158, 'America/Montreal'),
(159, 'America/Montserrat'),
(160, 'America/Nassau'),
(161, 'America/New_York'),
(162, 'America/Nipigon'),
(163, 'America/Nome'),
(164, 'America/Noronha'),
(165, 'America/North_Dakota/Center'),
(166, 'America/North_Dakota/New_Salem'),
(167, 'America/Panama'),
(168, 'America/Pangnirtung'),
(169, 'America/Paramaribo'),
(170, 'America/Phoenix'),
(171, 'America/Port-au-Prince'),
(172, 'America/Port_of_Spain'),
(173, 'America/Porto_Acre'),
(174, 'America/Porto_Velho'),
(175, 'America/Puerto_Rico'),
(176, 'America/Rainy_River'),
(177, 'America/Rankin_Inlet'),
(178, 'America/Recife'),
(179, 'America/Regina'),
(180, 'America/Resolute'),
(181, 'America/Rio_Branco'),
(182, 'America/Rosario'),
(183, 'America/Santarem'),
(184, 'America/Santiago'),
(185, 'America/Santo_Domingo'),
(186, 'America/Sao_Paulo'),
(187, 'America/Scoresbysund'),
(188, 'America/Shiprock'),
(189, 'America/St_Barthelemy'),
(190, 'America/St_Johns'),
(191, 'America/St_Kitts'),
(192, 'America/St_Lucia'),
(193, 'America/St_Thomas'),
(194, 'America/St_Vincent'),
(195, 'America/Swift_Current'),
(196, 'America/Tegucigalpa'),
(197, 'America/Thule'),
(198, 'America/Thunder_Bay'),
(199, 'America/Tijuana'),
(200, 'America/Toronto'),
(201, 'America/Tortola'),
(202, 'America/Vancouver'),
(203, 'America/Virgin'),
(204, 'America/Whitehorse'),
(205, 'America/Winnipeg'),
(206, 'America/Yakutat'),
(207, 'America/Yellowknife'),
(208, 'Antarctica/Casey'),
(209, 'Antarctica/Davis'),
(210, 'Antarctica/DumontDUrville'),
(211, 'Antarctica/Mawson'),
(212, 'Antarctica/McMurdo'),
(213, 'Antarctica/Palmer'),
(214, 'Antarctica/Rothera'),
(215, 'Antarctica/South_Pole'),
(216, 'Antarctica/Syowa'),
(217, 'Antarctica/Vostok'),
(218, 'Arctic/Longyearbyen'),
(219, 'Asia/Aden'),
(220, 'Asia/Almaty'),
(221, 'Asia/Amman'),
(222, 'Asia/Anadyr'),
(223, 'Asia/Aqtau'),
(224, 'Asia/Aqtobe'),
(225, 'Asia/Ashgabat'),
(226, 'Asia/Ashkhabad'),
(227, 'Asia/Baghdad'),
(228, 'Asia/Bahrain'),
(229, 'Asia/Baku'),
(230, 'Asia/Bangkok'),
(231, 'Asia/Beirut'),
(232, 'Asia/Bishkek'),
(233, 'Asia/Brunei'),
(234, 'Asia/Calcutta'),
(235, 'Asia/Choibalsan'),
(236, 'Asia/Chongqing'),
(237, 'Asia/Chungking'),
(238, 'Asia/Colombo'),
(239, 'Asia/Dacca'),
(240, 'Asia/Damascus'),
(241, 'Asia/Dhaka'),
(242, 'Asia/Dili'),
(243, 'Asia/Dubai'),
(244, 'Asia/Dushanbe'),
(245, 'Asia/Gaza'),
(246, 'Asia/Harbin'),
(247, 'Asia/Ho_Chi_Minh'),
(248, 'Asia/Hong_Kong'),
(249, 'Asia/Hovd'),
(250, 'Asia/Irkutsk'),
(251, 'Asia/Istanbul'),
(252, 'Asia/Jakarta'),
(253, 'Asia/Jayapura'),
(254, 'Asia/Jerusalem'),
(255, 'Asia/Kabul'),
(256, 'Asia/Kamchatka'),
(257, 'Asia/Karachi'),
(258, 'Asia/Kashgar'),
(259, 'Asia/Kathmandu'),
(260, 'Asia/Katmandu'),
(261, 'Asia/Kolkata'),
(262, 'Asia/Krasnoyarsk'),
(263, 'Asia/Kuala_Lumpur'),
(264, 'Asia/Kuching'),
(265, 'Asia/Kuwait'),
(266, 'Asia/Macao'),
(267, 'Asia/Macau'),
(268, 'Asia/Magadan'),
(269, 'Asia/Makassar'),
(270, 'Asia/Manila'),
(271, 'Asia/Muscat'),
(272, 'Asia/Nicosia'),
(273, 'Asia/Novosibirsk'),
(274, 'Asia/Omsk'),
(275, 'Asia/Oral'),
(276, 'Asia/Phnom_Penh'),
(277, 'Asia/Pontianak'),
(278, 'Asia/Pyongyang'),
(279, 'Asia/Qatar'),
(280, 'Asia/Qyzylorda'),
(281, 'Asia/Rangoon'),
(282, 'Asia/Riyadh'),
(283, 'Asia/Saigon'),
(284, 'Asia/Sakhalin'),
(285, 'Asia/Samarkand'),
(286, 'Asia/Seoul'),
(287, 'Asia/Shanghai'),
(288, 'Asia/Singapore'),
(289, 'Asia/Taipei'),
(290, 'Asia/Tashkent'),
(291, 'Asia/Tbilisi'),
(292, 'Asia/Tehran'),
(293, 'Asia/Tel_Aviv'),
(294, 'Asia/Thimbu'),
(295, 'Asia/Thimphu'),
(296, 'Asia/Tokyo'),
(297, 'Asia/Ujung_Pandang'),
(298, 'Asia/Ulaanbaatar'),
(299, 'Asia/Ulan_Bator'),
(300, 'Asia/Urumqi'),
(301, 'Asia/Vientiane'),
(302, 'Asia/Vladivostok'),
(303, 'Asia/Yakutsk'),
(304, 'Asia/Yekaterinburg'),
(305, 'Asia/Yerevan'),
(306, 'Atlantic/Azores'),
(307, 'Atlantic/Bermuda'),
(308, 'Atlantic/Canary'),
(309, 'Atlantic/Cape_Verde'),
(310, 'Atlantic/Faeroe'),
(311, 'Atlantic/Faroe'),
(312, 'Atlantic/Jan_Mayen'),
(313, 'Atlantic/Madeira'),
(314, 'Atlantic/Reykjavik'),
(315, 'Atlantic/South_Georgia'),
(316, 'Atlantic/St_Helena'),
(317, 'Atlantic/Stanley'),
(318, 'Australia/ACT'),
(319, 'Australia/Adelaide'),
(320, 'Australia/Brisbane'),
(321, 'Australia/Broken_Hill'),
(322, 'Australia/Canberra'),
(323, 'Australia/Currie'),
(324, 'Australia/Darwin'),
(325, 'Australia/Eucla'),
(326, 'Australia/Hobart'),
(327, 'Australia/LHI'),
(328, 'Australia/Lindeman'),
(329, 'Australia/Lord_Howe'),
(330, 'Australia/Melbourne'),
(331, 'Australia/North'),
(332, 'Australia/NSW'),
(333, 'Australia/Perth'),
(334, 'Australia/Queensland'),
(335, 'Australia/South'),
(336, 'Australia/Sydney'),
(337, 'Australia/Tasmania'),
(338, 'Australia/Victoria'),
(339, 'Australia/West'),
(340, 'Australia/Yancowinna'),
(341, 'Europe/Amsterdam'),
(342, 'Europe/Andorra'),
(343, 'Europe/Athens'),
(344, 'Europe/Belfast'),
(345, 'Europe/Belgrade'),
(346, 'Europe/Berlin'),
(347, 'Europe/Bratislava'),
(348, 'Europe/Brussels'),
(349, 'Europe/Bucharest'),
(350, 'Europe/Budapest'),
(351, 'Europe/Chisinau'),
(352, 'Europe/Copenhagen'),
(353, 'Europe/Dublin'),
(354, 'Europe/Gibraltar'),
(355, 'Europe/Guernsey'),
(356, 'Europe/Helsinki'),
(357, 'Europe/Isle_of_Man'),
(358, 'Europe/Istanbul'),
(359, 'Europe/Jersey'),
(360, 'Europe/Kaliningrad'),
(361, 'Europe/Kiev'),
(362, 'Europe/Lisbon'),
(363, 'Europe/Ljubljana'),
(364, 'Europe/London'),
(365, 'Europe/Luxembourg'),
(366, 'Europe/Madrid'),
(367, 'Europe/Malta'),
(368, 'Europe/Mariehamn'),
(369, 'Europe/Minsk'),
(370, 'Europe/Monaco'),
(371, 'Europe/Moscow'),
(372, 'Europe/Nicosia'),
(373, 'Europe/Oslo'),
(374, 'Europe/Paris'),
(375, 'Europe/Podgorica'),
(376, 'Europe/Prague'),
(377, 'Europe/Riga'),
(378, 'Europe/Rome'),
(379, 'Europe/Samara'),
(380, 'Europe/San_Marino'),
(381, 'Europe/Sarajevo'),
(382, 'Europe/Simferopol'),
(383, 'Europe/Skopje'),
(384, 'Europe/Sofia'),
(385, 'Europe/Stockholm'),
(386, 'Europe/Tallinn'),
(387, 'Europe/Tirane'),
(388, 'Europe/Tiraspol'),
(389, 'Europe/Uzhgorod'),
(390, 'Europe/Vaduz'),
(391, 'Europe/Vatican'),
(392, 'Europe/Vienna'),
(393, 'Europe/Vilnius'),
(394, 'Europe/Volgograd'),
(395, 'Europe/Warsaw'),
(396, 'Europe/Zagreb'),
(397, 'Europe/Zaporozhye'),
(398, 'Europe/Zurich'),
(399, 'Indian/Antananarivo'),
(400, 'Indian/Chagos'),
(401, 'Indian/Christmas'),
(402, 'Indian/Cocos'),
(403, 'Indian/Comoro'),
(404, 'Indian/Kerguelen'),
(405, 'Indian/Mahe'),
(406, 'Indian/Maldives'),
(407, 'Indian/Mauritius'),
(408, 'Indian/Mayotte'),
(409, 'Indian/Reunion'),
(410, 'Pacific/Apia'),
(411, 'Pacific/Auckland'),
(412, 'Pacific/Chatham'),
(413, 'Pacific/Easter'),
(414, 'Pacific/Efate'),
(415, 'Pacific/Enderbury'),
(416, 'Pacific/Fakaofo'),
(417, 'Pacific/Fiji'),
(418, 'Pacific/Funafuti'),
(419, 'Pacific/Galapagos'),
(420, 'Pacific/Gambier'),
(421, 'Pacific/Guadalcanal'),
(422, 'Pacific/Guam'),
(423, 'Pacific/Honolulu'),
(424, 'Pacific/Johnston'),
(425, 'Pacific/Kiritimati'),
(426, 'Pacific/Kosrae'),
(427, 'Pacific/Kwajalein'),
(428, 'Pacific/Majuro'),
(429, 'Pacific/Marquesas'),
(430, 'Pacific/Midway'),
(431, 'Pacific/Nauru'),
(432, 'Pacific/Niue'),
(433, 'Pacific/Norfolk'),
(434, 'Pacific/Noumea'),
(435, 'Pacific/Pago_Pago'),
(436, 'Pacific/Palau'),
(437, 'Pacific/Pitcairn'),
(438, 'Pacific/Ponape'),
(439, 'Pacific/Port_Moresby'),
(440, 'Pacific/Rarotonga'),
(441, 'Pacific/Saipan'),
(442, 'Pacific/Samoa'),
(443, 'Pacific/Tahiti'),
(444, 'Pacific/Tarawa'),
(445, 'Pacific/Tongatapu'),
(446, 'Pacific/Truk'),
(447, 'Pacific/Wake'),
(448, 'Pacific/Wallis'),
(449, 'Pacific/Yap'),
(450, 'Brazil/Acre'),
(451, 'Brazil/DeNoronha'),
(452, 'Brazil/East'),
(453, 'Brazil/West'),
(454, 'Canada/Atlantic'),
(455, 'Canada/Central'),
(456, 'Canada/East-Saskatchewan'),
(457, 'Canada/Eastern'),
(458, 'Canada/Mountain'),
(459, 'Canada/Newfoundland'),
(460, 'Canada/Pacific'),
(461, 'Canada/Saskatchewan'),
(462, 'Canada/Yukon'),
(463, 'CET'),
(464, 'Chile/Continental'),
(465, 'Chile/EasterIsland'),
(466, 'CST6CDT'),
(467, 'Cuba'),
(468, 'EET'),
(469, 'Egypt'),
(470, 'Eire'),
(471, 'EST'),
(472, 'EST5EDT'),
(473, 'Etc/GMT'),
(474, 'Etc/GMT+0'),
(475, 'Etc/GMT+1'),
(476, 'Etc/GMT+10'),
(477, 'Etc/GMT+11'),
(478, 'Etc/GMT+12'),
(479, 'Etc/GMT+2'),
(480, 'Etc/GMT+3'),
(481, 'Etc/GMT+4'),
(482, 'Etc/GMT+5'),
(483, 'Etc/GMT+6'),
(484, 'Etc/GMT+7'),
(485, 'Etc/GMT+8'),
(486, 'Etc/GMT+9'),
(487, 'Etc/GMT-0'),
(488, 'Etc/GMT-1'),
(489, 'Etc/GMT-10'),
(490, 'Etc/GMT-11'),
(491, 'Etc/GMT-12'),
(492, 'Etc/GMT-13'),
(493, 'Etc/GMT-14'),
(494, 'Etc/GMT-2'),
(495, 'Etc/GMT-3'),
(496, 'Etc/GMT-4'),
(497, 'Etc/GMT-5'),
(498, 'Etc/GMT-6'),
(499, 'Etc/GMT-7'),
(500, 'Etc/GMT-8'),
(501, 'Etc/GMT-9'),
(502, 'Etc/GMT0'),
(503, 'Etc/Greenwich'),
(504, 'Etc/UCT'),
(505, 'Etc/Universal'),
(506, 'Etc/UTC'),
(507, 'Etc/Zulu'),
(508, 'Factory'),
(509, 'GB'),
(510, 'GB-Eire'),
(511, 'GMT'),
(512, 'GMT+0'),
(513, 'GMT-0'),
(514, 'GMT0'),
(515, 'Greenwich'),
(516, 'Hongkong'),
(517, 'HST'),
(518, 'Iceland'),
(519, 'Iran'),
(520, 'Israel'),
(521, 'Jamaica'),
(522, 'Japan'),
(523, 'Kwajalein'),
(524, 'Libya'),
(525, 'MET'),
(526, 'Mexico/BajaNorte'),
(527, 'Mexico/BajaSur'),
(528, 'Mexico/General'),
(529, 'MST'),
(530, 'MST7MDT'),
(531, 'Navajo'),
(532, 'NZ'),
(533, 'NZ-CHAT'),
(534, 'Poland'),
(535, 'Portugal'),
(536, 'PRC'),
(537, 'PST8PDT'),
(538, 'ROC'),
(539, 'ROK'),
(540, 'Singapore'),
(541, 'Turkey'),
(542, 'UCT'),
(543, 'Universal'),
(544, 'US/Alaska'),
(545, 'US/Aleutian'),
(546, 'US/Arizona'),
(547, 'US/Central'),
(548, 'US/East-Indiana'),
(549, 'US/Eastern'),
(550, 'US/Hawaii'),
(551, 'US/Indiana-Starke'),
(552, 'US/Michigan'),
(553, 'US/Mountain'),
(554, 'US/Pacific'),
(555, 'US/Pacific-New'),
(556, 'US/Samoa'),
(557, 'UTC'),
(558, 'W-SU'),
(559, 'WET'),
(560, 'Zulu');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_warehouse`
--

CREATE TABLE `qlo_warehouse` (
  `id_warehouse` int(11) UNSIGNED NOT NULL,
  `id_currency` int(11) UNSIGNED NOT NULL,
  `id_address` int(11) UNSIGNED NOT NULL,
  `id_employee` int(11) UNSIGNED NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `management_type` enum('WA','FIFO','LIFO') NOT NULL DEFAULT 'WA',
  `deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_warehouse_carrier`
--

CREATE TABLE `qlo_warehouse_carrier` (
  `id_carrier` int(11) UNSIGNED NOT NULL,
  `id_warehouse` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_warehouse_product_location`
--

CREATE TABLE `qlo_warehouse_product_location` (
  `id_warehouse_product_location` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `id_product_attribute` int(11) UNSIGNED NOT NULL,
  `id_warehouse` int(11) UNSIGNED NOT NULL,
  `location` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_warehouse_shop`
--

CREATE TABLE `qlo_warehouse_shop` (
  `id_shop` int(11) UNSIGNED NOT NULL,
  `id_warehouse` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qlo_webservice_account`
--

CREATE TABLE `qlo_webservice_account` (
  `id_webservice_account` int(11) NOT NULL,
  `key` varchar(32) NOT NULL,
  `description` text DEFAULT NULL,
  `class_name` varchar(50) NOT NULL DEFAULT 'WebserviceRequest',
  `is_module` tinyint(2) NOT NULL DEFAULT 0,
  `module_name` varchar(50) DEFAULT NULL,
  `active` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_webservice_account`
--

INSERT INTO `qlo_webservice_account` (`id_webservice_account`, `key`, `description`, `class_name`, `is_module`, `module_name`, `active`) VALUES
(1, 'BPLZZ875W56IHUSI2CZF21X4UXM2SCGD', '', 'WebserviceRequest', 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_webservice_account_shop`
--

CREATE TABLE `qlo_webservice_account_shop` (
  `id_webservice_account` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_webservice_account_shop`
--

INSERT INTO `qlo_webservice_account_shop` (`id_webservice_account`, `id_shop`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_webservice_permission`
--

CREATE TABLE `qlo_webservice_permission` (
  `id_webservice_permission` int(11) NOT NULL,
  `resource` varchar(50) NOT NULL,
  `method` enum('GET','POST','PUT','DELETE','HEAD') NOT NULL,
  `id_webservice_account` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_webservice_permission`
--

INSERT INTO `qlo_webservice_permission` (`id_webservice_permission`, `resource`, `method`, `id_webservice_account`) VALUES
(1, 'addresses', 'GET', 1),
(3, 'addresses', 'POST', 1),
(2, 'addresses', 'PUT', 1),
(4, 'addresses', 'DELETE', 1),
(5, 'addresses', 'HEAD', 1),
(6, 'advance_payments', 'GET', 1),
(8, 'advance_payments', 'POST', 1),
(7, 'advance_payments', 'PUT', 1),
(9, 'advance_payments', 'DELETE', 1),
(10, 'advance_payments', 'HEAD', 1),
(16, 'bookings', 'GET', 1),
(18, 'bookings', 'POST', 1),
(17, 'bookings', 'PUT', 1),
(19, 'bookings', 'HEAD', 1),
(11, 'booking_extra_demands', 'GET', 1),
(13, 'booking_extra_demands', 'POST', 1),
(12, 'booking_extra_demands', 'PUT', 1),
(14, 'booking_extra_demands', 'DELETE', 1),
(15, 'booking_extra_demands', 'HEAD', 1),
(20, 'carriers', 'GET', 1),
(22, 'carriers', 'POST', 1),
(21, 'carriers', 'PUT', 1),
(23, 'carriers', 'DELETE', 1),
(24, 'carriers', 'HEAD', 1),
(35, 'carts', 'GET', 1),
(37, 'carts', 'POST', 1),
(36, 'carts', 'PUT', 1),
(38, 'carts', 'DELETE', 1),
(39, 'carts', 'HEAD', 1),
(25, 'cart_bookings', 'GET', 1),
(27, 'cart_bookings', 'POST', 1),
(26, 'cart_bookings', 'PUT', 1),
(28, 'cart_bookings', 'DELETE', 1),
(29, 'cart_bookings', 'HEAD', 1),
(30, 'cart_rules', 'GET', 1),
(32, 'cart_rules', 'POST', 1),
(31, 'cart_rules', 'PUT', 1),
(33, 'cart_rules', 'DELETE', 1),
(34, 'cart_rules', 'HEAD', 1),
(40, 'categories', 'GET', 1),
(42, 'categories', 'POST', 1),
(41, 'categories', 'PUT', 1),
(43, 'categories', 'DELETE', 1),
(44, 'categories', 'HEAD', 1),
(45, 'combinations', 'GET', 1),
(47, 'combinations', 'POST', 1),
(46, 'combinations', 'PUT', 1),
(48, 'combinations', 'DELETE', 1),
(49, 'combinations', 'HEAD', 1),
(50, 'configurations', 'GET', 1),
(52, 'configurations', 'POST', 1),
(51, 'configurations', 'PUT', 1),
(53, 'configurations', 'DELETE', 1),
(54, 'configurations', 'HEAD', 1),
(55, 'contacts', 'GET', 1),
(57, 'contacts', 'POST', 1),
(56, 'contacts', 'PUT', 1),
(58, 'contacts', 'DELETE', 1),
(59, 'contacts', 'HEAD', 1),
(60, 'content_management_system', 'GET', 1),
(62, 'content_management_system', 'POST', 1),
(61, 'content_management_system', 'PUT', 1),
(63, 'content_management_system', 'DELETE', 1),
(64, 'content_management_system', 'HEAD', 1),
(65, 'countries', 'GET', 1),
(67, 'countries', 'POST', 1),
(66, 'countries', 'PUT', 1),
(68, 'countries', 'DELETE', 1),
(69, 'countries', 'HEAD', 1),
(70, 'currencies', 'GET', 1),
(72, 'currencies', 'POST', 1),
(71, 'currencies', 'PUT', 1),
(73, 'currencies', 'DELETE', 1),
(74, 'currencies', 'HEAD', 1),
(85, 'customers', 'GET', 1),
(87, 'customers', 'POST', 1),
(86, 'customers', 'PUT', 1),
(88, 'customers', 'DELETE', 1),
(89, 'customers', 'HEAD', 1),
(75, 'customer_messages', 'GET', 1),
(77, 'customer_messages', 'POST', 1),
(76, 'customer_messages', 'PUT', 1),
(78, 'customer_messages', 'DELETE', 1),
(79, 'customer_messages', 'HEAD', 1),
(80, 'customer_threads', 'GET', 1),
(82, 'customer_threads', 'POST', 1),
(81, 'customer_threads', 'PUT', 1),
(83, 'customer_threads', 'DELETE', 1),
(84, 'customer_threads', 'HEAD', 1),
(90, 'customizations', 'GET', 1),
(92, 'customizations', 'POST', 1),
(91, 'customizations', 'PUT', 1),
(93, 'customizations', 'DELETE', 1),
(94, 'customizations', 'HEAD', 1),
(95, 'deliveries', 'GET', 1),
(97, 'deliveries', 'POST', 1),
(96, 'deliveries', 'PUT', 1),
(98, 'deliveries', 'DELETE', 1),
(99, 'deliveries', 'HEAD', 1),
(100, 'demand_advance_options', 'GET', 1),
(102, 'demand_advance_options', 'POST', 1),
(101, 'demand_advance_options', 'PUT', 1),
(103, 'demand_advance_options', 'DELETE', 1),
(104, 'demand_advance_options', 'HEAD', 1),
(105, 'employees', 'GET', 1),
(107, 'employees', 'POST', 1),
(106, 'employees', 'PUT', 1),
(108, 'employees', 'DELETE', 1),
(109, 'employees', 'HEAD', 1),
(110, 'extra_demands', 'GET', 1),
(112, 'extra_demands', 'POST', 1),
(111, 'extra_demands', 'PUT', 1),
(113, 'extra_demands', 'DELETE', 1),
(114, 'extra_demands', 'HEAD', 1),
(115, 'feature_prices', 'GET', 1),
(117, 'feature_prices', 'POST', 1),
(116, 'feature_prices', 'PUT', 1),
(118, 'feature_prices', 'DELETE', 1),
(119, 'feature_prices', 'HEAD', 1),
(120, 'groups', 'GET', 1),
(122, 'groups', 'POST', 1),
(121, 'groups', 'PUT', 1),
(123, 'groups', 'DELETE', 1),
(124, 'groups', 'HEAD', 1),
(125, 'guests', 'GET', 1),
(127, 'guests', 'POST', 1),
(126, 'guests', 'PUT', 1),
(128, 'guests', 'DELETE', 1),
(129, 'guests', 'HEAD', 1),
(155, 'hotels', 'GET', 1),
(157, 'hotels', 'POST', 1),
(156, 'hotels', 'PUT', 1),
(158, 'hotels', 'DELETE', 1),
(159, 'hotels', 'HEAD', 1),
(130, 'hotel_ari', 'GET', 1),
(132, 'hotel_ari', 'POST', 1),
(131, 'hotel_ari', 'PUT', 1),
(133, 'hotel_ari', 'DELETE', 1),
(134, 'hotel_ari', 'HEAD', 1),
(135, 'hotel_features', 'GET', 1),
(137, 'hotel_features', 'POST', 1),
(136, 'hotel_features', 'PUT', 1),
(138, 'hotel_features', 'DELETE', 1),
(139, 'hotel_features', 'HEAD', 1),
(140, 'hotel_refund_rules', 'GET', 1),
(142, 'hotel_refund_rules', 'POST', 1),
(141, 'hotel_refund_rules', 'PUT', 1),
(143, 'hotel_refund_rules', 'DELETE', 1),
(144, 'hotel_refund_rules', 'HEAD', 1),
(150, 'hotel_rooms', 'GET', 1),
(152, 'hotel_rooms', 'POST', 1),
(151, 'hotel_rooms', 'PUT', 1),
(153, 'hotel_rooms', 'DELETE', 1),
(154, 'hotel_rooms', 'HEAD', 1),
(145, 'hotel_room_types', 'GET', 1),
(147, 'hotel_room_types', 'POST', 1),
(146, 'hotel_room_types', 'PUT', 1),
(148, 'hotel_room_types', 'DELETE', 1),
(149, 'hotel_room_types', 'HEAD', 1),
(165, 'images', 'GET', 1),
(167, 'images', 'POST', 1),
(166, 'images', 'PUT', 1),
(168, 'images', 'DELETE', 1),
(169, 'images', 'HEAD', 1),
(160, 'image_types', 'GET', 1),
(162, 'image_types', 'POST', 1),
(161, 'image_types', 'PUT', 1),
(163, 'image_types', 'DELETE', 1),
(164, 'image_types', 'HEAD', 1),
(170, 'languages', 'GET', 1),
(172, 'languages', 'POST', 1),
(171, 'languages', 'PUT', 1),
(173, 'languages', 'DELETE', 1),
(174, 'languages', 'HEAD', 1),
(175, 'manufacturers', 'GET', 1),
(177, 'manufacturers', 'POST', 1),
(176, 'manufacturers', 'PUT', 1),
(178, 'manufacturers', 'DELETE', 1),
(179, 'manufacturers', 'HEAD', 1),
(220, 'orders', 'GET', 1),
(222, 'orders', 'POST', 1),
(221, 'orders', 'PUT', 1),
(223, 'orders', 'DELETE', 1),
(224, 'orders', 'HEAD', 1),
(180, 'order_carriers', 'GET', 1),
(182, 'order_carriers', 'POST', 1),
(181, 'order_carriers', 'PUT', 1),
(183, 'order_carriers', 'DELETE', 1),
(184, 'order_carriers', 'HEAD', 1),
(185, 'order_details', 'GET', 1),
(187, 'order_details', 'POST', 1),
(186, 'order_details', 'PUT', 1),
(188, 'order_details', 'DELETE', 1),
(189, 'order_details', 'HEAD', 1),
(190, 'order_discounts', 'GET', 1),
(192, 'order_discounts', 'POST', 1),
(191, 'order_discounts', 'PUT', 1),
(193, 'order_discounts', 'DELETE', 1),
(194, 'order_discounts', 'HEAD', 1),
(195, 'order_histories', 'GET', 1),
(197, 'order_histories', 'POST', 1),
(196, 'order_histories', 'PUT', 1),
(198, 'order_histories', 'DELETE', 1),
(199, 'order_histories', 'HEAD', 1),
(200, 'order_invoices', 'GET', 1),
(202, 'order_invoices', 'POST', 1),
(201, 'order_invoices', 'PUT', 1),
(203, 'order_invoices', 'DELETE', 1),
(204, 'order_invoices', 'HEAD', 1),
(205, 'order_payments', 'GET', 1),
(207, 'order_payments', 'POST', 1),
(206, 'order_payments', 'PUT', 1),
(208, 'order_payments', 'DELETE', 1),
(209, 'order_payments', 'HEAD', 1),
(210, 'order_slip', 'GET', 1),
(212, 'order_slip', 'POST', 1),
(211, 'order_slip', 'PUT', 1),
(213, 'order_slip', 'DELETE', 1),
(214, 'order_slip', 'HEAD', 1),
(215, 'order_states', 'GET', 1),
(217, 'order_states', 'POST', 1),
(216, 'order_states', 'PUT', 1),
(218, 'order_states', 'DELETE', 1),
(219, 'order_states', 'HEAD', 1),
(225, 'price_ranges', 'GET', 1),
(227, 'price_ranges', 'POST', 1),
(226, 'price_ranges', 'PUT', 1),
(228, 'price_ranges', 'DELETE', 1),
(229, 'price_ranges', 'HEAD', 1),
(230, 'product_customization_fields', 'GET', 1),
(232, 'product_customization_fields', 'POST', 1),
(231, 'product_customization_fields', 'PUT', 1),
(233, 'product_customization_fields', 'DELETE', 1),
(234, 'product_customization_fields', 'HEAD', 1),
(235, 'product_suppliers', 'GET', 1),
(237, 'product_suppliers', 'POST', 1),
(236, 'product_suppliers', 'PUT', 1),
(238, 'product_suppliers', 'DELETE', 1),
(239, 'product_suppliers', 'HEAD', 1),
(240, 'room_bookings', 'GET', 1),
(242, 'room_bookings', 'POST', 1),
(241, 'room_bookings', 'PUT', 1),
(243, 'room_bookings', 'DELETE', 1),
(244, 'room_bookings', 'HEAD', 1),
(265, 'room_types', 'GET', 1),
(267, 'room_types', 'POST', 1),
(266, 'room_types', 'PUT', 1),
(268, 'room_types', 'DELETE', 1),
(269, 'room_types', 'HEAD', 1),
(250, 'room_type_features', 'GET', 1),
(252, 'room_type_features', 'POST', 1),
(251, 'room_type_features', 'PUT', 1),
(253, 'room_type_features', 'DELETE', 1),
(254, 'room_type_features', 'HEAD', 1),
(245, 'room_type_feature_values', 'GET', 1),
(247, 'room_type_feature_values', 'POST', 1),
(246, 'room_type_feature_values', 'PUT', 1),
(248, 'room_type_feature_values', 'DELETE', 1),
(249, 'room_type_feature_values', 'HEAD', 1),
(260, 'room_type_options', 'GET', 1),
(262, 'room_type_options', 'POST', 1),
(261, 'room_type_options', 'PUT', 1),
(263, 'room_type_options', 'DELETE', 1),
(264, 'room_type_options', 'HEAD', 1),
(255, 'room_type_option_values', 'GET', 1),
(257, 'room_type_option_values', 'POST', 1),
(256, 'room_type_option_values', 'PUT', 1),
(258, 'room_type_option_values', 'DELETE', 1),
(259, 'room_type_option_values', 'HEAD', 1),
(270, 'search', 'GET', 1),
(271, 'search', 'HEAD', 1),
(272, 'services', 'GET', 1),
(274, 'services', 'POST', 1),
(273, 'services', 'PUT', 1),
(275, 'services', 'DELETE', 1),
(276, 'services', 'HEAD', 1),
(287, 'shops', 'GET', 1),
(289, 'shops', 'POST', 1),
(288, 'shops', 'PUT', 1),
(290, 'shops', 'DELETE', 1),
(291, 'shops', 'HEAD', 1),
(277, 'shop_groups', 'GET', 1),
(279, 'shop_groups', 'POST', 1),
(278, 'shop_groups', 'PUT', 1),
(280, 'shop_groups', 'DELETE', 1),
(281, 'shop_groups', 'HEAD', 1),
(282, 'shop_urls', 'GET', 1),
(284, 'shop_urls', 'POST', 1),
(283, 'shop_urls', 'PUT', 1),
(285, 'shop_urls', 'DELETE', 1),
(286, 'shop_urls', 'HEAD', 1),
(297, 'specific_prices', 'GET', 1),
(299, 'specific_prices', 'POST', 1),
(298, 'specific_prices', 'PUT', 1),
(300, 'specific_prices', 'DELETE', 1),
(301, 'specific_prices', 'HEAD', 1),
(292, 'specific_price_rules', 'GET', 1),
(294, 'specific_price_rules', 'POST', 1),
(293, 'specific_price_rules', 'PUT', 1),
(295, 'specific_price_rules', 'DELETE', 1),
(296, 'specific_price_rules', 'HEAD', 1),
(302, 'states', 'GET', 1),
(304, 'states', 'POST', 1),
(303, 'states', 'PUT', 1),
(305, 'states', 'DELETE', 1),
(306, 'states', 'HEAD', 1),
(317, 'stocks', 'GET', 1),
(318, 'stocks', 'HEAD', 1),
(307, 'stock_availables', 'GET', 1),
(308, 'stock_availables', 'PUT', 1),
(309, 'stock_availables', 'HEAD', 1),
(315, 'stock_movements', 'GET', 1),
(316, 'stock_movements', 'HEAD', 1),
(310, 'stock_movement_reasons', 'GET', 1),
(312, 'stock_movement_reasons', 'POST', 1),
(311, 'stock_movement_reasons', 'PUT', 1),
(313, 'stock_movement_reasons', 'DELETE', 1),
(314, 'stock_movement_reasons', 'HEAD', 1),
(319, 'stores', 'GET', 1),
(321, 'stores', 'POST', 1),
(320, 'stores', 'PUT', 1),
(322, 'stores', 'DELETE', 1),
(323, 'stores', 'HEAD', 1),
(324, 'suppliers', 'GET', 1),
(326, 'suppliers', 'POST', 1),
(325, 'suppliers', 'PUT', 1),
(327, 'suppliers', 'DELETE', 1),
(328, 'suppliers', 'HEAD', 1),
(337, 'supply_orders', 'GET', 1),
(338, 'supply_orders', 'HEAD', 1),
(329, 'supply_order_details', 'GET', 1),
(330, 'supply_order_details', 'HEAD', 1),
(331, 'supply_order_histories', 'GET', 1),
(332, 'supply_order_histories', 'HEAD', 1),
(333, 'supply_order_receipt_histories', 'GET', 1),
(334, 'supply_order_receipt_histories', 'HEAD', 1),
(335, 'supply_order_states', 'GET', 1),
(336, 'supply_order_states', 'HEAD', 1),
(339, 'tags', 'GET', 1),
(341, 'tags', 'POST', 1),
(340, 'tags', 'PUT', 1),
(342, 'tags', 'DELETE', 1),
(343, 'tags', 'HEAD', 1),
(354, 'taxes', 'GET', 1),
(356, 'taxes', 'POST', 1),
(355, 'taxes', 'PUT', 1),
(357, 'taxes', 'DELETE', 1),
(358, 'taxes', 'HEAD', 1),
(349, 'tax_rules', 'GET', 1),
(351, 'tax_rules', 'POST', 1),
(350, 'tax_rules', 'PUT', 1),
(352, 'tax_rules', 'DELETE', 1),
(353, 'tax_rules', 'HEAD', 1),
(344, 'tax_rule_groups', 'GET', 1),
(346, 'tax_rule_groups', 'POST', 1),
(345, 'tax_rule_groups', 'PUT', 1),
(347, 'tax_rule_groups', 'DELETE', 1),
(348, 'tax_rule_groups', 'HEAD', 1),
(359, 'translated_configurations', 'GET', 1),
(361, 'translated_configurations', 'POST', 1),
(360, 'translated_configurations', 'PUT', 1),
(362, 'translated_configurations', 'DELETE', 1),
(363, 'translated_configurations', 'HEAD', 1),
(366, 'warehouses', 'GET', 1),
(368, 'warehouses', 'POST', 1),
(367, 'warehouses', 'PUT', 1),
(369, 'warehouses', 'HEAD', 1),
(364, 'warehouse_product_locations', 'GET', 1),
(365, 'warehouse_product_locations', 'HEAD', 1),
(370, 'weight_ranges', 'GET', 1),
(372, 'weight_ranges', 'POST', 1),
(371, 'weight_ranges', 'PUT', 1),
(373, 'weight_ranges', 'DELETE', 1),
(374, 'weight_ranges', 'HEAD', 1),
(375, 'zones', 'GET', 1),
(377, 'zones', 'POST', 1),
(376, 'zones', 'PUT', 1),
(378, 'zones', 'DELETE', 1),
(379, 'zones', 'HEAD', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_web_browser`
--

CREATE TABLE `qlo_web_browser` (
  `id_web_browser` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_web_browser`
--

INSERT INTO `qlo_web_browser` (`id_web_browser`, `name`) VALUES
(1, 'Safari'),
(2, 'Safari iPad'),
(3, 'Firefox'),
(4, 'Opera'),
(5, 'IE 6'),
(6, 'IE 7'),
(7, 'IE 8'),
(8, 'IE 9'),
(9, 'IE 10'),
(10, 'IE 11'),
(11, 'Chrome');

-- --------------------------------------------------------

--
-- Table structure for table `qlo_zone`
--

CREATE TABLE `qlo_zone` (
  `id_zone` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_zone`
--

INSERT INTO `qlo_zone` (`id_zone`, `name`, `active`) VALUES
(1, 'Europe', 1),
(2, 'North America', 1),
(3, 'Asia', 1),
(4, 'Africa', 1),
(5, 'Oceania', 1),
(6, 'South America', 1),
(7, 'Europe (non-EU)', 1),
(8, 'Central America/Antilla', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qlo_zone_shop`
--

CREATE TABLE `qlo_zone_shop` (
  `id_zone` int(11) UNSIGNED NOT NULL,
  `id_shop` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qlo_zone_shop`
--

INSERT INTO `qlo_zone_shop` (`id_zone`, `id_shop`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_number` int(11) NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qlo_access`
--
ALTER TABLE `qlo_access`
  ADD PRIMARY KEY (`id_profile`,`id_tab`);

--
-- Indexes for table `qlo_accessory`
--
ALTER TABLE `qlo_accessory`
  ADD KEY `accessory_product` (`id_product_1`,`id_product_2`);

--
-- Indexes for table `qlo_address`
--
ALTER TABLE `qlo_address`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `address_customer` (`id_customer`),
  ADD KEY `id_country` (`id_country`),
  ADD KEY `id_state` (`id_state`),
  ADD KEY `id_manufacturer` (`id_manufacturer`),
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `id_warehouse` (`id_warehouse`);

--
-- Indexes for table `qlo_address_format`
--
ALTER TABLE `qlo_address_format`
  ADD PRIMARY KEY (`id_country`);

--
-- Indexes for table `qlo_alias`
--
ALTER TABLE `qlo_alias`
  ADD PRIMARY KEY (`id_alias`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Indexes for table `qlo_attachment`
--
ALTER TABLE `qlo_attachment`
  ADD PRIMARY KEY (`id_attachment`);

--
-- Indexes for table `qlo_attachment_lang`
--
ALTER TABLE `qlo_attachment_lang`
  ADD PRIMARY KEY (`id_attachment`,`id_lang`);

--
-- Indexes for table `qlo_attribute`
--
ALTER TABLE `qlo_attribute`
  ADD PRIMARY KEY (`id_attribute`),
  ADD KEY `attribute_group` (`id_attribute_group`);

--
-- Indexes for table `qlo_attribute_group`
--
ALTER TABLE `qlo_attribute_group`
  ADD PRIMARY KEY (`id_attribute_group`);

--
-- Indexes for table `qlo_attribute_group_lang`
--
ALTER TABLE `qlo_attribute_group_lang`
  ADD PRIMARY KEY (`id_attribute_group`,`id_lang`);

--
-- Indexes for table `qlo_attribute_group_shop`
--
ALTER TABLE `qlo_attribute_group_shop`
  ADD PRIMARY KEY (`id_attribute_group`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_attribute_impact`
--
ALTER TABLE `qlo_attribute_impact`
  ADD PRIMARY KEY (`id_attribute_impact`),
  ADD UNIQUE KEY `id_product` (`id_product`,`id_attribute`);

--
-- Indexes for table `qlo_attribute_lang`
--
ALTER TABLE `qlo_attribute_lang`
  ADD PRIMARY KEY (`id_attribute`,`id_lang`),
  ADD KEY `id_lang` (`id_lang`,`name`);

--
-- Indexes for table `qlo_attribute_shop`
--
ALTER TABLE `qlo_attribute_shop`
  ADD PRIMARY KEY (`id_attribute`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_carrier`
--
ALTER TABLE `qlo_carrier`
  ADD PRIMARY KEY (`id_carrier`),
  ADD KEY `deleted` (`deleted`,`active`),
  ADD KEY `id_tax_rules_group` (`id_tax_rules_group`),
  ADD KEY `reference` (`id_reference`,`deleted`,`active`);

--
-- Indexes for table `qlo_carrier_group`
--
ALTER TABLE `qlo_carrier_group`
  ADD PRIMARY KEY (`id_carrier`,`id_group`);

--
-- Indexes for table `qlo_carrier_lang`
--
ALTER TABLE `qlo_carrier_lang`
  ADD PRIMARY KEY (`id_lang`,`id_shop`,`id_carrier`);

--
-- Indexes for table `qlo_carrier_shop`
--
ALTER TABLE `qlo_carrier_shop`
  ADD PRIMARY KEY (`id_carrier`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_carrier_tax_rules_group_shop`
--
ALTER TABLE `qlo_carrier_tax_rules_group_shop`
  ADD PRIMARY KEY (`id_carrier`,`id_tax_rules_group`,`id_shop`);

--
-- Indexes for table `qlo_carrier_zone`
--
ALTER TABLE `qlo_carrier_zone`
  ADD PRIMARY KEY (`id_carrier`,`id_zone`);

--
-- Indexes for table `qlo_cart`
--
ALTER TABLE `qlo_cart`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `cart_customer` (`id_customer`),
  ADD KEY `id_address_delivery` (`id_address_delivery`),
  ADD KEY `id_address_invoice` (`id_address_invoice`),
  ADD KEY `id_carrier` (`id_carrier`),
  ADD KEY `id_lang` (`id_lang`),
  ADD KEY `id_currency` (`id_currency`),
  ADD KEY `id_guest` (`id_guest`),
  ADD KEY `id_shop_group` (`id_shop_group`),
  ADD KEY `id_shop_2` (`id_shop`,`date_upd`),
  ADD KEY `id_shop` (`id_shop`,`date_add`);

--
-- Indexes for table `qlo_cart_cart_rule`
--
ALTER TABLE `qlo_cart_cart_rule`
  ADD PRIMARY KEY (`id_cart`,`id_cart_rule`),
  ADD KEY `id_cart_rule` (`id_cart_rule`);

--
-- Indexes for table `qlo_cart_customer_guest`
--
ALTER TABLE `qlo_cart_customer_guest`
  ADD PRIMARY KEY (`id_customer_guest_detail`,`id_cart`);

--
-- Indexes for table `qlo_cart_product`
--
ALTER TABLE `qlo_cart_product`
  ADD PRIMARY KEY (`id_cart`,`id_product`,`id_product_attribute`,`id_address_delivery`),
  ADD KEY `id_product_attribute` (`id_product_attribute`),
  ADD KEY `id_cart_order` (`id_cart`,`date_add`,`id_product`,`id_product_attribute`);

--
-- Indexes for table `qlo_cart_rule`
--
ALTER TABLE `qlo_cart_rule`
  ADD PRIMARY KEY (`id_cart_rule`),
  ADD KEY `id_customer` (`id_customer`,`active`,`date_to`),
  ADD KEY `group_restriction` (`group_restriction`,`active`,`date_to`),
  ADD KEY `id_customer_2` (`id_customer`,`active`,`highlight`,`date_to`),
  ADD KEY `group_restriction_2` (`group_restriction`,`active`,`highlight`,`date_to`);

--
-- Indexes for table `qlo_cart_rule_carrier`
--
ALTER TABLE `qlo_cart_rule_carrier`
  ADD PRIMARY KEY (`id_cart_rule`,`id_carrier`);

--
-- Indexes for table `qlo_cart_rule_combination`
--
ALTER TABLE `qlo_cart_rule_combination`
  ADD PRIMARY KEY (`id_cart_rule_1`,`id_cart_rule_2`),
  ADD KEY `id_cart_rule_1` (`id_cart_rule_1`),
  ADD KEY `id_cart_rule_2` (`id_cart_rule_2`);

--
-- Indexes for table `qlo_cart_rule_country`
--
ALTER TABLE `qlo_cart_rule_country`
  ADD PRIMARY KEY (`id_cart_rule`,`id_country`);

--
-- Indexes for table `qlo_cart_rule_group`
--
ALTER TABLE `qlo_cart_rule_group`
  ADD PRIMARY KEY (`id_cart_rule`,`id_group`);

--
-- Indexes for table `qlo_cart_rule_lang`
--
ALTER TABLE `qlo_cart_rule_lang`
  ADD PRIMARY KEY (`id_cart_rule`,`id_lang`);

--
-- Indexes for table `qlo_cart_rule_product_rule`
--
ALTER TABLE `qlo_cart_rule_product_rule`
  ADD PRIMARY KEY (`id_product_rule`);

--
-- Indexes for table `qlo_cart_rule_product_rule_group`
--
ALTER TABLE `qlo_cart_rule_product_rule_group`
  ADD PRIMARY KEY (`id_product_rule_group`);

--
-- Indexes for table `qlo_cart_rule_product_rule_value`
--
ALTER TABLE `qlo_cart_rule_product_rule_value`
  ADD PRIMARY KEY (`id_product_rule`,`id_item`);

--
-- Indexes for table `qlo_cart_rule_shop`
--
ALTER TABLE `qlo_cart_rule_shop`
  ADD PRIMARY KEY (`id_cart_rule`,`id_shop`);

--
-- Indexes for table `qlo_category`
--
ALTER TABLE `qlo_category`
  ADD PRIMARY KEY (`id_category`),
  ADD KEY `category_parent` (`id_parent`),
  ADD KEY `nleftrightactive` (`nleft`,`nright`,`active`),
  ADD KEY `level_depth` (`level_depth`),
  ADD KEY `nright` (`nright`),
  ADD KEY `activenleft` (`active`,`nleft`),
  ADD KEY `activenright` (`active`,`nright`);

--
-- Indexes for table `qlo_category_group`
--
ALTER TABLE `qlo_category_group`
  ADD PRIMARY KEY (`id_category`,`id_group`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_group` (`id_group`);

--
-- Indexes for table `qlo_category_lang`
--
ALTER TABLE `qlo_category_lang`
  ADD PRIMARY KEY (`id_category`,`id_shop`,`id_lang`),
  ADD KEY `category_name` (`name`);

--
-- Indexes for table `qlo_category_product`
--
ALTER TABLE `qlo_category_product`
  ADD PRIMARY KEY (`id_category`,`id_product`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_category` (`id_category`,`position`);

--
-- Indexes for table `qlo_category_shop`
--
ALTER TABLE `qlo_category_shop`
  ADD PRIMARY KEY (`id_category`,`id_shop`);

--
-- Indexes for table `qlo_cms`
--
ALTER TABLE `qlo_cms`
  ADD PRIMARY KEY (`id_cms`);

--
-- Indexes for table `qlo_cms_category`
--
ALTER TABLE `qlo_cms_category`
  ADD PRIMARY KEY (`id_cms_category`),
  ADD KEY `category_parent` (`id_parent`);

--
-- Indexes for table `qlo_cms_category_lang`
--
ALTER TABLE `qlo_cms_category_lang`
  ADD PRIMARY KEY (`id_cms_category`,`id_shop`,`id_lang`),
  ADD KEY `category_name` (`name`);

--
-- Indexes for table `qlo_cms_category_shop`
--
ALTER TABLE `qlo_cms_category_shop`
  ADD PRIMARY KEY (`id_cms_category`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_cms_lang`
--
ALTER TABLE `qlo_cms_lang`
  ADD PRIMARY KEY (`id_cms`,`id_shop`,`id_lang`);

--
-- Indexes for table `qlo_cms_role`
--
ALTER TABLE `qlo_cms_role`
  ADD PRIMARY KEY (`id_cms_role`,`id_cms`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `qlo_cms_role_lang`
--
ALTER TABLE `qlo_cms_role_lang`
  ADD PRIMARY KEY (`id_cms_role`,`id_lang`,`id_shop`);

--
-- Indexes for table `qlo_cms_shop`
--
ALTER TABLE `qlo_cms_shop`
  ADD PRIMARY KEY (`id_cms`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_compare`
--
ALTER TABLE `qlo_compare`
  ADD PRIMARY KEY (`id_compare`);

--
-- Indexes for table `qlo_compare_product`
--
ALTER TABLE `qlo_compare_product`
  ADD PRIMARY KEY (`id_compare`,`id_product`);

--
-- Indexes for table `qlo_configuration`
--
ALTER TABLE `qlo_configuration`
  ADD PRIMARY KEY (`id_configuration`),
  ADD KEY `name` (`name`),
  ADD KEY `id_shop` (`id_shop`),
  ADD KEY `id_shop_group` (`id_shop_group`);

--
-- Indexes for table `qlo_configuration_kpi`
--
ALTER TABLE `qlo_configuration_kpi`
  ADD PRIMARY KEY (`id_configuration_kpi`),
  ADD KEY `name` (`name`),
  ADD KEY `id_shop` (`id_shop`),
  ADD KEY `id_shop_group` (`id_shop_group`);

--
-- Indexes for table `qlo_configuration_kpi_lang`
--
ALTER TABLE `qlo_configuration_kpi_lang`
  ADD PRIMARY KEY (`id_configuration_kpi`,`id_lang`);

--
-- Indexes for table `qlo_configuration_lang`
--
ALTER TABLE `qlo_configuration_lang`
  ADD PRIMARY KEY (`id_configuration`,`id_lang`);

--
-- Indexes for table `qlo_connections`
--
ALTER TABLE `qlo_connections`
  ADD PRIMARY KEY (`id_connections`),
  ADD KEY `id_guest` (`id_guest`),
  ADD KEY `date_add` (`date_add`),
  ADD KEY `id_page` (`id_page`);

--
-- Indexes for table `qlo_connections_page`
--
ALTER TABLE `qlo_connections_page`
  ADD PRIMARY KEY (`id_connections`,`id_page`,`time_start`);

--
-- Indexes for table `qlo_connections_source`
--
ALTER TABLE `qlo_connections_source`
  ADD PRIMARY KEY (`id_connections_source`),
  ADD KEY `connections` (`id_connections`),
  ADD KEY `orderby` (`date_add`),
  ADD KEY `http_referer` (`http_referer`),
  ADD KEY `request_uri` (`request_uri`);

--
-- Indexes for table `qlo_contact`
--
ALTER TABLE `qlo_contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indexes for table `qlo_contact_lang`
--
ALTER TABLE `qlo_contact_lang`
  ADD PRIMARY KEY (`id_contact`,`id_lang`);

--
-- Indexes for table `qlo_contact_shop`
--
ALTER TABLE `qlo_contact_shop`
  ADD PRIMARY KEY (`id_contact`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_country`
--
ALTER TABLE `qlo_country`
  ADD PRIMARY KEY (`id_country`),
  ADD KEY `country_iso_code` (`iso_code`),
  ADD KEY `country_` (`id_zone`);

--
-- Indexes for table `qlo_country_lang`
--
ALTER TABLE `qlo_country_lang`
  ADD PRIMARY KEY (`id_country`,`id_lang`);

--
-- Indexes for table `qlo_country_shop`
--
ALTER TABLE `qlo_country_shop`
  ADD PRIMARY KEY (`id_country`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_currency`
--
ALTER TABLE `qlo_currency`
  ADD PRIMARY KEY (`id_currency`);

--
-- Indexes for table `qlo_currency_shop`
--
ALTER TABLE `qlo_currency_shop`
  ADD PRIMARY KEY (`id_currency`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_customer`
--
ALTER TABLE `qlo_customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `customer_email` (`email`),
  ADD KEY `customer_login` (`email`,`passwd`),
  ADD KEY `id_customer_passwd` (`id_customer`,`passwd`),
  ADD KEY `id_gender` (`id_gender`),
  ADD KEY `id_shop_group` (`id_shop_group`),
  ADD KEY `id_shop` (`id_shop`,`date_add`);

--
-- Indexes for table `qlo_customer_group`
--
ALTER TABLE `qlo_customer_group`
  ADD PRIMARY KEY (`id_customer`,`id_group`),
  ADD KEY `customer_login` (`id_group`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `qlo_customer_guest_detail`
--
ALTER TABLE `qlo_customer_guest_detail`
  ADD PRIMARY KEY (`id_customer_guest_detail`);

--
-- Indexes for table `qlo_customer_message`
--
ALTER TABLE `qlo_customer_message`
  ADD PRIMARY KEY (`id_customer_message`),
  ADD KEY `id_customer_thread` (`id_customer_thread`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indexes for table `qlo_customer_message_sync_imap`
--
ALTER TABLE `qlo_customer_message_sync_imap`
  ADD KEY `md5_header_index` (`md5_header`(4));

--
-- Indexes for table `qlo_customer_thread`
--
ALTER TABLE `qlo_customer_thread`
  ADD PRIMARY KEY (`id_customer_thread`),
  ADD KEY `id_shop` (`id_shop`),
  ADD KEY `id_lang` (`id_lang`),
  ADD KEY `id_contact` (`id_contact`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `qlo_customization`
--
ALTER TABLE `qlo_customization`
  ADD PRIMARY KEY (`id_customization`,`id_cart`,`id_product`,`id_address_delivery`),
  ADD KEY `id_product_attribute` (`id_product_attribute`),
  ADD KEY `id_cart_product` (`id_cart`,`id_product`,`id_product_attribute`);

--
-- Indexes for table `qlo_customization_field`
--
ALTER TABLE `qlo_customization_field`
  ADD PRIMARY KEY (`id_customization_field`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `qlo_customization_field_lang`
--
ALTER TABLE `qlo_customization_field_lang`
  ADD PRIMARY KEY (`id_customization_field`,`id_lang`,`id_shop`);

--
-- Indexes for table `qlo_customized_data`
--
ALTER TABLE `qlo_customized_data`
  ADD PRIMARY KEY (`id_customization`,`type`,`index`);

--
-- Indexes for table `qlo_date_range`
--
ALTER TABLE `qlo_date_range`
  ADD PRIMARY KEY (`id_date_range`);

--
-- Indexes for table `qlo_delivery`
--
ALTER TABLE `qlo_delivery`
  ADD PRIMARY KEY (`id_delivery`),
  ADD KEY `id_zone` (`id_zone`),
  ADD KEY `id_carrier` (`id_carrier`,`id_zone`),
  ADD KEY `id_range_price` (`id_range_price`),
  ADD KEY `id_range_weight` (`id_range_weight`);

--
-- Indexes for table `qlo_employee`
--
ALTER TABLE `qlo_employee`
  ADD PRIMARY KEY (`id_employee`),
  ADD KEY `employee_login` (`email`,`passwd`),
  ADD KEY `id_employee_passwd` (`id_employee`,`passwd`),
  ADD KEY `id_profile` (`id_profile`);

--
-- Indexes for table `qlo_employee_shop`
--
ALTER TABLE `qlo_employee_shop`
  ADD PRIMARY KEY (`id_employee`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_feature`
--
ALTER TABLE `qlo_feature`
  ADD PRIMARY KEY (`id_feature`);

--
-- Indexes for table `qlo_feature_lang`
--
ALTER TABLE `qlo_feature_lang`
  ADD PRIMARY KEY (`id_feature`,`id_lang`),
  ADD KEY `id_lang` (`id_lang`,`name`);

--
-- Indexes for table `qlo_feature_product`
--
ALTER TABLE `qlo_feature_product`
  ADD PRIMARY KEY (`id_feature`,`id_product`),
  ADD KEY `id_feature_value` (`id_feature_value`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `qlo_feature_shop`
--
ALTER TABLE `qlo_feature_shop`
  ADD PRIMARY KEY (`id_feature`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_feature_value`
--
ALTER TABLE `qlo_feature_value`
  ADD PRIMARY KEY (`id_feature_value`),
  ADD KEY `feature` (`id_feature`);

--
-- Indexes for table `qlo_feature_value_lang`
--
ALTER TABLE `qlo_feature_value_lang`
  ADD PRIMARY KEY (`id_feature_value`,`id_lang`);

--
-- Indexes for table `qlo_gender`
--
ALTER TABLE `qlo_gender`
  ADD PRIMARY KEY (`id_gender`);

--
-- Indexes for table `qlo_gender_lang`
--
ALTER TABLE `qlo_gender_lang`
  ADD PRIMARY KEY (`id_gender`,`id_lang`),
  ADD KEY `id_gender` (`id_gender`);

--
-- Indexes for table `qlo_group`
--
ALTER TABLE `qlo_group`
  ADD PRIMARY KEY (`id_group`);

--
-- Indexes for table `qlo_group_lang`
--
ALTER TABLE `qlo_group_lang`
  ADD PRIMARY KEY (`id_group`,`id_lang`);

--
-- Indexes for table `qlo_group_reduction`
--
ALTER TABLE `qlo_group_reduction`
  ADD PRIMARY KEY (`id_group_reduction`),
  ADD UNIQUE KEY `id_group` (`id_group`,`id_category`);

--
-- Indexes for table `qlo_group_shop`
--
ALTER TABLE `qlo_group_shop`
  ADD PRIMARY KEY (`id_group`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_guest`
--
ALTER TABLE `qlo_guest`
  ADD PRIMARY KEY (`id_guest`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_operating_system` (`id_operating_system`),
  ADD KEY `id_web_browser` (`id_web_browser`);

--
-- Indexes for table `qlo_hook`
--
ALTER TABLE `qlo_hook`
  ADD PRIMARY KEY (`id_hook`),
  ADD UNIQUE KEY `hook_name` (`name`);

--
-- Indexes for table `qlo_hook_alias`
--
ALTER TABLE `qlo_hook_alias`
  ADD PRIMARY KEY (`id_hook_alias`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Indexes for table `qlo_hook_module`
--
ALTER TABLE `qlo_hook_module`
  ADD PRIMARY KEY (`id_module`,`id_hook`,`id_shop`),
  ADD KEY `id_hook` (`id_hook`),
  ADD KEY `id_module` (`id_module`),
  ADD KEY `position` (`id_shop`,`position`);

--
-- Indexes for table `qlo_hook_module_exceptions`
--
ALTER TABLE `qlo_hook_module_exceptions`
  ADD PRIMARY KEY (`id_hook_module_exceptions`),
  ADD KEY `id_module` (`id_module`),
  ADD KEY `id_hook` (`id_hook`);

--
-- Indexes for table `qlo_htl_access`
--
ALTER TABLE `qlo_htl_access`
  ADD PRIMARY KEY (`id_profile`,`id_hotel`);

--
-- Indexes for table `qlo_htl_advance_payment`
--
ALTER TABLE `qlo_htl_advance_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_bed_type`
--
ALTER TABLE `qlo_htl_bed_type`
  ADD PRIMARY KEY (`id_bed_type`);

--
-- Indexes for table `qlo_htl_bed_type_lang`
--
ALTER TABLE `qlo_htl_bed_type_lang`
  ADD PRIMARY KEY (`id_bed_type`,`id_lang`);

--
-- Indexes for table `qlo_htl_booking_demands`
--
ALTER TABLE `qlo_htl_booking_demands`
  ADD PRIMARY KEY (`id_booking_demand`);

--
-- Indexes for table `qlo_htl_booking_demands_tax`
--
ALTER TABLE `qlo_htl_booking_demands_tax`
  ADD PRIMARY KEY (`id_booking_demand`,`id_tax`);

--
-- Indexes for table `qlo_htl_booking_detail`
--
ALTER TABLE `qlo_htl_booking_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_booking_document`
--
ALTER TABLE `qlo_htl_booking_document`
  ADD PRIMARY KEY (`id_htl_booking_document`);

--
-- Indexes for table `qlo_htl_branch_features`
--
ALTER TABLE `qlo_htl_branch_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_branch_info`
--
ALTER TABLE `qlo_htl_branch_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_branch_info_lang`
--
ALTER TABLE `qlo_htl_branch_info_lang`
  ADD PRIMARY KEY (`id`,`id_lang`);

--
-- Indexes for table `qlo_htl_branch_refund_rules`
--
ALTER TABLE `qlo_htl_branch_refund_rules`
  ADD PRIMARY KEY (`id_hotel_refund_rule`);

--
-- Indexes for table `qlo_htl_cart_booking_data`
--
ALTER TABLE `qlo_htl_cart_booking_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_custom_navigation_link`
--
ALTER TABLE `qlo_htl_custom_navigation_link`
  ADD PRIMARY KEY (`id_navigation_link`);

--
-- Indexes for table `qlo_htl_custom_navigation_link_lang`
--
ALTER TABLE `qlo_htl_custom_navigation_link_lang`
  ADD PRIMARY KEY (`id_navigation_link`,`id_lang`);

--
-- Indexes for table `qlo_htl_features`
--
ALTER TABLE `qlo_htl_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_features_block_data`
--
ALTER TABLE `qlo_htl_features_block_data`
  ADD PRIMARY KEY (`id_features_block`);

--
-- Indexes for table `qlo_htl_features_block_data_lang`
--
ALTER TABLE `qlo_htl_features_block_data_lang`
  ADD PRIMARY KEY (`id_features_block`,`id_lang`);

--
-- Indexes for table `qlo_htl_features_lang`
--
ALTER TABLE `qlo_htl_features_lang`
  ADD PRIMARY KEY (`id`,`id_lang`);

--
-- Indexes for table `qlo_htl_footer_payment_block_info`
--
ALTER TABLE `qlo_htl_footer_payment_block_info`
  ADD PRIMARY KEY (`id_payment_block`);

--
-- Indexes for table `qlo_htl_image`
--
ALTER TABLE `qlo_htl_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_interior_image`
--
ALTER TABLE `qlo_htl_interior_image`
  ADD PRIMARY KEY (`id_interior_image`);

--
-- Indexes for table `qlo_htl_order_refund_rules`
--
ALTER TABLE `qlo_htl_order_refund_rules`
  ADD PRIMARY KEY (`id_refund_rule`);

--
-- Indexes for table `qlo_htl_order_refund_rules_lang`
--
ALTER TABLE `qlo_htl_order_refund_rules_lang`
  ADD PRIMARY KEY (`id_refund_rule`,`id_lang`);

--
-- Indexes for table `qlo_htl_order_restrict_date`
--
ALTER TABLE `qlo_htl_order_restrict_date`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_room_block_data`
--
ALTER TABLE `qlo_htl_room_block_data`
  ADD PRIMARY KEY (`id_room_block`);

--
-- Indexes for table `qlo_htl_room_disable_dates`
--
ALTER TABLE `qlo_htl_room_disable_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_room_information`
--
ALTER TABLE `qlo_htl_room_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_room_status`
--
ALTER TABLE `qlo_htl_room_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_room_type`
--
ALTER TABLE `qlo_htl_room_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_htl_room_type_bed_type`
--
ALTER TABLE `qlo_htl_room_type_bed_type`
  ADD PRIMARY KEY (`id_room_type_bed_type`);

--
-- Indexes for table `qlo_htl_room_type_demand`
--
ALTER TABLE `qlo_htl_room_type_demand`
  ADD PRIMARY KEY (`id_room_type_demand`);

--
-- Indexes for table `qlo_htl_room_type_demand_price`
--
ALTER TABLE `qlo_htl_room_type_demand_price`
  ADD PRIMARY KEY (`id_room_type_demand_price`);

--
-- Indexes for table `qlo_htl_room_type_feature_pricing`
--
ALTER TABLE `qlo_htl_room_type_feature_pricing`
  ADD PRIMARY KEY (`id_feature_price`);

--
-- Indexes for table `qlo_htl_room_type_feature_pricing_group`
--
ALTER TABLE `qlo_htl_room_type_feature_pricing_group`
  ADD PRIMARY KEY (`id_feature_price`,`id_group`);

--
-- Indexes for table `qlo_htl_room_type_feature_pricing_lang`
--
ALTER TABLE `qlo_htl_room_type_feature_pricing_lang`
  ADD PRIMARY KEY (`id_feature_price`,`id_lang`);

--
-- Indexes for table `qlo_htl_room_type_feature_pricing_restriction`
--
ALTER TABLE `qlo_htl_room_type_feature_pricing_restriction`
  ADD PRIMARY KEY (`id_feature_price_restriction`);

--
-- Indexes for table `qlo_htl_room_type_global_demand`
--
ALTER TABLE `qlo_htl_room_type_global_demand`
  ADD PRIMARY KEY (`id_global_demand`);

--
-- Indexes for table `qlo_htl_room_type_global_demand_advance_option`
--
ALTER TABLE `qlo_htl_room_type_global_demand_advance_option`
  ADD PRIMARY KEY (`id_option`);

--
-- Indexes for table `qlo_htl_room_type_global_demand_advance_option_lang`
--
ALTER TABLE `qlo_htl_room_type_global_demand_advance_option_lang`
  ADD PRIMARY KEY (`id_option`,`id_lang`);

--
-- Indexes for table `qlo_htl_room_type_global_demand_lang`
--
ALTER TABLE `qlo_htl_room_type_global_demand_lang`
  ADD PRIMARY KEY (`id_global_demand`,`id_lang`);

--
-- Indexes for table `qlo_htl_room_type_restriction_date_range`
--
ALTER TABLE `qlo_htl_room_type_restriction_date_range`
  ADD PRIMARY KEY (`id_rt_restriction`);

--
-- Indexes for table `qlo_htl_room_type_service_product`
--
ALTER TABLE `qlo_htl_room_type_service_product`
  ADD PRIMARY KEY (`id_room_type_service_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `qlo_htl_room_type_service_product_price`
--
ALTER TABLE `qlo_htl_room_type_service_product_price`
  ADD PRIMARY KEY (`id_room_type_service_product_price`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `qlo_htl_settings_link`
--
ALTER TABLE `qlo_htl_settings_link`
  ADD PRIMARY KEY (`id_settings_link`);

--
-- Indexes for table `qlo_htl_settings_link_lang`
--
ALTER TABLE `qlo_htl_settings_link_lang`
  ADD PRIMARY KEY (`id_settings_link`,`id_lang`);

--
-- Indexes for table `qlo_htl_testimonials_block_data`
--
ALTER TABLE `qlo_htl_testimonials_block_data`
  ADD PRIMARY KEY (`id_testimonial_block`);

--
-- Indexes for table `qlo_htl_testimonials_block_data_lang`
--
ALTER TABLE `qlo_htl_testimonials_block_data_lang`
  ADD PRIMARY KEY (`id_testimonial_block`,`id_lang`);

--
-- Indexes for table `qlo_image`
--
ALTER TABLE `qlo_image`
  ADD PRIMARY KEY (`id_image`),
  ADD UNIQUE KEY `id_product_cover` (`id_product`,`cover`),
  ADD UNIQUE KEY `idx_product_image` (`id_image`,`id_product`,`cover`),
  ADD KEY `image_product` (`id_product`);

--
-- Indexes for table `qlo_image_lang`
--
ALTER TABLE `qlo_image_lang`
  ADD PRIMARY KEY (`id_image`,`id_lang`),
  ADD KEY `id_image` (`id_image`);

--
-- Indexes for table `qlo_image_shop`
--
ALTER TABLE `qlo_image_shop`
  ADD PRIMARY KEY (`id_image`,`id_shop`),
  ADD UNIQUE KEY `id_product` (`id_product`,`id_shop`,`cover`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_image_type`
--
ALTER TABLE `qlo_image_type`
  ADD PRIMARY KEY (`id_image_type`),
  ADD KEY `image_type_name` (`name`);

--
-- Indexes for table `qlo_import_match`
--
ALTER TABLE `qlo_import_match`
  ADD PRIMARY KEY (`id_import_match`);

--
-- Indexes for table `qlo_lang`
--
ALTER TABLE `qlo_lang`
  ADD PRIMARY KEY (`id_lang`),
  ADD KEY `lang_iso_code` (`iso_code`);

--
-- Indexes for table `qlo_lang_shop`
--
ALTER TABLE `qlo_lang_shop`
  ADD PRIMARY KEY (`id_lang`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_log`
--
ALTER TABLE `qlo_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `qlo_mail`
--
ALTER TABLE `qlo_mail`
  ADD PRIMARY KEY (`id_mail`),
  ADD KEY `recipient` (`recipient`(10));

--
-- Indexes for table `qlo_maintenance_access`
--
ALTER TABLE `qlo_maintenance_access`
  ADD PRIMARY KEY (`id_maintenance_access`);

--
-- Indexes for table `qlo_manufacturer`
--
ALTER TABLE `qlo_manufacturer`
  ADD PRIMARY KEY (`id_manufacturer`);

--
-- Indexes for table `qlo_manufacturer_lang`
--
ALTER TABLE `qlo_manufacturer_lang`
  ADD PRIMARY KEY (`id_manufacturer`,`id_lang`);

--
-- Indexes for table `qlo_manufacturer_shop`
--
ALTER TABLE `qlo_manufacturer_shop`
  ADD PRIMARY KEY (`id_manufacturer`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_memcached_servers`
--
ALTER TABLE `qlo_memcached_servers`
  ADD PRIMARY KEY (`id_memcached_server`);

--
-- Indexes for table `qlo_message`
--
ALTER TABLE `qlo_message`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `message_order` (`id_order`),
  ADD KEY `id_cart` (`id_cart`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_employee` (`id_employee`);

--
-- Indexes for table `qlo_message_readed`
--
ALTER TABLE `qlo_message_readed`
  ADD PRIMARY KEY (`id_message`,`id_employee`);

--
-- Indexes for table `qlo_meta`
--
ALTER TABLE `qlo_meta`
  ADD PRIMARY KEY (`id_meta`),
  ADD UNIQUE KEY `page` (`page`);

--
-- Indexes for table `qlo_meta_lang`
--
ALTER TABLE `qlo_meta_lang`
  ADD PRIMARY KEY (`id_meta`,`id_shop`,`id_lang`),
  ADD KEY `id_shop` (`id_shop`),
  ADD KEY `id_lang` (`id_lang`);

--
-- Indexes for table `qlo_module`
--
ALTER TABLE `qlo_module`
  ADD PRIMARY KEY (`id_module`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `qlo_modules_perfs`
--
ALTER TABLE `qlo_modules_perfs`
  ADD PRIMARY KEY (`id_modules_perfs`),
  ADD KEY `session` (`session`);

--
-- Indexes for table `qlo_module_access`
--
ALTER TABLE `qlo_module_access`
  ADD PRIMARY KEY (`id_profile`,`id_module`);

--
-- Indexes for table `qlo_module_country`
--
ALTER TABLE `qlo_module_country`
  ADD PRIMARY KEY (`id_module`,`id_shop`,`id_country`);

--
-- Indexes for table `qlo_module_currency`
--
ALTER TABLE `qlo_module_currency`
  ADD PRIMARY KEY (`id_module`,`id_shop`,`id_currency`),
  ADD KEY `id_module` (`id_module`);

--
-- Indexes for table `qlo_module_group`
--
ALTER TABLE `qlo_module_group`
  ADD PRIMARY KEY (`id_module`,`id_shop`,`id_group`);

--
-- Indexes for table `qlo_module_preference`
--
ALTER TABLE `qlo_module_preference`
  ADD PRIMARY KEY (`id_module_preference`),
  ADD UNIQUE KEY `employee_module` (`id_employee`,`module`);

--
-- Indexes for table `qlo_module_shop`
--
ALTER TABLE `qlo_module_shop`
  ADD PRIMARY KEY (`id_module`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_newsletter`
--
ALTER TABLE `qlo_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qlo_operating_system`
--
ALTER TABLE `qlo_operating_system`
  ADD PRIMARY KEY (`id_operating_system`);

--
-- Indexes for table `qlo_orders`
--
ALTER TABLE `qlo_orders`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `reference` (`reference`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_cart` (`id_cart`),
  ADD KEY `invoice_number` (`invoice_number`),
  ADD KEY `id_carrier` (`id_carrier`),
  ADD KEY `id_lang` (`id_lang`),
  ADD KEY `id_currency` (`id_currency`),
  ADD KEY `id_address_delivery` (`id_address_delivery`),
  ADD KEY `id_address_invoice` (`id_address_invoice`),
  ADD KEY `id_shop_group` (`id_shop_group`),
  ADD KEY `current_state` (`current_state`),
  ADD KEY `id_shop` (`id_shop`),
  ADD KEY `date_add` (`date_add`);

--
-- Indexes for table `qlo_order_carrier`
--
ALTER TABLE `qlo_order_carrier`
  ADD PRIMARY KEY (`id_order_carrier`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_carrier` (`id_carrier`),
  ADD KEY `id_order_invoice` (`id_order_invoice`);

--
-- Indexes for table `qlo_order_cart_rule`
--
ALTER TABLE `qlo_order_cart_rule`
  ADD PRIMARY KEY (`id_order_cart_rule`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_cart_rule` (`id_cart_rule`);

--
-- Indexes for table `qlo_order_customer_guest_detail`
--
ALTER TABLE `qlo_order_customer_guest_detail`
  ADD PRIMARY KEY (`id_order_customer_guest_detail`);

--
-- Indexes for table `qlo_order_detail`
--
ALTER TABLE `qlo_order_detail`
  ADD PRIMARY KEY (`id_order_detail`),
  ADD KEY `order_detail_order` (`id_order`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_attribute_id` (`product_attribute_id`),
  ADD KEY `id_tax_rules_group` (`id_tax_rules_group`),
  ADD KEY `id_order_id_order_detail` (`id_order`,`id_order_detail`);

--
-- Indexes for table `qlo_order_detail_tax`
--
ALTER TABLE `qlo_order_detail_tax`
  ADD KEY `id_order_detail` (`id_order_detail`),
  ADD KEY `id_tax` (`id_tax`);

--
-- Indexes for table `qlo_order_history`
--
ALTER TABLE `qlo_order_history`
  ADD PRIMARY KEY (`id_order_history`),
  ADD KEY `order_history_order` (`id_order`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_order_state` (`id_order_state`);

--
-- Indexes for table `qlo_order_invoice`
--
ALTER TABLE `qlo_order_invoice`
  ADD PRIMARY KEY (`id_order_invoice`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `qlo_order_invoice_payment`
--
ALTER TABLE `qlo_order_invoice_payment`
  ADD PRIMARY KEY (`id_order_invoice`,`id_order_payment`),
  ADD KEY `order_payment` (`id_order_payment`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `qlo_order_invoice_tax`
--
ALTER TABLE `qlo_order_invoice_tax`
  ADD KEY `id_tax` (`id_tax`);

--
-- Indexes for table `qlo_order_message`
--
ALTER TABLE `qlo_order_message`
  ADD PRIMARY KEY (`id_order_message`);

--
-- Indexes for table `qlo_order_message_lang`
--
ALTER TABLE `qlo_order_message_lang`
  ADD PRIMARY KEY (`id_order_message`,`id_lang`);

--
-- Indexes for table `qlo_order_payment`
--
ALTER TABLE `qlo_order_payment`
  ADD PRIMARY KEY (`id_order_payment`),
  ADD KEY `order_reference` (`order_reference`);

--
-- Indexes for table `qlo_order_payment_detail`
--
ALTER TABLE `qlo_order_payment_detail`
  ADD PRIMARY KEY (`id_order_payment_detail`);

--
-- Indexes for table `qlo_order_return`
--
ALTER TABLE `qlo_order_return`
  ADD PRIMARY KEY (`id_order_return`),
  ADD KEY `order_return_customer` (`id_customer`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `qlo_order_return_detail`
--
ALTER TABLE `qlo_order_return_detail`
  ADD PRIMARY KEY (`id_order_return_detail`),
  ADD KEY `id_htl_booking` (`id_htl_booking`),
  ADD KEY `id_service_product_order_detail` (`id_service_product_order_detail`);

--
-- Indexes for table `qlo_order_return_state`
--
ALTER TABLE `qlo_order_return_state`
  ADD PRIMARY KEY (`id_order_return_state`);

--
-- Indexes for table `qlo_order_return_state_lang`
--
ALTER TABLE `qlo_order_return_state_lang`
  ADD PRIMARY KEY (`id_order_return_state`,`id_lang`);

--
-- Indexes for table `qlo_order_slip`
--
ALTER TABLE `qlo_order_slip`
  ADD PRIMARY KEY (`id_order_slip`),
  ADD KEY `order_slip_customer` (`id_customer`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `qlo_order_slip_detail`
--
ALTER TABLE `qlo_order_slip_detail`
  ADD PRIMARY KEY (`id_order_slip`,`id_htl_booking`,`id_service_product_order_detail`);

--
-- Indexes for table `qlo_order_slip_detail_tax`
--
ALTER TABLE `qlo_order_slip_detail_tax`
  ADD KEY `id_order_slip_detail` (`id_order_slip_detail`),
  ADD KEY `id_tax` (`id_tax`);

--
-- Indexes for table `qlo_order_state`
--
ALTER TABLE `qlo_order_state`
  ADD PRIMARY KEY (`id_order_state`),
  ADD KEY `module_name` (`module_name`);

--
-- Indexes for table `qlo_order_state_lang`
--
ALTER TABLE `qlo_order_state_lang`
  ADD PRIMARY KEY (`id_order_state`,`id_lang`);

--
-- Indexes for table `qlo_pack`
--
ALTER TABLE `qlo_pack`
  ADD PRIMARY KEY (`id_product_pack`,`id_product_item`,`id_product_attribute_item`),
  ADD KEY `product_item` (`id_product_item`,`id_product_attribute_item`);

--
-- Indexes for table `qlo_page`
--
ALTER TABLE `qlo_page`
  ADD PRIMARY KEY (`id_page`),
  ADD KEY `id_page_type` (`id_page_type`),
  ADD KEY `id_object` (`id_object`);

--
-- Indexes for table `qlo_pagenotfound`
--
ALTER TABLE `qlo_pagenotfound`
  ADD PRIMARY KEY (`id_pagenotfound`),
  ADD KEY `date_add` (`date_add`);

--
-- Indexes for table `qlo_page_type`
--
ALTER TABLE `qlo_page_type`
  ADD PRIMARY KEY (`id_page_type`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `qlo_page_viewed`
--
ALTER TABLE `qlo_page_viewed`
  ADD PRIMARY KEY (`id_page`,`id_date_range`,`id_shop`);

--
-- Indexes for table `qlo_product`
--
ALTER TABLE `qlo_product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `product_supplier` (`id_supplier`),
  ADD KEY `product_manufacturer` (`id_manufacturer`,`id_product`),
  ADD KEY `id_category_default` (`id_category_default`),
  ADD KEY `indexed` (`indexed`),
  ADD KEY `date_add` (`date_add`);

--
-- Indexes for table `qlo_product_attachment`
--
ALTER TABLE `qlo_product_attachment`
  ADD PRIMARY KEY (`id_product`,`id_attachment`);

--
-- Indexes for table `qlo_product_attribute`
--
ALTER TABLE `qlo_product_attribute`
  ADD PRIMARY KEY (`id_product_attribute`),
  ADD UNIQUE KEY `product_default` (`id_product`,`default_on`),
  ADD KEY `product_attribute_product` (`id_product`),
  ADD KEY `reference` (`reference`),
  ADD KEY `supplier_reference` (`supplier_reference`),
  ADD KEY `id_product_id_product_attribute` (`id_product_attribute`,`id_product`);

--
-- Indexes for table `qlo_product_attribute_combination`
--
ALTER TABLE `qlo_product_attribute_combination`
  ADD PRIMARY KEY (`id_attribute`,`id_product_attribute`),
  ADD KEY `id_product_attribute` (`id_product_attribute`);

--
-- Indexes for table `qlo_product_attribute_image`
--
ALTER TABLE `qlo_product_attribute_image`
  ADD PRIMARY KEY (`id_product_attribute`,`id_image`),
  ADD KEY `id_image` (`id_image`);

--
-- Indexes for table `qlo_product_attribute_shop`
--
ALTER TABLE `qlo_product_attribute_shop`
  ADD PRIMARY KEY (`id_product_attribute`,`id_shop`),
  ADD UNIQUE KEY `id_product` (`id_product`,`id_shop`,`default_on`);

--
-- Indexes for table `qlo_product_carrier`
--
ALTER TABLE `qlo_product_carrier`
  ADD PRIMARY KEY (`id_product`,`id_carrier_reference`,`id_shop`);

--
-- Indexes for table `qlo_product_country_tax`
--
ALTER TABLE `qlo_product_country_tax`
  ADD PRIMARY KEY (`id_product`,`id_country`);

--
-- Indexes for table `qlo_product_download`
--
ALTER TABLE `qlo_product_download`
  ADD PRIMARY KEY (`id_product_download`),
  ADD UNIQUE KEY `id_product` (`id_product`),
  ADD KEY `product_active` (`id_product`,`active`);

--
-- Indexes for table `qlo_product_group_reduction_cache`
--
ALTER TABLE `qlo_product_group_reduction_cache`
  ADD PRIMARY KEY (`id_product`,`id_group`);

--
-- Indexes for table `qlo_product_lang`
--
ALTER TABLE `qlo_product_lang`
  ADD PRIMARY KEY (`id_product`,`id_shop`,`id_lang`),
  ADD KEY `id_lang` (`id_lang`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `qlo_product_option`
--
ALTER TABLE `qlo_product_option`
  ADD PRIMARY KEY (`id_product_option`);

--
-- Indexes for table `qlo_product_option_lang`
--
ALTER TABLE `qlo_product_option_lang`
  ADD PRIMARY KEY (`id_product_option`,`id_lang`);

--
-- Indexes for table `qlo_product_sale`
--
ALTER TABLE `qlo_product_sale`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `quantity` (`quantity`);

--
-- Indexes for table `qlo_product_shop`
--
ALTER TABLE `qlo_product_shop`
  ADD PRIMARY KEY (`id_product`,`id_shop`),
  ADD KEY `id_category_default` (`id_category_default`),
  ADD KEY `date_add` (`date_add`,`active`,`visibility`),
  ADD KEY `indexed` (`indexed`,`active`,`id_product`);

--
-- Indexes for table `qlo_product_supplier`
--
ALTER TABLE `qlo_product_supplier`
  ADD PRIMARY KEY (`id_product_supplier`),
  ADD UNIQUE KEY `id_product` (`id_product`,`id_product_attribute`,`id_supplier`),
  ADD KEY `id_supplier` (`id_supplier`,`id_product`);

--
-- Indexes for table `qlo_product_tag`
--
ALTER TABLE `qlo_product_tag`
  ADD PRIMARY KEY (`id_product`,`id_tag`),
  ADD KEY `id_tag` (`id_tag`),
  ADD KEY `id_lang` (`id_lang`,`id_tag`);

--
-- Indexes for table `qlo_profile`
--
ALTER TABLE `qlo_profile`
  ADD PRIMARY KEY (`id_profile`);

--
-- Indexes for table `qlo_profile_lang`
--
ALTER TABLE `qlo_profile_lang`
  ADD PRIMARY KEY (`id_profile`,`id_lang`);

--
-- Indexes for table `qlo_qcmc_channel_manager_booking`
--
ALTER TABLE `qlo_qcmc_channel_manager_booking`
  ADD PRIMARY KEY (`id_channel_manager_booking`);

--
-- Indexes for table `qlo_qhr_category`
--
ALTER TABLE `qlo_qhr_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `qlo_qhr_category_lang`
--
ALTER TABLE `qlo_qhr_category_lang`
  ADD PRIMARY KEY (`id_category`,`id_lang`);

--
-- Indexes for table `qlo_qhr_hotel_review`
--
ALTER TABLE `qlo_qhr_hotel_review`
  ADD PRIMARY KEY (`id_hotel_review`);

--
-- Indexes for table `qlo_qhr_review_category_rating`
--
ALTER TABLE `qlo_qhr_review_category_rating`
  ADD PRIMARY KEY (`id_hotel_review`,`id_category`);

--
-- Indexes for table `qlo_qhr_review_reply`
--
ALTER TABLE `qlo_qhr_review_reply`
  ADD PRIMARY KEY (`id_review_reply`);

--
-- Indexes for table `qlo_qhr_review_report`
--
ALTER TABLE `qlo_qhr_review_report`
  ADD PRIMARY KEY (`id_hotel_review`,`id_customer`);

--
-- Indexes for table `qlo_qhr_review_usefulness`
--
ALTER TABLE `qlo_qhr_review_usefulness`
  ADD PRIMARY KEY (`id_hotel_review`,`id_customer`);

--
-- Indexes for table `qlo_quick_access`
--
ALTER TABLE `qlo_quick_access`
  ADD PRIMARY KEY (`id_quick_access`);

--
-- Indexes for table `qlo_quick_access_lang`
--
ALTER TABLE `qlo_quick_access_lang`
  ADD PRIMARY KEY (`id_quick_access`,`id_lang`);

--
-- Indexes for table `qlo_range_price`
--
ALTER TABLE `qlo_range_price`
  ADD PRIMARY KEY (`id_range_price`),
  ADD UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`);

--
-- Indexes for table `qlo_range_weight`
--
ALTER TABLE `qlo_range_weight`
  ADD PRIMARY KEY (`id_range_weight`),
  ADD UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`);

--
-- Indexes for table `qlo_referrer`
--
ALTER TABLE `qlo_referrer`
  ADD PRIMARY KEY (`id_referrer`);

--
-- Indexes for table `qlo_referrer_cache`
--
ALTER TABLE `qlo_referrer_cache`
  ADD PRIMARY KEY (`id_connections_source`,`id_referrer`);

--
-- Indexes for table `qlo_referrer_shop`
--
ALTER TABLE `qlo_referrer_shop`
  ADD PRIMARY KEY (`id_referrer`,`id_shop`);

--
-- Indexes for table `qlo_request_sql`
--
ALTER TABLE `qlo_request_sql`
  ADD PRIMARY KEY (`id_request_sql`);

--
-- Indexes for table `qlo_required_field`
--
ALTER TABLE `qlo_required_field`
  ADD PRIMARY KEY (`id_required_field`),
  ADD KEY `object_name` (`object_name`);

--
-- Indexes for table `qlo_risk`
--
ALTER TABLE `qlo_risk`
  ADD PRIMARY KEY (`id_risk`);

--
-- Indexes for table `qlo_risk_lang`
--
ALTER TABLE `qlo_risk_lang`
  ADD PRIMARY KEY (`id_risk`,`id_lang`),
  ADD KEY `id_risk` (`id_risk`);

--
-- Indexes for table `qlo_scene`
--
ALTER TABLE `qlo_scene`
  ADD PRIMARY KEY (`id_scene`);

--
-- Indexes for table `qlo_scene_category`
--
ALTER TABLE `qlo_scene_category`
  ADD PRIMARY KEY (`id_scene`,`id_category`);

--
-- Indexes for table `qlo_scene_lang`
--
ALTER TABLE `qlo_scene_lang`
  ADD PRIMARY KEY (`id_scene`,`id_lang`);

--
-- Indexes for table `qlo_scene_products`
--
ALTER TABLE `qlo_scene_products`
  ADD PRIMARY KEY (`id_scene`,`id_product`,`x_axis`,`y_axis`);

--
-- Indexes for table `qlo_scene_shop`
--
ALTER TABLE `qlo_scene_shop`
  ADD PRIMARY KEY (`id_scene`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_search_engine`
--
ALTER TABLE `qlo_search_engine`
  ADD PRIMARY KEY (`id_search_engine`);

--
-- Indexes for table `qlo_search_index`
--
ALTER TABLE `qlo_search_index`
  ADD PRIMARY KEY (`id_word`,`id_product`),
  ADD KEY `id_product` (`id_product`,`weight`);

--
-- Indexes for table `qlo_search_word`
--
ALTER TABLE `qlo_search_word`
  ADD PRIMARY KEY (`id_word`),
  ADD UNIQUE KEY `id_lang` (`id_lang`,`id_shop`,`word`);

--
-- Indexes for table `qlo_sekeyword`
--
ALTER TABLE `qlo_sekeyword`
  ADD PRIMARY KEY (`id_sekeyword`);

--
-- Indexes for table `qlo_service_product_cart_detail`
--
ALTER TABLE `qlo_service_product_cart_detail`
  ADD PRIMARY KEY (`id_service_product_cart_detail`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `qlo_service_product_order_detail`
--
ALTER TABLE `qlo_service_product_order_detail`
  ADD PRIMARY KEY (`id_service_product_order_detail`);

--
-- Indexes for table `qlo_shop`
--
ALTER TABLE `qlo_shop`
  ADD PRIMARY KEY (`id_shop`),
  ADD KEY `id_shop_group` (`id_shop_group`,`deleted`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_theme` (`id_theme`);

--
-- Indexes for table `qlo_shop_group`
--
ALTER TABLE `qlo_shop_group`
  ADD PRIMARY KEY (`id_shop_group`),
  ADD KEY `deleted` (`deleted`,`name`);

--
-- Indexes for table `qlo_shop_url`
--
ALTER TABLE `qlo_shop_url`
  ADD PRIMARY KEY (`id_shop_url`),
  ADD UNIQUE KEY `full_shop_url` (`domain`,`physical_uri`,`virtual_uri`),
  ADD UNIQUE KEY `full_shop_url_ssl` (`domain_ssl`,`physical_uri`,`virtual_uri`),
  ADD KEY `id_shop` (`id_shop`,`main`);

--
-- Indexes for table `qlo_smarty_cache`
--
ALTER TABLE `qlo_smarty_cache`
  ADD PRIMARY KEY (`id_smarty_cache`),
  ADD KEY `name` (`name`),
  ADD KEY `cache_id` (`cache_id`),
  ADD KEY `modified` (`modified`);

--
-- Indexes for table `qlo_smarty_last_flush`
--
ALTER TABLE `qlo_smarty_last_flush`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `qlo_smarty_lazy_cache`
--
ALTER TABLE `qlo_smarty_lazy_cache`
  ADD PRIMARY KEY (`template_hash`,`cache_id`,`compile_id`);

--
-- Indexes for table `qlo_specific_price`
--
ALTER TABLE `qlo_specific_price`
  ADD PRIMARY KEY (`id_specific_price`),
  ADD UNIQUE KEY `id_product_2` (`id_product`,`id_product_attribute`,`id_customer`,`id_cart`,`from`,`to`,`id_shop`,`id_shop_group`,`id_currency`,`id_country`,`id_group`,`from_quantity`,`id_specific_price_rule`,`id_htl_cart_booking`),
  ADD KEY `id_product` (`id_product`,`id_shop`,`id_currency`,`id_country`,`id_group`,`id_customer`,`from_quantity`,`from`,`to`),
  ADD KEY `from_quantity` (`from_quantity`),
  ADD KEY `id_specific_price_rule` (`id_specific_price_rule`),
  ADD KEY `id_cart` (`id_cart`),
  ADD KEY `id_product_attribute` (`id_product_attribute`),
  ADD KEY `id_shop` (`id_shop`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `from` (`from`),
  ADD KEY `to` (`to`);

--
-- Indexes for table `qlo_specific_price_priority`
--
ALTER TABLE `qlo_specific_price_priority`
  ADD PRIMARY KEY (`id_specific_price_priority`,`id_product`),
  ADD UNIQUE KEY `id_product` (`id_product`);

--
-- Indexes for table `qlo_specific_price_rule`
--
ALTER TABLE `qlo_specific_price_rule`
  ADD PRIMARY KEY (`id_specific_price_rule`),
  ADD KEY `id_product` (`id_shop`,`id_currency`,`id_country`,`id_group`,`from_quantity`,`from`,`to`);

--
-- Indexes for table `qlo_specific_price_rule_condition`
--
ALTER TABLE `qlo_specific_price_rule_condition`
  ADD PRIMARY KEY (`id_specific_price_rule_condition`),
  ADD KEY `id_specific_price_rule_condition_group` (`id_specific_price_rule_condition_group`);

--
-- Indexes for table `qlo_specific_price_rule_condition_group`
--
ALTER TABLE `qlo_specific_price_rule_condition_group`
  ADD PRIMARY KEY (`id_specific_price_rule_condition_group`,`id_specific_price_rule`);

--
-- Indexes for table `qlo_state`
--
ALTER TABLE `qlo_state`
  ADD PRIMARY KEY (`id_state`),
  ADD KEY `id_country` (`id_country`),
  ADD KEY `name` (`name`),
  ADD KEY `id_zone` (`id_zone`);

--
-- Indexes for table `qlo_stock`
--
ALTER TABLE `qlo_stock`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `id_warehouse` (`id_warehouse`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_product_attribute` (`id_product_attribute`);

--
-- Indexes for table `qlo_stock_available`
--
ALTER TABLE `qlo_stock_available`
  ADD PRIMARY KEY (`id_stock_available`),
  ADD UNIQUE KEY `product_sqlstock` (`id_product`,`id_product_attribute`,`id_shop`,`id_shop_group`),
  ADD KEY `id_shop` (`id_shop`),
  ADD KEY `id_shop_group` (`id_shop_group`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_product_attribute` (`id_product_attribute`);

--
-- Indexes for table `qlo_stock_mvt`
--
ALTER TABLE `qlo_stock_mvt`
  ADD PRIMARY KEY (`id_stock_mvt`),
  ADD KEY `id_stock` (`id_stock`),
  ADD KEY `id_stock_mvt_reason` (`id_stock_mvt_reason`);

--
-- Indexes for table `qlo_stock_mvt_reason`
--
ALTER TABLE `qlo_stock_mvt_reason`
  ADD PRIMARY KEY (`id_stock_mvt_reason`);

--
-- Indexes for table `qlo_stock_mvt_reason_lang`
--
ALTER TABLE `qlo_stock_mvt_reason_lang`
  ADD PRIMARY KEY (`id_stock_mvt_reason`,`id_lang`);

--
-- Indexes for table `qlo_store`
--
ALTER TABLE `qlo_store`
  ADD PRIMARY KEY (`id_store`);

--
-- Indexes for table `qlo_store_shop`
--
ALTER TABLE `qlo_store_shop`
  ADD PRIMARY KEY (`id_store`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_supplier`
--
ALTER TABLE `qlo_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `qlo_supplier_lang`
--
ALTER TABLE `qlo_supplier_lang`
  ADD PRIMARY KEY (`id_supplier`,`id_lang`);

--
-- Indexes for table `qlo_supplier_shop`
--
ALTER TABLE `qlo_supplier_shop`
  ADD PRIMARY KEY (`id_supplier`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_supply_order`
--
ALTER TABLE `qlo_supply_order`
  ADD PRIMARY KEY (`id_supply_order`),
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `id_warehouse` (`id_warehouse`),
  ADD KEY `reference` (`reference`);

--
-- Indexes for table `qlo_supply_order_detail`
--
ALTER TABLE `qlo_supply_order_detail`
  ADD PRIMARY KEY (`id_supply_order_detail`),
  ADD KEY `id_supply_order` (`id_supply_order`,`id_product`),
  ADD KEY `id_product_attribute` (`id_product_attribute`),
  ADD KEY `id_product_product_attribute` (`id_product`,`id_product_attribute`);

--
-- Indexes for table `qlo_supply_order_history`
--
ALTER TABLE `qlo_supply_order_history`
  ADD PRIMARY KEY (`id_supply_order_history`),
  ADD KEY `id_supply_order` (`id_supply_order`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_state` (`id_state`);

--
-- Indexes for table `qlo_supply_order_receipt_history`
--
ALTER TABLE `qlo_supply_order_receipt_history`
  ADD PRIMARY KEY (`id_supply_order_receipt_history`),
  ADD KEY `id_supply_order_detail` (`id_supply_order_detail`),
  ADD KEY `id_supply_order_state` (`id_supply_order_state`);

--
-- Indexes for table `qlo_supply_order_state`
--
ALTER TABLE `qlo_supply_order_state`
  ADD PRIMARY KEY (`id_supply_order_state`);

--
-- Indexes for table `qlo_supply_order_state_lang`
--
ALTER TABLE `qlo_supply_order_state_lang`
  ADD PRIMARY KEY (`id_supply_order_state`,`id_lang`);

--
-- Indexes for table `qlo_tab`
--
ALTER TABLE `qlo_tab`
  ADD PRIMARY KEY (`id_tab`),
  ADD KEY `class_name` (`class_name`),
  ADD KEY `id_parent` (`id_parent`);

--
-- Indexes for table `qlo_tab_lang`
--
ALTER TABLE `qlo_tab_lang`
  ADD PRIMARY KEY (`id_tab`,`id_lang`);

--
-- Indexes for table `qlo_tab_module_preference`
--
ALTER TABLE `qlo_tab_module_preference`
  ADD PRIMARY KEY (`id_tab_module_preference`),
  ADD UNIQUE KEY `employee_module` (`id_employee`,`id_tab`,`module`);

--
-- Indexes for table `qlo_tag`
--
ALTER TABLE `qlo_tag`
  ADD PRIMARY KEY (`id_tag`),
  ADD KEY `tag_name` (`name`),
  ADD KEY `id_lang` (`id_lang`);

--
-- Indexes for table `qlo_tag_count`
--
ALTER TABLE `qlo_tag_count`
  ADD PRIMARY KEY (`id_group`,`id_tag`),
  ADD KEY `id_group` (`id_group`,`id_lang`,`id_shop`,`counter`);

--
-- Indexes for table `qlo_tax`
--
ALTER TABLE `qlo_tax`
  ADD PRIMARY KEY (`id_tax`);

--
-- Indexes for table `qlo_tax_lang`
--
ALTER TABLE `qlo_tax_lang`
  ADD PRIMARY KEY (`id_tax`,`id_lang`);

--
-- Indexes for table `qlo_tax_rule`
--
ALTER TABLE `qlo_tax_rule`
  ADD PRIMARY KEY (`id_tax_rule`),
  ADD KEY `id_tax_rules_group` (`id_tax_rules_group`),
  ADD KEY `id_tax` (`id_tax`),
  ADD KEY `category_getproducts` (`id_tax_rules_group`,`id_country`,`id_state`,`zipcode_from`);

--
-- Indexes for table `qlo_tax_rules_group`
--
ALTER TABLE `qlo_tax_rules_group`
  ADD PRIMARY KEY (`id_tax_rules_group`);

--
-- Indexes for table `qlo_tax_rules_group_shop`
--
ALTER TABLE `qlo_tax_rules_group_shop`
  ADD PRIMARY KEY (`id_tax_rules_group`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_theme`
--
ALTER TABLE `qlo_theme`
  ADD PRIMARY KEY (`id_theme`);

--
-- Indexes for table `qlo_theme_meta`
--
ALTER TABLE `qlo_theme_meta`
  ADD PRIMARY KEY (`id_theme_meta`),
  ADD UNIQUE KEY `id_theme_2` (`id_theme`,`id_meta`),
  ADD KEY `id_theme` (`id_theme`),
  ADD KEY `id_meta` (`id_meta`);

--
-- Indexes for table `qlo_theme_specific`
--
ALTER TABLE `qlo_theme_specific`
  ADD PRIMARY KEY (`id_theme`,`id_shop`,`entity`,`id_object`);

--
-- Indexes for table `qlo_timezone`
--
ALTER TABLE `qlo_timezone`
  ADD PRIMARY KEY (`id_timezone`);

--
-- Indexes for table `qlo_warehouse`
--
ALTER TABLE `qlo_warehouse`
  ADD PRIMARY KEY (`id_warehouse`);

--
-- Indexes for table `qlo_warehouse_carrier`
--
ALTER TABLE `qlo_warehouse_carrier`
  ADD PRIMARY KEY (`id_warehouse`,`id_carrier`),
  ADD KEY `id_warehouse` (`id_warehouse`),
  ADD KEY `id_carrier` (`id_carrier`);

--
-- Indexes for table `qlo_warehouse_product_location`
--
ALTER TABLE `qlo_warehouse_product_location`
  ADD PRIMARY KEY (`id_warehouse_product_location`),
  ADD UNIQUE KEY `id_product` (`id_product`,`id_product_attribute`,`id_warehouse`);

--
-- Indexes for table `qlo_warehouse_shop`
--
ALTER TABLE `qlo_warehouse_shop`
  ADD PRIMARY KEY (`id_warehouse`,`id_shop`),
  ADD KEY `id_warehouse` (`id_warehouse`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_webservice_account`
--
ALTER TABLE `qlo_webservice_account`
  ADD PRIMARY KEY (`id_webservice_account`),
  ADD KEY `key` (`key`);

--
-- Indexes for table `qlo_webservice_account_shop`
--
ALTER TABLE `qlo_webservice_account_shop`
  ADD PRIMARY KEY (`id_webservice_account`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `qlo_webservice_permission`
--
ALTER TABLE `qlo_webservice_permission`
  ADD PRIMARY KEY (`id_webservice_permission`),
  ADD UNIQUE KEY `resource_2` (`resource`,`method`,`id_webservice_account`),
  ADD KEY `resource` (`resource`),
  ADD KEY `method` (`method`),
  ADD KEY `id_webservice_account` (`id_webservice_account`);

--
-- Indexes for table `qlo_web_browser`
--
ALTER TABLE `qlo_web_browser`
  ADD PRIMARY KEY (`id_web_browser`);

--
-- Indexes for table `qlo_zone`
--
ALTER TABLE `qlo_zone`
  ADD PRIMARY KEY (`id_zone`);

--
-- Indexes for table `qlo_zone_shop`
--
ALTER TABLE `qlo_zone_shop`
  ADD PRIMARY KEY (`id_zone`,`id_shop`),
  ADD KEY `id_shop` (`id_shop`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `qlo_address`
--
ALTER TABLE `qlo_address`
  MODIFY `id_address` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `qlo_alias`
--
ALTER TABLE `qlo_alias`
  MODIFY `id_alias` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qlo_attachment`
--
ALTER TABLE `qlo_attachment`
  MODIFY `id_attachment` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_attachment_lang`
--
ALTER TABLE `qlo_attachment_lang`
  MODIFY `id_attachment` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_attribute`
--
ALTER TABLE `qlo_attribute`
  MODIFY `id_attribute` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_attribute_group`
--
ALTER TABLE `qlo_attribute_group`
  MODIFY `id_attribute_group` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_attribute_impact`
--
ALTER TABLE `qlo_attribute_impact`
  MODIFY `id_attribute_impact` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_carrier`
--
ALTER TABLE `qlo_carrier`
  MODIFY `id_carrier` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_cart`
--
ALTER TABLE `qlo_cart`
  MODIFY `id_cart` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_cart_rule`
--
ALTER TABLE `qlo_cart_rule`
  MODIFY `id_cart_rule` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_cart_rule_product_rule`
--
ALTER TABLE `qlo_cart_rule_product_rule`
  MODIFY `id_product_rule` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_cart_rule_product_rule_group`
--
ALTER TABLE `qlo_cart_rule_product_rule_group`
  MODIFY `id_product_rule_group` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_category`
--
ALTER TABLE `qlo_category`
  MODIFY `id_category` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `qlo_cms`
--
ALTER TABLE `qlo_cms`
  MODIFY `id_cms` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `qlo_cms_category`
--
ALTER TABLE `qlo_cms_category`
  MODIFY `id_cms_category` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_cms_category_shop`
--
ALTER TABLE `qlo_cms_category_shop`
  MODIFY `id_cms_category` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_cms_role`
--
ALTER TABLE `qlo_cms_role`
  MODIFY `id_cms_role` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_compare`
--
ALTER TABLE `qlo_compare`
  MODIFY `id_compare` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_configuration`
--
ALTER TABLE `qlo_configuration`
  MODIFY `id_configuration` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=408;

--
-- AUTO_INCREMENT for table `qlo_configuration_kpi`
--
ALTER TABLE `qlo_configuration_kpi`
  MODIFY `id_configuration_kpi` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `qlo_connections`
--
ALTER TABLE `qlo_connections`
  MODIFY `id_connections` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `qlo_connections_source`
--
ALTER TABLE `qlo_connections_source`
  MODIFY `id_connections_source` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_contact`
--
ALTER TABLE `qlo_contact`
  MODIFY `id_contact` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qlo_country`
--
ALTER TABLE `qlo_country`
  MODIFY `id_country` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `qlo_currency`
--
ALTER TABLE `qlo_currency`
  MODIFY `id_currency` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_customer`
--
ALTER TABLE `qlo_customer`
  MODIFY `id_customer` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_customer_guest_detail`
--
ALTER TABLE `qlo_customer_guest_detail`
  MODIFY `id_customer_guest_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_customer_message`
--
ALTER TABLE `qlo_customer_message`
  MODIFY `id_customer_message` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_customer_thread`
--
ALTER TABLE `qlo_customer_thread`
  MODIFY `id_customer_thread` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_customization`
--
ALTER TABLE `qlo_customization`
  MODIFY `id_customization` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_customization_field`
--
ALTER TABLE `qlo_customization_field`
  MODIFY `id_customization_field` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_date_range`
--
ALTER TABLE `qlo_date_range`
  MODIFY `id_date_range` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_delivery`
--
ALTER TABLE `qlo_delivery`
  MODIFY `id_delivery` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_employee`
--
ALTER TABLE `qlo_employee`
  MODIFY `id_employee` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_feature`
--
ALTER TABLE `qlo_feature`
  MODIFY `id_feature` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `qlo_feature_value`
--
ALTER TABLE `qlo_feature_value`
  MODIFY `id_feature_value` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `qlo_gender`
--
ALTER TABLE `qlo_gender`
  MODIFY `id_gender` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qlo_group`
--
ALTER TABLE `qlo_group`
  MODIFY `id_group` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `qlo_group_reduction`
--
ALTER TABLE `qlo_group_reduction`
  MODIFY `id_group_reduction` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_guest`
--
ALTER TABLE `qlo_guest`
  MODIFY `id_guest` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qlo_hook`
--
ALTER TABLE `qlo_hook`
  MODIFY `id_hook` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `qlo_hook_alias`
--
ALTER TABLE `qlo_hook_alias`
  MODIFY `id_hook_alias` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `qlo_hook_module_exceptions`
--
ALTER TABLE `qlo_hook_module_exceptions`
  MODIFY `id_hook_module_exceptions` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_htl_advance_payment`
--
ALTER TABLE `qlo_htl_advance_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `qlo_htl_bed_type`
--
ALTER TABLE `qlo_htl_bed_type`
  MODIFY `id_bed_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `qlo_htl_booking_demands`
--
ALTER TABLE `qlo_htl_booking_demands`
  MODIFY `id_booking_demand` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_booking_demands_tax`
--
ALTER TABLE `qlo_htl_booking_demands_tax`
  MODIFY `id_booking_demand` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_booking_detail`
--
ALTER TABLE `qlo_htl_booking_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_booking_document`
--
ALTER TABLE `qlo_htl_booking_document`
  MODIFY `id_htl_booking_document` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_branch_features`
--
ALTER TABLE `qlo_htl_branch_features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `qlo_htl_branch_info`
--
ALTER TABLE `qlo_htl_branch_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qlo_htl_branch_refund_rules`
--
ALTER TABLE `qlo_htl_branch_refund_rules`
  MODIFY `id_hotel_refund_rule` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_cart_booking_data`
--
ALTER TABLE `qlo_htl_cart_booking_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_custom_navigation_link`
--
ALTER TABLE `qlo_htl_custom_navigation_link`
  MODIFY `id_navigation_link` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `qlo_htl_features`
--
ALTER TABLE `qlo_htl_features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `qlo_htl_features_block_data`
--
ALTER TABLE `qlo_htl_features_block_data`
  MODIFY `id_features_block` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qlo_htl_footer_payment_block_info`
--
ALTER TABLE `qlo_htl_footer_payment_block_info`
  MODIFY `id_payment_block` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qlo_htl_image`
--
ALTER TABLE `qlo_htl_image`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `qlo_htl_interior_image`
--
ALTER TABLE `qlo_htl_interior_image`
  MODIFY `id_interior_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `qlo_htl_order_refund_rules`
--
ALTER TABLE `qlo_htl_order_refund_rules`
  MODIFY `id_refund_rule` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_order_restrict_date`
--
ALTER TABLE `qlo_htl_order_restrict_date`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qlo_htl_room_block_data`
--
ALTER TABLE `qlo_htl_room_block_data`
  MODIFY `id_room_block` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qlo_htl_room_disable_dates`
--
ALTER TABLE `qlo_htl_room_disable_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_room_information`
--
ALTER TABLE `qlo_htl_room_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `qlo_htl_room_status`
--
ALTER TABLE `qlo_htl_room_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_room_type`
--
ALTER TABLE `qlo_htl_room_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `qlo_htl_room_type_bed_type`
--
ALTER TABLE `qlo_htl_room_type_bed_type`
  MODIFY `id_room_type_bed_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `qlo_htl_room_type_demand`
--
ALTER TABLE `qlo_htl_room_type_demand`
  MODIFY `id_room_type_demand` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_room_type_demand_price`
--
ALTER TABLE `qlo_htl_room_type_demand_price`
  MODIFY `id_room_type_demand_price` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_room_type_feature_pricing`
--
ALTER TABLE `qlo_htl_room_type_feature_pricing`
  MODIFY `id_feature_price` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_room_type_feature_pricing_restriction`
--
ALTER TABLE `qlo_htl_room_type_feature_pricing_restriction`
  MODIFY `id_feature_price_restriction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_room_type_global_demand`
--
ALTER TABLE `qlo_htl_room_type_global_demand`
  MODIFY `id_global_demand` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_room_type_global_demand_advance_option`
--
ALTER TABLE `qlo_htl_room_type_global_demand_advance_option`
  MODIFY `id_option` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_room_type_restriction_date_range`
--
ALTER TABLE `qlo_htl_room_type_restriction_date_range`
  MODIFY `id_rt_restriction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_htl_room_type_service_product`
--
ALTER TABLE `qlo_htl_room_type_service_product`
  MODIFY `id_room_type_service_product` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `qlo_htl_room_type_service_product_price`
--
ALTER TABLE `qlo_htl_room_type_service_product_price`
  MODIFY `id_room_type_service_product_price` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `qlo_htl_settings_link`
--
ALTER TABLE `qlo_htl_settings_link`
  MODIFY `id_settings_link` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `qlo_htl_testimonials_block_data`
--
ALTER TABLE `qlo_htl_testimonials_block_data`
  MODIFY `id_testimonial_block` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `qlo_image`
--
ALTER TABLE `qlo_image`
  MODIFY `id_image` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `qlo_image_type`
--
ALTER TABLE `qlo_image_type`
  MODIFY `id_image_type` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `qlo_import_match`
--
ALTER TABLE `qlo_import_match`
  MODIFY `id_import_match` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_lang`
--
ALTER TABLE `qlo_lang`
  MODIFY `id_lang` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_log`
--
ALTER TABLE `qlo_log`
  MODIFY `id_log` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `qlo_mail`
--
ALTER TABLE `qlo_mail`
  MODIFY `id_mail` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_maintenance_access`
--
ALTER TABLE `qlo_maintenance_access`
  MODIFY `id_maintenance_access` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_manufacturer`
--
ALTER TABLE `qlo_manufacturer`
  MODIFY `id_manufacturer` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_memcached_servers`
--
ALTER TABLE `qlo_memcached_servers`
  MODIFY `id_memcached_server` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_message`
--
ALTER TABLE `qlo_message`
  MODIFY `id_message` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_meta`
--
ALTER TABLE `qlo_meta`
  MODIFY `id_meta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `qlo_module`
--
ALTER TABLE `qlo_module`
  MODIFY `id_module` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `qlo_modules_perfs`
--
ALTER TABLE `qlo_modules_perfs`
  MODIFY `id_modules_perfs` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_module_preference`
--
ALTER TABLE `qlo_module_preference`
  MODIFY `id_module_preference` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_newsletter`
--
ALTER TABLE `qlo_newsletter`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_operating_system`
--
ALTER TABLE `qlo_operating_system`
  MODIFY `id_operating_system` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `qlo_orders`
--
ALTER TABLE `qlo_orders`
  MODIFY `id_order` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_carrier`
--
ALTER TABLE `qlo_order_carrier`
  MODIFY `id_order_carrier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_cart_rule`
--
ALTER TABLE `qlo_order_cart_rule`
  MODIFY `id_order_cart_rule` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_customer_guest_detail`
--
ALTER TABLE `qlo_order_customer_guest_detail`
  MODIFY `id_order_customer_guest_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_detail`
--
ALTER TABLE `qlo_order_detail`
  MODIFY `id_order_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_history`
--
ALTER TABLE `qlo_order_history`
  MODIFY `id_order_history` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_invoice`
--
ALTER TABLE `qlo_order_invoice`
  MODIFY `id_order_invoice` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_message`
--
ALTER TABLE `qlo_order_message`
  MODIFY `id_order_message` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_payment`
--
ALTER TABLE `qlo_order_payment`
  MODIFY `id_order_payment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_payment_detail`
--
ALTER TABLE `qlo_order_payment_detail`
  MODIFY `id_order_payment_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_return`
--
ALTER TABLE `qlo_order_return`
  MODIFY `id_order_return` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_return_detail`
--
ALTER TABLE `qlo_order_return_detail`
  MODIFY `id_order_return_detail` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_return_state`
--
ALTER TABLE `qlo_order_return_state`
  MODIFY `id_order_return_state` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `qlo_order_slip`
--
ALTER TABLE `qlo_order_slip`
  MODIFY `id_order_slip` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_order_state`
--
ALTER TABLE `qlo_order_state`
  MODIFY `id_order_state` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `qlo_page`
--
ALTER TABLE `qlo_page`
  MODIFY `id_page` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qlo_pagenotfound`
--
ALTER TABLE `qlo_pagenotfound`
  MODIFY `id_pagenotfound` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `qlo_page_type`
--
ALTER TABLE `qlo_page_type`
  MODIFY `id_page_type` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qlo_product`
--
ALTER TABLE `qlo_product`
  MODIFY `id_product` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `qlo_product_attribute`
--
ALTER TABLE `qlo_product_attribute`
  MODIFY `id_product_attribute` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_product_download`
--
ALTER TABLE `qlo_product_download`
  MODIFY `id_product_download` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_product_option`
--
ALTER TABLE `qlo_product_option`
  MODIFY `id_product_option` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_product_supplier`
--
ALTER TABLE `qlo_product_supplier`
  MODIFY `id_product_supplier` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_profile`
--
ALTER TABLE `qlo_profile`
  MODIFY `id_profile` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_qcmc_channel_manager_booking`
--
ALTER TABLE `qlo_qcmc_channel_manager_booking`
  MODIFY `id_channel_manager_booking` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_qhr_category`
--
ALTER TABLE `qlo_qhr_category`
  MODIFY `id_category` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qlo_qhr_hotel_review`
--
ALTER TABLE `qlo_qhr_hotel_review`
  MODIFY `id_hotel_review` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_qhr_review_reply`
--
ALTER TABLE `qlo_qhr_review_reply`
  MODIFY `id_review_reply` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_quick_access`
--
ALTER TABLE `qlo_quick_access`
  MODIFY `id_quick_access` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qlo_range_price`
--
ALTER TABLE `qlo_range_price`
  MODIFY `id_range_price` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_range_weight`
--
ALTER TABLE `qlo_range_weight`
  MODIFY `id_range_weight` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_referrer`
--
ALTER TABLE `qlo_referrer`
  MODIFY `id_referrer` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_referrer_shop`
--
ALTER TABLE `qlo_referrer_shop`
  MODIFY `id_referrer` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_request_sql`
--
ALTER TABLE `qlo_request_sql`
  MODIFY `id_request_sql` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_required_field`
--
ALTER TABLE `qlo_required_field`
  MODIFY `id_required_field` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_risk`
--
ALTER TABLE `qlo_risk`
  MODIFY `id_risk` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `qlo_scene`
--
ALTER TABLE `qlo_scene`
  MODIFY `id_scene` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_search_engine`
--
ALTER TABLE `qlo_search_engine`
  MODIFY `id_search_engine` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `qlo_search_word`
--
ALTER TABLE `qlo_search_word`
  MODIFY `id_word` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1049;

--
-- AUTO_INCREMENT for table `qlo_sekeyword`
--
ALTER TABLE `qlo_sekeyword`
  MODIFY `id_sekeyword` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_service_product_cart_detail`
--
ALTER TABLE `qlo_service_product_cart_detail`
  MODIFY `id_service_product_cart_detail` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_service_product_order_detail`
--
ALTER TABLE `qlo_service_product_order_detail`
  MODIFY `id_service_product_order_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_shop`
--
ALTER TABLE `qlo_shop`
  MODIFY `id_shop` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_shop_group`
--
ALTER TABLE `qlo_shop_group`
  MODIFY `id_shop_group` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_shop_url`
--
ALTER TABLE `qlo_shop_url`
  MODIFY `id_shop_url` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_specific_price`
--
ALTER TABLE `qlo_specific_price`
  MODIFY `id_specific_price` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_specific_price_priority`
--
ALTER TABLE `qlo_specific_price_priority`
  MODIFY `id_specific_price_priority` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `qlo_specific_price_rule`
--
ALTER TABLE `qlo_specific_price_rule`
  MODIFY `id_specific_price_rule` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_specific_price_rule_condition`
--
ALTER TABLE `qlo_specific_price_rule_condition`
  MODIFY `id_specific_price_rule_condition` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_specific_price_rule_condition_group`
--
ALTER TABLE `qlo_specific_price_rule_condition_group`
  MODIFY `id_specific_price_rule_condition_group` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_state`
--
ALTER TABLE `qlo_state`
  MODIFY `id_state` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT for table `qlo_stock`
--
ALTER TABLE `qlo_stock`
  MODIFY `id_stock` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_stock_available`
--
ALTER TABLE `qlo_stock_available`
  MODIFY `id_stock_available` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `qlo_stock_mvt`
--
ALTER TABLE `qlo_stock_mvt`
  MODIFY `id_stock_mvt` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_stock_mvt_reason`
--
ALTER TABLE `qlo_stock_mvt_reason`
  MODIFY `id_stock_mvt_reason` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `qlo_store`
--
ALTER TABLE `qlo_store`
  MODIFY `id_store` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_supplier`
--
ALTER TABLE `qlo_supplier`
  MODIFY `id_supplier` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_supply_order`
--
ALTER TABLE `qlo_supply_order`
  MODIFY `id_supply_order` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_supply_order_detail`
--
ALTER TABLE `qlo_supply_order_detail`
  MODIFY `id_supply_order_detail` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_supply_order_history`
--
ALTER TABLE `qlo_supply_order_history`
  MODIFY `id_supply_order_history` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_supply_order_receipt_history`
--
ALTER TABLE `qlo_supply_order_receipt_history`
  MODIFY `id_supply_order_receipt_history` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_supply_order_state`
--
ALTER TABLE `qlo_supply_order_state`
  MODIFY `id_supply_order_state` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `qlo_tab`
--
ALTER TABLE `qlo_tab`
  MODIFY `id_tab` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `qlo_tab_module_preference`
--
ALTER TABLE `qlo_tab_module_preference`
  MODIFY `id_tab_module_preference` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_tag`
--
ALTER TABLE `qlo_tag`
  MODIFY `id_tag` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_tax`
--
ALTER TABLE `qlo_tax`
  MODIFY `id_tax` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `qlo_tax_rule`
--
ALTER TABLE `qlo_tax_rule`
  MODIFY `id_tax_rule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `qlo_tax_rules_group`
--
ALTER TABLE `qlo_tax_rules_group`
  MODIFY `id_tax_rules_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `qlo_theme`
--
ALTER TABLE `qlo_theme`
  MODIFY `id_theme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_theme_meta`
--
ALTER TABLE `qlo_theme_meta`
  MODIFY `id_theme_meta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `qlo_timezone`
--
ALTER TABLE `qlo_timezone`
  MODIFY `id_timezone` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=561;

--
-- AUTO_INCREMENT for table `qlo_warehouse`
--
ALTER TABLE `qlo_warehouse`
  MODIFY `id_warehouse` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_warehouse_product_location`
--
ALTER TABLE `qlo_warehouse_product_location`
  MODIFY `id_warehouse_product_location` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qlo_webservice_account`
--
ALTER TABLE `qlo_webservice_account`
  MODIFY `id_webservice_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `qlo_webservice_permission`
--
ALTER TABLE `qlo_webservice_permission`
  MODIFY `id_webservice_permission` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=380;

--
-- AUTO_INCREMENT for table `qlo_web_browser`
--
ALTER TABLE `qlo_web_browser`
  MODIFY `id_web_browser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `qlo_zone`
--
ALTER TABLE `qlo_zone`
  MODIFY `id_zone` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
