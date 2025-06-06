-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2025 at 06:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kviz`
--

-- --------------------------------------------------------

--
-- Table structure for table `odgovor`
--

CREATE TABLE `odgovor` (
  `sifra` int(11) NOT NULL,
  `tekst` text NOT NULL,
  `tocan` tinyint(1) NOT NULL,
  `pitanje` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `odgovor`
--

INSERT INTO `odgovor` (`sifra`, `tekst`, `tocan`, `pitanje`) VALUES
(1, 'Promocija najnovijih videoigara', 0, 1),
(2, 'Edukacija o sigurnom i odgovornom ponašanju na internetu', 1, 1),
(3, 'Prodaja računalne opreme', 0, 1),
(4, 'Organizacija natjecanja u programiranju', 0, 1),
(5, 'Dijeljenje svih osobnih podataka na društvenim mrežama', 0, 2),
(6, 'Zaštita osobnih podataka i kontrola nad njima na internetu', 1, 2),
(7, 'Korištenje interneta samo u javnim prostorima', 0, 2),
(8, 'Slanje privatnih poruka nepoznatim osobama', 0, 2),
(9, 'Koristiti istu lozinku za sve račune', 0, 3),
(10, 'Čuvati ih u bilježnici pored računala', 0, 3),
(11, 'Koristiti jake, jedinstvene lozinke i po potrebi upravitelj lozinki', 1, 3),
(12, 'Dijeliti ih s prijateljima', 0, 3),
(13, 'Odmah ih proslijediti svima', 0, 4),
(14, 'Ignorirati i blokirati pošiljatelja, te obavijestiti odraslu osobu', 1, 4),
(15, 'Odgovoriti na poruke i pitati zašto šalju takve stvari', 0, 4),
(16, 'Izbrisati aplikaciju za dopisivanje', 0, 4),
(17, 'Dijeliti samo slike i informacije koje ne ugrožavaju tvoju privatnost', 1, 5),
(18, 'Dijeliti sve što ti padne na pamet', 0, 5),
(19, 'Dijeliti samo sadržaj koji je zabavan', 0, 5),
(20, 'Dijeliti informacije o drugim ljudima bez njihovog pristanka', 0, 5),
(21, 'Siguran način plaćanja na internetu', 0, 6),
(22, 'Pokušaj krađe osobnih podataka putem lažnih poruka ili web stranica', 1, 6),
(23, 'Igra na internetu', 0, 6),
(24, 'Slanje velikog broja e-mailova prijateljima', 0, 6),
(25, 'Ako ima puno reklama', 0, 7),
(26, 'Ako u adresi stranice piše “https” i ima simbol lokota', 1, 7),
(27, 'Ako traži tvoju lozinku odmah nakon ulaska', 0, 7),
(28, 'Ako stranica izgleda šareno i zabavno', 0, 7),
(29, '10 godina', 0, 8),
(30, '13 godina', 1, 8),
(31, '7 godina', 0, 8),
(32, '5 godina', 0, 8),
(33, 'Igranje online igara', 0, 9),
(34, 'Nasilje i vrijeđanje drugih putem interneta', 1, 9),
(35, 'Slanje poklona prijateljima online', 0, 9),
(36, 'Dijeljenje smiješnih videa', 0, 9),
(37, 'Provjeriti više izvora i vjerodostojne stranice', 1, 10),
(38, 'Vjerovati samo naslovu članka', 0, 10),
(39, 'Dijeliti vijest odmah nakon što je pročitaš', 0, 10),
(40, 'Vjerovati samo onome što vidiš na društvenim mrežama', 0, 10),
(41, 'Da bi uređaj radio sporije', 0, 11),
(42, 'Da bi se popravile sigurnosne rupe i spriječili napadi', 1, 11),
(43, 'Da bi se izgubili podaci', 0, 11),
(44, 'Nije važno, svejedno je', 0, 11),
(45, 'Korištenje samo lozinke za prijavu', 0, 12),
(46, 'Dodatna sigurnosna provjera uz lozinku, npr. kod na mobitelu', 1, 12),
(47, 'Dijeljenje lozinke s drugom osobom', 0, 12),
(48, 'Prijava na dvije različite stranice istovremeno', 0, 12),
(49, 'Upisati hotline prijava te prijaviti neprimjereni sadržaj na internetu', 1, 13),
(50, 'Otići na društvene mreže i podijeliti sadržaj', 0, 13),
(51, 'Treba ignorirati neprimjereni sadržaj', 0, 13),
(52, 'Spremiti neprimjereni sadržaj na svoje računalo ili mobitel', 0, 13),
(53, 'Promijeniti lozinku i obavijestiti odraslu osobu', 1, 14),
(54, 'Ignorirati problem', 0, 14),
(55, 'Obrisati račun bez promjene lozinke', 0, 14),
(56, 'Dijeliti svoje podatke s nepoznatima da ti pomognu', 0, 14),
(57, 'Zabava bez edukacije', 0, 15),
(58, 'Edukacija i podizanje svijesti o sigurnosti na internetu', 1, 15),
(59, 'Prodaja proizvoda za računala', 0, 15),
(60, 'Natjecanje u brzom tipkanju', 0, 15),
(61, 'Dijeljenjem lažnih vijesti', 0, 16),
(62, 'Poštovanjem drugih i prijavljivanjem neprimjerenog sadržaja', 1, 16),
(63, 'Ignoriranjem pravila ponašanja', 0, 16),
(64, 'Korištenjem tuđih lozinki', 0, 16);

-- --------------------------------------------------------

--
-- Table structure for table `pitanje`
--

CREATE TABLE `pitanje` (
  `sifra` int(11) NOT NULL,
  `tekst` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pitanje`
