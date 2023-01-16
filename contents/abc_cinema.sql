-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2023 at 11:20 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abc_cinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` varchar(30) NOT NULL,
  `t_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`c_id`, `name`, `mobile`, `email`) VALUES
(1000, 'Lakmal', '0761111112', 'lakmal@gmail.com'),
(2002, 'Ruwan', '0743023917', 'ruwan@ymail.com'),
(2003, 'Sakuni', '0752067498', 'sakunipeiris@gmail.com'),
(2004, 'Amaya', '0719856296', 'amayarajapakha@gmail.com'),
(2005, 'Saman', '0742391056', 'saman12@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `name`, `email`, `password`) VALUES
(1, 'Glen', 'glenaddams@gmail.com', '3a2c8e8c4b2402af9ba46c67133fbfba'),
(2, 'Max', 'maxpayne@gmail.com', 'e375cd3995cd42118077cd582306e2ac'),
(3, 'Jeff', 'jeffbezos@gmail.com', '27081e6ee295f54082c992439f176153'),
(104, 'John', 'johnbayer@gmail.com', 'ef350e23b7e32416f10d5b9032534461'),
(105, 'Saman', 'samanpeiris@gmail.com', 'e679d02cbdd4460405ac9ff70917511d'),
(106, 'Peter', 'peterpan@gmail.com', 'a723081f761176d36e9798ba263ec73a'),
(107, 'Jeff', 'johnbayer@gmail.com', 'f95e7b7ff02cc8b3620abf4a41644fc3');

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `update_staff_emp_id` AFTER INSERT ON `employee` FOR EACH ROW BEGIN
    UPDATE staff SET emp_id = NEW.emp_id 
    WHERE emp_id = NEW.emp_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `message` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `Name`, `email`, `message`) VALUES
(5, 'Senith Edirisingha', 'senith@gmail.com', 'The temperature of the A/C is quite low. It\'d be great of you could increase it a bit more'),
(6, 'Ben Addams', 'benaddams@gmail.com', 'The movie was great!'),
(7, 'Jagatha Perera', 'jagathperera@gmail.com', 'Bad movie'),
(9, 'Susil', 'susilprem@ymail.com', 'I watched Spider Man NWH , Jurassic world dominion, Doctor Strange MOM  and Black Panther 2 WAKANDA Forever in here. Overall good experience. Since this hall is right next to the road, you don\'t have much space to wait until movie starts if the theater is going to be full for a movie. But theater it self is good. Good video quality. They don\'t start the movie at the given time that is the *worst problem* in here!'),
(10, 'Sunil', 'sunilshantha@ymail.com', 'The food was great in the canteen. Adding two cashiers will reduce the queue. '),
(11, 'Surya', 'surya@ymail.com', 'Great place with nice environment');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`emp_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `m_id` int(11) NOT NULL,
  `m_name` varchar(256) NOT NULL,
  `m_language` varchar(256) NOT NULL,
  `genre` varchar(256) NOT NULL,
  `runtime` time NOT NULL,
  `description` varchar(500) NOT NULL,
  `trailer_link` varchar(500) NOT NULL,
  `m_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`m_id`, `m_name`, `m_language`, `genre`, `runtime`, `description`, `trailer_link`, `m_status`) VALUES
