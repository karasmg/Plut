-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 02 2017 г., 23:28
-- Версия сервера: 5.5.50-log
-- Версия PHP: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Pluton`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Admin', '2', NULL),
('Admin', '3', 1493750674),
('Admin', '7', 1493752247),
('Admin', '8', 1493752077),
('Admin', '9', 1487842668),
('Guest', '4', 1487840022),
('User', '1', 1487840045),
('User', '14', 1493752226),
('User', '15', 1493750712),
('User', '16', 1493750747),
('User', '17', 1493752021),
('User', '18', 1493751997),
('User', '19', 1493751981),
('User', '20', 1493751963),
('User', '23', 1493750784),
('User', '24', 1493751787),
('User', '25', 1493751767),
('User', '26', 1493751750),
('User', '27', 1493751730),
('User', '28', 1493751672),
('User', '29', 1493751644),
('User', '30', 1493751611),
('User', '31', 1493750831),
('User', '32', 1493751273),
('User', '34', 1493750861),
('User', '35', 1493751234),
('User', '36', 1493751172),
('User', '37', 1493751134),
('User', '38', 1493751074),
('User', '39', 1493751052),
('User', '40', 1493751030),
('User', '41', 1493750976),
('User', '42', 1493750936),
('User', '43', 1493750905),
('User', '44', 1493752445),
('User', '5', NULL),
('User', '6', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('Admin', 1, NULL, NULL, NULL, 1487779674, 1487779674),
('codeswork_create', 2, NULL, NULL, NULL, 1487914578, 1487914578),
('codeswork_index', 2, NULL, NULL, NULL, 1493321290, 1493321290),
('CodeworkIndex', 2, NULL, NULL, NULL, 1487808864, 1487808864),
('create_employee', 2, NULL, NULL, NULL, 1487779651, 1487780184),
('departmentstructure_index', 2, NULL, NULL, NULL, 1487881779, 1487881779),
('departmentstructure_update', 2, NULL, NULL, NULL, 1487881814, 1487881814),
('employee_create', 2, NULL, NULL, NULL, 1487840148, 1487840148),
('employee_index', 2, NULL, NULL, NULL, 1487834586, 1487834586),
('employee_update', 2, NULL, NULL, NULL, 1487835410, 1487835410),
('Guest', 1, NULL, NULL, NULL, 1487809101, 1487809101),
('orders_create', 2, NULL, NULL, NULL, 1487914628, 1487914628),
('orders_index', 2, NULL, NULL, NULL, 1487873510, 1487873510),
('project_create', 2, NULL, NULL, NULL, 1487914666, 1487914666),
('project_index', 2, NULL, NULL, NULL, 1487873555, 1487873555),
('projectcategory_index', 2, NULL, NULL, NULL, 1487914839, 1487914839),
('sector_index', 2, NULL, NULL, NULL, 1487914796, 1487914796),
('site_about', 2, NULL, NULL, NULL, 1493321234, 1493321234),
('site_index', 2, NULL, NULL, NULL, 1487810771, 1487810771),
('site_logout', 2, NULL, NULL, NULL, 1487837762, 1487837762),
('tabel_index', 2, NULL, NULL, NULL, 1489330570, 1489330570),
('timesheet_index', 2, NULL, NULL, NULL, 1493322093, 1493322093),
('User', 1, NULL, NULL, NULL, 1487780199, 1487780199),
('workdays_create', 2, NULL, NULL, NULL, 1489330730, 1489330730),
('workdays_index', 2, NULL, NULL, NULL, 1489330675, 1489330675),
('worktypes_index', 2, NULL, NULL, NULL, 1487914889, 1487914889);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('User', 'codeswork_create'),
('Admin', 'codeswork_index'),
('User', 'CodeworkIndex'),
('Admin', 'create_employee'),
('User', 'departmentstructure_index'),
('User', 'departmentstructure_update'),
('Admin', 'employee_create'),
('User', 'employee_index'),
('Admin', 'employee_update'),
('User', 'Guest'),
('User', 'orders_create'),
('User', 'orders_index'),
('User', 'project_create'),
('User', 'project_index'),
('User', 'projectcategory_index'),
('User', 'sector_index'),
('User', 'site_about'),
('Guest', 'site_index'),
('User', 'site_logout'),
('User', 'tabel_index'),
('User', 'timesheet_index'),
('Admin', 'User'),
('User', 'workdays_create'),
('User', 'workdays_index'),
('User', 'worktypes_index');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `codes_work`
--

CREATE TABLE IF NOT EXISTS `codes_work` (
  `id` int(10) unsigned NOT NULL,
  `code` varchar(15) NOT NULL COMMENT 'Код работ',
  `name` varchar(155) NOT NULL COMMENT 'Наименование',
  `type_id` int(10) unsigned NOT NULL COMMENT 'Вид работ (из таблицы видов работ)',
  `note` int(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Примечание'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `codes_work`
--

INSERT INTO `codes_work` (`id`, `code`, `name`, `type_id`, `note`) VALUES
(1, '10', 'Разработка новой техники на перспективу', 1, 0),
(2, '15', 'Поддержка продаж', 2, 0),
(3, '20', 'Разработка документации для внешних согласований', 3, 0),
(4, '25', 'Разработка КД для производства', 1, 0),
(5, '30', 'Разработка эксплуатационной документации', 1, 0),
(6, '35', 'Разработка отправочной документации', 1, 0),
(7, '40', 'Поддержка изготовления продукции', 1, 0),
(8, '45', 'Поддержка монтажа и пуско-наладки', 1, 0),
(9, '50', 'Разработка стандартов', 1, 0),
(10, '60', 'Печать и оформление документации по запросам', 2, 0),
(11, '61', 'Работа с электронным архивом документации', 2, 0),
(12, '62', 'Работа с базой данных', 2, 0),
(13, '90', 'Повышение квалификации', 3, 1),
(14, '91', 'Отпуск', 3, 1),
(15, '92', 'Хозяйственные работы', 3, 1),
(16, '93', 'Больничный лист', 3, 0),
(17, '94', 'Работы по сторонним поручениям', 3, 1),
(18, '95', 'Организационные вопросы', 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `department_structure`
--

CREATE TABLE IF NOT EXISTS `department_structure` (
  `id` int(10) unsigned NOT NULL,
  `structure_category` varchar(55) NOT NULL COMMENT 'Категории по структуре отдела'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Категории по структуре отдела';

--
-- Дамп данных таблицы `department_structure`
--

INSERT INTO `department_structure` (`id`, `structure_category`) VALUES
(1, 'Руководитель КО'),
(2, 'Начальник сектора'),
(3, 'Сотрудник'),
(4, 'Заместитель начальника КО');

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(10) unsigned NOT NULL,
  `first_name` varchar(55) NOT NULL COMMENT 'Имя',
  `middle_name` varchar(55) NOT NULL COMMENT 'Отчество',
  `last_name` varchar(55) NOT NULL COMMENT 'Фамилия',
  `department_id` int(10) unsigned NOT NULL COMMENT 'Категория по структуре отдела',
  `sector_id` int(10) unsigned NOT NULL COMMENT 'Сектор',
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Статус',
  `username` varchar(30) NOT NULL COMMENT 'Логин',
  `password` varchar(50) NOT NULL COMMENT 'Пароль'
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `middle_name`, `last_name`, `department_id`, `sector_id`, `status`, `username`, `password`) VALUES
(3, 'Дмитрий', 'Анатольевич', 'Марченко', 1, 1, 1, 'Marchenko', 'f34ff7e5316e90070cf30035803c1c04'),
(7, 'Виктор', 'Давидович', 'Оденбах', 4, 1, 1, 'Odenbach', 'fabfd49b9710348c0ab9a536ace34e31'),
(8, 'Владимир', 'Владимирович', 'Лабуткин', 4, 1, 1, 'Labutkin', '1343e0bc68d5bc3d64c236946367b029'),
(14, 'Андрей', 'Викторович', 'Крутько', 2, 2, 1, 'Krutko', 'fdaa236b87e9e759d8a95b4b1e513f10'),
(15, 'Виктор', 'Иванович', 'Романчук', 3, 2, 1, 'Romanchuk', '6c29e0ca0dd98b73b7e50ab4fdf3a3b3'),
(16, 'Валентина', 'Николаевна', 'Панфилова', 3, 2, 1, 'Panfilova', '61a0d34c77f63c51960c7dd0ca43ce73'),
(17, 'Денис', 'Александрович', 'Савинов', 3, 2, 1, 'Savinov', '46426bffbde4652f3c5462bda1ff37b7'),
(18, 'Андрей', 'Александрович', 'Бондаренко', 3, 2, 1, 'Bondarenko', '1cb871ec32d5a8da35de537c995fad7a'),
(19, 'Александр', 'Викторович', 'Шрамко', 3, 2, 1, 'Shramko', '849e90a92a972c418e9362f424b4fc2f'),
(20, 'Валентина', 'Михайловна', 'Чирва', 3, 2, 1, 'ChirvaValentina', 'd5c6c663531817b738863c3032fac1b9'),
(23, 'Евгений', 'Александрович', 'Бурцев', 2, 3, 1, 'Burtsev', '3f48780500d408cc6b42ac681af2488d'),
(24, 'Сергей', 'Николаевич', 'Щедрицкий', 3, 3, 1, 'Schedrovitsky', '95d539f07c87a4bebb4edb0f88bc6c1f'),
(25, 'Александр', 'Павлович', 'Завгородний', 3, 3, 1, 'Zavgorodny', '00c74d5f629728ecd908cf91822ff216'),
(26, 'Светлана', 'Витальевна', 'Павленко', 3, 3, 1, 'Pavlenko', 'aea3f8e8559ad2b77803e4c7d3d61bdb'),
(27, 'Людмила', 'Григорьевна', 'Касьян', 3, 3, 1, 'KasyanLyudmila', 'f411cc8144eba8706c1e11b4b25b0af7'),
(28, 'Юлия', 'Николаевна', 'Гулько', 3, 3, 1, 'Gulko', '0a740c411ace917c91c975fba30abb04'),
(29, 'Ирина', 'Дмитриевна', 'Кравчина', 3, 3, 1, 'Kravchina', 'f9f2c89909f7e321749d9e19e9222502'),
(30, 'Олег', 'Георгиевич', 'Товарчий', 3, 3, 1, 'TovarchiiOleg', 'd792380b9f0b02ddd8e9eeff071401c2'),
(31, 'Линда', 'Сергеевна', 'Колодяжная', 2, 4, 1, 'Kolodyazhnaya', '224513f79949143a9a602c18b69901f4'),
(32, 'Надежда', 'Николаевна', 'Касьян', 3, 4, 1, 'Kasyan', '74dbe29dffa65264d77003ff32ec91bc'),
(34, 'Наталья', 'Николаевна', 'Постовит', 2, 5, 1, 'Postovit', 'd08f4440a92c90bf4250670acce1cb7f'),
(35, 'Татьяна', 'Григорьевна', 'Палько', 3, 5, 1, 'Palco', '86d559a94ccbd83d7d83433d2f5da2ef'),
(36, 'Виктория', 'Александровна', 'Янушкевич', 3, 5, 1, 'Yanushkevich', 'a3bd5e8cd9c8150665419f7cd2e536c8'),
(37, 'Инна', 'Валентиновна', 'Толочная', 3, 5, 1, 'Tolochnaya', '3cb9eb9253532bdfd50d72bbab9190fc'),
(38, 'Наталья', 'Павловна', 'Павкина', 3, 5, 1, 'Pavkina', '4f98db8f19545fc2545773d4eb7eadc8'),
(39, 'Инна', 'Николаевна', 'Хруслова', 3, 5, 1, 'Khruslova', '907ecbb878e27f2f4b976f997b083dcb'),
(40, 'Татьяна', 'Владимировна', 'Товарчий', 3, 5, 1, 'Tovarchii', '5f8df0d562e7f268044cbef71bc95c24'),
(41, 'Юлия', 'Александровна', 'Чирва', 3, 5, 1, 'Chirva', '671f065f8addf9c55d325fb4f21351aa'),
(42, 'Алексей', 'Валентинович', 'Бедовский', 2, 6, 1, 'Bedovsky', '100aaf00c5fa3d032c647e5b4a4288b1'),
(43, 'Александр', 'Леонидович', 'Воронин', 3, 6, 1, 'Voronin', '3a44f0aa88ca1162c1333d5dd8f21787'),
(44, 'Алексей', 'Константинович', 'Резниченко', 3, 6, 1, 'Reznichenko', '277649bdd39a0a0de1d31da47d3d0175');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) unsigned NOT NULL,
  `number` varchar(15) NOT NULL COMMENT 'Номер заказа',
  `project_id` int(10) unsigned NOT NULL COMMENT 'Номер проекта',
  `name` varchar(155) NOT NULL COMMENT 'Наименование',
  `responsible_id` int(10) unsigned NOT NULL COMMENT 'Ответственный',
  `budget_hours` int(5) unsigned NOT NULL COMMENT 'Бюджет часов',
  `planned_end_date` date NOT NULL COMMENT 'Запланированная дата выполнения',
  `actual_end_date` date DEFAULT NULL COMMENT 'Фактическая дата выполнения',
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Статус'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `number`, `project_id`, `name`, `responsible_id`, `budget_hours`, `planned_end_date`, `actual_end_date`, `status`) VALUES
(8, '1910-1', 1, 'Отсек вторичных цепей КРУ-35 кВ (комплект 4 ячейки)', 19, 200, '2017-03-18', '2017-04-28', 0),
(9, '1911', 2, 'РУ-825 (комплект 10 ячеек)', 15, 350, '2017-02-24', '2017-02-10', 1),
(10, '1912-1', 6, 'РУ-825ОШ-Д-П', 30, 500, '2017-07-22', NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(10) unsigned NOT NULL,
  `number` varchar(15) NOT NULL COMMENT 'Номер пректа',
  `name` varchar(155) NOT NULL COMMENT 'Наименование',
  `customer` varchar(155) NOT NULL COMMENT 'Заказчик',
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Статус',
  `responsible_id` int(10) unsigned NOT NULL COMMENT 'Ответственный',
  `budget_hours` int(5) unsigned NOT NULL COMMENT 'Бюджет часов',
  `planned_end_date` date NOT NULL COMMENT 'Запланированная дата выполнения',
  `actual_end_date` date DEFAULT NULL COMMENT 'Фактическая дата выполнения'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `project`
--

INSERT INTO `project` (`id`, `number`, `name`, `customer`, `status`, `responsible_id`, `budget_hours`, `planned_end_date`, `actual_end_date`) VALUES
(1, '001', 'Тяговая подстанция', 'Стокгольм', 0, 43, 200, '2017-01-27', '2017-01-31'),
(2, '002', 'Оборудование постоянного тока', 'Баку', 1, 3, 300, '2017-01-31', '2017-02-16'),
(3, '003', 'Реверсивный выпрямитель', 'IPH центр', 1, 23, 100, '2017-01-20', '2017-01-18'),
(4, '004', 'Тяговая подстанция', 'Баку', 1, 22, 34, '2017-01-28', '2017-01-29'),
(5, '005', 'Ретрофит', 'Киев метрополитен', 2, 16, 46, '2017-02-09', '2017-02-26'),
(6, '006', 'Оборудование постоянного тока', 'Харьков-метро проект', 2, 3, 234, '2017-02-12', '2017-02-25'),
(7, '007', 'Тяговая подстанция', 'Львовская ж/д', 0, 33, 543, '2017-02-23', '2017-02-26'),
(8, '008', 'Запорожье - метро проект', 'Zp', 0, 30, 99999, '2017-04-28', '2017-12-31');

-- --------------------------------------------------------

--
-- Структура таблицы `project_category`
--

CREATE TABLE IF NOT EXISTS `project_category` (
  `id` int(11) unsigned NOT NULL,
  `responsible_for` varchar(55) NOT NULL COMMENT 'Категории по проектам'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  `id` int(10) unsigned NOT NULL,
  `sector` varchar(55) NOT NULL COMMENT 'Сектор'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
-- Структура таблицы `time_sheet`
--

CREATE TABLE IF NOT EXISTS `time_sheet` (
  `id` int(25) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL COMMENT 'ФИО',
  `sector_id` int(10) unsigned NOT NULL COMMENT 'Сектор',
  `project_number_id` int(10) unsigned NOT NULL COMMENT 'Номер проекта',
  `project_name_id` int(10) unsigned NOT NULL COMMENT 'Наименование проекта',
  `order_number_id` int(10) unsigned NOT NULL COMMENT 'Номер заказа',
  `work_code_id` int(10) unsigned NOT NULL COMMENT 'Код работ',
  `date` date NOT NULL COMMENT 'Дата',
  `hours` int(2) unsigned NOT NULL COMMENT 'Часы',
  `note` varchar(255) DEFAULT NULL COMMENT 'Примечание'
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='Табель рабочего времени';

--
-- Дамп данных таблицы `time_sheet`
--

INSERT INTO `time_sheet` (`id`, `employee_id`, `sector_id`, `project_number_id`, `project_name_id`, `order_number_id`, `work_code_id`, `date`, `hours`, `note`) VALUES
(10, 34, 5, 1, 2, 8, 1, '2017-04-06', 8, ''),
(11, 42, 3, 2, 6, 9, 2, '2017-04-07', 8, ''),
(12, 44, 3, 2, 6, 8, 4, '2017-04-01', 8, ''),
(13, 3, 1, 3, 3, 9, 3, '2017-04-23', 8, ''),
(17, 44, 44, 1, 2, 8, 1, '2017-04-29', 67, ''),
(18, 44, 3, 1, 2, 8, 1, '2017-04-30', 8, ''),
(19, 44, 44, 1, 2, 8, 1, '2017-04-16', 7, ''),
(20, 44, 44, 2, 7, 9, 4, '2017-04-21', 6, ''),
(21, 44, 44, 2, 4, 8, 4, '2017-04-30', 4, ''),
(22, 44, 44, 3, 4, 9, 3, '2017-04-23', 7, ''),
(23, 44, 44, 2, 5, 9, 1, '2017-04-30', 5, ''),
(24, 44, 3, 1, 2, 8, 1, '2017-04-30', 7, ''),
(25, 44, 44, 1, 2, 8, 1, '2017-04-30', 4, ''),
(26, 44, 44, 2, 3, 9, 2, '2017-04-28', 5, ''),
(27, 44, 44, 2, 6, 9, 2, '2017-04-30', 2, ''),
(28, 44, 6, 2, 6, 9, 4, '2017-04-23', 5, ''),
(29, 44, 6, 2, 2, 9, 3, '2017-04-20', 8, ''),
(30, 44, 6, 4, 4, 8, 1, '2017-04-23', 9, ''),
(31, 44, 6, 2, 2, 9, 2, '2017-04-22', 5, ''),
(32, 44, 6, 1, 1, 8, 4, '2017-04-29', 6, ''),
(33, 44, 6, 2, 2, 9, 2, '2017-04-23', 6, ''),
(34, 44, 6, 1, 5, 8, 4, '2017-04-18', 7, ''),
(35, 44, 6, 2, 2, 9, 2, '2017-04-28', 5, ''),
(36, 44, 6, 2, 2, 9, 4, '2017-04-30', 4, ''),
(37, 44, 6, 2, 2, 9, 4, '2017-04-27', 6, ''),
(38, 44, 6, 2, 5, 9, 4, '2017-04-29', 5, ''),
(39, 44, 6, 2, 2, 9, 3, '2017-04-30', 6, ''),
(40, 34, 5, 1, 1, 8, 3, '2017-04-30', 8, 'rukrjku'),
(41, 34, 5, 2, 2, 9, 4, '2017-04-28', 4, ''),
(42, 44, 6, 1, 1, 8, 2, '2017-10-22', 5, 'vv'),
(43, 3, 1, 6, 6, 10, 1, '2017-05-03', 7, '');

-- --------------------------------------------------------

--
-- Структура таблицы `work_days`
--

CREATE TABLE IF NOT EXISTS `work_days` (
  `id` int(10) unsigned NOT NULL,
  `date` date NOT NULL COMMENT 'Дата',
  `hours` int(10) NOT NULL COMMENT 'Кол-во рабочих часов'
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='Ввод и корректировка рабочего времени в календаре';

--
-- Дамп данных таблицы `work_days`
--

INSERT INTO `work_days` (`id`, `date`, `hours`) VALUES
(1, '2017-03-28', 8),
(2, '2017-03-29', 8),
(3, '2017-03-30', 8),
(4, '2017-03-31', 8),
(5, '2017-04-01', 0),
(6, '2017-04-02', 0),
(7, '2017-04-03', 8),
(8, '2017-04-04', 8),
(9, '2017-04-05', 8),
(10, '2017-04-06', 8),
(11, '2017-04-07', 8),
(12, '2017-04-08', 0),
(13, '2017-04-09', 0),
(14, '2017-04-10', 8),
(15, '2017-04-11', 8),
(16, '2017-04-12', 8),
(17, '2017-04-13', 8),
(18, '2017-04-14', 8),
(19, '2017-04-15', 0),
(20, '2017-04-16', 0),
(21, '2017-04-17', 8),
(22, '2017-04-18', 8),
(23, '2017-04-19', 8),
(24, '2017-04-20', 8),
(25, '2017-04-21', 8),
(26, '2017-04-22', 0),
(27, '2017-04-23', 0),
(28, '2017-04-24', 8),
(29, '2017-04-25', 8),
(30, '2017-04-26', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `work_types`
--

CREATE TABLE IF NOT EXISTS `work_types` (
  `id` int(10) unsigned NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'Виды работ'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Таблица видов работ';

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
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

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
-- Индексы таблицы `time_sheet`
--
ALTER TABLE `time_sheet`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `work_days`
--
ALTER TABLE `work_days`
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `department_structure`
--
ALTER TABLE `department_structure`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `project`
--
ALTER TABLE `project`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `project_category`
--
ALTER TABLE `project_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `sector`
--
ALTER TABLE `sector`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `time_sheet`
--
ALTER TABLE `time_sheet`
  MODIFY `id` int(25) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT для таблицы `work_days`
--
ALTER TABLE `work_days`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `work_types`
--
ALTER TABLE `work_types`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
