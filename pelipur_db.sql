-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 04 Jul 2022 pada 05.19
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
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `author` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `url` varchar(250) NOT NULL,
  `urlToImage` varchar(250) NOT NULL,
  `publishedAt` varchar(30) NOT NULL,
  `content` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id`, `author`, `title`, `description`, `url`, `urlToImage`, `publishedAt`, `content`) VALUES
(1, 'Bayu Nugraha', 'Inovasi Pemuda di Malang, Ubah Minyak Goreng Bekas Jadi Bahan Bakar', 'Limbah rumah tangga yakni minyak jelantah atau bekas minyak goreng diubah menjadi biodisel atau hahan bakar untuk perahu atau kapal nelayan.', 'https://www.viva.co.id/berita/nasional/1479748-inovasi-pemuda-di-malang-ubah-minyak-goreng-bekas-jadi-bahan-bakar', 'https://thumb.viva.co.id/media/frontend/thumbs3/2022/05/30/62945afed800d-alexander-soegio-bersama-wakil-gubernur-jatim-emil-elestianto-dardak_665_374.jpg', '2022-05-30T05:57:34Z', 'VIVA  Seorang pemuda di Malang, Alexander Soegio (32 tahun) bersama beberapa temannya membuat inovasi untuk mengurangi pencemaran lingkungan. Dia mengubah limbah rumah tangga yakni minyak jelantah at… [+2242 chars]'),
(2, 'Dusep Malik', 'Bahlil Bongkar Praktik Standar Ganda pada Isu Lingkungan di WEF 2022', 'Di gelaran WEF 2022 Bahlil mengatakan kepada seluruh negara di dunia untuk meminta komitmen yang setara dalam upaya penyelamatan lingkungan.', 'https://www.viva.co.id/berita/bisnis/1478396-bahlil-bongkar-praktik-standar-ganda-pada-isu-lingkungan-di-wef-2022', 'https://thumb.viva.co.id/media/frontend/thumbs3/2022/05/25/628da7cd18930-menteri-investasi-kepala-bkpm-bahlil-lahadalia_665_374.jpg', '2022-05-25T03:54:03Z', 'VIVA  Menteri Investasi/Kepala Badan Koordinasi Penanaman Modal (BKPM), Bahlil Lahadalia, membongkar watak standar ganda yang kerap dilakukan sejumlah negara di dunia, dalam gelaran acara World Econo… [+1241 chars]'),
(3, 'Krisna Wicaksono', 'Indodax Gandeng Startup Pengelolaan Sampah, Buat Apa?', 'Berita Indodax Gandeng Startup Pengelolaan Sampah, Buat Apa? terbaru hari ini 2022-05-25 20:50:33 dari sumber yang terpercaya', 'https://www.viva.co.id/digital/startup/1478666-indodax-gandeng-startup-pengelolaan-sampah-buat-apa', 'https://thumb.viva.co.id/media/frontend/thumbs3/2022/02/21/62136666b22f7-ilustrasi-sampah_665_374.jpg', '2022-05-25T13:50:33Z', 'VIVA  Salah satu masalah yang dialami oleh semua kota di dunia, yakni sampah. Berdasarkan data yang dihimpun dari Kementerian Lingkungan Hidup dan Kehutanan, total sampah nasional pada tahun lalu men. [+1193 chars]'),
(4, 'Yunisa Herawati', 'Toyota Ungkap Kunci Percepatan Pengembangan Mobil Listrik di RI', 'Berita Toyota Ungkap Kunci Percepatan Pengembangan Mobil Listrik di RI terbaru hari ini 2022-05-25 13:02:02 dari sumber yang terpercaya', 'https://www.viva.co.id/otomotif/mobil/1478445-toyota-ungkap-kunci-percepatan-pengembangan-mobil-listrik-di-ri', 'https://thumb.viva.co.id/media/frontend/thumbs3/2022/04/02/6248188f81038-toyota-kijang-innova-ev-concept_665_374.jpg', '2022-05-25T06:02:02Z', 'VIVA  Toyota menjadi salah satu pabrikan otomotif yang gencar membantu pemerintah, dalam mengembangkan kendaraan listrik di Indonesia. Berbagai cara mereka lakukan, mulai dari menghadirkan beragam pr. [+1268 chars]'),
(5, 'Lazuardhi Utama', '\'Nyawa\' Bumi di Tangan Generasi Muda', 'Isu Planet Bumi yang berkelanjutan dan layak huni harus melekat ke generasi muda. Sebab, mereka yang akan mewarisi kehidupan di Bumi untuk jangka panjang.', 'https://www.viva.co.id/digital/digilife/1477581-nyawa-bumi-di-tangan-generasi-muda', 'https://thumb.viva.co.id/media/frontend/thumbs3/2018/11/29/5bfff01b6475f-planet-bumi_665_374.jpg', '2022-05-23T06:53:01Z', 'VIVA  Perwakilan anak muda negara-negara anggota G20 atau Youth 20 (Y20) menyerukan pentingnya peran generasi muda mewujudkan Planet Bumi yang berkelanjutan dan layak huni.\r\nCo-Chair Y20 Indonesia 20. [+1011 chars]'),
(6, 'Siti Ruqoyah', 'Butuh 14 GW Untuk Capai 23 Persen Energi Terbarukan Tahun 2025', 'Indonesia hanya akan membangun 10,9 GW pembangkit energi terbarukan hingga 2025. Masih ada kekurangan 3-4 GW untuk mencapai bauran 23%.', 'https://www.viva.co.id/berita/nasional/1483745-butuh-14-gw-untuk-capai-23-persen-energi-terbarukan-tahun-2025', 'https://thumb.viva.co.id/media/frontend/thumbs3/2018/07/13/5b4891b33f96d-ilustrasi-energi-terbarukan_665_374.jpg', '2022-06-10T05:12:12Z', 'VIVA  Pemerintah melalui Kementerian Energi dan Sumber Daya Mineral (ESDM) telah menerbitkan Peraturan Menteri Nomor 26 Tahun 2021 tentang PLTS Atap yang Terhubung pada Jaringan Tenaga Listrik Pemega. [+2443 chars]'),
(7, 'Fikri Halim', 'Kemenko Marves Soroti Dampak Sampah Plastik Bagi Lingkungan', 'Berita Kemenko Marves Soroti Dampak Sampah Plastik Bagi Lingkungan terbaru hari ini 2022-05-31 16:09:33 dari sumber yang terpercaya', 'https://www.viva.co.id/berita/bisnis/1480266-kemenko-marves-soroti-dampak-sampah-plastik-bagi-lingkungan', 'https://thumb.viva.co.id/media/frontend/thumbs3/2022/04/07/624f12c9eff98-sampah-plastik-di-laut_665_374.jpg', '2022-05-31T09:09:33Z', 'VIVA  Kementerian Koordinator Bidang Kemaritiman dan Investasi (Kemenko Marves) menaruh perhatian besar pada dampak dari sampah plastik pada lingkungan. Khususnya bagi ekosistem kelautan.\r\nHal itu se. [+1115 chars]'),
(8, 'Fikri Halim', 'Dua Solusi yang Bisa Dipertimbangkan untuk Atasi Masalah Minyak Goreng', 'Salah satunya adalah pengolahan minyak jelantah yang dapat digunakan untuk bahan bakar diesel. Hal ini dinilai bisa mengatai masalah minyak goreng.', 'https://www.viva.co.id/berita/bisnis/1484386-dua-solusi-yang-bisa-dipertimbangkan-untuk-atasi-masalah-minyak-goreng', 'https://thumb.viva.co.id/media/frontend/thumbs3/2022/03/05/62232c8502cb4-warga-mengatre-minyak-goreng-murah-saat-operasi-pasar_665_374.jpg', '2022-06-12T16:38:53Z', 'VIVA  Dua solusi untuk mengatasi masalah kelangkaan minyak goreng direkomendasikan oleh Chakra Giri Energi Indonesia (CGEI). CGEI merupakan salah satu perusahaan konsultan energi berkelanjutan.\\r\\nSolu… [+3452 chars]'),
(9, 'Ichsan Suhendra', 'Pesan Anindya Bakrie untuk Finalis Putri Otonomi Indonesia 2022', '12 Finalis Putri Otonomi Indonesia 2022 berkunjung ke redaksi tvOne dan bertemu dengan Presiden Direktur PT Visi Media Asia (VIVA), Anindya Bakrie.', 'https://www.viva.co.id/gaya-hidup/inspirasi-unik/1485714-pesan-anindya-bakrie-untuk-finalis-putri-otonomi-indonesia-2022', 'https://thumb.viva.co.id/media/frontend/thumbs3/2022/06/15/62a9ebdb31702-anindya-bakrie-bersama-finalis-puteri-otonomi-indonesia-2022_665_374.jpeg', '2022-06-15T14:34:26Z', 'VIVA  Kedua belas finalis Putri Otonomi Indonesia 2022 berkunjung ke redaksi tvOne. Mereka ingin mendengar langsung dari para pelaku usaha dan orang yang bergerak di industri salah satu media terbesa. [+2496 chars]'),
(10, 'admin', 'Agar Roda Ekonomi Tetap Berjalan, Wali Kota Probolinggo Ajak Masyarakat Bangkit Dari Pandemi Covid-1', 'PROBOLINGGO, Jumat (20/5/2022) suaraindonesia-news.com - Wali Kota Probolinggo Habib Hadi Zainal Abidin mengajak masyarakat untuk bangkit bersama-sama dari pandemi Covid-19, sehingga roda\nThe post Agar Roda Ekonomi Tetap Berjalan, Wali Kota Probolinggo Ajak M.', 'https://suaraindonesia-news.com/agar-roda-ekonomi-tetap-berjalan-wali-kota-probolinggo-ajak-masyarakat-bangkit-dari-pandemi-covid-19/', 'https://suaraindonesia-news.com/wp-content/uploads/2022/05/IMG_20220520_192623.jpg', '2022-05-20T12:30:15Z', 'PROBOLINGGO, Jumat (20/5/2022) suaraindonesia-news.com - Wali Kota Probolinggo Habib Hadi Zainal Abidin mengajak masyarakat untuk bangkit bersama-sama dari pandemi Covid-19, sehingga roda ekonomi tet. [+3755 chars]');

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
(4, 'Bekasi'),
(77, 'Malang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mitra`
--

