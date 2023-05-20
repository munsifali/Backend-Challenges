SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` char(6) NOT NULL,
  `employee_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `shift_id` int(1) NOT NULL,
  `location_id` int(1) NOT NULL,
  `in_time` int(11) NOT NULL,
  `in_status` varchar(15) NOT NULL,
  `out_time` int(11) NOT NULL,
  `out_status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`user_id`, `employee_id`, `shift_id`, `location_id`, `in_time`, `in_status`, `out_time`, `out_status`) VALUES
(2 011, 1, 1, 1589178316,  'Late', 1589178477, 'Early'),
(1 011, 1, 1, 1589381121,  'Late', 1589381127, 'Over Time'),
(1, 010, 2, 1, 1589384432,  'Late', 1589384514, 'Over Time'),
(1, 011, 1, 1, 1589391038,  'On Time', 1589391056, 'Early'),
(3 010, 3, 1, 1622553388,  'Late', 1622553470, 'Over Time'),
(2 010, 3, 2, 1631893356,  'Late', 1631893413, 'Over Time'),
(1, 026, 1, 1, 1631894335,  'Late', 1631894403, 'Over Time'),
(2, 011, 1, 2, 1631894692,  'Late', 1631894696, 'Over Time'),
(2, 027, 6, 2, 1631499386,  'Late', 1631529057, 'Early'),
(2, 027, 6, 2, 1631583036,  'Late', 1631611849, 'Early'),
(2, 027, 6, 1, 1631733350,  'Late', 1631797356, 'Early'),
(2, 027, 6, 4, 1631863331,  'Late', 1631896539, 'Early'),
(2, 027, 6, 1, 1631214919,  'Late', 1631250936, 'Over Time'),
(2, 026, 1, 2, 1631493955,  'On Time', 1631523613, 'Over Time'),
(2, 011, 1, 1, 1631584873,  'Late', 1631621603, 'Over Time'),
(2, 027, 6, 2, 1632109417,  'Late', 1632109437, 'Early'),
(2, 002, 2, 3, 1632109840,  'On Time', 1632109845, 'Early'),
(2, 026, 1, 2, 1632109903,  'Late', 1632109905, 'Early');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(12508) NOT NULL,
  `gender` char(1) NOT NULL,
  `birth_date` date NOT NULL,
  `hire_date` date NOT NULL,
  `shift_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`name`, `email`, `gender`, `birth_date`, `hire_date`, `shift_id`) VALUES
('Sadie Kelso', 'devi@gmail.com', 'F',  '1996-06-06', '2020-03-01', 2),
('Elsa', 'intan@gmail.com', 'F', , '1998-02-01', '2020-03-01', 2),
('Robert Northern', 'herman@gmail.com', 'M', '1997-11-06', '2020-03-12', 2),
('Jesse J Walsh', 'andi@gmail.com', 'M', '1998-01-01', '2020-03-01', 3),
('Madeline Mitchell', 'clarita@gmail.com', 'F', '1996-04-06', '2020-04-08', 1),
('Emmy Watts', 'oktapan@gmail.com', 'F','1999-11-04', '2020-04-01', 1),
('Domingo Yorke', 'mgb@gmail.com', 'M', '2000-10-29', '2020-03-01', 2),
('Stephen Fernando', 'weve@gmail.com', 'M', '2000-11-07', '2020-03-01', 1),
('Yvonne J Gunther', 'desi@gmail.com', 'F', '1994-07-05', '2020-04-01', 2),
('Blake Collins', 'ddry@gmail.com', 'M', '2000-12-01', '2020-04-06', 3),
('Marcus', 'udin@gmail.com', 'M', '1993-10-12', '2020-05-03', 1),
('Vernon Keely', '123@fmail.com', 'M', '2001-12-31', '2020-04-28', 1),
('Admin ', 'admin@admin.com', 'M',  '0000-00-00', '0000-00-00', 0),
('Christine', 'christine@gmail.com', 'F',  '1995-04-01', '2021-05-16', 1),
('Johnny', 'johnny@mail.com', 'M', '1993-04-01', '2021-08-13', 6);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` INT(11) NOT NULL AUTO_INCREMENT,
  `employee_id` INT(11)  NOT NULL,
  `location_id` SMALLINT(5) NOT NULL,
  `shift_id` SMALLINT(5) NOT NULL,
  `schedule_date` DATE NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `schedules_employee_id_index` (`employee_id`),
  KEY `schedules_location_id_index` (`location_id`),
  KEY `schedules_shift_id_index` (`shift_id`),
  CONSTRAINT `schedules_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `schedules_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`),
  CONSTRAINT `schedules_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`shift_id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Table structure for table `attendance_faults`
--

CREATE TABLE `attendance_faults` (
  `attendance_fault_id` INT(11) NOT NULL AUTO_INCREMENT,
  `attendance_id` INT(11) NOT NULL,
  `employee_id` INT(11) NOT NULL,
  `attendance_fault_destination` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`attendance_fault_id`),
  KEY `attendance_faults_attendance_id_index` (`attendance_id`),
  KEY `attendance_faults_employee_id_index` (`employee_id`),
  CONSTRAINT `attendance_faults_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`attendance_id`),
  CONSTRAINT `attendance_faults_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;


----------------------------------------------------------
--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`) VALUES
(1, 'Home'),
(2, 'Office'),
(3, 'Store'),
(4, 'Site'),
(6, 'Field');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id` int(1) NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id`, `start`, `end`) VALUES
(1, '08:00:00', '16:00:00'),
(2, '13:00:00', '21:00:00'),
(3, '18:00:00', '02:00:00'),
(4, '03:15:02', '02:05:05'),
(5, '07:00:00', '18:25:00'),
(6, '01:00:00', '12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `employee_id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `role_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `employee_id`, `role_id`) VALUES
('ACD002', '$2y$10$5nv5ehyMVdljfKJ6izsOqOimsbv.cbzU.XLB9ji9zbA.eICdSrNvO', 002, 2),
('ADM011', '$2y$10$BKpQcs4XKavCcYdFWujzx.Xqb7r9eNkDrOYss2VNXrMJUUpm1agUC', 011, 2),
('admin', '$2y$10$7rLSvRVyTQORapkDOqmkhetjF6H9lJHngr4hJMSM2lHObJbW5EQh6',  025, 1),
('HRD001', '$2y$10$7rLSvRVyTQORapkDOqmkhetjF6H9lJHngr4hJMSM2lHObJbW5EQh6', 001, 3),
('STD008', '$2y$10$8PGnFaiZPYtcIGrwzMmVZuNKbUb/A88f0NZOA9QVgHaUIJ6ddg.Si', 008, 2),
('STD026', '$2y$10$8WNMvEEgNPWyRuSeeLDE1uXwnBkYNJE/heLT1zWbsUfYb/wKFyYIy', 026, 2);

-- --------------------------------------------------------


--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(1) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Employee'),
(3, 'HR');

-- --------------------------------------------------------

-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `shift_id` (`shift_id`),
  ADD KEY `location_id` (`location_id`);


--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_shift_id` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `attendance_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_access`
--
ALTER TABLE `user_access`
  ADD CONSTRAINT `user_access_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`) ON UPDATE CASCADE;