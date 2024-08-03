-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 27 Mar 2023 pada 04.30
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_klinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan`
--

CREATE TABLE `pengaturan` (
  `id_pengaturan` int(11) NOT NULL,
  `nama_aplikasi` varchar(80) NOT NULL,
  `copyright` varchar(80) NOT NULL,
  `bg_login` text NOT NULL,
  `slide` text NOT NULL,
  `logo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengaturan`
--

INSERT INTO `pengaturan` (`id_pengaturan`, `nama_aplikasi`, `copyright`, `bg_login`, `slide`, `logo`) VALUES
(1, 'E-Klinik', 'Pusat Perawatan Luka Mari Yo', 'bg klinik 2.jpg', 'slide1.png', 'clinic.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekam_medis_obat`
--

CREATE TABLE `rekam_medis_obat` (
  `id` int(11) NOT NULL,
  `id_rekam_medis` int(11) NOT NULL,
  `jml` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_agama`
--

CREATE TABLE `tbl_agama` (
  `id_agama` int(11) NOT NULL,
  `agama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_agama`
--

INSERT INTO `tbl_agama` (`id_agama`, `agama`) VALUES
(1, 'Islam'),
(2, 'Protestan'),
(3, 'Katolik'),
(4, 'Hindu'),
(5, 'Buddha'),
(6, 'Khonghucu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_gol_darah`
--

CREATE TABLE `tbl_gol_darah` (
  `id_gol_darah` int(11) NOT NULL,
  `golongan_darah` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_gol_darah`
--

INSERT INTO `tbl_gol_darah` (`id_gol_darah`, `golongan_darah`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'O'),
(4, 'AB');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jk`
--

CREATE TABLE `tbl_jk` (
  `id_jk` int(11) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_jk`
--

INSERT INTO `tbl_jk` (`id_jk`, `jenis_kelamin`) VALUES
(1, 'Laki-laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_obat`
--

CREATE TABLE `tbl_obat` (
  `id_obat` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `jenis_obat` varchar(50) NOT NULL,
  `dosis` varchar(40) NOT NULL,
  `stok_obat` varchar(30) NOT NULL,
  `stok_keluar` varchar(20) NOT NULL,
  `tgl_kadaluarsa` date NOT NULL,
  `harga` varchar(20) NOT NULL,
  `harga_jual` varchar(20) NOT NULL,
  `profit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pasien`
--

CREATE TABLE `tbl_pasien` (
  `id_pasien` int(11) NOT NULL,
  `tgl_terdaftar` date NOT NULL,
  `nama_pasien` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `usia` int(11) NOT NULL,
  `id_jk` int(11) NOT NULL,
  `nama_ibu` varchar(60) NOT NULL,
  `id_agama` int(11) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `gol_darah` varchar(10) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_rekam_medis`
--

CREATE TABLE `tbl_rekam_medis` (
  `id_rekam_medis` int(11) NOT NULL,
  `kode_rm` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `bln` varchar(2) NOT NULL,
  `thn` varchar(4) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `pemeriksaan_fisik` text NOT NULL,
  `diagnosa` text NOT NULL,
  `terapi` text NOT NULL,
  `biaya_periksa` int(20) NOT NULL,
  `biaya` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` text NOT NULL,
  `id_jk` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `id_jk`, `email`, `no_telp`, `photo`) VALUES
(5, 'Administrator', 'admin', '8542516f8870173d7d1daba1daaaf0a1', 1, 'admin@gmail.com', '0800000000', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pengaturan`
--
ALTER TABLE `pengaturan`
  ADD PRIMARY KEY (`id_pengaturan`);

--
-- Indeks untuk tabel `rekam_medis_obat`
--
ALTER TABLE `rekam_medis_obat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `id_rekam_medis` (`id_rekam_medis`);

--
-- Indeks untuk tabel `tbl_agama`
--
ALTER TABLE `tbl_agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indeks untuk tabel `tbl_gol_darah`
--
ALTER TABLE `tbl_gol_darah`
  ADD PRIMARY KEY (`id_gol_darah`);

--
-- Indeks untuk tabel `tbl_jk`
--
ALTER TABLE `tbl_jk`
  ADD PRIMARY KEY (`id_jk`);

--
-- Indeks untuk tabel `tbl_obat`
--
ALTER TABLE `tbl_obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indeks untuk tabel `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD KEY `id_jk` (`id_jk`),
  ADD KEY `id_agama` (`id_agama`);

--
-- Indeks untuk tabel `tbl_rekam_medis`
--
ALTER TABLE `tbl_rekam_medis`
  ADD PRIMARY KEY (`id_rekam_medis`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaturan`
--
ALTER TABLE `pengaturan`
  MODIFY `id_pengaturan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `rekam_medis_obat`
--
ALTER TABLE `rekam_medis_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_agama`
--
ALTER TABLE `tbl_agama`
  MODIFY `id_agama` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_gol_darah`
--
ALTER TABLE `tbl_gol_darah`
  MODIFY `id_gol_darah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_jk`
--
ALTER TABLE `tbl_jk`
  MODIFY `id_jk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_obat`
--
ALTER TABLE `tbl_obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_rekam_medis`
--
ALTER TABLE `tbl_rekam_medis`
  MODIFY `id_rekam_medis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `rekam_medis_obat`
--
ALTER TABLE `rekam_medis_obat`
  ADD CONSTRAINT `rekam_medis_obat_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `tbl_obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rekam_medis_obat_ibfk_2` FOREIGN KEY (`id_rekam_medis`) REFERENCES `tbl_rekam_medis` (`id_rekam_medis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  ADD CONSTRAINT `tbl_pasien_ibfk_1` FOREIGN KEY (`id_jk`) REFERENCES `tbl_jk` (`id_jk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_pasien_ibfk_2` FOREIGN KEY (`id_agama`) REFERENCES `tbl_agama` (`id_agama`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_rekam_medis`
--
ALTER TABLE `tbl_rekam_medis`
  ADD CONSTRAINT `tbl_rekam_medis_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tbl_pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_rekam_medis_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
