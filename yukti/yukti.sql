-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2020 at 05:24 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yukti`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_pass` varchar(100) NOT NULL,
  `admin_mob` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `call_options`
--

CREATE TABLE `call_options` (
  `option_id` int(100) NOT NULL,
  `question` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `call_options`
--

INSERT INTO `call_options` (`option_id`, `question`) VALUES
(1, 'Kya ap apne najdiki aspatal ke bare me janna chahte hai'),
(2, 'kya aap novel korona vaayaras ke lie apane lakshanon ka pareekshan karana chaahate hain'),
(3, 'Kya ap mushkil ki is ghari me kya kare aur kya nai yeh janna chahte hai'),
(4, 'kya aap sarakaar dvaara naveenatam apadet jaanana chaahate hain'),
(5, 'kya aap sarakaar dvaara shuroo kee gaee sevaon ko jaanana chaahate hain'),
(6, '\"Do you want to know about the nearest medical facilty\"'),
(7, '\"Do you want to test your symptoms for Novel corona virus\"'),
(8, '\"Do you want me to breif you through Do\'s and Dont\'s durring this time\"'),
(9, '\"Do you want to know the latest update by the Government\"'),
(10, '\"Do you want to know the services launched by the Government\"');

-- --------------------------------------------------------

--
-- Table structure for table `call_replies`
--

CREATE TABLE `call_replies` (
  `reply_id` int(100) NOT NULL,
  `option_id` int(100) NOT NULL,
  `reply` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `call_replies`
--

INSERT INTO `call_replies` (`reply_id`, `option_id`, `reply`) VALUES
(1, 1, '< Speak and send SMS , the hospital name\r\n\r\nand its location from database >'),
(2, 2, 'lakshanon ke kshetr se detaabes se prashn poochhen,\r\n\r\n\r\nabhee ke lie prashn:\r\n\r\n\r\n\"kya aapako seene mein tej dard ka anubhav hai\"\r\n\r\n\r\n<pratikriya \"haan\" ya \"nahin\" rikord karen>\r\n\r\n\r\n\"kya aapako sookhee khaansee hai\"'),
(3, 3, '\"khaansate samay apana chehara dhank len\"\r\n\r\n\r\n\"chehara chhoone se pahale apana haath dho len\"\r\n\r\n\r\n\"yadi aavashyak na ho to saamaajikakaran na karen\"'),
(4, 4, '\"lockdown ki tithi ko 31 may tak barhai gyi hai \"\r\n\r\n\r\n\" pravaasee aur majadooron ke lie train sevaen upalabdh hain adhik jankari ke liye IRCTC se sampark kare\"'),
(5, 5, 'aapko iski jankari SMS dwara bhej di jayegi'),
(6, 6, '< Speak and send SMS , the hospital name\r\n\r\nand its location from database >'),
(7, 7, 'Ask questions from the database from the field of symptoms,\r\n\r\nQuestions for now:\r\n\r\n\"Do you Experience severe pain in the chest\"\r\n\r\n<Record the response \"Yes\" or \"No\">\r\n\r\n\"Do you have dry cough\"\r\n\r\n<Record the response \"Yes\" or \"No\">'),
(8, 8, '\"Cover your face while coughing\"\r\n\r\n\" wash your hand before touching the face\"\r\n\r\n\"Do not socialize if not necessary\"'),
(9, 9, '\" There has been an Extension in lockdown\"\r\n\r\n\"train services are available for migrant and labours to know more contact IRCTC\"'),
(10, 10, 'Details will be send to you soon by SMS');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `h_id` int(100) NOT NULL,
  `h_city` varchar(100) NOT NULL,
  `h_name` varchar(100) NOT NULL,
  `h_contact` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `local_news`
--

CREATE TABLE `local_news` (
  `news_id` int(100) NOT NULL,
  `city_name` varchar(64) NOT NULL,
  `update_title` varchar(250) NOT NULL,
  `update_by` varchar(100) NOT NULL,
  `update_news` varchar(1000) NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `local_news`
--

INSERT INTO `local_news` (`news_id`, `city_name`, `update_title`, `update_by`, `update_news`, `update_time`) VALUES
(1, 'Bhopal', 'Number of patients increasing continuously in Bhopal.', 'MP Police', 'Number of corona patients have reached to 1500', '2020-05-20 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `national_update`
--

CREATE TABLE `national_update` (
  `update_id` int(100) NOT NULL,
  `update_by` varchar(250) NOT NULL,
  `news` varchar(1000) NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `option_list`
--

CREATE TABLE `option_list` (
  `option_id` int(100) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `option_name` varchar(100) NOT NULL,
  `rights` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `option_list`
--

INSERT INTO `option_list` (`option_id`, `type_name`, `option_name`, `rights`) VALUES
(1, 'Admin', 'Manage Post', 'Edit'),
(2, 'Admin', 'Payment Detail', 'Edit'),
(3, 'Public', 'New Post', 'Edit'),
(4, 'Public', 'My Profile', 'Edit'),
(5, 'Public', 'News ', 'View'),
(6, 'Admin', 'Logout', 'Edit'),
(7, 'Public', 'Logout', 'View'),
(8, 'Public', 'Report News', 'Edit'),
(9, 'Experts', 'Review News', 'Edit'),
(10, 'Public', 'Medical Near Me', 'Edit'),
(11, 'Public', 'Get Medical Help', 'Edit'),
(12, 'Public', 'Get Update on SMS', 'Edit'),
(13, 'Public', 'Get Update on Whatsapp', 'Edit'),
(14, 'Public', 'Call Us Directly', 'Edit'),
(15, 'Public', 'Useful Article', 'Edit'),
(16, 'Public', 'Precaution', 'Edit'),
(17, 'Public', 'Check for Malicious link and Fake News', 'Edit');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(100) NOT NULL,
  `post_title` varchar(100) NOT NULL,
  `post_content` varchar(500) NOT NULL,
  `post_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `public`
--

CREATE TABLE `public` (
  `user_id` int(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `user_mob` int(12) NOT NULL,
  `user_country` varchar(32) NOT NULL,
  `user_state` varchar(32) NOT NULL,
  `user_city` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `public_menu`
--

CREATE TABLE `public_menu` (
  `option_id` int(100) NOT NULL,
  `option_title` varchar(200) NOT NULL,
  `option_icon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `call_options`
--
ALTER TABLE `call_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `call_replies`
--
ALTER TABLE `call_replies`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `local_news`
--
ALTER TABLE `local_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `national_update`
--
ALTER TABLE `national_update`
  ADD PRIMARY KEY (`update_id`);

--
-- Indexes for table `option_list`
--
ALTER TABLE `option_list`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `public`
--
ALTER TABLE `public`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `public_menu`
--
ALTER TABLE `public_menu`
  ADD PRIMARY KEY (`option_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `call_options`
--
ALTER TABLE `call_options`
  MODIFY `option_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `call_replies`
--
ALTER TABLE `call_replies`
  MODIFY `reply_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `h_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `local_news`
--
ALTER TABLE `local_news`
  MODIFY `news_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `national_update`
--
ALTER TABLE `national_update`
  MODIFY `update_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `option_list`
--
ALTER TABLE `option_list`
  MODIFY `option_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `public`
--
ALTER TABLE `public`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `public_menu`
--
ALTER TABLE `public_menu`
  MODIFY `option_id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