CREATE TABLE `mitra` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(500) NOT NULL,
  `kota_jangkauan` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mitra`
--

INSERT INTO `mitra` (`id`, `nama`, `alamat`, `email`, `date_added`, `date_updated`, `image`, `kota_jangkauan`) VALUES
(1, 'PT Starlax', 'Green Sedayu Bizpark Blok DM Boulevard No.2 Jl.Daan Mogot KM.18 Kali Deres - Jakarta Barat', 'dwikysahut@gmail.com', '2022-05-20 19:53:33', '2022-06-11 17:26:46', 'image-1654601928169.jpg', '[\"Tangerang\",\"Depok\"]'),
(17, 'PT Hijau', 'malang', 'dwikysahut@gmail.com', '2022-05-25 19:09:17', '2022-06-08 21:58:52', 'image-1654602036326.jpg', '[\"Depok\"]'),
(19, 'pt coba', 'malang', 'coba@gmail.com', '2022-06-08 17:23:43', '2022-06-18 21:57:24', 'image-1655564244391.png', '[\"Jakarta\",\"Depok\"]'),
(25, 'Artha Metro Oil', 'Sentra Prima Techno Park Block E 05, Jalan Palem Manis Raya, Kampung Rawacana, Gandasari, Kec. Jatiuwung, Kota Tangerang, Banten 15137', 'dwikysatriahut@gmail.com', '2022-06-28 23:32:01', '2022-07-03 19:20:01', 'image-1656850801358.png', '[\"Jakarta\"]');

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
('Cq-PQmP28fjgcnII', '03f2lqMyr8muNcwx', 17, '2022-05-22', '20:00:00', 'tolong ambil jam 20:00 keatas', 2, 4, 2, 'malang', '2022-06-29 15:39:48', '2022-06-29 15:43:26'),
('cr-y0WvCsxMqSHd8', 'rn2g4lL3iy3ycKuK', 1, '2022-05-12', '01:45:00', 'bismillah', 12, 4, 3, 'bogor', '2022-05-31 20:40:25', '2022-06-11 18:38:03'),
('Fz0Zh9SBs5-Iio6b', 'U7tt4isE5kz2_Jey', 25, '2022-07-02', '14:39:00', 'tolong ambil diatas jam 15.00', 3, 4, 1, 'jalan jakarta', '2022-06-30 14:37:26', '2022-07-01 17:08:01'),
('HwDJpo7gyvR5CQI1', '03f2lqMyr8muNcwx', 19, '2022-06-01', '19:56:00', 'asd', 3, 2, 1, 'sdsa', '2022-06-17 19:54:49', '2022-06-27 17:55:25'),
('ipeXBFBBynxVbh6U', 'rn2g4lL3iy3ycKuK', 1, '2022-05-22', '20:00:00', 'tolong ambil jam 20:00 keatas', 2, 4, 3, 'malang', '2022-05-31 20:38:23', '2022-06-27 17:57:16'),
('XaLV0xidOyja3ZEV', '03f2lqMyr8muNcwx', 1, '2022-05-22', '20:00:00', 'tolong ambil jam 20:00 keatas', 2, 3, 2, 'jalan malang sekali', '2022-05-25 21:32:13', '2022-06-24 08:57:49');

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
(2, 'on process'),
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
  `no_telp` char(15) NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `id_keterangan` int(11) NOT NULL DEFAULT 1,
  `password` varchar(80) NOT NULL,
  `id_role` int(11) NOT NULL DEFAULT 2,
  `image` varchar(100) NOT NULL,
  `kode_verif` varchar(255) DEFAULT NULL,
  `verified` varchar(10) NOT NULL DEFAULT 'false',
  `suspend` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `no_telp`, `alamat`, `id_keterangan`, `password`, `id_role`, `image`, `kode_verif`, `verified`, `suspend`) VALUES
('03f2lqMyr8muNcwx', 'dwikys', 'dwikysatriahut@gmail.com', '13123124124', 'malangs', 5, '$2b$06$xn/wOFqDeX3O7vYwtAeHQeFigj5kfre4YkEjdyGPsK7bpnpQ.RVXO', 2, 'https://ui-avatars.com/api/?size=256&name=user', '$2b$06$T8geT0XLuictoCHHuuzfqeavwjYF7Yz7dbeyHBp9dtt0.zxFpwrTu', 'true', 0),
('CXHU9uBfYTCIjDWW', 'Yoga', 'pujitresnaprayoga@gmail.com', '0823123123', 'jalan jalan dulu, kalo cocok lanjut', 1, '$2b$06$s3wB2b6PuTnspM5mIC4QwOniJHQFHhzkKEuKYjOlNrynGwaszSTiy', 2, 'https://ui-avatars.com/api/?size=256&name=Yoga', '$2b$06$mlEMuR95DPHUYT1CfaGrTuLTRV6fxRUUdPhkh.rvUt1rf2o7k1eri', 'true', 0),
('fq4PuxMWyAiyMfS4', 'gasga', 'gaga@gmail.com', '123123', 'asdsa', 1, '$2b$06$sBv7CvMdRNlqyumkXTJdROdIFbWFjKaBf7TKChBasg8kk1oeRtbhi', 2, 'https://ui-avatars.com/api/?size=256&name=gasga', '$2b$06$7FkLugfblAMENw5.tGzfWuvz/UnfifYJaIV6JyuWUefDfp1vPMS7m', 'false', 0),
('jdsslN_rM96UHcxj', 'ads', 'fggg@gmail.com', '123123', 'asdsa', 1, '$2b$06$Gd.BtpfAlPBb76kIwGpKIO8K3rMZIFFQfHznrWhnGQuW/TEs/XqH.', 2, 'https://ui-avatars.com/api/?size=256&name=ads', '$2b$06$iS.JvYxpYc/ZDbTYmGf.WOvfYQGFDeuxn2Dc1n1HXSwu3nUHMh4QG', 'false', 0),
('k-1MqPqXmnkScHBS', 'aaa', 'aaa@gmail.com', '123321', 'asd', 1, '$2b$06$VdVC0N3bZfeoYccZvruwQu3PTlR5qtWL6ZS/W1l/3ZeN3GTzlRfM6', 2, 'https://ui-avatars.com/api/?size=256&name=aaa', '$2b$06$65SHj3//araMQY/x5D3EHOFMvjGnvf3ZOGheBg5DFMz0DMhUdN56i', 'false', 0),
('lLoFlsJk34iklZQj', 'gggg', 'ggggg', '12321', 'asdsad', 1, '$2b$06$uTuPc3kfvA6fXZR3jBEFd.jEQjdRdtg4vWO4YsHtnizvEX5NeIEwe', 2, 'https://ui-avatars.com/api/?size=256&name=gggg', '$2b$06$eqRxDqsyI3sQ0SCZOS809eZEvbSMVZAO7KMpPkQ3G6mHjN94M0b8m', 'false', 0),
('mS0u8YE8PJx4h6Mn', 'asd', 'ddd@gmail.com', '123', 'asd', 1, '$2b$06$qHn.0f4Sd8azf8ed9zvTlenH5ny5xCSFBUKfyw5cYaivpGgUpiE9i', 2, 'https://ui-avatars.com/api/?size=256&name=asd', '$2b$06$6em7pIk91DbqZTSnVrbM5OjyiDTYIl95D5K.9OcXXMbYUCBaV63t6', 'false', 0),
('nD8SAfzLs5XXj_aD', 'asd', 'dasd@gmail.com', '12312', 'asd', 1, '$2b$06$a32G1Vx9DnZfF4SiI9S8QOzIdcmYn4gSQHCRudi8eMS0p14KJaAtC', 2, 'https://ui-avatars.com/api/?size=256&name=asd', '$2b$06$Mw0SSxZuhcL4zvSCZx3uH.fG4x.d8NT8zWYY4ynnkeHXXi4WC3192', 'false', 0),
('NM2VehMnwGOBi5qU', 'asdsa', 'asdasd', '123', 'ads', 1, '$2b$06$22nmWkkTRZJ8BDQ7BN//uelYQv8AhBwLnjgSsK6daDlfKbBpwcCU2', 2, 'https://ui-avatars.com/api/?size=256&name=asdsa', '$2b$06$jQWEjfZe6bANAPINSVjQ7Och4YI1PhOY/SVk55p1S4Ti8PbesZNdm', 'false', 0),
('rn2g4lL3iy3ycKuK', 'sweet', 'sweetpapayahh@gmail.com', '8123456', 'mars', 1, '$2b$06$s4aX9BiLm2TQbwUMtgfuOe9vR8eLPAxxSBnOT1bkoqEEEv8SmHxa6', 2, 'https://ui-avatars.com/api/?size=256&name=user', '$2b$06$9BdR.UbkIaOoSLihpYEO3u/XopQj9Izgl.zUyWZsiZbkNuoWD0num', 'true', 0),
('SkfHYucbR_8hyYDc', 'asd', 'asd@gmail.com', '123', '123asd', 1, '$2b$06$JXRDJ6idsdli5DTNtOWkG.Or4Y4Fz/aZmD5eXpIBEPxkOYe18Ji8K', 2, 'https://ui-avatars.com/api/?size=256&name=asd', '$2b$06$lW7tX7/nhaUSP7Ba5vwOg.yaELQ7iA/C7Bju2x.t7xwrIvSeFZUM.', 'false', 0),
('U7tt4isE5kz2_Jey', 'dwiky', 'dwikysahut@gmail.com', '082342312312', 'jln disuatu tempat malang', 1, '$2b$06$1UDFW9gNAUHewhIel4PmROgUNRHuU0.udtzsYKDvWdqgwU6RqCwSG', 2, 'https://ui-avatars.com/api/?size=256&name=dwiky', '$2b$06$1rs0W5ypiIFckJ1Y1aRcuusJ68x5.kupOKtovDOru3uTPxc9sOtGS', 'true', 0),
('vcte55Coi4pBhjZ-', 'nova', 'novaramadhona2000@gmail.com', '12213', 'asdas', 1, '$2b$06$tnJs8ER04vgOg79P1qWG5.idbxtZPjxMzVb1jT.dmQ1ZsJGwvGe9G', 2, 'https://ui-avatars.com/api/?size=256&name=nova', '$2b$06$QjFwnAKvr0.oD1FrO/6x4u/JBGrGYF74ScHtldlUZRmaiCsixB0tq', 'true', 0),
('yhSjkxUxIaE6e5v3', 'admin', 'pelipurapps@gmail.com', '123123', 'malang', 1, '$2b$06$0j3jZmplF.iFmH8xrRWhiekeWnPCh.I.Ci03w4R/v5xlPJtv4Fi0i', 1, 'https://ui-avatars.com/api/?size=256&name=admin', '$2b$06$SCWTrl7kUUQq/bTa6bXfn.4NoSZ2z90bcSKKyPI3IHr0656miGG8i', 'true', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `keterangan`
--
ALTER TABLE `keterangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kota`
--
ALTER TABLE `kota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT untuk tabel `mitra`
--
ALTER TABLE `mitra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
