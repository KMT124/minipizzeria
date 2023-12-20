-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2023 at 08:17 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `minipizzeria`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `pizza` varchar(255) NOT NULL,
  `create_account` tinyint(1) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `name`, `address`, `pizza`, `create_account`, `order_date`, `rating`) VALUES
(6, 0, 'sasa', 'sasa', 'Margherita', 0, '2023-12-19 08:25:05', NULL),
(7, 0, 'sas', 'soso', 'Hawajska', 0, '2023-12-19 08:25:05', NULL),
(8, 0, 'Sylwia', 'soso', 'Hawajska', 0, '2023-12-19 08:25:05', NULL),
(9, 1, 'Sylwia', 'wawa', 'Margherita', 0, '2023-12-19 08:25:05', 1),
(10, 0, 'qqqqqqq', '43', 'Margherita', 0, '2023-12-19 08:25:05', NULL),
(11, 1, 'qqqqqqq', '23', 'Margherita', 0, '2023-12-19 09:14:36', NULL),
(12, 0, 'wada', '2131', 'Margherita', 0, '2023-12-19 09:15:05', NULL),
(13, 0, 'TRA', 'soso', 'Margherita', 0, '2023-12-19 09:26:06', NULL),
(14, 0, '', '', 'Margherita', 0, '2023-12-19 10:15:23', NULL),
(15, 1, '', '', 'Margherita', 0, '2023-12-19 11:09:29', NULL),
(16, 0, '', '', 'Margherita', 0, '2023-12-19 11:09:41', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pizza_menu`
--

CREATE TABLE `pizza_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pizza_menu`
--

INSERT INTO `pizza_menu` (`id`, `name`, `price`) VALUES
(1, 'Margherita', 25.00),
(2, 'Pepperoni', 30.00),
(3, 'Hawajska', 28.00),
(4, 'Capricciosa', 32.00),
(5, 'Vegetariana', 27.00),
(6, 'Quattro Formaggi', 35.00),
(7, 'Diavola', 31.00),
(8, 'Prosciutto e Funghi', 29.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `registration_date`) VALUES
(1, 'Sylwia', '$2y$10$jRPWLZwwZlS4Vs3vl/tNs.JbSX2zwuY3XCVIUrSFXjl6WTkXzrTpq', '', '2023-12-19 07:55:41'),
(2, 'opp', '$2y$10$pgRhe4eeISW9LaA8sdJg7ewJT5ARiXO84oO9sHYrcUg0DAl9d9.d2', '', '2023-12-19 08:14:28'),
(3, '', '', '', '2023-12-19 08:21:36'),
(4, '', '', '', '2023-12-19 09:15:05'),
(5, '', '', '', '2023-12-19 10:15:23'),
(6, '', '', '', '2023-12-19 11:09:41');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
