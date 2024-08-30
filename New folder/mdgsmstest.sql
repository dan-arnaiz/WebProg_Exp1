-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 30, 2024 at 12:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mdgsms`
--

-- --------------------------------------------------------

--
-- Table structure for table `academicyear`
--

CREATE TABLE `academicyear` (
  `AcademicYearId` int(11) NOT NULL,
  `Year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressId` int(11) NOT NULL,
  `PersonId` int(11) DEFAULT NULL,
  `HouseNum` int(11) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `Barangay` varchar(100) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Province` varchar(100) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addressperson`
--

CREATE TABLE `addressperson` (
  `PersonId` int(11) DEFAULT NULL,
  `AddressId` int(11) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `AnnouncementId` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `Title` varchar(300) DEFAULT NULL,
  `Text` text DEFAULT NULL,
  `DatePosted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `ApplicationId` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `EmployeeId` int(11) DEFAULT NULL,
  `ScholarshipId` int(11) DEFAULT NULL,
  `DateFiled` datetime DEFAULT NULL,
  `DateTerminated` datetime DEFAULT NULL,
  `TermId` int(11) DEFAULT NULL,
  `Current` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatroom`
--

CREATE TABLE `chatroom` (
  `ChatRoomId` int(11) NOT NULL,
  `Name` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatuser`
--

