-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2022 at 12:49 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(38, 2, 10, 500, 23, '2022-11-04 00:45:44'),
(39, 2, 9, 250, 27, '2022-11-04 00:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Stickeers', NULL, 1, '2021-06-21 10:17:41'),
(4, 'Posters', '', 1, '2021-06-21 16:34:04'),
(5, 'Card', '', 1, '2022-10-31 22:26:21'),
(6, 'Pack', '', 1, '2022-11-02 16:37:47');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(2, 'samer', 'gassouma', 'Male', '53249239', 'samer.samm12@gmail.com', 'f93aafbb1a8b07c2dad9114c3aca862b', 'adr adr', '2022-10-31 21:17:38');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `unit`, `price`, `size`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 'pcs', 250, 'M', '2021-06-21 13:01:30', '2021-06-21 13:05:23'),
(2, 1, 20, 'Sample', 300, 'L', '2021-06-21 13:07:00', NULL),
(3, 4, 150, 'pcs', 500, 'M', '2021-06-21 16:50:37', NULL),
(4, 3, 50, 'pack', 150, 'M', '2021-06-21 16:51:12', NULL),
(5, 5, 30, 'pcs', 50, 'M', '2021-06-21 16:51:35', NULL),
(6, 4, 10, 'pcs', 550, 'L', '2021-06-21 16:51:54', NULL),
(7, 6, 100, 'pcs', 150, 'S', '2021-06-22 15:50:47', NULL),
(8, 6, 150, 'pcs', 180, 'M', '2021-06-22 15:51:13', NULL),
(9, 7, 1, '500', 250, 'S', '2022-10-31 22:35:54', '2022-10-31 22:46:32'),
(10, 8, 1, '500', 500, 'S', '2022-10-31 22:38:12', NULL),
(11, 7, 1, '500', 750, 'M', '2022-10-31 22:45:59', NULL),
(12, 9, 1, '500', 7000, 'NORMAL', '2022-11-02 16:53:16', '2022-11-02 16:54:53');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(4, 2, '175 el bassatin 5000 Monastir', 'cod', 550, 4, 1, '2022-10-31 21:18:22', '2022-10-31 22:26:47'),
(5, 2, '175 el bassatin 5000 Monastir', 'cod', 19750, 0, 0, '2022-11-02 07:24:22', NULL),
(6, 2, '175 el bassatin 5000 Monastir', 'cod', 9250, 0, 1, '2022-11-02 16:31:36', '2022-11-02 16:35:31'),
(7, 2, '175 el bassatin 5000 Monastir', 'cod', 7500, 0, 0, '2022-11-02 17:06:41', NULL),
(8, 2, '175 el bassatin 5000 Monastir', 'cod', 7500, 0, 0, '2022-11-02 20:10:47', NULL),
(9, 2, '175 el bassatin 5000 Monastir', 'cod', 0, 0, 0, '2022-11-02 20:11:16', NULL),
(10, 2, '175 el bassatin 5000 Monastir', 'cod', 7500, 0, 0, '2022-11-02 20:15:55', NULL),
(11, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 20:33:11', NULL),
(12, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 20:33:13', NULL),
(13, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 20:40:31', NULL),
(14, 2, '175 el bassatin 5000 Monastir', 'cod', 7500, 0, 0, '2022-11-02 20:51:41', NULL),
(15, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 21:05:02', NULL),
(16, 2, '175 el bassatin 5000 Monastir', 'cod', 7500, 0, 0, '2022-11-02 21:14:38', NULL),
(17, 2, '175 el bassatin 5000 Monastir', 'cod', 14000, 0, 0, '2022-11-02 21:39:15', NULL),
(18, 2, '175 el bassatin 5000 Monastir', 'cod', 14000, 0, 0, '2022-11-02 21:39:17', NULL),
(19, 2, '175 el bassatin 5000 Monastir', 'cod', 14000, 0, 0, '2022-11-02 21:39:18', NULL),
(20, 2, '175 el bassatin 5000 Monastir', 'cod', 14000, 0, 0, '2022-11-02 21:39:44', NULL),
(21, 2, '175 el bassatin 5000 Monastir', 'cod', 0, 0, 0, '2022-11-02 21:39:51', NULL),
(22, 2, '175 el bassatin 5000 Monastir', 'cod', 0, 0, 0, '2022-11-02 21:40:12', NULL),
(23, 2, '175 el bassatin 5000 Monastir', 'cod', 0, 0, 0, '2022-11-02 21:41:15', NULL),
(24, 2, '175 el bassatin 5000 Monastir', 'cod', 0, 0, 0, '2022-11-02 21:41:26', NULL),
(25, 2, '175 el bassatin 5000 Monastir', 'cod', 0, 0, 0, '2022-11-02 21:41:27', NULL),
(26, 2, '175 el bassatin 5000 Monastir', 'cod', 0, 0, 0, '2022-11-02 21:41:45', NULL),
(27, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 21:43:03', NULL),
(28, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 21:44:32', NULL),
(29, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 21:44:33', NULL),
(30, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 21:44:43', NULL),
(31, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 21:44:44', NULL),
(32, 2, '175 el bassatin 5000 Monastir', 'cod', 0, 0, 0, '2022-11-02 21:44:46', NULL),
(33, 2, '175 el bassatin 5000 Monastir', 'cod', 0, 0, 0, '2022-11-02 21:44:59', NULL),
(34, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 21:45:20', NULL),
(35, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 21:45:30', NULL),
(36, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 21:45:43', NULL),
(37, 2, '175 el bassatin 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 21:53:41', NULL),
(38, 2, '175 el bassatin 5000 Monastir', 'cod', 10000, 0, 0, '2022-11-02 21:55:40', NULL),
(39, 2, '175 el bassatin 5000 Monastir', 'cod', 10000, 0, 0, '2022-11-02 21:55:42', NULL),
(40, 2, '175 el bassatin 5000 Monastir', 'cod', 10000, 0, 0, '2022-11-02 21:55:42', NULL),
(41, 2, '175 el bassatin 5000 Monastir', 'cod', 10000, 0, 0, '2022-11-02 21:55:59', NULL),
(42, 2, 'sdad 5000 Monastir', 'cod', 7250, 0, 0, '2022-11-02 22:02:11', NULL),
(43, 2, '175 el bassatin 5000 Monastir', 'cod', 5850, 0, 0, '2022-11-03 23:05:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `size`, `unit`, `quantity`, `price`, `total`) VALUES
(1, 1, 4, 'L', 'pcs', 2, 550, 1100),
(2, 2, 3, 'M', 'pack', 5, 150, 750),
(5, 4, 4, 'M', 'pcs', 1, 500, 500),
(6, 4, 5, 'M', 'pcs', 1, 50, 50),
(7, 5, 7, 'S', '500', 47, 250, 11750),
(8, 5, 8, 'S', '500', 16, 500, 8000),
(9, 6, 7, 'M', '500', 3, 750, 2250),
(10, 7, 7, 'S', '500', 2, 250, 500),
(11, 8, 8, 'S', '500', 1, 500, 500),
(12, 10, 8, 'S', '500', 1, 500, 500),
(13, 11, 7, 'S', '500', 1, 250, 250),
(14, 13, 7, 'S', '500', 1, 250, 250),
(15, 14, 8, 'S', '500', 1, 500, 500),
(16, 15, 7, 'S', '500', 1, 250, 250),
(17, 16, 8, 'S', '500', 1, 500, 500),
(18, 17, 9, 'NORMAL', '500', 1, 7000, 7000),
(19, 27, 7, 'S', '500', 1, 250, 250),
(20, 28, 7, 'S', '500', 1, 250, 250),
(21, 34, 7, 'S', '500', 1, 250, 250),
(22, 36, 7, 'S', '500', 1, 250, 250),
(23, 37, 7, 'S', '500', 1, 250, 250),
(24, 38, 8, 'S', '500', 6, 500, 3000),
(25, 42, 7, 'S', '500', 1, 250, 250),
(26, 43, 7, 'S', '500', 26, 250, 6500),
(27, 43, 8, 'S', '500', 26, 500, 13000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `popularity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `description`, `status`, `date_created`, `popularity`) VALUES
(7, 1, 6, 'Test', '', 1, '2022-10-31 22:35:02', 5),
(8, 1, 6, 'Logo', '', 1, '2022-10-31 22:37:31', 6),
(9, 6, 7, 'Marvel Packs', '&lt;p&gt;Thor ,HULK , IronMan&lt;/p&gt;', 1, '2022-11-02 16:51:47', 12);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 1100, '2021-06-22 13:48:54'),
(2, 2, 750, '2021-06-22 15:26:07'),
(4, 4, 550, '2022-10-31 21:18:22'),
(5, 5, 19750, '2022-11-02 07:24:22'),
(6, 6, 9250, '2022-11-02 16:31:36'),
(7, 7, 7500, '2022-11-02 17:06:41'),
(8, 8, 7500, '2022-11-02 20:10:47'),
(9, 10, 7500, '2022-11-02 20:15:55'),
(10, 11, 7250, '2022-11-02 20:33:11'),
(11, 13, 7250, '2022-11-02 20:40:31'),
(12, 14, 7500, '2022-11-02 20:51:41'),
(13, 15, 7250, '2022-11-02 21:05:03'),
(14, 16, 7500, '2022-11-02 21:14:38'),
(15, 17, 14000, '2022-11-02 21:39:15'),
(16, 27, 7250, '2022-11-02 21:43:03'),
(17, 28, 7250, '2022-11-02 21:44:32'),
(18, 34, 7250, '2022-11-02 21:45:20'),
(19, 36, 7250, '2022-11-02 21:45:43'),
(20, 37, 7250, '2022-11-02 21:53:41'),
(21, 38, 10000, '2022-11-02 21:55:40'),
(22, 42, 7250, '2022-11-02 22:02:11'),
(23, 43, 5850, '2022-11-03 23:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(30) NOT NULL,
  `size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, 's'),
(2, 'm'),
(3, 'l'),
(6, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(6, 1, 'Marvel', '', 1, '2022-10-31 22:34:27'),
(7, 6, 'Sticker Pack', '', 1, '2022-11-02 16:38:44');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Hadrumet Store'),
(6, 'short_name', 'Hadrumet Store'),
(11, 'logo', 'uploads/logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover2.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `transupdate`
--

CREATE TABLE `transupdate` (
  `id` int(11) NOT NULL,
  `cardId` int(11) NOT NULL,
  `grandTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Hadrumet', 'Store', 'admin', 'f93aafbb1a8b07c2dad9114c3aca862b', 'uploads/1667252580_logo - Copy.png', NULL, 1, '2021-01-20 14:02:37', '2022-10-31 22:43:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transupdate`
--
ALTER TABLE `transupdate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transupdate`
--
ALTER TABLE `transupdate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
