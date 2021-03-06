-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 14, 2017 at 02:50 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `id` int(11) NOT NULL,
  `login_name` varchar(20) NOT NULL,
  `login_password` varchar(100) NOT NULL,
  `display_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `admin_info`:
--

-- --------------------------------------------------------

--
-- Table structure for table `hotel_info`
--

CREATE TABLE `hotel_info` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `hotel_info`:
--

-- --------------------------------------------------------

--
-- Table structure for table `photo_gallery`
--

CREATE TABLE `photo_gallery` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `photo_url` varchar(100) DEFAULT '',
  `photo_title` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `photo_gallery`:
--   `hotel_id`
--       `hotel_info` -> `id`
--   `hotel_id`
--       `hotel_info` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `booked_date` datetime NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_till` date DEFAULT NULL,
  `room_id` int(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `special_service` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `reservation`:
--   `room_id`
--       `room` -> `id`
--   `user_id`
--       `user_info` -> `id`
--   `room_id`
--       `room` -> `id`
--   `user_id`
--       `user_info` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `floor` int(2) DEFAULT NULL,
  `room_number` int(5) DEFAULT '0',
  `room_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `room`:
--   `room_type_id`
--       `room_type` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `room_calendar`
--

CREATE TABLE `room_calendar` (
  `id` int(11) NOT NULL,
  `discount_date` date DEFAULT NULL,
  `promotion_percentage` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `room_calendar`:
--

-- --------------------------------------------------------

--
-- Table structure for table `room_exception`
--

CREATE TABLE `room_exception` (
  `id` int(11) NOT NULL,
  `on_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notes` varchar(100) DEFAULT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `room_exception`:
--   `room_id`
--       `room` -> `id`
--   `user_id`
--       `user_info` -> `id`
--   `user_id`
--       `user_info` -> `id`
--   `room_id`
--       `room` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `room_service`
--

CREATE TABLE `room_service` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `room_service`:
--   `room_id`
--       `room` -> `id`
--   `service_id`
--       `service` -> `id`
--   `room_id`
--       `room` -> `id`
--   `service_id`
--       `service` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT '""',
  `rate` decimal(3,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `room_type`:
--

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `service`:
--

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT '',
  `last_name` varchar(20) DEFAULT '',
  `user_address` varchar(50) DEFAULT '',
  `contact_number` varchar(20) DEFAULT '000-000-0000',
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(120) DEFAULT '',
  `password` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `user_info`:
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_info`
--
ALTER TABLE `hotel_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photo_gallery`
--
ALTER TABLE `photo_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_room_room_type_id` (`room_type_id`);

--
-- Indexes for table `room_calendar`
--
ALTER TABLE `room_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_exception`
--
ALTER TABLE `room_exception`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `room_service`
--
ALTER TABLE `room_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`) USING BTREE,
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hotel_info`
--
ALTER TABLE `hotel_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `photo_gallery`
--
ALTER TABLE `photo_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `reservation` ADD STATUS CHAR(2);
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `room_calendar`
--
ALTER TABLE `room_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `room_exception`
--
ALTER TABLE `room_exception`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `room_service`
--
ALTER TABLE `room_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `photo_gallery`
--
ALTER TABLE `photo_gallery`
  ADD CONSTRAINT `photo_gallery_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel_info` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`);

--
-- Constraints for table `room_exception`
--
ALTER TABLE `room_exception`
  ADD CONSTRAINT `room_exception_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`),
  ADD CONSTRAINT `room_exception_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Constraints for table `room_service`
--
ALTER TABLE `room_service`
  ADD CONSTRAINT `room_service_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  ADD CONSTRAINT `room_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);


ALTER TABLE `room` ADD FOREIGN KEY (`room_type_id`) REFERENCES `hotel_management`.`room_type`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `photo_gallery` CHANGE `photo_url` `photo` BLOB NULL DEFAULT '';

ALTER TABLE `hotel_info` ADD `logo` MEDIUMBLOB NOT NULL AFTER `title`, ADD `contact_number` VARCHAR(100) NOT NULL AFTER `logo`, ADD `email` VARCHAR(100) NOT NULL AFTER `contact_number`, ADD `web_url` VARCHAR(100) NOT NULL AFTER `email`;


/* SAMPLE RECORDS */

CREATE TABLE `room_photo_gallery` (
  `id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `photo` blob,
  `photo_title` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `photo_gallery`
--
ALTER TABLE `room_photo_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `photo_gallery`
--
ALTER TABLE `room_photo_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `photo_gallery`
--
ALTER TABLE `room_photo_gallery`
  ADD CONSTRAINT `room_photo_gallery_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);	


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
