-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2024 at 03:50 AM
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
-- Database: `kucingku`
--

-- --------------------------------------------------------

--
-- Table structure for table `cat_preference`
--

CREATE TABLE `cat_preference` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `jenis_kelamin` enum('Jantan','Betina') NOT NULL,
  `usia` enum('Baby','Young','Adult') NOT NULL,
  `warna` varchar(255) NOT NULL,
  `vaksinasi` enum('Sudah','Belum') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cat_preference`
--

INSERT INTO `cat_preference` (`id`, `user_id`, `jenis_kelamin`, `usia`, `warna`, `vaksinasi`, `created_at`) VALUES
(1, 1, 'Jantan', 'Baby', 'Hitam', 'Sudah', '2024-04-23 14:51:51'),
(2, 2, 'Betina', 'Young', 'Putih', 'Sudah', '2024-04-23 16:51:57'),
(3, 2, 'Jantan', 'Young', 'Putih', 'Sudah', '2024-04-27 14:46:57'),
(4, 3, 'Jantan', 'Young', 'Putih', 'Sudah', '2024-05-06 17:43:19'),
(5, 4, 'Betina', 'Young', 'Hitam', 'Sudah', '2024-05-10 01:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `userage` int(11) DEFAULT NULL,
  `usergender` enum('Male','Female') NOT NULL,
  `userlocation` varchar(255) DEFAULT NULL
) ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `PASSWORD`, `created_at`, `userage`, `usergender`, `userlocation`) VALUES
(1, 'Elo', 'Christoliniangelo@gmail.com', '$2b$10$sWcJLsvMtbK2F.GhlmROYeiO6aD4PjwN1mMrIAnLGbIhtfZfzm6Aa', '2024-04-23 14:13:32', 21, 'Male', 'Surabaya'),
(2, 'admin', 'admin@gmail.com', '$2b$10$xZwGf4bRdQC/fYhjwb8GQeVNFZguo5ZzW7i.ZrQEGP7NFc0ufJMY2', '2024-04-23 16:51:38', 24, 'Female', 'Jakarta'),
(3, 'rama', 'rama@gmail.com', '$2b$10$t0FCeXGKnXzNiYQJAEhzEu7tuIxj0b4FLMMrZguxhf5TlCTTbRtb2', '2024-05-06 17:43:03', 23, 'Male', 'Surabaya'),
(4, 'test', 'admin1@gmail.com', '$2b$10$uVG.airBgw42TZMII5GbcekoI6vwxp4Vc2iWxCbBy6Xm44ewlLoUO', '2024-05-09 19:51:57', 30, 'Male', 'Jakarta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cat_preference`
--
ALTER TABLE `cat_preference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cat_preference`
--
ALTER TABLE `cat_preference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cat_preference`
--
ALTER TABLE `cat_preference`
  ADD CONSTRAINT `cat_preference_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
