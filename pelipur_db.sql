-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 23 Bulan Mei 2022 pada 13.27
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pelipur_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keterangan`
--

CREATE TABLE `keterangan` (
  `id` int(11) NOT NULL,
  `keterangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `keterangan`
--

INSERT INTO `keterangan` (`id`, `keterangan`) VALUES
(1, 'none'),
(2, 'Ibu Rumah Tangga'),
(3, 'Pedagang'),
(4, 'Perusahaan'),
(5, 'Rumah Makan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mitra`
--

CREATE TABLE `mitra` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mitra`
--

INSERT INTO `mitra` (`id`, `nama`, `alamat`, `email`, `date_added`, `date_updated`, `image`) VALUES
(1, 'PT Starlax', 'Green Sedayu Bizpark Blok DM Boulevard No.2 Jl.Daan Mogot KM.18 Kali Deres - Jakarta Barat', 'Admin@starlax.net', '2022-05-20 19:53:33', '2022-05-23 16:23:14', 'image-1653297794418.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumpulan`
--

CREATE TABLE `pengumpulan` (
  `id` varchar(16) NOT NULL,
  `id_user` varchar(36) NOT NULL,
  `id_mitra` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `pesan` varchar(255) NOT NULL,
  `total_minyak` int(11) NOT NULL,
  `id_status` int(11) NOT NULL DEFAULT 1,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengumpulan`
--

INSERT INTO `pengumpulan` (`id`, `id_user`, `id_mitra`, `tanggal`, `waktu`, `pesan`, `total_minyak`, `id_status`, `date_added`, `date_updated`) VALUES
('aYREqX51M1CE8SqN', 'yhSjkxUxIaE6e5v3', 1, '2022-05-22', '20:00:00', 'tolong ambil jam 20:00 keatas', 2, 4, '2022-05-23 16:24:18', '2022-05-23 16:25:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Struktur dari tabel `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(1, 'pending'),
(2, 'on proccess'),
(3, 'rejected'),
(4, 'completed'),
(5, 'failed');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `no_telp` int(15) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `id_keterangan` int(11) NOT NULL DEFAULT 1,
  `password` varchar(80) NOT NULL,
  `id_role` int(11) NOT NULL DEFAULT 2,
  `image` varchar(100) NOT NULL,
  `kode_verif` varchar(255) DEFAULT NULL,
  `verified` varchar(10) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `no_telp`, `alamat`, `id_keterangan`, `password`, `id_role`, `image`, `kode_verif`, `verified`) VALUES
('03f2lqMyr8muNcwx', 'dwikys', 'dwikysatriahut@gmail.com', 123123, NULL, 1, '$2b$06$/ZCMIRmngGqBpXwJuV4HHeTj1cxR4IW3uMP8vAHI8KL5Br60CE7FC', 2, 'https://ui-avatars.com/api/?size=256&name=dwikys', '$2b$06$T8geT0XLuictoCHHuuzfqeavwjYF7Yz7dbeyHBp9dtt0.zxFpwrTu', 'true'),
('KNjElbGT4bMRGRym', NULL, 'sss@gmail.coms', NULL, NULL, 1, '$2b$06$PeRTcPtslwHMmxc0Vbu.guatopzedqzNGQm1P3XpBa1aqyth2IfT2', 2, 'https://ui-avatars.com/api/?size=256&name=undefined', NULL, 'false'),
('NUeEkELqjgx_xuVH', NULL, 'asds@gmail.com', NULL, NULL, 1, '$2b$18$gbpnqyS1zZXcuM6kvADiF.EWfAqLEGlhRF3aycpS5kYnlUHdGX0H.', 2, 'https://ui-avatars.com/api/?size=256&name=undefined', NULL, 'false'),
('ruvuG3W4VLxXAQa9', NULL, 'ffff@gmail.com', NULL, NULL, 1, '$2b$06$pjmLHVFw/xNuyF8aH/RoIu4ETQFzTpLfUt2toxZPeT.myDbyofIjC', 2, 'https://ui-avatars.com/api/?size=256&name=user', NULL, 'false'),
('V0LHxrhRwqdV3yBN', NULL, 'ada@gmail.com', NULL, NULL, 1, '$2b$06$xohEXDWSsXdRfNAqNISxken1hSzk4aNRkn4xYuSpffw33Y1sstDiC', 2, 'https://ui-avatars.com/api/?size=256&name=user', NULL, 'false'),
('yhSjkxUxIaE6e5v3', NULL, 'pelipurapps@gmail.com', NULL, NULL, 1, '$2b$06$0j3jZmplF.iFmH8xrRWhiekeWnPCh.I.Ci03w4R/v5xlPJtv4Fi0i', 1, 'https://ui-avatars.com/api/?size=256&name=user', '$2b$06$SCWTrl7kUUQq/bTa6bXfn.4NoSZ2z90bcSKKyPI3IHr0656miGG8i', 'true');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keterangan`
--
ALTER TABLE `keterangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mitra`
--
ALTER TABLE `mitra`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengumpulan`
--
ALTER TABLE `pengumpulan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_status` (`id_status`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_mitra` (`id_mitra`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keterangan` (`id_keterangan`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keterangan`
--
ALTER TABLE `keterangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `mitra`
--
ALTER TABLE `mitra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengumpulan`
--
ALTER TABLE `pengumpulan`
  ADD CONSTRAINT `pengumpulan_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `pengumpulan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `pengumpulan_ibfk_3` FOREIGN KEY (`id_mitra`) REFERENCES `mitra` (`id`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_keterangan`) REFERENCES `keterangan` (`id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