CREATE TABLE `chatuser` (
  `ChatRoomId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `DateOpened` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contactnum`
--

CREATE TABLE `contactnum` (
  `ContactNumId` int(11) NOT NULL,
  `PersonId` int(11) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Title` char(15) DEFAULT NULL,
  `Numbers` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeId` int(11) NOT NULL,
  `PersonId` int(11) DEFAULT NULL,
  `JobTitleId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filereq`
--

CREATE TABLE `filereq` (
  `FileReqId` int(11) NOT NULL,
  `ApplicationId` int(11) DEFAULT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Submitted` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobtitle`
--

CREATE TABLE `jobtitle` (
  `JobTitleId` int(11) NOT NULL,
  `EmployeeId` int(11) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `MessageId` int(11) NOT NULL,
  `ChatRoomId` int(11) DEFAULT NULL,
  `MessageText` text DEFAULT NULL,
  `Sender` varchar(300) DEFAULT NULL,
  `DateSent` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `ParentId` int(11) NOT NULL,
  `PersonId` int(11) DEFAULT NULL,
  `Occupation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `PersonId` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `Suffix` char(5) DEFAULT NULL,
  `DoB` datetime DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prevschool`
--

CREATE TABLE `prevschool` (
  `PrevSchoolId` int(11) NOT NULL,
  `AddressId` int(11) DEFAULT NULL,
  `ContactNumId` int(11) DEFAULT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(300) DEFAULT NULL,
  `ContactNum` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

CREATE TABLE `relation` (
  `ParentId` int(11) DEFAULT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `Name` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleId` int(11) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scholarship`
--

CREATE TABLE `scholarship` (
  `ScholarshipId` int(11) NOT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `AvailableSlots` tinyint(3) DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scholarshipstatus`
--

CREATE TABLE `scholarshipstatus` (
  `ScholarshipStatusId` int(11) NOT NULL,
  `Name` char(8) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `SemesterId` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentId` int(11) NOT NULL,
  `PersonId` int(11) DEFAULT NULL,
  `SchoolYear` char(10) DEFAULT NULL,
  `PrevSchoolId` int(11) DEFAULT NULL,
  `ScholarshipStatusId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `term`
--

CREATE TABLE `term` (
  `TermId` int(11) NOT NULL,
  `AcademicYearId` int(11) DEFAULT NULL,
  `SemesterId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `UserId` int(11) NOT NULL,
  `PersonId` int(11) DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Salt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academicyear`
--
ALTER TABLE `academicyear`
  ADD PRIMARY KEY (`AcademicYearId`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressId`),
  ADD KEY `PersonId` (`PersonId`);

--
-- Indexes for table `addressperson`
--
ALTER TABLE `addressperson`
  ADD KEY `PersonId` (`PersonId`),
  ADD KEY `AddressId` (`AddressId`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`AnnouncementId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`ApplicationId`),
  ADD KEY `StudentId` (`StudentId`),
  ADD KEY `EmployeeId` (`EmployeeId`),
  ADD KEY `ScholarshipId` (`ScholarshipId`),
  ADD KEY `TermId` (`TermId`);

--
-- Indexes for table `chatroom`
--
ALTER TABLE `chatroom`
  ADD PRIMARY KEY (`ChatRoomId`);

--
-- Indexes for table `chatuser`
--
ALTER TABLE `chatuser`
  ADD KEY `ChatRoomId` (`ChatRoomId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `contactnum`
--
ALTER TABLE `contactnum`
  ADD PRIMARY KEY (`ContactNumId`),
  ADD KEY `PersonId` (`PersonId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeId`),
  ADD KEY `PersonId` (`PersonId`),
  ADD KEY `JobTitleId` (`JobTitleId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `filereq`
--
ALTER TABLE `filereq`
  ADD PRIMARY KEY (`FileReqId`),
  ADD KEY `ApplicationId` (`ApplicationId`);

--
-- Indexes for table `jobtitle`
--
ALTER TABLE `jobtitle`
  ADD PRIMARY KEY (`JobTitleId`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`MessageId`),
  ADD KEY `ChatRoomId` (`ChatRoomId`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`ParentId`),
  ADD KEY `PersonId` (`PersonId`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`PersonId`);

--
-- Indexes for table `prevschool`
--
ALTER TABLE `prevschool`
  ADD PRIMARY KEY (`PrevSchoolId`),
  ADD KEY `AddressId` (`AddressId`),
  ADD KEY `ContactNumId` (`ContactNumId`);

--
-- Indexes for table `relation`
--
ALTER TABLE `relation`
  ADD KEY `ParentId` (`ParentId`),
  ADD KEY `StudentId` (`StudentId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `scholarship`
--
ALTER TABLE `scholarship`
  ADD PRIMARY KEY (`ScholarshipId`);

--
-- Indexes for table `scholarshipstatus`
--
ALTER TABLE `scholarshipstatus`
  ADD PRIMARY KEY (`ScholarshipStatusId`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`SemesterId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentId`),
  ADD KEY `PersonId` (`PersonId`),
  ADD KEY `PrevSchoolId` (`PrevSchoolId`),
  ADD KEY `ScholarshipStatusId` (`ScholarshipStatusId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `term`
--
ALTER TABLE `term`
  ADD PRIMARY KEY (`TermId`),
  ADD KEY `AcademicYearId` (`AcademicYearId`),
  ADD KEY `SemesterId` (`SemesterId`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `PersonId` (`PersonId`),
  ADD KEY `RoleId` (`RoleId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`PersonId`) REFERENCES `person` (`PersonId`);

--
-- Constraints for table `addressperson`
--
ALTER TABLE `addressperson`
  ADD CONSTRAINT `addressperson_ibfk_1` FOREIGN KEY (`PersonId`) REFERENCES `person` (`PersonId`),
  ADD CONSTRAINT `addressperson_ibfk_2` FOREIGN KEY (`AddressId`) REFERENCES `address` (`AddressId`);

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user_account` (`UserId`);

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`),
  ADD CONSTRAINT `application_ibfk_2` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`EmployeeId`),
  ADD CONSTRAINT `application_ibfk_3` FOREIGN KEY (`ScholarshipId`) REFERENCES `scholarship` (`ScholarshipId`),
  ADD CONSTRAINT `application_ibfk_4` FOREIGN KEY (`TermId`) REFERENCES `term` (`TermId`);

--
-- Constraints for table `chatuser`
--
ALTER TABLE `chatuser`
  ADD CONSTRAINT `chatuser_ibfk_1` FOREIGN KEY (`ChatRoomId`) REFERENCES `chatroom` (`ChatRoomId`),
  ADD CONSTRAINT `chatuser_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `user_account` (`UserId`);

--
-- Constraints for table `contactnum`
--
ALTER TABLE `contactnum`
  ADD CONSTRAINT `contactnum_ibfk_1` FOREIGN KEY (`PersonId`) REFERENCES `person` (`PersonId`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`PersonId`) REFERENCES `person` (`PersonId`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`JobTitleId`) REFERENCES `jobtitle` (`JobTitleId`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `user_account` (`UserId`);

--
-- Constraints for table `filereq`
--
ALTER TABLE `filereq`
  ADD CONSTRAINT `filereq_ibfk_1` FOREIGN KEY (`ApplicationId`) REFERENCES `application` (`ApplicationId`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`ChatRoomId`) REFERENCES `chatroom` (`ChatRoomId`);

--
-- Constraints for table `parent`
--
ALTER TABLE `parent`
  ADD CONSTRAINT `parent_ibfk_1` FOREIGN KEY (`PersonId`) REFERENCES `person` (`PersonId`);

--
-- Constraints for table `prevschool`
--
ALTER TABLE `prevschool`
  ADD CONSTRAINT `prevschool_ibfk_1` FOREIGN KEY (`AddressId`) REFERENCES `address` (`AddressId`),
  ADD CONSTRAINT `prevschool_ibfk_2` FOREIGN KEY (`ContactNumId`) REFERENCES `contactnum` (`ContactNumId`);

--
-- Constraints for table `relation`
--
ALTER TABLE `relation`
  ADD CONSTRAINT `relation_ibfk_1` FOREIGN KEY (`ParentId`) REFERENCES `parent` (`ParentId`),
  ADD CONSTRAINT `relation_ibfk_2` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`PersonId`) REFERENCES `person` (`PersonId`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`PrevSchoolId`) REFERENCES `prevschool` (`PrevSchoolId`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`ScholarshipStatusId`) REFERENCES `scholarshipstatus` (`ScholarshipStatusId`),
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`UserId`) REFERENCES `user_account` (`UserId`);

--
-- Constraints for table `term`
--
ALTER TABLE `term`
  ADD CONSTRAINT `term_ibfk_1` FOREIGN KEY (`AcademicYearId`) REFERENCES `academicyear` (`AcademicYearId`),
  ADD CONSTRAINT `term_ibfk_2` FOREIGN KEY (`SemesterId`) REFERENCES `semester` (`SemesterId`);

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`PersonId`) REFERENCES `person` (`PersonId`),
  ADD CONSTRAINT `user_account_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `role` (`RoleId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
