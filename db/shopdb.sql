-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Cze 2022, 12:41
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

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
(40, 'Gra Crackdown 2 XBOX 360', 'GRY', 'Gra o wirusie który opanował miasto\r\n\r\n', '41.00', 8, 'IMG_20210326_121452.jpg', '2021-04-26 21:30:36'),
(47, 'iPhone 7 128 GB', 'telefony', 'Wyświetlacz iPhone\'a 7 to 4,7-calowy ekran IPS TFT o rozdzielczości 750x1334 i zagęszczeniu 326 pikseli na cal. ... iPhone 7 ma 138,3 mm wysokości, 67,1 mm szerokości i 7,1 mm grubości. Waży 138 g. Model dostępny jest w kolorze różowego złota, złota, srebra i czerni.', '900.00', 20, 'Iphone-7-128GB-Black-Front.png', '2021-06-05 18:43:46'),
(48, 'Xbox Series X', 'konsole', 'Konsola Xbox Series X zapewnia sensacyjnie płynną animację do 120 klatek na sekundę z atrakcyjnymi wizualnie efektami HDR. Dzięki temu postacie są ostrzejsze, światy jaśniejsze, a niewidoczne dotąd szczegóły wyłaniają się z mroku dzięki realistycznej rozdzielczości 4K', '1800.00', 10, 'RE4mRni.png', '2021-06-05 18:46:13'),
(49, 'SONY PlayStation 5', 'konsole', 'Konsole Sony PS5 oferują graczom rozgrywkę na najwyższym jak do tej pory poziomie. To, co je wyróżnia, to bez wątpienia niezwykła szybkość ładowania gier gwarantowana przez wyjątkowo szybki dysk SSD. Najnowsze konsole, które weszły na rynek pod koniec 2020 roku, mogą także poszczycić się bardzo wysoką rozdzielczością 8K, intensywnymi i żywymi kolorami oraz dotąd niespotykaną szczegółowością i płynnością obrazu. Dodatkowo zachwycają najwyższą jakością dźwięku 3D.', '3000.00', 5, 'ps5.png', '2021-06-05 18:49:02'),
(50, 'Nintendo Switch', 'konsole', 'Nintendo Switch to przełomowa stacjonarna konsola do gier wideo. Nie tylko można podłączyć ją do domowego telewizora, ale także momentalnie zmienić w konsolę przenośną z 6,2-calowym ekranem. Po raz pierwszy gracze mogą w pełni cieszyć się konsolą stacjonarną kiedykolwiek i gdziekolwiek zechcą. Ekran posiada pojemnościowe możliwości wielodotykowe dla kompatybilnych z nim gier. Bateria może wytrzymać ponad sześć godzin, ale czas ten zależeć będzie od korzystania z konsoli.', '1500.00', 15, 'Nintendo_Switch_Portable.png', '2021-06-05 20:16:20'),
(51, 'Apple MacBook Air 13 ', 'laptopy', 'MacBook Air działa na baterii nawet 12 godzin. A więc od porannej kawy aż do kolacji pracujesz bez doładowywania. Albo relaksujesz się, oglądając filmy z iTunes. A wiedząc, że bateria utrzyma komputer w stanie gotowości przez 30 dni, możesz spokojnie wyjechać na parę tygodni, a po powrocie kontynuować przerwane zajęcia.', '3700.00', 5, 'macbook_air.png', '2021-06-05 20:18:20');

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
(14, 'pietrek', '937e8d5fbb48bd4949536cd65b8d35c426b80d2f830c5c308e2cdec422ae2244', 'pietrek@gmail.com', '::1');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
