-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2019 at 01:30 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '04-06-2019 08:49:27 AM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Computer Hardware', 'Mother Board,  Computer Parts , Wiring etc', '2017-03-28 07:10:55', ''),
(2, 'Software', 'OS realated, Antivirus , Computer Settings  , Software problems etc', '2017-06-11 10:54:06', ''),
(3, 'Networking ', 'Internet problems , adapter settings , etc', '2019-06-03 04:56:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(11, 4, 'in process', 'qq', '2019-06-10 10:26:57'),
(12, 5, 'in process', 'asd', '2019-06-10 10:30:22'),
(13, 5, 'in process', 'aa', '2019-06-10 10:31:22'),
(14, 6, 'in process', 'vv', '2019-06-10 10:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `e_id` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `empEmail` varchar(100) NOT NULL,
  `contactNo` int(10) NOT NULL,
  `area_of_exp` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`e_id`, `fullName`, `empEmail`, `contactNo`, `area_of_exp`, `city`, `password`) VALUES
(5, 'j', 'j123@gmail.com', 1234567890, 'computer hardware', 'Vadodara', '202cb962ac59075b964b07152d234b70'),
(6, 'emp1', 'e1@gmail.com', 1233211231, 'computer software', 'Vadodara', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateDescription` tinytext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(3, 'Middle Gujarat', 'Vadodara - Ahemdabad Region', '2016-10-18 11:35:02', ''),
(4, 'South Gujarat', 'Surat - Valsad region', '2016-10-18 11:35:58', '28-03-2017 03:40:02 PM'),
(5, 'West Gujarat', 'Kacch Bhuj  Junaghadh region', '2017-03-28 07:20:36', '');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(3, 2, 'OS Related ', '2019-06-10 06:22:16', NULL),
(4, 2, 'particular software realted ( antivirus) ', '2019-06-10 06:23:07', NULL),
(5, 3, 'internet Settings ', '2019-06-10 06:23:30', NULL),
(6, 3, 'connection establishment ', '2019-06-10 06:23:47', NULL),
(7, 1, 'Replacement of parts', '2019-06-10 06:24:19', NULL),
(8, 1, 'Parts repairing ', '2019-06-10 06:24:32', NULL),
(9, 1, 'Parts repairing ', '2019-06-10 06:24:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `complaintType` varchar(255) NOT NULL,
  `assigned_emp` varchar(500) DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `noc` varchar(255) NOT NULL,
  `complaintDetails` mediumtext NOT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `assigned_emp`, `state`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(1, 7, 1, 'Parts repairing ', ' Complaint', NULL, 'Middle Gujarat', 'Hardware Crash', 'Motherboard not working ...', '', '2019-06-10 07:36:11', 'closed', '2019-06-10 09:48:12'),
(2, 9, 1, 'Replacement of parts', ' Complaint', NULL, 'Middle Gujarat', 'Hardware Crash', 'qqqq', '', '2019-06-10 08:09:52', 'closed', '2019-06-10 10:12:07'),
(3, 10, 3, 'internet Settings ', ' Complaint', NULL, 'South Gujarat', 'Hardware Crash', 'qqqqqqqqq', '', '2019-06-10 10:16:34', 'in process', '2019-06-10 10:17:26'),
(4, 10, 2, 'OS Related ', 'General Query', '', 'South Gujarat', 'res', 'qwsdefghkjl;l', '', '2019-06-10 10:26:33', 'in process', '2019-06-10 10:26:57'),
(5, 10, 1, 'Parts repairing ', 'General Query', '', 'Middle Gujarat', 'Hardware Crash', 'qwer', '', '2019-06-10 10:30:03', 'in process', '2019-06-10 10:30:22'),
(6, 10, 1, 'Parts repairing ', ' Complaint', 'j (computer hardware)', 'Middle Gujarat', 'Hardware Crash', 'bb', '', '2019-06-10 10:32:52', 'in process', '2019-06-10 10:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(38, 7, 'jainam@gmail.com', 0x3a3a3100000000000000000000000000, '2019-06-10 07:34:43', '', 1),
(39, 0, 'user2@123', 0x3a3a3100000000000000000000000000, '2019-06-10 08:08:37', '', 0),
(40, 0, 'user2@123', 0x3a3a3100000000000000000000000000, '2019-06-10 08:08:48', '', 0),
(41, 9, 'j@123', 0x3a3a3100000000000000000000000000, '2019-06-10 08:09:14', '', 1),
(42, 0, 'jainil@2405', 0x3a3a3100000000000000000000000000, '2019-06-10 10:14:33', '', 0),
(43, 0, 'user2@123', 0x3a3a3100000000000000000000000000, '2019-06-10 10:14:41', '', 0),
(44, 0, 'j@gmail.com', 0x3a3a3100000000000000000000000000, '2019-06-10 10:14:49', '', 0),
(45, 10, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2019-06-10 10:15:30', '', 1),
(46, 10, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2019-06-10 10:26:09', '', 1),
(47, 10, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2019-06-10 11:01:27', '', 1),
(48, 10, '1@gmail.com', 0x3a3a3100000000000000000000000000, '2019-06-10 11:06:46', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(3, 'Jainil PAnchal', 'jainilpanchal2000@gmail.com', '202cb962ac59075b964b07152d234b70', 9409465317, NULL, NULL, NULL, NULL, NULL, '2019-06-04 03:04:45', '0000-00-00 00:00:00', 1),
(7, 'JAINAM PANCHAL', 'jainam@gmail.com', '202cb962ac59075b964b07152d234b70', 9988776655, 'Vadodara', 'Middle Gujarat', 'India', 390025, NULL, '2019-06-10 07:34:23', '2019-06-10 07:35:20', 1),
(8, 'JAINIL', 'user2@123.com', '202cb962ac59075b964b07152d234b70', 1111111111, NULL, NULL, NULL, NULL, NULL, '2019-06-10 08:08:01', '0000-00-00 00:00:00', 1),
(9, 'JAINIL', 'j@123', '202cb962ac59075b964b07152d234b70', 1234567890, NULL, NULL, NULL, NULL, NULL, '2019-06-10 08:09:05', '0000-00-00 00:00:00', 1),
(10, 'qq', '1@gmail.com', '202cb962ac59075b964b07152d234b70', 101010101, NULL, NULL, NULL, NULL, NULL, '2019-06-10 10:15:12', '0000-00-00 00:00:00', 1),
(11, 'qq', '1@gmail.com', '202cb962ac59075b964b07152d234b70', 101010101, NULL, NULL, NULL, NULL, NULL, '2019-06-10 10:15:12', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`e_id`),
  ADD UNIQUE KEY `empEmail` (`empEmail`),
  ADD UNIQUE KEY `contactNo` (`contactNo`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
