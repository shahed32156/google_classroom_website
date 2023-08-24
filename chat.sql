-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 10:40 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `created_by`) VALUES
(25, 'GROUP-3', 3);

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`id`, `group_id`, `user_id`) VALUES
(69, 25, 3),
(71, 25, 2),
(72, 25, 5);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(100) NOT NULL,
  `incoming_id` int(100) DEFAULT NULL,
  `outgoing_id` int(100) DEFAULT NULL,
  `message` varchar(10000) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `notify` varchar(10) DEFAULT NULL,
  `seen` varchar(10) DEFAULT NULL,
  `emoji` varchar(10) DEFAULT NULL,
  `groupId` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_id`, `outgoing_id`, `message`, `time`, `type`, `notify`, `seen`, `emoji`, `groupId`) VALUES
(1, 2, 1, 'hi', '09/11/2022, 03:12:51 pm', 'text', 'yes', 'yes', NULL, NULL),
(2, 1, 2, 'hello', '09/11/2022, 03:13:00 pm', 'text', 'yes', 'yes', NULL, NULL),
(3, 1, 2, 'jopss', '09/11/2022, 03:13:04 pm', 'text', 'yes', 'yes', NULL, NULL),
(4, 1, 2, 'wow', '09/11/2022, 03:13:07 pm', 'text', 'yes', 'yes', NULL, NULL),
(5, 1, 2, 'fine', '09/11/2022, 03:13:10 pm', 'text', 'yes', 'yes', NULL, NULL),
(6, 1, 2, 'cool ', '09/11/2022, 03:13:11 pm', 'text', 'yes', 'yes', NULL, NULL),
(7, 1, 2, 'dashing', '09/11/2022, 03:13:13 pm', 'text', 'yes', 'yes', NULL, NULL),
(8, 1, 2, '1662887610219983.png', '09/11/2022, 03:13:30 pm', 'img', 'yes', 'yes', '💖\r\n       ', NULL),
(9, 1, 2, '1662887630AlanWalker_Faded_NCS-38.mp3', '09/11/2022, 03:13:50 pm', 'music', 'yes', 'yes', '💖\r\n       ', NULL),
(10, 2, 1, 'aa', '09/12/2022, 12:37:45 am', 'text', NULL, NULL, NULL, NULL),
(11, 2, 1, '😗😗😗😗😗', '09/12/2022, 12:37:50 am', 'text', NULL, NULL, NULL, NULL),
(12, 2, 1, '1662921478Class_Routine,_Fall_2022,_Regular_Program_(Day).pdf', '09/12/2022, 12:37:58 am', 'file', NULL, NULL, NULL, NULL),
(13, 2, 1, '1663280977download.jpg', '09/16/2022, 04:29:37 am', 'img', NULL, NULL, NULL, NULL),
(14, 2, 1, '123', '09/16/2022, 04:40:56 am', 'text', NULL, NULL, NULL, NULL),
(15, 2, 1, '45', '09/16/2022, 04:41:14 am', 'text', NULL, NULL, NULL, NULL),
(16, 2, 1, '1663281702219983.png', '09/16/2022, 04:41:42 am', 'img', NULL, NULL, NULL, NULL),
(17, 2, 1, 'data:audio/webm;base64,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', '05/16/2023, 06:44:14 pm', 'voice', 'yes', NULL, NULL, NULL),
(19, NULL, 1, 'hi', '05/19/2023, 06:08:22 pm', 'text', NULL, NULL, '🤣\r\n       ', 21),
(20, NULL, 1, 'bye bye', '05/19/2023, 06:22:10 pm', 'text', NULL, NULL, NULL, 21),
(21, NULL, 3, 'what', '05/19/2023, 06:22:14 pm', 'text', NULL, NULL, NULL, 21),
(22, NULL, 2, 'hello', '05/19/2023, 06:22:20 pm', 'text', NULL, NULL, '🤣\r\n       ', 21),
(23, NULL, 2, 'I am john', '05/19/2023, 06:22:25 pm', 'text', NULL, NULL, NULL, 21),
(24, 1, 5, '123', '05/19/2023, 06:35:26 pm', 'text', 'yes', NULL, NULL, NULL),
(25, NULL, 2, 'Hi I am new john', '05/19/2023, 07:21:31 pm', 'text', NULL, NULL, NULL, 21),
(26, NULL, 1, 'sdadsad', '05/19/2023, 07:21:50 pm', 'text', NULL, NULL, NULL, 21),
(27, NULL, 1, '🤣🤣🤣🤣🤣', '05/19/2023, 07:21:57 pm', 'text', NULL, NULL, NULL, 21),
(28, NULL, 1, '1684502705Screenshot_4.png', '05/19/2023, 07:25:05 pm', 'img', NULL, NULL, NULL, 0),
(29, NULL, 1, '1684502765Screenshot_4.png', '05/19/2023, 07:26:05 pm', 'img', NULL, NULL, NULL, 0),
(30, NULL, 1, '1684502928Screenshot_4.png', '05/19/2023, 07:28:48 pm', 'img', NULL, NULL, NULL, 0),
(31, NULL, 1, '1684504223Screenshot_4.png', '05/19/2023, 07:50:23 pm', 'img', NULL, NULL, '', 21),
(32, NULL, 2, '1684504262[DAY]_Bi-Semester_Course_Offer_Final_SPRING_2023_CSE(DAY)(Regular).pdf', '05/19/2023, 07:51:02 pm', 'file', NULL, NULL, NULL, 21),
(33, NULL, 1, 'hi', '05/19/2023, 10:12:28 pm', 'text', NULL, NULL, NULL, 22),
(34, NULL, 1, 'hi', '05/19/2023, 10:15:08 pm', 'text', NULL, NULL, NULL, 23),
(35, NULL, 3, 'hiii', '05/19/2023, 10:15:40 pm', 'text', NULL, NULL, NULL, 25),
(36, NULL, 1, '😂', '05/19/2023, 11:04:01 pm', 'text', NULL, NULL, NULL, 26),
(37, 2, 1, '123', '05/19/2023, 11:04:40 pm', 'text', 'yes', 'yes', NULL, NULL),
(38, 1, 2, '😅😅😅', '05/19/2023, 11:04:52 pm', 'text', 'yes', 'yes', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `typing`
--

CREATE TABLE `typing` (
  `typing_id` int(10) NOT NULL,
  `type_from` int(10) DEFAULT NULL,
  `type_to` int(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `typing`
--

INSERT INTO `typing` (`typing_id`, `type_from`, `type_to`, `type`) VALUES
(1, 1, 2, 'false'),
(2, 2, 1, 'false'),
(3, 1, 0, 'false'),
(4, 3, 0, 'false'),
(5, 2, 0, 'false'),
(6, 5, 1, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(100) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `fname`, `lname`, `email`, `password`, `img`, `status`) VALUES
(1, 'Sidul', 'Moon', 'sidul@gmail.com', '202cb962ac59075b964b07152d234b70', '1662819775219983.png', '5/22/2023, 2:39:51 AM'),
(2, 'John', 'Doe', 'john@gmail.com', '202cb962ac59075b964b07152d234b70', '1662315328download.jpg', '05/19/2023, 11:05:04 pm'),
(3, 'Hello', 'World', 'hello@gmail.com', '202cb962ac59075b964b07152d234b70', '1684267009Screenshot_131.png', '05/19/2023, 11:04:30 pm'),
(4, 'Good', 'Bye', 's@gmail.com', '202cb962ac59075b964b07152d234b70', '1684267031Screenshot_135.png', '05/17/2023, 01:57:13 am'),
(5, 'Lorem', 'Ipsum', 'lorem@gmail.com', '202cb962ac59075b964b07152d234b70', '1684267070Screenshot_136.png', '05/19/2023, 06:35:29 pm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `typing`
--
ALTER TABLE `typing`
  ADD PRIMARY KEY (`typing_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `typing`
--
ALTER TABLE `typing`
  MODIFY `typing_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`uid`);

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
