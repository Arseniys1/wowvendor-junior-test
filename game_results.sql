-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 19 2021 г., 11:37
-- Версия сервера: 5.7.31
-- Версия PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wowvendor.local`
--

-- --------------------------------------------------------

--
-- Структура таблицы `game_results`
--

DROP TABLE IF EXISTS `game_results`;
CREATE TABLE IF NOT EXISTS `game_results` (
  `game_result` int(11) NOT NULL,
  `rock_size` int(11) NOT NULL,
  `rock_position` int(11) NOT NULL,
  `jump_distance_start` int(11) NOT NULL,
  `jump_distance_stop` int(11) NOT NULL,
  `race_time` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `game_results`
--

INSERT INTO `game_results` (`game_result`, `rock_size`, `rock_position`, `jump_distance_start`, `jump_distance_stop`, `race_time`) VALUES
(1, 84, 472, 188, 368, 13),
(1, 48, 551, 188, 570, 88.61),
(1, 67, 362, 368, 572, 5.56),
(1, 76, 463, 368, 442, 159.37),
(1, 59, 762, 368, 546, 137.03),
(1, 60, 891, 480, 660, 12.85),
(1, 80, 727, 480, 950, 10.99),
(1, 68, 521, 498, 702, 5.36),
(1, 41, 786, 314, 866, 38.17),
(1, 44, 342, 314, 814, 5.11),
(0, 67, 284, 740, 874, 9.64),
(0, 43, 418, 740, 356, 28.52),
(1, 42, 494, 386, 594, 5.54),
(0, 58, 893, 624, 826, 5.32),
(1, 79, 687, 200, 410, 5.68),
(1, 75, 893, 200, 368, 23.54),
(1, 50, 326, 426, 598, 5.51),
(1, 51, 805, 426, 370, 5.11),
(1, 72, 395, 426, 858, 75.33);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