(1, 'BLACK PANTHER: WAKANDA FOREVER', 'English', 'Action', '01:40:00', 'BLACK PANTHER: WAKANDA FOREVERBLACK PANTHER: WAKANDA FOREVERBLACK PANTHER: WAKANDA FOREVERBLACK PANTHER: WAKANDA FOREVERBLACK PANTHER: WAKANDA FOREVERBLACK PANTHER: WAKANDA FOREVER', 'https://www.youtube.com/watch?v=xgZLXyqbYOc', 0),
(2, 'BLACK ADAM', 'English', 'Action', '01:40:00', 'BLACK ADAMBLACK ADAMBLACK ADAMBLACK ADAMBLACK ADAMBLACK ADAMBLACK ADAMBLACK ADAMBLACK ADAM', 'https://www.youtube.com/watch?v=xgZLXyqbYOc', 0),
(3, 'TOP GUN: MAVERTICK', 'ENGLISH', 'ACTION | DRAMA', '01:40:00', 'TOP GUN: MAVERTICKTOP GUN: MAVERTICKTOP GUN: MAVERTICKTOP GUN: MAVERTICKTOP GUN: MAVERTICKTOP GUN: MAVERTICK', 'https://www.youtube.com/watch?v=xgZLXyqbYOc', 0),
(4, 'JURASSIC WORLD:DOMINION', 'English', 'Action | Adventure', '03:12:00', 'TOP GUN:MAVERICKTOP GUN:MAVERICKTOP GUN:MAVERICKTOP GUN:MAVERICKTOP GUN:MAVERICKTOP GUN:MAVERICKTOP GUN:MAVERICK', 'https://www.youtube.com/watch?v=d9MyW72ELq0', 1),
(5, 'K.G.F CHAPTER 2', 'Tamil', 'Action', '02:34:00', 'K.G.F CHAPTER 2K.G.F CHAPTER 2K.G.F CHAPTER 2K.G.F CHAPTER 2K.G.F CHAPTER 2K.G.F CHAPTER 2', 'https://www.youtube.com/video?K.G.F CHAPTER 2', 1),
(6, 'AVATAR:THE WAY OF WATER', 'TAMIL', 'ACTION', '01:56:00', 'AVATAR:THE WAY OF WATERAVATAR:THE WAY OF WATERAVATAR:THE WAY OF WATERAVATAR:THE WAY OF WATERAVATAR:THE WAY OF WATER', 'AVATAR:THE WAY OF WATERAVATAR:THE WAY OF WATERAVATAR:THE WAY OF WATER', 1),
(7, 'AVATAR: THE WAY OF WATER', 'ENGLISH', 'ACTION', '03:12:00', 'AVATAR: THE WAY OF WATERAVATAR: THE WAY OF WATERAVATAR: THE WAY OF WATER', 'AVATAR: THE WAY OF WATERAVATAR: THE WAY OF WATER', 0),
(8, 'DEVOTION', 'ENGLISH', 'ACTION', '02:34:00', 'DEVOTION DEVOTION DEVOTION DEVOTION ', 'DEVOTION DEVOTIONDEVOTION DEVOTION ', 0),
(9, 'PUSS IN BOOTS:THE LAST WISH', 'ENGLISH', 'ACTION | DRAMA', '01:40:00', 'PUSS IN BOOTS:THE LAST WISH', 'PUSS IN BOOTS:THE LAST WISH', 0),
(10, 'SHOTGUN WEDDING', 'ENGLISH', 'ACTION', '01:40:00', 'SHOTGUN WEDDINGSHOTGUN WEDDING', 'SHOTGUN WEDDINGSHOTGUN WEDDING', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`pay_id`, `total_amount`, `c_id`) VALUES
(1, 1000, 1000),
(2, 1500, 2003),
(3, 800, 1000),
(4, 1600, 2004),
(5, 8000, 2002),
(6, 16000, 2003);

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `seat_no` varchar(5) NOT NULL,
  `seat_status` varchar(15) DEFAULT NULL,
  `date_time` datetime NOT NULL DEFAULT '2023-01-16 10:30:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`seat_no`, `seat_status`, `date_time`) VALUES
