-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2012 at 12:58 PM
-- Server version: 5.5.27-log
-- PHP Version: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `coaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE IF NOT EXISTS `action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `id_map` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_from` int(11) NOT NULL,
  `type` varchar(35) NOT NULL,
  `pending` int(11) NOT NULL DEFAULT '1',
  `reward_amount` int(11) NOT NULL DEFAULT '0',
  `reward_type` enum('loops','golden','xp') NOT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bonus`
--

CREATE TABLE IF NOT EXISTS `bonus` (
  `id_bonus` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  `ratio` float(16,5) NOT NULL,
  `type` enum('xp','time','visits','allin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bonus`
--

INSERT INTO `bonus` (`id_bonus`, `id_user`, `time_start`, `time_end`, `ratio`, `type`) VALUES
(0, 1, '2012-10-22 00:00:00', '2012-10-31 00:00:00', 1.50000, 'xp');

-- --------------------------------------------------------

--
-- Table structure for table `chunk`
--

CREATE TABLE IF NOT EXISTS `chunk` (
  `id_chunk` int(11) NOT NULL AUTO_INCREMENT,
  `id_map` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `chunk_x` tinyint(4) NOT NULL,
  `chunk_y` tinyint(4) NOT NULL,
  `chunk_state` enum('building','running','broke') NOT NULL,
  `time_start` mediumint(9) NOT NULL,
  `time_left` mediumint(9) NOT NULL,
  PRIMARY KEY (`id_chunk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=127 ;

--
-- Dumping data for table `chunk`
--

INSERT INTO `chunk` (`id_chunk`, `id_map`, `id_item`, `chunk_x`, `chunk_y`, `chunk_state`, `time_start`, `time_left`) VALUES
(1, 1, 1, 0, 0, 'running', 0, 0),
(2, 1, 1, 1, 0, 'running', 0, 0),
(3, 1, 1, 2, 0, 'running', 0, 0),
(4, 1, 2, 3, 0, 'running', 0, 0),
(5, 1, 1, 4, 0, 'running', 0, 0),
(6, 1, 1, 5, 0, 'running', 0, 0),
(7, 1, 1, 6, 0, 'running', 0, 0),
(8, 1, 1, 7, 0, 'running', 0, 0),
(9, 1, 1, 8, 0, 'running', 0, 0),
(10, 1, 1, 9, 0, 'running', 0, 0),
(11, 1, 1, 10, 0, 'running', 0, 0),
(12, 1, 1, 11, 0, 'running', 0, 0),
(13, 1, 1, 12, 0, 'running', 0, 0),
(14, 1, 1, 13, 0, 'running', 0, 0),
(15, 1, 1, 0, 1, 'running', 0, 0),
(16, 1, 1, 1, 1, 'running', 0, 0),
(17, 1, 1, 2, 1, 'running', 0, 0),
(18, 1, 1, 3, 1, 'running', 0, 0),
(19, 1, 1, 4, 1, 'running', 0, 0),
(20, 1, 1, 5, 1, 'running', 0, 0),
(21, 1, 1, 6, 1, 'running', 0, 0),
(22, 1, 1, 7, 1, 'running', 0, 0),
(23, 1, 1, 8, 1, 'running', 0, 0),
(24, 1, 1, 9, 1, 'running', 0, 0),
(25, 1, 1, 10, 1, 'running', 0, 0),
(26, 1, 1, 11, 1, 'running', 0, 0),
(27, 1, 1, 12, 1, 'running', 0, 0),
(28, 1, 1, 13, 1, 'running', 0, 0),
(29, 1, 1, 0, 2, 'running', 0, 0),
(30, 1, 1, 1, 2, 'running', 0, 0),
(31, 1, 1, 2, 2, 'running', 0, 0),
(32, 1, 1, 3, 2, 'running', 0, 0),
(33, 1, 1, 4, 2, 'running', 0, 0),
(34, 1, 1, 5, 2, 'running', 0, 0),
(35, 1, 1, 6, 2, 'running', 0, 0),
(36, 1, 1, 7, 2, 'running', 0, 0),
(37, 1, 1, 8, 2, 'running', 0, 0),
(38, 1, 1, 9, 2, 'running', 0, 0),
(39, 1, 1, 10, 2, 'running', 0, 0),
(40, 1, 1, 11, 2, 'running', 0, 0),
(41, 1, 1, 12, 2, 'running', 0, 0),
(42, 1, 1, 13, 2, 'running', 0, 0),
(43, 1, 1, 0, 3, 'running', 0, 0),
(44, 1, 1, 1, 3, 'running', 0, 0),
(45, 1, 1, 2, 3, 'running', 0, 0),
(46, 1, 1, 3, 3, 'running', 0, 0),
(47, 1, 1, 4, 3, 'running', 0, 0),
(48, 1, 1, 5, 3, 'running', 0, 0),
(49, 1, 1, 6, 3, 'running', 0, 0),
(50, 1, 1, 7, 3, 'running', 0, 0),
(51, 1, 1, 8, 3, 'running', 0, 0),
(52, 1, 1, 9, 3, 'running', 0, 0),
(53, 1, 1, 10, 3, 'running', 0, 0),
(54, 1, 1, 11, 3, 'running', 0, 0),
(55, 1, 1, 12, 3, 'running', 0, 0),
(56, 1, 1, 13, 3, 'running', 0, 0),
(57, 1, 1, 0, 4, 'running', 0, 0),
(58, 1, 1, 1, 4, 'running', 0, 0),
(59, 1, 1, 2, 4, 'running', 0, 0),
(60, 1, 1, 3, 4, 'running', 0, 0),
(61, 1, 1, 4, 4, 'running', 0, 0),
(62, 1, 1, 5, 4, 'running', 0, 0),
(63, 1, 1, 6, 4, 'running', 0, 0),
(64, 1, 1, 7, 4, 'running', 0, 0),
(65, 1, 1, 8, 4, 'running', 0, 0),
(66, 1, 1, 9, 4, 'running', 0, 0),
(67, 1, 1, 10, 4, 'running', 0, 0),
(68, 1, 1, 11, 4, 'running', 0, 0),
(69, 1, 1, 12, 4, 'running', 0, 0),
(70, 1, 1, 13, 4, 'running', 0, 0),
(71, 1, 1, 0, 5, 'running', 0, 0),
(72, 1, 1, 1, 5, 'running', 0, 0),
(73, 1, 1, 2, 5, 'running', 0, 0),
(74, 1, 1, 3, 5, 'running', 0, 0),
(75, 1, 1, 4, 5, 'running', 0, 0),
(76, 1, 1, 5, 5, 'running', 0, 0),
(77, 1, 1, 6, 5, 'running', 0, 0),
(78, 1, 1, 7, 5, 'running', 0, 0),
(79, 1, 1, 8, 5, 'running', 0, 0),
(80, 1, 1, 9, 5, 'running', 0, 0),
(81, 1, 1, 10, 5, 'running', 0, 0),
(82, 1, 1, 11, 5, 'running', 0, 0),
(83, 1, 1, 12, 5, 'running', 0, 0),
(84, 1, 1, 13, 5, 'running', 0, 0),
(85, 1, 1, 0, 6, 'running', 0, 0),
(86, 1, 1, 1, 6, 'running', 0, 0),
(87, 1, 1, 2, 6, 'running', 0, 0),
(88, 1, 1, 3, 6, 'running', 0, 0),
(89, 1, 1, 4, 6, 'running', 0, 0),
(90, 1, 1, 5, 6, 'running', 0, 0),
(91, 1, 1, 6, 6, 'running', 0, 0),
(92, 1, 1, 7, 6, 'running', 0, 0),
(93, 1, 1, 8, 6, 'running', 0, 0),
(94, 1, 1, 9, 6, 'running', 0, 0),
(95, 1, 1, 10, 6, 'running', 0, 0),
(96, 1, 1, 11, 6, 'running', 0, 0),
(97, 1, 1, 12, 6, 'running', 0, 0),
(98, 1, 1, 13, 6, 'running', 0, 0),
(99, 1, 1, 0, 7, 'running', 0, 0),
(100, 1, 1, 1, 7, 'running', 0, 0),
(101, 1, 1, 2, 7, 'running', 0, 0),
(102, 1, 1, 3, 7, 'running', 0, 0),
(103, 1, 1, 4, 7, 'running', 0, 0),
(104, 1, 1, 5, 7, 'running', 0, 0),
(105, 1, 1, 6, 7, 'running', 0, 0),
(106, 1, 1, 7, 7, 'running', 0, 0),
(107, 1, 1, 8, 7, 'running', 0, 0),
(108, 1, 1, 9, 7, 'running', 0, 0),
(109, 1, 1, 10, 7, 'running', 0, 0),
(110, 1, 1, 11, 7, 'running', 0, 0),
(111, 1, 1, 12, 7, 'running', 0, 0),
(112, 1, 1, 13, 7, 'running', 0, 0),
(113, 1, 1, 0, 8, 'running', 0, 0),
(114, 1, 1, 1, 8, 'running', 0, 0),
(115, 1, 1, 2, 8, 'running', 0, 0),
(116, 1, 1, 3, 8, 'running', 0, 0),
(117, 1, 1, 4, 8, 'running', 0, 0),
(118, 1, 1, 5, 8, 'running', 0, 0),
(119, 1, 1, 6, 8, 'running', 0, 0),
(120, 1, 1, 7, 8, 'running', 0, 0),
(121, 1, 1, 8, 8, 'running', 0, 0),
(122, 1, 1, 9, 8, 'running', 0, 0),
(123, 1, 1, 10, 8, 'running', 0, 0),
(124, 1, 1, 11, 8, 'running', 0, 0),
(125, 1, 1, 12, 8, 'running', 0, 0),
(126, 1, 1, 13, 8, 'running', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id_employee` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_chunk` int(11) NOT NULL,
  `pending` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('shop','decoration','carousel','flooring') NOT NULL DEFAULT 'flooring',
  `name` varchar(35) NOT NULL,
  `price` mediumint(9) NOT NULL,
  `time_to_build` int(11) NOT NULL,
  `item_x` char(1) NOT NULL DEFAULT '1',
  `item_y` char(1) NOT NULL DEFAULT '1',
  `min_visit` int(11) NOT NULL,
  `max_visit` int(11) NOT NULL,
  `upkeep` int(11) NOT NULL DEFAULT '1000',
  `drop_rate` float(16,6) NOT NULL,
  `unlock_type` enum('loops','golden','xp','level') NOT NULL DEFAULT 'level',
  `unlock_amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `type`, `name`, `price`, `time_to_build`, `item_x`, `item_y`, `min_visit`, `max_visit`, `upkeep`, `drop_rate`, `unlock_type`, `unlock_amount`) VALUES
(1, 'flooring', 'herb', 10, 3, '1', '1', 0, 0, 10, 0.000000, 'xp', 0),
(2, 'carousel', 'Carousel', 70000, 10, '2', '2', 50, 100, 1000, 0.000000, 'level', 1),
(3, 'shop', 'Hotdog', 20000, 7, '2', '2', 30, 55, 500, 0.000000, 'xp', 0),
(4, 'flooring', 'road', 15, 3, '1', '1', 0, 0, 10, 0.000000, 'xp', 0),
(5, 'carousel', 'Ferris Wheel', 0, 0, '1', '1', 100, 300, 1000, 0.000000, 'xp', 100);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `id_level` int(11) NOT NULL,
  `gauge` smallint(11) NOT NULL,
  `ratio` float(16,6) NOT NULL,
  `reward_amount` int(11) NOT NULL,
  `reward_type` enum('loops','golden','xp') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `gauge`, `ratio`, `reward_amount`, `reward_type`) VALUES
(1, 10, 1.000000, 100, 'loops');

-- --------------------------------------------------------

--
-- Table structure for table `map`
--

CREATE TABLE IF NOT EXISTS `map` (
  `id_map` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `name` varchar(65) NOT NULL,
  `type` enum('default','winter','summer','haloween','spring','christmas') NOT NULL DEFAULT 'default',
  `map_x` tinyint(4) NOT NULL DEFAULT '10',
  `map_y` tinyint(4) NOT NULL DEFAULT '10',
  `total_visit` int(11) NOT NULL DEFAULT '0',
  `total_gain` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_map`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `map`
--

INSERT INTO `map` (`id_map`, `id_user`, `name`, `type`, `map_x`, `map_y`, `total_visit`, `total_gain`) VALUES
(1, 1, 'Awesome Park', 'default', 27, 18, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `quest`
--

CREATE TABLE IF NOT EXISTS `quest` (
  `id_quest` int(11) NOT NULL,
  `title` int(11) NOT NULL,
  `content` int(11) NOT NULL,
  `type` enum('repeatable','limited','story') NOT NULL,
  `reward_type` enum('loops','golden','xp') NOT NULL,
  `reward_amount` int(11) NOT NULL,
  `goal_amount` int(11) NOT NULL,
  `goal_type` enum('xp','visits','gain','building','played') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_map` int(11) NOT NULL,
  `time_played` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `golden_ticket` int(11) NOT NULL,
  `score_total` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_map`, `time_played`, `money`, `golden_ticket`, `score_total`, `level`) VALUES
(1, 1, 150, 150000, 5, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_item`
--

CREATE TABLE IF NOT EXISTS `user_item` (
  `id_user_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  PRIMARY KEY (`id_user_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_quest`
--

CREATE TABLE IF NOT EXISTS `user_quest` (
  `id_user_quest` int(11) NOT NULL,
  `id_quest` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_quest`
--

INSERT INTO `user_quest` (`id_user_quest`, `id_quest`, `id_user`, `state`) VALUES
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE IF NOT EXISTS `visitor` (
  `id_visitor` int(11) NOT NULL,
  `id_map` int(11) NOT NULL,
  `visit_date` datetime NOT NULL,
  `visit_length` smallint(6) NOT NULL,
  `gain` smallint(6) NOT NULL,
  `number` tinyint(1) NOT NULL,
  `id_chunk1` int(11) NOT NULL,
  `id_chunk2` int(11) NOT NULL,
  `id_chunk3` int(11) NOT NULL,
  `id_chunk4` int(11) NOT NULL,
  `id_chunk5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE IF NOT EXISTS `vote` (
  `id_vote` int(11) NOT NULL,
  `id_map` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `vote_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
