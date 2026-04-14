-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2026 at 12:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `isp_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_name` varchar(150) NOT NULL,
  `asset_tag` varchar(50) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(12,2) DEFAULT NULL,
  `status` enum('available','assigned','maintenance','retired') NOT NULL DEFAULT 'available',
  `assigned_to_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets_items`
--

CREATE TABLE `assets_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_tag` varchar(60) NOT NULL,
  `asset_name` varchar(180) NOT NULL,
  `type_name` varchar(80) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_value` decimal(14,2) NOT NULL DEFAULT 0.00,
  `assigned_to_name` varchar(140) DEFAULT NULL,
  `status_label` enum('active','assigned','repair','spare','retired') NOT NULL DEFAULT 'active',
  `notes` text DEFAULT NULL,
  `created_by_employee_id` int(11) DEFAULT NULL,
  `assigned_to_employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assets_items`
--

INSERT INTO `assets_items` (`id`, `asset_tag`, `asset_name`, `type_name`, `purchase_date`, `purchase_value`, `assigned_to_name`, `status_label`, `notes`, `created_by_employee_id`, `assigned_to_employee_id`, `created_at`, `updated_at`) VALUES
(1, 'AST-DMY-LT-001', 'Lenovo ThinkPad Dummy', 'Laptop', '2025-11-28', 78000.00, 'Admin / Director Dummy', 'assigned', 'Dummy asset for testing assignment flow', 37, 38, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(2, 'AST-DMY-UPS-002', 'Network UPS Dummy', 'Power', '2026-01-07', 24000.00, 'NOC Room', 'active', 'Dummy backup power asset', 37, 38, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(3, 'AST-BULK-001', 'Dummy Asset 1', 'Router', '2026-03-07', 16200.00, 'Store Room', 'assigned', 'Bulk dummy asset seed #1', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(4, 'AST-BULK-002', 'Dummy Asset 2', 'Laptop', '2026-03-06', 17400.00, 'Admin / Director Dummy', 'repair', 'Bulk dummy asset seed #2', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(5, 'AST-BULK-003', 'Dummy Asset 3', 'Router', '2026-03-05', 18600.00, 'Store Room', 'spare', 'Bulk dummy asset seed #3', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(6, 'AST-BULK-004', 'Dummy Asset 4', 'Laptop', '2026-03-04', 19800.00, 'Admin / Director Dummy', 'retired', 'Bulk dummy asset seed #4', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(7, 'AST-BULK-005', 'Dummy Asset 5', 'Router', '2026-03-03', 21000.00, 'Store Room', 'active', 'Bulk dummy asset seed #5', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(8, 'AST-BULK-006', 'Dummy Asset 6', 'Laptop', '2026-03-02', 22200.00, 'Admin / Director Dummy', 'assigned', 'Bulk dummy asset seed #6', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(9, 'AST-BULK-007', 'Dummy Asset 7', 'Router', '2026-03-01', 23400.00, 'Store Room', 'repair', 'Bulk dummy asset seed #7', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(10, 'AST-BULK-008', 'Dummy Asset 8', 'Laptop', '2026-02-28', 24600.00, 'Admin / Director Dummy', 'spare', 'Bulk dummy asset seed #8', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(11, 'AST-BULK-009', 'Dummy Asset 9', 'Router', '2026-02-27', 25800.00, 'Store Room', 'retired', 'Bulk dummy asset seed #9', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(12, 'AST-BULK-010', 'Dummy Asset 10', 'Laptop', '2026-02-26', 27000.00, 'Admin / Director Dummy', 'active', 'Bulk dummy asset seed #10', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(13, 'AST-BULK-011', 'Dummy Asset 11', 'Router', '2026-02-25', 28200.00, 'Store Room', 'assigned', 'Bulk dummy asset seed #11', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(14, 'AST-BULK-012', 'Dummy Asset 12', 'Laptop', '2026-02-24', 29400.00, 'Admin / Director Dummy', 'repair', 'Bulk dummy asset seed #12', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('present','absent','leave') NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `check_in_at` datetime DEFAULT NULL,
  `check_out_at` datetime DEFAULT NULL,
  `source_label` varchar(30) NOT NULL DEFAULT 'manual',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `attendance_date`, `status`, `remarks`, `check_in_at`, `check_out_at`, `source_label`, `created_at`, `updated_at`) VALUES
(3, 59, '2026-04-11', 'present', 'Biometric verified', '2026-04-11 11:49:37', '2026-04-11 18:50:25', 'fingerprint', '2026-04-11 09:49:37', '2026-04-11 16:50:25'),
(5, 151, '2026-04-11', 'present', 'Biometric verified', '2026-04-11 14:34:04', NULL, 'fingerprint', '2026-04-11 12:34:04', '2026-04-11 12:34:04'),
(6, 59, '2026-04-12', 'present', 'Biometric verified', '2026-04-12 16:50:39', '2026-04-12 16:51:39', 'fingerprint', '2026-04-12 14:50:39', '2026-04-12 14:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `bandwidth_purchases`
--

CREATE TABLE `bandwidth_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_name` varchar(120) NOT NULL,
  `purchase_date` date NOT NULL,
  `bandwidth_mbps` int(10) UNSIGNED NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_code` varchar(30) NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `address_line` varchar(255) NOT NULL,
  `road_no` varchar(50) DEFAULT NULL,
  `ward` varchar(50) DEFAULT NULL,
  `zone_name` varchar(50) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `connection_username` varchar(120) DEFAULT NULL,
  `connection_email` varchar(180) DEFAULT NULL,
  `connection_password_hash` varchar(255) DEFAULT NULL,
  `portal_last_login_at` datetime DEFAULT NULL,
  `portal_login_count` int(11) NOT NULL DEFAULT 0,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_to_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `connection_start_date` date NOT NULL,
  `payment_cycle` enum('monthly','quarterly','yearly') NOT NULL DEFAULT 'monthly',
  `status` enum('active','disconnected','paused') NOT NULL DEFAULT 'active',
  `left_date` date DEFAULT NULL,
  `left_reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `onu_mac` varchar(50) DEFAULT NULL,
  `router_ip` varchar(50) DEFAULT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `connection_type` varchar(50) DEFAULT NULL,
  `referral_name` varchar(100) DEFAULT NULL,
  `emergency_contact` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `payment_cycle_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `client_code`, `full_name`, `address_line`, `road_no`, `ward`, `zone_name`, `phone`, `email`, `connection_username`, `connection_email`, `connection_password_hash`, `portal_last_login_at`, `portal_login_count`, `package_id`, `created_by_employee_id`, `assigned_to_employee_id`, `connection_start_date`, `payment_cycle`, `status`, `left_date`, `left_reason`, `created_at`, `updated_at`, `onu_mac`, `router_ip`, `nid`, `birth_date`, `connection_type`, `referral_name`, `emergency_contact`, `notes`, `payment_cycle_date`) VALUES