('A01', 'available', '2023-01-16 10:30:00'),
('A02', 'available', '2023-01-16 10:30:00'),
('A03', 'available', '2023-01-16 10:30:00'),
('A04', 'available', '2023-01-16 10:30:00'),
('A05', 'available', '2023-01-16 10:30:00'),
('A06', 'available', '2023-01-16 10:30:00'),
('A07', 'available', '2023-01-16 10:30:00'),
('A08', 'available', '2023-01-16 10:30:00'),
('B01', 'available', '2023-01-16 10:30:00'),
('B02', 'available', '2023-01-16 10:30:00'),
('B03', 'available', '2023-01-16 10:30:00'),
('B04', 'available', '2023-01-16 10:30:00'),
('B05', 'available', '2023-01-16 10:30:00'),
('B06', 'available', '2023-01-16 10:30:00'),
('B07', 'available', '2023-01-16 10:30:00'),
('B08', 'available', '2023-01-16 10:30:00'),
('B09', 'available', '2023-01-16 10:30:00'),
('B10', 'available', '2023-01-16 10:30:00'),
('B11', 'available', '2023-01-16 10:30:00'),
('B12', 'available', '2023-01-16 10:30:00'),
('C01', 'available', '2023-01-16 10:30:00'),
('C02', 'available', '2023-01-16 10:30:00'),
('C03', 'available', '2023-01-16 10:30:00'),
('C04', 'available', '2023-01-16 10:30:00'),
('C05', 'available', '2023-01-16 10:30:00'),
('C06', 'available', '2023-01-16 10:30:00'),
('C07', 'available', '2023-01-16 10:30:00'),
('C08', 'available', '2023-01-16 10:30:00'),
('C09', 'available', '2023-01-16 10:30:00'),
('C10', 'available', '2023-01-16 10:30:00'),
('C11', 'available', '2023-01-16 10:30:00'),
('C12', 'available', '2023-01-16 10:30:00'),
('D01', 'available', '2023-01-16 10:30:00'),
('D02', 'available', '2023-01-16 10:30:00'),
('D03', 'available', '2023-01-16 10:30:00'),
('D04', 'available', '2023-01-16 10:30:00'),
('D05', 'available', '2023-01-16 10:30:00'),
('D06', 'available', '2023-01-16 10:30:00'),
('D07', 'available', '2023-01-16 10:30:00'),
('D08', 'available', '2023-01-16 10:30:00'),
('D09', 'available', '2023-01-16 10:30:00'),
('D10', 'available', '2023-01-16 10:30:00'),
('D11', 'available', '2023-01-16 10:30:00'),
('D12', 'available', '2023-01-16 10:30:00'),
('E01', 'available', '2023-01-16 10:30:00'),
('E02', 'available', '2023-01-16 10:30:00'),
('E03', 'available', '2023-01-16 10:30:00'),
('E04', 'available', '2023-01-16 10:30:00'),
('E05', 'available', '2023-01-16 10:30:00'),
('E06', 'available', '2023-01-16 10:30:00'),
('E07', 'available', '2023-01-16 10:30:00'),
('E08', 'available', '2023-01-16 10:30:00'),
('E09', 'available', '2023-01-16 10:30:00'),
('E10', 'available', '2023-01-16 10:30:00'),
('E11', 'available', '2023-01-16 10:30:00'),
('E12', 'available', '2023-01-16 10:30:00'),
('F01', 'available', '2023-01-16 10:30:00'),
('F02', 'available', '2023-01-16 10:30:00'),
('F03', 'available', '2023-01-16 10:30:00'),
('F04', 'available', '2023-01-16 10:30:00'),
('F05', 'available', '2023-01-16 10:30:00'),
('F06', 'available', '2023-01-16 10:30:00'),
('F07', 'available', '2023-01-16 10:30:00'),
('F08', 'available', '2023-01-16 10:30:00'),
('F09', 'available', '2023-01-16 10:30:00'),
('F10', 'available', '2023-01-16 10:30:00'),
('F11', 'available', '2023-01-16 10:30:00'),
('F12', 'available', '2023-01-16 10:30:00'),
('G01', 'available', '2023-01-16 10:30:00'),
('G02', 'available', '2023-01-16 10:30:00'),
('G03', 'available', '2023-01-16 10:30:00'),
('G04', 'available', '2023-01-16 10:30:00'),
('G05', 'available', '2023-01-16 10:30:00'),
('G06', 'available', '2023-01-16 10:30:00'),
('G07', 'available', '2023-01-16 10:30:00'),
('G08', 'available', '2023-01-16 10:30:00'),
('G09', 'available', '2023-01-16 10:30:00'),
('G10', 'available', '2023-01-16 10:30:00'),
('G11', 'available', '2023-01-16 10:30:00'),
('G12', 'available', '2023-01-16 10:30:00'),
('H01', 'available', '2023-01-16 10:30:00'),
('H02', 'available', '2023-01-16 10:30:00'),
('H03', 'available', '2023-01-16 10:30:00'),
('H04', 'available', '2023-01-16 10:30:00'),
('H05', 'available', '2023-01-16 10:30:00'),
('H06', 'available', '2023-01-16 10:30:00'),
('H07', 'available', '2023-01-16 10:30:00'),
('H08', 'available', '2023-01-16 10:30:00'),
('H09', 'available', '2023-01-16 10:30:00'),
('H10', 'available', '2023-01-16 10:30:00'),
('H11', 'available', '2023-01-16 10:30:00'),
('H12', 'available', '2023-01-16 10:30:00'),
('I01', 'available', '2023-01-16 10:30:00'),
('I02', 'available', '2023-01-16 10:30:00'),
('I03', 'available', '2023-01-16 10:30:00'),
('I04', 'available', '2023-01-16 10:30:00'),
('I05', 'available', '2023-01-16 10:30:00'),
('I06', 'available', '2023-01-16 10:30:00'),
('I07', 'available', '2023-01-16 10:30:00'),
('I08', 'available', '2023-01-16 10:30:00'),
('I09', 'available', '2023-01-16 10:30:00'),
('I10', 'available', '2023-01-16 10:30:00'),
('I11', 'available', '2023-01-16 10:30:00'),
('I12', 'available', '2023-01-16 10:30:00'),
('J01', 'available', '2023-01-16 10:30:00'),
('J02', 'available', '2023-01-16 10:30:00'),
('J03', 'available', '2023-01-16 10:30:00'),
('J04', 'available', '2023-01-16 10:30:00'),
('J05', 'available', '2023-01-16 10:30:00'),
('J06', 'available', '2023-01-16 10:30:00'),
('J07', 'available', '2023-01-16 10:30:00'),
('J08', 'available', '2023-01-16 10:30:00'),
('J09', 'available', '2023-01-16 10:30:00'),
('J10', 'available', '2023-01-16 10:30:00'),
('J11', 'available', '2023-01-16 10:30:00'),
('J12', 'available', '2023-01-16 10:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `date_time` datetime NOT NULL DEFAULT '2023-01-16 10:30:00',
  `m_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`date_time`, `m_id`, `emp_id`) VALUES
('2023-01-16 10:30:00', 2, 3),
('2023-01-23 09:02:06', 4, 3),
('2023-01-27 18:00:00', 5, 3),
('2023-02-06 10:30:00', 2, NULL),
('2023-02-13 09:02:00', 3, 2),
('2023-04-13 10:30:00', 2, NULL),
('2023-08-16 10:30:00', 2, NULL),
('2024-01-01 21:00:00', 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `emp_id` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`emp_id`) VALUES
(2),
(3),
(104),
(105);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `t_id` int(11) NOT NULL,
  `ticket_price` int(11) NOT NULL DEFAULT 1200,
  `seat_no` varchar(5) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`t_id`, `ticket_price`, `seat_no`, `c_id`, `date_time`) VALUES
(0, 800, 'A01', 2004, '2023-01-16 10:30:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `booking_ibfk_1` (`t_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pay_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`seat_no`,`date_time`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`date_time`),
  ADD KEY `m_id` (`m_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`t_id`),
  ADD KEY `fk_ticket_seat` (`seat_no`,`date_time`),
  ADD KEY `c_id` (`c_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2006;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `ticket` (`t_id`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `customer` (`c_id`);

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `movie` (`m_id`),
  ADD CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_seat` FOREIGN KEY (`seat_no`,`date_time`) REFERENCES `seat` (`seat_no`, `date_time`),
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `customer` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
