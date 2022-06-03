-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 03 Jun 2022 pada 09.54
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
-- Struktur dari tabel `kota`
--

CREATE TABLE `kota` (
  `id` int(11) NOT NULL,
  `kota` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kota`
--

INSERT INTO `kota` (`id`, `kota`) VALUES
(1, 'Jakarta'),
(2, 'Depok'),
(3, 'Tangerang'),
(4, 'Bekasi');

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
  `image` varchar(500) NOT NULL,
  `kota_jangkauan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mitra`
--

INSERT INTO `mitra` (`id`, `nama`, `alamat`, `email`, `date_added`, `date_updated`, `image`, `kota_jangkauan`) VALUES
(1, 'PT Starlax', 'Green Sedayu Bizpark Blok DM Boulevard No.2 Jl.Daan Mogot KM.18 Kali Deres - Jakarta Barat', 'Admin@starlax.net', '2022-05-20 19:53:33', '2022-05-25 18:31:58', 'image-1653297794418.png', '[1,2,3]'),
(17, 'PT Starlax', 'malang', 'dwikysahut@gmail.com', '2022-05-25 19:09:17', '2022-06-02 12:53:40', 'image-1653480959497.png', '[1,2]'),
(18, 'pt coba', 'malang', 'coba@gmail.com', '2022-05-25 22:11:32', '2022-05-25 22:11:32', 'image-1653491492438.jpeg', '[1,3]');

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
  `id_kota` int(11) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengumpulan`
--

INSERT INTO `pengumpulan` (`id`, `id_user`, `id_mitra`, `tanggal`, `waktu`, `pesan`, `total_minyak`, `id_status`, `id_kota`, `alamat`, `date_added`, `date_updated`) VALUES
('cr-y0WvCsxMqSHd8', 'rn2g4lL3iy3ycKuK', NULL, '2022-05-12', '01:45:00', 'bismillah', 12, 1, 2, 'bogor', '2022-05-31 20:40:25', '2022-05-31 20:40:25'),
('ipeXBFBBynxVbh6U', 'rn2g4lL3iy3ycKuK', NULL, '2022-05-22', '20:00:00', 'tolong ambil jam 20:00 keatas', 2, 1, 2, 'malang', '2022-05-31 20:38:23', '2022-05-31 20:38:23'),
('XaLV0xidOyja3ZEV', '03f2lqMyr8muNcwx', NULL, '2022-05-22', '20:00:00', 'tolong ambil jam 20:00 keatas', 2, 1, 2, 'jalan malang sekali', '2022-05-25 21:32:13', '2022-06-02 15:27:31');

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
  `nama` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_telp` int(15) NOT NULL,
  `alamat` varchar(50) NOT NULL,
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
('03f2lqMyr8muNcwx', 'dwikys', 'dwikysatriahut@gmail.com', 123123, 'malangs', 5, '$2b$06$T8iiadG/PND9JHFCE6c6TuGA.d0/xMzWavYBJ3MqVmeaeRA/.eR.i', 2, 'https://ui-avatars.com/api/?size=256&name=dwikys', '$2b$06$T8geT0XLuictoCHHuuzfqeavwjYF7Yz7dbeyHBp9dtt0.zxFpwrTu', 'true'),
('fq4PuxMWyAiyMfS4', 'gasga', 'gaga@gmail.com', 123123, 'asdsa', 1, '$2b$06$sBv7CvMdRNlqyumkXTJdROdIFbWFjKaBf7TKChBasg8kk1oeRtbhi', 2, 'https://ui-avatars.com/api/?size=256&name=gasga', '$2b$06$7FkLugfblAMENw5.tGzfWuvz/UnfifYJaIV6JyuWUefDfp1vPMS7m', 'false'),
('jdsslN_rM96UHcxj', 'ads', 'fggg@gmail.com', 123123, 'asdsa', 1, '$2b$06$Gd.BtpfAlPBb76kIwGpKIO8K3rMZIFFQfHznrWhnGQuW/TEs/XqH.', 2, 'https://ui-avatars.com/api/?size=256&name=ads', '$2b$06$iS.JvYxpYc/ZDbTYmGf.WOvfYQGFDeuxn2Dc1n1HXSwu3nUHMh4QG', 'false'),
('k-1MqPqXmnkScHBS', 'aaa', 'aaa@gmail.com', 123321, 'asd', 1, '$2b$06$VdVC0N3bZfeoYccZvruwQu3PTlR5qtWL6ZS/W1l/3ZeN3GTzlRfM6', 2, 'https://ui-avatars.com/api/?size=256&name=aaa', '$2b$06$65SHj3//araMQY/x5D3EHOFMvjGnvf3ZOGheBg5DFMz0DMhUdN56i', 'false'),
('lLoFlsJk34iklZQj', 'gggg', 'ggggg', 12321, 'asdsad', 1, '$2b$06$uTuPc3kfvA6fXZR3jBEFd.jEQjdRdtg4vWO4YsHtnizvEX5NeIEwe', 2, 'https://ui-avatars.com/api/?size=256&name=gggg', '$2b$06$eqRxDqsyI3sQ0SCZOS809eZEvbSMVZAO7KMpPkQ3G6mHjN94M0b8m', 'false'),
('mS0u8YE8PJx4h6Mn', 'asd', 'ddd@gmail.com', 123, 'asd', 1, '$2b$06$qHn.0f4Sd8azf8ed9zvTlenH5ny5xCSFBUKfyw5cYaivpGgUpiE9i', 2, 'https://ui-avatars.com/api/?size=256&name=asd', '$2b$06$6em7pIk91DbqZTSnVrbM5OjyiDTYIl95D5K.9OcXXMbYUCBaV63t6', 'false'),
('nD8SAfzLs5XXj_aD', 'asd', 'dasd@gmail.com', 12312, 'asd', 1, '$2b$06$a32G1Vx9DnZfF4SiI9S8QOzIdcmYn4gSQHCRudi8eMS0p14KJaAtC', 2, 'https://ui-avatars.com/api/?size=256&name=asd', '$2b$06$Mw0SSxZuhcL4zvSCZx3uH.fG4x.d8NT8zWYY4ynnkeHXXi4WC3192', 'false'),
('NM2VehMnwGOBi5qU', 'asdsa', 'asdasd', 123, 'ads', 1, '$2b$06$22nmWkkTRZJ8BDQ7BN//uelYQv8AhBwLnjgSsK6daDlfKbBpwcCU2', 2, 'https://ui-avatars.com/api/?size=256&name=asdsa', '$2b$06$jQWEjfZe6bANAPINSVjQ7Och4YI1PhOY/SVk55p1S4Ti8PbesZNdm', 'false'),
('NQznp8k1tc8ITnWp', 'dwiky', 'dwikysahut@gmail.com', 12312313, 'malang', 1, '$2b$06$16JMlF06tumr7OGG5Tn1Ze6MYBicBSvCZcU2rV.YaFoS/36wye1Du', 2, 'https://ui-avatars.com/api/?size=256&name=dwiky', '$2b$06$pJWw.ZL.QZipFDce0IYhE.bMKDO8AeZdrCR28WpimlltkpAgnZ4eG', 'true'),
('rn2g4lL3iy3ycKuK', 'sweet', 'sweetpapayahh@gmail.com', 8123456, 'mars', 1, '$2b$06$s4aX9BiLm2TQbwUMtgfuOe9vR8eLPAxxSBnOT1bkoqEEEv8SmHxa6', 2, 'https://ui-avatars.com/api/?size=256&name=sweet', '$2b$06$9BdR.UbkIaOoSLihpYEO3u/XopQj9Izgl.zUyWZsiZbkNuoWD0num', 'true'),
('SkfHYucbR_8hyYDc', 'asd', 'asd@gmail.com', 123, '123asd', 1, '$2b$06$JXRDJ6idsdli5DTNtOWkG.Or4Y4Fz/aZmD5eXpIBEPxkOYe18Ji8K', 2, 'https://ui-avatars.com/api/?size=256&name=asd', '$2b$06$lW7tX7/nhaUSP7Ba5vwOg.yaELQ7iA/C7Bju2x.t7xwrIvSeFZUM.', 'false'),
('yhSjkxUxIaE6e5v3', 'admin', 'pelipurapps@gmail.com', 123123, 'malang', 1, '$2b$06$0j3jZmplF.iFmH8xrRWhiekeWnPCh.I.Ci03w4R/v5xlPJtv4Fi0i', 1, 'https://ui-avatars.com/api/?size=256&name=user', '$2b$06$SCWTrl7kUUQq/bTa6bXfn.4NoSZ2z90bcSKKyPI3IHr0656miGG8i', 'true');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keterangan`
--
ALTER TABLE `keterangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kota`
--
ALTER TABLE `kota`
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
  ADD KEY `id_mitra` (`id_mitra`),
  ADD KEY `id_kota` (`id_kota`);

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
-- AUTO_INCREMENT untuk tabel `kota`
--
ALTER TABLE `kota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `mitra`
--
ALTER TABLE `mitra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  ADD CONSTRAINT `pengumpulan_ibfk_3` FOREIGN KEY (`id_mitra`) REFERENCES `mitra` (`id`),
  ADD CONSTRAINT `pengumpulan_ibfk_4` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id`);

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
