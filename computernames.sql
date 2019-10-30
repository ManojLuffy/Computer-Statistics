-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 23, 2018 at 08:54 AM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lablogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `computernames`
--

CREATE TABLE IF NOT EXISTS `computernames` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `computername` varchar(12) NOT NULL,
  `computer_location` varchar(10) NOT NULL,
  `alt_computername` varchar(50) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `computernames`
--

INSERT INTO `computernames` (`id`, `computername`, `computer_location`, `alt_computername`, `notes`) VALUES
(1, 'DEC-01', '2', 'LBWK109254', ''),
(2, 'DEC-02', '2', 'LBWK109222', ''),
(3, 'DEC-03', '2', 'LBWK109250', ''),
(4, 'DEC-04', '2', 'LBWK109246', ''),
(5, 'DEC-05', '2', 'LBWK109227', ''),
(6, 'DEC-06', '2', 'LBWK109255', ''),
(7, 'DEC-07', '2', 'LBWK109219', ''),
(8, 'DEC-08', '2', 'LBWK109215', ''),
(9, 'DEC-09', '2', 'LBWK109256', ''),
(10, 'DEC-10', '2', 'LBWK109243', ''),
(11, 'DEC-11', '2', 'LBWK109226', ''),
(12, 'DEC-12', '2', 'LBWK109229', ''),
(13, 'DEC-13', '2', 'LBWK109251', ''),
(14, 'DEC-14', '2', 'LBWK109252', ''),
(15, 'DEC-15', '2', 'LBWK109232', ''),
(16, 'DEC-16', '2', 'LBWK109225', ''),
(17, 'DEC-17', '2', 'LBWK109258', ''),
(18, 'DEC-18', '2', 'LBWK109238', ''),
(19, 'DEC-19', '2', 'LBWK109217', ''),
(20, 'DEC-20', '2', 'LBWK109223', ''),
(21, 'DEC-21', '2', 'LBWK109244', ''),
(22, 'DEC-22', '2', 'LBWK109253', ''),
(23, 'DEC-23', '2', 'LBWK109242', ''),
(24, 'DEC-24', '2', 'LBWK109259', ''),
(25, 'DEC-25', '2', 'LBWK109221', ''),
(26, 'DEC-26', '2', 'LBWK109247', ''),
(27, 'DEC-27', '2', 'LBWK109245', ''),
(28, 'DEC-28', '2', 'LBWK109218', ''),
(29, 'DEC-29', '2', 'LBWK109249', ''),
(30, 'DEC-30', '2', 'LBWK109230', ''),
(31, 'DEC-31', '2', 'LBWK109220', ''),
(32, 'DEC-32', '2', 'LBWK109228', ''),
(33, 'DEC-33', '2', 'LBWK109231', ''),
(34, 'DEC-34', '2', 'LBWK109235', ''),
(35, 'DEC-35', '2', 'LBWK109234', ''),
(36, 'DEC-36', '2', 'LBWK109241', ''),
(37, 'DEC-37', '2', 'LBWK109236', ''),
(38, 'DEC-38', '2', 'LBWK106695', ''),
(39, 'REF-01', '1', 'LBWK110518', 'First pc, first row'),
(40, 'REF-02', '1', 'LBWK110519', ''),
(41, 'REF-03', '1', 'LBWK110520', ''),
(42, 'REF-04', '1', 'LBWK110521', ''),
(43, 'REF-05', '1', 'LBWK110522', ''),
(44, 'REF-06', '1', 'LBWK110523', ''),
(45, 'REF-07', '1', 'LBWK110524', ''),
(46, 'REF-08', '1', 'LBWK110525', ''),
(47, 'REF-09', '1', 'LBWK110526', ''),
(48, 'REF-10', '1', 'LBWK110527', ''),
(49, 'REF-11', '1', 'LBWK110528', ''),
(50, 'REF-12', '1', 'LBWK110529', ''),
(51, 'REF-13', '1', 'LBWK110531', ''),
(52, 'REF-14', '1', 'LBWK110532', ''),
(53, 'REF-15', '1', 'LBWK110533', ''),
(54, 'REF-16', '1', 'LBWK110534', ''),
(55, 'REF-17', '1', 'LBWK110535', ''),
(56, 'REF-18', '1', 'LBWK110536', ''),
(57, 'REF-19', '1', 'LBWK110537', ''),
(58, 'GPS-01', '2', 'LBWK109380', ''),
(59, 'GPS-02', '2', 'LBWK109383', ''),
(60, 'GPS-03', '2', 'LBWK109381', ''),
(61, 'GPS-04', '2', 'LBWK109237', ''),
(62, 'GPS-05', '2', 'LBWK109240', ''),
(63, 'GPS-06', '2', 'LBWK109216', ''),
(64, 'GPS-07', '2', 'LBWK109227', ''),
(65, 'GPS-08', '2', 'LBWK', ''),
(66, 'ADA-01', '1', 'LBWK109382', ''),
(67, 'ADA-02', '2', 'LBWK109257', ''),
(68, 'ADA-03', '2', 'LBWK109248', ''),
(70, 'GPS-9', '2', 'LBWK102321', ''),
(71, 'GPS-10', '2', 'LBWK102292', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
