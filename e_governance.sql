-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2014 at 11:27 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `e_governance`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_type`
--

CREATE TABLE IF NOT EXISTS `access_type` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `access_type_id` int(11) NOT NULL,
  PRIMARY KEY (`access_id`),
  KEY `type_id` (`type_id`),
  KEY `acess_type_id` (`access_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `access_type`
--

INSERT INTO `access_type` (`access_id`, `type_id`, `access_type_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 4),
(7, 3, 5),
(8, 4, 4),
(9, 4, 1),
(10, 4, 5),
(11, 5, 5),
(12, 5, 1),
(13, 5, 3),
(14, 5, 4),
(15, 6, 6),
(16, 6, 1),
(17, 6, 2),
(18, 6, 3),
(19, 6, 4),
(20, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `banking`
--

CREATE TABLE IF NOT EXISTS `banking` (
  `banking_id` int(11) NOT NULL AUTO_INCREMENT,
  `national_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `add_bank_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`banking_id`),
  KEY `national_id` (`national_id`),
  KEY `organization_id` (`organization_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `banking`
--

INSERT INTO `banking` (`banking_id`, `national_id`, `organization_id`, `add_bank_date`) VALUES
(1, 1993001001, 3, '2014-12-01 13:41:48'),
(2, 1993001001, 4, '2014-12-01 13:48:27'),
(4, 1986001001, 3, '2014-12-08 07:12:18'),
(5, 1993001003, 4, '2014-12-08 07:17:34'),
(6, 1992001001, 4, '2014-12-08 07:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `citizen`
--

CREATE TABLE IF NOT EXISTS `citizen` (
  `national_id` int(20) NOT NULL,
  `name_en` varchar(250) NOT NULL,
  `name_bn` varchar(250) CHARACTER SET utf8 NOT NULL,
  `father` varchar(250) DEFAULT NULL,
  `mother` varchar(250) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `birth_place` varchar(250) NOT NULL,
  `blood_group` varchar(20) DEFAULT NULL,
  `religion` varchar(250) DEFAULT NULL,
  `present_address` varchar(500) NOT NULL,
  `permanent_address` varchar(500) DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`national_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `citizen`
--

INSERT INTO `citizen` (`national_id`, `name_en`, `name_bn`, `father`, `mother`, `date_of_birth`, `birth_place`, `blood_group`, `religion`, `present_address`, `permanent_address`, `date_of_death`, `create_date`, `update_date`) VALUES
(1954004001, 'Zakaria Faruq', 'faruq', 'Mukhles Udiin Ahmed', 'Suraiya Begum', '1954-01-01', 'Barisal', 'B+', 'Islam', 'Gopibag', 'Gopibag', NULL, '2014-12-08 07:09:38', NULL),
(1986001001, 'Tazkirut Tahleel Proteety', 'proteety', 'Zakaria Faruq', 'Kamrun Naher', '1986-07-13', 'Dhaka', 'A+', 'Islam', 'Gopibag', 'Gopibag', NULL, '2014-12-08 07:02:15', NULL),
(1989001001, 'Tasdiq Bil Jinan Promitee', 'Promitee', 'A.Q.M. Qibriya ', 'Rukhsana Begum', '1989-09-18', 'Dhaka', 'o+', 'Islam', 'Lalmatia,Dhaka', 'Gopibag', NULL, '2014-12-08 07:05:31', '2014-12-08 07:06:39'),
(1992001001, 'Md. Abu Shahriar Ratul', 'ratul', '', '', '1992-10-27', 'Dhaka', 'o+', 'Islam', 'Sylhet', 'Manikgonj', NULL, '2014-12-01 10:14:08', '2014-12-08 07:06:46'),
(1993001001, 'Tazbeea Tazakka', 'তাজবীয়া তাজাক্কা', 'Zakaria Faruq', 'Kamrun Naher', '1993-03-31', 'Dhaka', 'B+', 'Islam', 'Gopibag', 'Gopibag', NULL, '2014-12-01 09:33:20', '2014-12-01 09:38:34'),
(1993001002, 'Tazbeea Tazakka', 'à¦¤à¦¾à¦?à¦¬à§?à§?à¦¾ à¦¤à¦¾à¦?à¦¾à¦?à§?à¦?à¦¾', 'Zakaria Faruq', 'Kamrun Naher', '1993-03-31', 'Dhaka', 'B+', 'Islam', 'Gopibag', 'Gopibag', NULL, '2014-12-01 09:40:24', NULL),
(1993001003, 'Iqrar Bil Lisan Shosmit', 'Shosmit', 'A.Q.M. Qibriya ', 'Rukhsana Begum', '1993-06-20', 'Dhaka', 'AB+', 'Islam', 'Lalmatia,Dhaka', 'Gopibag,Dhaka', NULL, '2014-12-08 07:08:06', NULL),
(2001009001, 'Rahim', 'rahim', 'Karim', 'Rahima', '2001-01-01', 'Tangail', 'A+', 'Islam', 'Sylhet', 'Sylhet', NULL, '2014-12-01 10:20:56', NULL),
(2014003001, 'Md Abu Shahriar Ratul', 'Md Abu Shahriar Ratul', 'ABC', 'ABC', '2014-12-10', 'Chittagong', 'A+', 'Islam', '6600 NE 78th Ct. B4,Suite 89903', '6600 NE 78th Ct. B4,Suite 89903', NULL, '2014-12-12 21:28:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `criminal`
--

CREATE TABLE IF NOT EXISTS `criminal` (
  `criminal_id` int(11) NOT NULL AUTO_INCREMENT,
  `national_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `add_crime_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`criminal_id`),
  KEY `national_id` (`national_id`,`organization_id`),
  KEY `organization_id` (`organization_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `criminal`
--

INSERT INTO `criminal` (`criminal_id`, `national_id`, `organization_id`, `date`, `description`, `add_crime_date`) VALUES
(1, 1993001002, 5, '2014-12-04', 'Churi', '2014-12-02 21:53:57'),
(2, 2001009001, 11, '2014-01-23', 'Killing 1 person', '2014-12-08 07:25:14'),
(3, 1993001001, 5, '2014-12-11', 'churi', '2014-12-11 14:16:01');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE IF NOT EXISTS `education` (
  `education_id` int(11) NOT NULL AUTO_INCREMENT,
  `national_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `exam_name` varchar(20) NOT NULL,
  `year` int(11) NOT NULL,
  `board` varchar(20) NOT NULL,
  `cgpa` double NOT NULL,
  `add_edu_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`education_id`),
  KEY `national_id` (`national_id`),
  KEY `organization_id` (`organization_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`education_id`, `national_id`, `organization_id`, `exam_name`, `year`, `board`, `cgpa`, `add_edu_date`) VALUES
(1, 1993001002, 1, 'ssc', 2008, 'Dhaka', 4.8, '2014-12-01 17:01:31'),
(2, 1986001001, 1, 'ssc', 2001, 'dhaka', 4.5, '2014-12-08 08:00:11'),
(3, 1986001001, 1, 'hsc', 2003, 'dhaka', 3.26, '2014-12-08 08:11:09'),
(4, 1993001001, 1, 'hsc', 2010, 'dhaka', 5, '2014-12-08 08:12:25'),
(5, 1992001001, 2, 'ssc', 2008, 'dhaka', 5, '2014-12-08 08:13:30'),
(6, 1992001001, 2, 'hsc', 2010, 'dhaka', 5, '2014-12-08 08:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `national_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `joining_date` date NOT NULL,
  `leaving_date` date DEFAULT NULL,
  `post` varchar(250) NOT NULL,
  `add_job_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`job_id`),
  KEY `national_id` (`national_id`),
  KEY `organization_id` (`organization_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`job_id`, `national_id`, `organization_id`, `joining_date`, `leaving_date`, `post`, `add_job_date`) VALUES
(1, 1992001001, 9, '2014-12-04', '2014-12-06', 'Software Developer', '2014-12-02 22:07:44'),
(2, 1993001003, 9, '2013-03-01', '2014-03-01', 'Teacher', '2014-12-08 08:20:12'),
(3, 1986001001, 12, '2012-02-15', '2013-12-31', 'Assistant Officer', '2014-12-08 08:21:09'),
(4, 1993001001, 9, '2014-12-11', '2014-12-11', 'SQA', '2014-12-11 14:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `medical`
--

CREATE TABLE IF NOT EXISTS `medical` (
  `medical_id` int(11) NOT NULL AUTO_INCREMENT,
  `national_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `add_medical_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`medical_id`),
  KEY `national_id` (`national_id`,`organization_id`),
  KEY `organization_id` (`organization_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `medical`
--

INSERT INTO `medical` (`medical_id`, `national_id`, `organization_id`, `date`, `description`, `add_medical_date`) VALUES
(1, 2001009001, 6, '2014-11-30', 'medical information test', '2014-12-02 07:07:15'),
(2, 1954004001, 6, '2013-11-23', 'Operation ', '2014-12-08 08:24:14'),
(3, 1993001003, 7, '1996-01-01', 'testestest', '2014-12-08 08:25:24'),
(4, 1993001001, 6, '2014-12-11', 'hat vangcce', '2014-12-11 14:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE IF NOT EXISTS `organization` (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `organization_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`organization_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`organization_id`, `type_id`, `organization_name`, `email`, `password`) VALUES
(1, 1, 'A School', 'a@a.com', 'a'),
(2, 1, 'B School', 'b@b.com', 'b'),
(3, 2, 'P Bank', 'p@p.com', 'p'),
(4, 2, 'Q Bank', 'q@q.com', 'q'),
(5, 3, 'Dhanmondi Thana', 'police@police.com', 'police'),
(6, 4, 'X Medical', 'x@x.com', 'x'),
(7, 4, 'Y Medical', 'y@y.com', 'y'),
(9, 5, 'A School', 'a@job.com', 'a'),
(10, 6, 'admin', 'gov@gov.com', 'gov'),
(11, 3, 'Ramna Thana', 'ramna@ramna.com', 'ramna'),
(12, 5, 'P Bank', 'p@job.com', 'p');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(250) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`) VALUES
(1, 'educational institute'),
(2, 'bank'),
(3, 'criminal'),
(4, 'medical'),
(5, 'job'),
(6, 'government');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_type`
--
ALTER TABLE `access_type`
  ADD CONSTRAINT `type_access_type_fk1` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `type_access_type_fk2` FOREIGN KEY (`access_type_id`) REFERENCES `type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `banking`
--
ALTER TABLE `banking`
  ADD CONSTRAINT `citizen_banking_fk` FOREIGN KEY (`national_id`) REFERENCES `citizen` (`national_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `organization_banking_fk` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `criminal`
--
ALTER TABLE `criminal`
  ADD CONSTRAINT `national_id_fk` FOREIGN KEY (`national_id`) REFERENCES `citizen` (`national_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `organization_id_fk` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `citizen_education_fk` FOREIGN KEY (`national_id`) REFERENCES `citizen` (`national_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `organization_education_fk` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `citizen_job_fk` FOREIGN KEY (`national_id`) REFERENCES `citizen` (`national_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `organization_job_fk` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medical`
--
ALTER TABLE `medical`
  ADD CONSTRAINT `medical_national_id_fk` FOREIGN KEY (`national_id`) REFERENCES `citizen` (`national_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medical_organization_id_fk` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organization`
--
ALTER TABLE `organization`
  ADD CONSTRAINT `type_organization_fk` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
