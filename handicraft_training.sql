-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 25 2021 г., 18:00
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `handicraft_training`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
(2, 'Вышивка', 'Вышива́ние (вы́шивка) — общеизвестное и распространенное рукодельное искусство украшать самыми различными узорами всевозможные ткани и материалы, от самых грубых и плотных, как, например: полотно, холст, кожа, до тончайших материй — батиста, кисеи, газа, тюля и пр. Инструменты и материалы для работы вышивания: иглы, нитки, пяльцы, ножницы. ', '2021-04-01 16:25:38', '2021-04-01 16:25:38'),
(11, 'Вязание', 'Вяза́ние — процесс изготовления полотна или изделий (обычно элементов одежды или предметов интерьера) из одной или нескольких нитей путём изгибания их в петли и соединения петель друг с другом с помощью несложных инструментов,вручную (вязальные крючок, спицы, игла, вилка; или просто на пальцах[en]) или на вязальной машине (механическое вязание).\r\n\r\nВязание, как техника, относится к видам плетения, применяется для изготовления предметов одежды (носки, перчатки, шапки и так далее) и белья (салфетки, скатерти, занавески и так далее), декорирования интерьера. ', '2021-04-01 17:22:23', '2021-04-01 17:22:23'),
(12, 'Оригами', 'Орига́ми (яп. 折り紙, букв.: «сложенная бумага») — вид декоративно-прикладного искусства; японское искусство складывания фигурок из бумаги.\r\n\r\nИскусство оригами своими корнями уходит в Древний Китай, где и была изобретена бумага. Первоначально оригами использовалось в религиозных обрядах. Долгое время этот вид искусства был доступен только представителям высших сословий, где признаком хорошего тона было владение техникой складывания из бумаги.\r\n\r\nКлассическое оригами складывается из квадратного листа бумаги.\r\n\r\nСуществует определённый набор условных знаков, необходимых для того, чтобы зарисовать схему складывания даже самого сложного изделия. Бо́льшая часть условных знаков была введена в практику в 1954 г. известным японским мастером Акирой Ёсидзавой (1911—2005).\r\n\r\nКлассическое оригами предписывает использование одного листа бумаги без применения ножниц. При этом часто для шейпинга (shaping) сложной модели, то есть придания ей формы, или для её консервации используется пропитка исходного листа клеевыми составами, содержащими метилцеллюлозу[1] или ПВА. ', '2021-04-01 17:22:49', '2021-04-01 17:22:49');

-- --------------------------------------------------------

--
-- Структура таблицы `lessons`
--

CREATE TABLE `lessons` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  `video` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `lessons`
--