--

INSERT INTO `pitanje` (`sifra`, `tekst`) VALUES
(1, 'Koji je glavni cilj Dana sigurnijeg interneta?'),
(2, 'Što znači pojam “digitalna privatnost”?'),
(3, 'Koji je najbolji način da zaštitiš svoje lozinke?'),
(4, 'Što trebaš učiniti ako primiš neprimjerene poruke na internetu?'),
(5, 'Koja je najvažnija stvar kod dijeljenja sadržaja na društvenim mrežama?'),
(6, 'Što znači “phishing”?'),
(7, 'Kako možeš provjeriti je li web/mrežna stranica sigurna?'),
(8, 'Koja je preporučena dob za otvaranje profila na Instagramu?'),
(9, 'Što je “cyberbullying”?'),
(10, 'Koji je najbolji način da prepoznaš lažne vijesti na internetu?'),
(11, 'Zašto je važno redovito ažurirati softver na uređajima?'),
(12, 'Što znači “dvofaktorska autentifikacija”?'),
(13, 'Što treba upisati u tražilicu kada pronađeš neprimjereni sadržaj na internetu?'),
(14, 'Što trebaš napraviti ako primijetiš da je tvoj račun hakiran?'),
(15, 'Koja je svrha online kvizova i radionica na Dan sigurnijeg interneta?'),
(16, 'Kako možeš pomoći da internet bude sigurnije mjesto za sve?');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `odgovor`
--
ALTER TABLE `odgovor`
  ADD PRIMARY KEY (`sifra`),
  ADD KEY `pitanje` (`pitanje`);

--
-- Indexes for table `pitanje`
--
ALTER TABLE `pitanje`
  ADD PRIMARY KEY (`sifra`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `odgovor`
--
ALTER TABLE `odgovor`
  MODIFY `sifra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `pitanje`
--
ALTER TABLE `pitanje`
  MODIFY `sifra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `odgovor`
--
ALTER TABLE `odgovor`
  ADD CONSTRAINT `odgovor_ibfk_1` FOREIGN KEY (`pitanje`) REFERENCES `pitanje` (`sifra`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
