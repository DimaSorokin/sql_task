-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Июн 04 2019 г., 20:09
-- Версия сервера: 5.7.26-0ubuntu0.18.04.1
-- Версия PHP: 7.2.17-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db_keyua`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`) VALUES
(1, 'Фильмы', 17),
(2, 'Мультф', 18),
(3, 'Комедия', 20),
(4, 'Драма', 20),
(5, 'Фэнтези', 20),
(6, 'Боевик', 20),
(7, 'Триллер', 20),
(8, 'Детский', 2),
(9, 'Семейное', 22),
(10, 'Фантастика', 20),
(11, 'Драма', 22),
(12, 'Фантастика', 22),
(13, 'Музика', 0),
(14, 'Видео', 0),
(15, 'Наши', 2),
(16, 'Зарубежные', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`) VALUES
(1, 'Побег из Шоушенка'),
(2, 'Зеленая миля'),
(3, 'Форрест Гамп'),
(4, 'Список Шиндлера '),
(5, '1+1'),
(6, 'Бойцовский клуб'),
(7, 'Престиж'),
(8, 'Игры разума'),
(9, 'Интерстеллар'),
(10, 'Назад в будущее '),
(11, 'Матрица');

-- --------------------------------------------------------

--
-- Структура таблицы `product_to_categories`
--

CREATE TABLE `product_to_categories` (
  `product_id` int(11) NOT NULL DEFAULT '0',
  `categ_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_to_categories`
--

INSERT INTO `product_to_categories` (`product_id`, `categ_id`) VALUES
(7, 3),
(7, 6),
(6, 3),
(6, 6),
(6, 14),
(5, 14),
(5, 6),
(4, 5),
(4, 0),
(3, 14),
(3, 7),
(3, 4),
(2, 4),
(2, 5),
(2, 6),
(1, 14),
(1, 6),
(8, 9),
(8, 11),
(8, 13),
(9, 13),
(9, 15),
(9, 11),
(10, 10),
(10, 12),
(10, 13),
(10, 15),
(10, 16),
(11, 10),
(11, 11),
(11, 15),
(11, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
