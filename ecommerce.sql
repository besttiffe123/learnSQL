-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2026 at 11:11 AM
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
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `1.	devices`
--

CREATE TABLE `1.	devices` (
  `device_id` int(10) NOT NULL,
  `device_name` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `device_type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `1.	devices`
--

INSERT INTO `1.	devices` (`device_id`, `device_name`, `ip_address`, `device_type`, `status`) VALUES
(1001, 'เครือข่าย', '202.158.112.21', 'เร้าเตอร์', 'ออนไลน์');

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `alert_id` int(10) NOT NULL,
  `device_id` int(10) NOT NULL,
  `alert_type` varchar(255) NOT NULL,
  `severity` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`alert_id`, `device_id`, `alert_type`, `severity`, `created_at`) VALUES
(3001, 1001, 'High Traffic', 'Low', '2026-09-24 07:56:19'),
(3002, 1002, 'High Traffic', 'Medium', '2026-09-24 08:15:34'),
(3003, 1003, 'High CPU', 'Low', '2026-09-24 08:15:34'),
(3004, 1004, 'Device Offline', 'Critical', '2026-09-24 08:15:34'),
(3005, 1005, 'High CPU', 'High', '2026-09-24 08:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `device_id` int(10) NOT NULL,
  `device_name` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `device_type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`device_id`, `device_name`, `ip_address`, `device_type`, `status`) VALUES
(1001, 'เครื่อข่าย', '202.158.112.21', 'เร้าเตอร์', 'ออนไลน์'),
(1002, 'เครื่อข่าย', '198.143.147.32', 'เซิฟเวอร์', 'ออฟไลน์'),
(1003, 'เครื่อข่าย', '172.147.147.20', 'สวิตซ์', 'ซ่อมแซม'),
(1004, 'เครื่อข่าย', '194.174.147.10', 'สวิตซ์', 'ออฟไลน์'),
(1005, 'เครื่อข่าย', '207.195.147.10', 'เร้าเตอร์', 'ออนไลน์'),
(1006, 'เครื่อข่าย', '207.195.157.10', 'เซิฟเวอร์', 'ออฟไลน์'),
(1007, 'เครื่อข่าย', '207.155.157.10', 'สวิตซ์', 'ออนไลน์'),
(1008, 'เครื่อข่าย', '207.185.153.10', 'เร้าเตอร์', 'ซ่อมแซม'),
(1009, 'เครื่อข่าย', '209.195.157.10', 'เซิฟเวอร์', 'ออฟไลน์'),
(1010, 'เครื่อข่าย', '186.155.157.10', 'สวิตซ์', 'ออนไลน์');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `stock`, `created_at`) VALUES
(1, 'Laptop', 1200.50, 10, '2026-09-24 06:52:33'),
(2, 'mouse', 25.99, 50, '2026-09-24 06:52:33'),
(3, 'keyboard', 45.00, 30, '2026-09-24 06:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `traffic_logs`
--

CREATE TABLE `traffic_logs` (
  `log_id` int(10) NOT NULL,
  `device_id` int(10) NOT NULL,
  `bytes_sent` int(10) NOT NULL,
  `bytes_received` int(10) NOT NULL,
  `cpu_usage` decimal(5,2) NOT NULL,
  `logged_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `traffic_logs`
--

INSERT INTO `traffic_logs` (`log_id`, `device_id`, `bytes_sent`, `bytes_received`, `cpu_usage`, `logged_at`) VALUES
(2001, 1001, 10, 10, 44.00, '2026-09-24 07:55:20'),
(2002, 1002, 10, 10, 15.00, '2026-09-24 08:04:55'),
(2003, 1003, 10, 10, 25.00, '2026-09-24 08:06:08'),
(2004, 1004, 10, 10, 32.00, '2026-09-24 08:07:14'),
(2005, 1005, 10, 10, 56.00, '2026-09-24 08:08:15'),
(2006, 1006, 10, 10, 61.00, '2026-09-24 08:11:54'),
(2007, 1007, 10, 10, 69.00, '2026-09-24 08:12:50'),
(2008, 1008, 10, 10, 78.00, '2026-09-24 08:12:50'),
(2009, 1009, 10, 10, 86.00, '2026-09-24 08:12:50'),
(2010, 1010, 10, 10, 90.00, '2026-09-24 08:12:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `1.	devices`
--
ALTER TABLE `1.	devices`
  ADD PRIMARY KEY (`device_id`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`alert_id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`device_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `traffic_logs`
--
ALTER TABLE `traffic_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `device_id` (`device_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `traffic_logs`
--
ALTER TABLE `traffic_logs`
  ADD CONSTRAINT `device_id` FOREIGN KEY (`device_id`) REFERENCES `devices` (`device_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
