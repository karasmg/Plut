-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 20 2017 г., 15:05
-- Версия сервера: 5.5.53
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `pluton`
--

-- --------------------------------------------------------

--
-- Структура таблицы `codes_work`
--

CREATE TABLE `codes_work` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(15) NOT NULL COMMENT 'Код работ',
  `name` varchar(155) NOT NULL COMMENT 'Наименование',
  `type_id` int(10) UNSIGNED NOT NULL COMMENT 'Вид работ (из таблицы видов работ)',
  `note` int(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Примечание'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `codes_work`
--

INSERT INTO `codes_work` (`id`, `code`, `name`, `type_id`, `note`) VALUES
(1, '10', 'Разработка новой техники на перспективу', 1, 1),
(2, '15', 'Поддержка продаж', 2, 1),
(3, '20', 'Разработка документации для внешних согласований', 3, 1),
(4, '25', 'Разработка КД для производства', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `department_structure`
--

CREATE TABLE `department_structure` (
  `id` int(10) UNSIGNED NOT NULL,
  `structure_category` varchar(55) NOT NULL COMMENT 'Категории по структуре отдела'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Категории по структуре отдела';

--
-- Дамп данных таблицы `department_structure`
--

INSERT INTO `department_structure` (`id`, `structure_category`) VALUES
(1, 'Руководитель КО'),
(2, 'Начальник сектора'),
(3, 'Сотрудник');

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(55) NOT NULL COMMENT 'Имя',
  `middle_name` varchar(55) NOT NULL COMMENT 'Отчество',
  `last_name` varchar(55) NOT NULL COMMENT 'Фамилия',
  `department_id` int(10) UNSIGNED NOT NULL COMMENT 'Категория по структуре отдела',
  `sector_id` int(10) UNSIGNED NOT NULL COMMENT 'Сектор',
  `status` int(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Статус'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `middle_name`, `last_name`, `department_id`, `sector_id`, `status`) VALUES
(1, 'Алексей', 'Валентинович', 'Бедовский', 2, 6, 1),
(2, 'Алексей', 'Константинович', 'Резниченко', 3, 6, 1),
(3, 'Дмитрий', 'Анатольевич', 'Марченко', 1, 1, 1),
(4, 'Андрей', 'Викторович', 'Крутько', 2, 2, 1),
(5, 'Евгений', 'Александрович', 'Бурцев', 2, 3, 1),
(6, 'Василий', 'Иванович', 'Пупкин', 3, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(15) NOT NULL COMMENT 'Номер заказа',
  `project_id` int(10) UNSIGNED NOT NULL COMMENT 'Номер проекта',
  `name` varchar(155) NOT NULL COMMENT 'Наименование',
  `responsible_id` int(10) UNSIGNED NOT NULL COMMENT 'Ответственный',
  `budget_hours` int(5) UNSIGNED NOT NULL COMMENT 'Бюджет часов',
  `planned_end_date` date NOT NULL COMMENT 'Запланированная дата выполнения',
  `actual_end_date` date DEFAULT NULL COMMENT 'Фактическая дата выполнения',
  `status` int(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Статус'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `number`, `project_id`, `name`, `responsible_id`, `budget_hours`, `planned_end_date`, `actual_end_date`, `status`) VALUES
(5, '1912-3', 3, 'РУ-825ОШ-Д-П', 4, 87, '2017-02-17', '2017-02-19', 2),
(6, '1920-1', 1, 'РУ-825 (комплект 10 ячеек)', 5, 500, '2017-02-26', '2017-02-28', 1),
(7, '1910-1', 5, 'Отсек вторичных цепей КРУ-35 кВ. (комплект 4 ячейки)', 5, 325, '2017-05-20', NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `project`
--

CREATE TABLE `project` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(15) NOT NULL COMMENT 'Номер пректа',
  `name` varchar(155) NOT NULL COMMENT 'Наименование',
  `customer` varchar(155) NOT NULL COMMENT 'Заказчик',
  `status` int(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Статус',
  `responsible_id` int(10) UNSIGNED NOT NULL COMMENT 'Ответственный',
  `budget_hours` int(5) UNSIGNED NOT NULL COMMENT 'Бюджет часов',
  `planned_end_date` date NOT NULL COMMENT 'Запланированная дата выполнения',
  `actual_end_date` date DEFAULT NULL COMMENT 'Фактическая дата выполнения'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `project`
--

INSERT INTO `project` (`id`, `number`, `name`, `customer`, `status`, `responsible_id`, `budget_hours`, `planned_end_date`, `actual_end_date`) VALUES
(1, '001', 'Тяговая подстанция', 'Стокгольм', 0, 1, 200, '2017-01-27', '2017-01-31'),
(2, '002', 'Оборудование постоянного тока', 'Баку', 1, 3, 300, '2017-01-31', '2017-02-16'),
(3, '003', 'Реверсивный выпрямитель', 'IPH центр', 1, 2, 100, '2017-01-20', '2017-01-18'),
(4, '004', 'Тяговая подстанция', 'Баку', 1, 1, 34, '2017-01-28', '2017-01-29'),
(5, '005', 'Ретрофит', 'Киев метрополитен', 2, 2, 46, '2017-02-09', '2017-02-26'),
(6, '006', 'Оборудование постоянного тока', 'Харьков-метро проект', 2, 3, 234, '2017-02-12', '2017-02-25'),
(7, '007', 'Тяговая подстанция', 'Львовская ж/д', 2, 2, 543, '2017-02-23', '2017-02-26');

-- --------------------------------------------------------

--
-- Структура таблицы `project_category`
--

CREATE TABLE `project_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `responsible_for` varchar(55) NOT NULL COMMENT 'Категории по проектам'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `project_category`
--

INSERT INTO `project_category` (`id`, `responsible_for`) VALUES
(1, 'Ответственный за проект'),
(2, 'Ответственный за заказ');

-- --------------------------------------------------------

--
-- Структура таблицы `sector`
--

CREATE TABLE `sector` (
  `id` int(10) UNSIGNED NOT NULL,
  `sector` varchar(55) NOT NULL COMMENT 'Сектор'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sector`
--

INSERT INTO `sector` (`id`, `sector`) VALUES
(1, 'Руководство'),
(2, 'Тягового оборудования'),
(3, 'Низковольтных комплектных устройств'),
(4, 'Электронных устройств и телемеханики'),
(5, 'Отправочной документации'),
(6, 'Оборудования среднего напряжения');

-- --------------------------------------------------------

--
-- Структура таблицы `work_types`
--

CREATE TABLE `work_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'Виды работ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица видов работ';

--
-- Дамп данных таблицы `work_types`
--

INSERT INTO `work_types` (`id`, `type`) VALUES
(1, 'Основные'),
(2, 'Вспомогалельные'),
(3, 'Непроизводительное время');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `codes_work`
--
ALTER TABLE `codes_work`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `department_structure`
--
ALTER TABLE `department_structure`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Индексы таблицы `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Индексы таблицы `project_category`
--
ALTER TABLE `project_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `work_types`
--
ALTER TABLE `work_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `codes_work`
--
ALTER TABLE `codes_work`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `department_structure`
--
ALTER TABLE `department_structure`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `project`
--
ALTER TABLE `project`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `project_category`
--
ALTER TABLE `project_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `sector`
--
ALTER TABLE `sector`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `work_types`
--
ALTER TABLE `work_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
