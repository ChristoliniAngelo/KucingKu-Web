-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2024 at 04:18 PM
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
  `ClusterKucing` int(4) NOT NULL,
  `rasKucing` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cats`
--

INSERT INTO `cats` (`id`, `nama_kucing`, `jenis_kelamin`, `umur`, `warna`, `lokasi`, `status_vaksinasi`, `FotoKucing`, `ClusterKucing`, `rasKucing`) VALUES
(1, 'Hachi', 'Jantan', 'Young', 'Hitam', 'Sidoarjo', 'Sudah', 'assets/cat_image/Hachi.png\r\n', 4, 'Local Mix'),
(2, 'Bedok', 'Betina', 'Baby', 'Coklat', 'Surabaya', 'Belum', 'assets/cat_image/Bedok.png', 0, 'Local'),
(3, 'Januari', 'Jantan', 'Baby', 'Coklat', 'Surabaya', 'Sudah', 'assets/cat_image/Januari.png\r\n', 4, 'Local'),
(4, 'Iwak', 'Jantan', 'Baby', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Iwak.png', 25, 'Local'),
(5, 'Moza', 'Betina', 'Adult', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Moza.png\r\n', 11, 'Persian Mix'),
(6, 'Theo', 'Jantan', 'Young', 'Orange', 'Surabaya', 'Belum', 'assets/cat_image/Theo.png', 24, 'Local'),
(7, 'Chika', 'Betina', 'Adult', 'Orange', 'Surabaya', 'Sudah', 'assets/cat_image/Chika_1.png', 22, 'Local Mix'),
(8, 'Mao', 'Betina', 'Baby', 'Abu-Abu', 'Surabaya', 'Sudah', 'assets/cat_image/Mao.png', 19, 'Local'),
(9, 'Fella', 'Betina', 'Baby', 'Hitam', 'Sidoarjo', 'Sudah', 'assets/cat_image/Fella.png', 6, 'Local Mix'),
(10, 'Aang', 'Betina', 'Young', 'Hitam', 'Sidoarjo', 'Sudah', 'assets/cat_image/Aang.png', 0, 'Local'),
(11, 'Dewi', 'Betina', 'Adult', 'Orange', 'Sidoarjo', 'Belum', 'assets/cat_image/Dewi.png', 28, 'Local'),
(12, 'Putih', 'Jantan', 'Adult', 'Putih', 'Surabaya', 'Sudah', 'assets/cat_image/Putih.png', 1, 'Local Mix'),
(13, 'Sana', 'Betina', 'Adult', 'Putih', 'Sidoarjo', 'Sudah', 'assets/cat_image/Sana.png', 3, 'Local'),
(14, 'Chimmy', 'Betina', 'Young', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Chimmy.png', 17, 'Local'),
(15, 'Jebug', 'Jantan', 'Young', 'Putih', 'Sidoarjo', 'Belum', 'assets/cat_image/Jebug.png', 2, 'Local'),
(16, 'Daffa', 'Jantan', 'Adult', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Daffa.png', 2, 'Persian'),
(17, 'Kitty', 'Betina', 'Adult', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Kitty.png', 11, 'Persian'),
(18, 'Hiro', 'Jantan', 'Young', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Hiro.png', 2, 'Local'),
(19, 'Manis', 'Jantan', 'Adult', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Manis.png', 20, 'Local'),
(20, 'Abu', 'Jantan', 'Young', 'Abu-Abu', 'Sidoarjo', 'Sudah', 'assets/cat_image/Abu.png', 10, 'Local Mix'),
(21, 'Lala', 'Betina', 'Adult', 'Orange', 'Sidoarjo', 'Sudah', 'assets/cat_image/Lala.png', 22, 'Local'),
(22, 'Maru', 'Jantan', 'Adult', 'Orange', 'Sidoarjo', 'Sudah', 'assets/cat_image/Maru.png', 18, 'Local'),
(23, 'Milo', 'Jantan', 'Young', 'Abu-Abu', 'Sidoarjo', 'Sudah', 'assets/cat_image/Milo.png', 10, 'Local Mix'),
(24, 'Bobi', 'Jantan', 'Young', 'Orange', 'Surabaya', 'Belum', 'assets/cat_image/Bobi.png', 24, 'Local'),
(25, 'Eden', 'Jantan', 'Young', 'Hitam', 'Surabaya', 'Belum', 'assets/cat_image/Eden.png', 9, 'Local'),
(26, 'Jane', 'Betina', 'Adult', 'Putih', 'Surabaya', 'Sudah', 'assets/cat_image/Jane.png', 3, 'Persian Mix'),
(27, 'Momo', 'Betina', 'Adult', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Momo.png', 15, 'Local'),
(28, 'Simba', 'Betina', 'Adult', 'Orange', 'Surabaya', 'Belum', 'assets/cat_image/Simba.png', 28, 'Local'),
(29, 'Momo', 'Jantan', 'Adult', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Momo_1.png', 14, 'Local Mix'),
(30, 'Inul', 'Betina', 'Adult', 'Putih', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Inul.png', 3, 'Local'),
(31, 'Jackie', 'Jantan', 'Adult', 'Abu-Abu', 'Surabaya', 'Sudah', 'assets/cat_image/Jackie.png', 18, 'Local Mix'),
(32, 'Teboy', 'Betina', 'Baby', 'Putih', 'Kota Lainnya', 'Belum', 'assets/cat_image/Teboy.png', 23, 'Local Mix'),
(33, 'Jembrong', 'Jantan', 'Adult', 'Abu-Abu', 'Kota Lainnya', 'Belum', 'assets/cat_image/Jembrong.png', 20, 'Local'),
(34, 'Milo', 'Betina', 'Adult', 'Putih', 'Kota Lainnya', 'Belum', 'assets/cat_image/Milo_1.png', 15, 'Local'),
(35, 'Anjing', 'Jantan', 'Adult', 'Putih', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Anjing.png', 1, 'Persian'),
(36, 'Snowy', 'Jantan', 'Adult', 'Putih', 'Sidoarjo', 'Sudah', 'assets/cat_image/Snowy.png\r\n', 1, 'Local'),
(37, 'Vivi', 'Betina', 'Young', 'Putih', 'Kota Lainnya', 'Belum', 'assets/cat_image/Vivi.png', 8, 'Local'),
(38, 'Bongki', 'Betina', 'Adult', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Bongki.png', 15, 'Local'),
(39, 'Cheryl ', 'Betina', 'Adult', 'Putih', 'Kota Lainnya', 'Belum', 'assets/cat_image/Cheryl.png', 15, 'Local'),
(40, 'Maru', 'Jantan', 'Adult', 'Orange', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Maru_1.png', 18, 'Local Mix'),
(41, 'Gombrong', 'Betina', 'Young', 'Putih', 'Kota Lainnya', 'Belum', 'assets/cat_image/Gombrong.png', 8, 'Local'),
(42, 'Kiki', 'Betina', 'Adult', 'Abu-Abu', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Kiki.png', 12, 'Local'),
(43, 'Snowy', 'Betina', 'Young', 'Putih', 'Sidoarjo', 'Belum', 'assets/cat_image/Snowy_1.png', 8, 'Local'),
(44, 'Timo', 'Jantan', 'Young', 'Hitam', 'Jakarta', 'Belum', 'assets/cat_image/Timo.png', 9, 'Local'),
(45, 'Meng', 'Betina', 'Young', 'Abu-Abu', 'Surabaya', 'Belum', 'assets/cat_image/Meng.png', 17, 'Local Mix'),
(46, 'Simba', 'Jantan', 'Young', 'Orange', 'Surabaya', 'Sudah', 'assets/cat_image/Simba_1.png', 27, 'Local'),
(47, 'Incan', 'Betina', 'Young', 'Orange', 'Kota Lainnya', 'Belum', 'assets/cat_image/Incan.png', 17, 'Local'),
(48, 'Chiko', 'Jantan', 'Young', 'Orange', 'Kota Lainnya', 'Belum', 'assets/cat_image/Chiko.png', 24, 'Local'),
(49, 'Snoopy', 'Jantan', 'Baby', 'Coklat', 'Surabaya', 'Sudah', 'assets/cat_image/Snoopy.png', 13, 'Bengal'),
(50, 'Cheetoz', 'Jantan', 'Baby', 'Coklat', 'Surabaya', 'Sudah', 'assets/cat_image/Cheetoz.png', 13, 'Bengal'),
(51, 'Ulir', 'Betina', 'Baby', 'Coklat', 'Surabaya', 'Sudah', 'assets/cat_image/Ulir.png', 26, 'Local Mix'),
(52, 'Coco', 'Jantan', 'Adult', 'Putih', 'Sidoarjo', 'Sudah', 'assets/cat_image/Coco.png', 1, 'Local'),
(53, 'Milo', 'Jantan', 'Young', 'Hitam', 'Kota Lainnya', 'Belum', 'assets/cat_image/Milo_2.png', 9, 'Local'),
(54, 'Unyil', 'Jantan', 'Adult', 'Orange', 'Surabaya', 'Sudah', 'assets/cat_image/Unyil.png', 18, 'Local'),
(55, 'Fino', 'Jantan', 'Adult', 'Coklat', 'Kota Lainnya', 'Belum', 'assets/cat_image/Fino.png', 17, 'Local'),
(56, 'Kitty', 'Betina', 'Adult', 'Abu-Abu', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Kitty.png', 11, 'Local Mix'),
(57, 'Grimjoew', 'Jantan', 'Young', 'Orange', 'Sidoarjo', 'Sudah', 'assets/cat_image/Grimjoew.png', 27, 'Local'),
(58, 'Winnie', 'Betina', 'Adult', 'Abu-Abu', 'Kota Lainnya', 'Sudah', 'assets/cat_image/Winnie.png', 12, 'Local Mix'),
(59, 'Trisie Beiji', 'Betina', 'Adult', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Trisie_Beiji.png', 21, 'Local'),
(60, 'Trisi Sukmajaya', 'Betina', 'Young', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Trisi_Sukmajata.png', 0, 'Local'),
(61, 'Uli', 'Betina', 'Young', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Uli.png', 5, 'Local'),
(62, 'Chika', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Chika.png', 3, 'Local'),
(63, 'Cookies', 'Betina', 'Adult', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Cookies.png', 21, 'Local'),
(64, 'Merdeka', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Merdeka.png', 3, 'Local'),
(65, 'Paper', 'Betina', 'Adult', 'Coklat', 'Jakarta', 'Sudah', 'assets/cat_image/Paper.png', 29, 'Local'),
(66, 'Biru', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Biru.png', 3, 'Local'),
(67, 'Sikunyit', 'Betina', 'Adult', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Sikunyit.png', 22, 'Local'),
(68, 'Kuro FE UI', 'Betina', 'Young', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Kuro FE UI.png', 0, 'Local'),
(69, 'Aprilio', 'Jantan', 'Adult', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Aprilio.png', 18, 'Local Mix'),
(70, 'Loci', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Loci.png', 3, 'Local'),
(71, 'Klinika', 'Betina', 'Young', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Klinika.png', 0, 'Local'),
(72, 'Noni', 'Betina', 'Adult', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Noni.png', 22, 'Persian Mix'),
(73, 'Mimi', 'Betina', 'Baby', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Mimi.png', 19, 'Local'),
(74, 'Rere', 'Betina', 'Baby', 'Coklat', 'Jakarta', 'Sudah', 'assets/cat_image/Rere.png', 26, 'Local'),
(75, 'Ucil', 'Betina', 'Baby', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Ucil.png', 7, 'Local'),
(76, 'Chandra', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Chandra.png', 3, 'Local'),
(77, 'Odin', 'Betina', 'Baby', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Odin.png', 19, 'Local'),
(78, 'Bumi', 'Betina', 'Young', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Bumi.png', 5, 'Local'),
(79, 'Venus', 'Betina', 'Baby', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Venus.png', 7, 'Local'),
(80, 'Mars', 'Betina', 'Baby', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Mars.png', 7, 'Local'),
(81, 'Bulan', 'Betina', 'Baby', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Bulan.png', 7, 'Local'),
(82, 'Embul', 'Betina', 'Baby', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Embul.png', 6, 'Local'),
(83, 'Beam', 'Betina', 'Adult', 'Coklat', 'Jakarta', 'Sudah', 'assets/cat_image/Beam.png', 29, 'Local'),
(84, 'Pangpong', 'Betina', 'Baby', 'Coklat', 'Jakarta', 'Sudah', 'assets/cat_image/Pangpong.png', 26, 'Local'),
(85, 'Cope', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Cope.png', 3, 'Local'),
(86, 'Cipul', 'Jantan', 'Young', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Cipul.png', 27, 'Local'),
(87, 'Dwi', 'Betina', 'Young', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Dwi.png', 5, 'Local'),
(88, 'Titi', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Titi.png', 3, 'Local'),
(89, 'Dodo', 'Betina', 'Baby', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Dodo.png', 6, 'Local'),
(90, 'Yati', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Yati.png', 3, 'Local'),
(91, 'Iming', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Iming.png', 3, 'Local'),
(92, 'Nginden', 'Betina', 'Adult', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Nginden.png', 22, 'Local'),
(93, 'Bubub', 'Jantan', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Bubub.png', 1, 'Local'),
(94, 'Desi', 'Betina', 'Adult', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Desi.png', 3, 'Local'),
(95, 'Duren', 'Betina', 'Adult', 'Orange', 'Jakarta', 'Sudah', 'assets/cat_image/Duren.png', 22, 'Local'),
(96, 'Bejo', 'Jantan', 'Adult', 'Hitam', 'Jakarta', 'Sudah', 'assets/cat_image/Bejo.png', 23, 'Local'),
(97, 'Maisy', 'Betina', 'Adult', 'Abu-Abu', 'Jakarta', 'Sudah', 'assets/cat_image/Maisy.png', 12, 'Local'),
(98, 'Snow', 'Betina', 'Young', 'Putih', 'Jakarta', 'Sudah', 'assets/cat_image/Snow.png', 5, 'Local'),
(99, 'Keddy', 'Jantan', 'Young', 'Abu-Abu', 'Kota Lainnya', 'Belum', 'assets/cat_image/Keddy.png', 16, 'Local'),
(100, 'Maeng', 'Jantan', 'Young', 'Putih', 'Surabaya', 'Belum', 'assets/cat_image/Maeng.png', 2, 'Local');

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

--
-- Dumping data for table `cat_preference`
--

INSERT INTO `cat_preference` (`id`, `user_id`, `jenis_kelamin`, `usia`, `warna`, `vaksinasi`, `created_at`) VALUES
(1, 1, 'Betina', 'Baby', 'Hitam', 'Sudah', '2024-06-20 03:30:36'),
(2, 1, 'Betina', 'Baby', 'Coklat', 'Sudah', '2024-06-20 03:51:43'),
(3, 2, 'Jantan', 'Baby', 'Putih', 'Sudah', '2024-06-20 03:53:14'),
(4, 3, 'Betina', 'Baby', 'Putih', 'Sudah', '2024-06-20 03:54:09'),
(5, 4, 'Jantan', 'Young', 'Hitam', 'Sudah', '2024-06-20 03:56:13'),
(6, 5, 'Betina', 'Baby', 'Putih', 'Sudah', '2024-06-20 03:57:15'),
(7, 6, 'Jantan', 'Baby', 'Orange', 'Sudah', '2024-06-20 03:58:32'),
(8, 7, 'Betina', 'Baby', 'Putih', 'Belum', '2024-06-20 04:01:16'),
(9, 8, 'Jantan', 'Young', 'Orange', 'Sudah', '2024-06-20 06:12:12'),
(10, 9, 'Betina', 'Baby', 'Abu-Abu', 'Sudah', '2024-06-20 06:17:52'),
(11, 10, 'Jantan', 'Baby', 'Orange', 'Sudah', '2024-06-20 06:21:35'),
(12, 11, 'Jantan', 'Baby', 'Putih', 'Sudah', '2024-06-20 06:30:26'),
(13, 12, 'Jantan', 'Adult', 'Hitam', 'Sudah', '2024-06-20 06:34:18'),
(14, 13, 'Betina', 'Baby', 'Hitam', 'Sudah', '2024-06-20 06:41:44'),
(15, 14, 'Jantan', 'Baby', 'Abu-Abu', 'Sudah', '2024-06-20 06:44:45'),
(16, 14, 'Jantan', 'Baby', 'Abu-Abu', 'Sudah', '2024-06-20 06:49:43'),
(17, 14, 'Jantan', 'Baby', 'Abu-Abu', 'Sudah', '2024-06-20 07:02:42'),
(18, 15, 'Jantan', 'Baby', 'Abu-Abu', 'Belum', '2024-06-20 07:06:18'),
(19, 16, 'Betina', 'Baby', 'Orange', 'Sudah', '2024-06-20 07:09:08'),
(20, 17, 'Jantan', 'Baby', 'Orange', 'Sudah', '2024-06-20 07:11:37'),
(21, 17, 'Jantan', 'Baby', 'Orange', 'Sudah', '2024-06-20 07:12:18'),
(22, 17, 'Jantan', 'Young', 'Hitam', 'Belum', '2024-06-20 07:21:23'),
(23, 18, 'Jantan', 'Baby', 'Abu-Abu', 'Sudah', '2024-06-20 07:25:49'),
(24, 19, 'Jantan', 'Young', 'Putih', 'Sudah', '2024-06-20 07:32:32'),
(25, 20, 'Jantan', 'Young', 'Abu-Abu', 'Sudah', '2024-06-20 07:35:05'),
(26, 21, 'Jantan', 'Baby', 'Coklat', 'Sudah', '2024-06-20 07:41:12'),
(27, 22, 'Jantan', 'Young', 'Orange', 'Sudah', '2024-06-20 07:45:07'),
(28, 23, 'Betina', 'Young', 'Putih', 'Sudah', '2024-06-20 07:49:00'),
(29, 24, 'Jantan', 'Baby', 'Orange', 'Sudah', '2024-06-20 07:54:39'),
(30, 25, 'Jantan', 'Young', 'Coklat', 'Belum', '2024-06-20 07:57:29'),
(31, 26, 'Jantan', 'Baby', 'Coklat', 'Sudah', '2024-06-20 08:00:11'),
(32, 27, 'Jantan', 'Young', 'Orange', 'Sudah', '2024-06-20 08:02:31'),
(33, 28, 'Jantan', 'Baby', 'Abu-Abu', 'Sudah', '2024-06-20 08:04:31'),
(34, 29, 'Betina', 'Young', 'Putih', 'Sudah', '2024-06-20 10:43:26'),
(35, 30, 'Betina', 'Young', 'Abu-Abu', 'Sudah', '2024-06-20 10:51:09'),
(36, 31, 'Betina', 'Baby', 'Putih', 'Belum', '2024-06-20 11:06:07'),
(37, 32, 'Betina', 'Baby', 'Orange', 'Sudah', '2024-06-20 11:08:44'),
(38, 33, 'Betina', 'Baby', 'Putih', 'Sudah', '2024-06-20 11:10:45'),
(39, 34, 'Jantan', 'Young', 'Abu-Abu', 'Sudah', '2024-06-20 11:13:05'),
(40, 35, 'Jantan', 'Young', 'Orange', 'Belum', '2024-06-20 11:15:28'),
(41, 36, 'Betina', 'Baby', 'Putih', 'Sudah', '2024-06-20 11:17:56');

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

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `user_id`, `cat_id`, `ClusterKucing`, `Rating`, `created_at`) VALUES
(1, 1, 51, '26', 5, '2024-06-20 03:51:50'),
(2, 2, 45, '17', 5, '2024-06-20 03:53:26'),
(3, 3, 75, '7', 4, '2024-06-20 03:54:55'),
(4, 4, 1, '4', 4, '2024-06-20 03:56:22'),
(5, 5, 88, '3', 4, '2024-06-20 03:57:39'),
(6, 6, 38, '15', 5, '2024-06-20 03:59:56'),
(7, 7, 32, '23', 4, '2024-06-20 04:01:33'),
(8, 8, 46, '27', 5, '2024-06-20 06:12:49'),
(9, 9, 97, '12', 5, '2024-06-20 06:19:02'),
(10, 10, 54, '18', 5, '2024-06-20 06:23:21'),
(11, 11, 13, '3', 5, '2024-06-20 06:31:44'),
(12, 12, 96, '23', 5, '2024-06-20 06:37:29'),
(13, 13, 49, '13', 5, '2024-06-20 06:43:24'),
(14, 14, 2, '1', 5, '2024-06-20 06:55:41'),
(15, 14, 10, '0', 5, '2024-06-20 07:02:52'),
(16, 15, 4, '25', 5, '2024-06-20 07:07:24'),
(17, 16, 8, '19', 5, '2024-06-20 07:09:25'),
(18, 17, 25, '9', 5, '2024-06-20 07:21:46'),
(19, 18, 2, '0', 5, '2024-06-20 07:27:07'),
(20, 19, 45, '17', 5, '2024-06-20 07:32:55'),
(21, 20, 20, '10', 5, '2024-06-20 07:35:55'),
(22, 21, 50, '13', 5, '2024-06-20 07:41:26'),
(23, 22, 46, '27', 5, '2024-06-20 07:45:25'),
(24, 23, 22, '18', 5, '2024-06-20 07:50:29'),
(25, 24, 2, '0', 5, '2024-06-20 07:55:19'),
(29, 25, 44, '9', 5, '2024-06-20 07:57:46'),
(30, 26, 40, '18', 5, '2024-06-20 08:00:46'),
(31, 27, 86, '27', 5, '2024-06-20 08:02:51'),
(32, 28, 60, '0', 5, '2024-06-20 08:04:39'),
(33, 29, 98, '5', 5, '2024-06-20 10:43:55'),
(34, 30, 26, '3', 4, '2024-06-20 10:52:31'),
(35, 31, 32, '23', 5, '2024-06-20 11:06:28'),
(36, 32, 8, '19', 5, '2024-06-20 11:09:04'),
(37, 33, 75, '7', 5, '2024-06-20 11:11:10'),
(38, 34, 20, '10', 5, '2024-06-20 11:13:19'),
(39, 35, 48, '24', 5, '2024-06-20 11:15:46'),
(40, 36, 75, '7', 5, '2024-06-20 11:18:15');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `PASSWORD`, `created_at`, `userage`, `usergender`, `userlocation`) VALUES
(0, 'Testing', 'Test@email.com', '$2b$10$gceHlPtol4huskaMj9lx8Ojd7BEQCKrUbwh2FZwXa7vFDU.fYR3cK', '2024-06-12 02:26:21', 22, 'Male', 'Surabaya'),
(1, 'orin', 'orin@gmail.com', '$2b$10$Wb03EBphYDldRwjOzuI4heNqlLlBRu0NDczprxQsaYe.S9ROYB2Qy', '2024-06-20 03:30:12', 32, 'Female', 'Surabaya'),
(2, 'tius', 'tius@gmail.com', '$2b$10$RYA2QH0bf1VP.cgJCIh2Uu3wnA0chDsjiQoU0A0IQ8LWh4YcyylvK', '2024-06-20 03:52:51', 30, 'Male', 'Surabaya'),
(3, 'shea', 'sheaamnd@gmail.com', '$2b$10$Z4P7XG0NVcPoLflnyrNDBuJ2QNc.qzgiLFz9j2Fnn6bX26A3WaNfa', '2024-06-20 03:53:51', 23, 'Female', 'Sidoarjo'),
(4, 'flx', 'felixjulio26@gmail.com', '$2b$10$khZKtrU9m4L6y7fdFWbqMetjIuMhSFXbHb9/L3PowdIh2.FB3Gere', '2024-06-20 03:55:59', 23, 'Male', 'Surabaya'),
(5, 'angell', 'angelinav10v@gmail.com', '$2b$10$iaV5NLVbR8DYYfSdJYVfBeHUYlgpQrwczbRQ9tjWuul2UaTxyE0SO', '2024-06-20 03:56:59', 22, 'Female', 'Surabaya'),
(6, 'vito', 'vitovern123@gmail.com', '$2b$10$DQpXmrrYTFDxkWEbq8lkEuqvhLosk7lM5rEYMPsLbsLnE9Hutael2', '2024-06-20 03:58:05', 23, 'Male', 'Surabaya'),
(7, 'jeanne ', 'jeannea@gmail.com', '$2b$10$i1lvK51h41NEDGL6ClWVhOS4cbRce54EbncNqEM9D4JEN458nkUxa', '2024-06-20 04:01:01', 20, 'Female', 'Surabaya'),
(8, 'LukasEdo', 'lukas.hadiwijaya@spil.co.id', '$2b$10$x5jP1bP.9GizHJM/1P6emOGXU2pydjSrwF4PxHIEgjc55Dbk1aLj2', '2024-06-20 06:11:46', 38, 'Male', 'Surabaya'),
(9, 'dharma', 'dharma.andika@spil.co.id', '$2b$10$y8dSq5ZK58fjfiw.FpdaOOAIuwkezJigvstqvVWBjgffxV.6B4bhu', '2024-06-20 06:17:00', 41, 'Male', 'Surabaya'),
(10, 'Snowy', 'snowy@gmail.com', '$2b$10$LUO7yyln7XAtJepXj0wxtOQ321Sz/W5rw/zslP6jBR2giTaHiJAja', '2024-06-20 06:20:53', 35, 'Male', 'Surabaya'),
(11, 'Anthony Enrico', 'anthony.enrico.chiesa@gmail.com', '$2b$10$ftGm.7vsWJcMpK8HlZAk9ePAHcHOJ6ID78MppZ1IXJ1Kfj6RFnJn.', '2024-06-20 06:29:49', 27, 'Male', 'Sidoarjo'),
(12, 'jer', 'jeremy.kennedy@spil.co.id', '$2b$10$5xiTKaWN4hDpCI0wrA79T.Wdn06rrUS473hlvnkKgBzl74ItffI9W', '2024-06-20 06:33:30', 25, 'Male', 'Surabaya'),
(13, 'kefaswilfredd', 'kefas.wilfred@gmail.com', '$2b$10$y3nqbbih4vpPVcH2RwFiqOqvA1UM1WrXdMk5DX2TUvtaE8eZuv1tO', '2024-06-20 06:40:29', 31, 'Male', 'Surabaya'),
(14, 'tedy', 'tedaditya@gmail.com', '$2b$10$t4uSlOBVHg2j6QMnU7j3t.wbFPz43SVPJzdrMqwV/iDhOltSesclq', '2024-06-20 06:44:05', 24, 'Male', 'Surabaya'),
(15, 'hendraa', 'hendraa3005@gmail.com', '$2b$10$3FpWXX4mbfCJUhKjkBzoF.M9y0P0P9SBPFYuvt9L.HVtTU1is26XO', '2024-06-20 07:05:39', 24, 'Male', 'Surabaya'),
(16, 'iwn897', 'iwan180697@gmail.com', '$2b$10$xT.q5y3YUTx4CRK7qzeDjO1U6w5ssQ0bLpuJp0zbT0W9zK/ytqZ7u', '2024-06-20 07:08:31', 26, 'Male', 'Surabaya'),
(17, 'vian', 'vian@gmail.com', '$2b$10$Y7Q3wb5xfUAFdjayB/yPM.8ZKD3AveMc2gD6V2W9yGpHNfq6eXsX2', '2024-06-20 07:11:02', 25, 'Male', 'Surabaya'),
(18, 'dimasrizqy', 'dimasrzqy@gmail.com', '$2b$10$1hddvT5abyKZjNkrGpgxLeUlPGxmVMT6eR1g2AtVQaEq7nhrE/CkK', '2024-06-20 07:25:08', 24, 'Male', 'Jakarta'),
(19, 'susilo', 'bagus@gmail.com', '$2b$10$0Pr.KrQJFuPQ6bhnNhVXWO/5uzqcQauudVE8.8WoRSeFP2D6pyuzK', '2024-06-20 07:31:49', 26, 'Male', 'Surabaya'),
(20, 'iklilnur', 'iklilnur@gmail.com', '$2b$10$toX1mwlnSgmN1hDqDGyTAeW/MJf1Im2jPgfs6kFGVPFMic0i7wdtm', '2024-06-20 07:34:31', 23, 'Male', 'Surabaya'),
(21, 'yoel', 'yoelvndr@yahoo.com', '$2b$10$PF9/VP2Bm8wnGGaCfVTjRu1SjatqI8S8b77xi7QY9tGCEZt1NigSa', '2024-06-20 07:40:39', 27, 'Male', 'Surabaya'),
(22, 'Samuel', 'evelynndraco@gmail.com', '$2b$10$HIfWHoiGtCIgGtyLuS7SO.ApbkKxojUM48j5.6u2g8OE5NO/2xUNq', '2024-06-20 07:42:46', 24, 'Male', 'Surabaya'),
(23, 'fariz', 'fariz.ardin@gmail.com', '$2b$10$aLA.YmKVnc6P9e/kPwXs6OfbY/j0CQLpHhkkTeJKImDg2RyxGoyVS', '2024-06-20 07:48:15', 26, 'Male', 'Surabaya'),
(24, 'ferdi', 'ferdinansyarighi@gmail.com', '$2b$10$UpH5pA0/mUsj5ZwflUvdbuUj5k8EkLrQ4cxiShZC.J2Ry.CXOJ6em', '2024-06-20 07:54:05', 29, 'Male', 'Surabaya'),
(25, 'kris', 'vol@gmail.com', '$2b$10$aBjYRcv6jT.OS8c/CAFRIejbrBHSAi5weWB3HRq17n30UWUd3elW6', '2024-06-20 07:57:05', 26, 'Male', 'Surabaya'),
(26, 'david', 'david.oktavianus@spil.co.id', '$2b$10$mW0E1GUM01luYKTs5bHew.J.VRGlXX/n.jefEozAnPqIftI1hlhcS', '2024-06-20 07:59:34', 32, 'Male', 'Surabaya'),
(27, 'christian_adi', 'christian90.develop@gmail.com', '$2b$10$wgHKJQJ3b9HGxQJdmH.5SOvyOi7f3Tauj6XlMg8ki2Vsi5NEwKfp.', '2024-06-20 08:01:56', 33, 'Male', 'Surabaya'),
(28, 'boen', 'hendra.bunjamin@spil.co.id', '$2b$10$8yZ9dGJiYUal2xvUzByAGu.nohTNmBUOY9QkBUNd5YduDL7rJAtHS', '2024-06-20 08:04:08', 39, 'Male', 'Surabaya'),
(29, 'lili', 'lilisonata.pasaribu@gmail.com', '$2b$10$5EJvL8pGi1Vp/yuVDbqNme0a98FP70kCkAMWXzdlOs84j7wuZnQfu', '2024-06-20 10:42:48', 20, 'Female', 'Surabaya'),
(30, 'angel', 'angelicadewi760@gmail.com', '$2b$10$NoD5GLzK96tXSpSmXIagwexHNfQu3uEBEvxtBKo532.BJMUr/qvHG', '2024-06-20 10:50:02', 20, 'Female', 'Surabaya'),
(31, 'nisak', 'annisa@gmail.com', '$2b$10$75EKMPhB1Ke/CZhNRLz91uW5RiWRdfnvqzoNvF5jY8SWamLwSJWtu', '2024-06-20 11:05:32', 21, 'Female', 'Surabaya'),
(32, 'syakira', 'andriyanisyakira@gmail.com', '$2b$10$TuwtGgUx30aj8ZY5DE2NzuzeTmA8el.Z4zmRnCUEpIUwSL.Zmbkhy', '2024-06-20 11:08:05', 21, 'Female', 'Surabaya'),
(33, 'cute', 'cutsilvia263@gmail.com', '$2b$10$hkVuNaC.n66ighGP8wsSFe7OdkjcE8PJqdJZWPDN.JXMkICLMHCLe', '2024-06-20 11:10:10', 23, 'Female', 'Surabaya'),
(34, 'aldiramadani00', 'alditipex123@gmail.com', '$2b$10$YZtD2/m.563Vyw2aSKULxeIuI3UH4quV4N9JZCjgfaPO6XXpufdJe', '2024-06-20 11:12:30', 24, 'Male', 'Sidoarjo'),
(35, 'azuzan', 'teloletom@gmail.com', '$2b$10$9hZ6scX.Xv8IN72w4dfHxegZxkbRYDG69a2CaE4cNQj7lorkLXSbO', '2024-06-20 11:14:42', 23, 'Male', 'Surabaya'),
(36, 'kucingman', 'om.rafly@gmail.com', '$2b$10$uFTzoALS7ypz1jW0V2XxluZWp.S0B.tN29gVO0AfKuf3Na1P548HO', '2024-06-20 11:17:13', 23, 'Male', 'Surabaya');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
