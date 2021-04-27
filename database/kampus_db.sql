-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 27, 2021 at 08:55 AM
-- Server version: 5.7.33-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kampus_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datasiswa`
--

CREATE TABLE `tbl_datasiswa` (
  `id_datasiswa` int(11) NOT NULL,
  `id_kelas` varchar(60) NOT NULL,
  `nis` varchar(60) NOT NULL,
  `id_jurusan` varchar(60) NOT NULL,
  `tgl_tambah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_datasiswa`
--

INSERT INTO `tbl_datasiswa` (`id_datasiswa`, `id_kelas`, `nis`, `id_jurusan`, `tgl_tambah`) VALUES
(1, 'X2021', '342334356', 'RPL', '2021-04-26 02:46:22'),
(2, 'X2021', '441211233', 'MM', '2021-04-26 02:46:22'),
(3, 'X2021', '342343435', 'MM', '2021-04-26 02:46:22'),
(4, 'X2021', '443453554', 'RPL', '2021-04-26 02:46:22'),
(5, 'X2021', '565334579', 'RPL', '2021-04-26 02:46:22'),
(6, 'XI2019', '565634547', 'RPL', '2021-04-26 02:46:22'),
(7, 'XI2019', '566566544', 'RPL', '2021-04-26 02:46:22'),
(8, 'XI2019', '666567544', 'MM', '2021-04-26 02:46:22'),
(9, 'XI2019', '667593943', 'RPL', '2021-04-26 02:46:22'),
(10, 'XI2019', '786767556', 'RPL', '2021-04-26 02:46:22'),
(11, 'XII2018', '839129831', 'MM', '2021-04-26 02:46:22'),
(12, 'XII2018', '893348458', 'MM', '2021-04-26 02:46:22'),
(13, 'XII2018', '990878777', 'RPL', '2021-04-26 02:46:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_guru`
--

CREATE TABLE `tbl_guru` (
  `id_guru` varchar(60) NOT NULL,
  `nama_guru` text,
  `nip` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_guru`
--

INSERT INTO `tbl_guru` (`id_guru`, `nama_guru`, `nip`) VALUES
('DG-0001', 'Irwansyah Saputra. S.kom.', '000318989'),
('DG-0002', 'Surya Herdiansyah. S.kom.', '21290919'),
('DG-0003', 'Wahyudi. S.T,', '231312412'),
('DG-0004', 'Kalinga Putra S.kom.', '62161181'),
('DG-0005', 'Reni Setiansyah. S.Kom.', '2138193810');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `id_jurusan` varchar(60) NOT NULL,
  `jurusan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`id_jurusan`, `jurusan`) VALUES
('MM', 'Multimedia'),
('RPL', 'Rekayasa Perangkat Lunak');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `id_kelas` varchar(60) NOT NULL,
  `kelas` text,
  `id_guru` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`id_kelas`, `kelas`, `id_guru`) VALUES
