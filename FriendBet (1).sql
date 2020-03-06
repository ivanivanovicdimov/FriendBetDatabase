CREATE DATABASE FriendBet;

-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 06, 2020 at 06:35 PM
-- Server version: 5.5.64-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FriendBet`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bets`
--
USE FriendBet;

CREATE TABLE IF NOT EXISTS `Bets` (
  `BetID` int(11) NOT NULL,
  `BetName` varchar(50) DEFAULT NULL,
  `BetWager` decimal(9,2) DEFAULT NULL,
  `BetDescription` varchar(500) DEFAULT NULL,
  `UserOneID` int(11) DEFAULT NULL,
  `UserTwoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Bets`
--

INSERT INTO `Bets` (`BetID`, `BetName`, `BetWager`, `BetDescription`, `UserOneID`, `UserTwoID`) VALUES
(1, 'World Cup', 100.00, 'France vs Croatia ', 3, 1),
(2, '1 one 1 ', 20.00, '1 one 1 basketball game.', 2, 5),
(3, 'Super Bowl', 500.00, 'Kansas City vs San Fransisco', 4, 5),
(4, 'Arm Wrestle', 5.00, 'Bets 2 out of 3', 1, 3),
(5, 'CrossBar Challenge', 50.00, 'Who hits the crossbar first ', 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `BetScores`
--

CREATE TABLE IF NOT EXISTS `BetScores` (
  `BetScoreID` int(11) NOT NULL,
  `BetWins` int(11) DEFAULT NULL,
  `BetLosses` int(11) DEFAULT NULL,
  `BetDraws` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `BetScores`
--

INSERT INTO `BetScores` (`BetScoreID`, `BetWins`, `BetLosses`, `BetDraws`) VALUES
(1, 1, 0, 0),
(2, 0, 1, 0),
(3, 0, 0, 1),
(4, 1, 0, 0),
(5, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  `UserUsername` varchar(100) DEFAULT NULL,
  `UserPassword` varchar(100) DEFAULT NULL,
  `UserCity` varchar(35) DEFAULT NULL,
  `BetScoreID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `UserName`, `UserEmail`, `UserUsername`, `UserPassword`, `UserCity`, `BetScoreID`) VALUES
(1, 'Ivan Di', 'ivandi@email.com', 'ivandi123', '137jdne9283', 'Tokyo', 5),
(2, 'George Lucas', 'georgelucas@email.com', 'gorgi', '16forever', 'Seattle', 4),
(3, 'Sartaj Jatras', 'sartaji123@email.com', 'mrpinjab', '4636hdhe112', 'Shoreline', 3),
(4, 'Dusan Jatic', 'dusanF1@email.com', 'jaticD', 'dhfj939nf', 'Belgrad', 2),
(5, 'Anna Kukov', 'annkukov@email.com', 'annabanana', '74hfh833', 'Moscow', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Bets`
--
ALTER TABLE `Bets`
  ADD PRIMARY KEY (`BetID`),
  ADD KEY `UserOneID` (`UserOneID`),
  ADD KEY `UserTwoID` (`UserTwoID`);

--
-- Indexes for table `BetScores`
--
ALTER TABLE `BetScores`
  ADD PRIMARY KEY (`BetScoreID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserUsername` (`UserUsername`),
  ADD KEY `BetScoreID` (`BetScoreID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Bets`
--
ALTER TABLE `Bets`
  ADD CONSTRAINT `Bets_ibfk_1` FOREIGN KEY (`UserOneID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `Bets_ibfk_2` FOREIGN KEY (`UserTwoID`) REFERENCES `Users` (`UserID`);

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`BetScoreID`) REFERENCES `BetScores` (`BetScoreID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
