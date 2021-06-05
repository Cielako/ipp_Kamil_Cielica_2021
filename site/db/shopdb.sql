-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Cze 2021, 22:26
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
-- Baza danych: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Zrzut danych tabeli `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"shopdb\",\"table\":\"products\"},{\"db\":\"shopdb\",\"table\":\"users\"},{\"db\":\"sklep\",\"table\":\"uzytkownicy\"},{\"db\":\"sklep\",\"table\":\"koszyk\"}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Zrzut danych tabeli `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'shopdb', 'products', '{\"sorted_col\":\"`id` ASC\"}', '2021-04-26 19:29:35');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-04-27 07:54:59', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"pl\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeksy dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeksy dla tabeli `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeksy dla tabeli `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeksy dla tabeli `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeksy dla tabeli `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeksy dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeksy dla tabeli `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeksy dla tabeli `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeksy dla tabeli `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeksy dla tabeli `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Baza danych: `shopdb`
--
CREATE DATABASE IF NOT EXISTS `shopdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shopdb`;

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
(36, 'Portfel', 'portmonetki', 'ładny portfel ze skóry mamuta', '120.00', 10, 'wallet.png', '2021-04-26 21:28:40'),
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
(5, 'test', '4d04fff0a5a41f6dcd73322ff9c6ebb06ff5165b17bda0349dda4ea96c208cb6', 'test@gmail.com', '127.0.0.1'),
(6, 'test2', '4d04fff0a5a41f6dcd73322ff9c6ebb06ff5165b17bda0349dda4ea96c208cb6', 'test@gmail.com', '127.0.0.1'),
(7, 'lol', 'b4160d014e4f07c1352fe1cdc2b1aaf6929e2f81a17554c34a0630849cd0c934', 'alsdkas@gmail.com', '127.0.0.1'),
(8, 'test4', 'bb6d8c2ad1030e03079921e5880e721e8c56ee99af6711f7e5fc37f37adf4a19', 's@gmail.com', '127.0.0.1'),
(10, 'uzytkownik', '937e8d5fbb48bd4949536cd65b8d35c426b80d2f830c5c308e2cdec422ae2244', 'adaadad@gmail.com', '127.0.0.1'),
(11, 'lolek', 'b4160d014e4f07c1352fe1cdc2b1aaf6929e2f81a17554c34a0630849cd0c934', 'bolek@gmail.com', '127.0.0.1'),
(12, 'asdasasdasd', 'b4160d014e4f07c1352fe1cdc2b1aaf6929e2f81a17554c34a0630849cd0c934', 'asdaSDA@gmail.com', '127.0.0.1'),
(13, 'test4o', 'b4160d014e4f07c1352fe1cdc2b1aaf6929e2f81a17554c34a0630849cd0c934', 'celos@g', '127.0.0.1');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Baza danych: `sklep`
--
CREATE DATABASE IF NOT EXISTS `sklep` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sklep`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `koszyk`
--

CREATE TABLE `koszyk` (
  `id_zakupu` int(11) NOT NULL,
  `uzytkownik_nazwa` varchar(25) NOT NULL,
  `produkt_id` int(11) NOT NULL,
  `ilosc_koszyk` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `koszyk`
--

INSERT INTO `koszyk` (`id_zakupu`, `uzytkownik_nazwa`, `produkt_id`, `ilosc_koszyk`) VALUES
(6, 'admin', 5, 0),
(7, 'admin', 5, 0),
(8, 'admin', 5, 0),
(9, 'admin', 5, 0),
(28, 'admin', 5, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkty`
--

CREATE TABLE `produkty` (
  `id_produktu` int(11) NOT NULL,
  `nazwa_produktu` varchar(50) NOT NULL,
  `fotografia` varchar(40) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `opis` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `cena` double(9,2) NOT NULL,
  `stars` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `produkty`
--

INSERT INTO `produkty` (`id_produktu`, `nazwa_produktu`, `fotografia`, `opis`, `cena`, `stars`) VALUES
(1, 'TEKKEN 6', 'fotografie/1.jpg', '<p><strong>Tekken 6</strong> jest już sz&oacute;stą częścią znanej na całym świecie bijatyki, kt&oacute;ra stawiała swe pierwsze kroki na rynku elektronicznym jeszcze w czasach konsoli PSX. Fabuła jest kontynuacją historii opowiedzianej w Tekken 5, teraz <em>Jin Kazama staje na czele Mishima Zaibatsu</em> i ogłasza sz&oacute;stą odsłonę turnieju King of Iron Fist, by ostatecznie uporać się z G Corp.</p>', 66.00, 8),
(2, 'TEKKEN 6', 'fotografie/2.jpg', 'Dead, którego pierwsza część, zatytułowana Red Dead Revolver, zadebiutowała w 2004 roku. Prawdziwej sławy seria doczekała się jednak dopiero sześć lat później, po premierze Red Dead Redemption, czyli gry akcji z otwartym światem, która przez wielu została ochrzczona mianem jednej z najlepszych produkcji wydanych na platformach z siódmej generacji – Xboksie 360 I PlayStation 3. Kontynuacja tego tytułu została wydana przez firmę Rockstar Games.', 250.00, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id_uzytkownika` int(10) NOT NULL,
  `login` varchar(30) NOT NULL,
  `haslo` varchar(32) NOT NULL,
  `email` varchar(45) NOT NULL,
  `ip` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id_uzytkownika`, `login`, `haslo`, `email`, `ip`) VALUES
(1, 'admin', '207023ccb44feb4d7dadca005ce29a64', 'admin@admin.pl', '127.0.0.1'),
(6, 'dupa', '9743a66f914cc249efca164485a19c5c', 'dupa@gmail.com', '::1'),
(7, 'czerski', 'af7a9ab392fe15f9e2bac0f4f2c1f181', 'czerski@czerski.pl', '10.0.27.15'),
(8, 'TOMASZ', 'e69c3c4316543d354e3c3b323c02697a', 'tomasz@6969.pl', '10.0.27.17');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  ADD PRIMARY KEY (`id_zakupu`);

--
-- Indeksy dla tabeli `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id_produktu`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id_uzytkownika`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `koszyk`
--
ALTER TABLE `koszyk`
  MODIFY `id_zakupu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT dla tabeli `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id_produktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id_uzytkownika` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Baza danych: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
