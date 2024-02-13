-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 09, 2024 at 11:38 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hepatitis_diseases`
--
CREATE DATABASE IF NOT EXISTS `hepatitis_diseases` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hepatitis_diseases`;

-- --------------------------------------------------------

--
-- Table structure for table `ada_algo`
--

DROP TABLE IF EXISTS `ada_algo`;
CREATE TABLE IF NOT EXISTS `ada_algo` (
  `ADA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`ADA_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ada_algo`
--

INSERT INTO `ada_algo` (`ADA_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(2, '90.0', '90.0', '90.06', '90.06', 'ADA Boost Algorithm'),
(3, '88.0', '88.0', '88.24', '88.24', 'ADA Boost Algorithm'),
(4, '92.0', '92.0', '92.0', '92.0', 'ADA Boost Algorithm'),
(5, '90.0', '90.0', '90.06', '90.06', 'ADA Boost Algorithm'),
(6, '90.0', '90.0', '90.06', '90.06', 'ADA Boost Algorithm'),
(7, '86.0', '86.0', '86.53', '86.53', 'ADA Boost Algorithm'),
(8, '92.0', '92.0', '92.0', '92.0', 'ADA Boost Algorithm'),
(9, '84.0', '84.0', '84.89', '84.89', 'ADA Boost Algorithm'),
(10, '88.0', '88.0', '88.24', '88.24', 'ADA Boost Algorithm'),
(11, '92.0', '92.0', '92.0', '92.0', 'ADA Boost Algorithm'),
(12, '94.0', '94.0', '94.07', '94.07', 'ADA Boost Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `all_users`
--

DROP TABLE IF EXISTS `all_users`;
CREATE TABLE IF NOT EXISTS `all_users` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_Profile` varchar(100) NOT NULL,
  `User_Email` varchar(50) NOT NULL,
  `User_Status` varchar(10) NOT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

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
(25, 'Can add ad a_algo', 7, 'add_ada_algo'),
(26, 'Can change ad a_algo', 7, 'change_ada_algo'),
(27, 'Can delete ad a_algo', 7, 'delete_ada_algo'),
(28, 'Can view ad a_algo', 7, 'view_ada_algo'),
(29, 'Can add all_users_model', 8, 'add_all_users_model'),
(30, 'Can change all_users_model', 8, 'change_all_users_model'),
(31, 'Can delete all_users_model', 8, 'delete_all_users_model'),
(32, 'Can view all_users_model', 8, 'view_all_users_model'),
(33, 'Can add dataset', 9, 'add_dataset'),
(34, 'Can change dataset', 9, 'change_dataset'),
(35, 'Can delete dataset', 9, 'delete_dataset'),
(36, 'Can view dataset', 9, 'view_dataset'),
(37, 'Can add d t_algo', 10, 'add_dt_algo'),
(38, 'Can change d t_algo', 10, 'change_dt_algo'),
(39, 'Can delete d t_algo', 10, 'delete_dt_algo'),
(40, 'Can view d t_algo', 10, 'view_dt_algo'),
(41, 'Can add g d_algo', 11, 'add_gd_algo'),
(42, 'Can change g d_algo', 11, 'change_gd_algo'),
(43, 'Can delete g d_algo', 11, 'delete_gd_algo'),
(44, 'Can view g d_algo', 11, 'view_gd_algo'),
(45, 'Can add kn n_algo', 12, 'add_knn_algo'),
(46, 'Can change kn n_algo', 12, 'change_knn_algo'),
(47, 'Can delete kn n_algo', 12, 'delete_knn_algo'),
(48, 'Can view kn n_algo', 12, 'view_knn_algo'),
(49, 'Can add logistic', 13, 'add_logistic'),
(50, 'Can change logistic', 13, 'change_logistic'),
(51, 'Can delete logistic', 13, 'delete_logistic'),
(52, 'Can view logistic', 13, 'view_logistic'),
(53, 'Can add random forest', 14, 'add_randomforest'),
(54, 'Can change random forest', 14, 'change_randomforest'),
(55, 'Can delete random forest', 14, 'delete_randomforest'),
(56, 'Can view random forest', 14, 'view_randomforest'),
(57, 'Can add sv m_algo', 15, 'add_svm_algo'),
(58, 'Can change sv m_algo', 15, 'change_svm_algo'),
(59, 'Can delete sv m_algo', 15, 'delete_svm_algo'),
(60, 'Can view sv m_algo', 15, 'view_svm_algo'),
(61, 'Can add upload_dataset_model', 16, 'add_upload_dataset_model'),
(62, 'Can change upload_dataset_model', 16, 'change_upload_dataset_model'),
(63, 'Can delete upload_dataset_model', 16, 'delete_upload_dataset_model'),
(64, 'Can view upload_dataset_model', 16, 'view_upload_dataset_model'),
(65, 'Can add x g_algo', 17, 'add_xg_algo'),
(66, 'Can change x g_algo', 17, 'change_xg_algo'),
(67, 'Can delete x g_algo', 17, 'delete_xg_algo'),
(68, 'Can view x g_algo', 17, 'view_xg_algo'),
(69, 'Can add last_login', 18, 'add_last_login'),
(70, 'Can change last_login', 18, 'change_last_login'),
(71, 'Can delete last_login', 18, 'delete_last_login'),
(72, 'Can view last_login', 18, 'view_last_login'),
(73, 'Can add predict_details', 19, 'add_predict_details'),
(74, 'Can change predict_details', 19, 'change_predict_details'),
(75, 'Can delete predict_details', 19, 'delete_predict_details'),
(76, 'Can view predict_details', 19, 'view_predict_details'),
(77, 'Can add user model', 20, 'add_usermodel'),
(78, 'Can change user model', 20, 'change_usermodel'),
(79, 'Can delete user model', 20, 'delete_usermodel'),
(80, 'Can view user model', 20, 'view_usermodel'),
(81, 'Can add dataset', 21, 'add_dataset'),
(82, 'Can change dataset', 21, 'change_dataset'),
(83, 'Can delete dataset', 21, 'delete_dataset'),
(84, 'Can view dataset', 21, 'view_dataset'),
(85, 'Can add feedback', 22, 'add_feedback'),
(86, 'Can change feedback', 22, 'change_feedback'),
(87, 'Can delete feedback', 22, 'delete_feedback'),
(88, 'Can view feedback', 22, 'view_feedback');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

DROP TABLE IF EXISTS `dataset`;
CREATE TABLE IF NOT EXISTS `dataset` (
  `DS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Age` int(11) NOT NULL,
  `Glucose` int(11) NOT NULL,
  `BloodPressure` int(11) NOT NULL,
  `SkinThickness` int(11) NOT NULL,
  `Insulin` int(11) NOT NULL,
  `BMI` int(11) NOT NULL,
  `DiabetesPedigreeFunction` int(11) NOT NULL,
  `Pregnancies` int(11) NOT NULL,
  PRIMARY KEY (`DS_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'adminapp', 'ada_algo'),
(8, 'adminapp', 'all_users_model'),
(9, 'adminapp', 'dataset'),
(10, 'adminapp', 'dt_algo'),
(11, 'adminapp', 'gd_algo'),
(12, 'adminapp', 'knn_algo'),
(13, 'adminapp', 'logistic'),
(14, 'adminapp', 'randomforest'),
(15, 'adminapp', 'svm_algo'),
(16, 'adminapp', 'upload_dataset_model'),
(17, 'adminapp', 'xg_algo'),
(18, 'mainapp', 'last_login'),
(19, 'mainapp', 'predict_details'),
(20, 'mainapp', 'usermodel'),
(21, 'userapp', 'dataset'),
(22, 'userapp', 'feedback');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-01-03 05:56:24.843361'),
(2, 'auth', '0001_initial', '2024-01-03 05:56:25.743459'),
(3, 'admin', '0001_initial', '2024-01-03 05:56:26.057752'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-01-03 05:56:26.057752'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-03 05:56:26.086068'),
(6, 'adminapp', '0001_initial', '2024-01-03 05:56:26.351533'),
(7, 'contenttypes', '0002_remove_content_type_name', '2024-01-03 05:56:26.483688'),
(8, 'auth', '0002_alter_permission_name_max_length', '2024-01-03 05:56:26.517209'),
(9, 'auth', '0003_alter_user_email_max_length', '2024-01-03 05:56:26.638409'),
(10, 'auth', '0004_alter_user_username_opts', '2024-01-03 05:56:26.662374'),
(11, 'auth', '0005_alter_user_last_login_null', '2024-01-03 05:56:26.823840'),
(12, 'auth', '0006_require_contenttypes_0002', '2024-01-03 05:56:26.823840'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2024-01-03 05:56:26.823840'),
(14, 'auth', '0008_alter_user_username_max_length', '2024-01-03 05:56:26.949257'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2024-01-03 05:56:26.986238'),
(16, 'auth', '0010_alter_group_name_max_length', '2024-01-03 05:56:27.033453'),
(17, 'auth', '0011_update_proxy_permissions', '2024-01-03 05:56:27.066739'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2024-01-03 05:56:27.124477'),
(19, 'mainapp', '0001_initial', '2024-01-03 05:56:27.208031'),
(20, 'sessions', '0001_initial', '2024-01-03 05:56:27.250041'),
(21, 'userapp', '0001_initial', '2024-01-03 05:56:27.349195');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('30s5q7e21iu8pxmy7znm9ucqir6x1smn', 'eyJ1c2VyX2VtYWlsIjoicHJhdmVlbmx1Y2t5MzIyQGdtYWlsLmNvbSIsInVzZXJfaWQiOjd9:1rN9F1:uYR3z16HzPflDjJ_rZWTy1siDm56Frn67ZGb5pBDAns', '2024-01-23 10:21:51.158292');

-- --------------------------------------------------------

--
-- Table structure for table `dt_algo`
--

DROP TABLE IF EXISTS `dt_algo`;
CREATE TABLE IF NOT EXISTS `dt_algo` (
  `DT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`DT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dt_algo`
--

INSERT INTO `dt_algo` (`DT_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '92.0', '92.27', '91.99', '92.0', 'Decision Tree Algorithm'),
(2, '86.0', '86.53', '85.95', '86.0', 'Decision Tree Algorithm'),
(3, '90.0', '90.58', '89.96', '90.0', 'Decision Tree Algorithm'),
(4, '90.0', '90.58', '89.96', '90.0', 'Decision Tree Algorithm'),
(5, '88.0', '88.0', '88.0', '88.0', 'Decision Tree Algorithm'),
(6, '82.0', '83.33', '81.82', '82.0', 'Decision Tree Algorithm'),
(7, '84.0', '84.0', '84.0', '84.0', 'Decision Tree Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_details`
--

DROP TABLE IF EXISTS `feedback_details`;
CREATE TABLE IF NOT EXISTS `feedback_details` (
  `Feed_id` int(11) NOT NULL AUTO_INCREMENT,
  `Rating` varchar(100) DEFAULT NULL,
  `Review` varchar(225) DEFAULT NULL,
  `Sentiment` varchar(100) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `Reviewer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Feed_id`),
  KEY `feedback_details_Reviewer_id_13cf49be` (`Reviewer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback_details`
--

INSERT INTO `feedback_details` (`Feed_id`, `Rating`, `Review`, `Sentiment`, `datetime`, `Reviewer_id`) VALUES
(2, '5', 'very good', 'positive', '2024-01-05 12:34:20.610032', 7),
(3, '4', 'good', 'positive', '2024-01-05 12:34:25.193048', 7),
(4, '3', 'average', 'neutral', '2024-01-05 12:34:31.388083', 7),
(5, '2', 'bad', 'negative', '2024-01-05 12:34:35.237378', 7);

-- --------------------------------------------------------

--
-- Table structure for table `gd_algo`
--

DROP TABLE IF EXISTS `gd_algo`;
CREATE TABLE IF NOT EXISTS `gd_algo` (
  `GD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`GD_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gd_algo`
--

INSERT INTO `gd_algo` (`GD_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '88.0', '88.0', '88.0', '88.0', 'Gr Boost Algorithm'),
(2, '92.0', '92.0', '92.0', '92.0', 'Gr Boost Algorithm'),
(3, '84.0', '84.0', '84.0', '84.0', 'Gr Boost Algorithm'),
(4, '92.0', '92.0', '92.0', '92.0', 'Gr Boost Algorithm'),
(5, '86.0', '86.0', '86.06', '86.06', 'Gr Boost Algorithm'),
(6, '92.0', '92.0', '92.0', '92.0', 'Gr Boost Algorithm'),
(7, '84.0', '84.0', '84.0', '84.0', 'Gr Boost Algorithm'),
(8, '88.0', '88.0', '88.0', '88.0', 'Gr Boost Algorithm'),
(9, '92.0', '92.0', '92.0', '92.0', 'Gr Boost Algorithm'),
(10, '90.0', '90.0', '90.06', '90.06', 'Gr Boost Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `knn_algo`
--

DROP TABLE IF EXISTS `knn_algo`;
CREATE TABLE IF NOT EXISTS `knn_algo` (
  `KNN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`KNN_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `knn_algo`
--

INSERT INTO `knn_algo` (`KNN_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '92.0', '92.0', '92.27', '92.27', 'KNN Algorithm'),
(2, '92.0', '92.0', '92.0', '92.0', 'KNN Algorithm'),
(3, '92.0', '92.0', '92.0', '92.0', 'KNN Algorithm'),
(4, '92.0', '92.0', '92.0', '92.0', 'KNN Algorithm'),
(5, '92.0', '92.0', '92.0', '92.0', 'KNN Algorithm'),
(6, '90.0', '90.0', '90.06', '90.06', 'KNN Algorithm'),
(7, '92.0', '92.0', '92.0', '92.0', 'KNN Algorithm'),
(8, '92.0', '92.0', '92.0', '92.0', 'KNN Algorithm'),
(9, '92.0', '92.0', '92.0', '92.0', 'KNN Algorithm'),
(10, '94.0', '94.0', '94.07', '94.07', 'KNN Algorithm'),
(11, '92.0', '92.0', '92.0', '92.0', 'KNN Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `last_login`
--

DROP TABLE IF EXISTS `last_login`;
CREATE TABLE IF NOT EXISTS `last_login` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Login_Time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logistic`
--

DROP TABLE IF EXISTS `logistic`;
CREATE TABLE IF NOT EXISTS `logistic` (
  `Logistic_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`Logistic_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logistic`
--

INSERT INTO `logistic` (`Logistic_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '92.0', '92.0', '92.0', '92.0', 'Logistic Algorithm'),
(2, '94.0', '94.0', '94.07', '94.07', 'Logistic Algorithm'),
(3, '86.0', '86.0', '86.06', '86.06', 'Logistic Algorithm'),
(4, '94.0', '94.0', '94.07', '94.07', 'Logistic Algorithm'),
(5, '90.0', '90.0', '90.06', '90.06', 'Logistic Algorithm'),
(6, '94.0', '94.0', '94.07', '94.07', 'Logistic Algorithm'),
(7, '86.0', '86.0', '86.06', '86.06', 'Logistic Algorithm'),
(8, '92.0', '92.0', '92.0', '92.0', 'Logistic Algorithm'),
(9, '92.0', '92.0', '92.0', '92.0', 'Logistic Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `predict_detail`
--

DROP TABLE IF EXISTS `predict_detail`;
CREATE TABLE IF NOT EXISTS `predict_detail` (
  `predict_id` int(11) NOT NULL AUTO_INCREMENT,
  `Field_1` varchar(60) DEFAULT NULL,
  `Field_2` varchar(60) DEFAULT NULL,
  `Field_3` varchar(60) DEFAULT NULL,
  `Field_4` varchar(60) DEFAULT NULL,
  `Field_5` varchar(60) DEFAULT NULL,
  `Field_6` varchar(60) DEFAULT NULL,
  `Field_7` varchar(60) DEFAULT NULL,
  `Field_8` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`predict_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `randomforest`
--

DROP TABLE IF EXISTS `randomforest`;
CREATE TABLE IF NOT EXISTS `randomforest` (
  `Random_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`Random_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `randomforest`
--

INSERT INTO `randomforest` (`Random_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '92.0', '92.0', '92.0', '92.0', 'Random Forest Algorithm'),
(2, '86.0', '86.0', '86.06', '86.06', 'Random Forest Algorithm'),
(3, '88.0', '88.0', '88.0', '88.0', 'Random Forest Algorithm'),
(4, '90.0', '90.0', '90.06', '90.06', 'Random Forest Algorithm'),
(5, '90.0', '90.0', '90.06', '90.06', 'Random Forest Algorithm'),
(6, '88.0', '88.0', '88.0', '88.0', 'Random Forest Algorithm'),
(7, '90.0', '90.0', '90.06', '90.06', 'Random Forest Algorithm');

-- --------------------------------------------------------

--
-- Table structure for table `sxm_algo`
--

DROP TABLE IF EXISTS `sxm_algo`;
CREATE TABLE IF NOT EXISTS `sxm_algo` (
  `SVM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`SVM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

DROP TABLE IF EXISTS `upload`;
CREATE TABLE IF NOT EXISTS `upload` (
  `Data_id` int(11) NOT NULL AUTO_INCREMENT,
  `Image` varchar(100) NOT NULL,
  PRIMARY KEY (`Data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upload_dataset`
--

DROP TABLE IF EXISTS `upload_dataset`;
CREATE TABLE IF NOT EXISTS `upload_dataset` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `Dataset` varchar(100) DEFAULT NULL,
  `File_size` varchar(100) NOT NULL,
  `Date_Time` datetime(6) NOT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload_dataset`
--

INSERT INTO `upload_dataset` (`User_id`, `Dataset`, `File_size`, `Date_Time`) VALUES
(44, 'hepatitis_clean_JHz9FE1.csv', '8.59375 kb', '2024-01-09 11:24:03.233373');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_age` int(11) DEFAULT NULL,
  `user_email` varchar(254) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_address` longtext NOT NULL,
  `user_contact` varchar(15) NOT NULL,
  `user_image` varchar(100) DEFAULT NULL,
  `Date_Time` datetime(6) DEFAULT NULL,
  `User_Status` longtext DEFAULT NULL,
  `Otp_Num` int(11) DEFAULT NULL,
  `Otp_Status` longtext DEFAULT NULL,
  `Last_Login_Time` time(6) DEFAULT NULL,
  `Last_Login_Date` date DEFAULT NULL,
  `No_Of_Times_Login` int(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_name`, `user_age`, `user_email`, `user_password`, `user_address`, `user_contact`, `user_image`, `Date_Time`, `User_Status`, `Otp_Num`, `Otp_Status`, `Last_Login_Time`, `Last_Login_Date`, `No_Of_Times_Login`, `Message`) VALUES
(8, 'praveen', 26, 'praveenlucky322@gmail.com', 'Kutty@123', 'Paikazinagar,near STU Bhavan', '7989373610', 'media/rose_2B7Agvb.jpg', '2024-01-06 08:11:13.643168', 'accepted', 1240, 'verified', NULL, '2024-01-06', 0, NULL),
(7, 'prashanthi', 25, 'pprashanthi169@gmail.com', 'Amma@123', '8-3-232/b/50/c/6 , venkatagiri, yousufguda , hyderabad', '+919949803766', 'media/rose_TqQYL27.jpg', '2024-01-09 10:28:52.210967', 'accepted', 7060, 'verified', '17:18:16.138528', '2024-01-05', 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `xg_algo`
--

DROP TABLE IF EXISTS `xg_algo`;
CREATE TABLE IF NOT EXISTS `xg_algo` (
  `XG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Accuracy` longtext NOT NULL,
  `Precession` longtext NOT NULL,
  `F1_Score` longtext NOT NULL,
  `Recall` longtext NOT NULL,
  `Name` longtext NOT NULL,
  PRIMARY KEY (`XG_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xg_algo`
--

INSERT INTO `xg_algo` (`XG_ID`, `Accuracy`, `Precession`, `F1_Score`, `Recall`, `Name`) VALUES
(1, '92.0', '92.0', '92.0', '92.0', 'XG Boost Algorithm'),
(2, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(3, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(4, '92.0', '92.0', '92.0', '92.0', 'XG Boost Algorithm'),
(5, '92.0', '92.0', '92.0', '92.0', 'XG Boost Algorithm'),
(6, '88.0', '88.0', '88.0', '88.0', 'XG Boost Algorithm'),
(7, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(8, '84.0', '84.0', '84.0', '84.0', 'XG Boost Algorithm'),
(9, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(10, '88.0', '88.0', '88.0', '88.0', 'XG Boost Algorithm'),
(11, '92.0', '92.0', '92.0', '92.0', 'XG Boost Algorithm'),
(12, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(13, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(14, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(15, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(16, '88.0', '88.0', '88.24', '88.24', 'XG Boost Algorithm'),
(17, '88.0', '88.0', '88.24', '88.24', 'XG Boost Algorithm'),
(18, '94.0', '94.0', '94.07', '94.07', 'XG Boost Algorithm'),
(19, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(20, '86.0', '86.0', '86.06', '86.06', 'XG Boost Algorithm'),
(21, '88.0', '88.0', '88.24', '88.24', 'XG Boost Algorithm'),
(22, '86.0', '86.0', '86.06', '86.06', 'XG Boost Algorithm'),
(23, '88.0', '88.0', '88.0', '88.0', 'XG Boost Algorithm'),
(24, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(25, '88.0', '88.0', '88.0', '88.0', 'XG Boost Algorithm'),
(26, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(27, '86.0', '86.0', '86.06', '86.06', 'XG Boost Algorithm'),
(28, '82.0', '82.0', '82.05', '82.05', 'XG Boost Algorithm'),
(29, '88.0', '88.0', '88.24', '88.24', 'XG Boost Algorithm'),
(30, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(31, '90.0', '90.0', '90.06', '90.06', 'XG Boost Algorithm'),
(32, '92.0', '92.0', '92.0', '92.0', 'XG Boost Algorithm'),
(33, '82.0', '82.0', '82.05', '82.05', 'XG Boost Algorithm');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