(1, 'CL-0001', 'Rahim Uddin', '01710000001, Uttara, Dhaka', 'ROAD-01', 'WARD-1', 'ZONE-A', '01710000001', 'client01@example.test', 'user01', 'client01@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', NULL, 0, 1, 37, 37, '2026-03-19', 'monthly', 'paused', '2026-04-05', 'relocation', '2026-03-28 14:07:48', '2026-04-04 12:38:21', 'AA:BB:CC:DD:EE:01', '192.168.1.101', '1999900000001', '1996-01-01', 'Home', 'Referral 1', '01890000001', 'Dummy seeded client for testing', 1),
(2, 'CL-0002', 'Karim Hossain', '01710000002, Mirpur, Dhaka', 'ROAD-02', 'WARD-2', 'ZONE-B', '01710000002', 'client02@example.test', 'user02', 'client02@client.test', '$2y$10$1ggjrz0ND1a8AbavgIXrUew5dFjEY.pqs91JzNLi0Juldt/01Hi7S', '2026-04-04 18:33:29', 5, 2, 37, 38, '2026-03-20', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-04-11 12:57:54', 'AA:BB:CC:DD:EE:02', '192.168.1.102', '1999900000002', '1996-01-02', 'Home', 'Referral 2', '01890000002', 'Dummy seeded client for testing', 2),
(3, 'CL-0003', 'Nadia Akter', '01710000003, Banani, Dhaka', 'ROAD-03', 'WARD-3', 'ZONE-C', '01710000003', 'client03@example.test', 'user03', 'client03@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', '2026-04-04 18:39:35', 1, 3, 37, 39, '2026-03-21', 'monthly', 'disconnected', '2026-04-05', 'service', '2026-03-28 14:07:48', '2026-04-04 12:40:21', 'AA:BB:CC:DD:EE:03', '192.168.1.103', '1999900000003', '1996-01-03', 'Home', 'Referral 3', '01890000003', 'Dummy seeded client for testing', 3),
(4, 'CL-0004', 'Sadia Sultana', '01710000004, Mohakhali, Dhaka', 'ROAD-04', 'WARD-4', 'ZONE-A', '01710000004', 'client04@example.test', 'user04', 'client04@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', NULL, 0, 1, 37, 37, '2026-03-22', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:04', '192.168.1.104', '1999900000004', '1996-01-04', 'Home', 'Referral 4', '01890000004', 'Dummy seeded client for testing', 4),
(5, 'CL-0005', 'Jahid Hasan', '01710000005, Rampura, Dhaka', 'ROAD-05', 'WARD-5', 'ZONE-B', '01710000005', 'client05@example.test', 'user05', 'client05@client.test', '$2y$10$SwS.z49YY7unFm80ke8gceUdjfNDOQBHBvmuR.foTzbvjnRcr3J7i', '2026-04-11 17:24:16', 6, 2, 37, 38, '2026-03-23', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-04-11 11:24:16', 'AA:BB:CC:DD:EE:05', '192.168.1.105', '1999900000005', '1996-01-05', 'Home', 'Referral 5', '01890000005', 'Dummy seeded client for testing', 5),
(6, 'CL-0006', 'Mim Islam', '01710000006, Bashundhara, Dhaka', 'ROAD-06', 'WARD-6', 'ZONE-C', '01710000006', 'client06@example.test', 'user06', 'client06@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', '2026-04-11 17:25:25', 1, 3, 37, 39, '2026-03-24', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-04-11 11:25:25', 'AA:BB:CC:DD:EE:06', '192.168.1.106', '1999900000006', '1996-01-06', 'Home', 'Referral 6', '01890000006', 'Dummy seeded client for testing', 6),
(7, 'CL-0007', 'Tanvir Ahmed', '01710000007, Dhanmondi, Dhaka', 'ROAD-07', 'WARD-7', 'ZONE-A', '01710000007', 'client07@example.test', 'user07', 'client07@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', '2026-04-11 17:27:02', 6, 1, 37, 37, '2026-03-25', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-04-11 11:27:02', 'AA:BB:CC:DD:EE:07', '192.168.1.107', '1999900000007', '1996-01-07', 'Home', 'Referral 7', '01890000007', 'Dummy seeded client for testing', 7),
(8, 'CL-0008', 'Ritu Akter', '01710000008, Jatrabari, Dhaka', 'ROAD-08', 'WARD-8', 'ZONE-B', '01710000008', 'client08@example.test', 'user08', 'client08@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', NULL, 0, 2, 37, 38, '2026-03-26', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:08', '192.168.1.108', '1999900000008', '1996-01-08', 'Home', 'Referral 8', '01890000008', 'Dummy seeded client for testing', 8),
(9, 'CL-0009', 'Sabbir Khan', '01710000009, Wari, Dhaka', 'ROAD-09', 'WARD-9', 'ZONE-C', '01710000009', 'client09@example.test', 'user09', 'client09@client.test', '$2y$10$fbmTtUIWI2vaCmqoktATdOw5pzcNYUI0sqgMkCJalWTXBtZeG4kim', NULL, 0, 3, 37, 39, '2026-03-27', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-04-04 12:38:00', 'AA:BB:CC:DD:EE:09', '192.168.1.109', '1999900000009', '1996-01-09', 'Home', 'Referral 9', '01890000009', 'Dummy seeded client for testing', 9),
(10, 'CL-0010', 'Sharmin Nahar', '01710000010, Shyamoli, Dhaka', 'ROAD-10', 'WARD-10', 'ZONE-A', '01710000010', 'client10@example.test', 'user10', 'client10@client.test', '$2y$10$MM439IoAvO5D34/A23JDAeqTYaGEyTNT5uCyfmcslnYk7fqY1t5Qq', NULL, 0, 1, 37, 37, '2026-03-28', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-04-11 15:19:20', 'AA:BB:CC:DD:EE:0a', '192.168.1.110', '1999900000010', '1996-01-10', 'Home', 'Referral 10', '01890000010', 'Dummy seeded client for testing', 10),
(11, 'pic2026001', 'Abdul Miah', 'Khilgaon,Dhaka-1219', '1219', 'Dhaka', 'Dhaka', '01756202157', 'abdul@gmail.com', 'abdulmiah', 'abdulmiah@client.promee.internet', '$2y$10$YVk5WiPWaLPnF0bNhxsCS.xHpwaBXAz1wm7WHe0.wsSw6h3sHR.Ie', '2026-04-11 21:11:26', 6, 3, 162, 162, '2026-04-12', 'monthly', 'disconnected', '2026-04-30', 'price', '2026-04-11 13:39:16', '2026-04-11 15:14:33', '11.2333.2323.231', '192.169.00.0', '31321323123', '2026-04-01', 'fiber', 'fdsfd', '3423', 'sdadad', 1),
(12, 'pic2026002', 'MD Akon', 'Khilgaon,Dhaka-1219', '1219', 'Dhaka', 'Dhaka', '0175620215721321', 'akon@gmail.com', 'akon', 'akon@client.promee.internet', '$2y$10$00pzGIUnREYKNZQbtLQhFeedKZ6JqvrtKoKTQYWXt2sA54NQkTxga', '2026-04-14 04:35:11', 7, 3, 59, 59, '2026-04-15', 'monthly', 'active', NULL, NULL, '2026-04-12 14:25:57', '2026-04-13 22:35:11', '11:56::89:89', '192.168.1.0', '313213213', '2026-04-01', 'fiber', 'fdsfd', '3423', 'sadsa', 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_connection_requests`
--

CREATE TABLE `client_connection_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_code` varchar(40) NOT NULL,
  `client_name` varchar(150) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `email` varchar(180) DEFAULT NULL,
  `address_line` varchar(255) NOT NULL,
  `package_slug` varchar(40) NOT NULL,
  `package_name` varchar(120) NOT NULL,
  `connection_type` varchar(40) NOT NULL,
  `preferred_date` date NOT NULL,
  `preferred_time` varchar(40) NOT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'pending',
  `created_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_to_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_connection_requests`
--

INSERT INTO `client_connection_requests` (`id`, `request_code`, `client_name`, `phone`, `email`, `address_line`, `package_slug`, `package_name`, `connection_type`, `preferred_date`, `preferred_time`, `notes`, `status`, `created_by_employee_id`, `assigned_to_employee_id`, `created_at`, `updated_at`) VALUES
(1, 'NRQ-202604-0001', 'Joy Client Reques', '213213123', 'srejonjoy@gmail.com', 'Khilgaon,Dhaka-1219', 'basic', 'Basic - 5 Mbps', 'fiber', '2026-04-05', 'morning', 'Do asap', 'scheduled', 37, 57, '2026-04-04 11:37:19', '2026-04-04 12:07:12'),
(2, 'NRQ-202604-0002', 'Abdul', '012321321', 'abdul@gmail.com', 'Khilgaon,Dhaka-1219', 'turbo100-100-mbps', 'Turbo100 - 100 Mbps', 'fiber', '2026-04-12', 'morning', 'Do necessary updates', 'scheduled', 162, 166, '2026-04-11 12:59:43', '2026-04-12 14:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `client_portal_payments`
--

CREATE TABLE `client_portal_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `payslip_no` varchar(40) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `receiver_account` varchar(40) NOT NULL,
  `payer_reference` varchar(120) DEFAULT NULL,
  `billing_month` char(7) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'pending_confirmation',
  `message` varchar(255) NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `invoice_generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_portal_payments`
--

INSERT INTO `client_portal_payments` (`id`, `client_id`, `payslip_no`, `payment_method`, `receiver_account`, `payer_reference`, `billing_month`, `amount`, `status`, `message`, `invoice_id`, `approved_by_employee_id`, `approved_at`, `invoice_generated_at`, `created_at`) VALUES
(1, 11, 'PSL-202604-C710', 'bkash', '01756202157', '01756202157 / 20215723123123', '2026-04', 1400.00, 'paid_confirmed', 'Payment confirmed and collected. Invoice settled.', 1, 151, '2026-04-11 20:43:26', '2026-04-11 20:43:29', '2026-04-11 13:42:50'),
(2, 12, 'PSL-202604-E7E5', 'bkash', '01756202157', '01756202157 / 12313123', '2026-04', 1400.00, 'paid_confirmed', 'Payment confirmed and collected. Invoice settled.', 2, 59, '2026-04-12 20:31:55', '2026-04-12 20:32:02', '2026-04-12 14:27:54'),
(3, 12, 'PSL-202604-6F19', 'nagad', '01756202157', '231232131 / 20215723123123', '2026-04', 2200.00, 'paid_confirmed', 'Payment confirmed and collected. Invoice settled.', 3, 59, '2026-04-14 04:34:00', '2026-04-14 04:34:01', '2026-04-13 22:32:57'),
(4, 12, 'PSL-202604-FC00', 'card', '123123321312', 'SADsada / ****3213', '2026-04', 2200.00, 'paid_confirmed', 'Payment confirmed and collected. Invoice settled.', 4, 59, '2026-04-14 04:36:35', '2026-04-14 04:36:35', '2026-04-13 22:35:35');

-- --------------------------------------------------------

--
-- Table structure for table `client_portal_settings`
--

CREATE TABLE `client_portal_settings` (
  `setting_key` varchar(80) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `updated_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_portal_settings`
--

INSERT INTO `client_portal_settings` (`setting_key`, `setting_value`, `updated_by_employee_id`, `updated_at`) VALUES
('access_hours', '24/7', 37, '2026-04-04 12:29:51'),
('email_notifications', '1', 37, '2026-04-04 12:29:51'),
('lockout_duration', '15', 37, '2026-04-04 12:29:51'),
('max_attempts', '5', 37, '2026-04-04 12:29:51'),
('payment_reminders', '1', 37, '2026-04-04 12:29:51'),
('portal_enabled', '0', 37, '2026-04-04 12:29:51'),
('self_registration', '1', 37, '2026-04-04 12:29:51'),
('session_timeout', '30', 37, '2026-04-04 12:29:51'),
('sms_notifications', '0', 37, '2026-04-04 12:29:51'),
('strong_passwords', '1', 37, '2026-04-04 12:29:51'),
('two_factor', '0', 37, '2026-04-04 12:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `client_portal_tickets`
--

CREATE TABLE `client_portal_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_no` varchar(40) NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_to_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `priority` enum('low','medium','high','critical') NOT NULL DEFAULT 'medium',
  `status` enum('pending','in_progress','resolved','closed') NOT NULL DEFAULT 'pending',
  `admin_remarks` varchar(255) DEFAULT NULL,
  `attachment_name` varchar(255) DEFAULT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `attachment_mime` varchar(120) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_portal_tickets`
--

INSERT INTO `client_portal_tickets` (`id`, `ticket_no`, `client_id`, `created_by_employee_id`, `assigned_to_employee_id`, `category`, `description`, `priority`, `status`, `admin_remarks`, `attachment_name`, `attachment_path`, `attachment_mime`, `created_at`, `updated_at`) VALUES
(1, 'TK-20260411-1726', 11, NULL, 169, 'Connection Issue', 'asdasdasd', 'high', 'closed', 'DOne', NULL, NULL, NULL, '2026-04-11 21:04:55', '2026-04-11 21:09:08'),
(2, 'TK-20260412-4495', 12, NULL, 59, 'Connection Issue', 'fdsfdsfsdf', 'high', 'closed', 'Closed and Complete', NULL, NULL, NULL, '2026-04-12 20:30:09', '2026-04-12 20:37:10'),
(3, 'TK-20260412-4102', 12, 59, 59, 'Technical Issue', 'Subject: Problem\nService: Broadband\n\nasdasasdasdas', 'medium', 'pending', 'asdas', NULL, NULL, NULL, '2026-04-12 20:55:23', '2026-04-12 20:55:23');

-- --------------------------------------------------------

--
-- Table structure for table `client_service_requests`
--

CREATE TABLE `client_service_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_code` varchar(40) NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `request_kind` varchar(30) NOT NULL,
  `request_type` varchar(60) NOT NULL,
  `current_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `priority` varchar(20) NOT NULL DEFAULT 'normal',
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `termination_reason` varchar(40) DEFAULT NULL,
  `reason` text NOT NULL,
  `notes` text DEFAULT NULL,
  `requested_by_client` tinyint(1) NOT NULL DEFAULT 1,
  `created_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_service_requests`
--

INSERT INTO `client_service_requests` (`id`, `request_code`, `client_id`, `request_kind`, `request_type`, `current_value`, `new_value`, `effective_date`, `priority`, `status`, `termination_reason`, `reason`, `notes`, `requested_by_client`, `created_by_employee_id`, `updated_by_employee_id`, `created_at`, `updated_at`) VALUES
(1, 'CSR-202604-0001', 1, 'change', 'package_change', '5 MBPS', '10 MBPS', '2026-04-05', 'urgent', 'completed', NULL, 'Sad', 'sadasd\nDone\nDone', 1, NULL, 37, '2026-04-04 12:05:58', '2026-04-04 12:18:49'),
(2, 'CSR-202604-0002', 1, 'close_connection', 'close_connection', 'Starter 10 Mbps', 'Connection Close', '2026-04-05', 'normal', 'completed', 'relocation', 'adasd', 'sadasd\nOpened in termination form\nTermination processed', 1, NULL, 37, '2026-04-04 12:19:18', '2026-04-04 12:19:40'),
(3, 'CSR-202604-0003', 3, 'close_connection', 'close_connection', 'Premium 40 Mbps', 'Connection Close', '2026-04-05', 'normal', 'completed', 'service', 'sadsd', '1212\nOpened in termination form\nTermination processed', 1, NULL, 37, '2026-04-04 12:39:46', '2026-04-04 12:40:21'),
(4, 'CSR-202604-0004', 11, 'change', 'package_change', '100 Mpbs', '50 Mbps', '2026-04-20', 'urgent', 'completed', NULL, 'Not need much speed', 'ok\nDone', 1, NULL, 168, '2026-04-11 14:54:50', '2026-04-11 15:02:48'),
(5, 'CSR-202604-0005', 11, 'close_connection', 'close_connection', 'Premium 40 Mbps', 'Connection Close', '2026-04-30', 'normal', 'completed', 'price', 'sads', 'asdasd\nOpened in termination form\nTermination processed', 1, NULL, 168, '2026-04-11 15:12:33', '2026-04-11 15:14:33'),
(6, 'CSR-202604-0006', 12, 'change', 'package_change', '100mbps', '40mbps', '2026-05-01', 'urgent', 'completed', NULL, 'sdadsa', 'sadsad\nDone', 1, NULL, 59, '2026-04-12 14:28:49', '2026-04-12 14:34:07'),
(7, 'CSR-202604-0007', 12, 'close_connection', 'close_connection', 'Turbo100', 'Connection Close', '2026-05-29', 'normal', 'in_progress', 'price', 'asdsad', 'asdsad\nOpened in termination form', 1, NULL, 59, '2026-04-12 14:29:42', '2026-04-12 14:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_categories`
--

CREATE TABLE `complaint_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`, `created_at`) VALUES
(29, 'Admin', '2026-04-11 09:22:52'),
(39, 'HR', '2026-04-11 09:42:13'),
(40, 'IT & Network', '2026-04-11 10:00:34'),
(41, 'NOC', '2026-04-11 10:00:43'),
(42, 'Support', '2026-04-11 10:00:49'),
(43, 'Accounts', '2026-04-11 10:00:54'),
(45, 'Sales', '2026-04-11 10:05:28'),
(46, 'Operations', '2026-04-11 10:05:34'),
(48, 'Procurement', '2026-04-11 10:06:53');

-- --------------------------------------------------------

--
-- Table structure for table `department_access_modules`
--

CREATE TABLE `department_access_modules` (
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_code` varchar(30) NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED DEFAULT NULL,
  `join_date` date NOT NULL,
  `basic_salary` decimal(12,2) NOT NULL DEFAULT 0.00,
  `employment_status` enum('active','resigned','left') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_code`, `full_name`, `phone`, `email`, `department_id`, `position_id`, `join_date`, `basic_salary`, `employment_status`, `created_at`, `updated_at`) VALUES
(59, '2026001', 'Srejon Joy', '01756202157', 'adminmanager@promee.internet', 29, 75, '2026-04-01', 213213.00, 'active', '2026-04-11 09:37:27', '2026-04-11 09:37:27'),
(60, '2026002', 'Srejon Joy', '0175620215712312', 'hrmanager@promee.internet', 39, 76, '2026-04-01', 2133123.00, 'active', '2026-04-11 09:44:44', '2026-04-11 09:44:44'),
(151, '2026003', 'Rahim Miah', '017562021572', 'rahimmiah@promee.internet', 43, 85, '2026-04-01', 15000.00, 'active', '2026-04-11 12:32:24', '2026-04-11 12:33:28'),
(152, '2026004', 'Karim Miah', '017562021578213', 'karimmiah@promee.internet', 43, 86, '2023-01-11', 12000.00, 'active', '2026-04-11 12:38:22', '2026-04-11 12:38:22'),
(153, '2026005', 'Jakir Hossain', '017562021572312', 'jakirhossain@promee.internet', 29, 77, '2026-04-01', 14000.00, 'active', '2026-04-11 12:40:10', '2026-04-11 12:40:10'),
(154, '2026006', 'Akib Ahmed', '01756202157123213', 'akibahmed@promee.internet', 29, 75, '2022-01-06', 15000.00, 'active', '2026-04-11 12:41:43', '2026-04-11 12:41:43'),
(155, '2026007', 'Anjum Zara', '01756202157832', 'anjumzara@promee.internet', 29, 78, '2024-01-01', 14000.00, 'active', '2026-04-11 12:43:27', '2026-04-11 12:43:27'),
(156, '2026008', 'Tasnim Rahman', '0175620215733334', 'tasnimhossain@promee.internet', 39, 76, '2026-04-01', 25000.00, 'active', '2026-04-11 12:44:42', '2026-04-11 12:44:42'),
(157, '2026009', 'Sudip Kumar', '01756202157812', 'adminmanager@promee.internet@promee.internet', 39, 87, '2026-04-01', 20000.00, 'active', '2026-04-11 12:46:00', '2026-04-11 12:46:00'),
(158, '2026010', 'Dipro Barua', '01756202157121', 'diprobarua@promee.internet', 40, 79, '2025-09-10', 35000.00, 'active', '2026-04-11 12:47:54', '2026-04-11 12:47:54'),
(159, '2026011', 'Jubayer Ahmed', '017562021572213', 'jubayerahmed@promee.internet', 40, 80, '2022-01-01', 25000.00, 'active', '2026-04-11 12:49:10', '2026-04-11 12:49:10'),
(160, '2026012', 'Eng Labib Ahmed', '121212121222', 'labibahmed@promee.internet', 41, 82, '2022-01-01', 23000.00, 'active', '2026-04-11 12:50:41', '2026-04-11 12:50:41'),
(162, '2026014', 'tusher ahmed', '0175', 'tusherahmed@promee.internet', 45, 88, '2026-04-02', 30000.00, 'active', '2026-04-11 12:55:42', '2026-04-11 12:55:42'),
(166, '2026015', 'Srejon Ahmed', '01757223', 'srejonahmed@promee.internet', 42, 89, '2026-04-01', 14000.00, 'active', '2026-04-11 13:29:11', '2026-04-11 13:29:11'),
(167, '2026016', 'Test Technician', '01795555556', 'test.support.tech.2026016@promee.internet', 42, 89, '2026-04-11', 25000.00, 'active', '2026-04-11 13:33:11', '2026-04-11 13:33:11'),
(168, '2026017', 'Jahir Miah', '01756202157223123', 'jahirmiah@promee.internet', 42, 83, '2026-04-01', 40000.00, 'active', '2026-04-11 14:57:59', '2026-04-11 14:57:59'),
(169, '2026018', 'Moin Uddin', '017562021571221', 'moinuddin@promee.internet', 42, 84, '2026-04-01', 30000.00, 'active', '2026-04-11 15:07:14', '2026-04-11 15:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `employee_profiles`
--

CREATE TABLE `employee_profiles` (
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `designation_title` varchar(120) DEFAULT NULL,
  `status_label` varchar(40) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `nid` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `employee_type` varchar(40) DEFAULT NULL,
  `emergency_phone` varchar(30) DEFAULT NULL,
  `emergency_name` varchar(120) DEFAULT NULL,
  `manager_name` varchar(120) DEFAULT NULL,
  `house_allowance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `medical_allowance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `transport_allowance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(120) DEFAULT NULL,
  `bank_account` varchar(80) DEFAULT NULL,
  `education` varchar(120) DEFAULT NULL,
  `experience_years` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `present_address` varchar(255) DEFAULT NULL,
  `permanent_address` varchar(255) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `access_modules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`access_modules`)),
  `password_hash` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_profiles`
--

INSERT INTO `employee_profiles` (`employee_id`, `role_name`, `designation_title`, `status_label`, `gender`, `nid`, `dob`, `blood_group`, `employee_type`, `emergency_phone`, `emergency_name`, `manager_name`, `house_allowance`, `medical_allowance`, `transport_allowance`, `bank_name`, `bank_account`, `education`, `experience_years`, `present_address`, `permanent_address`, `skills`, `notes`, `access_modules`, `password_hash`, `created_at`, `updated_at`) VALUES
(59, NULL, 'Manager', 'Active', 'Male', '2193898492', '2026-04-01', 'B+', 'Permanent', '213213', 'Srejon Joy', 'dsad', 2312.00, 2133.00, 213.00, 'Brac', '2132', 'PhD', 7, 'Khilgaon,Dhaka-1219', 'Sufia House', 'sdasd', 'asdas', '{\"Dashboard\":\"full\",\"Client\":\"full\",\"Billing\":\"full\",\"Mikrotik Server\":\"view\",\"HR & Payroll\":\"full\",\"Leave Management\":\"full\",\"Events & Holidays\":\"full\",\"Support & Ticketing\":\"full\",\"Task Management\":\"full\",\"Purchase\":\"full\",\"Inventory\":\"full\",\"Assets\":\"full\",\"Income\":\"full\",\"New Request\":\"full\",\"Add New Client\":\"full\",\"Client List\":\"full\",\"Left Client\":\"full\",\"Scheduler\":\"full\",\"Change Request\":\"full\",\"Portal Manage\":\"full\",\"Bulk Client Import\":\"view\",\"Employee List\":\"full\",\"Add Employee\":\"full\",\"Attendance\":\"full\",\"Salary Sheet\":\"full\",\"Department\":\"full\",\"Position\":\"full\",\"Payhead\":\"full\",\"Payroll\":\"full\",\"Resign Rule\":\"full\",\"Resignation\":\"full\",\"Internet Packages\":\"full\",\"Apply Leave\":\"full\",\"Ticket List\":\"full\",\"New Ticket\":\"full\",\"Support Team\":\"full\",\"Ticket Reports\":\"full\",\"Service History\":\"full\"}', '$2y$10$rFzOjXkDLUKx39dMA21KJ.WJbTHphZnNQpBBWgKsQMcMiOtYtLqlO', '2026-04-11 09:37:27', '2026-04-11 15:36:09'),
(60, NULL, 'Manager', 'Active', 'Male', '2193898492231', '2026-04-05', 'B+', 'Permanent', '213213', 'Srejon Joy', 'sadas', 213.00, 21312.00, 23123.00, '12313', '23123', 'PhD', 7, 'Khilgaon,Dhaka-1219', 'sda', 'sda', 'sdasd', '{\"Dashboard\":\"full\",\"Client\":\"full\",\"Billing\":\"none\",\"Mikrotik Server\":\"full\",\"HR & Payroll\":\"full\",\"Leave Management\":\"full\",\"Events & Holidays\":\"full\",\"Support & Ticketing\":\"none\",\"Task Management\":\"full\",\"Purchase\":\"full\",\"Inventory\":\"full\",\"Assets\":\"full\",\"Income\":\"full\",\"New Request\":\"full\",\"Add New Client\":\"full\",\"Client List\":\"full\",\"Left Client\":\"full\",\"Scheduler\":\"full\",\"Change Request\":\"full\",\"Portal Manage\":\"full\",\"Bulk Client Import\":\"full\",\"Employee List\":\"full\",\"Add Employee\":\"full\",\"Attendance\":\"full\",\"Salary Sheet\":\"full\",\"Department\":\"full\",\"Position\":\"full\",\"Payhead\":\"view\",\"Payroll\":\"view\",\"Resign Rule\":\"full\",\"Resignation\":\"full\",\"Internet Packages\":\"none\",\"Apply Leave\":\"full\",\"Ticket List\":\"none\",\"New Ticket\":\"none\",\"Support Team\":\"none\",\"Ticket Reports\":\"none\",\"Service History\":\"none\"}', '$2y$10$wNMxBdY.mKfNCNj1fHo.mOTDXq0Ktx3EziasSo1XUX2GiowIOdGS.', '2026-04-11 09:44:44', '2026-04-11 12:27:08'),
(151, 'Accounts', 'Manager', 'Active', 'Male', '2193898492223', '2025-04-24', 'B+', 'Permanent', '13123', 'Srejon Joy', 'Joy', 1500.00, 1400.00, 1200.00, 'Brac', '1211212321', 'Bachelor\'s', 1, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Networking', 'Vg', '{\"Dashboard\":\"full\",\"Client\":\"none\",\"Billing\":\"full\",\"Mikrotik Server\":\"full\",\"HR & Payroll\":\"full\",\"Leave Management\":\"full\",\"Events & Holidays\":\"view\",\"Support & Ticketing\":\"none\",\"Task Management\":\"none\",\"Purchase\":\"full\",\"Inventory\":\"full\",\"Assets\":\"full\",\"Income\":\"full\",\"New Request\":\"none\",\"Add New Client\":\"none\",\"Client List\":\"none\",\"Left Client\":\"none\",\"Scheduler\":\"none\",\"Change Request\":\"none\",\"Portal Manage\":\"none\",\"Bulk Client Import\":\"full\",\"Employee List\":\"view\",\"Add Employee\":\"full\",\"Attendance\":\"full\",\"Salary Sheet\":\"full\",\"Department\":\"full\",\"Position\":\"full\",\"Payhead\":\"full\",\"Payroll\":\"full\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"full\",\"Apply Leave\":\"full\",\"Ticket List\":\"none\",\"New Ticket\":\"none\",\"Support Team\":\"none\",\"Ticket Reports\":\"none\",\"Service History\":\"none\"}', '$2y$10$NcDcY9HodeFUIL2iDE4S7.1mkThtARay6QyC8HjNnoQR1daCZaUCC', '2026-04-11 12:32:24', '2026-04-11 13:09:51'),
(152, 'Accounts', 'Officer', 'Active', 'Male', '2193898492213', '2021-01-01', 'A+', 'Contractual', '213213213213', 'Srejon Joy', 'Joy', 1000.00, 1000.00, 500.00, 'Dutch Bangla', '121121232134242', 'Bachelor\'s', 0, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Linux', 'g', '{\"Dashboard\":\"full\",\"Client\":\"none\",\"Billing\":\"none\",\"Mikrotik Server\":\"none\",\"HR & Payroll\":\"full\",\"Leave Management\":\"full\",\"Events & Holidays\":\"view\",\"Support & Ticketing\":\"none\",\"Task Management\":\"none\",\"Purchase\":\"full\",\"Inventory\":\"full\",\"Assets\":\"full\",\"Income\":\"full\",\"New Request\":\"none\",\"Add New Client\":\"none\",\"Client List\":\"none\",\"Left Client\":\"none\",\"Scheduler\":\"none\",\"Change Request\":\"none\",\"Portal Manage\":\"none\",\"Bulk Client Import\":\"none\",\"Employee List\":\"view\",\"Add Employee\":\"none\",\"Attendance\":\"none\",\"Salary Sheet\":\"full\",\"Department\":\"none\",\"Position\":\"none\",\"Payhead\":\"view\",\"Payroll\":\"view\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"none\",\"Apply Leave\":\"full\",\"Ticket List\":\"none\",\"New Ticket\":\"none\",\"Support Team\":\"none\",\"Ticket Reports\":\"none\",\"Service History\":\"none\"}', '$2y$10$iBnmv7P/wvuTVciHBzPbrOqhgDsuQoRLuVNNJrkRdEfhpc2RLv.Ma', '2026-04-11 12:38:22', '2026-04-11 13:09:51'),
(153, 'Admin', 'Director', 'Probation', 'Male', '21938984922132312', '2025-11-04', 'A-', 'Permanent', '21321321321231', 'Srejon Joy', 'Srejon', 1000.00, 2300.00, 1000.00, 'City Bank PLC', '12122131232222123', 'Bachelor\'s', 1, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Linux', 'vg', '{\"Dashboard\":\"full\",\"Client\":\"full\",\"Billing\":\"full\",\"Mikrotik Server\":\"full\",\"HR & Payroll\":\"full\",\"Leave Management\":\"full\",\"Events & Holidays\":\"full\",\"Support & Ticketing\":\"full\",\"Task Management\":\"full\",\"Purchase\":\"full\",\"Inventory\":\"full\",\"Assets\":\"full\",\"Income\":\"full\",\"New Request\":\"full\",\"Add New Client\":\"full\",\"Client List\":\"full\",\"Left Client\":\"full\",\"Scheduler\":\"full\",\"Change Request\":\"full\",\"Portal Manage\":\"full\",\"Bulk Client Import\":\"full\",\"Employee List\":\"full\",\"Add Employee\":\"full\",\"Attendance\":\"full\",\"Salary Sheet\":\"full\",\"Department\":\"full\",\"Position\":\"full\",\"Payhead\":\"full\",\"Payroll\":\"full\",\"Resign Rule\":\"full\",\"Resignation\":\"full\",\"Internet Packages\":\"full\",\"Apply Leave\":\"full\",\"Ticket List\":\"full\",\"New Ticket\":\"full\",\"Support Team\":\"full\",\"Ticket Reports\":\"full\",\"Service History\":\"full\"}', '$2y$10$P09/dJZh5gq8.HEwSMQ7sOII5Wp7NX.Y/fTp4XydyLYzriof15Y3S', '2026-04-11 12:40:10', '2026-04-11 13:09:51'),
(154, 'Admin', 'Manager', 'Active', 'Male', '2193898492211123', '2018-05-06', 'B+', 'Permanent', '2132132132132131', 'Srejon Joy', 'dsad', 1000.00, 1000.00, 1000.00, 'Dutch Bangla', '213213122223123312', 'Bachelor\'s', 3, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Networking', 'vg', '{\"Dashboard\":\"full\",\"Client\":\"full\",\"Billing\":\"full\",\"Mikrotik Server\":\"view\",\"HR & Payroll\":\"full\",\"Leave Management\":\"full\",\"Events & Holidays\":\"full\",\"Support & Ticketing\":\"full\",\"Task Management\":\"full\",\"Purchase\":\"none\",\"Inventory\":\"full\",\"Assets\":\"none\",\"Income\":\"full\",\"New Request\":\"full\",\"Add New Client\":\"full\",\"Client List\":\"full\",\"Left Client\":\"full\",\"Scheduler\":\"full\",\"Change Request\":\"full\",\"Portal Manage\":\"full\",\"Bulk Client Import\":\"view\",\"Employee List\":\"full\",\"Add Employee\":\"full\",\"Attendance\":\"full\",\"Salary Sheet\":\"full\",\"Department\":\"full\",\"Position\":\"full\",\"Payhead\":\"full\",\"Payroll\":\"full\",\"Resign Rule\":\"full\",\"Resignation\":\"full\",\"Internet Packages\":\"full\",\"Apply Leave\":\"full\",\"Ticket List\":\"full\",\"New Ticket\":\"full\",\"Support Team\":\"full\",\"Ticket Reports\":\"full\",\"Service History\":\"full\"}', '$2y$10$upJPolIWK0mIbZTCnPVHfeUnX38LGZaZNaqpNtRyqfK7hUSAdFNfy', '2026-04-11 12:41:43', '2026-04-11 13:09:51'),
(155, 'Admin', 'Senior Officer', 'Active', 'Male', '219389849211223', '2018-05-01', 'AB+', 'Permanent', '13123123213123', 'Srejon Joy', 'Bijoy', 500.00, 500.00, 500.00, 'City Bank PLC', '1211212321', 'Diploma', 2, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Gateway', 'vg', '{\"Dashboard\":\"full\",\"Client\":\"full\",\"Billing\":\"full\",\"Mikrotik Server\":\"full\",\"HR & Payroll\":\"view\",\"Leave Management\":\"full\",\"Events & Holidays\":\"full\",\"Support & Ticketing\":\"full\",\"Task Management\":\"full\",\"Purchase\":\"full\",\"Inventory\":\"full\",\"Assets\":\"full\",\"Income\":\"full\",\"New Request\":\"full\",\"Add New Client\":\"full\",\"Client List\":\"full\",\"Left Client\":\"full\",\"Scheduler\":\"full\",\"Change Request\":\"full\",\"Portal Manage\":\"full\",\"Bulk Client Import\":\"full\",\"Employee List\":\"view\",\"Add Employee\":\"view\",\"Attendance\":\"full\",\"Salary Sheet\":\"view\",\"Department\":\"view\",\"Position\":\"view\",\"Payhead\":\"view\",\"Payroll\":\"view\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"view\",\"Apply Leave\":\"full\",\"Ticket List\":\"full\",\"New Ticket\":\"full\",\"Support Team\":\"full\",\"Ticket Reports\":\"full\",\"Service History\":\"full\"}', '$2y$10$bwJxkgKUg4Tjis1PsaqmxOQ249MVpAcF3KOmjPfDfDnhF3EzSql52', '2026-04-11 12:43:27', '2026-04-11 13:09:51'),
(156, 'HR', 'Manager', 'Active', 'Female', '219389849233334', '2026-04-01', 'B-', 'Permanent', '131232342342', 'Srejon Joy', 'Bijoy', 3000.00, 2200.00, 1500.00, 'Premier Bank', '123230002321', 'Master\'s', 5, 'Khilgaon,Dhaka-1219', 'Sufia House', 'sdad', 'sdasd', '{\"Dashboard\":\"full\",\"Client\":\"full\",\"Billing\":\"none\",\"Mikrotik Server\":\"full\",\"HR & Payroll\":\"full\",\"Leave Management\":\"full\",\"Events & Holidays\":\"full\",\"Support & Ticketing\":\"none\",\"Task Management\":\"full\",\"Purchase\":\"full\",\"Inventory\":\"full\",\"Assets\":\"full\",\"Income\":\"full\",\"New Request\":\"full\",\"Add New Client\":\"full\",\"Client List\":\"full\",\"Left Client\":\"full\",\"Scheduler\":\"full\",\"Change Request\":\"full\",\"Portal Manage\":\"full\",\"Bulk Client Import\":\"full\",\"Employee List\":\"full\",\"Add Employee\":\"full\",\"Attendance\":\"full\",\"Salary Sheet\":\"full\",\"Department\":\"full\",\"Position\":\"full\",\"Payhead\":\"view\",\"Payroll\":\"view\",\"Resign Rule\":\"full\",\"Resignation\":\"full\",\"Internet Packages\":\"none\",\"Apply Leave\":\"full\",\"Ticket List\":\"none\",\"New Ticket\":\"none\",\"Support Team\":\"none\",\"Ticket Reports\":\"none\",\"Service History\":\"none\"}', '$2y$10$SxSBiS5JZEIwiKHi6INMDe.9H8.ZNAJbqQkq9thqqW.U53ptx54FW', '2026-04-11 12:44:42', '2026-04-11 13:09:51'),
(157, 'HR', 'Senior Officer', 'Active', 'Male', '21938984921231231312', '2023-08-17', 'B+', 'Permanent', '13123123001', 'Srejon Joy', 'Joy', 1500.00, 1500.00, 1500.00, 'Brac Bank', '2312332132222121', 'Bachelor\'s', 1, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Network', 'sdsd', '{\"Dashboard\":\"full\",\"Client\":\"none\",\"Billing\":\"full\",\"Mikrotik Server\":\"full\",\"HR & Payroll\":\"full\",\"Leave Management\":\"full\",\"Events & Holidays\":\"view\",\"Support & Ticketing\":\"none\",\"Task Management\":\"none\",\"Purchase\":\"view\",\"Inventory\":\"view\",\"Assets\":\"view\",\"Income\":\"view\",\"New Request\":\"none\",\"Add New Client\":\"none\",\"Client List\":\"none\",\"Left Client\":\"none\",\"Scheduler\":\"none\",\"Change Request\":\"none\",\"Portal Manage\":\"none\",\"Bulk Client Import\":\"full\",\"Employee List\":\"view\",\"Add Employee\":\"full\",\"Attendance\":\"full\",\"Salary Sheet\":\"view\",\"Department\":\"view\",\"Position\":\"view\",\"Payhead\":\"view\",\"Payroll\":\"view\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"none\",\"Apply Leave\":\"full\",\"Ticket List\":\"none\",\"New Ticket\":\"none\",\"Support Team\":\"none\",\"Ticket Reports\":\"none\",\"Service History\":\"none\"}', '$2y$10$v6UUBSmikPjEQ38nr9uwPOcSVTppbko0Xyau/F8aq2BO99P4c4iVy', '2026-04-11 12:46:00', '2026-04-11 13:09:51'),
(158, 'IT & Network', 'Director IT', 'Active', 'Male', '219389849282221', '2022-01-12', 'O-', 'Permanent', '21321212122', 'Srejon Joy', 'Deep', 4000.00, 2000.00, 3000.00, 'City Bank PLC', '121121232133222', 'Master\'s', 3, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Networking', 'sadasd', '{\"Dashboard\":\"full\",\"Client\":\"full\",\"Billing\":\"none\",\"Mikrotik Server\":\"full\",\"HR & Payroll\":\"full\",\"Leave Management\":\"full\",\"Events & Holidays\":\"view\",\"Support & Ticketing\":\"full\",\"Task Management\":\"view\",\"Purchase\":\"view\",\"Inventory\":\"view\",\"Assets\":\"view\",\"Income\":\"view\",\"New Request\":\"full\",\"Add New Client\":\"full\",\"Client List\":\"full\",\"Left Client\":\"full\",\"Scheduler\":\"full\",\"Change Request\":\"full\",\"Portal Manage\":\"full\",\"Bulk Client Import\":\"full\",\"Employee List\":\"view\",\"Add Employee\":\"view\",\"Attendance\":\"full\",\"Salary Sheet\":\"view\",\"Department\":\"view\",\"Position\":\"full\",\"Payhead\":\"view\",\"Payroll\":\"view\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"view\",\"Apply Leave\":\"full\",\"Ticket List\":\"full\",\"New Ticket\":\"full\",\"Support Team\":\"full\",\"Ticket Reports\":\"full\",\"Service History\":\"full\"}', '$2y$10$I8JabKGduu7a8fhqsDu9.OCkK2kaqoVhxB.2TybPF7vxTkNipacka', '2026-04-11 12:47:54', '2026-04-11 13:09:51'),
(159, 'IT & Network', 'Officer', 'Probation', 'Male', '2193898492123123', '2026-04-01', 'B-', 'Permanent', '12312313', 'Srejon', 'Jhonny', 3000.00, 1000.00, 1000.00, 'Premier Bank', '21332131', 'Master\'s', 1, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Linux', 'sd', '{\"Dashboard\":\"full\",\"Client\":\"full\",\"Billing\":\"none\",\"Mikrotik Server\":\"full\",\"HR & Payroll\":\"view\",\"Leave Management\":\"full\",\"Events & Holidays\":\"view\",\"Support & Ticketing\":\"full\",\"Task Management\":\"full\",\"Purchase\":\"view\",\"Inventory\":\"view\",\"Assets\":\"view\",\"Income\":\"view\",\"New Request\":\"full\",\"Add New Client\":\"full\",\"Client List\":\"full\",\"Left Client\":\"full\",\"Scheduler\":\"full\",\"Change Request\":\"full\",\"Portal Manage\":\"full\",\"Bulk Client Import\":\"full\",\"Employee List\":\"view\",\"Add Employee\":\"view\",\"Attendance\":\"full\",\"Salary Sheet\":\"view\",\"Department\":\"view\",\"Position\":\"view\",\"Payhead\":\"view\",\"Payroll\":\"view\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"view\",\"Apply Leave\":\"full\",\"Ticket List\":\"full\",\"New Ticket\":\"full\",\"Support Team\":\"full\",\"Ticket Reports\":\"full\",\"Service History\":\"full\"}', '$2y$10$m/icolVjUpcJah8pZjopaeWW9HKMT.TtDDopiswubWZfy.ug8cuJa', '2026-04-11 12:49:10', '2026-04-11 13:09:51'),
(160, 'NOC', 'Engineer', 'On Leave', 'Male', '21938984921112', '2023-06-01', 'A+', 'Contractual', '1232131223233', 'Srejon Joy', 'Bijoy', 1000.00, 1000.00, 3500.00, 'Premier Bank', '121231313123', 'Master\'s', 1, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Networking', 'sdasd', '{\"Dashboard\":\"full\",\"Client\":\"view\",\"Billing\":\"none\",\"Mikrotik Server\":\"none\",\"HR & Payroll\":\"view\",\"Leave Management\":\"full\",\"Events & Holidays\":\"view\",\"Support & Ticketing\":\"full\",\"Task Management\":\"full\",\"Purchase\":\"view\",\"Inventory\":\"view\",\"Assets\":\"view\",\"Income\":\"view\",\"New Request\":\"view\",\"Add New Client\":\"view\",\"Client List\":\"view\",\"Left Client\":\"view\",\"Scheduler\":\"view\",\"Change Request\":\"view\",\"Portal Manage\":\"view\",\"Bulk Client Import\":\"none\",\"Employee List\":\"view\",\"Add Employee\":\"none\",\"Attendance\":\"full\",\"Salary Sheet\":\"view\",\"Department\":\"none\",\"Position\":\"none\",\"Payhead\":\"none\",\"Payroll\":\"none\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"none\",\"Apply Leave\":\"full\",\"Ticket List\":\"full\",\"New Ticket\":\"full\",\"Support Team\":\"full\",\"Ticket Reports\":\"full\",\"Service History\":\"full\"}', '$2y$10$tm2vnpEPBjQXCq0LJMye0.s95I2UfGPXYq/Am4oWCm0.VsGX4528e', '2026-04-11 12:50:41', '2026-04-11 13:09:51'),
(162, 'Sales', 'Officer', 'Active', 'Male', '2193898492556', '2026-04-01', 'A+', 'Permanent', '2132', 'Srejon Joy', 'Joy', 1000.00, 1000.00, 1000.00, 'City Bank PLC', '12', 'Master\'s', 1, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Linux', 'f', '{\"Dashboard\":\"full\",\"Client\":\"full\",\"Billing\":\"full\",\"Mikrotik Server\":\"none\",\"HR & Payroll\":\"view\",\"Leave Management\":\"full\",\"Events & Holidays\":\"view\",\"Support & Ticketing\":\"none\",\"Task Management\":\"none\",\"Purchase\":\"full\",\"Inventory\":\"full\",\"Assets\":\"full\",\"Income\":\"full\",\"New Request\":\"full\",\"Add New Client\":\"full\",\"Client List\":\"full\",\"Left Client\":\"full\",\"Scheduler\":\"full\",\"Change Request\":\"full\",\"Portal Manage\":\"full\",\"Bulk Client Import\":\"none\",\"Employee List\":\"view\",\"Add Employee\":\"view\",\"Attendance\":\"full\",\"Salary Sheet\":\"view\",\"Department\":\"view\",\"Position\":\"view\",\"Payhead\":\"view\",\"Payroll\":\"view\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"view\",\"Apply Leave\":\"full\",\"Ticket List\":\"none\",\"New Ticket\":\"none\",\"Support Team\":\"none\",\"Ticket Reports\":\"none\",\"Service History\":\"none\"}', '$2y$10$esLc.KWnqUddb3rxnQUqsORWHeiAdPUrbGt.knE/.SZbxdb/iV7Vq', '2026-04-11 12:55:42', '2026-04-11 13:09:51'),
(166, 'Support', 'Technician', 'Active', 'Male', '21938984656', '2026-04-01', 'B+', 'Permanent', '123213213', 'Srejon Joy', 'Joy', 1000.00, 1000.00, 1000.00, 'Brac Bank', '231232312', 'Bachelor\'s', 1, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Networking', 'dfsf', '{\"Dashboard\":\"full\",\"Client\":\"view\",\"Billing\":\"view\",\"Mikrotik Server\":\"none\",\"HR & Payroll\":\"view\",\"Leave Management\":\"full\",\"Events & Holidays\":\"view\",\"Support & Ticketing\":\"full\",\"Task Management\":\"view\",\"Purchase\":\"view\",\"Inventory\":\"view\",\"Assets\":\"view\",\"Income\":\"view\",\"New Request\":\"view\",\"Add New Client\":\"view\",\"Client List\":\"view\",\"Left Client\":\"view\",\"Scheduler\":\"view\",\"Change Request\":\"view\",\"Portal Manage\":\"view\",\"Bulk Client Import\":\"none\",\"Employee List\":\"view\",\"Add Employee\":\"view\",\"Attendance\":\"full\",\"Salary Sheet\":\"view\",\"Department\":\"view\",\"Position\":\"view\",\"Payhead\":\"view\",\"Payroll\":\"view\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"view\",\"Apply Leave\":\"full\",\"Ticket List\":\"full\",\"New Ticket\":\"full\",\"Support Team\":\"full\",\"Ticket Reports\":\"full\",\"Service History\":\"full\"}', '$2y$10$AyGHz1qUj9e.ycw2Mn2LuO6bgoNa2BRebNk4YHop3wwfgFTRHrdWi', '2026-04-11 13:29:11', '2026-04-11 13:33:51'),
(167, 'Support', 'Technician', 'Active', 'Male', '4000000000167', '1996-05-15', 'B+', 'Permanent', '01890000001', 'Md. Karim', 'Support Manager', 5000.00, 2000.00, 1500.00, 'BRAC Bank', '600000000167', 'Diploma', 3, 'Mirpur, Dhaka', 'Cumilla, Bangladesh', 'Fiber, Support', 'Matrix verification test employee', '{\"Dashboard\":\"full\",\"Client\":\"view\",\"Billing\":\"view\",\"Mikrotik Server\":\"none\",\"HR & Payroll\":\"view\",\"Leave Management\":\"full\",\"Events & Holidays\":\"view\",\"Support & Ticketing\":\"full\",\"Task Management\":\"view\",\"Purchase\":\"view\",\"Inventory\":\"view\",\"Assets\":\"view\",\"Income\":\"view\",\"New Request\":\"view\",\"Add New Client\":\"view\",\"Client List\":\"view\",\"Left Client\":\"view\",\"Scheduler\":\"view\",\"Change Request\":\"view\",\"Portal Manage\":\"view\",\"Bulk Client Import\":\"none\",\"Employee List\":\"view\",\"Add Employee\":\"view\",\"Attendance\":\"full\",\"Salary Sheet\":\"view\",\"Department\":\"view\",\"Position\":\"view\",\"Payhead\":\"view\",\"Payroll\":\"view\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"view\",\"Apply Leave\":\"full\",\"Ticket List\":\"full\",\"New Ticket\":\"full\",\"Support Team\":\"full\",\"Ticket Reports\":\"full\",\"Service History\":\"full\"}', '$2y$10$kaSe5SkC19iIAfPomV7i2e1Pyn9ACT/SEM7ziGnsQekxKPCUd7Zzq', '2026-04-11 13:33:11', '2026-04-11 13:33:51'),
(168, 'Support', 'Manager', 'Active', 'Male', '219389849221321', '2026-04-01', 'B-', 'Permanent', '1231231', 'Srejon Joy', 'Joy', 5000.00, 2000.00, 3000.00, 'Dutch Bangla', '231232313', 'Master\'s', 9, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Networking', 'vg', '{\"Dashboard\":\"full\",\"Client\":\"full\",\"Billing\":\"full\",\"Mikrotik Server\":\"none\",\"HR & Payroll\":\"view\",\"Leave Management\":\"full\",\"Events & Holidays\":\"view\",\"Support & Ticketing\":\"full\",\"Task Management\":\"full\",\"Purchase\":\"none\",\"Inventory\":\"none\",\"Assets\":\"none\",\"Income\":\"none\",\"New Request\":\"full\",\"Add New Client\":\"full\",\"Client List\":\"full\",\"Left Client\":\"full\",\"Scheduler\":\"full\",\"Change Request\":\"full\",\"Portal Manage\":\"full\",\"Bulk Client Import\":\"none\",\"Employee List\":\"view\",\"Add Employee\":\"none\",\"Attendance\":\"full\",\"Salary Sheet\":\"none\",\"Department\":\"none\",\"Position\":\"none\",\"Payhead\":\"none\",\"Payroll\":\"none\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"none\",\"Apply Leave\":\"full\",\"Ticket List\":\"full\",\"New Ticket\":\"full\",\"Support Team\":\"full\",\"Ticket Reports\":\"full\",\"Service History\":\"full\"}', '$2y$10$XMVlF8U7CtaOOaEZo9kpB.PjPNywmDC2WyRgkN9BuzykuZaXj.MES', '2026-04-11 14:57:59', '2026-04-11 14:57:59'),
(169, 'Support', 'Stuff', 'Active', 'Male', '21938984922221', '2026-04-01', 'AB+', 'Permanent', '213213', 'Srejon Joy', 'Joy', 10000.00, 5000.00, 1000.00, 'City Bank PLC', '2312323131', 'Master\'s', 1, 'Khilgaon,Dhaka-1219', 'Sufia House', 'Networking', 'sadasd', '{\"Dashboard\":\"full\",\"Client\":\"full\",\"Billing\":\"view\",\"Mikrotik Server\":\"none\",\"HR & Payroll\":\"view\",\"Leave Management\":\"full\",\"Events & Holidays\":\"view\",\"Support & Ticketing\":\"full\",\"Task Management\":\"view\",\"Purchase\":\"none\",\"Inventory\":\"none\",\"Assets\":\"none\",\"Income\":\"none\",\"New Request\":\"full\",\"Add New Client\":\"none\",\"Client List\":\"view\",\"Left Client\":\"view\",\"Scheduler\":\"view\",\"Change Request\":\"view\",\"Portal Manage\":\"view\",\"Bulk Client Import\":\"none\",\"Employee List\":\"view\",\"Add Employee\":\"view\",\"Attendance\":\"full\",\"Salary Sheet\":\"view\",\"Department\":\"view\",\"Position\":\"view\",\"Payhead\":\"view\",\"Payroll\":\"view\",\"Resign Rule\":\"view\",\"Resignation\":\"view\",\"Internet Packages\":\"view\",\"Apply Leave\":\"full\",\"Ticket List\":\"full\",\"New Ticket\":\"full\",\"Support Team\":\"full\",\"Ticket Reports\":\"full\",\"Service History\":\"full\"}', '$2y$10$Gh1jIEMgBMtOuUiTk4zmbufWDPVG4VcQZ1nGLD8dObjlSWQ69wwy6', '2026-04-11 15:07:14', '2026-04-11 15:07:14');

-- --------------------------------------------------------

--
-- Table structure for table `events_holidays`
--

CREATE TABLE `events_holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(180) NOT NULL,
  `event_type` enum('event','holiday') NOT NULL DEFAULT 'event',
  `event_date` date NOT NULL,
  `description_text` text DEFAULT NULL,
  `created_by_employee_id` int(11) DEFAULT NULL,
  `assigned_to_employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events_holidays`
--

INSERT INTO `events_holidays` (`id`, `title`, `event_type`, `event_date`, `description_text`, `created_by_employee_id`, `assigned_to_employee_id`, `created_at`, `updated_at`) VALUES
(1, 'New Year Day', 'holiday', '2026-01-01', 'Public holiday observed nationwide.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(2, 'Shab-e-Barat', 'holiday', '2026-02-14', 'Government holiday for holy night observance.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(3, 'Shaheed Day & International Mother Language Day', 'holiday', '2026-02-21', 'National holiday in remembrance of Language Movement martyrs.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(4, 'Birthday of Bangabandhu Sheikh Mujibur Rahman', 'holiday', '2026-03-17', 'National celebration and official holiday.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(5, 'Independence Day', 'holiday', '2026-03-26', 'National holiday marking independence of Bangladesh.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(6, 'Laylat al-Qadr (Shab-e-Qadr)', 'holiday', '2026-03-27', 'Government holiday for religious observance.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(7, 'Eid-ul-Fitr Holiday - Day 1', 'holiday', '2026-03-30', 'First day of Eid-ul-Fitr government holiday.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(8, 'Eid-ul-Fitr Holiday - Day 2', 'holiday', '2026-03-31', 'Second day of Eid-ul-Fitr government holiday.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(9, 'Eid-ul-Fitr Holiday - Day 3', 'holiday', '2026-04-01', 'Third day of Eid-ul-Fitr government holiday.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(10, 'Pohela Boishakh (Bengali New Year)', 'holiday', '2026-04-14', 'National holiday celebrating Bengali New Year.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(11, 'May Day', 'holiday', '2026-05-01', 'International Workers Day public holiday.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(12, 'Buddha Purnima', 'holiday', '2026-05-23', 'Public holiday observed by Buddhist communities.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(13, 'Eid-ul-Adha Holiday - Day 1', 'holiday', '2026-06-07', 'First day of Eid-ul-Adha government holiday.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(14, 'Eid-ul-Adha Holiday - Day 2', 'holiday', '2026-06-08', 'Second day of Eid-ul-Adha government holiday.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(15, 'Eid-ul-Adha Holiday - Day 3', 'holiday', '2026-06-09', 'Third day of Eid-ul-Adha government holiday.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(16, 'Ashura', 'holiday', '2026-07-17', 'Government holiday for Muharram observance.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(17, 'National Mourning Day', 'holiday', '2026-08-15', 'National holiday commemorating Bangabandhu and family.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(18, 'Eid-e-Milad-un-Nabi', 'holiday', '2026-09-16', 'Public holiday for Eid-e-Milad-un-Nabi.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(19, 'Durga Puja (Bijoya Dashami)', 'holiday', '2026-10-23', 'Public holiday for Durga Puja.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(20, 'Victory Day', 'holiday', '2026-12-16', 'National holiday celebrating liberation victory.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(21, 'Christmas Day', 'holiday', '2026-12-25', 'Public holiday observed by Christian communities.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(22, 'ISP Annual Strategy Kickoff', 'event', '2026-01-05', 'Executive planning session for yearly network and service targets.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(23, 'Core Router Firmware Audit', 'event', '2026-01-20', 'Mikrotik firmware and security baseline review for all POP routers.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(24, 'NOC Incident Response Drill', 'event', '2026-02-10', 'Quarterly outage simulation for NOC and support teams.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(25, 'Fiber Preventive Maintenance Window', 'event', '2026-03-08', 'Scheduled backbone maintenance and signal quality checks.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(26, 'Customer Experience Workshop', 'event', '2026-04-24', 'Cross-team workshop on complaint handling and retention strategy.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(27, 'Billing Cycle Validation Day', 'event', '2026-05-18', 'Audit of invoice, payment, and reconnection workflows.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(28, 'Mikrotik QoS Optimization Session', 'event', '2026-06-20', 'Traffic shaping optimization for peak-hour bandwidth stability.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(29, 'Field Technician Safety Training', 'event', '2026-07-26', 'Safety and ladder protocol refresher for deployment teams.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13'),
(30, 'Disaster Recovery Dry Run', 'event', '2026-08-22', 'Failover rehearsal for billing and support services.', NULL, NULL, '2026-04-10 14:41:13', '2026-04-10 14:41:13');

-- --------------------------------------------------------

--
-- Table structure for table `financial_transactions`
--

CREATE TABLE `financial_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` enum('income','expense') NOT NULL,
  `source_module` varchar(50) NOT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_payheads`
--

CREATE TABLE `hr_payheads` (
  `id` int(10) UNSIGNED NOT NULL,
  `payhead_code` varchar(32) NOT NULL,
  `payhead_name` varchar(140) NOT NULL,
  `payhead_type` varchar(40) NOT NULL,
  `payhead_category` varchar(80) DEFAULT NULL,
  `calculation_type` varchar(40) NOT NULL,
  `default_value` decimal(12,2) NOT NULL DEFAULT 0.00,
  `percentage_base` varchar(30) DEFAULT NULL,
  `percentage_rate` decimal(8,4) NOT NULL DEFAULT 0.0000,
  `formula_expression` text DEFAULT NULL,
  `slab_definition` longtext DEFAULT NULL,
  `taxable` tinyint(1) NOT NULL DEFAULT 0,
  `pf_applicable` tinyint(1) NOT NULL DEFAULT 0,
  `esi_applicable` tinyint(1) NOT NULL DEFAULT 0,
  `affect_attendance` tinyint(1) NOT NULL DEFAULT 0,
  `pro_rata` tinyint(1) NOT NULL DEFAULT 0,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 1,
  `visible_on_payslip` tinyint(1) NOT NULL DEFAULT 1,
  `status_label` varchar(20) NOT NULL DEFAULT 'Active',
  `priority_order` int(11) NOT NULL DEFAULT 100,
  `max_limit` decimal(12,2) DEFAULT NULL,
  `gl_code` varchar(80) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `description_text` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_payheads`
--

INSERT INTO `hr_payheads` (`id`, `payhead_code`, `payhead_name`, `payhead_type`, `payhead_category`, `calculation_type`, `default_value`, `percentage_base`, `percentage_rate`, `formula_expression`, `slab_definition`, `taxable`, `pf_applicable`, `esi_applicable`, `affect_attendance`, `pro_rata`, `is_recurring`, `visible_on_payslip`, `status_label`, `priority_order`, `max_limit`, `gl_code`, `effective_from`, `effective_to`, `description_text`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'PH_DMY_BASIC_ADJ_001', 'Dummy Basic Adjustment', 'Earning', 'Salary Component', 'Fixed', 1000.00, 'Basic', 0.0000, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 'Active', 10, 5000.00, 'GL-4100', '2026-02-28', NULL, 'Dummy earning payhead for testing payroll computation', 37, 37, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(2, 'PH_DMY_FINE_002', 'Dummy Attendance Fine', 'Deduction', 'Disciplinary', 'Percentage', 0.00, 'Gross', 2.5000, NULL, NULL, 0, 0, 0, 1, 0, 0, 1, 'Active', 20, 3000.00, 'GL-5200', '2026-01-28', NULL, 'Dummy deduction payhead for lateness/absence testing', 37, 37, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(3, 'PH_BULK_001', 'Dummy Payhead 1', 'Earning', 'Allowance', 'Fixed', 350.00, NULL, 0.0000, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 'Active', 101, 10000.00, 'GL-BULK-001', '2026-03-28', NULL, 'Bulk dummy payhead seed #1', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(4, 'PH_BULK_002', 'Dummy Payhead 2', 'Deduction', 'Statutory', 'Fixed', 400.00, NULL, 0.0000, NULL, NULL, 0, 0, 0, 1, 1, 1, 1, 'Active', 102, 10000.00, 'GL-BULK-002', '2026-03-28', NULL, 'Bulk dummy payhead seed #2', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(5, 'PH_BULK_003', 'Dummy Payhead 3', 'Earning', 'Allowance', 'Percentage', 0.00, 'Basic', 4.5000, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 'Active', 103, 10000.00, 'GL-BULK-003', '2026-03-28', NULL, 'Bulk dummy payhead seed #3', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(6, 'PH_BULK_004', 'Dummy Payhead 4', 'Deduction', 'Statutory', 'Fixed', 500.00, NULL, 0.0000, NULL, NULL, 0, 0, 0, 1, 1, 1, 1, 'Active', 104, 10000.00, 'GL-BULK-004', '2026-03-28', NULL, 'Bulk dummy payhead seed #4', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(7, 'PH_BULK_005', 'Dummy Payhead 5', 'Earning', 'Allowance', 'Fixed', 550.00, NULL, 0.0000, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 'Active', 105, 10000.00, 'GL-BULK-005', '2026-03-28', NULL, 'Bulk dummy payhead seed #5', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(8, 'PH_BULK_006', 'Dummy Payhead 6', 'Deduction', 'Statutory', 'Percentage', 0.00, 'Basic', 3.5000, NULL, NULL, 0, 0, 0, 1, 1, 1, 1, 'Active', 106, 10000.00, 'GL-BULK-006', '2026-03-28', NULL, 'Bulk dummy payhead seed #6', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(9, 'PH_BULK_007', 'Dummy Payhead 7', 'Earning', 'Allowance', 'Fixed', 650.00, NULL, 0.0000, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 'Active', 107, 10000.00, 'GL-BULK-007', '2026-03-28', NULL, 'Bulk dummy payhead seed #7', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(10, 'PH_BULK_008', 'Dummy Payhead 8', 'Deduction', 'Statutory', 'Fixed', 700.00, NULL, 0.0000, NULL, NULL, 0, 0, 0, 1, 1, 1, 1, 'Active', 108, 10000.00, 'GL-BULK-008', '2026-03-28', NULL, 'Bulk dummy payhead seed #8', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(11, 'PH_BULK_009', 'Dummy Payhead 9', 'Earning', 'Allowance', 'Percentage', 0.00, 'Basic', 2.5000, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 'Active', 109, 10000.00, 'GL-BULK-009', '2026-03-28', NULL, 'Bulk dummy payhead seed #9', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(12, 'PH_BULK_010', 'Dummy Payhead 10', 'Deduction', 'Statutory', 'Fixed', 800.00, NULL, 0.0000, NULL, NULL, 0, 0, 0, 1, 1, 1, 1, 'Active', 110, 10000.00, 'GL-BULK-010', '2026-03-28', NULL, 'Bulk dummy payhead seed #10', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(13, 'PH_BULK_011', 'Dummy Payhead 11', 'Earning', 'Allowance', 'Fixed', 850.00, NULL, 0.0000, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 'Active', 111, 10000.00, 'GL-BULK-011', '2026-03-28', NULL, 'Bulk dummy payhead seed #11', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(14, 'PH_BULK_012', 'Dummy Payhead 12', 'Deduction', 'Statutory', 'Percentage', 0.00, 'Basic', 1.5000, NULL, NULL, 0, 0, 0, 1, 1, 1, 1, 'Active', 112, 10000.00, 'GL-BULK-012', '2026-03-28', NULL, 'Bulk dummy payhead seed #12', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `hr_payroll_items`
--

CREATE TABLE `hr_payroll_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_run_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `payable_days` int(11) NOT NULL DEFAULT 30,
  `basic_salary` decimal(12,2) NOT NULL DEFAULT 0.00,
  `house_allowance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `medical_allowance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `transport_allowance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `bonus_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `overtime_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `other_earning` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `pf_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `loan_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `other_deduction` decimal(12,2) NOT NULL DEFAULT 0.00,
  `gross_pay` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_deduction` decimal(12,2) NOT NULL DEFAULT 0.00,
  `net_pay` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(20) NOT NULL DEFAULT 'Pending',
  `remarks` text DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_payroll_items`
--

INSERT INTO `hr_payroll_items` (`id`, `payroll_run_id`, `employee_id`, `payable_days`, `basic_salary`, `house_allowance`, `medical_allowance`, `transport_allowance`, `bonus_amount`, `overtime_amount`, `other_earning`, `tax_amount`, `pf_amount`, `loan_amount`, `other_deduction`, `gross_pay`, `total_deduction`, `net_pay`, `payment_status`, `remarks`, `paid_at`, `created_at`, `updated_at`) VALUES
(3, 2, 169, 30, 30000.00, 10000.00, 5000.00, 1000.00, 0.00, 0.00, 0.00, 1500.00, 900.00, 0.00, 0.00, 46000.00, 2400.00, 43600.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:20', '2026-04-12 14:48:01'),
(5, 2, 168, 30, 40000.00, 5000.00, 2000.00, 3000.00, 0.00, 0.00, 0.00, 2000.00, 1200.00, 0.00, 0.00, 50000.00, 3200.00, 46800.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(6, 2, 167, 30, 25000.00, 5000.00, 2000.00, 1500.00, 0.00, 0.00, 0.00, 1250.00, 750.00, 0.00, 0.00, 33500.00, 2000.00, 31500.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(7, 2, 166, 30, 14000.00, 1000.00, 1000.00, 1000.00, 0.00, 0.00, 0.00, 700.00, 420.00, 0.00, 0.00, 17000.00, 1120.00, 15880.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(8, 2, 162, 30, 30000.00, 1000.00, 1000.00, 1000.00, 0.00, 0.00, 0.00, 1500.00, 900.00, 0.00, 0.00, 33000.00, 2400.00, 30600.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(9, 2, 160, 30, 23000.00, 1000.00, 1000.00, 3500.00, 0.00, 0.00, 0.00, 1150.00, 690.00, 0.00, 0.00, 28500.00, 1840.00, 26660.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(10, 2, 159, 30, 25000.00, 3000.00, 1000.00, 1000.00, 0.00, 0.00, 0.00, 1250.00, 750.00, 0.00, 0.00, 30000.00, 2000.00, 28000.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(11, 2, 158, 30, 35000.00, 4000.00, 2000.00, 3000.00, 0.00, 0.00, 0.00, 1750.00, 1050.00, 0.00, 0.00, 44000.00, 2800.00, 41200.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(12, 2, 157, 30, 20000.00, 1500.00, 1500.00, 1500.00, 0.00, 0.00, 0.00, 1000.00, 600.00, 0.00, 0.00, 24500.00, 1600.00, 22900.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(13, 2, 156, 30, 25000.00, 3000.00, 2200.00, 1500.00, 0.00, 0.00, 0.00, 1250.00, 750.00, 0.00, 0.00, 31700.00, 2000.00, 29700.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(14, 2, 155, 30, 14000.00, 500.00, 500.00, 500.00, 0.00, 0.00, 0.00, 700.00, 420.00, 0.00, 0.00, 15500.00, 1120.00, 14380.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(15, 2, 154, 30, 15000.00, 1000.00, 1000.00, 1000.00, 0.00, 0.00, 0.00, 750.00, 450.00, 0.00, 0.00, 18000.00, 1200.00, 16800.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(16, 2, 153, 30, 14000.00, 1000.00, 2300.00, 1000.00, 0.00, 0.00, 0.00, 700.00, 420.00, 0.00, 0.00, 18300.00, 1120.00, 17180.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(17, 2, 152, 30, 12000.00, 1000.00, 1000.00, 500.00, 0.00, 0.00, 0.00, 600.00, 360.00, 0.00, 0.00, 14500.00, 960.00, 13540.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(18, 2, 151, 30, 15000.00, 1500.00, 1400.00, 1200.00, 0.00, 0.00, 0.00, 750.00, 450.00, 0.00, 0.00, 19100.00, 1200.00, 17900.00, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(19, 2, 60, 30, 2133123.00, 213.00, 21312.00, 23123.00, 0.00, 0.00, 0.00, 106656.15, 63993.69, 0.00, 0.00, 2177771.00, 170649.84, 2007121.16, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01'),
(20, 2, 59, 30, 213213.00, 2312.00, 2133.00, 213.00, 0.00, 0.00, 0.00, 10660.65, 6396.39, 0.00, 0.00, 217871.00, 17057.04, 200813.96, 'Paid', NULL, '2026-04-12 16:48:01', '2026-04-12 14:47:23', '2026-04-12 14:48:01');

-- --------------------------------------------------------

--
-- Table structure for table `hr_payroll_runs`
--

CREATE TABLE `hr_payroll_runs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_month` char(7) NOT NULL,
  `working_days` int(11) NOT NULL DEFAULT 30,
  `tax_percent` decimal(8,4) NOT NULL DEFAULT 0.0000,
  `pf_percent` decimal(8,4) NOT NULL DEFAULT 0.0000,
  `status_label` varchar(20) NOT NULL DEFAULT 'Processed',
  `processed_at` datetime DEFAULT NULL,
  `generated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_payroll_runs`
--

INSERT INTO `hr_payroll_runs` (`id`, `payroll_month`, `working_days`, `tax_percent`, `pf_percent`, `status_label`, `processed_at`, `generated_by`, `created_at`, `updated_at`) VALUES
(1, '2026-03', 30, 5.0000, 3.0000, 'Processed', '2026-03-28 16:18:53', 37, '2026-03-28 14:41:58', '2026-03-28 15:18:53'),
(2, '2026-04', 30, 5.0000, 3.0000, 'Processed', '2026-04-12 16:47:35', 59, '2026-04-12 14:47:20', '2026-04-12 14:47:35');

-- --------------------------------------------------------

--
-- Table structure for table `hr_resignations`
--

CREATE TABLE `hr_resignations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_code` varchar(64) DEFAULT NULL,
  `employee_name` varchar(190) NOT NULL,
  `department_name` varchar(120) DEFAULT NULL,
  `designation_title` varchar(120) DEFAULT NULL,
  `resignation_type` varchar(40) NOT NULL DEFAULT 'Voluntary',
  `submitted_on` date NOT NULL,
  `notice_days` int(11) NOT NULL DEFAULT 30,
  `last_working_date` date DEFAULT NULL,
  `reason_text` text DEFAULT NULL,
  `handover_status` varchar(30) NOT NULL DEFAULT 'Pending',
  `asset_clearance_status` varchar(30) NOT NULL DEFAULT 'Pending',
  `finance_clearance_status` varchar(30) NOT NULL DEFAULT 'Pending',
  `hr_clearance_status` varchar(30) NOT NULL DEFAULT 'Pending',
  `exit_interview_date` date DEFAULT NULL,
  `knowledge_transfer_done` tinyint(1) NOT NULL DEFAULT 0,
  `final_settlement_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `final_settlement_status` varchar(30) NOT NULL DEFAULT 'Pending',
  `status_label` varchar(30) NOT NULL DEFAULT 'Submitted',
  `remarks_text` text DEFAULT NULL,
  `approved_on` date DEFAULT NULL,
  `relieved_on` date DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_resignation_rules`
--

CREATE TABLE `hr_resignation_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rule_name` varchar(140) NOT NULL,
  `department_name` varchar(120) DEFAULT NULL,
  `employee_type` varchar(80) DEFAULT NULL,
  `min_tenure_months` int(11) NOT NULL DEFAULT 0,
  `notice_period_days` int(11) NOT NULL DEFAULT 30,
  `buyout_allowed` tinyint(1) NOT NULL DEFAULT 0,
  `buyout_multiplier` decimal(8,2) NOT NULL DEFAULT 1.00,
  `final_settlement_days` int(11) NOT NULL DEFAULT 15,
  `exit_interview_required` tinyint(1) NOT NULL DEFAULT 1,
  `approvals_required` text DEFAULT NULL,
  `status_label` varchar(20) NOT NULL DEFAULT 'Active',
  `description_text` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr_resignation_rules`
--

INSERT INTO `hr_resignation_rules` (`id`, `rule_name`, `department_name`, `employee_type`, `min_tenure_months`, `notice_period_days`, `buyout_allowed`, `buyout_multiplier`, `final_settlement_days`, `exit_interview_required`, `approvals_required`, `status_label`, `description_text`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(2, 'Dummy Contract End Rule', 'Procurement / Store', 'Contract', 3, 15, 0, 1.00, 10, 0, '[\"HR Staff\",\"Department Head\"]', 'Active', 'Dummy rule for fixed-term contracts', 37, 37, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(3, 'Dummy Bulk Resignation Rule 01', 'Procurement / Store', 'Permanent', 4, 30, 0, 1.00, 15, 0, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #1', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(5, 'Dummy Bulk Resignation Rule 03', 'Procurement / Store', NULL, 6, 15, 0, 15555.00, 25, 0, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Inactive', 'Bulk dummy resignation rule #3', 37, 105, '2026-03-28 15:27:02', '2026-04-11 11:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `income_entries`
--

CREATE TABLE `income_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(60) NOT NULL,
  `client_name` varchar(160) NOT NULL,
  `package_name` varchar(120) DEFAULT NULL,
  `income_type` varchar(80) NOT NULL,
  `amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `due_date` date DEFAULT NULL,
  `status_label` enum('paid','pending','partial') NOT NULL DEFAULT 'pending',
  `payment_method` varchar(60) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `source_invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `source_payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by_employee_id` int(11) DEFAULT NULL,
  `assigned_to_employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `income_entries`
--

INSERT INTO `income_entries` (`id`, `invoice_no`, `client_name`, `package_name`, `income_type`, `amount`, `paid_amount`, `due_date`, `status_label`, `payment_method`, `notes`, `source_invoice_id`, `source_payment_id`, `created_by_employee_id`, `assigned_to_employee_id`, `created_at`, `updated_at`) VALUES
(1, 'INV-DMY-INC-001', 'Demo Client One', 'Business 100 Mbps', 'Monthly Subscription', 5000.00, 5000.00, '2026-03-28', 'paid', 'Bank Transfer', 'Dummy fully paid monthly income', NULL, NULL, 37, 38, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(2, 'INV-DMY-INC-002', 'Demo Client Two', 'Home 40 Mbps', 'Installation Charge', 3000.00, 1500.00, '2026-04-27', 'partial', 'Cash', 'Dummy partial payment income', NULL, NULL, 37, 38, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(3, 'INV-BULK-001', 'Dummy Client 1', 'Home 40 Mbps', 'Installation Charge', 2350.00, 1175.00, '2026-03-31', 'partial', 'Cash', 'Bulk dummy income entry #1', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(4, 'INV-BULK-002', 'Dummy Client 2', 'Business 100 Mbps', 'Reconnect Fee', 2700.00, 0.00, '2026-04-03', 'pending', 'Bank Transfer', 'Bulk dummy income entry #2', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(5, 'INV-BULK-003', 'Dummy Client 3', 'Home 40 Mbps', 'Device Sale', 3050.00, 3050.00, '2026-04-06', 'paid', 'Cash', 'Bulk dummy income entry #3', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(6, 'INV-BULK-004', 'Dummy Client 4', 'Business 100 Mbps', 'Monthly Subscription', 3400.00, 1700.00, '2026-04-09', 'partial', 'Bank Transfer', 'Bulk dummy income entry #4', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(7, 'INV-BULK-005', 'Dummy Client 5', 'Home 40 Mbps', 'Installation Charge', 3750.00, 0.00, '2026-04-12', 'pending', 'Cash', 'Bulk dummy income entry #5', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(8, 'INV-BULK-006', 'Dummy Client 6', 'Business 100 Mbps', 'Reconnect Fee', 4100.00, 4100.00, '2026-04-15', 'paid', 'Bank Transfer', 'Bulk dummy income entry #6', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(9, 'INV-BULK-007', 'Dummy Client 7', 'Home 40 Mbps', 'Device Sale', 4450.00, 2225.00, '2026-04-18', 'partial', 'Cash', 'Bulk dummy income entry #7', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(10, 'INV-BULK-008', 'Dummy Client 8', 'Business 100 Mbps', 'Monthly Subscription', 4800.00, 0.00, '2026-04-21', 'pending', 'Bank Transfer', 'Bulk dummy income entry #8', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(11, 'INV-BULK-009', 'Dummy Client 9', 'Home 40 Mbps', 'Installation Charge', 5150.00, 5150.00, '2026-04-24', 'paid', 'Cash', 'Bulk dummy income entry #9', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(12, 'INV-BULK-010', 'Dummy Client 10', 'Business 100 Mbps', 'Reconnect Fee', 5500.00, 2750.00, '2026-04-27', 'partial', 'Bank Transfer', 'Bulk dummy income entry #10', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(13, 'INV-BULK-011', 'Dummy Client 11', 'Home 40 Mbps', 'Device Sale', 5850.00, 0.00, '2026-04-30', 'pending', 'Cash', 'Bulk dummy income entry #11', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(14, 'INV-BULK-012', 'Dummy Client 12', 'Business 100 Mbps', 'Monthly Subscription', 6200.00, 6200.00, '2026-05-03', 'paid', 'Bank Transfer', 'Bulk dummy income entry #12', NULL, NULL, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(19, 'INV-20260411164329-11', 'Abdul Miah', 'Turbo100', 'Client Billing Collection', 1400.00, 1400.00, '2026-04-18', 'paid', 'cash', 'Auto-created from billing payment collection', 1, 0, 151, 151, '2026-04-11 14:49:57', '2026-04-11 14:49:57'),
(20, 'INV-20260412163202-12', 'MD Akon', 'Turbo100', 'Client Billing Collection', 1400.00, 1400.00, '2026-04-19', 'paid', 'cash', 'Auto-created from billing payment collection', 2, 0, 59, 59, '2026-04-12 14:32:16', '2026-04-12 14:32:16'),
(21, 'INV-20260414003401-12', 'MD Akon', 'Premium 40 Mbps', 'Client Billing Collection', 2200.00, 2200.00, '2026-04-21', 'paid', 'cash', 'Auto-created from billing payment collection', 3, 13, 59, 59, '2026-04-13 22:34:11', '2026-04-13 22:34:11'),
(22, 'PSL-202604-FC00', 'MD Akon', 'Premium 40 Mbps', 'Client Payment Submission', 2200.00, 0.00, '2026-04-30', 'pending', 'card', 'Auto-created from client portal payment submit (awaiting confirmation)', NULL, 4, NULL, NULL, '2026-04-13 22:35:35', '2026-04-13 22:35:35'),
(23, 'INV-20260414003635-12', 'MD Akon', 'Premium 40 Mbps', 'Client Billing Collection', 2200.00, 2200.00, '2026-04-21', 'paid', 'card', 'Auto-created from billing payment collection', 4, 14, 59, 59, '2026-04-13 22:36:40', '2026-04-13 22:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `internet_packages`
--

CREATE TABLE `internet_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `tagline` varchar(180) DEFAULT NULL,
  `speed_mbps` int(10) UNSIGNED NOT NULL,
  `upload_mbps` int(10) UNSIGNED DEFAULT NULL,
  `monthly_price` decimal(10,2) NOT NULL,
  `data_limit_gb` int(10) UNSIGNED DEFAULT NULL,
  `support_level` varchar(60) DEFAULT NULL,
  `router_included` tinyint(1) NOT NULL DEFAULT 0,
  `installation_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `internet_packages`
--

INSERT INTO `internet_packages` (`id`, `package_name`, `tagline`, `speed_mbps`, `upload_mbps`, `monthly_price`, `data_limit_gb`, `support_level`, `router_included`, `installation_fee`, `is_popular`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Starter 10 Mbps', NULL, 10, NULL, 1000.00, NULL, NULL, 0, 0.00, 0, 1, '2026-03-28 14:07:48', '2026-03-28 14:07:48'),
(2, 'Standard 20 Mbps', NULL, 20, NULL, 1500.00, NULL, NULL, 0, 0.00, 0, 1, '2026-03-28 14:07:48', '2026-03-28 14:07:48'),
(3, 'Premium 40 Mbps', NULL, 40, NULL, 2200.00, NULL, NULL, 0, 0.00, 0, 1, '2026-03-28 14:07:48', '2026-03-28 14:07:48'),
(4, 'Turbo100', 'Gaming With Low Latency', 100, 100, 1400.00, 100, '24/7 Premium Desk', 0, 0.00, 0, 1, '2026-04-11 11:23:51', '2026-04-11 11:23:51'),
(5, 'Druto 200', 'Gaming With Low Latency', 200, 200, 2000.00, 200, '24/7 Premium Desk', 0, 500.00, 0, 1, '2026-04-12 14:49:43', '2026-04-12 14:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_items`
--

CREATE TABLE `inventory_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `item_code` varchar(40) NOT NULL,
  `unit` varchar(20) NOT NULL DEFAULT 'pcs',
  `qty_in_stock` int(11) NOT NULL DEFAULT 0,
  `reorder_level` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `category_name` varchar(120) DEFAULT NULL,
  `unit_label` varchar(40) DEFAULT NULL,
  `min_stock` decimal(12,2) NOT NULL DEFAULT 0.00,
  `current_stock` decimal(12,2) NOT NULL DEFAULT 0.00,
  `unit_cost` decimal(12,2) NOT NULL DEFAULT 0.00,
  `active_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by_employee_id` int(11) DEFAULT NULL,
  `assigned_to_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_items`
--

INSERT INTO `inventory_items` (`id`, `item_name`, `item_code`, `unit`, `qty_in_stock`, `reorder_level`, `created_at`, `updated_at`, `category_name`, `unit_label`, `min_stock`, `current_stock`, `unit_cost`, `active_status`, `created_by_employee_id`, `assigned_to_employee_id`) VALUES
(1, 'Core Router - Dummy', 'ITM-DMY-ROUTER-001', 'pcs', 0, 0, '2026-03-28 15:23:49', '2026-03-28 15:23:49', 'Network Equipment', 'pcs', 2.00, 8.00, 18500.00, 1, 37, 38),
(2, 'GPON ONU Device - Dummy', 'ITM-DMY-ONU-002', 'pcs', 0, 0, '2026-03-28 15:23:49', '2026-03-28 15:23:49', 'CPE', 'pcs', 10.00, 60.00, 2300.00, 1, 37, 38),
(3, 'Dummy Inventory Item 1', 'ITM-BULK-001', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Consumables', 'pcs', 5.00, 12.00, 575.00, 1, 37, 38),
(4, 'Dummy Inventory Item 2', 'ITM-BULK-002', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Network Equipment', 'pcs', 5.00, 14.00, 650.00, 1, 37, 38),
(5, 'Dummy Inventory Item 3', 'ITM-BULK-003', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Consumables', 'pcs', 5.00, 16.00, 725.00, 1, 37, 38),
(6, 'Dummy Inventory Item 4', 'ITM-BULK-004', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Network Equipment', 'pcs', 5.00, 18.00, 800.00, 1, 37, 38),
(7, 'Dummy Inventory Item 5', 'ITM-BULK-005', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Consumables', 'pcs', 5.00, 20.00, 875.00, 1, 37, 38),
(8, 'Dummy Inventory Item 6', 'ITM-BULK-006', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Network Equipment', 'pcs', 5.00, 22.00, 950.00, 1, 37, 38),
(9, 'Dummy Inventory Item 7', 'ITM-BULK-007', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Consumables', 'pcs', 5.00, 24.00, 1025.00, 1, 37, 38),
(10, 'Dummy Inventory Item 8', 'ITM-BULK-008', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Network Equipment', 'pcs', 5.00, 26.00, 1100.00, 1, 37, 38),
(11, 'Dummy Inventory Item 9', 'ITM-BULK-009', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Consumables', 'pcs', 5.00, 28.00, 1175.00, 1, 37, 38),
(12, 'Dummy Inventory Item 10', 'ITM-BULK-010', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Network Equipment', 'pcs', 5.00, 30.00, 1250.00, 1, 37, 38),
(13, 'Dummy Inventory Item 11', 'ITM-BULK-011', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Consumables', 'pcs', 5.00, 32.00, 1325.00, 1, 37, 38),
(14, 'Dummy Inventory Item 12', 'ITM-BULK-012', 'pcs', 0, 0, '2026-03-28 15:27:02', '2026-03-28 15:27:02', 'Network Equipment', 'pcs', 5.00, 34.00, 1400.00, 1, 37, 38);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_movements`
--

CREATE TABLE `inventory_movements` (
  `id` int(10) UNSIGNED NOT NULL,
  `inventory_item_id` int(10) UNSIGNED NOT NULL,
  `movement_type` enum('IN','OUT','ADJUST') NOT NULL,
  `quantity` decimal(12,2) NOT NULL,
  `unit_cost` decimal(12,2) DEFAULT NULL,
  `reference_label` varchar(80) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by_employee_id` int(11) DEFAULT NULL,
  `assigned_to_employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_movements`
--

INSERT INTO `inventory_movements` (`id`, `inventory_item_id`, `movement_type`, `quantity`, `unit_cost`, `reference_label`, `notes`, `created_by_employee_id`, `assigned_to_employee_id`, `created_at`) VALUES
(1, 1, 'IN', 8.00, 18500.00, 'OPEN-ITM-DMY-ROUTER-001', 'Initial dummy stock movement', 37, 38, '2026-03-28 15:23:49'),
(2, 2, 'IN', 60.00, 2300.00, 'OPEN-ITM-DMY-ONU-002', 'Initial dummy stock movement', 37, 38, '2026-03-28 15:23:49'),
(3, 3, 'IN', 12.00, 575.00, 'BULK-OPEN-001', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02'),
(4, 4, 'IN', 14.00, 650.00, 'BULK-OPEN-002', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02'),
(5, 5, 'IN', 16.00, 725.00, 'BULK-OPEN-003', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02'),
(6, 6, 'IN', 18.00, 800.00, 'BULK-OPEN-004', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02'),
(7, 7, 'IN', 20.00, 875.00, 'BULK-OPEN-005', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02'),
(8, 8, 'IN', 22.00, 950.00, 'BULK-OPEN-006', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02'),
(9, 9, 'IN', 24.00, 1025.00, 'BULK-OPEN-007', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02'),
(10, 10, 'IN', 26.00, 1100.00, 'BULK-OPEN-008', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02'),
(11, 11, 'IN', 28.00, 1175.00, 'BULK-OPEN-009', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02'),
(12, 12, 'IN', 30.00, 1250.00, 'BULK-OPEN-010', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02'),
(13, 13, 'IN', 32.00, 1325.00, 'BULK-OPEN-011', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02'),
(14, 14, 'IN', 34.00, 1400.00, 'BULK-OPEN-012', 'Bulk dummy opening stock', 37, 38, '2026-03-28 15:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(40) NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `billing_month` date NOT NULL,
  `due_date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `status` enum('paid','unpaid','partial','overdue') NOT NULL DEFAULT 'unpaid',
  `generated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `paid_at` datetime DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_no`, `client_id`, `billing_month`, `due_date`, `amount`, `status`, `generated_at`, `paid_at`, `notes`) VALUES
(1, 'INV-20260411164329-11', 11, '2026-04-01', '2026-04-18', 1400.00, 'paid', '2026-04-11 20:43:29', '2026-04-11 16:49:57', NULL),
(2, 'INV-20260412163202-12', 12, '2026-04-01', '2026-04-19', 1400.00, 'paid', '2026-04-12 20:32:02', '2026-04-12 16:32:16', NULL),
(3, 'INV-20260414003401-12', 12, '2026-04-01', '2026-04-21', 2200.00, 'paid', '2026-04-14 04:34:01', '2026-04-14 00:34:11', NULL),
(4, 'INV-20260414003635-12', 12, '2026-04-01', '2026-04-21', 2200.00, 'paid', '2026-04-14 04:36:35', '2026-04-14 00:36:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_attachments`
--

CREATE TABLE `leave_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_request_id` bigint(20) UNSIGNED NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `stored_name` varchar(255) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `mime_type` varchar(120) NOT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `uploaded_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_attachments`
--

INSERT INTO `leave_attachments` (`id`, `leave_request_id`, `original_name`, `stored_name`, `file_path`, `mime_type`, `file_size`, `uploaded_by_employee_id`, `created_at`) VALUES
(1, 8, 'srejon_ahamed_joy.jpg', '8_20260410_163748_a03e7740_srejon_ahamed_joy.jpg', 'uploads/leave_attachments/8_20260410_163748_a03e7740_srejon_ahamed_joy.jpg', 'image/jpeg', 94191, 37, '2026-04-10 14:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_code` varchar(40) DEFAULT NULL,
  `employee_name` varchar(140) DEFAULT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `leave_type` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_days` int(11) NOT NULL DEFAULT 1,
  `reason_text` text DEFAULT NULL,
  `applied_on` date DEFAULT NULL,
  `status_label` enum('pending','approved','rejected','cancelled') NOT NULL DEFAULT 'pending',
  `reject_reason` text DEFAULT NULL,
  `created_by_employee_id` int(11) DEFAULT NULL,
  `assigned_to_employee_id` int(11) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `approval_status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `employee_code`, `employee_name`, `department_name`, `employee_id`, `leave_type`, `start_date`, `end_date`, `total_days`, `reason_text`, `applied_on`, `status_label`, `reject_reason`, `created_by_employee_id`, `assigned_to_employee_id`, `reason`, `approval_status`, `approved_by`, `approved_at`, `created_at`) VALUES
(9, '2026006', 'Akib Ahmed', 'Admin', 154, 'sick', '2026-04-12', '2026-04-12', 1, 'Reason: sadsa\nSession: full\nReporting Manager: Tasnim Rahman\nContact During Leave: 01756202157123213\nAlternate Email: akibahmed@promee.internet\nHandover Plan: sads', '2026-04-11', 'approved', NULL, 154, 59, NULL, 'pending', NULL, NULL, '2026-04-11 16:51:59'),
(10, '2026001', 'Srejon Joy', 'Admin', 59, 'sick', '2026-04-13', '2026-04-13', 1, 'Reason: sdsad\nSession: full\nReporting Manager: Srejon Joy\nContact During Leave: 01756202157\nAlternate Email: adminmanager@promee.internet\nHandover Plan: sdasda', '2026-04-12', 'approved', NULL, 59, 59, NULL, 'pending', NULL, NULL, '2026-04-12 14:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `left_clients`
--

CREATE TABLE `left_clients` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `original_client_code` varchar(100) DEFAULT NULL,
  `termination_date` date NOT NULL,
  `termination_reason` varchar(100) DEFAULT NULL,
  `pending_dues` decimal(10,2) DEFAULT 0.00,
  `equipment_status` varchar(50) DEFAULT NULL,
  `final_reading` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `left_clients`
--

INSERT INTO `left_clients` (`id`, `client_id`, `original_client_code`, `termination_date`, `termination_reason`, `pending_dues`, `equipment_status`, `final_reading`, `notes`, `created_at`) VALUES
(1, 1, 'CL-0001', '2026-04-05', 'relocation', 0.00, 'returned', NULL, 'adasd | sadasd', '2026-04-04 12:19:40'),
(2, 3, 'CL-0003', '2026-04-05', 'service', 0.00, 'returned', NULL, 'sadsd | 1212', '2026-04-04 12:40:21'),
(3, 11, 'pic2026001', '2026-04-30', 'price', 0.00, 'returned', NULL, 'sads | asdasd', '2026-04-11 15:14:33');

-- --------------------------------------------------------

--
-- Table structure for table `mikrotik_bulk_import_rows`
--

CREATE TABLE `mikrotik_bulk_import_rows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` varchar(60) NOT NULL,
  `uploaded_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `full_name` varchar(120) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `email` varchar(180) DEFAULT NULL,
  `national_id` varchar(40) DEFAULT NULL,
  `address_line` varchar(255) DEFAULT NULL,
  `zone_name` varchar(80) DEFAULT NULL,
  `connection_type` varchar(40) DEFAULT NULL,
  `server_name` varchar(80) DEFAULT NULL,
  `protocol_type` varchar(40) DEFAULT NULL,
  `profile_name` varchar(80) DEFAULT NULL,
  `username` varchar(120) DEFAULT NULL,
  `password_plain` varchar(120) DEFAULT NULL,
  `customer_type` varchar(40) DEFAULT NULL,
  `package_name` varchar(100) DEFAULT NULL,
  `billing_status` varchar(40) DEFAULT NULL,
  `monthly_bill` decimal(10,2) DEFAULT NULL,
  `bill_month` varchar(20) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `row_status` enum('pending','imported','error') NOT NULL DEFAULT 'pending',
  `status_note` varchar(255) DEFAULT NULL,
  `linked_client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payheads`
--

CREATE TABLE `payheads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payhead_name` varchar(100) NOT NULL,
  `payhead_type` enum('allowance','deduction') NOT NULL,
  `amount_type` enum('fixed','percentage') NOT NULL DEFAULT 'fixed',
  `default_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `method` enum('cash','bank','mobile_banking','card') NOT NULL DEFAULT 'cash',
  `transaction_ref` varchar(100) DEFAULT NULL,
  `collected_by` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_date` datetime NOT NULL DEFAULT current_timestamp(),
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `invoice_id`, `client_id`, `amount`, `method`, `transaction_ref`, `collected_by`, `payment_date`, `notes`) VALUES
(11, 1, 11, 1400.00, 'cash', 'Joy', NULL, '2026-04-11 20:49:57', NULL),
(12, 2, 12, 1400.00, 'cash', 'joy', NULL, '2026-04-12 20:32:16', NULL),
(13, 3, 12, 2200.00, 'cash', 'Joy', NULL, '2026-04-14 04:34:11', NULL),
(14, 4, 12, 2200.00, 'card', 'Joy', NULL, '2026-04-14 04:36:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_items`
--

CREATE TABLE `payroll_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_run_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `basic_salary` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_allowance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_deduction` decimal(12,2) NOT NULL DEFAULT 0.00,
  `net_salary` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_runs`
--

CREATE TABLE `payroll_runs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_month` date NOT NULL,
  `generated_by` bigint(20) UNSIGNED NOT NULL,
  `generated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `position_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `department_id`, `position_name`, `created_at`) VALUES
(75, 29, 'Manager', '2026-04-11 09:25:31'),
(76, 39, 'Manager', '2026-04-11 09:42:25'),
(77, 29, 'Director', '2026-04-11 10:08:35'),
(78, 29, 'Senior Officer', '2026-04-11 10:10:31'),
(79, 40, 'Director IT', '2026-04-11 10:12:28'),
(80, 40, 'Officer', '2026-04-11 10:13:59'),
(81, 41, 'Manager', '2026-04-11 10:16:06'),
(82, 41, 'Engineer', '2026-04-11 10:16:28'),
(83, 42, 'Manager', '2026-04-11 10:53:02'),
(84, 42, 'Stuff', '2026-04-11 10:54:33'),
(85, 43, 'Manager', '2026-04-11 10:55:25'),
(86, 43, 'Officer', '2026-04-11 10:56:15'),
(87, 39, 'Senior Officer', '2026-04-11 10:58:09'),
(88, 45, 'Officer', '2026-04-11 10:59:03'),
(89, 42, 'Technician', '2026-04-11 11:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `position_access_modules`
--

CREATE TABLE `position_access_modules` (
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(120) NOT NULL,
  `permission_level` enum('full','view','limited','none') NOT NULL DEFAULT 'none',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `position_access_modules`
--

INSERT INTO `position_access_modules` (`position_id`, `module_name`, `permission_level`, `created_at`, `updated_at`) VALUES
(75, 'Add Employee', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Add New Client', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Apply Leave', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Attendance', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Billing', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Bulk Client Import', 'view', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Change Request', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Client', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Client List', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Dashboard', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Department', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Employee List', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Events & Holidays', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'HR & Payroll', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Income', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Internet Packages', 'full', '2026-04-11 09:39:47', '2026-04-11 11:22:42'),
(75, 'Inventory', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Leave Management', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Left Client', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Mikrotik Server', 'view', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'New Request', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'New Ticket', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Payhead', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Payroll', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Portal Manage', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Position', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Resign Rule', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Resignation', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Salary Sheet', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Scheduler', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Service History', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Support & Ticketing', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Support Team', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Task Management', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Ticket List', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(75, 'Ticket Reports', 'full', '2026-04-11 09:39:47', '2026-04-11 09:39:47'),
(76, 'Add Employee', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Add New Client', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Apply Leave', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Assets', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Attendance', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Bulk Client Import', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Change Request', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Client', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Client List', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Dashboard', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Department', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Employee List', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Events & Holidays', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'HR & Payroll', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Income', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Inventory', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Leave Management', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Left Client', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Mikrotik Server', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'New Request', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Payhead', 'view', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Payroll', 'view', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Portal Manage', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Position', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Purchase', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Resign Rule', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Resignation', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Salary Sheet', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Scheduler', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(76, 'Task Management', 'full', '2026-04-11 10:57:11', '2026-04-11 10:57:11'),
(77, 'Add Employee', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Add New Client', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Apply Leave', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Assets', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Attendance', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Billing', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Bulk Client Import', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Change Request', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Client', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Client List', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Dashboard', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Department', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Employee List', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Events & Holidays', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'HR & Payroll', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Income', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Internet Packages', 'full', '2026-04-11 10:08:35', '2026-04-11 11:22:42'),
(77, 'Inventory', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Leave Management', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Left Client', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Mikrotik Server', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'New Request', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'New Ticket', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Payhead', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Payroll', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Portal Manage', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Position', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Purchase', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Resign Rule', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Resignation', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Salary Sheet', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Scheduler', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Service History', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Support & Ticketing', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Support Team', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Task Management', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Ticket List', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(77, 'Ticket Reports', 'full', '2026-04-11 10:08:35', '2026-04-11 10:08:35'),
(78, 'Add Employee', 'view', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Add New Client', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Apply Leave', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Assets', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Attendance', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Billing', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Bulk Client Import', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Change Request', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Client', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Client List', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Dashboard', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Department', 'view', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Employee List', 'view', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Events & Holidays', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'HR & Payroll', 'view', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Income', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Internet Packages', 'view', '2026-04-11 10:10:31', '2026-04-11 11:22:42'),
(78, 'Inventory', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Leave Management', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Left Client', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Mikrotik Server', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'New Request', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'New Ticket', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Payhead', 'view', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Payroll', 'view', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Portal Manage', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Position', 'view', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Purchase', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Resign Rule', 'view', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Resignation', 'view', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Salary Sheet', 'view', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Scheduler', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Service History', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Support & Ticketing', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Support Team', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Task Management', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Ticket List', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(78, 'Ticket Reports', 'full', '2026-04-11 10:10:31', '2026-04-11 10:10:31'),
(79, 'Add Employee', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Add New Client', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Apply Leave', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Assets', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Attendance', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Bulk Client Import', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Change Request', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Client', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Client List', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Dashboard', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Department', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Employee List', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Events & Holidays', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'HR & Payroll', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Income', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Internet Packages', 'view', '2026-04-11 10:12:28', '2026-04-11 11:22:42'),
(79, 'Inventory', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Leave Management', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Left Client', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Mikrotik Server', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'New Request', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'New Ticket', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Payhead', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Payroll', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Portal Manage', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Position', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Purchase', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Resign Rule', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Resignation', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Salary Sheet', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Scheduler', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Service History', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Support & Ticketing', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Support Team', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Task Management', 'view', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Ticket List', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(79, 'Ticket Reports', 'full', '2026-04-11 10:12:28', '2026-04-11 10:12:28'),
(80, 'Add Employee', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Add New Client', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Apply Leave', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Assets', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Attendance', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Bulk Client Import', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Change Request', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Client', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Client List', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Dashboard', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Department', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Employee List', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Events & Holidays', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'HR & Payroll', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Income', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Internet Packages', 'view', '2026-04-11 10:13:59', '2026-04-11 11:22:42'),
(80, 'Inventory', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Leave Management', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Left Client', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Mikrotik Server', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'New Request', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'New Ticket', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Payhead', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Payroll', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Portal Manage', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Position', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Purchase', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Resign Rule', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Resignation', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Salary Sheet', 'view', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Scheduler', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Service History', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Support & Ticketing', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Support Team', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Task Management', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Ticket List', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(80, 'Ticket Reports', 'full', '2026-04-11 10:13:59', '2026-04-11 10:13:59'),
(81, 'Add New Client', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Apply Leave', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Assets', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Attendance', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Bulk Client Import', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Change Request', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Client', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Client List', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Dashboard', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Employee List', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Events & Holidays', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'HR & Payroll', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Income', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Inventory', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Leave Management', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Left Client', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Mikrotik Server', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'New Request', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'New Ticket', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Portal Manage', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Purchase', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Resign Rule', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Resignation', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Scheduler', 'view', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Service History', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Support & Ticketing', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Support Team', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Task Management', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Ticket List', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(81, 'Ticket Reports', 'full', '2026-04-11 10:16:06', '2026-04-11 10:16:06'),
(82, 'Add New Client', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Apply Leave', 'full', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Assets', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Attendance', 'full', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Change Request', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Client', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Client List', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Dashboard', 'full', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Employee List', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Events & Holidays', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'HR & Payroll', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Income', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Inventory', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Leave Management', 'full', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Left Client', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'New Request', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'New Ticket', 'full', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Portal Manage', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Purchase', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Resign Rule', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Resignation', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Salary Sheet', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Scheduler', 'view', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Service History', 'full', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Support & Ticketing', 'full', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Support Team', 'full', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Task Management', 'full', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Ticket List', 'full', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(82, 'Ticket Reports', 'full', '2026-04-11 10:51:18', '2026-04-11 10:51:18'),
(83, 'Add New Client', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Apply Leave', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Attendance', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Billing', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Change Request', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Client', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Client List', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Dashboard', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Employee List', 'view', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Events & Holidays', 'view', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'HR & Payroll', 'view', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Leave Management', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Left Client', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'New Request', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'New Ticket', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Portal Manage', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Resign Rule', 'view', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Resignation', 'view', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Scheduler', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Service History', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Support & Ticketing', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Support Team', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Task Management', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Ticket List', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(83, 'Ticket Reports', 'full', '2026-04-11 10:53:02', '2026-04-11 10:53:02'),
(84, 'Add Employee', 'view', '2026-04-11 11:47:03', '2026-04-11 11:47:03'),
(84, 'Apply Leave', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Attendance', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Billing', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Change Request', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Client', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Client List', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Dashboard', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Department', 'view', '2026-04-11 11:47:03', '2026-04-11 11:47:03'),
(84, 'Employee List', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Events & Holidays', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'HR & Payroll', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Internet Packages', 'view', '2026-04-11 11:47:03', '2026-04-11 11:47:03'),
(84, 'Leave Management', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Left Client', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'New Request', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'New Ticket', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Payhead', 'view', '2026-04-11 11:47:03', '2026-04-11 11:47:03'),
(84, 'Payroll', 'view', '2026-04-11 11:47:03', '2026-04-11 11:47:03'),
(84, 'Portal Manage', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Position', 'view', '2026-04-11 11:47:03', '2026-04-11 11:47:03'),
(84, 'Resign Rule', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Resignation', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Salary Sheet', 'view', '2026-04-11 11:47:03', '2026-04-11 11:47:03'),
(84, 'Scheduler', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Service History', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Support & Ticketing', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Support Team', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Task Management', 'view', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Ticket List', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(84, 'Ticket Reports', 'full', '2026-04-11 10:54:33', '2026-04-11 10:54:33'),
(85, 'Add Employee', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Apply Leave', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Assets', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Attendance', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Billing', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Bulk Client Import', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Dashboard', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Department', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Employee List', 'view', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Events & Holidays', 'view', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'HR & Payroll', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Income', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Internet Packages', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Inventory', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Leave Management', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Mikrotik Server', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Payhead', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Payroll', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Position', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Purchase', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Resign Rule', 'view', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Resignation', 'view', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(85, 'Salary Sheet', 'full', '2026-04-11 11:58:30', '2026-04-11 11:58:30'),
(86, 'Apply Leave', 'full', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Assets', 'full', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Dashboard', 'full', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Employee List', 'view', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Events & Holidays', 'view', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'HR & Payroll', 'full', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Income', 'full', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Inventory', 'full', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Leave Management', 'full', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Payhead', 'view', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Payroll', 'view', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Purchase', 'full', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Resign Rule', 'view', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Resignation', 'view', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(86, 'Salary Sheet', 'full', '2026-04-11 10:56:15', '2026-04-11 10:56:15'),
(87, 'Add Employee', 'full', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Apply Leave', 'full', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Assets', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Attendance', 'full', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Billing', 'full', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Bulk Client Import', 'full', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Dashboard', 'full', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Department', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Employee List', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Events & Holidays', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'HR & Payroll', 'full', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Income', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Inventory', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Leave Management', 'full', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Mikrotik Server', 'full', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Payhead', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Payroll', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Position', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Purchase', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Resign Rule', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Resignation', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(87, 'Salary Sheet', 'view', '2026-04-11 10:58:09', '2026-04-11 10:58:09'),
(88, 'Add Employee', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Add New Client', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Apply Leave', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Assets', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Attendance', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Billing', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Change Request', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Client', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Client List', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Dashboard', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Department', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Employee List', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Events & Holidays', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'HR & Payroll', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Income', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Internet Packages', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Inventory', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Leave Management', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Left Client', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'New Request', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Payhead', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Payroll', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Portal Manage', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Position', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Purchase', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Resign Rule', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Resignation', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Salary Sheet', 'view', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(88, 'Scheduler', 'full', '2026-04-11 12:54:10', '2026-04-11 12:54:10'),
(89, 'Add Employee', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Add New Client', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Apply Leave', 'full', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Assets', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Attendance', 'full', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Billing', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Bulk Client Import', 'none', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Change Request', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Client', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Client List', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Dashboard', 'full', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Department', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Employee List', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Events & Holidays', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'HR & Payroll', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Income', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Internet Packages', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Inventory', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Leave Management', 'full', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Left Client', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Mikrotik Server', 'none', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'New Request', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'New Ticket', 'full', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Payhead', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Payroll', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Portal Manage', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Position', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Purchase', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Resign Rule', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Resignation', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Salary Sheet', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Scheduler', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Service History', 'full', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Support & Ticketing', 'full', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Support Team', 'full', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Task Management', 'view', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Ticket List', 'full', '2026-04-11 13:33:49', '2026-04-11 13:33:49'),
(89, 'Ticket Reports', 'full', '2026-04-11 13:33:49', '2026-04-11 13:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `position_module_permissions`
--

CREATE TABLE `position_module_permissions` (
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(120) NOT NULL,
  `permission_level` varchar(20) NOT NULL DEFAULT 'view'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `position_module_permissions`
--

INSERT INTO `position_module_permissions` (`position_id`, `module_name`, `permission_level`) VALUES
(56, 'Client', 'view'),
(56, 'Dashboard', 'view'),
(56, 'Support & Ticketing', 'full'),
(56, 'Task Management', 'limited');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `total_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `inventory_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `line_total` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_number` varchar(40) NOT NULL,
  `order_date` date NOT NULL,
  `vendor_name` varchar(150) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `requested_by_name` varchar(120) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `status_label` enum('Pending','Approved','Received','Partial','Cancelled') NOT NULL DEFAULT 'Pending',
  `notes` text DEFAULT NULL,
  `total_amount` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_to_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `po_number`, `order_date`, `vendor_name`, `category_name`, `requested_by_name`, `delivery_date`, `status_label`, `notes`, `total_amount`, `created_by_employee_id`, `assigned_to_employee_id`, `created_at`, `updated_at`) VALUES
(1, 'PO-DMY-001', '2026-03-28', 'FiberTech Supplies Ltd', 'Networking', 'Admin / Director Dummy', '2026-04-27', 'Approved', 'Dummy purchase order for OLT accessories', 24000.00, 37, 37, '2026-03-28 15:23:49', '2026-03-28 15:24:28'),
(2, 'PO-DMY-002', '2026-03-23', 'PowerGrid Equipments', 'Electrical', 'Admin / Director Dummy', '2026-04-07', 'Approved', 'Dummy purchase order for UPS batteries', 25600.00, 37, 38, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(3, 'PO-BULK-001', '2026-03-27', 'Dummy Vendor 1', 'Electrical', 'Admin / Director Dummy', '2026-04-03', 'Approved', 'Bulk dummy purchase order #1', 10170.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(4, 'PO-BULK-002', '2026-03-26', 'Dummy Vendor 2', 'Networking', 'Admin / Director Dummy', '2026-04-04', 'Received', 'Bulk dummy purchase order #2', 13480.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(5, 'PO-BULK-003', '2026-03-25', 'Dummy Vendor 3', 'Electrical', 'Admin / Director Dummy', '2026-04-05', 'Partial', 'Bulk dummy purchase order #3', 16930.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(6, 'PO-BULK-004', '2026-03-24', 'Dummy Vendor 4', 'Networking', 'Admin / Director Dummy', '2026-04-06', 'Cancelled', 'Bulk dummy purchase order #4', 20520.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(7, 'PO-BULK-005', '2026-03-23', 'Dummy Vendor 5', 'Electrical', 'Admin / Director Dummy', '2026-04-07', 'Pending', 'Bulk dummy purchase order #5', 24250.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(8, 'PO-BULK-006', '2026-03-22', 'Dummy Vendor 6', 'Networking', 'Admin / Director Dummy', '2026-04-08', 'Approved', 'Bulk dummy purchase order #6', 28120.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(9, 'PO-BULK-007', '2026-03-21', 'Dummy Vendor 7', 'Electrical', 'Admin / Director Dummy', '2026-04-09', 'Received', 'Bulk dummy purchase order #7', 32130.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(10, 'PO-BULK-008', '2026-03-20', 'Dummy Vendor 8', 'Networking', 'Admin / Director Dummy', '2026-04-10', 'Partial', 'Bulk dummy purchase order #8', 36280.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(11, 'PO-BULK-009', '2026-03-19', 'Dummy Vendor 9', 'Electrical', 'Admin / Director Dummy', '2026-04-11', 'Cancelled', 'Bulk dummy purchase order #9', 40570.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(12, 'PO-BULK-010', '2026-03-18', 'Dummy Vendor 10', 'Networking', 'Admin / Director Dummy', '2026-04-12', 'Pending', 'Bulk dummy purchase order #10', 45000.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(13, 'PO-BULK-011', '2026-03-17', 'Dummy Vendor 11', 'Electrical', 'Admin / Director Dummy', '2026-04-13', 'Approved', 'Bulk dummy purchase order #11', 49570.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(14, 'PO-BULK-012', '2026-03-16', 'Dummy Vendor 12', 'Networking', 'Admin / Director Dummy', '2026-04-14', 'Received', 'Bulk dummy purchase order #12', 54280.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(15, 'PO-20260414-8607', '2026-04-13', 'FiberTech Supplies Ltd', 'Electrical', 'Admin', NULL, 'Approved', NULL, 5000.00, 59, 59, '2026-04-13 22:40:31', '2026-04-13 22:40:31');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(180) NOT NULL,
  `quantity` decimal(12,2) NOT NULL DEFAULT 0.00,
  `unit_price` decimal(14,2) NOT NULL DEFAULT 0.00,
  `line_total` decimal(14,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `purchase_order_id`, `item_name`, `quantity`, `unit_price`, `line_total`, `created_at`) VALUES
(1, 1, 'SFP Module', 10.00, 1800.00, 18000.00, '2026-03-28 15:23:49'),
(2, 1, 'Patch Cord', 50.00, 120.00, 6000.00, '2026-03-28 15:23:49'),
(3, 2, 'UPS Battery 12V', 8.00, 3200.00, 25600.00, '2026-03-28 15:23:49'),
(4, 3, 'Dummy PO Item A 1', 6.00, 420.00, 2520.00, '2026-03-28 15:27:02'),
(5, 3, 'Dummy PO Item B 1', 3.00, 2550.00, 7650.00, '2026-03-28 15:27:02'),
(6, 4, 'Dummy PO Item A 2', 7.00, 440.00, 3080.00, '2026-03-28 15:27:02'),
(7, 4, 'Dummy PO Item B 2', 4.00, 2600.00, 10400.00, '2026-03-28 15:27:02'),
(8, 5, 'Dummy PO Item A 3', 8.00, 460.00, 3680.00, '2026-03-28 15:27:02'),
(9, 5, 'Dummy PO Item B 3', 5.00, 2650.00, 13250.00, '2026-03-28 15:27:02'),
(10, 6, 'Dummy PO Item A 4', 9.00, 480.00, 4320.00, '2026-03-28 15:27:02'),
(11, 6, 'Dummy PO Item B 4', 6.00, 2700.00, 16200.00, '2026-03-28 15:27:02'),
(12, 7, 'Dummy PO Item A 5', 10.00, 500.00, 5000.00, '2026-03-28 15:27:02'),
(13, 7, 'Dummy PO Item B 5', 7.00, 2750.00, 19250.00, '2026-03-28 15:27:02'),
(14, 8, 'Dummy PO Item A 6', 11.00, 520.00, 5720.00, '2026-03-28 15:27:02'),
(15, 8, 'Dummy PO Item B 6', 8.00, 2800.00, 22400.00, '2026-03-28 15:27:02'),
(16, 9, 'Dummy PO Item A 7', 12.00, 540.00, 6480.00, '2026-03-28 15:27:02'),
(17, 9, 'Dummy PO Item B 7', 9.00, 2850.00, 25650.00, '2026-03-28 15:27:02'),
(18, 10, 'Dummy PO Item A 8', 13.00, 560.00, 7280.00, '2026-03-28 15:27:02'),
(19, 10, 'Dummy PO Item B 8', 10.00, 2900.00, 29000.00, '2026-03-28 15:27:02'),
(20, 11, 'Dummy PO Item A 9', 14.00, 580.00, 8120.00, '2026-03-28 15:27:02'),
(21, 11, 'Dummy PO Item B 9', 11.00, 2950.00, 32450.00, '2026-03-28 15:27:02'),
(22, 12, 'Dummy PO Item A 10', 15.00, 600.00, 9000.00, '2026-03-28 15:27:02'),
(23, 12, 'Dummy PO Item B 10', 12.00, 3000.00, 36000.00, '2026-03-28 15:27:02'),
(24, 13, 'Dummy PO Item A 11', 16.00, 620.00, 9920.00, '2026-03-28 15:27:02'),
(25, 13, 'Dummy PO Item B 11', 13.00, 3050.00, 39650.00, '2026-03-28 15:27:02'),
(26, 14, 'Dummy PO Item A 12', 17.00, 640.00, 10880.00, '2026-03-28 15:27:02'),
(27, 14, 'Dummy PO Item B 12', 14.00, 3100.00, 43400.00, '2026-03-28 15:27:02'),
(28, 15, 'Wire', 500.00, 10.00, 5000.00, '2026-04-13 22:40:31');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Admin', 'Full access administrator', '2026-04-11 09:14:42');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_name` varchar(120) NOT NULL,
  `contact_person` varchar(120) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `address_line` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_appointments`
--

CREATE TABLE `support_appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_code` varchar(40) NOT NULL,
  `request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `request_code` varchar(40) DEFAULT NULL,
  `client_name` varchar(150) NOT NULL,
  `client_phone` varchar(40) NOT NULL,
  `client_address` varchar(255) NOT NULL,
  `appointment_type` varchar(50) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `technician_employee_id` bigint(20) UNSIGNED NOT NULL,
  `technician_name` varchar(150) NOT NULL,
  `priority` varchar(20) NOT NULL DEFAULT 'normal',
  `status` varchar(20) NOT NULL DEFAULT 'scheduled',
  `notes` text DEFAULT NULL,
  `created_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_to_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_appointments`
--

INSERT INTO `support_appointments` (`id`, `appointment_code`, `request_id`, `request_code`, `client_name`, `client_phone`, `client_address`, `appointment_type`, `appointment_date`, `appointment_time`, `technician_employee_id`, `technician_name`, `priority`, `status`, `notes`, `created_by_employee_id`, `assigned_to_employee_id`, `created_at`, `updated_at`) VALUES
(1, 'APT-202604-0001', 1, 'NRQ-202604-0001', 'Joy Client Reques', '213213123', 'Khilgaon,Dhaka-1219', 'installation', '2026-04-05', '09:00:00', 57, 'Technician Dummy', 'normal', 'scheduled', 'asdsad', 37, 57, '2026-04-04 12:07:12', '2026-04-04 12:07:12'),
(2, 'APT-202604-0002', 2, 'NRQ-202604-0002', 'Abdul', '012321321', 'Khilgaon,Dhaka-1219', 'installation', '2026-04-12', '09:00:00', 161, 'Srejon Ahmed', 'urgent', 'scheduled', 'Do necesary updates', 162, 161, '2026-04-11 13:02:46', '2026-04-11 13:02:46'),
(3, 'APT-202604-0003', 2, 'NRQ-202604-0002', 'Abdul', '012321321', 'Khilgaon,Dhaka-1219', 'installation', '2026-04-12', '09:00:00', 166, 'Srejon Ahmed', 'normal', 'scheduled', NULL, 59, 166, '2026-04-12 14:24:06', '2026-04-12 14:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_no` varchar(40) NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `priority` enum('low','medium','high','critical') NOT NULL DEFAULT 'medium',
  `status` enum('open','in_progress','resolved','closed') NOT NULL DEFAULT 'open',
  `assigned_to` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `resolved_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_items`
--

CREATE TABLE `task_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_code` varchar(30) NOT NULL,
  `title` varchar(220) NOT NULL,
  `category_name` varchar(80) NOT NULL,
  `assignee_name` varchar(120) NOT NULL,
  `priority_label` enum('Critical','High','Medium','Low') NOT NULL DEFAULT 'Medium',
  `status_label` enum('Pending','In Progress','On Hold','Completed','Overdue') NOT NULL DEFAULT 'Pending',
  `progress_percent` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `due_date` date NOT NULL,
  `reference_code` varchar(80) DEFAULT NULL,
  `description_text` text DEFAULT NULL,
  `created_by_name` varchar(120) DEFAULT NULL,
  `created_by_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assigned_to_employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_items`
--

INSERT INTO `task_items` (`id`, `task_code`, `title`, `category_name`, `assignee_name`, `priority_label`, `status_label`, `progress_percent`, `due_date`, `reference_code`, `description_text`, `created_by_name`, `created_by_employee_id`, `assigned_to_employee_id`, `created_at`, `updated_at`) VALUES
(1, 'TSK-001', 'Router firmware upgrade - Zone A', 'Network', 'Rakib Hasan', 'Critical', 'In Progress', 60, '2026-04-22', NULL, 'Upgrade MikroTik routers in Zone A to latest stable firmware and verify rollback plan.', 'Admin', NULL, NULL, '2026-04-10 14:54:41', '2026-04-10 14:54:41'),
(2, 'TSK-002', 'New fiber installation - Client C-4512', 'Field Work', 'Jahidul Islam', 'High', 'Pending', 0, '2026-04-25', 'C-4512', 'Install drop cable and ONU at client premises and run final optical test.', 'Admin', NULL, NULL, '2026-04-10 14:54:41', '2026-04-10 14:54:41'),
(3, 'TSK-003', 'Overdue invoice follow-up - April batch', 'Billing', 'Sumaiya Akter', 'High', 'Pending', 10, '2026-04-20', NULL, 'Call and notify clients with unpaid invoices over 30 days.', 'Admin', NULL, NULL, '2026-04-10 14:54:41', '2026-04-10 14:54:41'),
(4, 'TSK-004', 'IP pool expansion - CGNAT block', 'IT/Server', 'Tanvir Ahmed', 'Medium', 'In Progress', 45, '2026-04-28', NULL, 'Allocate additional address block and update NAT rules.', 'Admin', NULL, NULL, '2026-04-10 14:54:41', '2026-04-10 14:54:41'),
(5, 'TSK-005', 'Resolve TKT-1023 slow speed complaint', 'Client Service', 'Nusrat Jahan', 'High', 'In Progress', 80, '2026-04-21', 'TKT-1023', 'Audit QoS profile and line health for the affected client.', 'Support', NULL, NULL, '2026-04-10 14:54:41', '2026-04-10 14:54:41'),
(6, 'TSK-006', 'Monthly bandwidth usage report', 'IT/Server', 'Rakib Hasan', 'Low', 'Completed', 100, '2026-04-18', NULL, 'Generate and mail monthly usage report to management.', 'Admin', NULL, NULL, '2026-04-10 14:54:41', '2026-04-10 14:54:41'),
(7, 'TSK-007', 'Cable fault repair - Zone C trunk', 'Field Work', 'Jahidul Islam', 'Critical', 'Overdue', 30, '2026-04-18', 'TKT-1018', 'Repair trunk cable affecting multiple clients in Zone C.', 'Support', NULL, NULL, '2026-04-10 14:54:41', '2026-04-10 14:54:41'),
(8, 'TSK-008', 'New connection request - Client C-4590', 'Client Service', 'Sumaiya Akter', 'Medium', 'Pending', 0, '2026-05-01', 'C-4590', 'Prepare onboarding, installation slot and billing profile.', 'Admin', NULL, NULL, '2026-04-10 14:54:41', '2026-04-10 14:54:41'),
(9, 'TSK-009', 'Server room UPS battery replacement', 'IT/Server', 'Tanvir Ahmed', 'High', 'On Hold', 20, '2026-04-27', NULL, 'Replace faulty UPS batteries after procurement delivery.', 'Admin', NULL, NULL, '2026-04-10 14:54:42', '2026-04-10 14:54:42'),
(10, 'TSK-010', 'Customer portal bulk password reset', 'Client Service', 'Nusrat Jahan', 'Low', 'Completed', 100, '2026-04-16', NULL, 'Assist clients with account recovery and reset actions.', 'Support', NULL, NULL, '2026-04-10 14:54:42', '2026-04-10 14:54:42'),
(11, 'TSK-011', 'ASdasd', 'Network', 'Jahidul Islam', 'Critical', 'Completed', 100, '2026-04-07', 'sad', 'sadsa', 'Admin / Director Dummy', 37, 37, '2026-04-10 15:00:28', '2026-04-11 09:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `phone`, `password_hash`, `role_id`, `is_active`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 'Website Super Admin', 'superadmin@isp.local', '', '$2y$10$PHZ3STRHOBCnsU24zDmr7.BSAZBMecgwnvjHBu515BHFOMfYIhdTm', 1, 1, '2026-04-11 15:46:39', '2026-04-11 09:14:42', '2026-04-11 09:46:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_tag` (`asset_tag`),
  ADD KEY `fk_assets_employee` (`assigned_to_employee_id`);

--
-- Indexes for table `assets_items`
--
ALTER TABLE `assets_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_tag` (`asset_tag`),
  ADD KEY `idx_assets_type` (`type_name`),
  ADD KEY `idx_assets_status` (`status_label`),
  ADD KEY `idx_assets_created_by` (`created_by_employee_id`),
  ADD KEY `idx_assets_assigned_to` (`assigned_to_employee_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_attendance_employee_date` (`employee_id`,`attendance_date`);

--
-- Indexes for table `bandwidth_purchases`
--
ALTER TABLE `bandwidth_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_code` (`client_code`),
  ADD KEY `idx_clients_road` (`road_no`),
  ADD KEY `idx_clients_ward` (`ward`),
  ADD KEY `idx_clients_zone` (`zone_name`),
  ADD KEY `fk_clients_package` (`package_id`);

--
-- Indexes for table `client_connection_requests`
--
ALTER TABLE `client_connection_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_code` (`request_code`),
  ADD KEY `idx_ccr_status` (`status`),
  ADD KEY `idx_ccr_phone` (`phone`),
  ADD KEY `idx_ccr_created_at` (`created_at`),
  ADD KEY `idx_ccr_created_by` (`created_by_employee_id`),
  ADD KEY `idx_ccr_assigned_to` (`assigned_to_employee_id`);

--
-- Indexes for table `client_portal_payments`
--
ALTER TABLE `client_portal_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payslip_no` (`payslip_no`),
  ADD KEY `idx_cpp_client_id` (`client_id`);

--
-- Indexes for table `client_portal_settings`
--
ALTER TABLE `client_portal_settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- Indexes for table `client_portal_tickets`
--
ALTER TABLE `client_portal_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_no` (`ticket_no`),
  ADD KEY `idx_client_tickets_client_id` (`client_id`),
  ADD KEY `idx_client_tickets_status` (`status`);

--
-- Indexes for table `client_service_requests`
--
ALTER TABLE `client_service_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_code` (`request_code`),
  ADD KEY `idx_csr_client` (`client_id`),
  ADD KEY `idx_csr_kind` (`request_kind`),
  ADD KEY `idx_csr_status` (`status`),
  ADD KEY `idx_csr_effective_date` (`effective_date`),
  ADD KEY `idx_csr_created_by` (`created_by_employee_id`);

--
-- Indexes for table `complaint_categories`
--
ALTER TABLE `complaint_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `department_name` (`department_name`);

--
-- Indexes for table `department_access_modules`
--
ALTER TABLE `department_access_modules`
  ADD PRIMARY KEY (`department_id`,`module_name`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_code` (`employee_code`),
  ADD KEY `fk_employees_department` (`department_id`),
  ADD KEY `fk_employees_position` (`position_id`);

--
-- Indexes for table `employee_profiles`
--
ALTER TABLE `employee_profiles`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `nid` (`nid`);

--
-- Indexes for table `events_holidays`
--
ALTER TABLE `events_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_events_type` (`event_type`),
  ADD KEY `idx_events_date` (`event_date`),
  ADD KEY `idx_events_created_by` (`created_by_employee_id`),
  ADD KEY `idx_events_assigned_to` (`assigned_to_employee_id`);

--
-- Indexes for table `financial_transactions`
--
ALTER TABLE `financial_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_financial_type_date` (`transaction_type`,`transaction_date`);

--
-- Indexes for table `hr_payheads`
--
ALTER TABLE `hr_payheads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_hr_payheads_code` (`payhead_code`),
  ADD UNIQUE KEY `uq_hr_payheads_name` (`payhead_name`);

--
-- Indexes for table `hr_payroll_items`
--
ALTER TABLE `hr_payroll_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_hr_payroll_run_employee` (`payroll_run_id`,`employee_id`),
  ADD KEY `idx_hr_payroll_items_employee` (`employee_id`);

--
-- Indexes for table `hr_payroll_runs`
--
ALTER TABLE `hr_payroll_runs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_hr_payroll_runs_month` (`payroll_month`);

--
-- Indexes for table `hr_resignations`
--
ALTER TABLE `hr_resignations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hr_resignations_status` (`status_label`),
  ADD KEY `idx_hr_resignations_submitted` (`submitted_on`),
  ADD KEY `idx_hr_resignations_employee` (`employee_id`);

--
-- Indexes for table `hr_resignation_rules`
--
ALTER TABLE `hr_resignation_rules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_hr_resignation_rules_name` (`rule_name`);

--
-- Indexes for table `income_entries`
--
ALTER TABLE `income_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_income_type` (`income_type`),
  ADD KEY `idx_income_status` (`status_label`),
  ADD KEY `idx_income_due_date` (`due_date`),
  ADD KEY `idx_income_created_by` (`created_by_employee_id`),
  ADD KEY `idx_income_assigned_to` (`assigned_to_employee_id`);

--
-- Indexes for table `internet_packages`
--
ALTER TABLE `internet_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_items`
--
ALTER TABLE `inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_code` (`item_code`);

--
-- Indexes for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_inventory_movements_item` (`inventory_item_id`),
  ADD KEY `idx_inventory_movements_scope_created` (`created_by_employee_id`),
  ADD KEY `idx_inventory_movements_scope_assigned` (`assigned_to_employee_id`),
  ADD KEY `idx_inventory_movements_created_at` (`created_at`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`),
  ADD KEY `idx_invoices_status` (`status`),
  ADD KEY `fk_invoices_client` (`client_id`);

--
-- Indexes for table `leave_attachments`
--
ALTER TABLE `leave_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_leave_attachments_request` (`leave_request_id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_leave_employee` (`employee_id`),
  ADD KEY `fk_leave_approved_by` (`approved_by`);

--
-- Indexes for table `left_clients`
--
ALTER TABLE `left_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mikrotik_bulk_import_rows`
--
ALTER TABLE `mikrotik_bulk_import_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mikrotik_bulk_batch` (`batch_id`),
  ADD KEY `idx_mikrotik_bulk_status` (`row_status`),
  ADD KEY `idx_mikrotik_bulk_expires` (`expires_at`),
  ADD KEY `idx_mikrotik_bulk_user` (`uploaded_by_employee_id`);

--
-- Indexes for table `payheads`
--
ALTER TABLE `payheads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payments_invoice` (`invoice_id`),
  ADD KEY `fk_payments_client` (`client_id`),
  ADD KEY `fk_payments_collected_by` (`collected_by`);

--
-- Indexes for table `payroll_items`
--
ALTER TABLE `payroll_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payroll_items_run` (`payroll_run_id`),
  ADD KEY `fk_payroll_items_employee` (`employee_id`);

--
-- Indexes for table `payroll_runs`
--
ALTER TABLE `payroll_runs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_payroll_generated_by` (`generated_by`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_positions_department` (`department_id`);

--
-- Indexes for table `position_access_modules`
--
ALTER TABLE `position_access_modules`
  ADD PRIMARY KEY (`position_id`,`module_name`);

--
-- Indexes for table `position_module_permissions`
--
ALTER TABLE `position_module_permissions`
  ADD PRIMARY KEY (`position_id`,`module_name`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_purchases_supplier` (`supplier_id`),
  ADD KEY `fk_purchases_created_by` (`created_by`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_purchase_items_purchase` (`purchase_id`),
  ADD KEY `fk_purchase_items_inventory` (`inventory_item_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `po_number` (`po_number`),
  ADD KEY `idx_purchase_status` (`status_label`),
  ADD KEY `idx_purchase_vendor` (`vendor_name`),
  ADD KEY `idx_purchase_created_by` (`created_by_employee_id`),
  ADD KEY `idx_purchase_assigned_to` (`assigned_to_employee_id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_purchase_order_items_order` (`purchase_order_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_appointments`
--
ALTER TABLE `support_appointments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appointment_code` (`appointment_code`),
  ADD KEY `idx_sa_date` (`appointment_date`),
  ADD KEY `idx_sa_status` (`status`),
  ADD KEY `idx_sa_technician` (`technician_employee_id`),
  ADD KEY `idx_sa_request` (`request_id`),
  ADD KEY `idx_sa_scope_created` (`created_by_employee_id`),
  ADD KEY `idx_sa_scope_assigned` (`assigned_to_employee_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_no` (`ticket_no`),
  ADD KEY `fk_tickets_client` (`client_id`),
  ADD KEY `fk_tickets_category` (`category_id`),
  ADD KEY `fk_tickets_assigned_to` (`assigned_to`),
  ADD KEY `fk_tickets_created_by` (`created_by`);

--
-- Indexes for table `task_items`
--
ALTER TABLE `task_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `task_code` (`task_code`),
  ADD KEY `idx_task_status` (`status_label`),
  ADD KEY `idx_task_priority` (`priority_label`),
  ADD KEY `idx_task_due` (`due_date`),
  ADD KEY `idx_task_assignee` (`assignee_name`),
  ADD KEY `idx_task_creator` (`created_by_employee_id`),
  ADD KEY `idx_task_assigned_employee` (`assigned_to_employee_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_users_role` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets_items`
--
ALTER TABLE `assets_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bandwidth_purchases`
--
ALTER TABLE `bandwidth_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `client_connection_requests`
--
ALTER TABLE `client_connection_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client_portal_payments`
--
ALTER TABLE `client_portal_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client_portal_tickets`
--
ALTER TABLE `client_portal_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client_service_requests`
--
ALTER TABLE `client_service_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `complaint_categories`
--
ALTER TABLE `complaint_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `events_holidays`
--
ALTER TABLE `events_holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `financial_transactions`
--
ALTER TABLE `financial_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_payheads`
--
ALTER TABLE `hr_payheads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hr_payroll_items`
--
ALTER TABLE `hr_payroll_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `hr_payroll_runs`
--
ALTER TABLE `hr_payroll_runs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hr_resignations`
--
ALTER TABLE `hr_resignations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hr_resignation_rules`
--
ALTER TABLE `hr_resignation_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `income_entries`
--
ALTER TABLE `income_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `internet_packages`
--
ALTER TABLE `internet_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory_items`
--
ALTER TABLE `inventory_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `leave_attachments`
--
ALTER TABLE `leave_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `left_clients`
--
ALTER TABLE `left_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mikrotik_bulk_import_rows`
--
ALTER TABLE `mikrotik_bulk_import_rows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payheads`
--
ALTER TABLE `payheads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payroll_items`
--
ALTER TABLE `payroll_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_runs`
--
ALTER TABLE `payroll_runs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_appointments`
--
ALTER TABLE `support_appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_items`
--
ALTER TABLE `task_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_assets_employee` FOREIGN KEY (`assigned_to_employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_attendance_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `fk_clients_package` FOREIGN KEY (`package_id`) REFERENCES `internet_packages` (`id`);

--
-- Constraints for table `client_portal_payments`
--
ALTER TABLE `client_portal_payments`
  ADD CONSTRAINT `fk_cpp_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `department_access_modules`
--
ALTER TABLE `department_access_modules`
  ADD CONSTRAINT `fk_dept_access_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `fk_employees_position` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`);

--
-- Constraints for table `employee_profiles`
--
ALTER TABLE `employee_profiles`
  ADD CONSTRAINT `fk_employee_profiles_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hr_payroll_items`
--
ALTER TABLE `hr_payroll_items`
  ADD CONSTRAINT `fk_hr_payroll_item_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hr_payroll_item_run` FOREIGN KEY (`payroll_run_id`) REFERENCES `hr_payroll_runs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_invoices_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `fk_leave_approved_by` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_leave_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `fk_payments_collected_by` FOREIGN KEY (`collected_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_payments_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`);

--
-- Constraints for table `payroll_items`
--
ALTER TABLE `payroll_items`
  ADD CONSTRAINT `fk_payroll_items_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `fk_payroll_items_run` FOREIGN KEY (`payroll_run_id`) REFERENCES `payroll_runs` (`id`);

--
-- Constraints for table `payroll_runs`
--
ALTER TABLE `payroll_runs`
  ADD CONSTRAINT `fk_payroll_generated_by` FOREIGN KEY (`generated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `fk_positions_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `position_access_modules`
--
ALTER TABLE `position_access_modules`
  ADD CONSTRAINT `fk_position_access_position` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `fk_purchases_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_purchases_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `fk_purchase_items_inventory` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_items` (`id`),
  ADD CONSTRAINT `fk_purchase_items_purchase` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`);

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `fk_purchase_order_items_order` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `fk_tickets_assigned_to` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_tickets_category` FOREIGN KEY (`category_id`) REFERENCES `complaint_categories` (`id`),
  ADD CONSTRAINT `fk_tickets_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `fk_tickets_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
