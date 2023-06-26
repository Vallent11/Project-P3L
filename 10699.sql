-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2023 at 03:42 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `10699`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking_gym`
--

CREATE TABLE `booking_gym` (
  `no_booking_gym` int(11) NOT NULL,
  `tgl_booking_gym` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kehadiran_gym` varchar(255) NOT NULL,
  `tanggal_sesi_gym` date NOT NULL,
  `is_canceled` tinyint(4) NOT NULL,
  `id_sesi_gym` int(11) NOT NULL,
  `id_member` varchar(255) NOT NULL,
  `no_struk_transaksi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_gym`
--

INSERT INTO `booking_gym` (`no_booking_gym`, `tgl_booking_gym`, `kehadiran_gym`, `tanggal_sesi_gym`, `is_canceled`, `id_sesi_gym`, `id_member`, `no_struk_transaksi`) VALUES
(12, '2023-05-23 17:17:16', 'hadir', '2023-05-24', 0, 3, '23.05.001', '23.05.002'),
(13, '2023-05-23 14:27:49', 'tidak hadir', '2023-05-24', 0, 5, '23.05.001', '23.05.001'),
(14, '2023-05-23 17:17:27', 'hadir', '2023-05-25', 0, 2, '23.05.001', '23.05.001'),
(15, '2023-05-23 15:22:48', 'hadir', '2023-05-25', 0, 3, '23.05.002', '23.05.002'),
(16, '2023-05-23 17:36:42', 'hadir', '2023-05-30', 0, 2, '23.05.001', '23.05.012'),
(17, '2023-05-23 17:37:07', 'tidak hadir', '2023-05-29', 0, 2, '23.05.002', '23.05.013'),
(18, '2023-05-23 17:37:20', 'tidak hadir', '2023-05-25', 0, 2, '23.05.001', '23.05.011'),
(19, '2023-05-24 02:10:47', 'hadir', '2023-05-29', 0, 4, '23.05.003', '23.05.095'),
(21, '2023-06-01 01:11:11', 'hadir', '2023-05-31', 0, 3, '23.05.004', '23.05.008'),
(22, '2023-06-02 01:45:48', 'hadir', '2023-06-02', 0, 3, '23.05.002', '23.05.011');

-- --------------------------------------------------------

--
-- Table structure for table `booking_kelas`
--

