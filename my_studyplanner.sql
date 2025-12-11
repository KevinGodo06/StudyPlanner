-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Dic 11, 2025 alle 12:29
-- Versione del server: 8.0.32
-- Versione PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_studyplanner`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `ElementoLista`
--

CREATE TABLE `ElementoLista` (
  `ID` int NOT NULL,
  `nome` varchar(128) NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `fk_id_studente` decimal(21,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `ElementoLista`
--

INSERT INTO `ElementoLista` (`ID`, `nome`, `checked`, `fk_id_studente`) VALUES
(1, 'Consegna relazione di storia', 1, '2'),
(5, 'Allenamento di basket', 1, '2'),
(7, 'Progetto di gruppo su geografia', 0, '2'),
(9, 'Lettura del libro assegnato', 0, '2'),
(10, 'Controllo agenda con i genitori', 1, '2'),
(13, 'Lettura capitolo di storia', 0, '1'),
(14, 'Compiti di scienze', 1, '1'),
(15, 'Scrittura tema di italiano', 0, '1'),
(16, 'Prove di spelling inglese', 1, '1'),
(17, 'Revisione appunti di geografia', 0, '1'),
(18, 'Esercizi di grammatica', 1, '1');

-- --------------------------------------------------------

--
-- Struttura della tabella `Impegno`
--

CREATE TABLE `Impegno` (
  `ID` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descrizione` varchar(128) DEFAULT NULL,
  `colore` varchar(100) DEFAULT '--azzurro-hover',
  `dataImpegno` date NOT NULL,
  `oraInizio` time NOT NULL,
  `oraFine` time NOT NULL,
  `fk_id_studente` decimal(21,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Impegno`
--

INSERT INTO `Impegno` (`ID`, `nome`, `descrizione`, `colore`, `dataImpegno`, `oraInizio`, `oraFine`, `fk_id_studente`) VALUES
(42, 'Prove Invalsi', 'Guarda I risultati delle prove invalsi', '--albicocca', '2025-06-05', '00:00:00', '23:59:00', '1'),
(43, 'prova', 'dhdhhd', '--verdino', '2025-05-08', '22:15:00', '00:00:00', '2'),
(44, 'Presentazione Project Work', 'Presentare alle classi quarte i Project Work', '--verdino', '2025-05-22', '09:00:00', '11:50:00', '1'),
(45, 'Studiare informatica/gespro', 'Studiare per la verifica di informatica e di gespro', '--albicocca', '2025-05-22', '16:00:00', '17:30:00', '1'),
(46, 'studio matematica', 'per verifica', '--verde-acqua', '2025-05-23', '15:00:00', '17:00:00', '1'),
(47, 'studiare sistemi', '', '--lilla', '2025-05-23', '18:00:00', '20:00:00', '1'),
(48, 'compiti informatica', '', '--azzurro-sfondo', '2025-05-23', '15:00:00', '16:00:00', '1'),
(49, 'aaa', 'hjghg', '--lilla', '2025-05-15', '09:17:00', '11:14:00', '117394965341377048115'),
(51, 'studio matematica', '', '--azzurro-sfondo', '2025-05-29', '16:00:00', '17:00:00', '2'),
(52, 'compiti informatica', '', '--lilla', '2025-05-29', '15:00:00', '16:30:00', '2'),
(53, 'lezione italiano', '', '--giallino', '2025-05-29', '13:00:00', '14:00:00', '2'),
(54, 'ripasso scienze', '', '--verdino', '2025-05-29', '17:00:00', '19:00:00', '2'),
(55, 'Matematica', '', '--albicocca', '2025-06-09', '00:00:00', '23:59:00', '10'),
(56, 'Sistemi', '', '--verde-acqua', '2025-06-10', '00:00:00', '23:59:00', '10'),
(57, 'Tepsit', '', '--rosino', '2025-06-11', '00:00:00', '12:00:00', '10'),
(58, 'Italiano', '', '--corallo', '2025-06-16', '00:00:00', '23:59:00', '10'),
(59, 'Informatica', '', '--lilla', '2025-06-17', '00:00:00', '23:59:00', '10'),
(60, 'Storia', '', '--corallo', '2025-06-15', '00:00:00', '23:59:00', '10'),
(61, 'Ed. Civica', '', '--azzurro-sfondo', '2025-06-11', '13:00:00', '23:59:00', '10'),
(62, 'Inglese', '', '--azzurro-sfondo', '2025-06-12', '00:00:00', '23:59:00', '10'),
(63, 'Inglese', '', '--azzurro-sfondo', '2025-06-13', '00:00:00', '12:00:00', '10'),
(64, 'Gespro', '', '--azzurro-sfondo', '2025-06-14', '00:00:00', '23:59:00', '10'),
(65, 'Gespro', '', '--azzurro-sfondo', '2025-06-13', '13:00:00', '23:59:00', '10'),
(66, 'Verifica matematica', 'Ripasso generale per la verifica', '--azzurro-sfondo', '2025-06-03', '08:00:00', '10:30:00', '1'),
(67, 'Incontro orientamento', 'Colloquio con il tutor di orientamento', '--verde-acqua', '2025-06-05', '09:00:00', '11:30:00', '1'),
(68, 'Lettura romanzo', 'Leggere il capitolo 5 del libro assegnato', '--lilla', '2025-06-06', '08:30:00', '11:00:00', '1'),
(69, 'Laboratorio informatica', 'Svolgimento esercizi guidati', '--albicocca', '2025-06-08', '08:45:00', '12:00:00', '1'),
(70, 'Preparazione esame orale', 'Ripasso generale delle materie', '--verdino', '2025-06-10', '09:15:00', '12:00:00', '1'),
(71, 'Incontro gruppo studio', 'Revisione temi svolti in gruppo', '--azzurro-sfondo', '2025-06-12', '08:00:00', '10:00:00', '1'),
(72, 'Progetto scienze', 'Lavoro di gruppo sulla fotosintesi', '--verde-acqua', '2025-06-15', '10:00:00', '13:00:00', '1'),
(73, 'Verifica inglese', 'Simulazione verifica scritta', '--albicocca', '2025-06-18', '09:00:00', '11:00:00', '1'),
(74, 'Attività di recupero', 'Esercizi assegnati dal docente', '--lilla', '2025-06-22', '08:00:00', '09:30:00', '1'),
(75, 'Studio autonomo', 'Organizzazione personale dei materiali', '--verdino', '2025-06-27', '08:30:00', '10:30:00', '1'),
(76, 'Revisione storia', 'Prepararsi per l’interrogazione di storia', '--azzurro-sfondo', '2025-06-02', '09:00:00', '12:00:00', '2'),
(77, 'Educazione fisica', 'Allenamento per la gara di atletica', '--verde-acqua', '2025-06-04', '08:00:00', '11:00:00', '2'),
(78, 'Laboratorio arte', 'Progetto creativo con colori acrilici', '--lilla', '2025-06-07', '08:30:00', '11:30:00', '2'),
(79, 'Compiti di matematica', 'Esercizi assegnati sull’algebra', '--albicocca', '2025-06-09', '09:00:00', '11:00:00', '2'),
(80, 'Colloquio genitori-docenti', 'Incontro di aggiornamento', '--verdino', '2025-06-11', '10:00:00', '11:30:00', '2'),
(81, 'Progetto interdisciplinare', 'Organizzazione con altri compagni', '--azzurro-sfondo', '2025-06-14', '08:00:00', '10:00:00', '2'),
(82, 'Verifica geografia', 'Studio dei capitoli 7 e 8', '--verde-acqua', '2025-06-16', '08:15:00', '10:15:00', '2'),
(83, 'Recupero italiano', 'Esercitazioni su analisi del testo', '--albicocca', '2025-06-19', '09:30:00', '12:30:00', '2'),
(84, 'Attività biblioteca', 'Lettura e consultazione testi', '--lilla', '2025-06-24', '08:45:00', '10:45:00', '2'),
(85, 'Studio con tutor', 'Supporto personalizzato su materie carenti', '--verdino', '2025-06-28', '10:00:00', '12:00:00', '2'),
(86, 'Ripasso matematica', 'Esercizi sulle equazioni', '--azzurro-sfondo', '2025-07-01', '08:00:00', '10:00:00', '1'),
(87, 'Progetto arte', 'Creazione disegno finale', '--verde-acqua', '2025-07-02', '09:00:00', '11:30:00', '1'),
(88, 'Verifica inglese', 'Preparazione al test scritto', '--lilla', '2025-07-03', '08:30:00', '12:00:00', '1'),
(89, 'Lettura narrativa', 'Leggere 3 capitoli assegnati', '--albicocca', '2025-07-04', '09:15:00', '11:15:00', '1'),
(90, 'Studio geografia', 'Regioni e capitali europee', '--verdino', '2025-07-05', '10:00:00', '12:30:00', '1'),
(91, 'Compiti estivi', 'Inizio compiti per le vacanze', '--azzurro-sfondo', '2025-07-06', '08:00:00', '10:30:00', '1'),
(92, 'Ripasso storia', 'Rivoluzioni del 1800', '--verde-acqua', '2025-07-07', '08:45:00', '11:45:00', '1'),
(93, 'Incontro tutor', 'Verifica piano studio', '--lilla', '2025-07-08', '09:00:00', '12:00:00', '1'),
(94, 'Laboratorio informatica', 'Esercitazioni con HTML', '--albicocca', '2025-07-09', '10:00:00', '13:00:00', '1'),
(95, 'Studio biologia', 'Il ciclo cellulare', '--verdino', '2025-07-10', '08:00:00', '10:30:00', '1'),
(96, 'Compiti di matematica', 'Problemi di geometria', '--azzurro-sfondo', '2025-07-11', '08:30:00', '11:00:00', '1'),
(97, 'Scrittura tema', 'Bozza del saggio argomentativo', '--verde-acqua', '2025-07-12', '09:15:00', '12:15:00', '1'),
(98, 'Preparazione verifica scienze', 'Struttura delle cellule', '--lilla', '2025-07-13', '08:00:00', '10:00:00', '1'),
(99, 'Revisione grammatica', 'Analisi logica e del periodo', '--albicocca', '2025-07-14', '08:45:00', '11:00:00', '1'),
(100, 'Studio latino', 'Traduzione testi', '--verdino', '2025-07-15', '09:00:00', '12:00:00', '1'),
(101, 'Lettura filosofia', 'Introduzione a Platone', '--azzurro-sfondo', '2025-07-16', '08:30:00', '10:30:00', '1'),
(102, 'Educazione civica', 'Studio Costituzione', '--verde-acqua', '2025-07-17', '08:00:00', '10:00:00', '1'),
(103, 'Preparazione orale', 'Simulazione esame', '--lilla', '2025-07-18', '09:00:00', '11:30:00', '1'),
(104, 'Gruppo studio storia', 'Studio collaborativo', '--albicocca', '2025-07-19', '10:00:00', '13:00:00', '1'),
(105, 'Allenamento logica', 'Esercizi per test d’ingresso', '--verdino', '2025-07-20', '08:00:00', '09:30:00', '1'),
(106, 'Ripasso matematica', 'Problemi con frazioni', '--azzurro-sfondo', '2025-07-01', '09:00:00', '12:00:00', '2'),
(107, 'Progetto artistico', 'Realizzazione collage', '--verde-acqua', '2025-07-02', '08:30:00', '11:00:00', '2'),
(108, 'Lettura storia', 'Lettura fonti storiche', '--lilla', '2025-07-03', '08:00:00', '10:30:00', '2'),
(109, 'Compiti vacanze', 'Compiti assegnati per l’estate', '--albicocca', '2025-07-04', '09:00:00', '11:00:00', '2'),
(110, 'Studio inglese', 'Esercizi listening e reading', '--verdino', '2025-07-05', '08:45:00', '10:45:00', '2'),
(111, 'Grammatica italiana', 'Ripasso tempi verbali', '--azzurro-sfondo', '2025-07-06', '08:00:00', '10:30:00', '2'),
(112, 'Preparazione interrogazione', 'Studio approfondito', '--verde-acqua', '2025-07-07', '10:00:00', '13:00:00', '2'),
(113, 'Revisione espressioni', 'Matematica espressioni complesse', '--lilla', '2025-07-08', '08:30:00', '10:30:00', '2'),
(114, 'Ricerca storia', 'Scrivere sintesi argomento scelto', '--albicocca', '2025-07-09', '09:15:00', '11:15:00', '2'),
(115, 'Laboratorio scienze', 'Esperimenti con materiali semplici', '--verdino', '2025-07-10', '08:00:00', '11:00:00', '2'),
(116, 'Progetto gruppo', 'Organizzazione presentazione', '--azzurro-sfondo', '2025-07-11', '08:45:00', '11:45:00', '2'),
(117, 'Compiti grammatica', 'Frasi subordinate', '--verde-acqua', '2025-07-12', '08:30:00', '10:30:00', '2'),
(118, 'Lettura autonoma', 'Leggere libro consigliato', '--lilla', '2025-07-13', '09:00:00', '11:30:00', '2'),
(119, 'Simulazione test', 'Prova generale', '--albicocca', '2025-07-14', '10:00:00', '13:00:00', '2'),
(120, 'Esercizi algebra', 'Monomi e polinomi', '--verdino', '2025-07-15', '08:00:00', '10:30:00', '2'),
(121, 'Analisi del testo', 'Tema di narrativa', '--azzurro-sfondo', '2025-07-16', '09:00:00', '12:00:00', '2'),
(122, 'Attività biblioteca', 'Studio individuale', '--verde-acqua', '2025-07-17', '08:00:00', '10:00:00', '2'),
(123, 'Studio scienze', 'Studio apparato digerente', '--lilla', '2025-07-18', '08:30:00', '10:30:00', '2'),
(124, 'Esercizi geometria', 'Teorema di Pitagora', '--albicocca', '2025-07-19', '09:00:00', '11:00:00', '2'),
(125, 'Preparazione orale', 'Ripetizione con schemi', '--verdino', '2025-07-20', '08:00:00', '10:00:00', '2');

-- --------------------------------------------------------

--
-- Struttura della tabella `Materia`
--

CREATE TABLE `Materia` (
  `nome` varchar(50) NOT NULL,
  `obiettivo` decimal(4,2) DEFAULT '0.00',
  `media` decimal(4,2) DEFAULT '0.00',
  `fk_id_studente` decimal(21,0) DEFAULT NULL,
  `ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Materia`
--

INSERT INTO `Materia` (`nome`, `obiettivo`, `media`, `fk_id_studente`, `ID`) VALUES
('Ita', '1.00', '7.72', '117589375180345370247', 19),
('Italiano', '9.00', '8.58', '1', 20),
('Matematica', '9.00', '9.19', '1', 21),
('ITA', '10.00', '7.72', '117509651751011714925', 22),
('storia', '9.00', '8.95', '1', 23),
('italiano', '0.00', '7.00', '10', 24),
('matematica', '9.00', '8.00', '2', 25),
('inglese', '6.00', '6.67', '1', 26),
('Sistemi', '8.00', '7.67', '1', 27),
('Tepsit', '9.00', '8.63', '1', 28),
('Tepsit', '6.00', '5.45', '68267870', 44),
('Sistemi e reti', '6.00', '6.12', '68267870', 45),
('sistemi', '0.00', '5.70', '111739990959642352698', 46),
('Storia', '6.00', '8.75', '68267870', 47),
('Gestpro', '6.00', '6.73', '68267870', 48),
('tepsit', '0.00', '4.62', '111739990959642352698', 49),
('Matematica', '6.00', '6.03', '68267870', 50),
('Informatica', '6.00', '6.42', '68267870', 51),
('Italiano', '6.00', '8.65', '68267870', 52),
('Educazione Civica', '6.00', '7.34', '68267870', 53),
('Motoria', '6.00', '7.65', '68267870', 54),
('Inglese', '6.00', '8.33', '68267870', 55),
('sistemi', '0.00', '7.48', '117394965341377048115', 56),
('tepsit', '0.00', '6.75', '117394965341377048115', 57),
('informatica', '0.00', '0.00', '117394965341377048115', 58),
('gespro', '0.00', '0.00', '117394965341377048115', 59),
('italiano', '0.00', '0.00', '117394965341377048115', 60),
('storia', '0.00', '7.88', '117394965341377048115', 61),
('matematica', '0.00', '0.00', '117394965341377048115', 62),
('inglese', '0.00', '7.92', '117394965341377048115', 63),
('motoria', '0.00', '0.00', '117394965341377048115', 64),
('ed civica', '0.00', '0.00', '117394965341377048115', 65),
('informatica', '0.00', '6.00', '563609338', 66),
('Informatica', '6.00', '7.00', '111300403555062701305', 67),
('Italiano', '0.00', '8.68', '62855760', 68),
('Storia', '0.00', '8.34', '62855760', 69),
('Matematica', '0.00', '6.81', '62855760', 70),
('Informatica', '0.00', '7.29', '62855760', 71),
('Gestione Progetto', '0.00', '8.11', '62855760', 72),
('Motoria', '0.00', '8.42', '62855760', 73),
('Tepsit', '0.00', '6.64', '62855760', 74),
('Sistemi', '0.00', '7.58', '62855760', 75),
('Ed Civ', '0.00', '7.32', '62855760', 76),
('mate', '0.00', '6.53', '111739990959642352698', 77),
('info', '0.00', '6.02', '111739990959642352698', 78);

-- --------------------------------------------------------

--
-- Struttura della tabella `OraLezione`
--

CREATE TABLE `OraLezione` (
  `ID` int NOT NULL,
  `nome` varchar(64) NOT NULL,
  `colore` varchar(100) DEFAULT '--azzurro-hover',
  `giorno` varchar(50) NOT NULL,
  `ora` int NOT NULL,
  `fk_id_studente` decimal(21,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `OraLezione`
--

INSERT INTO `OraLezione` (`ID`, `nome`, `colore`, `giorno`, `ora`, `fk_id_studente`) VALUES
(106, 'sistemi', '--verdino', 'Lunedì', 1, '6'),
(361, 's', '--verdino', 'Lunedì', 1, '11'),
(396, 'sistemi', '--albicocca', 'Lunedì', 2, '2'),
(397, 'informatica', '--lilla', 'Giovedì', 3, '2'),
(398, 'matematica', '--azzurro-sfondo', 'Venerdì', 1, '2'),
(399, 'religione', '--giallino', 'Lunedì', 5, '2'),
(400, 'sistemi', '--albicocca', 'Venerdì', 2, '2'),
(401, 'matematica', '--azzurro-sfondo', 'Mercoledì', 5, '2'),
(402, 'storia', '--corallo', 'Sabato', 1, '2'),
(403, 'informatica', '--lilla', 'Giovedì', 4, '2'),
(404, 'sistemi', '--albicocca', 'Lunedì', 1, '2'),
(405, 'tepsit', '--giallino', 'Sabato', 5, '2'),
(406, 'gespro', '--verde-acqua', 'Venerdì', 6, '2'),
(407, 'inglese', '--verdino', 'Martedì', 2, '2'),
(408, 'tepsit', '--giallino', 'Giovedì', 2, '2'),
(409, 'storia', '--corallo', 'Martedì', 4, '2'),
(410, 'tepsit', '--albicocca', 'Giovedì', 1, '2'),
(411, 'matematica', '--azzurro-sfondo', 'Sabato', 2, '2'),
(412, 'sistemi', '--albicocca', 'Martedì', 3, '2'),
(413, 'storia', '--corallo', 'Sabato', 4, '2'),
(414, 'gespro', '--verde-acqua', 'Sabato', 3, '2'),
(415, 'motoria', '--verde-acqua', 'Mercoledì', 3, '2'),
(416, 'italiano', '--rosino', 'Mercoledì', 2, '2'),
(417, 'inglese', '--verdino', 'Venerdì', 5, '2'),
(418, 'italiano', '--rosino', 'Mercoledì', 1, '2'),
(419, 'inglese', '--verdino', 'Mercoledì', 6, '2'),
(420, 'italiano', '--rosino', 'Lunedì', 4, '2'),
(421, 'gespro', '--verde-acqua', 'Giovedì', 5, '2'),
(422, 'informatica', '--lilla', 'Martedì', 5, '2'),
(423, 'informatica', '--lilla', 'Lunedì', 3, '2'),
(424, 'italiano', '--rosino', 'Venerdì', 3, '2'),
(425, 'matematica', '--azzurro-sfondo', 'Martedì', 1, '2'),
(426, 'motoria', '--verde-acqua', 'Mercoledì', 4, '2'),
(427, 'informatica', '--lilla', 'Venerdì', 4, '2'),
(429, 'italiano', '--albicocca', 'Mercoledì', 1, '12'),
(430, 'porcodio', '--verde-acqua', 'Lunedì', 1, '10'),
(432, 'sistemi', '--azzurro-sfondo', 'Lunedì', 1, '15'),
(433, 'palle', '--verdino', 'Martedì', 2, '15'),
(434, 'pipo', '--verde-acqua', 'Lunedì', 2, '15'),
(435, 'gdsjhretoh', '--azzurro-sfondo', 'Martedì', 1, '15'),
(436, 'Mate', '--verdino', 'Lunedì', 1, '16'),
(537, 'italiano', '--rosino', 'Mercoledì', 1, '1'),
(538, 'inglese', '--verdino', 'Mercoledì', 6, '1'),
(539, 'informatica', '--lilla', 'Venerdì', 4, '1'),
(540, 'informatica', '--lilla', 'Giovedì', 4, '1'),
(541, 'italiano', '--rosino', 'Lunedì', 4, '1'),
(542, 'sistemi', '--albicocca', 'Lunedì', 2, '1'),
(543, 'matematica', '--azzurro-sfondo', 'Martedì', 1, '1'),
(544, 'informatica', '--lilla', 'Martedì', 5, '1'),
(545, 'informatica', '--lilla', 'Giovedì', 3, '1'),
(546, 'motoria', '--verde-acqua', 'Mercoledì', 3, '1'),
(547, 'storia', '--corallo', 'Martedì', 4, '1'),
(548, 'gespro', '--verde-acqua', 'Venerdì', 6, '1'),
(549, 'tepsit', '--giallino', 'Giovedì', 1, '1'),
(550, 'motoria', '--verde-acqua', 'Mercoledì', 4, '1'),
(551, 'sistemi', '--albicocca', 'Martedì', 3, '1'),
(552, 'gespro', '--verde-acqua', 'Giovedì', 5, '1'),
(553, 'italiano', '--rosino', 'Venerdì', 3, '1'),
(554, 'italiano', '--rosino', 'Mercoledì', 2, '1'),
(555, 'matematica', '--azzurro-sfondo', 'Venerdì', 1, '1'),
(556, 'tepsit', '--giallino', 'Giovedì', 2, '1'),
(557, 'storia', '--corallo', 'Sabato', 1, '1'),
(558, 'sistemi', '--albicocca', 'Lunedì', 1, '1'),
(559, 'religione', '--giallino', 'Lunedì', 5, '1'),
(560, 'informatica', '--lilla', 'Lunedì', 3, '1'),
(561, 'inglese', '--verdino', 'Martedì', 2, '1'),
(562, 'inglese', '--verdino', 'Venerdì', 5, '1'),
(563, 'gespro', '--verde-acqua', 'Sabato', 3, '1'),
(564, 'matematica', '--azzurro-sfondo', 'Sabato', 2, '1'),
(565, 'tepsit', '--giallino', 'Sabato', 5, '1'),
(566, 'matematica', '--azzurro-sfondo', 'Mercoledì', 5, '1'),
(567, 'storia', '--corallo', 'Sabato', 4, '1'),
(568, 'sistemi', '--albicocca', 'Venerdì', 2, '1');

-- --------------------------------------------------------

--
-- Struttura della tabella `Studente`
--

CREATE TABLE `Studente` (
  `ID` decimal(21,0) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hashPassword` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `imgProfilo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `token` varchar(64) DEFAULT NULL,
  `tokenVerificaPassword` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Studente`
--

INSERT INTO `Studente` (`ID`, `email`, `nome`, `cognome`, `hashPassword`, `imgProfilo`, `token`, `tokenVerificaPassword`) VALUES
('1', 'kevin.godo@studenti.iispascal.it', 'kevin', 'godo', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'jpg', NULL, NULL),
('2', 'michelle.bondavalli@studenti.iispascal.it', 'michelle', 'bondavalli', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', NULL, NULL, NULL),
('3', 'giulia.falanga@studenti.iispascal.it', 'Giulia', 'Falanga', '0e4dd66217fc8d2e298b78c8cd9392870dcd065d0ff675d0edff5bcd227837e9', NULL, NULL, NULL),
('5', 'antonio.ciulla@studenti.iispascal.it', 'Antonio', 'Ciulla', '18852ecaee46d2a9a5345d7ceadd4bc0e571c2b34fc60e3170f990d9cc0ad679', NULL, NULL, NULL),
('6', 'alessandro.iori@studenti.iispascal.it', 'alessandro', 'iori', 'e8e31993a518074644f9c6b27d28500cd8ee8da432922fc8a166dca9ca9189b4', NULL, NULL, NULL),
('7', 'sophiematilde.boari@studenti.iispascal.it', 'sophie', 'boari', 'bbf720f4334d5f546a8fdb8d0db9b42304d66780884ad10f8d5ab8eb2bb834b7', NULL, NULL, NULL),
('10', 'emma.prati06@gmail.com', 'Emma', 'Prati', 'd9af13f9af2d666ed7a9a5481ff6d4bfc3be0a5f4ffc671d8cd7fa324b536527', NULL, NULL, NULL),
('11', 'giulia01042006@gmail.com', 'Giulia', 'Falanga', 'f0e0640ef90b39a9d841d2372b10734924d5061eb06e27aa37e032ebc50f6e24', NULL, NULL, NULL),
('12', 'claudiosammarco30@gmail.com', 'DIOPORC', 'busssss', '442046be27c7ecbb2e35f197227a9190e15d52cb42032b3128c1c163da6d591b', NULL, NULL, NULL),
('13', 'iserniafabio1@gmail.com', 'fabio', 'isernia', '4d138f4add8081708058b200e2e1a1968862cfa62b483487e419cd732f6597ce', NULL, NULL, NULL),
('14', 'catalfamomatis06@gmail.com', 'Matis', 'Catalfamo', '2904b0f3994f71ee5e6fdb6c7f9cdbe2b83f3bb77969f8d46bb27e1a4253d9a7', NULL, NULL, NULL),
('15', 'maaroufiyounes0@gmail.com', 'Younes', 'Maaroufi', '8e6c41ff0896872bde943a08a358561986d1bf58ee67a0c1b743881d683bccb4', NULL, NULL, NULL),
('16', 'methodmind1@gmail.com', 'MethodMind', 'MethodMind', '1d707811988069ca760826861d6d63a10e8c3b7f171c4441a6472ea58c11711b', NULL, NULL, NULL),
('62855760', 'solstrean@gmail.com', 'casxcas', 'scascasc', '0bd1a30af9a1fb9cec6383e664a61c1b51d535f96693f078c0507dbe3a5d8162', NULL, NULL, NULL),
('68267870', 'filippo.codeluppi@studenti.iispascal.it', 'Filippo', 'Codeluppi', '0caec1e5e178301d42ac7153cd665ca677b2a6bdf93745508cf91840c47fdbfa', NULL, NULL, NULL),
('162002983', 'amedeo.menozzi@studenti.iispascal.it', 'Amedeo', 'Menozzi', '75e28f9f749b9b7057a0f41dc67aa40164093543dcbae474e7cd4d7aa7e99f82', NULL, NULL, NULL),
('536313101', 'kgodo789@gmail.com', 'kevin', 'godo', '4d138f4add8081708058b200e2e1a1968862cfa62b483487e419cd732f6597ce', NULL, NULL, NULL),
('563609338', 'ursu.cristian.ionel@gmail.com', 'ioneddu', 'neddu', 'd70eb4715275fed09f9963bb81b1c38fbceed2e6875d8c1d3c071e9340a11731', NULL, NULL, NULL),
('101905364171241694700', 'michelle.bondavalli@studenti.iispascal.it', 'Michelle', 'Bondavalli', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocIKW-h-7-R0nG8MA-RzjrSxY_jeW9I3J4wlq_H7dHppKoYBhA=s96-c', NULL, NULL),
('102794364854017735280', 'matis.catalfamo@studenti.iispascal.it', 'Matis', 'Catalfamo', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocI4slAgCmsV-TBvHivZiCZd17xGqxQ6w4dLuK1I25vOs8bHKBE=s96-c', NULL, NULL),
('111300403555062701305', 'filippo.codeluppi@studenti.iispascal.it', 'Filippo', 'Codeluppi', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocIBNkizP70ZWCiuj0E3_c5DIykeun8wDcsbs98R8O61rVyk23Ph=s96-c', NULL, NULL),
('111739990959642352698', 'maksym.romanchuk@studenti.iispascal.it', 'Maksym', 'Romanchuk', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLQL0vZXUIsb1mbYG6VS1fptBuz6Oyy7tKjfXGwkrGbuCV5CXY=s96-c', NULL, NULL),
('112081908652872799584', 'antonio.sgaramella@studenti.iispascal.it', 'Antonio', 'Sgaramella', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocKilNVk3ZuPYt2xHhlU-J_kAUrCOFF04mmGIsY_ORS2Jvl3IAA=s96-c', NULL, NULL),
('114854332058854337676', 'kgodo789@gmail.com', 'Kevin', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJytnU8h_eh74gvQ6DVIhvsgeLMdSg70Y-oaXs16UG_DKnp8U-7=s96-c', NULL, NULL),
('115453449223383118959', 'kevin.godo@studenti.iispascal.it', 'Kevin', 'Godo', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLxhzsx286PWKwPZn26hnMYVJ9EiMQy54lmRcgUSxKe4hfxEEIr=s96-c', NULL, NULL),
('117394965341377048115', 'giulia.falanga@studenti.iispascal.it', 'Giulia', 'Falanga', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLtfT8ZEoC1FYSFPbyYiBIy5VeYb_KrV2k3qV11QCJAZC6-FJ_u=s96-c', NULL, NULL),
('117509651751011714925', 'claudiosammarco30@gmail.com', 'Claudio', 'Sammarco', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJQhrlXgBIiYGo6R4eWn5h9Blcmjl-NY84FRvJ_-2FiSYVzTt5h=s96-c', NULL, NULL),
('117589375180345370247', 'emmaprati14@gmail.com', 'Emma', 'Prati', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLmvzY6I5md7jtdXEJXTRR3uh4LIEnjBSb5V06ltqdplZQ6Lg=s96-c', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `Verifica`
--

CREATE TABLE `Verifica` (
  `ID` int NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `voto` decimal(4,1) DEFAULT NULL,
  `dataVerifica` date DEFAULT NULL,
  `peso` int DEFAULT NULL,
  `fk_id_materia` int DEFAULT NULL
) ;

--
-- Dump dei dati per la tabella `Verifica`
--

INSERT INTO `Verifica` (`ID`, `nome`, `voto`, `dataVerifica`, `peso`, `fk_id_materia`) VALUES
(44, 'Erguk', '9.5', '2025-05-16', 80, 19),
(45, '#gre', '8.5', '2025-05-16', 100, 19),
(46, 'ggcgfdgf', '6.5', '2025-05-16', 100, 19),
(47, '', '7.0', '2025-05-16', 100, 19),
(48, 'Grdgr', '7.5', '2025-05-16', 100, 19),
(49, '', '8.0', '2025-05-16', 100, 19),
(50, '', '8.0', '2025-05-16', 50, 19),
(51, '', '7.0', '2025-05-16', 100, 19),
(56, 'Orale', '9.0', '2025-01-21', 100, 21),
(58, 'Verifica', '8.5', '2025-02-26', 100, 21),
(59, 'Verifica', '9.0', '2025-03-22', 100, 21),
(60, 'Verifica', '10.0', '2025-04-16', 100, 21),
(61, 'niga', '7.5', '2025-05-20', 100, 22),
(62, 'as', '8.0', '2025-04-09', 80, 22),
(65, 'Orale', '9.5', '2025-02-04', 100, 23),
(66, 'Post WW2', '7.5', '2025-02-08', 100, 23),
(67, 'Modulo 3', '9.0', '2025-03-22', 100, 23),
(68, 'Sim. esame', '10.0', '2025-05-13', 100, 23),
(71, 'diosbronx', '7.0', '2025-05-21', 100, 24),
(72, 'verifica', '7.0', '2025-05-21', 100, 25),
(73, 'verifica', '10.0', '2025-05-12', 100, 25),
(74, 'verifica', '8.0', '2025-05-16', 90, 25),
(75, 'verifica', '10.0', '2025-05-14', 50, 25),
(76, 'verifica', '10.0', '2025-05-07', 100, 25),
(78, 'verifica', '9.0', '2025-05-08', 100, 25),
(79, 'verifica', '9.0', '2025-05-31', 100, 25),
(80, 'verifica', '2.0', '2025-05-21', 100, 25),
(81, 'Grammar', '5.0', '2025-02-05', 100, 26),
(82, 'Grammar', '5.0', '2025-03-12', 100, 26),
(84, 'Internet', '7.0', '2025-05-22', 100, 27),
(85, 'Internet', '8.0', '2025-05-22', 100, 27),
(86, 'Sicurezza', '6.5', '2025-05-22', 100, 27),
(90, 'Libro', '9.5', '2025-01-11', 80, 20),
(91, 'Tipo C', '9.0', '2025-01-13', 100, 20),
(92, 'Invalsi', '8.0', '2025-02-05', 50, 20),
(93, 'Orale', '9.0', '2025-02-12', 100, 20),
(94, 'Verifica', '8.0', '2025-02-26', 100, 20),
(95, 'Test', '7.0', '2025-04-23', 100, 20),
(96, 'Sim. esame', '8.5', '2025-04-29', 100, 20),
(97, 'Sim. Orale', '9.5', '2025-05-13', 100, 20),
(98, 'Sicurezza', '8.5', '2025-05-22', 100, 27),
(100, 'Pratico', '8.5', '2025-05-22', 100, 28),
(101, 'Web Ser.', '9.5', '2025-05-22', 100, 28),
(102, 'Teoria', '8.5', '2025-05-22', 100, 28),
(103, 'Vero/falso', '8.0', '2025-05-22', 100, 28),
(191, '.', '6.5', '2025-02-22', 100, 44),
(197, '.', '6.5', '2025-04-03', 100, 44),
(198, 'Simulazione seconda prova', '3.0', '2025-05-25', 100, 44),
(199, 'Interrogazione Tepsit', '5.0', '2025-05-26', 100, 44),
(200, 'PCTO', '7.5', '2025-05-26', 40, 44),
(201, '.', '7.0', '2025-02-17', 100, 45),
(202, '.', '6.5', '2025-02-17', 100, 45),
(203, '.', '5.5', '2025-04-14', 100, 45),
(204, '.', '6.5', '2025-04-14', 100, 45),
(205, 'Interrogazione Sistemi', '4.0', '2025-05-26', 100, 45),
(206, 'PCTO', '7.5', '2025-05-26', 80, 45),
(210, 'Prima guerra mondiale e primo dopoguerra', '10.0', '2025-01-07', 100, 47),
(211, 'Verifica scritta su rivoluzione russa, crisi del \'29 e New Deal', '8.5', '2025-02-26', 100, 47),
(212, 'Prova di verifica su Fascismo e Nazismo', '8.5', '2025-04-16', 100, 47),
(215, 'Seconda guerra mondiale. Guerra fredda.', '8.5', '2025-05-22', 100, 47),
(216, 'e1', '6.0', '2025-05-06', 100, 46),
(217, 'e2', '5.5', '2025-05-02', 100, 46),
(218, 'e3', '5.5', '2025-05-03', 100, 46),
(219, 'PCTO', '7.5', '2025-05-26', 40, 47),
(220, 'e4', '5.5', '2025-05-02', 100, 46),
(221, 'Verifica ciclo di vita sw e metodologie di sviluppo del sw', '7.0', '2025-02-01', 100, 48),
(223, '.', '3.0', '2025-03-30', 100, 48),
(224, 't1', '3.0', '2025-05-22', 100, 49),
(225, 't2', '4.0', '2025-05-01', 100, 49),
(226, 'Verifica outsourcing e cicli aziendali', '8.5', '2025-05-10', 100, 48),
(227, 'PCTO', '7.5', '2025-05-26', 40, 48),
(228, 't3', '5.5', '2025-05-10', 100, 49),
(229, 't4', '8.0', '2025-05-11', 40, 49),
(230, '.', '6.0', '2025-01-15', 100, 50),
(231, '.', '6.0', '2025-02-19', 100, 50),
(232, '.', '5.5', '2025-03-15', 100, 50),
(233, '.', '6.5', '2025-04-12', 100, 50),
(234, 'Interrogazione matematica', '7.0', '2025-05-09', 100, 50),
(235, 'Verifica Query Language e algebra relazionale', '7.0', '2025-02-21', 100, 51),
(236, 'Verifica Generalizzazioni', '9.0', '2025-03-21', 100, 51),
(237, '.', '5.5', '2025-04-07', 100, 51),
(238, 'Interrogazione Informatica', '6.0', '2025-05-05', 100, 51),
(239, 'Simulazione seconda prova', '4.5', '2025-05-08', 100, 51),
(240, 'PCTO', '7.5', '2025-05-26', 80, 51),
(241, 'Interrogazioni sul Decadentismo: approfondimenti su Baudelaire, D\'Annunzio e Pascoli', '9.0', '2025-01-24', 100, 52),
(242, 'Verifiche orali su avanguardie storiche, Ungaretti e Montale', '9.0', '2025-03-19', 100, 52),
(243, 'Simulazione prima prova', '9.0', '2025-04-29', 100, 52),
(244, 'PCTO', '7.5', '2025-05-26', 80, 52),
(245, '.', '6.0', '2025-04-14', 100, 53),
(246, '.', '7.5', '2025-04-16', 100, 53),
(247, 'Verifica scritta modulo \"Algie vertebrali\"', '6.5', '2025-01-14', 100, 54),
(248, 'Progetto Padel', '8.0', '2025-03-18', 100, 54),
(249, '\"Tirocinio sportivo\": presentazione a coppie di uno sport alla classe', '8.5', '2025-04-15', 100, 54),
(250, '.', '8.5', '2025-01-31', 50, 55),
(251, '.', '9.5', '2025-02-05', 100, 55),
(252, '.', '7.5', '2025-03-29', 70, 55),
(253, 'PCTO', '7.5', '2025-05-26', 40, 54),
(254, 'PCTO', '7.5', '2025-05-26', 40, 55),
(255, 'verifica', '8.0', '2025-02-17', 100, 56),
(256, 'verifica', '8.0', '2025-02-17', 100, 56),
(257, 'verifica', '7.5', '2025-04-14', 100, 56),
(258, 'verifica', '7.0', '2025-04-14', 100, 56),
(259, 'interrogazione', '6.5', '2025-05-17', 100, 56),
(260, 'pcto', '8.0', '2025-05-26', 80, 56),
(261, 'verifica', '8.0', '2025-02-22', 100, 57),
(262, 'web service', '6.0', '2025-04-03', 100, 57),
(263, 'interrogazione', '6.5', '2025-05-17', 100, 57),
(264, 'simulazione', '6.5', '2025-05-25', 100, 57),
(265, '', '8.5', '2025-01-31', 50, 63),
(266, '', '8.0', '2025-02-05', 100, 63),
(267, '', '8.0', '2025-03-29', 70, 63),
(268, 'interrogazione', '7.5', '2025-05-24', 100, 63),
(269, 'ww1', '7.5', '2025-01-07', 100, 61),
(270, '\'29', '7.5', '2025-02-26', 100, 61),
(271, 'Fasc-naz', '8.0', '2025-02-26', 100, 61),
(272, 'ww2', '8.5', '2025-05-22', 100, 61),
(273, 'dwada', '6.0', '2025-05-26', 100, 66),
(275, '.', '7.0', '2025-05-27', 100, 67),
(276, 'Prova scritta su Pirandello, Svevo e il romanzo del Novecento', '8.5', '2025-05-13', 80, 52),
(281, '1', '9.0', '2025-05-13', 80, 68),
(282, '2', '10.0', '2025-04-29', 100, 68),
(284, '3', '9.0', '2025-03-19', 100, 68),
(285, 'Verifica integrali definiti', '4.0', '2025-05-24', 100, 50),
(286, '4', '7.0', '2025-02-03', 100, 68),
(287, 'PCTO', '7.5', '2025-05-26', 80, 50),
(288, '5', '9.0', '2025-01-24', 100, 68),
(289, 'PCTO', '8.0', '2025-05-30', 80, 68),
(290, 'PCTO', '8.0', '2025-05-31', 40, 69),
(291, '1', '9.0', '2025-05-22', 100, 69),
(292, '2', '8.5', '2025-04-16', 100, 69),
(293, '3', '7.5', '2025-02-26', 100, 69),
(294, '4', '8.5', '2025-01-07', 100, 69),
(295, '1', '5.0', '2025-05-25', 100, 74),
(296, '2', '7.0', '2025-04-03', 100, 74),
(297, 'PCTO', '8.0', '2025-05-30', 40, 74),
(298, '3', '8.0', '2025-02-22', 100, 74),
(299, '4', '6.0', '2025-05-26', 100, 74),
(300, 'PCTO', '8.0', '2025-05-30', 80, 75),
(301, '1', '7.0', '2025-04-14', 100, 75),
(302, '2', '7.5', '2025-04-14', 100, 75),
(303, '3', '8.0', '2025-02-22', 100, 75),
(304, '4', '7.5', '2025-02-22', 100, 75),
(305, 'PCTO', '8.0', '2025-05-26', 40, 72),
(306, '1', '5.5', '2025-05-20', 100, 72),
(307, '2', '9.0', '2025-05-10', 100, 72),
(308, '3', '9.0', '2025-02-01', 100, 72),
(309, '3', '9.0', '2025-02-01', 100, 72),
(310, '1', '7.5', '2025-04-16', 100, 76),
(311, '2', '7.0', '2025-04-14', 100, 76),
(313, 'PCTO', '8.0', '2025-05-30', 20, 76),
(314, 'PCTO', '8.0', '2025-05-26', 80, 71),
(315, '1', '7.5', '2025-05-08', 100, 71),
(316, '2', '6.5', '2025-04-07', 100, 71),
(317, '3', '8.0', '2025-03-21', 100, 71),
(318, '4', '4.0', '2025-03-18', 50, 71),
(319, '5', '8.0', '2025-02-21', 100, 71),
(320, '6', '7.5', '2025-02-07', 100, 71),
(321, 'PCTO', '8.0', '2025-05-30', 40, 73),
(322, '1', '8.0', '2025-04-15', 100, 73),
(323, '2', '9.0', '2025-01-14', 100, 73),
(324, '1', '7.0', '2025-05-20', 50, 70),
(325, '2', '4.5', '2025-04-12', 100, 70),
(326, '3', '5.5', '2025-03-15', 100, 70),
(327, '4', '6.5', '2025-02-19', 100, 70),
(328, '5', '8.5', '2025-01-15', 100, 70),
(329, '6', '8.0', '2025-05-27', 100, 70),
(330, 'PCTO', '8.0', '2025-05-31', 80, 70),
(331, '88', '8.0', '2025-05-06', 80, 77),
(332, 'q', '9.0', '2025-03-07', 100, 77),
(333, '11', '5.5', '2025-05-30', 100, 77),
(334, 'ee', '5.5', '2025-05-12', 100, 77),
(335, '3ww', '5.5', '2025-04-29', 100, 77),
(336, 'wwww', '5.0', '2025-05-05', 100, 77),
(337, 'ss', '7.5', '2025-05-17', 100, 77),
(338, 'o', '6.0', '2025-05-14', 100, 46),
(339, 'Verifica', '10.0', '2025-05-29', 100, 21),
(340, 'PCTO', '8.5', '2025-05-29', 80, 21),
(342, 'PCTO', '8.5', '2025-05-29', 40, 23),
(343, 'PCTO', '8.5', '2025-05-29', 80, 27),
(345, 'Verifica privacy', '8.5', '2025-05-30', 100, 48),
(346, 'Verifica privacy', '8.5', '2025-05-30', 100, 53),
(347, 'PCTO', '7.5', '2025-05-30', 20, 53),
(348, 'Interrogazione', '8.0', '2025-05-28', 100, 55),
(349, '.', '6.5', '2025-05-30', 100, 48),
(350, '.', '7.0', '2025-05-30', 100, 48),
(351, '.', '6.0', '2025-05-30', 100, 48),
(352, '.', '5.5', '2025-05-30', 100, 51),
(353, '.', '7.0', '2025-05-30', 100, 48),
(354, '.', '6.0', '2025-05-30', 100, 51),
(355, '.', '7.0', '2025-05-30', 100, 51),
(356, 'sql1', '3.0', '2025-05-07', 100, 78),
(357, 'er', '7.0', '2025-05-20', 100, 78),
(358, 'utenti', '6.0', '2025-05-17', 100, 78),
(359, 'simulazione', '7.0', '2025-05-14', 100, 78),
(360, 'orale', '5.5', '2025-05-07', 100, 78),
(361, 'pcto', '8.0', '2025-04-29', 80, 78),
(363, 'Fdngfdgfjdngfdkgfdnht', '8.0', '2025-05-22', 80, 19),
(364, 'Industr.', '10.0', '2025-06-30', 100, 26);

--
-- Trigger `Verifica`
--
DELIMITER $$
CREATE TRIGGER `aggiorna_media_after_delete` AFTER DELETE ON `Verifica` FOR EACH ROW BEGIN
    DECLARE nuova_media DECIMAL(5,2);

    SELECT 
        IFNULL(SUM(v.voto * v.peso / 100) / NULLIF(SUM(v.peso / 100), 0), 0)
    INTO nuova_media
    FROM Verifica v
    WHERE v.fk_id_materia = OLD.fk_id_materia;

    UPDATE Materia
    SET media = nuova_media
    WHERE ID = OLD.fk_id_materia;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aggiorna_media_after_insert` AFTER INSERT ON `Verifica` FOR EACH ROW BEGIN
    UPDATE Materia
    SET media = (
        SELECT SUM(v.voto * v.peso / 100) / SUM(v.peso / 100)
        FROM Verifica v
        WHERE v.fk_id_materia = NEW.fk_id_materia
    )
    WHERE ID = NEW.fk_id_materia;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aggiorna_media_after_update` AFTER UPDATE ON `Verifica` FOR EACH ROW BEGIN
    UPDATE Materia
    SET media = (
        SELECT SUM(v.voto * v.peso / 100) / SUM(v.peso / 100)
        FROM Verifica v
        WHERE v.fk_id_materia = NEW.fk_id_materia
    )
    WHERE ID = NEW.fk_id_materia;
END
$$
DELIMITER ;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `ElementoLista`
--
ALTER TABLE `ElementoLista`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ElementoLista_ibfk_1` (`fk_id_studente`);

--
-- Indici per le tabelle `Impegno`
--
ALTER TABLE `Impegno`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Impegno_ibfk_1` (`fk_id_studente`);

--
-- Indici per le tabelle `Materia`
--
ALTER TABLE `Materia`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_materia_studente` (`fk_id_studente`);

--
-- Indici per le tabelle `OraLezione`
--
ALTER TABLE `OraLezione`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `OraLezione_ibfk_1` (`fk_id_studente`);

--
-- Indici per le tabelle `Studente`
--
ALTER TABLE `Studente`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `Verifica`
--
ALTER TABLE `Verifica`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_verifica_materia` (`fk_id_materia`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `ElementoLista`
--
ALTER TABLE `ElementoLista`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `Impegno`
--
ALTER TABLE `Impegno`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT per la tabella `Materia`
--
ALTER TABLE `Materia`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT per la tabella `OraLezione`
--
ALTER TABLE `OraLezione`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=572;

--
-- AUTO_INCREMENT per la tabella `Verifica`
--
ALTER TABLE `Verifica`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ElementoLista`
--
ALTER TABLE `ElementoLista`
  ADD CONSTRAINT `ElementoLista_ibfk_1` FOREIGN KEY (`fk_id_studente`) REFERENCES `Studente` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `Impegno`
--
ALTER TABLE `Impegno`
  ADD CONSTRAINT `Impegno_ibfk_1` FOREIGN KEY (`fk_id_studente`) REFERENCES `Studente` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `Materia`
--
ALTER TABLE `Materia`
  ADD CONSTRAINT `fk_materia_studente` FOREIGN KEY (`fk_id_studente`) REFERENCES `Studente` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `OraLezione`
--
ALTER TABLE `OraLezione`
  ADD CONSTRAINT `OraLezione_ibfk_1` FOREIGN KEY (`fk_id_studente`) REFERENCES `Studente` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limiti per la tabella `Verifica`
--
ALTER TABLE `Verifica`
  ADD CONSTRAINT `fk_verifica_materia` FOREIGN KEY (`fk_id_materia`) REFERENCES `Materia` (`ID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
