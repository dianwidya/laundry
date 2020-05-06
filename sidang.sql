-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Bulan Mei 2020 pada 08.05
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sidang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `pengirim` int(11) NOT NULL,
  `penerima` int(11) NOT NULL,
  `pesan` text NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL COMMENT '0 = belum dibaca, 1 = sudah dibaca'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `chat`
--

INSERT INTO `chat` (`id`, `pengirim`, `penerima`, `pesan`, `waktu`, `status`) VALUES
(1, 12, 1, 'Halo Admin,', '2020-02-07 07:57:40', 0),
(2, 12, 1, 'Laundry saya sudah selesai?', '2020-02-07 07:57:40', 0),
(3, 1, 12, 'Belum boss', '2020-02-07 07:58:05', 0),
(4, 11, 1, 'Halo min,', '2020-02-07 08:00:00', 0),
(5, 11, 1, 'Laundry buka kapan?', '2020-02-07 08:00:00', 0),
(6, 1, 11, 'Mulai senin sudah buka', '2020-02-07 08:00:23', 0),
(7, 12, 1, 'oke', '2020-02-24 06:49:43', 0),
(11, 1, 12, 'baik kak', '2020-02-24 07:26:39', 0),
(13, 1, 12, 'test', '2020-03-02 07:56:51', 0),
(14, 1, 12, 'yuk ka laundry lagi', '2020-03-30 06:39:30', 0),
(15, 12, 1, 'Min saya mau laundry', '2020-04-20 14:07:10', 0),
(17, 19, 1, 'Min saya mau laundry bajunya di asrama', '2020-04-24 05:05:23', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `laundry_id` int(11) NOT NULL,
  `paket_id` int(11) NOT NULL,
  `layanan_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` char(13) NOT NULL,
  `address` varchar(100) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `is_member` tinyint(1) NOT NULL COMMENT '0 = non member, 1 = member',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_delete` tinyint(1) NOT NULL COMMENT '0 = No, 1 = Yes',
  `bukti_bayar` varchar(233) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `user_id`, `laundry_id`, `paket_id`, `layanan_id`, `name`, `phone`, `address`, `gender`, `is_member`, `created_at`, `updated_at`, `is_delete`, `bukti_bayar`) VALUES
(6, 12, 1, 0, 0, 'Anto Wijaya', '0824234', 'Bandung', 'Laki-laki', 0, '2020-02-07 07:58:59', '2020-02-07 07:58:59', 0, ''),
(7, 11, 1, 7, 0, 'Jaya atmajaya', '0249294', '', 'Laki-laki', 1, '2020-02-07 09:51:38', '2020-04-17 15:54:50', 1, ''),
(10, 17, 2, 0, 0, 'Jaya Wijaya', '42253534', 'Bandung', 'Laki-laki', 1, '2020-03-04 03:02:25', '2020-03-04 03:44:07', 0, ''),
(12, 18, 2, 0, 0, 'Test', '082312132', 'Bandung', 'Laki-laki', 1, '2020-03-29 14:19:07', '2020-04-17 15:18:52', 0, ''),
(13, 19, 1, 0, 0, 'Siska Damayanti', '081236789099', 'Jalan bebek no 15', 'Perempuan', 1, '2020-03-30 02:19:33', '2020-03-30 02:19:33', 0, ''),
(14, 21, 1, 0, 0, 'Ade Pangestu', '081236789098', 'gag soang', 'Laki-laki', 0, '2020-03-30 04:26:27', '2020-03-30 04:26:27', 0, ''),
(15, 22, 1, 0, 0, 'sherli', '081236789090', 'gag angsa', 'Perempuan', 0, '2020-03-30 06:42:16', '2020-03-30 06:42:16', 0, ''),
(17, 31, 1, 7, 0, 'doyoque', '081223322112', 'jl bangun tidur', 'Laki-laki', 0, '2020-04-15 07:13:45', '2020-04-15 07:13:45', 0, ''),
(35, 63, 1, 0, 0, 'Yusril', '081376654490', 'Sukabirus', 'Laki-laki', 0, '2020-04-21 01:11:40', '2020-04-30 10:06:09', 1, ''),
(40, 73, 2, 0, 0, 'Irfan fahmi ', '081231231232', 'Jalan Jawa, 24 Surabaya', 'Laki-laki', 1, '2020-04-28 09:46:43', '2020-04-28 09:46:43', 0, ''),
(41, 74, 1, 0, 0, 'Aditya', '082134567889', 'Gang angsa 1', 'Perempuan', 1, '2020-04-30 09:57:32', '2020-04-30 09:57:32', 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_kuota`
--

CREATE TABLE `customer_kuota` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `paket_id` int(11) NOT NULL,
  `kuota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer_kuota`
--

INSERT INTO `customer_kuota` (`id`, `customer_id`, `paket_id`, `kuota`) VALUES
(1, 7, 4, 102),
(2, 7, 4, 102),
(4, 7, 4, 102),
(5, 10, 4, 102),
(6, 7, 4, 30),
(8, 40, 8, 5),
(9, 40, 9, 5),
(10, 10, 8, 5),
(11, 10, 9, 5),
(12, 41, 4, 30);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laundry`
--

CREATE TABLE `laundry` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `address` varchar(100) NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `no_ktp` varchar(20) NOT NULL,
  `dokumen_siup` varchar(255) NOT NULL COMMENT 'surat izin usaha perdagangan',
  `dokumen_situ` varchar(255) NOT NULL COMMENT 'surat izin tempat usaha',
  `dokumen_imb` varchar(255) NOT NULL COMMENT 'izin mendirikan bangunan',
  `foto_ktp` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laundry`
--

INSERT INTO `laundry` (`id`, `user_id`, `name`, `phone`, `address`, `owner_name`, `no_ktp`, `dokumen_siup`, `dokumen_situ`, `dokumen_imb`, `foto_ktp`, `logo`) VALUES
(1, 1, 'Jaya Laundry', '08234111', 'Bandung', 'Wachid', '123424241', '', '', '', '', ''),
(2, 5, 'Seven Laundry', '3241231', 'Sukabirus Bandung', 'Seven Family', '3424131232432', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laundry_layanan`
--

CREATE TABLE `laundry_layanan` (
  `id` int(11) NOT NULL,
  `laundry_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_delete` tinyint(1) NOT NULL COMMENT '0 = No, 1 = Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laundry_layanan`
--

INSERT INTO `laundry_layanan` (`id`, `laundry_id`, `name`, `price`, `description`, `created_at`, `updated_at`, `is_delete`) VALUES
(2, 1, 'Tas', 22000, 'Cuci kering sampai bersih', '2020-01-06 07:36:15', '2020-04-28 15:16:31', 0),
(3, 1, 'Sepatu', 15000, 'Cuci dalam sol sepatu ', '2020-03-30 04:17:36', '2020-04-28 15:16:58', 1),
(4, 1, 'Sepatu', 15000, 'Cuci salam sol sepatu', '2020-03-30 04:17:39', '2020-04-28 15:17:07', 0),
(5, 1, 'Selimut', 18000, 'Cuci sampai kering dan disetrika', '2020-03-30 04:19:40', '2020-04-28 15:17:28', 0),
(6, 2, 'Cuci Seprei', 10000, 'Cuci sampai kering dan disetrika', '2020-04-17 15:57:18', '2020-04-28 15:17:39', 0),
(7, 2, 'Bantal', 35000, 'Cuci bersih', '2020-04-17 15:57:30', '2020-04-28 15:17:57', 0),
(9, 2, 'Boneka', 24000, 'Boneka menjadi bersih tanpa bau', '2020-04-28 15:20:12', '2020-04-28 15:21:23', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laundry_paket`
--

CREATE TABLE `laundry_paket` (
  `id` int(11) NOT NULL,
  `laundry_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laundry_paket`
--

INSERT INTO `laundry_paket` (`id`, `laundry_id`, `name`, `created_at`, `updated_at`) VALUES
(4, 1, 'Paket 1 tahun', '2020-02-27 09:06:02', '2020-02-27 09:34:38'),
(5, 1, 'Paket Reguler', '2020-02-27 09:08:36', '2020-02-27 09:44:14'),
(6, 1, '6 Bulan', '2020-03-30 04:21:03', '2020-03-30 04:21:03'),
(7, 1, 'Paket Express', '2020-03-30 04:21:51', '2020-03-30 04:21:51'),
(8, 2, 'Deluxe', '2020-04-17 15:55:48', '2020-04-17 15:55:48'),
(9, 2, 'Premium', '2020-04-17 15:56:05', '2020-04-17 15:56:05'),
(10, 2, 'Pahe 1', '2020-04-17 15:59:54', '2020-04-17 15:59:54'),
(11, 2, 'Pahe 2', '2020-04-17 16:00:04', '2020-04-17 16:00:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laundry_paket_member`
--

CREATE TABLE `laundry_paket_member` (
  `id` int(11) NOT NULL,
  `laundry_paket_id` int(11) NOT NULL,
  `kuota` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laundry_paket_member`
--

INSERT INTO `laundry_paket_member` (`id`, `laundry_paket_id`, `kuota`, `price`) VALUES
(2, 4, 30, 1000000),
(3, 6, 20, 600000),
(4, 8, 5, 67000),
(5, 9, 5, 85000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `laundry_paket_non_member`
--

CREATE TABLE `laundry_paket_non_member` (
  `id` int(11) NOT NULL,
  `laundry_paket_id` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laundry_paket_non_member`
--

INSERT INTO `laundry_paket_non_member` (`id`, `laundry_paket_id`, `price`) VALUES
(1, 5, 6500),
(2, 7, 8000),
(3, 10, 25000),
(4, 11, 18000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id` int(11) NOT NULL,
  `laundry_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `paket_id` int(11) DEFAULT NULL,
  `layanan_id` int(11) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `berat` int(11) DEFAULT NULL,
  `jml_bayar` int(11) NOT NULL,
  `is_bayar` tinyint(1) NOT NULL,
  `bar_code` text NOT NULL,
  `bukti_bayar` varchar(233) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`id`, `laundry_id`, `customer_id`, `paket_id`, `layanan_id`, `tanggal_masuk`, `tanggal_selesai`, `berat`, `jml_bayar`, `is_bayar`, `bar_code`, `bukti_bayar`) VALUES
(12, 1, 6, 5, NULL, '2020-03-03', '2020-03-04', 2, 13000, 1, '', ''),
(13, 1, 7, 4, NULL, '2020-03-03', '2020-03-04', 0, 800000, 1, '', ''),
(15, 1, 6, 5, 2, '2020-03-03', '2020-03-04', 2, 35000, 1, '', ''),
(17, 1, 6, 5, 2, '2020-03-03', '2020-03-04', 2, 35000, 0, '2020-03-036.jpg', ''),
(18, 1, 10, 4, 2, '2020-03-04', '2020-03-05', NULL, 822000, 1, '', ''),
(19, 1, 14, 7, 4, '2020-03-30', '2020-02-04', 2, 31000, 0, '2020-03-3014.jpg', ''),
(20, 1, 7, 4, NULL, '2020-03-30', '2020-03-04', 0, 1000000, 1, '2020-03-307.jpg', ''),
(26, 1, 14, 5, NULL, '2020-04-24', '2020-04-27', 2, 13000, 1, '2020-04-2414.jpg', ''),
(27, 2, 40, 8, 6, '2020-03-18', '2020-04-28', 0, 77000, 1, '2020-04-2840.jpg', ''),
(28, 2, 40, 9, 6, '2020-04-28', '2020-04-29', 0, 95000, 1, '2020-04-2840.jpg', ''),
(29, 2, 10, 8, 7, '2020-04-28', '2020-01-29', 0, 102000, 1, '2020-04-2810.jpg', ''),
(30, 2, 10, 9, NULL, '2020-04-28', '2020-04-17', 0, 85000, 1, '2020-04-2810.jpg', ''),
(31, 1, 41, 4, NULL, '2020-04-30', '2020-05-02', 0, 1000000, 1, '2020-04-3041.jpg', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `kode` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `kode`, `name`) VALUES
(1, 'ROLE_SUPERADMIN', 'Superadmin'),
(2, 'ROLE_ADMIN', 'Admin'),
(3, 'ROLE_CUSTOMER', 'Customer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimoni`
--

CREATE TABLE `testimoni` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `laundry_id` int(11) NOT NULL,
  `message` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_delete` tinyint(1) NOT NULL COMMENT '0 = No, 1 = Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `testimoni`
--

INSERT INTO `testimoni` (`id`, `customer_id`, `laundry_id`, `message`, `created_at`, `updated_at`, `is_delete`) VALUES
(5, 6, 1, 'Memuaskan', '2020-03-04 03:46:28', '2020-03-04 03:46:28', 0),
(8, 7, 2, 'Sangat Memuaskan', '2020-03-04 03:52:56', '2020-03-04 03:52:56', 0),
(9, 35, 1, 'Parfumnya sangat harus', '2020-04-21 01:16:06', '2020-04-21 01:16:06', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `username` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `enabled` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `created_at`, `updated_at`, `username`, `password`, `email`, `enabled`) VALUES
(1, '2020-02-07 07:44:08', '2020-04-18 04:47:14', 'laundry', '21232f297a57a5a743894a0e4a801fc3', 'dianwidyap0@gmail.com', 1),
(5, '2020-01-06 08:23:00', '2020-04-18 04:47:25', '7laundry', '21232f297a57a5a743894a0e4a801fc3', 'Madedianptr@gmail.comw', 1),
(6, '2020-01-10 03:26:00', '2020-02-07 07:44:08', 'superadmin', '21232f297a57a5a743894a0e4a801fc3', 'superadmin@gmail.com', 1),
(11, '2020-02-07 07:45:56', '2020-02-07 07:46:20', 'jaya', '91ec1f9324753048c0096d036a694f86', 'customer@gmail.com', 1),
(12, '2020-02-07 07:45:56', '2020-02-07 07:46:44', 'anto', '91ec1f9324753048c0096d036a694f86', 'customer2@gmail.com', 1),
(17, '2020-03-03 21:02:25', '2020-03-04 03:02:25', 'test', '21232f297a57a5a743894a0e4a801fc3', 'test@gmail.com', 1),
(18, '2020-03-29 14:19:07', '2020-03-29 14:19:07', 'admin22', '21232f297a57a5a743894a0e4a801fc3', 'admin@example.com', 1),
(19, '2020-03-30 02:19:33', '2020-03-30 02:19:33', 'siskadmy', '40159ac8fd3c00cb696f847442264fc0', 'siska@gmail.com', 1),
(21, '2020-03-30 04:26:27', '2020-03-30 04:26:27', 'adp', 'fa6a6bd136dec26a1dd5e326b7e43254', 'adep@gmail.com', 1),
(22, '2020-03-30 06:42:14', '2020-03-30 06:42:14', 'yualinda', '1daeb30c93c6bd724b3ec515e41b97d3', 'yualindasherli@gmail.com', 1),
(23, '2020-03-30 06:49:49', '2020-03-30 06:49:50', 'cobalaundry', 'a3040f90cc20fa672fe31efcae41d2db', 'coba@gmail.com', 1),
(24, '2020-04-01 12:33:37', '2020-04-01 12:33:37', 'breskalaundry', '21232f297a57a5a743894a0e4a801fc3', 'breska@gmail.com', 1),
(25, '2020-04-01 12:36:26', '2020-04-01 12:36:26', '111', '711e29f67094d95da05270e362bc4c83', 'coba', 1),
(31, '2020-04-15 07:13:41', '2020-04-15 07:13:41', 'doyoque', '21232f297a57a5a743894a0e4a801fc3', 'doyoque@email.com', 1),
(63, '2020-04-21 01:11:40', '2020-04-21 01:11:40', 'yusril', '8d5b87a72d543a3fbf9b0011c2104548', 'wahyudayusril29@gmail.com', 1),
(73, '2020-04-28 09:46:43', '2020-04-28 09:46:43', 'irfanfa869', '61ff05ac32984cdb8651a3c2c7d2f769', 'irfandoombod@gmail.com', 1),
(74, '2020-04-30 09:57:32', '2020-04-30 09:57:32', '967', '737', 'adityaapriyanti21@gmail.com', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 2),
(5, 2),
(6, 1),
(11, 3),
(12, 3),
(17, 3),
(18, 3),
(19, 3),
(21, 3),
(22, 3),
(23, 2),
(24, 2),
(25, 2),
(31, 3),
(63, 3),
(73, 3),
(74, 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengirim` (`pengirim`),
  ADD KEY `penerima` (`penerima`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laundry_id` (`laundry_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `customer_kuota`
--
ALTER TABLE `customer_kuota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `customer_kuota_ibfk_2` (`paket_id`);

--
-- Indeks untuk tabel `laundry`
--
ALTER TABLE `laundry`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `no_ktp` (`no_ktp`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `laundry_layanan`
--
ALTER TABLE `laundry_layanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laundry_id` (`laundry_id`);

--
-- Indeks untuk tabel `laundry_paket`
--
ALTER TABLE `laundry_paket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laundry_id` (`laundry_id`);

--
-- Indeks untuk tabel `laundry_paket_member`
--
ALTER TABLE `laundry_paket_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laundry_paket_member_ibfk_1` (`laundry_paket_id`);

--
-- Indeks untuk tabel `laundry_paket_non_member`
--
ALTER TABLE `laundry_paket_non_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laundry_paket_non_member_ibfk_1` (`laundry_paket_id`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laundry_id` (`laundry_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `paket_id` (`paket_id`),
  ADD KEY `layanan_id` (`layanan_id`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `testimoni`
--
ALTER TABLE `testimoni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `laundry_id` (`laundry_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `customer_kuota`
--
ALTER TABLE `customer_kuota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `laundry`
--
ALTER TABLE `laundry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `laundry_layanan`
--
ALTER TABLE `laundry_layanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `laundry_paket`
--
ALTER TABLE `laundry_paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `laundry_paket_member`
--
ALTER TABLE `laundry_paket_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `laundry_paket_non_member`
--
ALTER TABLE `laundry_paket_non_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `testimoni`
--
ALTER TABLE `testimoni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`pengirim`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`penerima`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`laundry_id`) REFERENCES `laundry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `customer_kuota`
--
ALTER TABLE `customer_kuota`
  ADD CONSTRAINT `customer_kuota_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_kuota_ibfk_2` FOREIGN KEY (`paket_id`) REFERENCES `laundry_paket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `laundry`
--
ALTER TABLE `laundry`
  ADD CONSTRAINT `laundry_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `laundry_layanan`
--
ALTER TABLE `laundry_layanan`
  ADD CONSTRAINT `laundry_layanan_ibfk_1` FOREIGN KEY (`laundry_id`) REFERENCES `laundry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `laundry_paket`
--
ALTER TABLE `laundry_paket`
  ADD CONSTRAINT `laundry_paket_ibfk_1` FOREIGN KEY (`laundry_id`) REFERENCES `laundry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `laundry_paket_member`
--
ALTER TABLE `laundry_paket_member`
  ADD CONSTRAINT `laundry_paket_member_ibfk_1` FOREIGN KEY (`laundry_paket_id`) REFERENCES `laundry_paket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `laundry_paket_non_member`
--
ALTER TABLE `laundry_paket_non_member`
  ADD CONSTRAINT `laundry_paket_non_member_ibfk_1` FOREIGN KEY (`laundry_paket_id`) REFERENCES `laundry_paket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`laundry_id`) REFERENCES `laundry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_ibfk_3` FOREIGN KEY (`paket_id`) REFERENCES `laundry_paket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemesanan_ibfk_4` FOREIGN KEY (`layanan_id`) REFERENCES `laundry_layanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `testimoni`
--
ALTER TABLE `testimoni`
  ADD CONSTRAINT `testimoni_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `testimoni_ibfk_2` FOREIGN KEY (`laundry_id`) REFERENCES `laundry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
