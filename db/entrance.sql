-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2024 at 10:52 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `entrance`
--
CREATE DATABASE IF NOT EXISTS `entrance` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `entrance`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `time`) VALUES
(1, 'Mathematics', 5),
(2, 'English', 5);

-- --------------------------------------------------------

--
-- Table structure for table `choice`
--

CREATE TABLE `choice` (
  `id` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  `choice` varchar(50) NOT NULL,
  `answer` varchar(50) NOT NULL,
  `file` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `choice`
--

INSERT INTO `choice` (`id`, `questionid`, `choice`, `answer`, `file`) VALUES
(1, 1, 'yes', '6', NULL),
(2, 1, 'no', '3', NULL),
(3, 1, 'no', '5', NULL),
(4, 1, 'no', '7', NULL),
(5, 2, 'yes', 'A noun is a naming word', NULL),
(6, 2, 'no', 'A noun is another name for pronoun', NULL),
(7, 2, 'no', 'Nothing like noun', NULL),
(8, 2, 'no', 'Non of the above', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `coursecode` varchar(100) NOT NULL,
  `coursename` varchar(255) NOT NULL,
  `passing_score` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `coursecode`, `coursename`, `passing_score`) VALUES
(1, 'SS1 A', 'SS1 A', '45');

-- --------------------------------------------------------

--
-- Table structure for table `exam_sched`
--

CREATE TABLE `exam_sched` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` varchar(15) NOT NULL,
  `end_time` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_sched`
--

INSERT INTO `exam_sched` (`id`, `description`, `start_date`, `end_date`, `start_time`, `end_time`) VALUES
(1, 'Mathematics exam', '2024-01-08', '2024-01-12', '10:00', '11:00');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `file` text,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `content`, `file`, `category_id`) VALUES
(1, '<p>What is the square root of 36</p>\r\n', NULL, 1),
(2, '<p>What is a noun</p>\r\n', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `stud_id` varchar(50) NOT NULL,
  `score` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `category_id`, `stud_id`, `score`, `total`, `date`) VALUES
(1, 1, '2020123', 1, 1, '2024-01-10 10:23:16');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `id` int(11) NOT NULL,
  `mobileno` varchar(45) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `stud_id` varchar(50) NOT NULL,
  `question_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `has_quiz` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `stud_id`, `question_id`, `category_id`, `choice_id`, `has_quiz`) VALUES
(1, '2020123', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `studid` varchar(50) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `mobileno` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `graduated` date DEFAULT NULL,
  `last_school` varchar(100) DEFAULT NULL,
  `pref_course` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `studid`, `fname`, `lname`, `gender`, `mobileno`, `email`, `address`, `birthdate`, `graduated`, `last_school`, `pref_course`, `user_id`) VALUES
(1, '2020123', 'Chidubem', 'Uzochukwu', 'Male', '08160417161', 'emperor@gmail.com', 'Lagos', '2024-01-10', '2024-01-09', 'Ansu', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `str_password` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobileno` varchar(45) NOT NULL,
  `level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`id`, `username`, `password`, `str_password`, `fname`, `lname`, `email`, `mobileno`, `level`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin', 'Admin', 'Admin', 'sample@email.com', '12345678910', 'Admin'),
(2, 'dubem', '23ccb71c8f0dd207a9d65a4c0ab0dc1dec344c39', 'dubem', 'Chidubem', 'Uzochukwu', 'emperor@gmail.com', '08160417161', 'Student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `choice`
--
ALTER TABLE `choice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_choices_1` (`questionid`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_sched`
--
ALTER TABLE `exam_sched`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_question_1` (`category_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_result_1` (`stud_id`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_student_1` (`pref_course`),
  ADD KEY `FK_student_2` (`user_id`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `choice`
--
ALTER TABLE `choice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_sched`
--
ALTER TABLE `exam_sched`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `choice`
--
ALTER TABLE `choice`
  ADD CONSTRAINT `FK_choices_1` FOREIGN KEY (`questionid`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_question_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK_student_1` FOREIGN KEY (`pref_course`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_student_2` FOREIGN KEY (`user_id`) REFERENCES `userdata` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
