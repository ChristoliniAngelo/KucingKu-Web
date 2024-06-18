-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2024 at 09:37 AM
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
-- Table structure for table `cats`
--

CREATE TABLE `cats` (
  `id` int(11) NOT NULL,
  `nama_kucing` varchar(32) NOT NULL,
  `jenis_kelamin` enum('Jantan','Betina') NOT NULL,
  `umur` enum('Baby','Young','Adult','') NOT NULL,
  `warna` enum('Hitam','Putih','Coklat','Abu-Abu','Orange') NOT NULL,
  `lokasi` enum('Surabaya','Sidoarjo','Jakarta','Kota Lainnya') NOT NULL,
  `status_vaksinasi` enum('Sudah','Belum') NOT NULL,
  `FotoKucing` varchar(255) DEFAULT NULL,
  `ClusterKucing` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cats`
--

INSERT INTO `cats` (`id`, `nama_kucing`, `jenis_kelamin`, `umur`, `warna`, `lokasi`, `status_vaksinasi`, `FotoKucing`, `ClusterKucing`) VALUES
(1, 'Hachi', 'Jantan', 'Young', 'Hitam', 'Sidoarjo', 'Sudah', 'assets/cat_image/Hachi.png\r\n', 4),
(2, 'Bedok', 'Betina', 'Baby', 'Coklat', 'Surabaya', 'Belum', 'assets/cat_image/Bedok.png', 0),
(3, 'Januari', 'Jantan', 'Baby', 'Coklat', 'Surabaya', 'Sudah', 'assets/cat_image/Januari.png\r\n', 4),
(4, 'Iwak', 'Jantan', 'Baby', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Iwak.png', 25),
(5, 'Moza', 'Betina', 'Adult', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Moza.png\r\n', 11),
(6, 'Theo', 'Jantan', 'Young', 'Orange', 'Surabaya', 'Belum', 'assets/cat_image/Theo.png', 24),
(7, 'Chika', 'Betina', 'Adult', 'Orange', 'Surabaya', 'Sudah', 'assets/cat_image/Chika_1.png', 22),
(8, 'Mao', 'Betina', 'Baby', 'Abu-Abu', 'Surabaya', 'Sudah', 'assets/cat_image/Mao.png', 19),
(9, 'Fella', 'Betina', 'Baby', 'Hitam', 'Sidoarjo', 'Sudah', 'assets/cat_image/Fella.png', 6),
(10, 'Aang', 'Betina', 'Young', 'Hitam', 'Sidoarjo', 'Sudah', 'assets/cat_image/Aang.png', 0),
(11, 'Dewi', 'Betina', 'Adult', 'Orange', 'Sidoarjo', 'Belum', 'assets/cat_image/Dewi.png', 28),
(12, 'Putih', 'Jantan', 'Adult', 'Putih', 'Surabaya', 'Sudah', 'assets/cat_image/Putih.png', 1),
(13, 'Sana', 'Betina', 'Adult', 'Putih', 'Sidoarjo', 'Sudah', 'assets/cat_image/Sana.png', 3),
(14, 'Chimmy', 'Betina', 'Young', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Chimmy.png', 17),
(15, 'Jebug', 'Jantan', 'Young', 'Putih', 'Sidoarjo', 'Belum', 'assets/cat_image/Jebug.png', 2),
(16, 'Daffa', 'Jantan', 'Adult', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Daffa.png', 2),
(17, 'Kitty', 'Betina', 'Adult', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Kitty.png', 11),
(18, 'Hiro', 'Jantan', 'Young', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Hiro.png', 2),
(19, 'Manis', 'Jantan', 'Adult', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Manis.png', 20),
(20, 'Abu', 'Jantan', 'Young', 'Abu-Abu', 'Sidoarjo', 'Sudah', 'assets/cat_image/Abu.png', 10),
(21, 'Lala', 'Betina', 'Adult', 'Orange', 'Sidoarjo', 'Sudah', 'assets/cat_image/Lala.png', 22),
(22, 'Maru', 'Jantan', 'Adult', 'Orange', 'Sidoarjo', 'Sudah', 'assets/cat_image/Maru.png', 18),
(23, 'Milo', 'Jantan', 'Young', 'Abu-Abu', 'Sidoarjo', 'Sudah', 'assets/cat_image/Milo.png', 10),
(24, 'Bobi', 'Jantan', 'Young', 'Orange', 'Surabaya', 'Belum', 'assets/cat_image/Bobi.png', 24),
(25, 'Eden', 'Jantan', 'Young', 'Hitam', 'Surabaya', 'Belum', 'assets/cat_image/Eden.png', 9),
(26, 'Jane', 'Betina', 'Adult', 'Putih', 'Surabaya', 'Sudah', 'assets/cat_image/Jane.png', 3),
(27, 'Momo', 'Betina', 'Adult', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Momo.png', 15),
(28, 'Simba', 'Betina', 'Adult', 'Orange', 'Surabaya', 'Belum', 'assets/cat_image/Simba.png', 28),
(29, 'Momo', 'Jantan', 'Adult', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Momo_1.png', 14),
(30, 'Inul', 'Betina', 'Adult', 'Putih', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Inul.png', 3),
(31, 'Jackie', 'Jantan', 'Adult', 'Abu-Abu', 'Surabaya', 'Sudah', 'assets/cat_image/Jackie.png', 18),
(32, 'Teboy', 'Betina', 'Baby', 'Putih', 'Kota Lainnya', 'Belum', 'assets/cat_image/Teboy.png', 23),
(33, 'Jembrong', 'Jantan', 'Adult', 'Abu-Abu', 'Kota Lainnya', 'Belum', 'assets/cat_image/Jembrong.png', 20),
(34, 'Milo', 'Betina', 'Adult', 'Putih', 'Kota Lainnya', 'Belum', 'assets/cat_image/Milo_1.png', 15),
(35, 'Anjing', 'Jantan', 'Adult', 'Putih', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Anjing.png', 1),
(36, 'Snowy', 'Jantan', 'Adult', 'Putih', 'Sidoarjo', 'Sudah', 'assets/cat_image/Snowy.png\r\n', 1),
(37, 'Vivi', 'Betina', 'Young', 'Putih', 'Kota Lainnya', 'Belum', 'assets/cat_image/Vivi.png', 8),
(38, 'Bongki', 'Betina', 'Adult', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Bongki.png', 15),
(39, 'Cheryl ', 'Betina', 'Adult', 'Putih', 'Kota Lainnya', 'Belum', 'assets/cat_image/Cheryl.png', 15),
(40, 'Maru', 'Jantan', 'Adult', 'Orange', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Maru_1.png', 18),
(41, 'Gombrong', 'Betina', 'Young', 'Putih', 'Kota Lainnya', 'Belum', 'assets/cat_image/Gombrong.png', 8),
(42, 'Kiki', 'Betina', 'Adult', 'Abu-Abu', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Kiki.png', 12),
(43, 'Snowy', 'Betina', 'Young', 'Putih', 'Sidoarjo', 'Belum', 'assets/cat_image/Snowy_1.png', 8),
(44, 'Timo', 'Jantan', 'Young', 'Hitam', 'Jakarta', 'Belum', 'assets/cat_image/Timo.png', 9),
(45, 'Meng', 'Betina', 'Young', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Meng.png', 17),
(46, 'Simba', 'Jantan', 'Young', 'Orange', 'Surabaya', 'Sudah', 'assets/cat_image/Simba_1.png', 27),
(47, 'Incan', 'Betina', 'Young', 'Orange', 'Kota Lainnya', 'Belum', 'assets/cat_image/Incan.png', 17),
(48, 'Chiko', 'Jantan', 'Young', 'Orange', 'Kota Lainnya', 'Belum', 'assets/cat_image/Chiko.png', 24),
(49, 'Snoopy', 'Jantan', 'Baby', 'Coklat', 'Surabaya', 'Sudah', 'assets/cat_image/Snoopy.png', 13),
(50, 'Cheetoz', 'Jantan', 'Baby', 'Coklat', 'Surabaya', 'Sudah', 'assets/cat_image/Cheetoz.png', 13),
(51, 'Ulir', 'Betina', 'Baby', 'Coklat', 'Surabaya', 'Sudah', 'assets/cat_image/Ulir.png', 26),
(52, 'Coco', 'Jantan', 'Adult', 'Putih', 'Sidoarjo', 'Sudah', 'assets/cat_image/Coco.png', 1),
(53, 'Milo', 'Jantan', 'Young', 'Hitam', 'Kota Lainnya', 'Belum', 'assets/cat_image/Milo_2.png', 9),
(54, 'Unyil', 'Jantan', 'Adult', 'Orange', 'Surabaya', 'Sudah', 'assets/cat_image/Unyil.png', 18),
(55, 'Fino', 'Jantan', 'Adult', 'Coklat', 'Kota Lainnya', 'Belum', 'assets/cat_image/Fino.png', 17),
(56, 'Kitty', 'Betina', 'Adult', 'Abu-Abu', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Kitty.png', 11),
(57, 'Grimjoew', 'Jantan', 'Young', 'Orange', 'Sidoarjo', 'Sudah', 'assets/cat_image/Grimjoew.png', 27),
(58, 'Winnie', 'Betina', 'Adult', 'Abu-Abu', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Winnie.png', 12),
(59, 'Trisie Beiji', 'Betina', 'Adult', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Trisie_Beiji.png', 21),
(60, 'Trisi Sukmajaya', 'Betina', 'Young', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Trisi_Sukmajata.png', 0),
(61, 'Uli', 'Betina', 'Young', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Uli.png', 5),
(62, 'Chika', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Chika.png', 3),
(63, 'Cookies', 'Betina', 'Adult', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Cookies.png', 21),
(64, 'Merdeka', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Merdeka.png', 3),
(65, 'Paper', 'Betina', 'Adult', 'Coklat', 'Jakarta', 'Sudah', 'assets/cat_image/Paper.png', 29),
(66, 'Biru', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Biru.png', 3),
(67, 'Sikunyit', 'Betina', 'Adult', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Sikunyit.png', 22),
(68, 'Kuro FE UI', 'Betina', 'Young', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Kuro FE UI.png', 0),
(69, 'Aprilio', 'Jantan', 'Adult', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Aprilio.png', 18),
(70, 'Loci', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Loci.png', 3),
(71, 'Klinika', 'Betina', 'Young', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Klinika.png', 0),
(72, 'Noni', 'Betina', 'Adult', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Noni.png', 22),
(73, 'Mimi', 'Betina', 'Baby', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Mimi.png', 19),
(74, 'Rere', 'Betina', 'Baby', 'Coklat', 'Jakarta', 'Sudah', 'assets/cat_image/Rere.png', 26),
(75, 'Ucil', 'Betina', 'Baby', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Ucil.png', 7),
(76, 'Chandra', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Chandra.png', 3),
(77, 'Odin', 'Betina', 'Baby', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Odin.png', 19),
(78, 'Bumi', 'Betina', 'Young', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Bumi.png', 5),
(79, 'Venus', 'Betina', 'Baby', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Venus.png', 7),
(80, 'Mars', 'Betina', 'Baby', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Mars.png', 7),
(81, 'Bulan', 'Betina', 'Baby', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Bulan', 7),
(82, 'Embul', 'Betina', 'Baby', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Embul.png', 6),
(83, 'Beam', 'Betina', 'Adult', 'Coklat', 'Jakarta', 'Sudah', 'assets/cat_image/Beam.png', 29),
(84, 'Pangpong', 'Betina', 'Baby', 'Coklat', 'Jakarta', 'Sudah', 'assets/cat_image/Pangpong.png', 26),
(85, 'Cope', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Cope.png', 3),
(86, 'Cipul', 'Jantan', 'Young', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Cipul.png', 27),
(87, 'Dwi', 'Betina', 'Young', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Dwi.png', 5),
(88, 'Titi', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Titi.png', 3),
(89, 'Dodo', 'Betina', 'Baby', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Dodo.png', 6),
(90, 'Yati', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Yati.png', 3),
(91, 'Iming', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Iming.png', 3),
(92, 'Nginden', 'Betina', 'Adult', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Nginden.png', 22),
(93, 'Bubub', 'Jantan', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Bubub.png', 1),
(94, 'Desi', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Desi.png', 3),
(95, 'Duren', 'Betina', 'Adult', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Duren.png', 22),
(96, 'Bejo', 'Jantan', 'Adult', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Bejo.png', 23),
(97, 'Maisy', 'Betina', 'Adult', 'Abu-Abu', 'Jakarta', 'Sudah', 'assets/cat_image/Maisy.png', 12),
(98, 'Snow', 'Betina', 'Young', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Snow.png', 5),
(99, 'Keddy', 'Jantan', 'Young', 'Abu-Abu', 'Kota Lainnya', 'Belum', 'assets/cat_image/Keddy.png', 16),
(100, 'Maeng', 'Jantan', 'Young', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Maeng.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cat_preference`
--

CREATE TABLE `cat_preference` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `jenis_kelamin` enum('Jantan','Betina') NOT NULL,
  `usia` enum('Baby','Young','Adult') NOT NULL,
  `warna` enum('Hitam','Putih','Coklat','Abu-Abu','Orange') NOT NULL,
  `vaksinasi` enum('Sudah','Belum') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `ClusterKucing` varchar(255) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `userlocation` enum('Surabaya','Jakarta','Sidoarjo','Kota Lainnya') DEFAULT NULL
) ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `PASSWORD`, `created_at`, `userage`, `usergender`, `userlocation`) VALUES
(0, 'Testing', 'Test@email.com', '$2b$10$gceHlPtol4huskaMj9lx8Ojd7BEQCKrUbwh2FZwXa7vFDU.fYR3cK', '2024-06-12 02:26:21', 22, 'Male', 'Surabaya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cat_preference`
--
ALTER TABLE `cat_preference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cats`
--
ALTER TABLE `cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `cat_preference`
--
ALTER TABLE `cat_preference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `cats` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
