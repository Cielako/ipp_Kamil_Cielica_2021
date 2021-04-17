-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Kwi 2021, 18:41
-- Wersja serwera: 10.4.18-MariaDB
-- Wersja PHP: 8.0.3

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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `login` varchar(30) DEFAULT NULL,
  `passw` varchar(64) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `login`, `passw`, `email`, `ip`) VALUES
(1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin@uwr.edu.pl', '127.0.0.1'),
(5, 'test', '4d04fff0a5a41f6dcd73322ff9c6ebb06ff5165b17bda0349dda4ea96c208cb6', 'test@gmail.com', '127.0.0.1'),
(6, 'test2', '4d04fff0a5a41f6dcd73322ff9c6ebb06ff5165b17bda0349dda4ea96c208cb6', 'test@gmail.com', '127.0.0.1'),
(7, 'lol', 'b4160d014e4f07c1352fe1cdc2b1aaf6929e2f81a17554c34a0630849cd0c934', 'alsdkas@gmail.com', '127.0.0.1');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
