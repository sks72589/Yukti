-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 30, 2021 at 09:59 PM
-- Server version: 10.5.9-MariaDB-1
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cif`
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

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_mob`) VALUES
(1, 'admin', 'admin@r', 'aDMIN', 45458645);

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

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`h_id`, `h_city`, `h_name`, `h_contact`) VALUES
(1, 'Bhopal', 'Bansal Hospital Bhopal\r\n', 755408600),
(2, 'Bhopal', 'New Bhopal Hospital Research Foundation', 680587077),
(131, 'Visakhapatnam', 'A.N. Beach Hospital', 1282606950),
(132, 'Visakhapatnam', 'Abhaya Critical Care', 4122062),
(133, 'Hyderabad', 'Aditya Hospital', 814099709),
(134, 'Guntur', 'Amaravathi Institute Of Medical Sciences Pvt Ltd', 1633119776),
(135, 'Gajuwaka', 'Amrutha Nursing Home Private Limited', 2071085979),
(136, 'Visakhapatnam', 'Annapoorna Hospital', 1950523384),
(137, 'Hyderabad', 'Anukrushna Hospitals', 1289876410),
(138, 'Visakhapatnam', 'Anupama Surgical & Children Hospital', 568392614),
(139, 'Hyderabad', 'Apollo Hospitals Enterprise Ltd', 198189189),
(140, 'Hyderabad', 'Apollo Emergency & Clinic', 1331099948),
(141, 'Hyderabad', 'Apollo Emergency & Clinic', 684042969),
(142, 'Hyderabad', 'Apollo Emergency & Clinic', 1768169853),
(143, 'Hyderabad', 'Apollo Emergency Hospital', 1993713919),
(144, 'Visakhapatnam', 'Apollo Hospitals', 1796724497),
(145, 'Ananthapur', 'Aasha Hospitals', 78174156),
(146, 'Hyderabad', 'Apollo Hospitals', 1424163707),
(147, 'Rajahmundry', 'Aravindam Orthopaedic And Physiotherapy Centre', 1644277578),
(148, 'Hyderabad', 'Archana Hospital', 981172531),
(149, 'Hyderabad', 'Bristlecone Hospitals Private Limited', 667582408),
(150, 'Hyderabad', 'Asian Institute Of Gastroenterology', 1241951666),
(151, 'Hyderabad', 'Poojitha Hospital', 1330275225),
(152, 'Hyderabad', 'Aware Global Hospitals', 63717254),
(153, 'Hyderabad', 'Azam Hospital', 335770475),
(154, 'Rajahmundry', 'Apex Hospital', 290165061),
(155, 'Hyderabad', 'Aravind Eye Hospital Private Limited', 1294473797),
(156, 'Rajahmundry', 'Abhaya Emergency Centre Sri Hospitals', 426005607),
(157, 'Visakhapatnam', 'Apoorva Health Services Pvt Ltd', 194834710),
(158, 'Hyderabad', 'Bapuji Maternity & Nursing Home', 253910966),
(159, 'Guntur', 'Ent Nursing Home', 551286496),
(160, 'Visakhapatnam', 'Bharathi Hospital', 116224782),
(161, 'Bhimavaram', 'Bhimavaram Hospitals Ltd', 2021987939),
(162, 'Hyderabad', 'Bibi General Hospital & Cancer Centre', 1012317796),
(163, 'Hyderabad', 'Care Hospital', 250116361),
(164, 'Visakhapatnam', 'Visakha Hospital And Diagnostics Pvt Limited', 1388729648),
(165, 'Chittoor', 'Dr.Agarwal\'S Eye Hospital Ltd', 1094507216),
(166, 'Secunderabad', 'Care Hospitals', 1595840571),
(167, 'Hyderabad', 'Care Hospitals (A Unit Of Quality Care India Limited).', 37765489),
(168, 'East Godavari', 'Sanjana Orthopaedic Hospital', 952780),
(169, 'East Godavari', 'Sri Bikkina Nursing Home', 1441102497),
(170, 'Hyderabad', 'Ambaa Hospitals', 1654768299),
(171, 'Secunderabad', 'Poulomi Hospital', 2054390542),
(172, 'Hyderabad', 'Dolphin Children Hospital', 572988887),
(173, 'Vijayawada', 'Chaitanya Eye Hospital', 373595425),
(174, 'Vijayawada', 'Charithasri Hospitals Ltd', 88134642),
(175, 'Vijayawada', 'Dr. Ramesh Cardiac And Multispeciality Hospital (P) Ltd.', 276210002),
(176, 'Khammam', 'Cure Emergency Hospital', 1066605612),
(177, 'Hyderabad', 'Challa Eye Care Centre', 1149332363),
(178, 'Hyderabad', 'Clear Vision Eye Hospital', 793181958),
(179, 'Rajahmundry', 'Dr.A.V.Ramana Rao Memorial Eye Clinic', 1814197256),
(180, 'Hyderabad', 'Drishti Eye Centre', 1323186812),
(181, 'Hyderabad', 'G.S.N Hopital', 562796775),
(182, 'Hyderabad', 'Geetha Maternity & Nursing Home', 603158034),
(183, 'Hyderabad', 'Global Hospital', 1490667801),
(184, 'Vijayawada', 'Global Multipseciality Hospital', 602969156),
(185, 'Secunderabad', 'Gnr Multispecialty Hospital', 346908915),
(186, 'Visakhapatnam', 'Good Healths New Central Hospital', 1916950612),
(187, 'Kurnool', 'Gowri Gopal Hospital Pvt Ltd', 1789628565),
(188, 'Rajahmundry', 'G.S.L. General Hospital', 1232235217),
(189, 'Visakhapatnam', 'Gayatri Nursing Home', 1781576550),
(190, 'Rajahmundry', 'Harsha Hospitals', 1775234829),
(191, 'Hyderabad', 'Heritage Hospital', 667808315),
(192, 'Warangal', 'Hiranmayi Medicare & Research Centre Pvt. Ltd.', 1453686503),
(193, 'Guntur', 'Hi-Tech Trauma & Critical Care Hospitals Ltd.', 2238691),
(194, 'Hyderabad', 'Hope Children\'S Hospital', 2021612199),
(195, 'Hyderabad', 'Hyderabad Kidney & Laproscopic Centre', 435246192),
(196, 'Hyderabad', 'Hyderabad Nursing Home Pvt Ltd', 1020918050),
(197, 'Guntur', 'Hyma Hospitals (Pvt) Ltd.', 669256765),
(198, 'Hyderabad', 'Image Health Care Limited', 1591458364),
(199, 'Hyderabad', 'Basavatarakam Indo American Cancer Hospital & Research Institute', 30475867),
(200, 'Hyderabad', 'J.J. Hospital', 569305318),
(201, 'Warangal', 'Jaya Hospital', 996210920),
(202, 'Nellore', 'Jayabharat Hospital', 498341847),
(203, 'Warangal', 'Pramoda Hospital', 1816948539),
(204, 'Nalgonda', 'Jyothi Hospital', 52485738),
(205, 'Ananthapur', 'Jeevana Jyothi Hospital', 812123664),
(206, 'Hyderabad', 'Kadimi Nursing Home', 1004292676),
(207, 'Hyderabad', 'Kamineni Hospitals Ltd.', 1426776744),
(208, 'Hyderabad', 'Krishna Children Hospital', 1757040166),
(209, 'Hyderabad', 'L V Prasad Eye Institute', 1913358461),
(210, 'Guntur', 'Karumuri Hospital', 1867885745),
(211, 'Bhimavaram', 'Krishna Hospital', 413567451),
(212, 'Warangal', 'Kalyani Hospital(A Unit Of  Sree Thrumala Medicare And Drc Pvt Ltd)', 630350050),
(213, 'Tanuku', 'Lakshmi Arundhati Nursing Home', 1473784546),
(214, 'Guntur', 'Lalitha Super Specialities Hospital (P) Ltd', 1858122382),
(215, 'Visakhapatnam', 'Lazarus Hospitals Ltd', 697305169),
(216, 'Rajahmundry', 'Life Emergency', 1035890767),
(217, 'Secunderabad', 'Madhava Nursing Home', 1077316256),
(218, 'Nandyal', 'Madhumani Nursing Home', 586022198),
(219, 'Secunderabad', 'Mahalakshmi Nursing Home', 1942999919),
(220, 'Khammam', 'Mamatha General & Super Speciality Hospital', 1134463995),
(221, 'Hyderabad', 'Matrika Dr. Kalpana\'S Hospital', 1045645890),
(222, 'Hyderabad', 'Maxivision Laser Center (P) Ltd - Begumpet', 1770233053),
(223, 'Hyderabad', 'Mediciti Hospital', 1999991740),
(224, 'Hyderabad', 'Meditek Hospital', 813756604),
(225, 'Secunderabad', 'Meena Hospital', 1218983708),
(226, 'Vijayawada', 'Meenakshi Eye Hospital', 1473542354),
(227, 'Hyderabad', 'Mela Multi Speciality Hospital', 1811874659);

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
(1, 'Bhopal', 'Number of patients increasing continuously in Bhopal.', 'MP Police', 'Number of corona patients have reached to 1500', '2020-05-20 00:00:00'),
(10, 'Bhopal', 'Lockdown in Bhopal, other MP cities extended as COVID-19 cases surge', 'barjraj', 'The lockdown was extended in various cities and towns of Madhya Pradesh, including capital Bhopal, on Sunday with the COVID-19 cases continuing to surge and the number of active cases constantly increasing in the state.Bhopal and cities like Chhindwara, Barwani, Dewas and Khargone extended the \'corona curfew\' – lockdown for all practical purposes – till May 3 morning, while Jabalpur, Ratlam, Sagar and Guna extended it till May 1 morning. But due to weekend curfew already in place, the lockdown will be practically extended till May 3 morning here too. On Saturday, Betul and Ashoknagar had extended the corona curfew till May 3.', '2021-04-26 18:49:57'),
(11, 'Bhopal', 'Possibility of lockdown in Madhya Pradesh: Shivraj Singh Chouhan weighs in', 'ramdin verma', 'The district administration of Bhopal has decided to extend the \'corona curfew\' till 3 May as it is witnessing a rise in covid-19 cases. Earlier the curfew was set to end tomorrow at 6 am. The \'corona curfew\' imposed in Bhopal of Madhya Pradesh to tackle the surge in COVID-19 cases has been extended till May 3, an official said today.', '2021-04-25 18:49:57'),
(12, 'Bhopal', 'Janta curfew extended in Madya Pradesh\'s Bhopal till May 3, Ratlam, Sagar and Jabalpur too relocked', 'sharat chandran', 'Amid a spike in coronavirus cases, authorities in Bhopal on Sunday (April 25) extended Janata corona curfew in the state capital. Collector Abhinash Lavaniya today issued an official notification in this regard, announcing an extension in the Janata curfew. ', '2021-04-23 18:51:24'),
(13, 'Delhi', 'Delhi Covid Lockdown news live: Put your house in order, HC tells Kejriwal govt', 'birender mandal', 'The first Oxygen Express train for Delhi carrying around 70 tonnes of the life-saving gas reached the national capital early Tuesday morning. The number of Covid deaths in a day in Delhi touched 380 on Monday — the highest till date. Earlier, on Thursday and Saturday, the capital had reported 357 deaths in a day. ', '2021-04-27 11:51:24'),
(14, 'Delhi', 'In India Covid Crisis, Anger Over Centre\'s ₹ 20,000 Crore Delhi Makeover', 'amit', 'In India Covid Crisis, Anger Over Centre\'s Rs 20,000 Crore Delhi Makeover.The current Parliament House building was conceived about 100 years ago 59 Prime Minister Narendra Modi is rebuilding part of New Delhi, but the mammoth undertaking is drawing fire because it\'s estimated to cost billions at a time when the nation is grappling with a devastating coronavirus outbreak and the economic fallouts of local shutdowns.', '2021-04-27 00:52:40'),
(15, 'Delhi', 'Over 1,000 Covid Deaths \'Missing\' In Delhi Data, Reveal Civic Records\r\n', 'kushal', 'New Delhi: Aerial photographs of cremations in Delhi - innumerable pyres in a row that even landed on the front pages of foreign publications - have been indicating since last week that the actual number of deaths from Covid might be different from the official figures. After visiting the city\'s civic body and seven cremation grounds, NDTV found that at least 1,150 deaths did not make it to the official Covid list.\r\n', '2021-04-24 18:52:40'),
(16, 'Mumbai', 'Mumbai News LIVE: Dharavi reports 18 new COVID-19 cases, 36 test positive in Dadar, 30 in Mahim\r\n', 'kasid', 'For the third day in a row, Mumbai city on Monday reported new COVID-19 cases below 6,000. With the addition of 3,876 new cases, the total number of COVID cases in the maximum city has increased to 6,31,527. However, 70 people succumbed to the deadly virus. On a positive note, 9,150 people have been discharged from hospitals post-recovery. At present, there are 70,373 active cases in the city.', '2021-04-23 18:53:57'),
(17, 'Mumbai ', 'How to get Covid vaccine but not Corona at vaccination centre? Watch viral video by Mumbai doctor', 'shiv prakash', 'Dr Tushar Shah from Mumbai has come up with a video about the do’s and don’ts while visiting the Covid vaccination centres. The video has gone viral on social media, with netizens appreciating the doctor for sharing the information.\r\n', '2021-04-22 18:53:57'),
(18, 'Mumbai ', 'Explained: Who is Rashmi Shukla, the IPS officer summoned by Mumbai Police?\r\n', 'vikram singh', 'Rashmi Shukla, a 1988-batch IPS officer, is one of the seniormost IPS officers in Maharashtra police. The Maha Vikas Aghadi government views her as close to the BJP government and had transferred her from her post as State Intelligence Commissioner (SID) to Civil Defence, seen as a non-executive post last year. In February this year, Shukla went on central deputation as ADG Central Reserve Police Force (CRPF) and is currently posted in Hyderabad. Shukla has also served as the Pune Police Commissioner where she was known for starting initiatives like ‘buddy cop’.', '2021-04-20 18:53:57'),
(19, 'Mumbai ', '‘Get the vaccine not the virus’: Mumbai doctor’s informative clip gets a thumbs-up from tweeple', 'sanjay', 'With the worsening of the pandemic situation and increase in positive Covid-19 cases, the authorities are regularly requesting people to get vaccinated for stopping the spread of the disease. Amid these, a physician from Mumbai Dr. Tushar Shah, has come up with an informative and helpful clip to spread awareness among people about the do’s and don’ts while going to get the vaccine. The video shared on Twitter by Zucker Doctor has received much applause from netizens and it is a must-watch video.', '2021-04-26 08:53:57');

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