CREATE TABLE `booking_kelas` (
  `no_booking_kelas` int(11) NOT NULL,
  `tgl_booking_kelas` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kehadiran_kelas` varchar(255) NOT NULL,
  `is_canceled` tinyint(4) NOT NULL,
  `id_jadwal_harian` int(11) NOT NULL,
  `id_member` varchar(255) NOT NULL,
  `no_struk_transaksi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_kelas`
--

INSERT INTO `booking_kelas` (`no_booking_kelas`, `tgl_booking_kelas`, `kehadiran_kelas`, `is_canceled`, `id_jadwal_harian`, `id_member`, `no_struk_transaksi`) VALUES
(34, '2023-05-30 08:28:18', 'hadir', 0, 15, '23.05.002', '23.05.025'),
(35, '2023-05-30 08:29:42', 'hadir', 0, 16, '23.05.004', '23.05.024'),
(36, '2023-05-30 08:32:07', 'hadir', 0, 17, '23.05.004', '23.05.023'),
(37, '2023-05-30 08:35:36', 'hadir', 0, 17, '23.05.003', '23.05.022'),
(38, '2023-05-30 08:35:54', 'hadir', 0, 17, '23.05.002', '23.05.010'),
(39, '2023-05-30 08:36:08', 'hadir', 0, 16, '23.05.003', '23.05.018'),
(40, '2023-05-30 15:10:59', 'hadir', 0, 16, '23.05.003', '23.05.021'),
(41, '2023-05-30 15:24:52', 'hadir', 0, 15, '23.05.003', '23.05.019'),
(42, '2023-05-30 16:13:19', 'hadir', 0, 16, '23.05.002', '23.05.020'),
(43, '2023-05-30 16:17:07', 'tidak hadir', 0, 18, '23.05.004', '23.05.005'),
(44, '2023-05-31 04:33:48', 'hadir', 0, 18, '23.05.001', '23.05.008'),
(45, '2023-05-31 04:34:05', 'hadir', 0, 16, '23.05.002', '23.05.015'),
(46, '2023-06-01 00:48:08', 'hadir', 0, 18, '23.05.006', '23.05.006'),
(47, '2023-06-01 01:10:37', 'diliburkan', 0, 17, '23.05.002', '23.05.019'),
(48, '2023-06-01 01:11:27', 'hadir', 0, 17, '23.05.006', '23.05.013'),
(49, '2023-06-02 01:45:04', 'hadir', 0, 19, '23.05.004', '23.05.006');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instruktur`
--

CREATE TABLE `instruktur` (
  `id_instruktur` int(11) NOT NULL,
  `nama_instruktur` varchar(255) NOT NULL,
  `tgl_lahir_instruktur` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `alamat_instruktur` varchar(255) NOT NULL,
  `no_telp_instruktur` int(12) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `akumulasi_terlambat` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instruktur`
--

INSERT INTO `instruktur` (`id_instruktur`, `nama_instruktur`, `tgl_lahir_instruktur`, `alamat_instruktur`, `no_telp_instruktur`, `id_pengguna`, `akumulasi_terlambat`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 'Jane Smith Lia Anggraini', '2023-05-30 08:43:28', 'Jl. Raya Kebun Jeruk No. 12', 2147483647, 8, 0, '2023-05-30 08:40:58', NULL, NULL),
(19, 'Bambang Sutrisno', '2023-05-30 08:43:31', 'Jl. Diponegoro No. 20', 2147483647, 15, 0, '2023-05-30 08:40:58', NULL, NULL),
(21, 'Denny Wijaya', '2023-05-30 08:43:34', 'Jln. Romawi No 23', 86347248, 16, 0, '2023-05-30 08:40:58', NULL, NULL),
(22, 'Siska Dewi', '2023-05-30 08:43:37', 'Jln. Nobara no 10', 851173623, 17, 0, '2023-05-30 08:40:58', NULL, NULL),
(32, 'Sayang', '2023-05-30 08:43:41', 'atma jaya', 8735272, 57, 0, '2023-05-30 08:40:58', NULL, NULL),
(33, 'Iya Sayang iyaaa', '2023-05-30 08:43:54', 'Atma Jaya', 8726272, 58, 2, '2023-05-30 08:40:58', NULL, NULL),
(36, 'Vallent', '2023-05-30 08:43:57', 'Atma', 782483, 57, 4, '2023-05-30 08:40:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `izin_instruktur`
--

CREATE TABLE `izin_instruktur` (
  `id_izin_instruktur` int(11) NOT NULL,
  `status_izin_instruktur` varchar(255) NOT NULL,
  `tgl_pengajuan_izin_instruktur` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_instruktur` int(11) NOT NULL,
  `id_instruktur_pengganti` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `izin_instruktur`
--

INSERT INTO `izin_instruktur` (`id_izin_instruktur`, `status_izin_instruktur`, `tgl_pengajuan_izin_instruktur`, `id_instruktur`, `id_instruktur_pengganti`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 'belum dikonfirmasi', '2023-05-23 14:24:57', 21, 32, '2023-05-30 08:42:45', NULL, NULL),
(9, 'dikonfirmasi', '2023-05-23 14:25:10', 36, 22, '2023-05-30 08:42:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_harian`
--

CREATE TABLE `jadwal_harian` (
  `id_jadwal_harian` int(11) NOT NULL,
  `tgl_jadwal_harian` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jumlah_peserta` int(255) NOT NULL,
  `id_jadwal_umum` int(11) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_harian`
--

INSERT INTO `jadwal_harian` (`id_jadwal_harian`, `tgl_jadwal_harian`, `jumlah_peserta`, `id_jadwal_umum`, `status`, `jam_mulai`, `jam_selesai`) VALUES
(9, '2023-05-30 07:45:34', 10, 12, 'diliburkan', '00:00:00', '00:00:00'),
(10, '2023-05-30 07:32:40', 12, 11, 'diliburkan', '00:00:00', '00:00:00'),
(11, '2023-05-30 07:45:42', 9, 13, 'diliburkan', '00:00:00', '00:00:00'),
(12, '2023-05-30 07:56:08', 10, 12, 'berjalan', '00:00:00', '00:00:00'),
(13, '2023-05-30 07:55:17', 10, 11, 'diliburkan', NULL, NULL),
(14, '2023-05-30 07:55:39', 6, 13, 'diliburkan', NULL, NULL),
(15, '2023-05-30 08:27:51', 7, 14, 'diliburkan', '10:00:00', '11:00:00'),
(16, '2023-05-30 08:29:22', 8, 15, 'diliburkan', '10:00:00', '11:00:00'),
(17, '2023-05-30 08:31:40', 10, 16, 'diliburkan', '09:31:04', '10:31:04'),
(18, '2023-05-30 08:35:19', 9, 11, 'diliburkan', NULL, NULL),
(19, '2023-05-31 04:35:04', 10, 15, 'diliburkan', NULL, NULL),
(20, '2023-06-01 01:09:54', 9, 16, 'diliburkan', NULL, NULL),
(21, '2023-06-01 01:17:23', 9, 11, 'diliburkan', NULL, NULL),
(22, '2023-06-02 01:45:31', 15, 12, 'hadir', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_umum`
--

CREATE TABLE `jadwal_umum` (
  `id_jadwal_umum` int(11) NOT NULL,
  `hari` varchar(255) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `id_instruktur` int(11) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_umum`
--

INSERT INTO `jadwal_umum` (`id_jadwal_umum`, `hari`, `jam_mulai`, `jam_selesai`, `id_instruktur`, `id_kelas`) VALUES
(11, 'senin', '08:00:00', '09:00:00', 33, 5),
(12, 'selasa', '10:00:00', '11:00:00', 19, 7),
(13, 'rabu', '11:00:00', '10:00:00', 21, 5),
(14, 'kamis', '10:00:00', '11:00:00', 36, 9),
(15, 'jumat', '15:00:00', '16:00:00', 22, 10),
(16, 'sabtu', '09:00:00', '10:00:00', 32, 11);

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(255) NOT NULL,
  `harga_kelas` double NOT NULL,
  `deskripsi_kelas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `harga_kelas`, `deskripsi_kelas`) VALUES
(5, 'Pelatihan Fisik', 700000, ''),
(6, 'Gymnastik', 150000, ''),
(7, 'Latihan Kelenturan', 200000, ''),
(9, 'Muaythai', 200000, ''),
(10, 'Boxing', 250000, ''),
(11, 'Yoga', 150000, ''),
(12, 'Kick Boxing', 240000, ''),
(13, 'Street Boxing', 200000, 'halo');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` varchar(255) NOT NULL,
  `nama_member` varchar(255) NOT NULL,
  `alamat_member` varchar(255) NOT NULL,
  `tgl_lahir_member` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deposit_uang_member` double NOT NULL,
  `deposit_paket_member` double NOT NULL,
  `no_telp_member` int(12) NOT NULL,
  `kadaluarsa_member` timestamp NULL DEFAULT NULL,
  `id_pengguna` int(11) NOT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `tgl_kadeluarsa_aktivasi` timestamp NULL DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `kadaluarsa_paket` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `alamat_member`, `tgl_lahir_member`, `deposit_uang_member`, `deposit_paket_member`, `no_telp_member`, `kadaluarsa_member`, `id_pengguna`, `id_kelas`, `tgl_kadeluarsa_aktivasi`, `email`, `kadaluarsa_paket`) VALUES
('23.05.001', 'Vallent Mcmullen', 'atma', '2023-05-30 18:53:14', 200000, 3, 82482, '2024-05-30 11:53:14', 32, NULL, '2023-05-30 17:02:01', NULL, '2023-05-30 17:00:15'),
('23.05.002', 'john', 'atma', '2023-05-30 18:52:26', 500000, 2, 865434, '2024-05-30 11:52:26', 57, NULL, '2023-05-29 17:02:13', NULL, '2023-05-29 17:01:02'),
('23.05.003', 'tono', 'atma', '2023-05-24 01:39:14', 1567898, 4, 87428, '2023-05-26 17:02:24', 33, NULL, '2023-05-28 17:02:24', NULL, '2023-05-27 17:01:24'),
('23.05.004', 'Vallent Mcmullen Sandaleona', 'Atma Jaya', '2023-05-24 01:18:57', 3000000, 4, 876246, '2023-05-31 01:18:16', 84, 6, '2023-05-31 01:18:16', NULL, '2023-05-31 01:18:16'),
('23.05.005', 'Tolol', 'atma', '2023-05-31 05:12:42', 2000000, 4, 987654, '2023-06-30 05:12:08', 69, 12, '2023-06-30 05:12:08', NULL, '2023-06-30 05:12:08'),
('23.05.006', 'Vallent Mcmullen Sandaleona', 'Atma', '2002-04-03 13:54:04', 3000000, 4, 8546727, '2023-06-30 13:54:04', 42, 12, '2023-06-30 13:54:04', 'vallent@gmail.com', '2023-06-30 13:54:04');

--
-- Triggers `member`
--
DELIMITER $$
CREATE TRIGGER `custom_member_ganteng` BEFORE INSERT ON `member` FOR EACH ROW BEGIN 
            DECLARE last_id INT; 
            DECLARE new_id VARCHAR(255); 
            SET last_id = ( 
                SELECT MAX(RIGHT(id_member, 3)) 
                FROM member ); 
            IF last_id IS NULL THEN 
                SET new_id = CONCAT(DATE_FORMAT(NOW(), '%y.%m.'), '001'); 
            ELSE 
                SET new_id = CONCAT(DATE_FORMAT(NOW(), '%y.%m.'), LPAD(last_id + 1, 3, '0')); 
            END IF; 
            SET NEW.id_member = new_id; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2023_04_30_110514_create_booking_gym_table', 0),
(2, '2023_04_30_110514_create_booking_kelas_table', 0),
(3, '2023_04_30_110514_create_instruktur_table', 0),
(4, '2023_04_30_110514_create_izin_instruktur_table', 0),
(5, '2023_04_30_110514_create_jadwal_harian_table', 0),
(6, '2023_04_30_110514_create_jadwal_kelas_table', 0),
(7, '2023_04_30_110514_create_jadwal_umum_table', 0),
(8, '2023_04_30_110514_create_kelas_table', 0),
(9, '2023_04_30_110514_create_member_table', 0),
(10, '2023_04_30_110514_create_pegawai_table', 0),
(11, '2023_04_30_110514_create_pengguna_table', 0),
(12, '2023_04_30_110514_create_presensi_instruktur_table', 0),
(13, '2023_04_30_110514_create_promo_table', 0),
(14, '2023_04_30_110514_create_reset_password_table', 0),
(15, '2023_04_30_110514_create_sesi_gym_table', 0),
(16, '2023_04_30_110514_create_transaksi_aktivasi_member_table', 0),
(17, '2023_04_30_110514_create_transaksi_deposit_paket_table', 0),
(18, '2023_04_30_110514_create_transaksi_deposit_uang_table', 0),
(19, '2023_04_30_110514_create_transaksi_member_table', 0),
(20, '2023_04_30_110517_add_foreign_keys_to_booking_gym_table', 0),
(21, '2023_04_30_110517_add_foreign_keys_to_booking_kelas_table', 0),
(22, '2023_04_30_110517_add_foreign_keys_to_instruktur_table', 0),
(23, '2023_04_30_110517_add_foreign_keys_to_izin_instruktur_table', 0),
(24, '2023_04_30_110517_add_foreign_keys_to_jadwal_harian_table', 0),
(25, '2023_04_30_110517_add_foreign_keys_to_jadwal_kelas_table', 0),
(26, '2023_04_30_110517_add_foreign_keys_to_kelas_table', 0),
(27, '2023_04_30_110517_add_foreign_keys_to_member_table', 0),
(28, '2023_04_30_110517_add_foreign_keys_to_pegawai_table', 0),
(29, '2023_04_30_110517_add_foreign_keys_to_presensi_instruktur_table', 0),
(30, '2023_04_30_110517_add_foreign_keys_to_transaksi_aktivasi_member_table', 0),
(31, '2023_04_30_110517_add_foreign_keys_to_transaksi_deposit_paket_table', 0),
(32, '2023_04_30_110517_add_foreign_keys_to_transaksi_deposit_uang_table', 0),
(33, '2023_04_30_110517_add_foreign_keys_to_transaksi_member_table', 0),
(34, '2014_10_12_000000_create_users_table', 1),
(35, '2014_10_12_100000_create_password_resets_table', 1),
(36, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(37, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(38, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(39, '2016_06_01_000004_create_oauth_clients_table', 1),
(40, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(41, '2019_08_19_000000_create_failed_jobs_table', 1),
(42, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(43, '2023_04_30_110950_create_instrukturs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('03f3b74175613a3ecb273bbee8afdb9f25f4dd6c9108a6ed5756f2f41de511655ba12e8ea51b4b68', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:16:58', '2023-05-02 03:16:58', '2024-05-02 10:16:58'),
('05a1298f683808c735eaff43bcd775097d58fc9dea80adc97c68974f6a1a94490abe462b81759bdb', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:10:29', '2023-05-02 03:10:29', '2024-05-02 10:10:29'),
('05fb6c6f23c8dfa84a6cb8dd5c7a0da5bfa52a7828c83b54ab42bfccc592f1aece049df0ca939418', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:02', '2023-05-23 00:21:02', '2024-05-23 07:21:02'),
('07927f99a16f1e542c360b72af42d08e53a4cbd8acb7452791e33a94a3dbdd5c7dd7a52a0114188a', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 09:37:46', '2023-05-30 09:37:46', '2024-05-30 16:37:46'),
('0cbf54b1407db82ad27c9417a3872e49c61616895eeaa8fefa2d881841d4f22f1649d0a379a89604', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 20:50:32', '2023-05-30 20:50:32', '2024-05-31 03:50:32'),
('0db17c2d59e03c7d178ce38d318fb7ae71719b6b4817cd1ce35f1d4b4fb4098637f6b3a6d16f884c', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:09:43', '2023-05-02 03:09:43', '2024-05-02 10:09:43'),
('0fc770cfb21a86c557d8ad8aa7e87f8653b5a97f0c9da83472f9213c31b91007126c0cbb820df36b', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:17:15', '2023-05-02 03:17:15', '2024-05-02 10:17:15'),
('0fde37108473f280095f5edb322b18140b31c871f45e9f00c663db34bd9209e622096566d2e52cfe', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:05', '2023-05-23 00:21:05', '2024-05-23 07:21:05'),
('124a9fd217ce20ca483082f9a88360a20b6f5937f25767ea7521915f6be6e7432e632657c024541a', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 18:02:57', '2023-05-23 18:02:57', '2024-05-24 01:02:57'),
('12d7c0b573b376e162b706842d7a8b3e6196679422aa1364c28088d2b31fe404f5c2fa7a6d9e674f', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:21:21', '2023-05-02 03:21:21', '2024-05-02 10:21:21'),
('14510348a65bd1190c32e086eee2b0e7e45402593fceef6492d0fbb667ead5e2404384f016772a2c', 61, 1, 'Authentication Token', '[]', 0, '2023-05-31 18:05:27', '2023-05-31 18:05:27', '2024-06-01 01:05:27'),
('15172af67e8860ce8f81324fe921db28cf00f8ed67dd5fa357deeb2fc280664eadce9a40034851ce', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:06', '2023-05-23 00:21:06', '2024-05-23 07:21:06'),
('1565bffd5c7e84d7e477616ac2f60ee645d4c453859cb1c6ab0b8408871f7d00712f7c8974c4725c', 62, 1, 'Authentication Token', '[]', 0, '2023-05-22 22:33:08', '2023-05-22 22:33:08', '2024-05-23 05:33:08'),
('18940029369e8169b3dfc16f97ae309dafaa40293939f2dc9ab1358b45e1c565b899d64deadfc6f9', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:05', '2023-05-23 00:21:05', '2024-05-23 07:21:05'),
('1ba91b042d03c3a33a8d6c388ab679662f68d6bed156ebac11b457efcdf3da136a279529306acab9', 61, 1, 'Authentication Token', '[]', 0, '2023-05-31 17:43:16', '2023-05-31 17:43:16', '2024-06-01 00:43:16'),
('1bc2fce88d1ce3dde811decf1b8c1dd0b11bdf786f9415c8ae7c3f90c9619db51a23d42d8799cad7', 62, 1, 'Authentication Token', '[]', 0, '2023-05-02 21:12:46', '2023-05-02 21:12:46', '2024-05-03 04:12:46'),
('1e8697307181c436ed79ebfd486831f980aea89f5f46e29629b3f78f5c5ac11043564ad9ef23d363', 62, 1, 'Authentication Token', '[]', 0, '2023-05-30 11:52:19', '2023-05-30 11:52:19', '2024-05-30 18:52:19'),
('1eb3470ddea1c5b7c512b811cf1071e2c8c6b29dd953004b37e98c817e553d512d8692be14284e8c', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 11:42:55', '2023-05-30 11:42:55', '2024-05-30 18:42:55'),
('2182c83a72a4e12faf9c506467ae983a6352e9f96eddc01c6520e808ceb7a46358ce102f5e4a3e09', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:43:51', '2023-05-02 03:43:51', '2024-05-02 10:43:51'),
('21ba49cbb54cc35216a732c5ee425bb14673d63fc3215c1d5a7dac9ebff992b913e288c5151d82d7', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 03:11:43', '2023-05-23 03:11:43', '2024-05-23 10:11:43'),
('24830cc3460e575977245ebb41b4d4104037448fc78dcc9ca3d9c21b85caaf50240c0550607a0abd', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:26:08', '2023-05-02 04:26:08', '2024-05-02 11:26:08'),
('25fc63e026be015df495460dca88d371172b433b76497d87fc6005a9134727bcc605739d66ab0da2', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 11:43:19', '2023-05-30 11:43:19', '2024-05-30 18:43:19'),
('2647911ebdacc1c160a18f207b83d3d42cc4e0721122ed461879155b59442457b8e637d157098472', 42, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:03:56', '2023-05-02 04:03:56', '2024-05-02 11:03:56'),
('2bc901ceb9d54b6f2dafb14cd59523beb00e462735fa38ae9f1b80d5952c3d2a2723d471f4dd1567', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 18:02:46', '2023-05-23 18:02:46', '2024-05-24 01:02:46'),
('2de55191fea1a844655d6cb701027c6bc0ba413b222fc8d962633c0d12b5a775ee5c25b13291818e', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 08:36:16', '2023-05-02 08:36:16', '2024-05-02 15:36:16'),
('2e1a5267c667b5729930e1b2a565223423c25cfb3ab5d442fd2592079d67263b325702e9ddae6d87', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:33:22', '2023-05-02 04:33:22', '2024-05-02 11:33:22'),
('2fa99bf06160149ed2fdff0833fd435907d49f422042fd1e2b2affeff0e4110ffc6e31b7f8417795', 62, 1, 'Authentication Token', '[]', 0, '2023-05-09 02:36:52', '2023-05-09 02:36:52', '2024-05-09 09:36:52'),
('2fcce5038591bc825e479e832a30879456bdaf00658be8c8cb84cbf01c8f86f230bf92cdc5d3eb12', 62, 1, 'Authentication Token', '[]', 0, '2023-05-22 02:13:29', '2023-05-22 02:13:29', '2024-05-22 09:13:29'),
('314406fb3117bfd9555faf81b28e7150e2c62d36bbcc8e8e227f2982dc07175e13bd4f89f2ad8e4f', 61, 1, 'Authentication Token', '[]', 0, '2023-05-31 17:39:01', '2023-05-31 17:39:02', '2024-06-01 00:39:01'),
('36991bc560ad2080b0b9d015224941f1b25e910d6459194cbf1fdce177e423e90291d16d09c8a20b', 61, 1, 'Authentication Token', '[]', 0, '2023-05-31 17:39:03', '2023-05-31 17:39:03', '2024-06-01 00:39:03'),
('3701d2a45e373c6059eb9cc2000d5a79c8f63250bd95211743f34fe58cb312a6351826580a8c0bae', 62, 1, 'Authentication Token', '[]', 0, '2023-05-22 14:10:22', '2023-05-22 14:10:22', '2024-05-22 21:10:22'),
('3d7dacea9dded4601c6d06bf2dfbf4e572a705ad704d178526a8c6268d44fd49b7362a16b518bffc', 43, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:20:31', '2023-05-02 04:20:31', '2024-05-02 11:20:31'),
('3f9c3b0d70491735ac8612bdca8676d81bd7acc002e40e1d2d3c809b3984c9dc7d3e2b6f6c889370', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:02', '2023-05-23 00:21:02', '2024-05-23 07:21:02'),
('3f9cc1db2eaaa3d80aee96b8e9692601ffc7800ea1b6523284318bd3d293d442358d357a02165069', 62, 1, 'Authentication Token', '[]', 0, '2023-05-22 02:32:02', '2023-05-22 02:32:02', '2024-05-22 09:32:02'),
('40a69443b313364673bf3b19cb11679371e2321440f077f49b5c4a1937e7cfc31de38930c239eee8', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 18:00:28', '2023-05-23 18:00:29', '2024-05-24 01:00:28'),
('46f95df968c7d03e4fc128af86884b6855c2f8f45d42b82b3e01294c952356bf913ed36274aaad06', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:14:48', '2023-05-02 03:14:48', '2024-05-02 10:14:48'),
('471040da9b4525739aa384a080bcb4919a6308b6c0cd8efe3a11d63f9d621648aa21eada7c42fada', 61, 1, 'Authentication Token', '[]', 0, '2023-05-31 18:00:21', '2023-05-31 18:00:21', '2024-06-01 01:00:21'),
('4bd20382276b489b205f18de473b153b6794b201e7458c6b51dd7c6efe209b6ec6c112f10ae0fb5a', 42, 1, 'Authentication Token', '[]', 0, '2023-05-02 08:38:41', '2023-05-02 08:38:41', '2024-05-02 15:38:41'),
('4c94f75602ae259f95a6f11451b3739b4770184b5016880c064d6363c48173f7ab74a9a8e036312f', 61, 1, 'Authentication Token', '[]', 0, '2023-05-31 17:40:31', '2023-05-31 17:40:31', '2024-06-01 00:40:31'),
('4dc35798d0d4c49e526b752497a3a7685eaebb6e27562305ae0104439d49d4e8e87eec5fa066d196', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 11:43:03', '2023-05-30 11:43:03', '2024-05-30 18:43:03'),
('50a214c06c11ed8cf34b65c7aa5652dbf781919762679ee3132ba398d532427e045623548f98bcaf', 62, 1, 'Authentication Token', '[]', 0, '2023-05-22 02:39:44', '2023-05-22 02:39:44', '2024-05-22 09:39:44'),
('5452051f381917b986513bd04c6b3e5a98e384d6c86a95833689486cacff8e064c091754b5944dc6', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 06:33:30', '2023-05-02 06:33:30', '2024-05-02 13:33:30'),
('54fd5faa8c914d163b0a900740f3b752357562b1daaae44f0cac578c21767c660f3c27a39d31e840', 32, 1, 'Authentication Token', '[]', 0, '2023-05-02 02:46:20', '2023-05-02 02:46:20', '2024-05-02 09:46:20'),
('56b0c3955578a66ce2b06c241fc37a083bdf00494746162fe6153fbc32011aef39a68faefd104ef2', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 08:27:27', '2023-05-02 08:27:28', '2024-05-02 15:27:27'),
('5a6a2ebe9428d45eadfc8e35c99ac7e9e631fde0a6277659fc512739993ca4f7278655e995eba254', 42, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:33:46', '2023-05-02 04:33:46', '2024-05-02 11:33:46'),
('5cdb7f83c4396a1f6cc8f92fa38697034b87364ba599be498d26b9336be01397e6b1803c2e5feba9', 43, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:21:00', '2023-05-02 04:21:00', '2024-05-02 11:21:00'),
('5ec14629edb846c331f2642f33fce5b158e435dc82f0d2de4088f02ee966485c5b91f5771834cb43', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 18:09:19', '2023-05-23 18:09:20', '2024-05-24 01:09:19'),
('612f5228b8ddd865d8a17c3c23315461d1dfbb846bd1f968e88f1881d5930e90b37860aece49faa9', 61, 1, 'Authentication Token', '[]', 0, '2023-05-02 11:32:11', '2023-05-02 11:32:11', '2024-05-02 18:32:11'),
('63a94d8b94c79982ee12f10727913f98396fb49e629a589fc48aaf9511b09d92b8bd4b88d5e1218a', 61, 1, 'Authentication Token', '[]', 0, '2023-05-28 02:21:11', '2023-05-28 02:21:11', '2024-05-28 09:21:11'),
('68fcdcf8cd443aef67d673ae5916301e8a25df5bf3fb361334feab73a97454565884284775e06a19', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:10:33', '2023-05-02 03:10:33', '2024-05-02 10:10:33'),
('6a649db13ff466376229972d294a7862269e0925585ac2b0aba24e984bd8305efb76fab32af70217', 32, 1, 'Authentication Token', '[]', 0, '2023-05-02 02:50:58', '2023-05-02 02:50:58', '2024-05-02 09:50:58'),
('6ba6b0ec34b24847f82f4022002d8ef1f3350177507643abf2a63d155948a347b53361fb20583455', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:03', '2023-05-23 00:21:03', '2024-05-23 07:21:03'),
('6bb3994b33084fd881e0e13ad1418b58a4172d6111d160df5d8c24e8f9fb42245b2c00eee9deded5', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 11:46:25', '2023-05-30 11:46:25', '2024-05-30 18:46:25'),
('7307f13750554d555fe31ae4c2f6839f899882f90818988536e4f898e962314477ebb9553a092ed0', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:26:13', '2023-05-02 03:26:13', '2024-05-02 10:26:13'),
('7796be610f216df3edcae4dd1db1b92f038960b74dad85c2a8139a515b4df971166b64f5e64a393f', 32, 1, 'Authentication Token', '[]', 0, '2023-05-02 02:50:42', '2023-05-02 02:50:42', '2024-05-02 09:50:42'),
('78acb055bab5349aef5102b4a8d3111ffa0f75c47f52d3b70610d136539170d578ce9a288725ee24', 60, 1, 'Authentication Token', '[]', 0, '2023-05-02 11:22:14', '2023-05-02 11:22:14', '2024-05-02 18:22:14'),
('7a5194236f395145bf383ced5b92124ca665a5c2964154b0ba0210b42fcd1e58994f32e1a3c24a09', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:23:46', '2023-05-02 04:23:46', '2024-05-02 11:23:46'),
('7b192bbc750a1e2a2435dee9ae91dbddb2ae963c9259021761848e5b273d4653e05046bf91986593', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:03', '2023-05-23 00:21:03', '2024-05-23 07:21:03'),
('7b49db8c9ae34b173e14cce39c0cf3f45814d181a510934cea7d7378f4ea79ccc4dee5db5284dd66', 62, 1, 'Authentication Token', '[]', 0, '2023-05-30 21:26:19', '2023-05-30 21:26:19', '2024-05-31 04:26:19'),
('7c83fb6ae634922c4d751d0877793efa812303ded5cf0f458a3cfa9c86c131cd428a427153da3adb', 62, 1, 'Authentication Token', '[]', 0, '2023-05-22 11:15:55', '2023-05-22 11:15:55', '2024-05-22 18:15:55'),
('7cf44351ec164d14b55f6208bf29f14e7a25681fde37ab1c85a9f7d74bce458056d4187b3d1c06f9', 42, 1, 'Authentication Token', '[]', 0, '2023-05-02 08:27:40', '2023-05-02 08:27:40', '2024-05-02 15:27:40'),
('814883d0288b716f63bfee52ad5ff0fc36f2df23ced327d61908ef97032a55c9badefc418a07ec15', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 02:23:48', '2023-05-30 02:23:48', '2024-05-30 09:23:48'),
('81f52bb78f1fda012005948eda34aa22a51c1be20e7ff6ff07b4ba536a67cca35cfad0e427a637fe', 61, 1, 'Authentication Token', '[]', 0, '2023-05-31 17:46:09', '2023-05-31 17:46:09', '2024-06-01 00:46:09'),
('8245c733d15e8ade9b3ee83428d86dd35cb907e845e5e1046aedd04753722120d5d806a323308d27', 62, 1, 'Authentication Token', '[]', 0, '2023-05-22 02:28:28', '2023-05-22 02:28:29', '2024-05-22 09:28:28'),
('82b1d588299617070eb7c4490fa9fdd80ee3a28c41b05ecbb92dcc5c5c37518f9dd6c3d145b9b45d', 60, 1, 'Authentication Token', '[]', 0, '2023-05-22 22:45:08', '2023-05-22 22:45:08', '2024-05-23 05:45:08'),
('83d7b84a66490be606503c856c04b48bd35d2429dcecf94f7701bbfa7ddb1ad21b10dea7bbfc9907', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 21:26:10', '2023-05-30 21:26:10', '2024-05-31 04:26:10'),
('83f2edb02af6c1c17f5a37e32dca044021b265b584525b9964489a2c07aa108b5a8484e082a64d8b', 62, 1, 'Authentication Token', '[]', 0, '2023-05-02 20:11:05', '2023-05-02 20:11:05', '2024-05-03 03:11:05'),
('84ecb0a7cd1e89d07834e02b0bdcd6ceb03fbdce44b511acd60bf4a25fe4321acd0d1fac3c8e15af', 43, 1, 'Authentication Token', '[]', 0, '2023-05-02 10:45:31', '2023-05-02 10:45:31', '2024-05-02 17:45:31'),
('85abff83c10aa3410243407637f9bbf1a8da255d37304381b73c3201e7fe9818bb85d6624d051866', 61, 1, 'Authentication Token', '[]', 0, '2023-05-02 11:49:08', '2023-05-02 11:49:08', '2024-05-02 18:49:08'),
('8605cbd3ae53113fd4ff3217c81d2e309b2915447947b479597ddce349ea5954622ed98c0fe69f72', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:08', '2023-05-23 00:21:08', '2024-05-23 07:21:08'),
('87c40ebe9781368406f8dd210436e125aea075237391763f771111eb9b3e9911aee0720d8d418189', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 02:11:27', '2023-05-30 02:11:28', '2024-05-30 09:11:27'),
('8841498a06c9e62c8bfbe5ba2fc2ead6a7680066cba95b56be5d48813f354b39ea6311c74e3f5b4e', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:12:56', '2023-05-02 03:12:56', '2024-05-02 10:12:56'),
('89e3be2a02f221f616453c745e915ea2398c6a4194dbfe1577155a6c2ea2a319a20aba47b6e1a093', 60, 1, 'Authentication Token', '[]', 0, '2023-05-22 22:55:02', '2023-05-22 22:55:02', '2024-05-23 05:55:02'),
('8aff2da745f945f5b6e612e4f1f5e9616bf672a5e54ad7b5900d7e6e8e1ccf661f0f11c8bbe3350c', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 20:53:23', '2023-05-30 20:53:23', '2024-05-31 03:53:23'),
('8b31c23c2381dc722a28646e42491d234e6255ff23eb5fdfe89750895aa6177a9b54ef683d36152f', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 03:12:02', '2023-05-23 03:12:03', '2024-05-23 10:12:02'),
('8c0a15ee29f0672c83d00e202dd1048f5c1b911998f2817aabc47c65d96c1ba29a89759f28f7fc67', 60, 1, 'Authentication Token', '[]', 0, '2023-05-22 22:42:14', '2023-05-22 22:42:14', '2024-05-23 05:42:14'),
('8c515729b609ce1c3b57cceca9686366de81dc408223300aabc436da0b36a719a9bc42859b13ab30', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:07', '2023-05-23 00:21:07', '2024-05-23 07:21:07'),
('8d92f4ae7dcea026e125f417cc00c9f8b6638056091783f4f6a84404ea7e8b2ca500a1497ffafcff', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 11:52:38', '2023-05-30 11:52:38', '2024-05-30 18:52:38'),
('8de1543687f9921a0c7ee616de1beca638ca3ed74d2acdb9cbdd0bf69cfcb503d6d2b16427b5f81c', 62, 1, 'Authentication Token', '[]', 0, '2023-05-22 02:48:34', '2023-05-22 02:48:34', '2024-05-22 09:48:34'),
('8e53818621ee1567fea1fe3c4479c822e9e68256f00143587f0c977f7c851479eae2f31af47c942c', 62, 1, 'Authentication Token', '[]', 0, '2023-05-22 17:18:16', '2023-05-22 17:18:16', '2024-05-23 00:18:16'),
('8f2bcaf3b0e0d8999f5a12b84378aad9bb6cd45df96611077593b37917ea80e455f87f94cd553ceb', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:40:44', '2023-05-02 03:40:44', '2024-05-02 10:40:44'),
('9230cdc6bb5102b42c402bd02b0fbbca8b2215d83e72a7fac6f1da9c4fd9c4e977cf159016d35fb2', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:14:30', '2023-05-02 03:14:30', '2024-05-02 10:14:30'),
('9521ae4458caef0353190bb5fd7c1ffd0b6815766d4f20bd58c79bb08790b73e5f07b913e44cc8f3', 60, 1, 'Authentication Token', '[]', 0, '2023-05-02 20:34:45', '2023-05-02 20:34:45', '2024-05-03 03:34:45'),
('96f42a925e7c3095dffcf76eabd38e81e6e951dba5788bc0f1b4b1baffd92ea473584e25f3514b5e', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:38:45', '2023-05-02 04:38:45', '2024-05-02 11:38:45'),
('a1f80cee2459ca8d44f49ffe73ad07080f9174aa172e8b1c659b1009c9e64c14b04385edeb88f02e', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:23:50', '2023-05-02 03:23:50', '2024-05-02 10:23:50'),
('a2823c4e657ae07d54e5bd58c84ed1c8dd54a05578165d90acee27a3608d0308b2f6b2685e65241a', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 08:39:51', '2023-05-23 08:39:51', '2024-05-23 15:39:51'),
('a35adc246133aea8918b6a4f0e278f7df23ea3178e6c6a4ef742cd2d85bdf28a91770c14c9c8f032', 62, 1, 'Authentication Token', '[]', 0, '2023-05-22 14:29:00', '2023-05-22 14:29:00', '2024-05-22 21:29:00'),
('a7ca40691c70e9ea93156df8e874bfae413f497876eb6764a681b1bc752e48494d8d0a74c26d01aa', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:11:19', '2023-05-02 03:11:19', '2024-05-02 10:11:19'),
('aacdc1d55cf93ef489dfd6bddb68d5047be65aafd89d3dfa3738da3c549e9714b6548482696a285b', 32, 1, 'Authentication Token', '[]', 0, '2023-05-02 02:50:22', '2023-05-02 02:50:22', '2024-05-02 09:50:22'),
('abb35e8fef0c69aa7b257f9c32a1b2c4215f64266889056d2d521e8b450e7d95cb07f66903f23c82', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:04', '2023-05-23 00:21:04', '2024-05-23 07:21:04'),
('ad3ca5774bf696a31f5fe4a052eac1d1125267fc4043783e8780d3501d8a285bb4973a388c650b75', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:10:37', '2023-05-02 03:10:37', '2024-05-02 10:10:37'),
('b21ee04d1b4da9528ac9bf946da759f4e1e1773493659d184631f59474cd0cbd98c6ac86df1a31a8', 43, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:25:40', '2023-05-02 04:25:40', '2024-05-02 11:25:40'),
('b64e93c96f204c9f030d16f49990d5340d64fc64cf00200dd41cefbd1e4fd7d5bf927a7b78b658a0', 62, 1, 'Authentication Token', '[]', 0, '2023-05-09 02:36:57', '2023-05-09 02:36:57', '2024-05-09 09:36:57'),
('b82d8975c896a43bd0508d2efe4a00c333518bca3cf26045aa1d1cca8cb6aad6aa750d29770bfdae', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 03:11:42', '2023-05-23 03:11:42', '2024-05-23 10:11:42'),
('b95ca59c0345d1ef443833087f625fdbb8dd347c143a3b9df3c64be188af64cf3bd9024f601e86bf', 42, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:24:33', '2023-05-02 04:24:33', '2024-05-02 11:24:33'),
('ba46129b0695509651cd89beff8e717f901f19406170171d086edbcb47ad0b9d1c9e276855ec4a8f', 62, 1, 'Authentication Token', '[]', 0, '2023-05-22 23:01:28', '2023-05-22 23:01:28', '2024-05-23 06:01:28'),
('bb0d1d0f8b7642da3901ff3263b5585b17f4cebb1699f0bc256b115b4c61b5295b45184e24a1c778', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 08:39:50', '2023-05-23 08:39:50', '2024-05-23 15:39:50'),
('be1c9366e74bc1df1e09a63a9692f8d6f74d1286029cf3d40c48fdb60b4fd47fad436c803324e140', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:57:24', '2023-05-02 04:57:24', '2024-05-02 11:57:24'),
('be2b6546381fa1d55d1688a1b21a34a356580caaa90d2bb9242a79f95dd8391d4aabafeaba538a40', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 05:19:59', '2023-05-02 05:19:59', '2024-05-02 12:19:59'),
('bf5f4b187c001bd115ebeeb7d0fd619171479ae8b91760f0b68cf6ce0a679576222d2d86d0a63de8', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 05:19:06', '2023-05-02 05:19:06', '2024-05-02 12:19:06'),
('bfe783ccc8a7ffde5f76324091caabecdc8cfde79d8508862bb3ae035b209fdf9cd4ad6c18cae514', 42, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:02:41', '2023-05-02 04:02:41', '2024-05-02 11:02:41'),
('c10da7d15b5d8f634002d73afe3942603b8afc96742fbe92ef43781dbd032dc278452f9c0586775a', 62, 1, 'Authentication Token', '[]', 0, '2023-05-08 18:56:59', '2023-05-08 18:56:59', '2024-05-09 01:56:59'),
('c1efa9c0d0c96b49483103b0a148972ca3f0bd0d7c4c43dbf18af7f6058cec6eb029d88b985097fa', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 05:21:40', '2023-05-02 05:21:40', '2024-05-02 12:21:40'),
('c4d0d9f02f215b6e5a84dd8f5709211981ba6162f5cc898ba45ed2350192a55284216ef1169f2a59', 60, 1, 'Authentication Token', '[]', 0, '2023-05-02 20:09:53', '2023-05-02 20:09:53', '2024-05-03 03:09:53'),
('c68632933d7d02a56b5424ba930ce38e39dc3e031e5d49109f01c5efbf9fd563ca4984a51a4ee190', 62, 1, 'Authentication Token', '[]', 0, '2023-05-06 07:10:51', '2023-05-06 07:10:51', '2024-05-06 14:10:51'),
('cbd0f203501c6b2d92faa46a7a0dfb182fb3468531d4ecd52efca1edf3a0b3faeae366e77ad0dcd5', 32, 1, 'Authentication Token', '[]', 0, '2023-05-02 02:49:56', '2023-05-02 02:49:56', '2024-05-02 09:49:56'),
('cc65ffca740a7e069bd2d5734b1797d31104f8edf0537cf8f9b5caf722baadc54bac68a225b167e1', 60, 1, 'Authentication Token', '[]', 0, '2023-05-02 21:07:12', '2023-05-02 21:07:12', '2024-05-03 04:07:12'),
('d1481fbaf33574a6fed22441d226c83387f06964f1983b72bfa727e2d0e5577a01a1588572fee4ab', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:06', '2023-05-23 00:21:06', '2024-05-23 07:21:06'),
('d1f9bf0c5c65049ed8818a861797f78af0a1b370f408930d31f7852d7d2011ec0d99e978753ec29b', 62, 1, 'Authentication Token', '[]', 0, '2023-05-31 17:39:55', '2023-05-31 17:39:55', '2024-06-01 00:39:55'),
('d989e5e8cc305574c536abe86f549a197093b2b315d5f95609ba3a34a4a1fcee0e212f1cdbb409f1', 62, 1, 'Authentication Token', '[]', 0, '2023-05-30 11:43:12', '2023-05-30 11:43:12', '2024-05-30 18:43:12'),
('da2380962007e864af288d6a87077f2f32278db30be0b8c88f50ce00ee9c7582c815866d955503eb', 61, 1, 'Authentication Token', '[]', 0, '2023-05-31 17:59:20', '2023-05-31 17:59:20', '2024-06-01 00:59:20'),
('ddac3cc3176f372aa06fd7ff242c6aa4c496d3a571a5906348e7f4f8b5e9a351a598b5afd12dbaf7', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:08', '2023-05-23 00:21:08', '2024-05-23 07:21:08'),
('dfca3b017d53d98d5687df7d8b121a0460ca35275ca8f9c7f986ae3fb3750d6b7ece34834d531a76', 40, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:03:55', '2023-05-02 03:03:55', '2024-05-02 10:03:55'),
('e160b224f3a1c16bfef391ddb78b3ddec80a4ecda62e8eff5be5eb2313a2c1ff9ed7eab089e8a4ab', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 00:21:43', '2023-05-23 00:21:43', '2024-05-23 07:21:43'),
('e1f3214a99ee20374806800219995392cc9b7762905a7e85c36ea878f2e01c67b9ba679c286bb21e', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 11:01:03', '2023-05-30 11:01:03', '2024-05-30 18:01:03'),
('e3f4b11989d03098e61a1d2948acef8c217227f2bdc4d53b862d29b7746cf57fcb454dfb7d8bc6b4', 61, 1, 'Authentication Token', '[]', 0, '2023-05-02 21:19:52', '2023-05-02 21:19:52', '2024-05-03 04:19:52'),
('e67db800417180e1b503ec0465207a44750df67e86c3f90a10d0f87ee2e352c0e352d810f3ae92a4', 62, 1, 'Authentication Token', '[]', 0, '2023-05-15 11:18:54', '2023-05-15 11:18:54', '2024-05-15 18:18:54'),
('eaab9d9b519254ee7aaede4d843a3cdd31bc3532efbba4f6648f835be4db9ac051fb5a9f2e1da9f7', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 21:27:57', '2023-05-30 21:27:57', '2024-05-31 04:27:57'),
('ef76280a8683428068dcbed83815cc46b9a3040a2a5a783c69e71370e7d0b6a98ff2a7a16e106c57', 61, 1, 'Authentication Token', '[]', 0, '2023-05-31 19:07:28', '2023-05-31 19:07:28', '2024-06-01 02:07:28'),
('f13695e4676f7d459d08222e8670d2fed511aba735775da4583a858c2ab5649228f46b2335a40312', 42, 1, 'Authentication Token', '[]', 0, '2023-05-02 04:04:08', '2023-05-02 04:04:08', '2024-05-02 11:04:08'),
('f2ac8ebb2c68761299ddb65c822f6ba71a65efb5c95188c13569f7c556505bd85ff9c167b91be8e7', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 10:54:23', '2023-05-30 10:54:23', '2024-05-30 17:54:23'),
('f2fb621f523cfdc01cabe62a962f5fc9acd521701a219d9ae6517f104842b987cb0dd5fd6b0ac33a', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 11:42:31', '2023-05-30 11:42:31', '2024-05-30 18:42:31'),
('f32c7b07b36514f88a06ce47800aaf9464c7e4342dc1b5d43fd2239a85d4d03708418fe788837b1d', 41, 1, 'Authentication Token', '[]', 0, '2023-05-02 03:10:29', '2023-05-02 03:10:29', '2024-05-02 10:10:29'),
('f46f7a2c5363ded79d58637e03d3016e4bde9f6c7a193db6e53107dd4c595ca7c5858ad5d0e87cbf', 62, 1, 'Authentication Token', '[]', 0, '2023-05-02 11:36:29', '2023-05-02 11:36:29', '2024-05-02 18:36:29'),
('f4feef7453b8698269b00614998b3242bb4ccd4ab33604491ca4a4e8c0530d3b0600fb6fe2784c16', 61, 1, 'Authentication Token', '[]', 0, '2023-05-31 17:47:20', '2023-05-31 17:47:20', '2024-06-01 00:47:20'),
('f637b2c4893eaad3ae40ab23d0dd88ed9238f7b331825dc93c664cc3f27cdc585ece7345ca53ed2e', 60, 1, 'Authentication Token', '[]', 0, '2023-05-02 20:41:58', '2023-05-02 20:41:58', '2024-05-03 03:41:58'),
('fba9594c645fe8d57cd977e15cdc79b82ba79ee3d5b1db6a9d0cc919b0606795e68e2f709857e65c', 61, 1, 'Authentication Token', '[]', 0, '2023-05-30 09:46:03', '2023-05-30 09:46:03', '2024-05-30 16:46:03'),
('fbe95090603d640699741c2a17894c362a91b0a44610814cbfd495259308f34e838b6643c7d91994', 62, 1, 'Authentication Token', '[]', 0, '2023-05-23 03:11:43', '2023-05-23 03:11:43', '2024-05-23 10:11:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '0fE0ZsGI81rUX0NMJ9n04Yy8Tf0syJ1SVBIszmga', NULL, 'http://localhost', 1, 0, 0, '2023-05-02 02:46:17', '2023-05-02 02:46:17'),
(2, NULL, 'Laravel Password Grant Client', 'ZEhDdIAUj3nSUWs71doEk08McHcF3BtiMEW7zKlB', 'users', 'http://localhost', 0, 1, 0, '2023-05-02 02:46:17', '2023-05-02 02:46:17');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-05-02 02:46:17', '2023-05-02 02:46:17');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `alamat_pegawai` varchar(255) NOT NULL,
  `tgl_lahir_pegawai` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `no_telp_pegawai` int(12) NOT NULL,
  `id_pengguna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `alamat_pegawai`, `tgl_lahir_pegawai`, `no_telp_pegawai`, `id_pengguna`) VALUES
(7, 'Peter Parker', 'Jln. Rohani membahagiakan no 839', '2021-03-16 17:20:10', 853926742, 3),
(8, 'Sarah Super', 'Jl. Raya Cileunyi No. 45', '1990-05-11 17:00:00', 2147483647, 6),
(9, 'Bob Johnson', 'Jl. Gatot Subroto No. 25', '1985-11-16 17:00:00', 2147483647, 9),
(10, 'Alice Wong', 'Jl. Cempaka No. 12', '1992-07-20 17:00:00', 2147483647, 12),
(11, 'Ahmad Ridwan', 'Jl. Surya Sumantri No. 123', '1987-01-04 17:00:00', 2147483647, 24),
(12, 'Rita Wijaya', 'Jl. Merdeka No. 56', '1995-04-22 17:00:00', 2147483647, 25),
(13, 'Denny Kusuma', 'Jl. Pahlawan No. 78', '1998-09-14 17:00:00', 2147483647, 26),
(14, 'valent taikkkkk', 'atma jaya', '2002-02-01 17:00:00', 81239312, 39),
(15, 'valent taikkkkk', 'atma jaya', '2002-02-01 17:00:00', 81239312, 40),
(16, 'valent taikkkkk', 'atma jaya', '2002-02-01 17:00:00', 81239312, 41),
(17, 'vallentwai', 'atma jaya', '2002-02-01 17:00:00', 81239234, 42),
(18, 'vallentmo', 'atma jaya3', '2002-02-03 17:00:00', 873824, 43),
(19, 'admin', 'atma jaya3', '2002-02-03 17:00:00', 873824, 60),
(20, 'mo', 'atma jaya2', '2002-02-02 17:00:00', 873822, 61),
(21, 'kasir', 'atma jaya1', '2002-02-01 17:00:00', 873824, 62);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `role`, `created_at`, `deleted_at`, `updated_at`) VALUES
(32, 'valenttt', '$2y$10$V0kDBtFkg9FRXDq.7pq.sOASDI40Obh.pTG5GLpqC3/5kPq6ovrO6', 'pegawai', '2023-05-02 02:42:50', NULL, '2023-05-02 02:42:50'),
(33, 'valentttaik', '$2y$10$EfnhQpsJkVFdENi9Q8Kr1.jRfYGKIgV.SH2hfM2qE7/EMz6xuhQsG', 'pegawai', '2023-05-02 02:52:01', NULL, '2023-05-02 02:52:01'),
(35, 'valentttaik', '$2y$10$hjOZHr4lRgxD5FbnQMBSqed4i53l.2mbkMblW.FWs98LOgP920BWC', 'pegawai', '2023-05-02 02:56:58', NULL, '2023-05-02 02:56:58'),
(36, 'valentttaik', '$2y$10$PlcJO95Oh7rLS1NEIAWn6OWkP4BOtgrUMJkwOrVkykdsIee243xrK', 'pegawai', '2023-05-02 02:58:27', NULL, '2023-05-02 02:58:27'),
(37, 'valentttaik', '$2y$10$iVV1GT2OgZkHlzC6A8IiIeDr36UH6cLBUG2N9/33OoSVmICaZyvKy', 'pegawai', '2023-05-02 02:58:48', NULL, '2023-05-02 02:58:48'),
(38, 'valentttaik', '$2y$10$7WPs7Q7zYf63EH3NRTYvjOq291g47cGzpSn.IvyTzGV/srFLeegHW', 'pegawai', '2023-05-02 02:59:50', NULL, '2023-05-02 02:59:50'),
(39, 'valentttaik', '$2y$10$tfhAIJEI/fUrocebl.MdxekgN3XWKdB7/X7/kKXPaTsEq88Cjaduu', 'pegawai', '2023-05-02 03:02:35', NULL, '2023-05-02 03:02:35'),
(40, 'mullent', '$2y$10$26yXbYD79wx4UK4GNva4OOQPdVan0VKpJgjY4I6GxazRz3QEL6Obu', 'pegawai', '2023-05-02 03:02:58', NULL, '2023-05-02 03:02:58'),
(41, 'mullente', '$2y$10$8pc1XBtUXO29.xWWSiRpd.1vr6keHRNfuKuJnU9xX53k7G74Styje', 'admin', '2023-05-02 03:09:08', NULL, '2023-05-02 03:09:08'),
(42, 'vallentmcmullen', '$2y$10$ebyFMaml3ch1d5TTICTaEurLJ8seABW.v2CfGlztVgRrLp6l1Ur16', 'kasir', '2023-05-02 04:02:09', NULL, '2023-05-02 04:02:09'),
(43, 'vallentmo', '$2y$10$4bd.x4otouvud45HYWx2zuiP.6.dy3IGxqrHKJ0yMggr.tcCTmVEm', 'mo', '2023-05-02 04:20:06', NULL, '2023-05-02 04:20:06'),
(57, 'Sayang', '$2y$10$w3586X9SXqfGyDUQC6n.SuCSD/d/y86ctNkCH8aCQWYCyK6PoL/EG', 'instruktur', '2023-05-02 08:23:44', NULL, '2023-05-02 08:23:44'),
(58, 'Bapak', '$2y$10$xzO9jEV08irYAtcf.GYN8eMFXXTf5rfjefBBToEv9YXYFoaHL9zYe', 'instruktur', '2023-05-02 08:36:58', NULL, '2023-05-02 08:36:58'),
(60, 'admin', '$2y$10$pj9Z1zDflgc6xTAinImAO.X0Fw8hSPxrYjza5UvwsYmeJ3FFMwz6K', 'admin', '2023-05-02 11:20:40', NULL, '2023-05-02 11:20:40'),
(61, 'mo', '$2y$10$ra8DyEgk29N6mTXyUWiMCOhDSUovzBu/i20aljnS7Ym1.2QAxACSG', 'mo', '2023-05-02 11:21:09', NULL, '2023-05-02 11:21:09'),
(62, 'kasir', '$2y$10$T870e39tY9bYwjrVbB2VF.upN1Mq1CDhCKjfKEw.mWB9NBuLWKTYG', 'kasir', '2023-05-02 11:22:00', NULL, '2023-05-02 11:22:00'),
(65, 'jhon', '$2y$10$yUw5hLlkEWNF5nHM2vgd0uHt3xZ98DdKVvBzL2.HE.rlMieWXcZ8a', 'member', '2023-05-22 04:11:51', NULL, '2023-05-22 04:11:51'),
(66, '3', '$2y$10$OnBmgFfCDUjwzoJiGX8w0OhYrnr7vbH8BVgGn0P6K2/U0cmnjyHb2', 'member', '2023-05-22 04:32:58', NULL, '2023-05-22 04:32:58'),
(68, '2', '$2y$10$DByu4GWnGyZuTDUheFFN7uKX78Uixota6g2imk6DGrQAMYcb1X8SS', 'member', '2023-05-22 04:34:52', NULL, '2023-05-22 04:34:52'),
(69, 'jhon', '$2y$10$VpnMXsBDoux3r/Ds5Gf9pupwyjOIVjn0l6OcmsKZGsn1EZPOWEgoa', 'member', '2023-05-22 11:38:58', NULL, '2023-05-22 11:38:58'),
(70, 'jhon', '$2y$10$YZwh3ahuqZX7BIOSQAztwexk0/7qt6Pl9xvQeJXauswuiPQbx9.p2', 'member', '2023-05-22 11:39:01', NULL, '2023-05-22 11:39:01'),
(72, 'jhon', '$2y$10$gJsStsXFnB5af3Z8zOOTX.HJGZxyoW9Jtz14BsfT8gQsMW9sPg7bm', 'member', '2023-05-22 11:43:15', NULL, '2023-05-22 11:43:15'),
(80, '23', '$2y$10$0alzlx/OmS3BNmVQWpSmWuSEhY77wM/vT..nNZ1sM/G8uLI9F57pq', 'member', '2023-05-23 07:43:29', NULL, '2023-05-23 07:43:29'),
(81, '23', '$2y$10$oZUULJwkAFVFcOsOS74oNuWUMGmohLUa2MkEeoFElTvXLv0y8glZG', 'member', '2023-05-23 07:46:00', NULL, '2023-05-23 07:46:00'),
(83, '23', '$2y$10$ZxbLt4iJb4lpg5YHrFDFXuRFVIrtqxiZaDS9/.ps6Bg4Lomr4oplu', 'member', '2023-05-23 07:46:29', NULL, '2023-05-23 07:46:29'),
(84, '23', '$2y$10$W3mDK4TXhmqUlcKPM4dC3umxpto1v4l3Jjh/5CFhQ4EIrcONWUpw6', 'member', '2023-05-23 07:49:59', NULL, '2023-05-23 07:49:59'),
(85, 'VallentMcmullen', '$2y$10$mQ1g6PwpdUBVehzEmoU1.eqik2wXdsFsz3KIMU5kVPeOxwdwB2QT2', 'member', '2023-05-31 13:56:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi_instruktur`
--

CREATE TABLE `presensi_instruktur` (
  `id_presensi` int(11) NOT NULL,
  `status_presensi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_instruktur` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `waktu_presensi` timestamp NOT NULL DEFAULT current_timestamp(),
  `waktu_selesai` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `presensi_instruktur`
--

INSERT INTO `presensi_instruktur` (`id_presensi`, `status_presensi`, `id_instruktur`, `id_kelas`, `waktu_presensi`, `waktu_selesai`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'Tidak Hadir', 17, 7, '2023-05-28 09:14:43', NULL, '2023-05-30 08:41:55', NULL, NULL),
(8, 'hadir', 32, 7, '2023-05-28 09:14:43', NULL, '2023-05-30 08:41:55', NULL, NULL),
(9, 'tidak hadir', 22, 6, '2023-05-28 09:14:43', NULL, '2023-05-30 08:41:55', NULL, NULL),
(10, 'hadir', 36, 5, '2023-06-01 01:09:04', NULL, '2023-06-01 01:09:04', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `id_promo` int(11) NOT NULL,
  `bonus` varchar(255) NOT NULL,
  `masa_berlaku` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `minimal_deposit` double NOT NULL,
  `jenis_promo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promo`
--

INSERT INTO `promo` (`id_promo`, `bonus`, `masa_berlaku`, `minimal_deposit`, `jenis_promo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '30%', '2023-03-13 02:00:17', 200000, 'Potongan Uang', '2023-05-09 10:07:29', NULL, NULL),
(2, '10%', '2023-03-06 02:00:48', 50000, 'Potongan Uang', '2023-05-09 10:07:29', NULL, NULL),
(3, 'Bonus 1 Hari', '2023-03-20 02:00:48', 100000, 'Dapat Bonus 1 Hari untuk sesi', '2023-05-09 10:07:29', NULL, NULL),
(4, '50%', '2023-03-31 02:00:48', 10000000, 'Cashback 50%', '2023-05-09 10:07:29', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `token` varchar(255) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reset_password`
--

INSERT INTO `reset_password` (`token`, `email`) VALUES
('', 'Vallent123@gmail.com'),
('', 'jonigeming@gmail.com'),
('', 'Vallent123@gmail.com'),
('', 'jonigeming@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `sesi_gym`
--

CREATE TABLE `sesi_gym` (
  `id_sesi_gym` int(11) NOT NULL,
  `tgl_sesi_gym` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sesi_gym`
--

INSERT INTO `sesi_gym` (`id_sesi_gym`, `tgl_sesi_gym`, `waktu_mulai`, `waktu_selesai`) VALUES
(1, '2023-03-01', '23:26:10', '25:26:10'),
(2, '2023-03-02', '05:06:10', '06:26:10'),
(3, '2023-03-03', '06:07:10', '08:26:10'),
(4, '2023-03-04', '07:08:10', '09:26:10'),
(5, '2023-03-05', '08:09:10', '10:26:10'),
(6, '2023-03-06', '09:10:10', '11:26:10'),
(7, '2023-03-07', '10:10:10', '11:26:10');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_aktivasi_member`
--

CREATE TABLE `transaksi_aktivasi_member` (
  `id_aktivasi` int(11) NOT NULL,
  `tgl_aktivasi` timestamp NULL DEFAULT NULL,
  `nominal_aktivasi` double NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `no_struk_transaksi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_aktivasi_member`
--

INSERT INTO `transaksi_aktivasi_member` (`id_aktivasi`, `tgl_aktivasi`, `nominal_aktivasi`, `created_at`, `updated_at`, `deleted_at`, `no_struk_transaksi`) VALUES
(35, '2023-06-22 05:09:45', 30000, '2023-05-23 14:22:35', NULL, NULL, '23.05.001'),
(36, '2023-05-24 01:23:59', 150000, '2023-05-24 01:24:10', NULL, NULL, '23.05.001'),
(37, '2023-05-30 07:51:43', 150000, '2023-05-30 07:51:57', NULL, NULL, '23.05.020'),
(38, '2023-05-30 11:52:26', 3000000, '2023-05-30 11:52:26', '2023-05-30 11:52:26', NULL, '23.05.105'),
(39, '2023-05-30 11:53:14', 3000000, '2023-05-30 11:53:14', '2023-05-30 11:53:14', NULL, '23.05.106'),
(40, '2023-06-21 05:08:50', 150000, '2023-06-21 05:08:50', NULL, NULL, '23.05.007'),
(43, '2023-06-28 05:10:04', 4000000, '2023-06-28 05:10:04', NULL, NULL, '23.05.008'),
(44, '2023-04-01 05:10:43', 5000000, '2023-04-01 05:10:43', NULL, NULL, '23.05.011');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_deposit_paket`
--

CREATE TABLE `transaksi_deposit_paket` (
  `id_deposit_paket` int(11) NOT NULL,
  `nominal_deposit_kelas` double NOT NULL,
  `nominal_uang` double NOT NULL,
  `tanggal_deposit` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_promo` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `tanggal_kadaluarsa` timestamp NOT NULL DEFAULT current_timestamp(),
  `no_struk_transaksi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_deposit_paket`
--

INSERT INTO `transaksi_deposit_paket` (`id_deposit_paket`, `nominal_deposit_kelas`, `nominal_uang`, `tanggal_deposit`, `id_promo`, `id_kelas`, `created_at`, `updated_at`, `deleted_at`, `tanggal_kadaluarsa`, `no_struk_transaksi`) VALUES
(8, 3, 3000000, '2023-05-23 14:22:25', 1, 7, '2023-05-23 14:22:25', NULL, NULL, '2023-05-23 14:22:25', '23.05.001'),
(9, 3, 3000000, '2023-05-31 05:13:31', 2, 5, '2023-05-31 05:13:31', NULL, NULL, '2023-06-30 05:13:10', '23.05.012');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_deposit_uang`
--

CREATE TABLE `transaksi_deposit_uang` (
  `id_deposit_uang` int(11) NOT NULL,
  `tgl_deposit_uang` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_promo` int(11) NOT NULL,
  `nominal_deposit_uang` double NOT NULL,
  `nominal_total_deposit` double NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `no_struk_transaksi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_deposit_uang`
--

INSERT INTO `transaksi_deposit_uang` (`id_deposit_uang`, `tgl_deposit_uang`, `id_promo`, `nominal_deposit_uang`, `nominal_total_deposit`, `created_at`, `updated_at`, `deleted_at`, `no_struk_transaksi`) VALUES
(4, '2023-05-23 14:22:04', 2, 65000, 100000, '2023-05-23 14:22:04', NULL, NULL, '23.05.001'),
(5, '2023-05-31 04:27:45', 2, 400000, 400000, '2023-05-31 04:27:45', NULL, NULL, '23.05.020'),
(7, '2023-05-31 05:11:30', 2, 4000000, 4000000, '2023-05-31 05:11:51', NULL, NULL, '23.05.011');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_member`
--

CREATE TABLE `transaksi_member` (
  `no_struk_transaksi` varchar(255) NOT NULL,
  `jenis_transaksi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_member` varchar(255) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_member`
--

INSERT INTO `transaksi_member` (`no_struk_transaksi`, `jenis_transaksi`, `created_at`, `updated_at`, `deleted_at`, `id_member`, `id_pegawai`) VALUES
('23.05.001', 'Aktivasi Member', '2023-05-23 14:21:35', NULL, NULL, '23.05.001', 7),
('23.05.002', 'Paket Kelas', '2023-05-23 14:21:49', NULL, NULL, '23.05.002', 8),
('23.05.003', 'transaksi-presensi-gym', '2023-05-23 08:34:23', '2023-05-23 08:34:23', NULL, '23.05.002', 21),
('23.05.004', 'transaksi-presensi-gym', '2023-05-23 08:34:28', '2023-05-23 08:34:28', NULL, '23.05.002', 21),
('23.05.005', 'transaksi-presensi-gym', '2023-05-23 08:40:05', '2023-05-23 08:40:05', NULL, '23.05.002', 21),
('23.05.006', 'transaksi-presensi-gym', '2023-05-23 08:57:48', '2023-05-23 08:57:48', NULL, '23.05.001', 7),
('23.05.007', 'transaksi-presensi-gym', '2023-05-23 08:58:46', '2023-05-23 08:58:46', NULL, '23.05.001', 13),
('23.05.008', 'transaksi-presensi-gym', '2023-05-23 08:58:58', '2023-05-23 08:58:58', NULL, '23.05.001', 13),
('23.05.009', 'transaksi-presensi-gym', '2023-05-23 08:59:03', '2023-05-23 08:59:03', NULL, '23.05.001', 13),
('23.05.010', 'Aktivasi Member', '2023-05-23 09:38:07', '2023-05-23 09:38:07', NULL, '23.05.002', 13),
('23.05.011', 'Aktivasi Member', '2023-05-23 09:39:03', '2023-05-23 09:39:03', NULL, '23.05.002', 13),
('23.05.012', 'Aktivasi Member', '2023-05-23 09:39:12', '2023-05-23 09:39:12', NULL, '23.05.002', 13),
('23.05.013', 'Aktivasi Member', '2023-05-23 09:43:46', '2023-05-23 09:43:46', NULL, '23.05.002', 13),
('23.05.014', 'Aktivasi Member', '2023-05-23 09:47:11', '2023-05-23 09:47:11', NULL, '23.05.002', 13),
('23.05.015', 'Aktivasi Member', '2023-05-23 09:49:08', '2023-05-23 09:49:08', NULL, '23.05.002', 13),
('23.05.016', 'Aktivasi Member', '2023-05-23 09:49:09', '2023-05-23 09:49:09', NULL, '23.05.002', 13),
('23.05.017', 'Aktivasi Member', '2023-05-23 09:49:22', '2023-05-23 09:49:22', NULL, '23.05.001', 21),
('23.05.018', 'Aktivasi Member', '2023-05-23 09:50:25', '2023-05-23 09:50:25', NULL, '23.05.002', 13),
('23.05.019', 'Paket Kelas', '2023-05-23 09:51:24', '2023-05-23 09:51:24', NULL, '23.05.002', 13),
('23.05.020', 'Paket Kelas', '2023-05-23 09:51:25', '2023-05-23 09:51:25', NULL, '23.05.002', 13),
('23.05.021', 'Paket Kelas', '2023-05-23 09:51:44', '2023-05-23 09:51:44', NULL, '23.05.001', 21),
('23.05.022', 'Paket Kelas', '2023-05-23 09:55:38', '2023-05-23 09:55:38', NULL, '23.05.001', 21),
('23.05.023', 'Paket Kelas', '2023-05-23 09:55:43', '2023-05-23 09:55:43', NULL, '23.05.001', 21),
('23.05.024', 'Paket Kelas', '2023-05-23 10:02:42', '2023-05-23 10:02:42', NULL, '23.05.001', 21),
('23.05.025', 'Paket Kelas', '2023-05-23 10:02:48', '2023-05-23 10:02:48', NULL, '23.05.001', 21),
('23.05.026', 'Paket Kelas', '2023-05-23 10:03:12', '2023-05-23 10:03:12', NULL, '23.05.001', 21),
('23.05.027', 'Paket Kelas', '2023-05-23 10:03:17', '2023-05-23 10:03:17', NULL, '23.05.001', 21),
('23.05.028', 'Paket Kelas', '2023-05-23 10:03:33', '2023-05-23 10:03:33', NULL, '23.05.001', 21),
('23.05.029', 'Paket Kelas', '2023-05-23 10:05:47', '2023-05-23 10:05:47', NULL, '23.05.001', 21),
('23.05.030', 'Paket Kelas', '2023-05-23 10:06:42', '2023-05-23 10:06:42', NULL, '23.05.001', 21),
('23.05.031', 'Paket Kelas', '2023-05-23 10:08:27', '2023-05-23 10:08:27', NULL, '23.05.001', 21),
('23.05.032', 'transaksi-presensi-gym', '2023-05-23 10:08:41', '2023-05-23 10:08:41', NULL, '23.05.002', 21),
('23.05.033', 'transaksi-presensi-gym', '2023-05-23 10:09:23', '2023-05-23 10:09:23', NULL, '23.05.002', 21),
('23.05.034', 'transaksi-presensi-gym', '2023-05-23 10:10:06', '2023-05-23 10:10:06', NULL, '23.05.002', 21),
('23.05.035', 'transaksi-presensi-gym', '2023-05-23 10:10:37', '2023-05-23 10:10:37', NULL, '23.05.002', 21),
('23.05.036', 'transaksi-presensi-gym', '2023-05-23 10:13:30', '2023-05-23 10:13:30', NULL, '23.05.002', 21),
('23.05.037', 'transaksi-presensi-gym', '2023-05-23 10:13:51', '2023-05-23 10:13:51', NULL, '23.05.002', 21),
('23.05.038', 'transaksi-presensi-gym', '2023-05-23 10:14:19', '2023-05-23 10:14:19', NULL, '23.05.002', 21),
('23.05.039', 'transaksi-presensi-gym', '2023-05-23 10:14:58', '2023-05-23 10:14:58', NULL, '23.05.002', 21),
('23.05.040', 'transaksi-presensi-gym', '2023-05-23 10:15:34', '2023-05-23 10:15:34', NULL, '23.05.002', 21),
('23.05.041', 'Paket Kelas', '2023-05-23 10:17:54', '2023-05-23 10:17:54', NULL, '23.05.001', 21),
('23.05.042', 'Paket Kelas', '2023-05-23 10:18:27', '2023-05-23 10:18:27', NULL, '23.05.001', 21),
('23.05.043', 'Paket Kelas', '2023-05-23 10:18:31', '2023-05-23 10:18:31', NULL, '23.05.001', 21),
('23.05.044', 'Paket Kelas', '2023-05-23 10:18:35', '2023-05-23 10:18:35', NULL, '23.05.001', 21),
('23.05.045', 'Paket Kelas', '2023-05-23 10:20:15', '2023-05-23 10:20:15', NULL, '23.05.003', 21),
('23.05.046', 'Paket Kelas', '2023-05-23 10:20:51', '2023-05-23 10:20:51', NULL, '23.05.001', 21),
('23.05.047', 'Paket Kelas', '2023-05-23 10:23:59', '2023-05-23 10:23:59', NULL, '23.05.001', 21),
('23.05.048', 'Paket Kelas', '2023-05-23 10:25:08', '2023-05-23 10:25:08', NULL, '23.05.001', 21),
('23.05.049', 'Paket Kelas', '2023-05-23 10:25:23', '2023-05-23 10:25:23', NULL, '23.05.001', 21),
('23.05.050', 'Paket Kelas', '2023-05-23 10:26:22', '2023-05-23 10:26:22', NULL, '23.05.001', 21),
('23.05.051', 'Paket Kelas', '2023-05-23 10:26:50', '2023-05-23 10:26:50', NULL, '23.05.001', 21),
('23.05.052', 'Paket Kelas', '2023-05-23 10:27:52', '2023-05-23 10:27:52', NULL, '23.05.001', 21),
('23.05.053', 'Paket Kelas', '2023-05-23 10:30:55', '2023-05-23 10:30:55', NULL, '23.05.001', 21),
('23.05.054', 'Paket Kelas', '2023-05-23 10:32:12', '2023-05-23 10:32:12', NULL, '23.05.001', 21),
('23.05.055', 'Paket Kelas', '2023-05-23 10:32:18', '2023-05-23 10:32:18', NULL, '23.05.001', 21),
('23.05.056', 'Paket Kelas', '2023-05-23 10:33:35', '2023-05-23 10:33:35', NULL, '23.05.001', 21),
('23.05.057', 'Paket Kelas', '2023-05-23 10:33:41', '2023-05-23 10:33:41', NULL, '23.05.001', 21),
('23.05.058', 'Paket Kelas', '2023-05-23 10:33:45', '2023-05-23 10:33:45', NULL, '23.05.001', 21),
('23.05.059', 'Paket Kelas', '2023-05-23 10:34:05', '2023-05-23 10:34:05', NULL, '23.05.001', 21),
('23.05.060', 'transaksi-presensi-gym', '2023-05-23 10:34:15', '2023-05-23 10:34:15', NULL, '23.05.002', 21),
('23.05.061', 'Paket Kelas', '2023-05-23 10:34:25', '2023-05-23 10:34:25', NULL, '23.05.001', 21),
('23.05.062', 'Paket Kelas', '2023-05-23 18:14:37', '2023-05-23 18:14:37', NULL, '23.05.001', 21),
('23.05.063', 'Paket Kelas', '2023-05-23 18:15:09', '2023-05-23 18:15:09', NULL, '23.05.001', 21),
('23.05.064', 'Paket Kelas', '2023-05-23 18:20:10', '2023-05-23 18:20:10', NULL, '23.05.004', 21),
('23.05.065', 'Aktivasi Member', '2023-05-23 18:21:02', '2023-05-23 18:21:02', NULL, '23.05.004', 21),
('23.05.066', 'Paket Kelas', '2023-05-23 18:22:46', '2023-05-23 18:22:46', NULL, '23.05.004', 21),
('23.05.067', 'Paket Kelas', '2023-05-23 18:24:44', '2023-05-23 18:24:44', NULL, '23.05.001', 21),
('23.05.068', 'Paket Kelas', '2023-05-23 18:24:49', '2023-05-23 18:24:49', NULL, '23.05.004', 21),
('23.05.069', 'Paket Kelas', '2023-05-23 18:30:44', '2023-05-23 18:30:44', NULL, '23.05.001', 21),
('23.05.070', 'Paket Kelas', '2023-05-23 18:30:45', '2023-05-23 18:30:45', NULL, '23.05.001', 21),
('23.05.071', 'Paket Kelas', '2023-05-23 18:30:47', '2023-05-23 18:30:47', NULL, '23.05.001', 21),
('23.05.072', 'Paket Kelas', '2023-05-23 18:30:48', '2023-05-23 18:30:48', NULL, '23.05.003', 21),
('23.05.073', 'Paket Kelas', '2023-05-23 18:30:49', '2023-05-23 18:30:49', NULL, '23.05.001', 21),
('23.05.074', 'Paket Kelas', '2023-05-23 18:30:50', '2023-05-23 18:30:50', NULL, '23.05.001', 21),
('23.05.075', 'Paket Kelas', '2023-05-23 18:30:51', '2023-05-23 18:30:51', NULL, '23.05.004', 21),
('23.05.076', 'Paket Kelas', '2023-05-23 18:30:53', '2023-05-23 18:30:53', NULL, '23.05.004', 21),
('23.05.077', 'Paket Kelas', '2023-05-23 18:30:54', '2023-05-23 18:30:54', NULL, '23.05.001', 21),
('23.05.078', 'Paket Kelas', '2023-05-23 18:39:42', '2023-05-23 18:39:42', NULL, '23.05.001', 21),
('23.05.079', 'Paket Kelas', '2023-05-23 18:42:04', '2023-05-23 18:42:04', NULL, '23.05.001', 21),
('23.05.080', 'transaksi-presensi-gym', '2023-05-23 18:42:12', '2023-05-23 18:42:12', NULL, '23.05.003', 21),
('23.05.081', 'Paket Kelas', '2023-05-23 18:43:58', '2023-05-23 18:43:58', NULL, '23.05.001', 21),
('23.05.082', 'Paket Kelas', '2023-05-23 18:43:59', '2023-05-23 18:43:59', NULL, '23.05.001', 21),
('23.05.083', 'Paket Kelas', '2023-05-23 18:44:00', '2023-05-23 18:44:00', NULL, '23.05.001', 21),
('23.05.084', 'Paket Kelas', '2023-05-23 18:44:02', '2023-05-23 18:44:02', NULL, '23.05.003', 21),
('23.05.085', 'Paket Kelas', '2023-05-23 18:44:04', '2023-05-23 18:44:04', NULL, '23.05.001', 21),
('23.05.086', 'Paket Kelas', '2023-05-23 18:44:05', '2023-05-23 18:44:05', NULL, '23.05.004', 21),
('23.05.087', 'Paket Kelas', '2023-05-23 18:44:07', '2023-05-23 18:44:07', NULL, '23.05.004', 21),
('23.05.088', 'Paket Kelas', '2023-05-23 18:44:08', '2023-05-23 18:44:08', NULL, '23.05.001', 21),
('23.05.089', 'Paket Kelas', '2023-05-23 18:44:09', '2023-05-23 18:44:09', NULL, '23.05.001', 21),
('23.05.090', 'Paket Kelas', '2023-05-23 18:47:13', '2023-05-23 18:47:13', NULL, '23.05.001', 21),
('23.05.091', 'Paket Kelas', '2023-05-23 18:48:08', '2023-05-23 18:48:08', NULL, '23.05.002', 7),
('23.05.092', 'Paket Kelas', '2023-05-23 18:48:39', '2023-05-23 18:48:39', NULL, '23.05.002', 13),
('23.05.093', 'Paket Kelas', '2023-05-23 18:48:45', '2023-05-23 18:48:45', NULL, '23.05.001', 13),
('23.05.094', 'Paket Kelas', '2023-05-23 18:48:58', '2023-05-23 18:48:58', NULL, '23.05.001', 8),
('23.05.095', 'Aktivasi Member', '2023-05-24 01:49:45', NULL, NULL, '23.05.004', 17),
('23.05.096', 'Paket Kelas', '2023-05-23 18:51:26', '2023-05-23 18:51:26', NULL, '23.05.004', 21),
('23.05.097', 'Paket Kelas', '2023-05-23 18:55:23', '2023-05-23 18:55:23', NULL, '23.05.004', 21),
('23.05.098', 'Paket Kelas', '2023-05-23 18:59:58', '2023-05-23 18:59:58', NULL, '23.05.004', 21),
('23.05.099', 'Paket Kelas', '2023-05-23 19:00:03', '2023-05-23 19:00:03', NULL, '23.05.001', 21),
('23.05.100', 'Paket Kelas', '2023-05-23 19:01:41', '2023-05-23 19:01:41', NULL, '23.05.001', 21),
('23.05.101', 'Paket Kelas', '2023-05-23 19:02:05', '2023-05-23 19:02:05', NULL, '23.05.001', 21),
('23.05.102', 'transaksi-presensi-gym', '2023-05-23 19:10:47', '2023-05-23 19:10:47', NULL, '23.05.003', 21),
('23.05.103', 'transaksi-presensi-gym', '2023-05-23 19:11:25', '2023-05-23 19:11:25', NULL, '23.05.003', 21),
('23.05.104', 'Paket Kelas', '2023-05-23 19:12:38', '2023-05-23 19:12:38', NULL, '23.05.001', 21),
('23.05.105', 'Aktivasi Member', '2023-05-30 11:52:25', '2023-05-30 11:52:25', NULL, '23.05.002', 21),
('23.05.106', 'Aktivasi Member', '2023-05-30 11:53:14', '2023-05-30 11:53:14', NULL, '23.05.001', 20);

--
-- Triggers `transaksi_member`
--
DELIMITER $$
CREATE TRIGGER `no_struk_transaksi` BEFORE INSERT ON `transaksi_member` FOR EACH ROW BEGIN 
            DECLARE last_id INT; 
            DECLARE new_id VARCHAR(255); 
            SET last_id = ( 
                SELECT MAX(RIGHT(no_struk_transaksi, 3)) 
                FROM transaksi_member ); 
            IF last_id IS NULL THEN 
                SET new_id = CONCAT(DATE_FORMAT(NOW(), '%y.%m.'), '001'); 
            ELSE 
                SET new_id = CONCAT(DATE_FORMAT(NOW(), '%y.%m.'), LPAD(last_id + 1, 3, '0')); 
            END IF; 
            SET NEW.no_struk_transaksi = new_id; 
            END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking_gym`
--
ALTER TABLE `booking_gym`
  ADD PRIMARY KEY (`no_booking_gym`),
  ADD KEY `id_sesi_gym` (`id_sesi_gym`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `no_struk_transaksi` (`no_struk_transaksi`);

--
-- Indexes for table `booking_kelas`
--
ALTER TABLE `booking_kelas`
  ADD PRIMARY KEY (`no_booking_kelas`),
  ADD KEY `id_jadwal_harian` (`id_jadwal_harian`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `booking_kelas_ibfk_6` (`no_struk_transaksi`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `instruktur`
--
ALTER TABLE `instruktur`
  ADD PRIMARY KEY (`id_instruktur`),
  ADD KEY `instruktur_ibfk_1` (`id_pengguna`);

--
-- Indexes for table `izin_instruktur`
--
ALTER TABLE `izin_instruktur`
  ADD PRIMARY KEY (`id_izin_instruktur`),
  ADD KEY `izin_instruktur_ibfk_3` (`id_instruktur`),
  ADD KEY `izin_instruktur_ibfk_2` (`id_instruktur_pengganti`);

--
-- Indexes for table `jadwal_harian`
--
ALTER TABLE `jadwal_harian`
  ADD PRIMARY KEY (`id_jadwal_harian`),
  ADD KEY `jadwal_harian_ibfk_1` (`id_jadwal_umum`);

--
-- Indexes for table `jadwal_umum`
--
ALTER TABLE `jadwal_umum`
  ADD PRIMARY KEY (`id_jadwal_umum`),
  ADD KEY `jadwal_umum_ibfk_1` (`id_instruktur`),
  ADD KEY `jadwal_umum_ibfk_2` (`id_kelas`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`),
  ADD KEY `member_ibfk_1` (`id_pengguna`),
  ADD KEY `member_ibfk_2` (`id_kelas`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `presensi_instruktur`
--
ALTER TABLE `presensi_instruktur`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `presensi_instruktur_ibfk_1` (`id_instruktur`),
  ADD KEY `presensi_instruktur_ibfk_2` (`id_kelas`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id_promo`);

--
-- Indexes for table `sesi_gym`
--
ALTER TABLE `sesi_gym`
  ADD PRIMARY KEY (`id_sesi_gym`);

--
-- Indexes for table `transaksi_aktivasi_member`
--
ALTER TABLE `transaksi_aktivasi_member`
  ADD PRIMARY KEY (`id_aktivasi`),
  ADD KEY `no_struk_transaksi` (`no_struk_transaksi`);

--
-- Indexes for table `transaksi_deposit_paket`
--
ALTER TABLE `transaksi_deposit_paket`
  ADD PRIMARY KEY (`id_deposit_paket`),
  ADD KEY `transaksi_deposit_paket_ibfk_1` (`id_kelas`),
  ADD KEY `transaksi_deposit_paket_ibfk_2` (`id_promo`),
  ADD KEY `no_struk_transaksi` (`no_struk_transaksi`);

--
-- Indexes for table `transaksi_deposit_uang`
--
ALTER TABLE `transaksi_deposit_uang`
  ADD PRIMARY KEY (`id_deposit_uang`),
  ADD KEY `transaksi_deposit_uang_ibfk_2` (`id_promo`),
  ADD KEY `no_struk_transaksi` (`no_struk_transaksi`);

--
-- Indexes for table `transaksi_member`
--
ALTER TABLE `transaksi_member`
  ADD PRIMARY KEY (`no_struk_transaksi`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `transaksi_member_ibfk_2` (`id_pegawai`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_gym`
--
ALTER TABLE `booking_gym`
  MODIFY `no_booking_gym` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `booking_kelas`
--
ALTER TABLE `booking_kelas`
  MODIFY `no_booking_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instruktur`
--
ALTER TABLE `instruktur`
  MODIFY `id_instruktur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `izin_instruktur`
--
ALTER TABLE `izin_instruktur`
  MODIFY `id_izin_instruktur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jadwal_harian`
--
ALTER TABLE `jadwal_harian`
  MODIFY `id_jadwal_harian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `jadwal_umum`
--
ALTER TABLE `jadwal_umum`
  MODIFY `id_jadwal_umum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presensi_instruktur`
--
ALTER TABLE `presensi_instruktur`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `promo`
--
ALTER TABLE `promo`
  MODIFY `id_promo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sesi_gym`
--
ALTER TABLE `sesi_gym`
  MODIFY `id_sesi_gym` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaksi_aktivasi_member`
--
ALTER TABLE `transaksi_aktivasi_member`
  MODIFY `id_aktivasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `transaksi_deposit_paket`
--
ALTER TABLE `transaksi_deposit_paket`
  MODIFY `id_deposit_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaksi_deposit_uang`
--
ALTER TABLE `transaksi_deposit_uang`
  MODIFY `id_deposit_uang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_gym`
--
ALTER TABLE `booking_gym`
  ADD CONSTRAINT `booking_gym_ibfk_2` FOREIGN KEY (`id_sesi_gym`) REFERENCES `sesi_gym` (`id_sesi_gym`),
  ADD CONSTRAINT `booking_gym_ibfk_3` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_gym_ibfk_4` FOREIGN KEY (`no_struk_transaksi`) REFERENCES `transaksi_member` (`no_struk_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `booking_kelas`
--
ALTER TABLE `booking_kelas`
  ADD CONSTRAINT `booking_kelas_ibfk_4` FOREIGN KEY (`id_jadwal_harian`) REFERENCES `jadwal_harian` (`id_jadwal_harian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_kelas_ibfk_5` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_kelas_ibfk_6` FOREIGN KEY (`no_struk_transaksi`) REFERENCES `transaksi_member` (`no_struk_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instruktur`
--
ALTER TABLE `instruktur`
  ADD CONSTRAINT `instruktur_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `izin_instruktur`
--
ALTER TABLE `izin_instruktur`
  ADD CONSTRAINT `izin_instruktur_ibfk_2` FOREIGN KEY (`id_instruktur_pengganti`) REFERENCES `instruktur` (`id_instruktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `izin_instruktur_ibfk_3` FOREIGN KEY (`id_instruktur`) REFERENCES `instruktur` (`id_instruktur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal_harian`
--
ALTER TABLE `jadwal_harian`
  ADD CONSTRAINT `jadwal_harian_ibfk_1` FOREIGN KEY (`id_jadwal_umum`) REFERENCES `jadwal_umum` (`id_jadwal_umum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal_umum`
--
ALTER TABLE `jadwal_umum`
  ADD CONSTRAINT `jadwal_umum_ibfk_1` FOREIGN KEY (`id_instruktur`) REFERENCES `instruktur` (`id_instruktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_umum_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);

--
-- Constraints for table `presensi_instruktur`
--
ALTER TABLE `presensi_instruktur`
  ADD CONSTRAINT `presensi_instruktur_ibfk_1` FOREIGN KEY (`id_instruktur`) REFERENCES `instruktur` (`id_instruktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `presensi_instruktur_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_aktivasi_member`
--
ALTER TABLE `transaksi_aktivasi_member`
  ADD CONSTRAINT `transaksi_aktivasi_member_ibfk_1` FOREIGN KEY (`no_struk_transaksi`) REFERENCES `transaksi_member` (`no_struk_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_deposit_paket`
--
ALTER TABLE `transaksi_deposit_paket`
  ADD CONSTRAINT `transaksi_deposit_paket_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_deposit_paket_ibfk_2` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_deposit_paket_ibfk_3` FOREIGN KEY (`no_struk_transaksi`) REFERENCES `transaksi_member` (`no_struk_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_deposit_uang`
--
ALTER TABLE `transaksi_deposit_uang`
  ADD CONSTRAINT `transaksi_deposit_uang_ibfk_2` FOREIGN KEY (`id_promo`) REFERENCES `promo` (`id_promo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_deposit_uang_ibfk_3` FOREIGN KEY (`no_struk_transaksi`) REFERENCES `transaksi_member` (`no_struk_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_member`
--
ALTER TABLE `transaksi_member`
  ADD CONSTRAINT `transaksi_member_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_member_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
