-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 31, 2018 at 07:08 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book`
--

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE `interest` (
  `mid` int(11) NOT NULL,
  `description` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interest`
--

INSERT INTO `interest` (`mid`, `description`) VALUES
(1, 'AI'),
(1, 'Art'),
(1, 'science fiction'),
(7, 'Artificial Intelligence'),
(7, 'image processing'),
(7, 'middle ware'),
(8, 'Artificial Intelligence'),
(8, 'image processing'),
(8, 'religion'),
(9, 'image processing'),
(10, 'art'),
(10, 'middle ware'),
(11, 'Artificial Intelligence'),
(11, 'image processing'),
(11, 'religion'),
(12, 'Artificial Intelligence'),
(12, 'image processing'),
(12, 'religion'),
(13, 'Artificial Intelligence'),
(14, 'Artificial Intelligence'),
(15, 'art'),
(15, 'image processing'),
(15, 'middle ware'),
(15, 'politics'),
(15, 'religion'),
(15, 'science fiction');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `mid` int(11) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `p_address` varchar(100) DEFAULT NULL,
  `c_address` varchar(100) DEFAULT NULL,
  `mobile` char(14) DEFAULT NULL,
  `home_tel` char(14) DEFAULT NULL,
  `uid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mid`, `fname`, `lname`, `DOB`, `p_address`, `c_address`, `mobile`, `home_tel`, `uid`) VALUES
(1, 'c', 'd', '2000-01-10', 'colombo', 'kandy', '0771922837', '0112837465', 3),
(2, 'hbfcsj', 'hbfcsj', '2018-03-29', 'hbfcsj', 'hbfcsj', 'hbfcsj', 'hbfcsj', 6),
(3, 'hbfcsj', 'hbfcsj', '2018-03-30', 'hbfcsj', 'hbfcsj', 'hbfcsj', 'hbfcsj', 7),
(4, 'hujs', 'uhij', '2018-03-09', 'ftgyhu', 'fghjn', '5678909876', '5678909867', 8),
(5, 'fg', 'hj', '2018-03-07', 'jj', 'nn', '1256345698', '4569875632', 9),
(6, 'd', 'd', '2018-03-11', 'd', 'd', '4487905678', '7896541230', 10),
(7, 'e', 'e', '2018-03-09', 'e', 'e', '1234567891', '1234567891', 11),
(8, 'qq', 'aa', '2018-03-26', 'bb', 'nn', '5678909812', '9876543214', 12),
(14, 'qqqqq', 'qqqq', '2018-03-14', 'eeeee', 'eeeeee', '1234453456', '1234565456', 18),
(13, 'nyy', 'yyy', '2018-03-25', 'y', 'y', 'y', 'yy', 17),
(15, 'i', 'i', '2018-03-14', 'data', 'yuuu', '1111111111', '2222222222', 19);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `u_type` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `u_name`, `pwd`, `u_type`, `email`) VALUES
(1, 'a', 'rQj2xoAvBXsWVrA8hK6Drw==', 'owner', 'asd@gmail.com'),
(2, 'b', 'ud5+ZviYaZQ9KAGJPcTS7w=', 'admin', 'animal@gmail.com'),
(12, '', 'P2rTVuy5nr5rtRyZN5utfg==', 'member', 'k@p.o'),
(18, 'qqqqq qqqq', 'zrGM+YgjrRLt1dHeyEB01A==', 'member', 'l@p.n'),
(17, 'nyy yyy', 'T0nRSfGLZ9+shHlQB8kkSw==', 'member', 'y@j.co'),
(19, 'i i', 'TJnb/a93RC9ENtyvh3nGaw==', 'member', 'i@d.x');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`mid`,`description`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `u_name` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
