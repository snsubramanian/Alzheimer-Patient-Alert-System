-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2026 at 06:21 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `serene_mind`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add kin', 7, 'add_kin'),
(26, 'Can change kin', 7, 'change_kin'),
(27, 'Can delete kin', 7, 'delete_kin'),
(28, 'Can view kin', 7, 'view_kin'),
(29, 'Can add logdata', 8, 'add_logdata'),
(30, 'Can change logdata', 8, 'change_logdata'),
(31, 'Can delete logdata', 8, 'delete_logdata'),
(32, 'Can view logdata', 8, 'view_logdata'),
(33, 'Can add unknown faces', 9, 'add_unknownfaces'),
(34, 'Can change unknown faces', 9, 'change_unknownfaces'),
(35, 'Can delete unknown faces', 9, 'delete_unknownfaces'),
(36, 'Can view unknown faces', 9, 'view_unknownfaces'),
(37, 'Can add user details', 10, 'add_userdetails'),
(38, 'Can change user details', 10, 'change_userdetails'),
(39, 'Can delete user details', 10, 'delete_userdetails'),
(40, 'Can view user details', 10, 'view_userdetails'),
(41, 'Can add reminder', 11, 'add_reminder'),
(42, 'Can change reminder', 11, 'change_reminder'),
(43, 'Can delete reminder', 11, 'delete_reminder'),
(44, 'Can view reminder', 11, 'view_reminder'),
(45, 'Can add doctors', 12, 'add_doctors'),
(46, 'Can change doctors', 12, 'change_doctors'),
(47, 'Can delete doctors', 12, 'delete_doctors'),
(48, 'Can view doctors', 12, 'view_doctors'),
(49, 'Can add medicine', 13, 'add_medicine'),
(50, 'Can change medicine', 13, 'change_medicine'),
(51, 'Can delete medicine', 13, 'delete_medicine'),
(52, 'Can view medicine', 13, 'view_medicine'),
(53, 'Can add medical details', 14, 'add_medicaldetails'),
(54, 'Can change medical details', 14, 'change_medicaldetails'),
(55, 'Can delete medical details', 14, 'delete_medicaldetails'),
(56, 'Can view medical details', 14, 'view_medicaldetails'),
(57, 'Can add appointments', 15, 'add_appointments'),
(58, 'Can change appointments', 15, 'change_appointments'),
(59, 'Can delete appointments', 15, 'delete_appointments'),
(60, 'Can view appointments', 15, 'view_appointments'),
(61, 'Can add otp', 16, 'add_otp'),
(62, 'Can change otp', 16, 'change_otp'),
(63, 'Can delete otp', 16, 'delete_otp'),
(64, 'Can view otp', 16, 'view_otp'),
(65, 'Can add medicine log', 17, 'add_medicinelog'),
(66, 'Can change medicine log', 17, 'change_medicinelog'),
(67, 'Can delete medicine log', 17, 'delete_medicinelog'),
(68, 'Can view medicine log', 17, 'view_medicinelog');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(15, 'SereneMindApp', 'appointments'),
(12, 'SereneMindApp', 'doctors'),
(7, 'SereneMindApp', 'kin'),
(8, 'SereneMindApp', 'logdata'),
(14, 'SereneMindApp', 'medicaldetails'),
(13, 'SereneMindApp', 'medicine'),
(17, 'SereneMindApp', 'medicinelog'),
(16, 'SereneMindApp', 'otp'),
(11, 'SereneMindApp', 'reminder'),
(9, 'SereneMindApp', 'unknownfaces'),
(10, 'SereneMindApp', 'userdetails'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'SereneMindApp', '0001_initial', '2026-01-31 04:59:48.411039'),
(2, 'contenttypes', '0001_initial', '2026-01-31 04:59:48.696355'),
(3, 'auth', '0001_initial', '2026-01-31 04:59:55.590818'),
(4, 'admin', '0001_initial', '2026-01-31 04:59:57.295536'),
(5, 'admin', '0002_logentry_remove_auto_add', '2026-01-31 04:59:57.355456'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2026-01-31 04:59:57.404428'),
(7, 'contenttypes', '0002_remove_content_type_name', '2026-01-31 04:59:57.916467'),
(8, 'auth', '0002_alter_permission_name_max_length', '2026-01-31 04:59:58.796479'),
(9, 'auth', '0003_alter_user_email_max_length', '2026-01-31 04:59:58.958845'),
(10, 'auth', '0004_alter_user_username_opts', '2026-01-31 04:59:58.995299'),
(11, 'auth', '0005_alter_user_last_login_null', '2026-01-31 04:59:59.440998'),
(12, 'auth', '0006_require_contenttypes_0002', '2026-01-31 04:59:59.465712'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2026-01-31 04:59:59.505619'),
(14, 'auth', '0008_alter_user_username_max_length', '2026-01-31 04:59:59.687651'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2026-01-31 04:59:59.806272'),
(16, 'auth', '0010_alter_group_name_max_length', '2026-01-31 04:59:59.891090'),
(17, 'auth', '0011_update_proxy_permissions', '2026-01-31 04:59:59.929913'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2026-01-31 04:59:59.995454'),
(19, 'sessions', '0001_initial', '2026-01-31 05:00:00.240703'),
(20, 'SereneMindApp', '0002_remove_doctors_specialization_doctors_experiance', '2026-01-31 05:18:03.737435'),
(21, 'SereneMindApp', '0003_rename_experiance_doctors_experience', '2026-01-31 05:20:44.857207'),
(22, 'SereneMindApp', '0004_rename_contact_doctors_phone', '2026-01-31 05:21:24.911297'),
(23, 'SereneMindApp', '0005_remove_userdetails_username_userdetails_logdata_and_more', '2026-01-31 05:42:13.990912'),
(24, 'SereneMindApp', '0006_alter_medicine_user_alter_reminder_user', '2026-01-31 06:07:10.307216'),
(25, 'SereneMindApp', '0007_kin_user', '2026-01-31 06:10:27.691511'),
(26, 'SereneMindApp', '0008_remove_kin_description_kin_relation', '2026-01-31 06:16:35.039531'),
(27, 'SereneMindApp', '0009_medicaldetails', '2026-01-31 06:31:36.044891'),
(28, 'SereneMindApp', '0010_rename_medicalhistory_medicaldetails_medical_history_and_more', '2026-01-31 07:05:03.161223'),
(29, 'SereneMindApp', '0011_alter_medicaldetails_height_and_more', '2026-01-31 08:38:13.839738'),
(30, 'SereneMindApp', '0012_alter_medicaldetails_user_appointments', '2026-02-03 11:20:11.229510'),
(31, 'SereneMindApp', '0013_alter_appointments_status', '2026-02-03 11:22:13.773817'),
(32, 'SereneMindApp', '0014_alter_medicaldetails_user', '2026-02-18 03:55:18.919794'),
(33, 'SereneMindApp', '0015_alter_medicaldetails_user', '2026-02-18 04:14:24.801490'),
(34, 'SereneMindApp', '0016_alter_medicaldetails_user', '2026-02-18 04:49:15.446298'),
(35, 'SereneMindApp', '0015_otp', '2026-02-27 04:03:44.958251'),
(36, 'SereneMindApp', '0016_rename_otp_otp_otp_code', '2026-02-27 04:26:15.167648'),
(37, 'SereneMindApp', '0016_medicinelog', '2026-03-09 05:01:30.982660'),
(38, 'SereneMindApp', '0017_alter_medicinelog_timestamp', '2026-03-09 05:33:19.828335');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1qnlvtme265is7axzspsxhwg7vfj9cda', 'eyJ1c2VybmFtZSI6ImFkbWluQGdtYWlsLmNvbSIsInV0eXBlIjoiYWRtaW4ifQ:1vzTyK:-Rjeo1G12uXGVy9zVg1LsTz3CBurUpG_RcIaZhC2CTQ', '2026-03-23 06:20:08.276193'),
('2hjvqox5ar084mhgulx4bls83b0bk6ro', 'eyJ1c2VybmFtZSI6Im1hcnRpbkBnbWFpbC5jb20iLCJ1dHlwZSI6InVzZXIifQ:1vm6xy:wMmfayg5hbLccP2IBhNWvMU5crfmLUUSjlhLsdEPySI', '2026-02-14 09:08:30.712986');

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_appointments`
--

CREATE TABLE `serenemindapp_appointments` (
  `id` bigint(20) NOT NULL,
  `purpose` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `patient_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_appointments`
--

INSERT INTO `serenemindapp_appointments` (`id`, `purpose`, `date`, `status`, `patient_id`) VALUES
(1, 'Regular Check Up', '2026-02-03 11:27:00.000000', 0, 6),
(2, 'Regular Check Up 2', '2026-02-03 13:26:00.000000', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_doctors`
--

CREATE TABLE `serenemindapp_doctors` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `license` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `experience` smallint(5) UNSIGNED NOT NULL,
  `logdata_id` bigint(20) NOT NULL
) ;

--
-- Dumping data for table `serenemindapp_doctors`
--

INSERT INTO `serenemindapp_doctors` (`id`, `name`, `photo`, `dob`, `license`, `phone`, `address`, `experience`, `logdata_id`) VALUES
(1, 'David Fincher', 'Doctors/David_Fincher.jpg', '2001-01-31', 'TCMC-8458', '8458965214', 'Ruby Nagar, West Fort, TVM, Kerala', 5, 2),
(3, 'Kate Mara', 'Doctors/Kate_UvwT8AH.jpg', '2007-05-31', 'TCMC-8455', '8458965212', 'Ruby Nagar, West Fort, TVM, Kerala', 5, 4),
(5, 'Melanie Laurent', 'Doctors/Melanie_l9s9dcA.jpg', '2012-05-31', 'TCMC-8450', '7458967848', 'Ruby Nagar, West Fort, TVM', 5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_kin`
--

CREATE TABLE `serenemindapp_kin` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `relation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_kin`
--

INSERT INTO `serenemindapp_kin` (`id`, `name`, `user_id`, `relation`) VALUES
(1, 'Nia Mercer', 6, 'Daughter'),
(2, 'Kevin Milller', 6, 'Brother');

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_logdata`
--

CREATE TABLE `serenemindapp_logdata` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `utype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_logdata`
--

INSERT INTO `serenemindapp_logdata` (`id`, `username`, `password`, `utype`) VALUES
(1, 'admin@gmail.com', 'pbkdf2_sha256$600000$ApxlbtDSYiRKKMVLM0BwJo$FQb3BPFZh8JMmi8JFtOBP+4gifiZ3FWZrbG/F/9Gr+Q=', 'admin'),
(2, 'david@gmail.com', 'pbkdf2_sha256$600000$RcBNf00eWgHj0k9HwD7tdC$2fvN87LX9aU9h0MH2MH+5xmMVRkfrrw6Pn5qV7A3dO0=', 'doctor'),
(4, 'kate@gmail.com', 'pbkdf2_sha256$600000$zsZ0sEdV71hCxlZE07OWDC$ZTuJgmL/GDsgYSwFlA3UTZOz0FVW8aJ/vFQjvkDn+Rg=', 'doctor'),
(5, 'john@gmail.com', 'pbkdf2_sha256$600000$LObsMfYFWekjxwZMNqfivn$ywEuEX21w3rlIevNXr6JJDmiNROX7p3jZIMD2q8fJek=', 'user'),
(6, 'martin@gmail.com', 'pbkdf2_sha256$600000$OM6dw6bmt00vKZolRAJzxj$hm8A+YibqISnFhDd611yabfXQqa2WRjwqwU3KL0h+GY=', 'user'),
(8, 'melanie@gmail.com', 'pbkdf2_sha256$600000$8uorYcOA2A8JbhNwBfHo65$rIYWj7krjBILonSTrIneyXmzMMRGUxLz/mJ0WIcF9m0=', 'doctor'),
(9, 'cate@gamil.com', 'pbkdf2_sha256$600000$ZnBQ3Iwhgzfn8ao3HmKv6j$JSzGoDawh85GR4xtJ79Ev2nMgClLnk9ug1NRNYmyMFE=', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_medicaldetails`
--

CREATE TABLE `serenemindapp_medicaldetails` (
  `id` bigint(20) NOT NULL,
  `height` varchar(100) NOT NULL,
  `weight` smallint(5) UNSIGNED NOT NULL CHECK (`weight` >= 0),
  `blood_group` varchar(10) NOT NULL,
  `blood_pressure` varchar(20) NOT NULL,
  `heart_rate` smallint(5) UNSIGNED NOT NULL CHECK (`heart_rate` >= 0),
  `temperature` decimal(3,1) NOT NULL,
  `previous_medicine` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`previous_medicine`)),
  `medical_history` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `doctor_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_medicaldetails`
--

INSERT INTO `serenemindapp_medicaldetails` (`id`, `height`, `weight`, `blood_group`, `blood_pressure`, `heart_rate`, `temperature`, `previous_medicine`, `medical_history`, `user_id`, `doctor_id`) VALUES
(4, '6\'2', 58, 'A+', '80/120', 75, 32.0, '[{\"medicine\": \"Aspirin\", \"dosage\": \"10\"}]', 'MedicalHistory/Computer_2_xX6VVwV.pdf', 9, 1),
(9, '6\'0', 23, 'A-', '80/120', 62, 32.0, '[{\"medicine\": \"Aspirin\", \"dosage\": \"20 mg\"}]', 'MedicalHistory/Computer_2_J6xIpPz.pdf', 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_medicine`
--

CREATE TABLE `serenemindapp_medicine` (
  `id` bigint(20) NOT NULL,
  `medicine` varchar(100) NOT NULL,
  `time` time(6) NOT NULL,
  `dose` varchar(20) NOT NULL,
  `status` smallint(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_medicine`
--

INSERT INTO `serenemindapp_medicine` (`id`, `medicine`, `time`, `dose`, `status`, `user_id`) VALUES
(3, 'Tylenol', '11:14:00.000000', '500 mg', 1, 6),
(4, 'Brufen', '10:45:00.000000', '150 mg', 0, 6),
(5, 'Brufen', '18:20:00.000000', '150 mg', 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_medicinelog`
--

CREATE TABLE `serenemindapp_medicinelog` (
  `id` bigint(20) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `status` smallint(6) NOT NULL COMMENT '0 = not taken, 1 = taken',
  `medicine_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_medicinelog`
--

INSERT INTO `serenemindapp_medicinelog` (`id`, `timestamp`, `status`, `medicine_id`) VALUES
(1, '2026-03-09 05:35:01.530447', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_otp`
--

CREATE TABLE `serenemindapp_otp` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `status` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_otp`
--

INSERT INTO `serenemindapp_otp` (`id`, `username`, `otp_code`, `created_at`, `status`) VALUES
(1, 'martin@gmail.com', 'P33VRD', '2026-02-27 04:50:56.349564', 1),
(2, 'martin@gmail.com', 'U0SG5G', '2026-02-27 04:57:21.129671', 1),
(3, 'martin@gmail.com', 'C16RAW', '2026-02-27 05:03:20.974838', 1),
(4, 'martin@gmail.com', 'P1NBBK', '2026-02-27 05:04:09.039173', 1);

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_reminder`
--

CREATE TABLE `serenemindapp_reminder` (
  `id` bigint(20) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `reminder` longtext NOT NULL,
  `time` time(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_reminder`
--

INSERT INTO `serenemindapp_reminder` (`id`, `topic`, `reminder`, `time`, `status`, `user_id`) VALUES
(1, 'Excercise', 'Walk for 30 mins', '11:15:00.000000', 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_unknownfaces`
--

CREATE TABLE `serenemindapp_unknownfaces` (
  `id` bigint(20) NOT NULL,
  `username` varchar(200) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serenemindapp_userdetails`
--

CREATE TABLE `serenemindapp_userdetails` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `kin` varchar(100) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `logdata_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serenemindapp_userdetails`
--

INSERT INTO `serenemindapp_userdetails` (`id`, `name`, `photo`, `dob`, `kin`, `relation`, `phone`, `logdata_id`) VALUES
(1, 'Celine Sciamma', 'Users/Celine.jpg', '2004-01-31', 'John Nolan', 'Husband', '8451258785', 5),
(2, 'Martin  Scorscese', 'Users/Martin.jpg', '1974-01-31', 'Jennifer Scorcese', 'Daughter', '8451201258', 6),
(3, 'Cate Blanchett', 'Users/Cate.jpg', '2011-06-06', 'Rooney Mara', 'Sister', '9658912345', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `serenemindapp_appointments`
--
ALTER TABLE `serenemindapp_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SereneMindApp_appoin_patient_id_d9c19a4f_fk_SereneMin` (`patient_id`);

--
-- Indexes for table `serenemindapp_doctors`
--
ALTER TABLE `serenemindapp_doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SereneMindApp_doctor_logdata_id_5150e615_fk_SereneMin` (`logdata_id`);

--
-- Indexes for table `serenemindapp_kin`
--
ALTER TABLE `serenemindapp_kin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SereneMindApp_kin_user_id_b81df7ff_fk_SereneMindApp_logdata_id` (`user_id`);

--
-- Indexes for table `serenemindapp_logdata`
--
ALTER TABLE `serenemindapp_logdata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `serenemindapp_medicaldetails`
--
ALTER TABLE `serenemindapp_medicaldetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SereneMindApp_medicaldetails_user_id_5aaba7b6_uniq` (`user_id`),
  ADD KEY `SereneMindApp_medica_doctor_id_6e049f5c_fk_SereneMin` (`doctor_id`);

--
-- Indexes for table `serenemindapp_medicine`
--
ALTER TABLE `serenemindapp_medicine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SereneMindApp_medicine_medicine_time_dose_user_id_72c9e2c6_uniq` (`medicine`,`time`,`dose`,`user_id`),
  ADD KEY `SereneMindApp_medici_user_id_6f094e4b_fk_SereneMin` (`user_id`);

--
-- Indexes for table `serenemindapp_medicinelog`
--
ALTER TABLE `serenemindapp_medicinelog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SereneMindApp_medici_medicine_id_5da9b62e_fk_SereneMin` (`medicine_id`);

--
-- Indexes for table `serenemindapp_otp`
--
ALTER TABLE `serenemindapp_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serenemindapp_reminder`
--
ALTER TABLE `serenemindapp_reminder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SereneMindApp_remind_user_id_6b7ce931_fk_SereneMin` (`user_id`);

--
-- Indexes for table `serenemindapp_unknownfaces`
--
ALTER TABLE `serenemindapp_unknownfaces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serenemindapp_userdetails`
--
ALTER TABLE `serenemindapp_userdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SereneMindApp_userde_logdata_id_14b55628_fk_SereneMin` (`logdata_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `serenemindapp_appointments`
--
ALTER TABLE `serenemindapp_appointments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `serenemindapp_doctors`
--
ALTER TABLE `serenemindapp_doctors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serenemindapp_kin`
--
ALTER TABLE `serenemindapp_kin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `serenemindapp_logdata`
--
ALTER TABLE `serenemindapp_logdata`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `serenemindapp_medicaldetails`
--
ALTER TABLE `serenemindapp_medicaldetails`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `serenemindapp_medicine`
--
ALTER TABLE `serenemindapp_medicine`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `serenemindapp_medicinelog`
--
ALTER TABLE `serenemindapp_medicinelog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `serenemindapp_otp`
--
ALTER TABLE `serenemindapp_otp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `serenemindapp_reminder`
--
ALTER TABLE `serenemindapp_reminder`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `serenemindapp_unknownfaces`
--
ALTER TABLE `serenemindapp_unknownfaces`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serenemindapp_userdetails`
--
ALTER TABLE `serenemindapp_userdetails`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `serenemindapp_appointments`
--
ALTER TABLE `serenemindapp_appointments`
  ADD CONSTRAINT `SereneMindApp_appoin_patient_id_d9c19a4f_fk_SereneMin` FOREIGN KEY (`patient_id`) REFERENCES `serenemindapp_logdata` (`id`);

--
-- Constraints for table `serenemindapp_doctors`
--
ALTER TABLE `serenemindapp_doctors`
  ADD CONSTRAINT `SereneMindApp_doctor_logdata_id_5150e615_fk_SereneMin` FOREIGN KEY (`logdata_id`) REFERENCES `serenemindapp_logdata` (`id`);

--
-- Constraints for table `serenemindapp_kin`
--
ALTER TABLE `serenemindapp_kin`
  ADD CONSTRAINT `SereneMindApp_kin_user_id_b81df7ff_fk_SereneMindApp_logdata_id` FOREIGN KEY (`user_id`) REFERENCES `serenemindapp_logdata` (`id`);

--
-- Constraints for table `serenemindapp_medicaldetails`
--
ALTER TABLE `serenemindapp_medicaldetails`
  ADD CONSTRAINT `SereneMindApp_medica_doctor_id_6e049f5c_fk_SereneMin` FOREIGN KEY (`doctor_id`) REFERENCES `serenemindapp_doctors` (`id`),
  ADD CONSTRAINT `SereneMindApp_medica_user_id_5aaba7b6_fk_SereneMin` FOREIGN KEY (`user_id`) REFERENCES `serenemindapp_logdata` (`id`);

--
-- Constraints for table `serenemindapp_medicine`
--
ALTER TABLE `serenemindapp_medicine`
  ADD CONSTRAINT `SereneMindApp_medici_user_id_6f094e4b_fk_SereneMin` FOREIGN KEY (`user_id`) REFERENCES `serenemindapp_logdata` (`id`);

--
-- Constraints for table `serenemindapp_medicinelog`
--
ALTER TABLE `serenemindapp_medicinelog`
  ADD CONSTRAINT `SereneMindApp_medici_medicine_id_5da9b62e_fk_SereneMin` FOREIGN KEY (`medicine_id`) REFERENCES `serenemindapp_medicine` (`id`);

--
-- Constraints for table `serenemindapp_reminder`
--
ALTER TABLE `serenemindapp_reminder`
  ADD CONSTRAINT `SereneMindApp_remind_user_id_6b7ce931_fk_SereneMin` FOREIGN KEY (`user_id`) REFERENCES `serenemindapp_logdata` (`id`);

--
-- Constraints for table `serenemindapp_userdetails`
--
ALTER TABLE `serenemindapp_userdetails`
  ADD CONSTRAINT `SereneMindApp_userde_logdata_id_14b55628_fk_SereneMin` FOREIGN KEY (`logdata_id`) REFERENCES `serenemindapp_logdata` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
