-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2012 at 05:39 PM
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
  `time_start` int(11) NOT NULL,
  `time_left` int(11) NOT NULL,
  `ratio` float(16,5) NOT NULL,
  `type` enum('xp','time','visits','allin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chunk`
--

CREATE TABLE IF NOT EXISTS `chunk` (
  `chunk_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_map` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `chunk_x` tinyint(4) NOT NULL,
  `chunk_y` tinyint(4) NOT NULL,
  `chunk_state` enum('building','running','broke') NOT NULL,
  `time_start` mediumint(9) NOT NULL,
  `time_left` mediumint(9) NOT NULL,
  PRIMARY KEY (`chunk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `type` enum('shop','decoration','carousel','road','flooring') NOT NULL DEFAULT 'flooring',
  `name` varchar(35) NOT NULL,
  `price` mediumint(9) NOT NULL,
  `time_to_build` int(11) NOT NULL,
  `item_x` char(1) NOT NULL DEFAULT '1',
  `item_y` char(1) NOT NULL DEFAULT '1',
  `min_visit` int(11) NOT NULL,
  `max_visit` int(11) NOT NULL,
  `upkeep` int(11) NOT NULL DEFAULT '1000',
  `drop_rate` float(16,6) NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `type`, `name`, `price`, `time_to_build`, `item_x`, `item_y`, `min_visit`, `max_visit`, `upkeep`, `drop_rate`) VALUES
(1, 'flooring', 'herb', 10, 3, '1', '1', 0, 0, 10, 0.000000),
(2, 'carousel', 'Carousel', 70000, 10, '2', '2', 50, 100, 1000, 0.000000),
(3, 'shop', 'Hotdog', 20000, 7, '2', '2', 30, 55, 500, 0.000000),
(4, 'flooring', 'road', 15, 3, '1', '1', 0, 0, 10, 0.000000);

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
