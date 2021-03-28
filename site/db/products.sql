-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 28 Mar 2021, 21:35
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `shopdb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `desc` text NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `desc`, `price`, `quantity`, `img`, `date_added`) VALUES
(6, 'portfel', 'portfele', 'ładny portfel ze skóry mamuta', '125.00', 12, 'wallet.png', '2021-03-23 17:06:36'),
(9, 'portfel', 'portfele', 'ładny portfel ze skóry mamuta', '125.00', 12, 'wallet.png', '2021-03-23 17:06:36'),
(10, 'portfel', 'portfele', 'ładny portfel ze skóry mamuta', '125.00', 12, 'wallet.png', '2021-03-23 17:06:36'),
(11, 'portfel', 'portfele', 'ładny portfel ze skóry mamuta', '125.00', 12, 'wallet.png', '2021-03-23 17:06:36'),
(12, 'portfel', 'portfele', 'ładny portfel ze skóry mamuta', '125.00', 12, 'wallet.png', '2021-03-23 17:06:36'),
(13, 'portfel', 'portfele', 'ładny portfel ze skóry mamuta', '125.00', 12, 'wallet.png', '2021-03-23 17:06:36'),
(14, 'portfel', 'portfele', 'ładny portfel ze skóry mamuta', '125.00', 12, 'wallet.png', '2021-03-23 17:06:36'),
(15, 'portfel', 'portfele', 'ładny portfel ze skóry mamuta', '125.00', 12, 'wallet.png', '2021-03-23 17:06:36'),
(16, 'portfel', 'portfele', 'ładny portfel ze skóry mamuta', '125.00', 12, 'wallet.png', '2021-03-23 17:06:36');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
