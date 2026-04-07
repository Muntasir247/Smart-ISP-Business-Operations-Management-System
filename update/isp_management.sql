-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2026 at 04:31 PM
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

INSERT INTO `clients` (`id`, `client_code`, `full_name`, `address_line`, `road_no`, `ward`, `zone_name`, `phone`, `email`, `connection_username`, `connection_email`, `connection_password_hash`, `package_id`, `created_by_employee_id`, `assigned_to_employee_id`, `connection_start_date`, `payment_cycle`, `status`, `left_date`, `left_reason`, `created_at`, `updated_at`, `onu_mac`, `router_ip`, `nid`, `birth_date`, `connection_type`, `referral_name`, `emergency_contact`, `notes`, `payment_cycle_date`) VALUES
(1, 'CL-0001', 'Rahim Uddin', '01710000001, Uttara, Dhaka', 'ROAD-01', 'WARD-1', 'ZONE-A', '01710000001', 'client01@example.test', 'user01', 'client01@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', 1, 37, 37, '2026-03-19', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:01', '192.168.1.101', '1999900000001', '1996-01-01', 'Home', 'Referral 1', '01890000001', 'Dummy seeded client for testing', 1),
(2, 'CL-0002', 'Karim Hossain', '01710000002, Mirpur, Dhaka', 'ROAD-02', 'WARD-2', 'ZONE-B', '01710000002', 'client02@example.test', 'user02', 'client02@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', 2, 37, 38, '2026-03-20', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:02', '192.168.1.102', '1999900000002', '1996-01-02', 'Home', 'Referral 2', '01890000002', 'Dummy seeded client for testing', 2),
(3, 'CL-0003', 'Nadia Akter', '01710000003, Banani, Dhaka', 'ROAD-03', 'WARD-3', 'ZONE-C', '01710000003', 'client03@example.test', 'user03', 'client03@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', 3, 37, 39, '2026-03-21', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:03', '192.168.1.103', '1999900000003', '1996-01-03', 'Home', 'Referral 3', '01890000003', 'Dummy seeded client for testing', 3),
(4, 'CL-0004', 'Sadia Sultana', '01710000004, Mohakhali, Dhaka', 'ROAD-04', 'WARD-4', 'ZONE-A', '01710000004', 'client04@example.test', 'user04', 'client04@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', 1, 37, 37, '2026-03-22', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:04', '192.168.1.104', '1999900000004', '1996-01-04', 'Home', 'Referral 4', '01890000004', 'Dummy seeded client for testing', 4),
(5, 'CL-0005', 'Jahid Hasan', '01710000005, Rampura, Dhaka', 'ROAD-05', 'WARD-5', 'ZONE-B', '01710000005', 'client05@example.test', 'user05', 'client05@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', 2, 37, 38, '2026-03-23', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:05', '192.168.1.105', '1999900000005', '1996-01-05', 'Home', 'Referral 5', '01890000005', 'Dummy seeded client for testing', 5),
(6, 'CL-0006', 'Mim Islam', '01710000006, Bashundhara, Dhaka', 'ROAD-06', 'WARD-6', 'ZONE-C', '01710000006', 'client06@example.test', 'user06', 'client06@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', 3, 37, 39, '2026-03-24', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:06', '192.168.1.106', '1999900000006', '1996-01-06', 'Home', 'Referral 6', '01890000006', 'Dummy seeded client for testing', 6),
(7, 'CL-0007', 'Tanvir Ahmed', '01710000007, Dhanmondi, Dhaka', 'ROAD-07', 'WARD-7', 'ZONE-A', '01710000007', 'client07@example.test', 'user07', 'client07@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', 1, 37, 37, '2026-03-25', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:07', '192.168.1.107', '1999900000007', '1996-01-07', 'Home', 'Referral 7', '01890000007', 'Dummy seeded client for testing', 7),
(8, 'CL-0008', 'Ritu Akter', '01710000008, Jatrabari, Dhaka', 'ROAD-08', 'WARD-8', 'ZONE-B', '01710000008', 'client08@example.test', 'user08', 'client08@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', 2, 37, 38, '2026-03-26', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:08', '192.168.1.108', '1999900000008', '1996-01-08', 'Home', 'Referral 8', '01890000008', 'Dummy seeded client for testing', 8),
(9, 'CL-0009', 'Sabbir Khan', '01710000009, Wari, Dhaka', 'ROAD-09', 'WARD-9', 'ZONE-C', '01710000009', 'client09@example.test', 'user09', 'client09@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', 3, 37, 39, '2026-03-27', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:09', '192.168.1.109', '1999900000009', '1996-01-09', 'Home', 'Referral 9', '01890000009', 'Dummy seeded client for testing', 9),
(10, 'CL-0010', 'Sharmin Nahar', '01710000010, Shyamoli, Dhaka', 'ROAD-10', 'WARD-10', 'ZONE-A', '01710000010', 'client10@example.test', 'user10', 'client10@client.test', '$2y$10$H7a.W5W52wcIHBXUEmTLteJqtSladQKlIl/b3sPshASbpUJRUOgFa', 1, 37, 37, '2026-03-28', 'monthly', 'active', NULL, NULL, '2026-03-28 14:07:48', '2026-03-28 14:07:48', 'AA:BB:CC:DD:EE:0a', '192.168.1.110', '1999900000010', '1996-01-10', 'Home', 'Referral 10', '01890000010', 'Dummy seeded client for testing', 10);

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(19, 'Administration', '2026-03-28 14:05:53'),
(20, 'IT & Network', '2026-03-28 14:05:53'),
(21, 'NOC', '2026-03-28 14:05:53'),
(22, 'Support', '2026-03-28 14:05:53'),
(23, 'Accounts', '2026-03-28 14:05:53'),
(24, 'HR', '2026-03-28 14:05:53'),
(25, 'Sales', '2026-03-28 14:05:54'),
(26, 'Operations / Field', '2026-03-28 14:05:54'),
(27, 'Procurement / Store', '2026-03-28 14:05:54'),
(28, 'Security', '2026-03-28 14:33:12');

-- --------------------------------------------------------

--
-- Table structure for table `department_access_modules`
--

CREATE TABLE `department_access_modules` (
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department_access_modules`
--

INSERT INTO `department_access_modules` (`department_id`, `module_name`, `created_at`) VALUES
(19, 'Assets', '2026-03-28 14:05:53'),
(19, 'Billing', '2026-03-28 14:05:53'),
(19, 'Client', '2026-03-28 14:05:53'),
(19, 'Dashboard', '2026-03-28 14:05:53'),
(19, 'Events & Holidays', '2026-03-28 14:05:53'),
(19, 'HR & Payroll', '2026-03-28 14:05:53'),
(19, 'Income', '2026-03-28 14:05:53'),
(19, 'Inventory', '2026-03-28 14:05:53'),
(19, 'Leave Management', '2026-03-28 14:05:53'),
(19, 'Mikrotik Server', '2026-03-28 14:05:53'),
(19, 'Purchase', '2026-03-28 14:05:53'),
(19, 'Support & Ticketing', '2026-03-28 14:05:53'),
(19, 'Task Management', '2026-03-28 14:05:53'),
(20, 'Assets', '2026-03-28 14:05:53'),
(20, 'Client', '2026-03-28 14:05:53'),
(20, 'Dashboard', '2026-03-28 14:05:53'),
(20, 'Inventory', '2026-03-28 14:05:53'),
(20, 'Mikrotik Server', '2026-03-28 14:05:53'),
(20, 'Task Management', '2026-03-28 14:05:53'),
(21, 'Client', '2026-03-28 14:05:53'),
(21, 'Dashboard', '2026-03-28 14:05:53'),
(21, 'Mikrotik Server', '2026-03-28 14:05:53'),
(21, 'Support & Ticketing', '2026-03-28 14:05:53'),
(21, 'Task Management', '2026-03-28 14:05:53'),
(22, 'Client', '2026-03-28 14:05:53'),
(22, 'Dashboard', '2026-03-28 14:05:53'),
(22, 'Support & Ticketing', '2026-03-28 14:05:53'),
(22, 'Task Management', '2026-03-28 14:05:53'),
(23, 'Assets', '2026-03-28 14:05:53'),
(23, 'Billing', '2026-03-28 14:05:53'),
(23, 'Dashboard', '2026-03-28 14:05:53'),
(23, 'Income', '2026-03-28 14:05:53'),
(23, 'Inventory', '2026-03-28 14:05:53'),
(23, 'Purchase', '2026-03-28 14:05:53'),
(24, 'Dashboard', '2026-03-28 14:05:53'),
(24, 'Events & Holidays', '2026-03-28 14:05:54'),
(24, 'HR & Payroll', '2026-03-28 14:05:53'),
(24, 'Leave Management', '2026-03-28 14:05:54'),
(24, 'Task Management', '2026-03-28 14:05:54'),
(25, 'Billing', '2026-03-28 14:05:54'),
(25, 'Client', '2026-03-28 14:05:54'),
(25, 'Dashboard', '2026-03-28 14:05:54'),
(25, 'Income', '2026-03-28 14:05:54'),
(26, 'Assets', '2026-03-28 14:05:54'),
(26, 'Client', '2026-03-28 14:05:54'),
(26, 'Dashboard', '2026-03-28 14:05:54'),
(26, 'Inventory', '2026-03-28 14:05:54'),
(26, 'Support & Ticketing', '2026-03-28 14:05:54'),
(26, 'Task Management', '2026-03-28 14:05:54'),
(27, 'Assets', '2026-03-28 14:05:54'),
(27, 'Dashboard', '2026-03-28 14:05:54'),
(27, 'Inventory', '2026-03-28 14:05:54'),
(27, 'Purchase', '2026-03-28 14:05:54'),
(28, 'Dashboard', '2026-03-28 14:33:29'),
(28, 'Events & Holidays', '2026-03-28 14:33:29'),
(28, 'HR & Payroll', '2026-03-28 14:33:29');

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
(37, 'EMP-001', 'Admin / Director Dummy', '01700000001', 'admin.director@role.test', 19, 37, '2026-03-28', 25500.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(38, 'EMP-002', 'Admin Staff Dummy', '01700000002', 'admin.staff@role.test', 19, 38, '2026-03-28', 26000.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(39, 'EMP-003', 'IT Manager Dummy', '01700000003', 'it.manager@role.test', 20, 39, '2026-03-28', 26500.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(40, 'EMP-004', 'IT Staff Dummy', '01700000004', 'it.staff@role.test', 20, 40, '2026-03-28', 27000.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(41, 'EMP-005', 'NOC Manager Dummy', '01700000005', 'noc.manager@role.test', 21, 41, '2026-03-28', 27500.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(42, 'EMP-006', 'NOC Engineer Dummy', '01700000006', 'noc.engineer@role.test', 21, 42, '2026-03-28', 28000.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(43, 'EMP-007', 'Support Manager Dummy', '01700000007', 'support.manager@role.test', 22, 43, '2026-03-28', 28500.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(44, 'EMP-008', 'Support Staff Dummy', '01700000008', 'support.staff@role.test', 22, 44, '2026-03-28', 29000.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(45, 'EMP-009', 'Accounts Manager Dummy', '01700000009', 'accounts.manager@role.test', 23, 45, '2026-03-28', 29500.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(46, 'EMP-010', 'Accounts Staff Dummy', '01700000010', 'accounts.staff@role.test', 23, 46, '2026-03-28', 30000.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(47, 'EMP-011', 'HR Manager Dummy', '01700000011', 'hr.manager@role.test', 24, 47, '2026-03-28', 30500.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(48, 'EMP-012', 'HR Staff Dummy', '01700000012', 'hr.staff@role.test', 24, 48, '2026-03-28', 31000.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(49, 'EMP-013', 'Sales Manager Dummy', '017000000177', 'sales.manager@role.test', 25, 49, '2026-03-28', 31500.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:21:03'),
(50, 'EMP-014', 'Sales Executive Dummy', '01700000014', 'sales.executive@role.test', 25, 50, '2026-03-28', 32000.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(51, 'EMP-015', 'Operations Manager Dummy', '017000000156', 'operations.manager@role.test', 26, 51, '2026-03-28', 32500.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:19:59'),
(52, 'EMP-016', 'Field Staff Dummy', '01700000016', 'field.staff@role.test', 26, 52, '2026-03-28', 33000.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(53, 'EMP-017', 'Procurement Manager Dummy', '01700000017', 'procurement.manager@role.test', 27, 53, '2026-03-28', 33500.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(54, 'EMP-018', 'Store Keeper Dummy', '01700000018', 'store.keeper@role.test', 27, 54, '2026-03-28', 34000.00, 'active', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(55, '2026001', 'Srejon Joy', '01756202157', 'srejonhr@promee.internet', 24, 47, '2026-03-01', 13213.00, 'active', '2026-03-28 14:24:51', '2026-03-28 14:29:01'),
(56, '2026002', 'Srejon Joy', '12332', 'srejonhrs@promee.internet', 24, 48, '2026-03-01', 25000.00, 'active', '2026-03-28 14:31:00', '2026-03-28 14:53:18');

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
(37, 'Admin / Director', 'Admin / Director', 'Active', 'Not Specified', 'DUMMY-NID-0001', '1995-01-01', 'N/A', 'Permanent', '01700000001', 'Admin / Director Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Client\",\"Billing\",\"Mikrotik Server\",\"HR & Payroll\",\"Leave Management\",\"Events & Holidays\",\"Support & Ticketing\",\"Task Management\",\"Purchase\",\"Inventory\",\"Assets\",\"Income\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(38, 'Admin Staff', 'Admin Staff', 'Active', 'Not Specified', 'DUMMY-NID-0002', '1995-01-01', 'N/A', 'Permanent', '01700000002', 'Admin Staff Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Events & Holidays\",\"Task Management\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(39, 'IT Manager', 'IT Manager', 'Active', 'Not Specified', 'DUMMY-NID-0003', '1995-01-01', 'N/A', 'Permanent', '01700000003', 'IT Manager Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Client\",\"Mikrotik Server\",\"Task Management\",\"Inventory\",\"Assets\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(40, 'IT Staff', 'IT Staff', 'Active', 'Not Specified', 'DUMMY-NID-0004', '1995-01-01', 'N/A', 'Permanent', '01700000004', 'IT Staff Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Client\",\"Mikrotik Server\",\"Task Management\",\"Inventory\",\"Assets\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(41, 'NOC Manager', 'NOC Manager', 'Active', 'Not Specified', 'DUMMY-NID-0005', '1995-01-01', 'N/A', 'Permanent', '01700000005', 'NOC Manager Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Client\",\"Mikrotik Server\",\"Support & Ticketing\",\"Task Management\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(42, 'NOC Engineer', 'NOC Engineer', 'Active', 'Not Specified', 'DUMMY-NID-0006', '1995-01-01', 'N/A', 'Permanent', '01700000006', 'NOC Engineer Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Client\",\"Mikrotik Server\",\"Support & Ticketing\",\"Task Management\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(43, 'Support Manager', 'Support Manager', 'Active', 'Not Specified', 'DUMMY-NID-0007', '1995-01-01', 'N/A', 'Permanent', '01700000007', 'Support Manager Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Client\",\"Support & Ticketing\",\"Task Management\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(44, 'Support Staff', 'Support Staff', 'Active', 'Not Specified', 'DUMMY-NID-0008', '1995-01-01', 'N/A', 'Permanent', '01700000008', 'Support Staff Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Client\",\"Support & Ticketing\",\"Task Management\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(45, 'Accounts Manager', 'Accounts Manager', 'Active', 'Not Specified', 'DUMMY-NID-0009', '1995-01-01', 'N/A', 'Permanent', '01700000009', 'Accounts Manager Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Billing\",\"Purchase\",\"Inventory\",\"Assets\",\"Income\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(46, 'Accounts Staff', 'Accounts Staff', 'Active', 'Not Specified', 'DUMMY-NID-0010', '1995-01-01', 'N/A', 'Permanent', '01700000010', 'Accounts Staff Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Billing\",\"Purchase\",\"Inventory\",\"Assets\",\"Income\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(47, 'HR Manager', 'HR Manager', 'Active', 'Not Specified', 'DUMMY-NID-0011', '1995-01-01', 'N/A', 'Permanent', '01700000011', 'HR Manager Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"HR & Payroll\",\"Leave Management\",\"Events & Holidays\",\"Task Management\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(48, 'HR Staff', 'HR Staff', 'Active', 'Not Specified', 'DUMMY-NID-0012', '1995-01-01', 'N/A', 'Permanent', '01700000012', 'HR Staff Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"HR & Payroll\",\"Leave Management\",\"Events & Holidays\",\"Task Management\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(49, NULL, 'Sales Manager', 'Active', 'N/A', 'DUMMY-NID-0013', '1995-01-01', NULL, 'Permanent', '01700000013', 'Sales Manager Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', NULL, 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Client\",\"Billing\",\"Income\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:21:03'),
(50, 'Sales Executive', 'Sales Executive', 'Active', 'Not Specified', 'DUMMY-NID-0014', '1995-01-01', 'N/A', 'Permanent', '01700000014', 'Sales Executive Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Client\",\"Billing\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(51, NULL, 'Operations Manager', 'Active', 'N/A', 'DUMMY-NID-0015', '1995-01-01', NULL, 'Permanent', '01700000015', 'Operations Manager Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', NULL, 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Client\",\"Support & Ticketing\",\"Task Management\",\"Inventory\",\"Assets\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:19:59'),
(52, 'Field Staff', 'Field Staff', 'Active', 'Not Specified', 'DUMMY-NID-0016', '1995-01-01', 'N/A', 'Permanent', '01700000016', 'Field Staff Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Client\",\"Support & Ticketing\",\"Task Management\",\"Inventory\",\"Assets\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(53, 'Procurement Manager', 'Procurement Manager', 'Active', 'Not Specified', 'DUMMY-NID-0017', '1995-01-01', 'N/A', 'Permanent', '01700000017', 'Procurement Manager Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Purchase\",\"Inventory\",\"Assets\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(54, NULL, 'Store Keeper', 'Active', 'Not Specified', 'DUMMY-NID-0018', '1995-01-01', 'N/A', 'Permanent', '01700000018', 'Store Keeper Dummy', 'System Admin', 0.00, 0.00, 0.00, 'N/A', 'N/A', 'N/A', 2, 'Dummy Address', 'Dummy Address', 'Testing', 'Seeded test account', '[\"Dashboard\",\"Purchase\",\"Inventory\",\"Assets\"]', '$2y$10$.CIlPZg/lcVmlCcVZ58vFee0uLnsgFxfL0Lvnz5BiKFvSByDlu5Fe', '2026-03-28 14:05:54', '2026-03-28 14:23:38'),
(55, NULL, 'HR Manager', 'Active', 'Male', '2193898492', '2026-03-01', 'A+', 'Permanent', '1231310', 'sd', 'dfsdf', 213213.00, 3213123.00, 213213.00, 'Brac', '213', 'PhD', 2, '468/C', 'Sufia House', 'sdad', 'sdad', '[\"Dashboard\",\"HR & Payroll\",\"Leave Management\",\"Events & Holidays\",\"Task Management\"]', '$2y$10$ibwqTdHORSIjc2CkN8moWeAjhap0eXXPm4rUpG.15P8FNboJj6R3q', '2026-03-28 14:24:51', '2026-03-28 14:28:53'),
(56, NULL, 'HR Staff', 'Active', 'Male', '213213', '2026-03-01', 'A-', 'Permanent', '123213', 'Srejon Joy', 'sad', 12.00, 12.00, 12.00, 'Brac', '1212', 'Bachelor\'s', 1, 'Khilgaon,Dhaka-1219', 'Sufia House', 'dsas', 'dsa', '[\"Dashboard\",\"HR & Payroll\",\"Leave Management\",\"Events & Holidays\",\"Task Management\"]', '$2y$10$9w42aekIQF2kcJVDihk2JO9JeKd5NVB5HDnJz1kXFQEK5AgLkRZoO', '2026-03-28 14:31:00', '2026-03-28 14:50:01');

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
(1, 1, 56, 30, 25000.00, 12.00, 12.00, 12.00, 0.00, 0.00, 0.00, 1250.00, 750.00, 0.00, 0.00, 25036.00, 2000.00, 23036.00, 'Paid', NULL, '2026-03-28 16:18:27', '2026-03-28 15:18:27', '2026-03-28 15:18:27'),
(2, 1, 54, 30, 34000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1700.00, 1020.00, 0.00, 0.00, 34000.00, 2720.00, 31280.00, 'Paid', NULL, '2026-03-28 16:18:53', '2026-03-28 15:18:53', '2026-03-28 15:18:53');

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
(1, '2026-03', 30, 5.0000, 3.0000, 'Processed', '2026-03-28 16:18:53', 37, '2026-03-28 14:41:58', '2026-03-28 15:18:53');

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
(1, 'Dummy Standard Resignation Rule', 'Operations / Field', 'Permanent', 6, 30, 1, 1.50, 15, 1, '[\"Line Manager\",\"HR Manager\",\"Accounts Manager\"]', 'Active', 'Dummy default rule for regular resignation process', 37, 37, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(2, 'Dummy Contract End Rule', 'Procurement / Store', 'Contract', 3, 15, 0, 1.00, 10, 0, '[\"HR Staff\",\"Department Head\"]', 'Active', 'Dummy rule for fixed-term contracts', 37, 37, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(3, 'Dummy Bulk Resignation Rule 01', 'Procurement / Store', 'Permanent', 4, 30, 0, 1.00, 15, 0, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #1', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(4, 'Dummy Bulk Resignation Rule 02', 'Operations / Field', 'Permanent', 5, 45, 1, 1.50, 20, 1, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #2', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(5, 'Dummy Bulk Resignation Rule 03', 'Procurement / Store', 'Contract', 6, 15, 0, 1.00, 25, 0, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #3', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(6, 'Dummy Bulk Resignation Rule 04', 'Operations / Field', 'Permanent', 7, 30, 1, 1.50, 10, 1, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #4', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(7, 'Dummy Bulk Resignation Rule 05', 'Procurement / Store', 'Permanent', 8, 45, 0, 1.00, 15, 0, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #5', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(8, 'Dummy Bulk Resignation Rule 06', 'Operations / Field', 'Contract', 9, 15, 1, 1.50, 20, 1, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #6', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(9, 'Dummy Bulk Resignation Rule 07', 'Procurement / Store', 'Permanent', 10, 30, 0, 1.00, 25, 0, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #7', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(10, 'Dummy Bulk Resignation Rule 08', 'Operations / Field', 'Permanent', 11, 45, 1, 1.50, 10, 1, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #8', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(11, 'Dummy Bulk Resignation Rule 09', 'Procurement / Store', 'Contract', 12, 15, 0, 1.00, 15, 0, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #9', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(12, 'Dummy Bulk Resignation Rule 10', 'Operations / Field', 'Permanent', 13, 30, 1, 1.50, 20, 1, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #10', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(13, 'Dummy Bulk Resignation Rule 11', 'Procurement / Store', 'Permanent', 14, 45, 0, 1.00, 25, 0, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #11', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(14, 'Dummy Bulk Resignation Rule 12', 'Operations / Field', 'Contract', 15, 15, 1, 1.50, 10, 1, '[\"Line Manager\",\"HR\",\"Accounts\"]', 'Active', 'Bulk dummy resignation rule #12', 37, 37, '2026-03-28 15:27:02', '2026-03-28 15:27:02');

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
  `created_by_employee_id` int(11) DEFAULT NULL,
  `assigned_to_employee_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `income_entries`
--

INSERT INTO `income_entries` (`id`, `invoice_no`, `client_name`, `package_name`, `income_type`, `amount`, `paid_amount`, `due_date`, `status_label`, `payment_method`, `notes`, `created_by_employee_id`, `assigned_to_employee_id`, `created_at`, `updated_at`) VALUES
(1, 'INV-DMY-INC-001', 'Demo Client One', 'Business 100 Mbps', 'Monthly Subscription', 5000.00, 5000.00, '2026-03-28', 'paid', 'Bank Transfer', 'Dummy fully paid monthly income', 37, 38, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(2, 'INV-DMY-INC-002', 'Demo Client Two', 'Home 40 Mbps', 'Installation Charge', 3000.00, 1500.00, '2026-04-27', 'partial', 'Cash', 'Dummy partial payment income', 37, 38, '2026-03-28 15:23:49', '2026-03-28 15:23:49'),
(3, 'INV-BULK-001', 'Dummy Client 1', 'Home 40 Mbps', 'Installation Charge', 2350.00, 1175.00, '2026-03-31', 'partial', 'Cash', 'Bulk dummy income entry #1', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(4, 'INV-BULK-002', 'Dummy Client 2', 'Business 100 Mbps', 'Reconnect Fee', 2700.00, 0.00, '2026-04-03', 'pending', 'Bank Transfer', 'Bulk dummy income entry #2', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(5, 'INV-BULK-003', 'Dummy Client 3', 'Home 40 Mbps', 'Device Sale', 3050.00, 3050.00, '2026-04-06', 'paid', 'Cash', 'Bulk dummy income entry #3', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(6, 'INV-BULK-004', 'Dummy Client 4', 'Business 100 Mbps', 'Monthly Subscription', 3400.00, 1700.00, '2026-04-09', 'partial', 'Bank Transfer', 'Bulk dummy income entry #4', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(7, 'INV-BULK-005', 'Dummy Client 5', 'Home 40 Mbps', 'Installation Charge', 3750.00, 0.00, '2026-04-12', 'pending', 'Cash', 'Bulk dummy income entry #5', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(8, 'INV-BULK-006', 'Dummy Client 6', 'Business 100 Mbps', 'Reconnect Fee', 4100.00, 4100.00, '2026-04-15', 'paid', 'Bank Transfer', 'Bulk dummy income entry #6', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(9, 'INV-BULK-007', 'Dummy Client 7', 'Home 40 Mbps', 'Device Sale', 4450.00, 2225.00, '2026-04-18', 'partial', 'Cash', 'Bulk dummy income entry #7', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(10, 'INV-BULK-008', 'Dummy Client 8', 'Business 100 Mbps', 'Monthly Subscription', 4800.00, 0.00, '2026-04-21', 'pending', 'Bank Transfer', 'Bulk dummy income entry #8', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(11, 'INV-BULK-009', 'Dummy Client 9', 'Home 40 Mbps', 'Installation Charge', 5150.00, 5150.00, '2026-04-24', 'paid', 'Cash', 'Bulk dummy income entry #9', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(12, 'INV-BULK-010', 'Dummy Client 10', 'Business 100 Mbps', 'Reconnect Fee', 5500.00, 2750.00, '2026-04-27', 'partial', 'Bank Transfer', 'Bulk dummy income entry #10', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(13, 'INV-BULK-011', 'Dummy Client 11', 'Home 40 Mbps', 'Device Sale', 5850.00, 0.00, '2026-04-30', 'pending', 'Cash', 'Bulk dummy income entry #11', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02'),
(14, 'INV-BULK-012', 'Dummy Client 12', 'Business 100 Mbps', 'Monthly Subscription', 6200.00, 6200.00, '2026-05-03', 'paid', 'Bank Transfer', 'Bulk dummy income entry #12', 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `internet_packages`
--

CREATE TABLE `internet_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `speed_mbps` int(10) UNSIGNED NOT NULL,
  `monthly_price` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `internet_packages`
--

INSERT INTO `internet_packages` (`id`, `package_name`, `speed_mbps`, `monthly_price`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Starter 10 Mbps', 10, 1000.00, 1, '2026-03-28 14:07:48', '2026-03-28 14:07:48'),
(2, 'Standard 20 Mbps', 20, 1500.00, 1, '2026-03-28 14:07:48', '2026-03-28 14:07:48'),
(3, 'Premium 40 Mbps', 40, 2200.00, 1, '2026-03-28 14:07:48', '2026-03-28 14:07:48');

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

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `leave_type` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text DEFAULT NULL,
  `approval_status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(37, 19, 'Admin / Director', '2026-03-28 14:05:54'),
(38, 19, 'Admin Staff', '2026-03-28 14:05:54'),
(39, 20, 'IT Manager', '2026-03-28 14:05:54'),
(40, 20, 'IT Staff', '2026-03-28 14:05:54'),
(41, 21, 'NOC Manager', '2026-03-28 14:05:54'),
(42, 21, 'NOC Engineer', '2026-03-28 14:05:54'),
(43, 22, 'Support Manager', '2026-03-28 14:05:54'),
(44, 22, 'Support Staff', '2026-03-28 14:05:54'),
(45, 23, 'Accounts Manager', '2026-03-28 14:05:54'),
(46, 23, 'Accounts Staff', '2026-03-28 14:05:54'),
(47, 24, 'HR Manager', '2026-03-28 14:05:54'),
(48, 24, 'HR Staff', '2026-03-28 14:05:54'),
(49, 25, 'Sales Manager', '2026-03-28 14:05:54'),
(50, 25, 'Sales Executive', '2026-03-28 14:05:54'),
(51, 26, 'Operations Manager', '2026-03-28 14:05:54'),
(52, 26, 'Field Staff', '2026-03-28 14:05:54'),
(53, 27, 'Procurement Manager', '2026-03-28 14:05:54'),
(54, 27, 'Store Keeper', '2026-03-28 14:05:54'),
(55, 28, 'Guard', '2026-03-28 14:34:26');

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
(37, 'Assets', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'Billing', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'Client', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'Dashboard', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'Events & Holidays', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'HR & Payroll', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'Income', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'Inventory', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'Leave Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'Mikrotik Server', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'Purchase', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'Support & Ticketing', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(37, 'Task Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(38, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(38, 'Events & Holidays', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(38, 'Task Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(39, 'Assets', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(39, 'Client', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(39, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(39, 'Inventory', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(39, 'Mikrotik Server', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(39, 'Task Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(40, 'Assets', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(40, 'Client', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(40, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(40, 'Inventory', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(40, 'Mikrotik Server', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(40, 'Task Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(41, 'Client', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(41, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(41, 'Mikrotik Server', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(41, 'Support & Ticketing', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(41, 'Task Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(42, 'Client', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(42, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(42, 'Mikrotik Server', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(42, 'Support & Ticketing', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(42, 'Task Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(43, 'Client', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(43, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(43, 'Support & Ticketing', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(43, 'Task Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(44, 'Client', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(44, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(44, 'Support & Ticketing', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(44, 'Task Management', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(45, 'Assets', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(45, 'Billing', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(45, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(45, 'Income', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(45, 'Inventory', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(45, 'Purchase', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(46, 'Assets', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(46, 'Billing', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(46, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(46, 'Income', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(46, 'Inventory', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(46, 'Purchase', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(47, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(47, 'Events & Holidays', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(47, 'HR & Payroll', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(47, 'Leave Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(47, 'Task Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(48, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(48, 'Events & Holidays', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(48, 'HR & Payroll', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(48, 'Leave Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(48, 'Task Management', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(49, 'Billing', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(49, 'Client', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(49, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(49, 'Income', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(50, 'Billing', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(50, 'Client', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(50, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(51, 'Assets', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(51, 'Client', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(51, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(51, 'Inventory', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(51, 'Support & Ticketing', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(51, 'Task Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(52, 'Assets', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(52, 'Client', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(52, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(52, 'Inventory', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(52, 'Support & Ticketing', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(52, 'Task Management', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(53, 'Assets', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(53, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(53, 'Inventory', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(53, 'Purchase', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(54, 'Assets', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(54, 'Dashboard', 'view', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(54, 'Inventory', 'full', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(54, 'Purchase', 'limited', '2026-03-28 14:05:54', '2026-03-28 14:05:54'),
(55, 'Dashboard', 'view', '2026-03-28 14:34:26', '2026-03-28 14:34:26'),
(55, 'Events & Holidays', 'view', '2026-03-28 14:34:26', '2026-03-28 14:34:26');

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
(14, 'PO-BULK-012', '2026-03-16', 'Dummy Vendor 12', 'Networking', 'Admin / Director Dummy', '2026-04-14', 'Received', 'Bulk dummy purchase order #12', 54280.00, 37, 38, '2026-03-28 15:27:02', '2026-03-28 15:27:02');

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
(27, 14, 'Dummy PO Item B 12', 14.00, 3100.00, 43400.00, '2026-03-28 15:27:02');

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
-- Indexes for table `client_portal_payments`
--
ALTER TABLE `client_portal_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payslip_no` (`payslip_no`),
  ADD KEY `idx_cpp_client_id` (`client_id`);

--
-- Indexes for table `client_portal_tickets`
--
ALTER TABLE `client_portal_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_no` (`ticket_no`),
  ADD KEY `idx_client_tickets_client_id` (`client_id`),
  ADD KEY `idx_client_tickets_status` (`status`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bandwidth_purchases`
--
ALTER TABLE `bandwidth_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `client_portal_payments`
--
ALTER TABLE `client_portal_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_portal_tickets`
--
ALTER TABLE `client_portal_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_categories`
--
ALTER TABLE `complaint_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hr_payroll_runs`
--
ALTER TABLE `hr_payroll_runs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hr_resignations`
--
ALTER TABLE `hr_resignations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_resignation_rules`
--
ALTER TABLE `hr_resignation_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `income_entries`
--
ALTER TABLE `income_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `internet_packages`
--
ALTER TABLE `internet_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `left_clients`
--
ALTER TABLE `left_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payheads`
--
ALTER TABLE `payheads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
