-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Sty 2023, 16:48
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `videoteka`
--
CREATE DATABASE IF NOT EXISTS `videoteka` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `videoteka`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `accounttype`
--

CREATE TABLE `accounttype` (
  `accountTypeID` int(20) UNSIGNED NOT NULL,
  `accountTypeName` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `canCreat` tinyint(1) NOT NULL,
  `canRead` tinyint(1) NOT NULL,
  `canUpdate` tinyint(1) NOT NULL,
  `canDelete` tinyint(1) NOT NULL,
  `canRequest` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `accounttype`
--

INSERT INTO `accounttype` (`accountTypeID`, `accountTypeName`, `canCreat`, `canRead`, `canUpdate`, `canDelete`, `canRequest`) VALUES
(1, 'admin', 1, 1, 1, 1, 1),
(2, 'user', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `content`
--

CREATE TABLE `content` (
  `contentID` int(20) UNSIGNED NOT NULL,
  `contentName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `contentType` int(20) UNSIGNED NOT NULL,
  `contentNumberOfEpisodes` int(20) UNSIGNED NOT NULL,
  `contentDescription` varchar(2000) COLLATE utf8_polish_ci NOT NULL,
  `contentPicture` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `content`
--

INSERT INTO `content` (`contentID`, `contentName`, `contentType`, `contentNumberOfEpisodes`, `contentDescription`, `contentPicture`) VALUES
(1, 'Władca Pierścieni: Drużyna Pierścienia', 1, 1, 'Podróż hobbita z Shire i jego ośmiu towarzyszy, której celem jest zniszczenie potężnego pierścienia pożądanego przez Czarnego Władcę - Saurona. ', 'thelordoftheringsthefellowshipofthering'),
(2, 'Władca Pierścieni: Dwie wieże', 1, 1, 'Drużyna Pierścienia zostaje rozbita, lecz zdesperowany Frodo za wszelką cenę chce wypełnić powierzone mu zadanie. Aragorn z towarzyszami przygotowuje się, by odeprzeć atak hord Sarumana.', 'thelordoftheringsthetwotowers'),
(3, 'Władca Pierścieni: Powrót króla', 1, 1, 'Zwieńczenie filmowej trylogii wg powieści Tolkiena. Aragorn jednoczy siły Śródziemia, szykując się do bitwy, która ma odwrócić uwagę Saurona od podążających w kierunku Góry Przeznaczenia hobbitów.', 'thelordoftheringsthereturnoftheking'),
(4, 'Hobbit: Niezwykła podróż', 1, 1, 'Hobbit Bilbo Baggins, przy udziale czarodzieja Gandalfa, dołącza do kompanii krasnoludów pod dowództwem Thorina Dębowej Tarczy. Celem ich wyprawy jest wydarcie Samotnej Góry i jej bogactw spod władzy smoka Smauga. ', 'thehobbitanunexpectedjourney');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contentrelation`
--

CREATE TABLE `contentrelation` (
  `contentID` int(20) UNSIGNED NOT NULL,
  `userID` int(20) UNSIGNED NOT NULL,
  `rate` int(2) UNSIGNED NOT NULL,
  `progress` int(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `contentrelation`
--

INSERT INTO `contentrelation` (`contentID`, `userID`, `rate`, `progress`, `status`) VALUES
(1, 1, 0, 0, 1),
(4, 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contenttype`
--

CREATE TABLE `contenttype` (
  `contentTypeID` int(20) UNSIGNED NOT NULL,
  `contentTypeName` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `contenttype`
--

INSERT INTO `contenttype` (`contentTypeID`, `contentTypeName`) VALUES
(1, 'Film');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `genre`
--

CREATE TABLE `genre` (
  `genreID` int(5) UNSIGNED NOT NULL,
  `genreName` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `genre`
--

INSERT INTO `genre` (`genreID`, `genreName`) VALUES
(1, 'Fantasy'),
(2, 'Przygodowy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `genrerelation`
--

CREATE TABLE `genrerelation` (
  `contentID` int(20) UNSIGNED NOT NULL,
  `genreID` int(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `genrerelation`
--

INSERT INTO `genrerelation` (`contentID`, `genreID`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producent`
--

CREATE TABLE `producent` (
  `producentID` int(20) UNSIGNED NOT NULL,
  `producentName` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `producent`
--

INSERT INTO `producent` (`producentID`, `producentName`) VALUES
(1, 'Peter Jackson');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `producentrelation`
--

CREATE TABLE `producentrelation` (
  `contentID` int(20) UNSIGNED NOT NULL,
  `producentID` int(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `producentrelation`
--

INSERT INTO `producentrelation` (`contentID`, `producentID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `userID` int(20) UNSIGNED NOT NULL,
  `login` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `accountType` int(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`userID`, `login`, `password`, `accountType`) VALUES
(1, 'user', 'user', 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `accounttype`
--
ALTER TABLE `accounttype`
  ADD PRIMARY KEY (`accountTypeID`),
  ADD UNIQUE KEY `accountTypeName` (`accountTypeName`);

--
-- Indeksy dla tabeli `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`contentID`),
  ADD UNIQUE KEY `contentName` (`contentName`),
  ADD KEY `content-contenttype` (`contentType`);

--
-- Indeksy dla tabeli `contentrelation`
--
ALTER TABLE `contentrelation`
  ADD PRIMARY KEY (`contentID`,`userID`),
  ADD KEY `user-relation` (`userID`);

--
-- Indeksy dla tabeli `contenttype`
--
ALTER TABLE `contenttype`
  ADD PRIMARY KEY (`contentTypeID`),
  ADD UNIQUE KEY `contentTypeName` (`contentTypeName`);

--
-- Indeksy dla tabeli `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genreID`),
  ADD UNIQUE KEY `genreName` (`genreName`);

--
-- Indeksy dla tabeli `genrerelation`
--
ALTER TABLE `genrerelation`
  ADD PRIMARY KEY (`contentID`,`genreID`),
  ADD KEY `genre-relation` (`genreID`);

--
-- Indeksy dla tabeli `producent`
--
ALTER TABLE `producent`
  ADD PRIMARY KEY (`producentID`),
  ADD UNIQUE KEY `producentName` (`producentName`);

--
-- Indeksy dla tabeli `producentrelation`
--
ALTER TABLE `producentrelation`
  ADD PRIMARY KEY (`contentID`,`producentID`),
  ADD KEY `producent-relation` (`producentID`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `login` (`login`),
  ADD KEY `users-accounttype` (`accountType`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `accounttype`
--
ALTER TABLE `accounttype`
  MODIFY `accountTypeID` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `content`
--
ALTER TABLE `content`
  MODIFY `contentID` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `contenttype`
--
ALTER TABLE `contenttype`
  MODIFY `contentTypeID` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `genre`
--
ALTER TABLE `genre`
  MODIFY `genreID` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `producent`
--
ALTER TABLE `producent`
  MODIFY `producentID` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content-contenttype` FOREIGN KEY (`contentType`) REFERENCES `contenttype` (`contentTypeID`);

--
-- Ograniczenia dla tabeli `contentrelation`
--
ALTER TABLE `contentrelation`
  ADD CONSTRAINT `content-relation` FOREIGN KEY (`contentID`) REFERENCES `content` (`contentID`),
  ADD CONSTRAINT `user-relation` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Ograniczenia dla tabeli `genrerelation`
--
ALTER TABLE `genrerelation`
  ADD CONSTRAINT `content-relation-genre` FOREIGN KEY (`contentID`) REFERENCES `content` (`contentID`),
  ADD CONSTRAINT `genre-relation` FOREIGN KEY (`genreID`) REFERENCES `genre` (`genreID`);

--
-- Ograniczenia dla tabeli `producentrelation`
--
ALTER TABLE `producentrelation`
  ADD CONSTRAINT `content-relation-producent` FOREIGN KEY (`contentID`) REFERENCES `content` (`contentID`),
  ADD CONSTRAINT `producent-relation` FOREIGN KEY (`producentID`) REFERENCES `producent` (`producentID`);

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users-accounttype` FOREIGN KEY (`accountType`) REFERENCES `accounttype` (`accountTypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
