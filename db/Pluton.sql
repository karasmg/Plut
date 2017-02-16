-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 16 2017 г., 08:31
-- Версия сервера: 5.5.41-log
-- Версия PHP: 5.4.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `pluton`
--

-- --------------------------------------------------------

--
-- Структура таблицы `codes_work`
--

CREATE TABLE IF NOT EXISTS `codes_work` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(15) NOT NULL COMMENT 'Код работ',
  `name` varchar(155) NOT NULL COMMENT 'Наименование',
  `type_id` int(10) unsigned NOT NULL COMMENT 'Вид работ (из таблицы видов работ)',
  `note` int(1) unsigned NOT NULL DEFAULT '2' COMMENT 'Примечание',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `codes_work`
--

INSERT INTO `codes_work` (`id`, `code`, `name`, `type_id`, `note`) VALUES
(1, '10', 'Разработка новой техники на перспективу', 1, 2),
(2, '15', 'Поддержка продаж', 2, 2),
(3, '20', 'Разработка документации для внешних согласований', 3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `department_structure`
--

CREATE TABLE IF NOT EXISTS `department_structure` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `structure_category` varchar(55) NOT NULL COMMENT 'Категории по структуре отдела',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Категории по структуре отдела' AUTO_INCREMENT=6 ;

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

CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(55) NOT NULL,
  `middle_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `sector_id` int(10) unsigned NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `middle_name`, `last_name`, `department_id`, `sector_id`, `status`) VALUES
(1, 'Алексей', 'Валентинович', 'Бедовский', 2, 3, 0),
(2, 'Алексей', 'Константинович', 'Резниченко', 1, 5, 1),
(3, 'Дмитрий', 'Анатольевич', 'Марченко', 1, 1, 1),
(4, 'Максим', 'Григорьевич', 'Карась', 1, 1, 0),
(5, 'Иван', 'Иванович', 'Иванов', 3, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(15) NOT NULL,
  `name` varchar(155) NOT NULL,
  `responsible_id` int(10) unsigned NOT NULL,
  `budget_hours` int(5) unsigned NOT NULL,
  `planned_end_date` date NOT NULL,
  `actual_end_date` date DEFAULT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `number`, `name`, `responsible_id`, `budget_hours`, `planned_end_date`, `actual_end_date`, `status`) VALUES
(1, '1910-1', 'Отсек вторичных цепей КРУ-35 кВ (комплект 4 ячейки)', 1, 250, '2017-03-10', '2017-04-19', 1),
(2, '1911', 'РУ-825 (комплект 10 ячеек)', 2, 400, '2017-04-12', '2017-03-23', 1),
(3, '1912-1', 'РУ-825 ОШ-Д-П', 3, 500, '2017-05-20', '2017-06-24', 1),
(4, '213', '123', 1, 3, '2017-02-08', '2017-02-08', 1),
(5, '3234', '124', 2, 3, '2017-02-15', '2017-02-03', 0),
(6, '12', '123213', 2, 3, '2017-02-01', '2017-02-09', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(15) NOT NULL,
  `name` varchar(155) NOT NULL,
  `customer` varchar(155) NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '1',
  `responsible_id` int(10) unsigned NOT NULL,
  `budget_hours` int(5) unsigned NOT NULL,
  `planned_end_date` date NOT NULL,
  `actual_end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `project`
--

INSERT INTO `project` (`id`, `number`, `name`, `customer`, `status`, `responsible_id`, `budget_hours`, `planned_end_date`, `actual_end_date`) VALUES
(1, '001', 'Тяговая подстанция', 'Стокгольм', 1, 1, 200, '2017-01-27', '2017-01-31'),
(2, '002', 'Оборудование постоянного тока', 'Баку', 1, 3, 300, '2017-01-31', '2017-02-16'),
(3, '003', 'Реверсивный выпрямитель', 'IPH центр', 1, 2, 100, '2017-01-20', '2017-01-18');

-- --------------------------------------------------------

--
-- Структура таблицы `project_category`
--

CREATE TABLE IF NOT EXISTS `project_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `responsible_for` varchar(55) NOT NULL COMMENT 'Категории по проектам',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `sector` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sector` varchar(55) NOT NULL COMMENT 'Сектор',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `sector`
--

INSERT INTO `sector` (`id`, `sector`) VALUES
(1, 'Руководство'),
(2, 'Тягового оборудования'),
(3, 'Низковольтных комплектных устройств'),
(4, 'Электронных устройств и телемеханики'),
(5, 'Отправочной документации'),
(6, 'Оборудования среднего напряжения'),
(7, 'wertertgergt');

-- --------------------------------------------------------

--
-- Структура таблицы `work_days`
--

CREATE TABLE IF NOT EXISTS `work_days` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `date` date NOT NULL COMMENT 'Дата',
  `hours` int(2) unsigned DEFAULT NULL COMMENT 'Кол-во рабочих часов',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `work_days`
--

INSERT INTO `work_days` (`id`, `date`, `hours`) VALUES
(1, '2017-02-15', 20),
(2, '2017-02-16', 19);

-- --------------------------------------------------------

--
-- Структура таблицы `work_types`
--

CREATE TABLE IF NOT EXISTS `work_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT 'Виды работ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Таблица видов работ' AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `work_types`
--

INSERT INTO `work_types` (`id`, `type`) VALUES
(1, 'Основные'),
(2, 'Вспомогалельные'),
(3, 'Непроизводительное время');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