--
-- Dumping data for table `national_update`
--

INSERT INTO `national_update` (`update_id`, `update_by`, `news`, `update_time`) VALUES
(1, 'abhi', 'COVID-19 surge: Discrepancy surfaces in Gujarat death figures', '2021-04-27 18:56:58'),
(2, 'ram dutt gupta', 'Gujarat govt announces night curfew in all cities from April 28, here\'s what you should know', '2021-04-26 18:56:58'),
(3, 'khadak singh', 'Gujarat Doctors Under Government Bond Asked To Immediately Join Covid Duty', '2021-04-26 18:56:58'),
(4, 'gurmit singh', '\"Lockdown in Gujarat: Night curfew in 29 cities - What’s allowed, what\'s not | Full list here\r\n\"', '2021-04-23 18:56:58'),
(5, 'khursid', 'Coronavirus HIGHLIGHTS: Burj Khalifa Lights Up With Tricolour To Show Support To India Amid Covid Crisis', '2021-04-26 18:56:58'),
(6, 'rajeev', 'As criticism mounts, US assures help to Covid-hit India', '2021-04-18 18:56:58'),
(7, 'durgesh', 'Coronavirus HIGHLIGHTS: India Becomes Fastest Country To Administer 14 Crore Doses Of COVID-19 Vaccine In 99 Days', '2021-04-23 18:56:58'),
(8, 'ram kumar', 'New Covid cases cross 3 lakh for 6th straight day', '2021-04-26 18:56:58'),
(9, 'sunder paal', 'Over 1,000 Covid Deaths \'Missing\' In Delhi Data, Reveal Civic Records', '2021-04-19 18:56:58'),
(10, 'maansingh aswal', 'Coronavirus | Time for armed forces to rise to the occasion, says Bipin Rawat', '2021-04-23 18:56:58');

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
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `h_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `local_news`
--
ALTER TABLE `local_news`
  MODIFY `news_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `national_update`
--
ALTER TABLE `national_update`
  MODIFY `update_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