INSERT INTO `lessons` (`id`, `name`, `description`, `content`, `video`, `image`, `level`, `category`, `createdAt`, `updatedAt`) VALUES
(1, 'Вышивка крестиком – материалы, процесс, оформление', 'Вышивка крестиком неспроста популярна уже многие века – она не только красива и долговечна; вышивка привносит в жизнь домашний уют и обладает положительной энергетикой, так как мастерица вложила в нее не только свои силы, но и частичку души.', '<p>Вышивка крестиком неспроста популярна уже многие века – она не только красива и долговечна; вышивка привносит в жизнь домашний уют и обладает положительной энергетикой, так как мастерица вложила в нее не только свои силы, но и частичку души.</p><ul>\r\n\r\nЕсли вы еще не пробовали вышивать крестиком или пока делаете свои первые шаги в этом виде рукоделия, вам будет полезна эта статья, из которой вы узнаете:\r\n\r\n<ol>какие приспособления и аксессуары необходимы для вышивки</ol>\r\n<ol>как осуществляется процесс вышивания</ol>\r\n<ol>как оформлять готовую работу</ol>\r\n</ul>\r\n\r\n\r\n1) Перед тем, как приступить к вышиванию вам понадобятся следующие материалы:\r\n\r\n- схема для вышивки;\r\n\r\n- канва для вышивания;\r\n\r\n- нитки мулине или шерсть;\r\n\r\n- специальная иголка;\r\n\r\n- пяльцы для вышивания (также удобна подставка к ним);\r\n\r\n- ножнички;\r\n\r\n- лупы, лампы, магнитные доски (при желании).\r\n\r\n\r\n\r\nЕсли вы новичок в вышивании, обратите внимание на наборы для вышивки – в них содержится все необходимое – качественная разработанная схема, подобранные цвета мулине, иголка и инструкция. Для начала лучше выбрать небольшой набор, чтобы в следующий раз суметь правильно рассчитать свои силы относительно размера вышивки. Также можно найти бесплатную схему в интернете, к которой необходимо будет подобрать цвета мулине самостоятельно.', 'https://www.youtube.com/watch?v=YijUlbjEfPQ', 'https://www.sibvishivka.ru/upload/iblock/60c/60c520fe17fdd4b7eb63881d706b538b.jpg', 'высокий', 2, '2021-04-02 07:19:50', '2021-04-02 07:19:50'),
(2, 'Как связать шапку спицами? Схемы, описание\r\n', 'Не нужно думать, что вязание шапок спицами, это трудно. Вы можете для начала вязать простую модель, постепенно набираться мастерства, потом взяться за вязание шапочки более сложного фасона. ', ' <p><strong> Как правильно связать?</strong></p>\r\n <p> Набираем спицами 110 петель, вяжем резинкой 1*1 четыре ряда. </p>\r\n <p>Основной узор <a href=\"https://tatuchkaclub.ru/shapki-spitsami/zhenskie-shapki/uzorom-pletenka\" target=\"_blank\" rel=\"noopener noreferrer\">шапки для женщин – плетенка</a>.</p>\r\n <p> Схема вязания: Равномерно прибавляем 70 петель, потом 4 ряда лицевыми. </p>\r\n <p>Подробно, как вязать узор <a href=\"https://tatuchkaclub.ru/uzory-spitsami/bazovyye/vse-vidy-uzora-pletenka-spitsami-so-shemami-i-opisaniem-vyazaniya\" target=\"_blank\">здесь</a>.</p>\r\n <p> В пятом делаем перекрещивание пять на пять по схеме:</p><p><img src=\"https://tatuchkaclub.ru/wp-content/uploads/2018/06/shema-vyazaniya-uzora-pletenka.jpg\" alt=\"Схема вязания узора плетенка\" width=\"700px\"></p>\r\n <p><a href=\'https://tatuchkaclub.ru/shapki-spitsami/zhenskie-shapki/kak-svyazat-shapku-spitsami\'>Детали урока</a></p>\r\n\r\n', 'https://www.youtube.com/watch?v=7ec060a3NmU', 'https://tatuchkaclub.ru/wp-content/uploads/2018/06/vyazat-shapku.jpg', 'средний', 11, '2021-04-02 07:21:35', '2021-04-02 07:21:35');

-- --------------------------------------------------------

--
-- Структура таблицы `mylessons`
--

CREATE TABLE `mylessons` (
  `id` int NOT NULL,
  `user` int DEFAULT NULL,
  `lesson` int DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `mylessons`
--

INSERT INTO `mylessons` (`id`, `user`, `lesson`, `createdAt`, `updatedAt`) VALUES
(35, 1, 2, '2021-04-25 14:57:01', '2021-04-25 14:57:01');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'mokruy9999@gmail.com', '$2a$08$HqhZo1MqRIdHqqniUJLXzeGgjurzZLcw3GlETIRzCupuGZUALuxdy', '2021-04-23 15:33:03', '2021-04-23 15:33:03'),
(3, 'mo@gmail.com', '$2a$08$oSupUp2OGWEbyE/xOlIK0ukx0Zhj6gQ2Va3kjdsPqSjsn4FsGsUqe', '2021-04-24 07:38:47', '2021-04-24 07:38:47');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Индексы таблицы `mylessons`
--
ALTER TABLE `mylessons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`,`lesson`),
  ADD KEY `lesson` (`lesson`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `mylessons`
--
ALTER TABLE `mylessons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `mylessons`
--
ALTER TABLE `mylessons`
  ADD CONSTRAINT `mylessons_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mylessons_ibfk_2` FOREIGN KEY (`lesson`) REFERENCES `lessons` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