('X2021', 'Kelas X Angkatan 2021/2022', 'DG-0001'),
('XI2019', 'Angkatan XI 2019/2020', 'DG-0005'),
('XII2018', 'Kelas XII angakatan 2018/2019', 'DG-0003');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `nis` varchar(60) NOT NULL,
  `nama_siswa` text,
  `jenis_kelamin` text,
  `alamat` text,
  `no_telp` text,
  `email` text,
  `tgl_terdaftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`nis`, `nama_siswa`, `jenis_kelamin`, `alamat`, `no_telp`, `email`, `tgl_terdaftar`) VALUES
('342334356', 'Wawan Handoyo', 'Laki-laki', 'Cikarang, Bekasi', ' 881xxxxxxxx', 'rendi@gmail.com', '2021-04-26 03:05:52'),
('342343435', 'sasa', 'Laki-Laki', 'Bandung', '92xxxx', 'sasa@gmail.com', '2021-04-26 07:21:43'),
('441211233', 'Lukman', 'Laki-laki', 'Cikarang, Bekasi', '881xxxxxxxx', 'Lookman@gmail.com', '2021-04-26 03:05:52'),
('443453554', ' Hendi Afrandi', 'Laki-laki', ' Cikarang, Bekasi', ' 881xxxxxxxx', ' hendingmail.com', '2021-04-26 03:05:52'),
('565334579', 'Suci Pudjiastuti', 'Perempuan', 'Cikarang, Bekasi', '881xxxxxxxx', 'suci@gmail.com', '2021-04-26 03:05:52'),
('565634547', 'Lita Bianka', 'Perempuan', ' Cikarang, Bekasi', '681xxxxxxxx', 'lita@gmail.com', '2021-04-26 03:05:52'),
('566566544', 'Ghina Syifa', 'Perempuan', 'Babatan, Banten', '081xxxxxxxx', 'ghina@gmail.com', '2021-04-26 03:05:52'),
('666567544', 'Wisnu Farnandi', 'Laki-laki', 'Cikarang, Bekasi', '681xxxxxxxxx', 'wisnu@gmail.com', '2021-04-26 03:05:52'),
('667593943', 'Setya Budi Rahman', 'Laki-laki', 'Cikarang, Bekasi', ' 081xxxxxxxx ', 'setya@gmail.com', '2021-04-26 03:05:52'),
('786767556', 'Rendra Adijaya', 'Laki-laki', 'Cibitung, Bekasi', '881xxxxxxxx', 'rendra@gmail.com', '2021-04-26 03:05:52'),
('839129831', 'Rendi Afriansyah', 'Laki-laki', 'Cikarang, Bekasi', '881xxxxxxxxxx', 'Trendi@gmail.com', '2021-04-26 03:04:55'),
('886595444', 'Winda Ayuningtias', 'Perempuan', 'Cikeas, Bogor', '881xxxxxxxx', 'winda@gmail.com', '2021-04-26 03:05:52'),
('887788956', ' Wahyu Saputra', 'Laki-laki', 'Pandeglang, Banten', '881xxxxxxxxxx', 'wahyu@gmail.com', '2021-04-26 03:05:52'),
('893348458', 'Sufyan Iantara', 'Laki-laki', 'Ciracas, Jakarta', '881xxxxxxxxxxxxxx', 'sufyan@gmail.com', '2021-04-26 03:05:52'),
('999878777', 'Wayana Irhan', 'Laki-Laki', 'Balumbung, Bali', '981xxxxxxxx', 'wayan@gmail.com', '2021-04-26 03:05:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_datasiswa`
--
ALTER TABLE `tbl_datasiswa`
  ADD PRIMARY KEY (`id_datasiswa`,`id_kelas`,`nis`,`id_jurusan`),
  ADD KEY `fK_jur2datasiswa` (`id_jurusan`),
  ADD KEY `fk_ssw2datasiswa` (`nis`),
  ADD KEY `fK_kls2datasiswa` (`id_kelas`);

--
-- Indexes for table `tbl_guru`
--
ALTER TABLE `tbl_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`id_kelas`,`id_guru`),
  ADD KEY `fk_gr2kelas` (`id_guru`);

--
-- Indexes for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`nis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_datasiswa`
--
ALTER TABLE `tbl_datasiswa`
  MODIFY `id_datasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_datasiswa`
--
ALTER TABLE `tbl_datasiswa`
  ADD CONSTRAINT `fK_jur2datasiswa` FOREIGN KEY (`id_jurusan`) REFERENCES `tbl_jurusan` (`id_jurusan`),
  ADD CONSTRAINT `fK_kls2datasiswa` FOREIGN KEY (`id_kelas`) REFERENCES `tbl_kelas` (`id_kelas`),
  ADD CONSTRAINT `fk_ssw2kelas` FOREIGN KEY (`nis`) REFERENCES `tbl_siswa` (`nis`);

--
-- Constraints for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD CONSTRAINT `fk_gr2kelas` FOREIGN KEY (`id_guru`) REFERENCES `tbl_guru` (`id_guru`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
