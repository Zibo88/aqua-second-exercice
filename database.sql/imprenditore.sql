-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Dic 13, 2022 alle 09:48
-- Versione del server: 5.7.34
-- Versione PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imprenditore`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2014_10_12_000000_create_users_table', 1),
(17, '2014_10_12_100000_create_password_resets_table', 1),
(18, '2019_08_19_000000_create_failed_jobs_table', 1),
(19, '2022_12_08_101216_create_tasks_table', 2),
(36, '2022_12_12_115354_add_status_table', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_time` date NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `delivery_time`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Illum explicabo eos voluptates temporibus aut ab.', 'Magni accusamus sequi possimus. Voluptas tempora vel quis quia.\r\n\r\n\r\nStep 1 fatto bene', '2022-02-05', 2, 0, '2022-12-08 09:38:56', '2022-12-10 13:32:12'),
(2, 'Atque dolor nesciunt id et consequatur quasi.', 'Sint molestiae architecto sapiente. Pariatur a ratione voluptatem porro voluptates impedit.', '2001-11-02', 2, 0, '2022-12-08 09:39:45', '2022-12-09 13:25:34'),
(5, 'Velit distinctio aspernatur illo.', 'Et dolor consectetur facere sunt id. Eius est laboriosam qui voluptatum quasi aut.', '2008-03-11', 2, 0, '2022-12-08 09:39:45', '2022-12-08 09:39:45'),
(6, 'Unde velit nam accusantium fugit.', 'Molestiae cum sunt minima sit enim. Quaerat est est iste aliquam facilis labore.', '1972-08-07', NULL, 0, '2022-12-08 09:39:45', '2022-12-09 14:00:29'),
(7, 'titolo', 'descrizione', '2022-12-07', NULL, 0, '2022-12-08 13:35:37', '2022-12-08 13:35:37'),
(16, 'ciao', 'ciao', '2022-12-17', NULL, 0, '2022-12-09 14:11:04', '2022-12-09 14:11:04'),
(17, 'ciao', 'cioao', '2022-12-16', NULL, 0, '2022-12-09 14:11:32', '2022-12-09 14:11:32'),
(18, 'ciao Giovanni', 'Giovanni', '2022-12-16', 2, 0, '2022-12-09 14:11:37', '2022-12-10 09:25:03'),
(19, 'primo', 'primo', '2022-12-22', 2, 0, '2022-12-09 14:12:26', '2022-12-09 14:12:26'),
(20, 'new task', 'new task', '2022-12-21', 2, 0, '2022-12-09 14:14:28', '2022-12-09 14:14:28'),
(22, 'task solo per giovanni', 'giovanni', '2022-12-22', 2, 0, '2022-12-09 15:24:48', '2022-12-09 15:24:48'),
(24, 'Task Corretta AAAAAAAA', 'Puoi assegnare la task a Giovanni?\r\n\r\nCiao Giovanni, Anna mi ha chiesto di assegnare a te la task in oggetto. Sei disponibile?', '2022-12-23', 2, 0, '2022-12-09 16:30:01', '2022-12-10 11:07:37'),
(25, 'Task Corretta AAAAAAAA', 'Eseguo una quinta modifica modifica', '2022-12-23', 5, 1, '2022-12-09 16:34:29', '2022-12-12 13:44:13'),
(26, 'Task Corretta AAAAAAAA', 'corretta', '2022-12-23', 5, 0, '2022-12-09 16:37:46', '2022-12-09 16:37:46'),
(27, 'Passo la task a giovanni', 'giovanni', '2022-12-23', 2, 0, '2022-12-09 16:37:59', '2022-12-10 09:24:23'),
(28, 'Task Corretta AAAAAAAA', 'corretta', '2022-12-23', 2, 0, '2022-12-09 16:38:05', '2022-12-09 16:38:05'),
(29, 'Task Corretta AAAAAAAA', 'corretta', '2022-12-23', 2, 0, '2022-12-09 16:39:53', '2022-12-09 16:39:53'),
(30, 'da anna to giovanni', 'im coming', '2022-12-24', 2, 0, '2022-12-09 16:41:09', '2022-12-09 17:04:00'),
(37, 'Test email', 'email', '2022-12-22', 6, 0, '2022-12-12 08:44:50', '2022-12-12 08:44:50'),
(38, 'Test email', 'email', '2022-12-22', 6, 0, '2022-12-12 08:47:22', '2022-12-12 08:47:22'),
(39, 'Test email', 'email', '2022-12-22', 6, 0, '2022-12-12 08:49:35', '2022-12-12 08:49:35'),
(40, 'Test email 2', 'email 2', '2022-12-23', 5, 0, '2022-12-12 08:55:16', '2022-12-12 08:55:16'),
(41, 'Test email 2', 'email 2', '2022-12-23', 5, 0, '2022-12-12 08:55:50', '2022-12-12 08:55:50'),
(42, 'Test email 2', 'email 2', '2022-12-23', 5, 0, '2022-12-12 09:00:15', '2022-12-12 09:00:15'),
(43, 'funziona?', 'funziona?', '2022-12-15', 5, 0, '2022-12-12 09:00:36', '2022-12-12 09:00:36'),
(44, 'funziona?', 'funziona?', '2022-12-15', 5, 0, '2022-12-12 09:03:09', '2022-12-12 09:03:09'),
(45, 'funziona?', 'funziona?', '2022-12-15', 5, 0, '2022-12-12 09:03:12', '2022-12-12 09:03:12'),
(46, 'funziona?', 'funziona?', '2022-12-15', 5, 1, '2022-12-12 09:04:32', '2022-12-12 13:46:37'),
(47, 'prova', 'prova', '2022-12-14', 2, 0, '2022-12-12 09:21:24', '2022-12-12 09:21:24'),
(48, 'prova', 'prova', '2022-12-14', 2, 0, '2022-12-12 09:21:57', '2022-12-12 09:21:57'),
(49, 'prova', 'prova', '2022-12-14', 2, 0, '2022-12-12 09:31:33', '2022-12-12 09:31:33'),
(50, 'prova', 'prova', '2022-12-14', 2, 0, '2022-12-12 09:34:52', '2022-12-12 13:42:54'),
(51, 'Migration and Rollback', 'Ciao Anna dobbiamo completare la task, sei disponiblie?\r\n\r\nSi, sono disponibile\r\n\r\nAnna: Ciao Mario ho completato la task', '2022-12-21', 5, 1, '2022-12-12 09:40:30', '2022-12-13 08:39:46'),
(52, 'Tabelle relazionate', 'Puoi farlo tu?', '2022-12-22', 6, 0, '2022-12-12 09:46:04', '2022-12-12 09:46:04'),
(53, 'Tabelle relazionate', 'Puoi farlo tu?', '2022-12-22', 6, 0, '2022-12-12 09:46:19', '2022-12-12 09:46:19'),
(54, 'Tabelle relazionate', 'Puoi farlo tu?', '2022-12-22', 6, 0, '2022-12-12 09:46:20', '2022-12-12 09:46:20'),
(55, 'Tabelle relazionate', 'Puoi farlo tu?', '2022-12-22', 6, 0, '2022-12-12 09:46:21', '2022-12-12 09:46:21'),
(56, 'Tabelle relazionate', 'Puoi farlo tu?', '2022-12-22', 6, 0, '2022-12-12 09:47:28', '2022-12-12 09:47:28'),
(57, 'Laboriosam harum quia dolorum praesentium.', 'Numquam ut illum exercitationem excepturi. Atque a quam ut enim ullam consequuntur.', '1988-03-21', 6, 0, '2022-12-12 11:01:42', '2022-12-12 11:01:42'),
(58, 'Consequatur rerum doloremque et harum velit quaerat.', 'Velit optio similique cum laboriosam vel. Illo id vel sed eius.', '1970-06-10', 6, 0, '2022-12-12 11:01:42', '2022-12-12 11:01:42'),
(59, 'Voluptatem aut accusantium ut consequatur.', 'Delectus optio temporibus at ut. Quaerat ab et optio amet.', '1979-08-17', 6, 0, '2022-12-12 11:01:42', '2022-12-12 11:01:42'),
(60, 'Temporibus totam voluptatem sed.', 'Dignissimos labore iure et qui sed non quas. Eius similique dolores incidunt rerum qui ut optio.', '1988-05-20', 6, 0, '2022-12-12 11:01:42', '2022-12-12 11:01:42'),
(61, 'Animi accusamus et et et corporis quis dolore.', 'Enim autem nihil incidunt. In magnam aut delectus animi quia. Hic ab porro officiis dolor ea.', '1980-04-26', 6, 0, '2022-12-12 11:01:42', '2022-12-12 11:01:42'),
(62, 'Aperiam optio corrupti vel ut omnis libero corrupti.', 'Omnis ullam quis voluptatem velit voluptatibus vel. Debitis accusamus aut omnis odio consequatur.', '1978-02-11', 6, 0, '2022-12-12 11:03:33', '2022-12-12 11:03:33'),
(63, 'Cupiditate quo aut dolor.', 'Nihil aut maxime doloremque et inventore occaecati. Et dolor itaque voluptatem libero maiores.', '1999-11-24', 6, 0, '2022-12-12 11:03:33', '2022-12-12 11:03:33'),
(64, 'Consectetur pariatur fugiat quis culpa adipisci.', 'Quasi consequuntur cupiditate voluptates dolorem. Rem qui atque maiores sed blanditiis.', '2011-06-05', 6, 0, '2022-12-12 11:03:33', '2022-12-12 11:03:33'),
(65, 'Qui ut enim nihil numquam qui.', 'Nisi doloremque ut et non id optio nemo esse. In eos accusantium beatae. Eaque totam id eos quis.', '2018-02-01', 6, 0, '2022-12-12 11:03:33', '2022-12-12 11:03:33'),
(66, 'Iste laboriosam dolorem ut deleniti minus minima quis.', 'Et fugiat fugiat minima accusantium eum. Rerum libero quos qui quisquam ut aut voluptatum.', '2022-11-05', 6, 0, '2022-12-12 11:03:33', '2022-12-12 11:03:33'),
(67, 'test del seeder', 'test', '2022-12-22', 6, 0, '2022-12-12 11:04:34', '2022-12-12 11:04:34'),
(68, 'Vel maxime aut aut dolorem eaque dolores non in.', 'Minima voluptatum mollitia corporis enim. Earum vero quis est laboriosam molestiae dolor.', '1992-08-01', 6, 0, '2022-12-12 11:06:47', '2022-12-12 11:06:47'),
(69, 'Accusamus rerum animi natus pariatur.', 'Nesciunt laudantium corrupti debitis ut nisi blanditiis tempore. Ut veniam impedit qui tenetur.', '2008-11-10', 6, 0, '2022-12-12 11:06:47', '2022-12-12 11:06:47'),
(70, 'Nobis perspiciatis laborum et quod minus magnam reiciendis.', 'Quia vero molestiae quia adipisci veniam. Cumque nihil nihil eum.', '1983-10-14', 6, 0, '2022-12-12 11:06:47', '2022-12-12 11:06:47'),
(71, 'Explicabo commodi reiciendis sed ab odio.', 'Quia sit ipsa vero consequuntur ut nesciunt nobis. Et mollitia voluptatem et ipsam dolorum aut.', '1973-01-04', 6, 0, '2022-12-12 11:06:47', '2022-12-12 11:06:47'),
(72, 'Vel nemo dicta nam cum.', 'Est aut laudantium non quia repellat et. Id ea et id. Quasi qui aut adipisci beatae in.', '1977-09-05', 6, 0, '2022-12-12 11:06:47', '2022-12-12 11:06:47'),
(73, 'Incidunt pariatur nihil facere est sequi cumque.', 'Sit molestias fuga odio quia excepturi. Vel ipsa ducimus dolor id.', '2002-08-02', 6, 0, '2022-12-12 11:09:22', '2022-12-12 11:09:22'),
(74, 'Laudantium minima quia incidunt quas culpa explicabo.', 'Laudantium aut sunt rerum a delectus nihil aut ab. Laudantium possimus quaerat dicta quisquam.', '1974-07-16', 6, 0, '2022-12-12 11:09:22', '2022-12-12 11:09:22'),
(75, 'Rerum recusandae occaecati accusantium voluptas.', 'Est excepturi porro atque est. Qui beatae rerum sequi optio. Ea quo odio deleniti est.', '2013-02-14', 6, 0, '2022-12-12 11:09:22', '2022-12-12 11:09:22'),
(76, 'Et nostrum quas unde blanditiis vitae.', 'Iusto laborum quo nobis dolorem. Cupiditate praesentium et est et inventore saepe a.', '2010-05-08', 6, 0, '2022-12-12 11:09:22', '2022-12-12 11:09:22'),
(77, 'Est et est ut necessitatibus temporibus omnis corporis ea.', 'Sed quod assumenda iusto sit. Repellat ut eum odit quo.', '1990-10-24', 6, 0, '2022-12-12 11:09:22', '2022-12-12 11:09:22'),
(78, 'Et debitis provident debitis similique distinctio.', 'Laudantium illum rerum ullam fugiat qui. Nihil voluptas voluptatem illo tempora ut.', '2002-03-11', 6, 0, '2022-12-12 11:10:16', '2022-12-12 11:10:16'),
(79, 'Qui modi nobis aut tenetur.', 'Ut odit voluptate rem consequatur labore. Blanditiis ut pariatur natus earum necessitatibus.', '1987-07-21', 6, 0, '2022-12-12 11:10:16', '2022-12-12 11:10:16'),
(80, 'Sint dolor minima praesentium natus mollitia ut.', 'Aspernatur sit reprehenderit ipsa est. Et esse et qui repellendus. Quod veniam adipisci et.', '1979-03-07', 6, 0, '2022-12-12 11:10:16', '2022-12-12 11:10:16'),
(81, 'Non dolore dignissimos fugiat aperiam.', 'Ipsam eos tempore architecto et. Dolore et quos a iusto ullam qui cum.', '2005-03-07', 6, 0, '2022-12-12 11:10:16', '2022-12-12 11:10:16'),
(82, 'Ea beatae ab fuga natus.', 'Rerum ipsum vitae consequuntur ut aperiam. Qui qui voluptatem modi.', '2021-11-27', 6, 0, '2022-12-12 11:10:16', '2022-12-12 11:10:16'),
(83, 'Sint quas ut occaecati ducimus sed.', 'Maxime dolor deserunt quae quasi vero nemo. Id dolorem doloribus culpa magni.', '2014-01-07', 6, 0, '2022-12-12 11:10:47', '2022-12-12 11:10:47'),
(84, 'Ut et sint ipsa sit corporis fuga.', 'Sequi laborum velit aut. Earum sunt et ea perspiciatis.', '2018-07-28', 6, 0, '2022-12-12 11:10:47', '2022-12-12 11:10:47'),
(85, 'Delectus unde repudiandae incidunt ut qui cumque.', 'Et iusto ipsa temporibus qui. Tempore eos rerum illum excepturi a quasi. Et qui culpa consectetur.', '1985-07-10', 6, 0, '2022-12-12 11:10:47', '2022-12-12 11:10:47'),
(86, 'Voluptas id optio eos inventore tempore saepe.', 'Et eos voluptatem eum. Dolor et voluptas modi sunt ex optio ut.', '2009-01-23', 6, 0, '2022-12-12 11:10:47', '2022-12-12 11:10:47'),
(87, 'Similique eius veniam ratione dignissimos nulla.', 'Excepturi ut sequi omnis nisi. Dolorem ipsam voluptates debitis ipsa error qui blanditiis.', '2012-08-22', 6, 0, '2022-12-12 11:10:47', '2022-12-12 11:10:47'),
(88, 'Enim qui illum soluta eligendi alias unde.', 'Sit et inventore harum repellendus reprehenderit. Eaque architecto totam nisi perspiciatis debitis.', '1989-11-23', 6, 0, '2022-12-12 11:11:51', '2022-12-12 11:11:51'),
(89, 'Necessitatibus consequuntur sed quasi quisquam qui.', 'Nihil earum id vitae enim. Optio vero et labore.', '2006-01-13', 6, 0, '2022-12-12 11:11:51', '2022-12-12 11:11:51'),
(90, 'Dolor ullam fugit et officiis.', 'Rerum voluptatem libero id officia voluptatem. Aut laborum quia sed officiis asperiores.', '1997-04-22', 6, 0, '2022-12-12 11:11:51', '2022-12-12 11:11:51'),
(91, 'Vel laborum ut autem ab nemo dicta quaerat.', 'Repellendus quidem doloremque est. Ea velit dolore perferendis.', '2012-09-07', 6, 0, '2022-12-12 11:11:51', '2022-12-12 11:11:51'),
(92, 'Rerum dignissimos odit inventore enim fuga consequuntur beatae.', 'Aliquam dolores vel rem. Quos dolorem eum est eveniet id doloribus.', '1999-01-15', 6, 0, '2022-12-12 11:11:51', '2022-12-12 11:11:51'),
(93, 'Corrupti quo blanditiis fugit non laudantium excepturi.', 'Sint est cumque debitis aut dolor. Voluptas itaque et commodi occaecati quis suscipit et.', '2015-03-09', 6, 0, '2022-12-12 11:12:46', '2022-12-12 11:12:46'),
(94, 'Ea accusantium pariatur qui dolores.', 'Rerum unde ratione veritatis autem. Doloribus perspiciatis in et praesentium aliquid rerum.', '2008-09-05', 6, 0, '2022-12-12 11:12:46', '2022-12-12 11:12:46'),
(95, 'Ipsa non magni quod at est recusandae.', 'Doloribus rerum soluta optio vitae mollitia. Adipisci dolorem ut adipisci quas quo voluptas.', '2002-06-24', 6, 0, '2022-12-12 11:12:46', '2022-12-12 11:12:46'),
(96, 'Minima cupiditate illo tempora consequuntur voluptatem.', 'Beatae delectus dolor repellendus non quisquam in. Error molestiae non laborum itaque temporibus.', '1982-10-02', 6, 0, '2022-12-12 11:12:46', '2022-12-12 11:12:46'),
(97, 'Quod natus autem explicabo commodi quis.', 'Rem autem mollitia ea quia voluptatum officia. Beatae voluptatem quia sunt omnis.', '1999-05-04', 6, 0, '2022-12-12 11:12:46', '2022-12-12 11:12:46'),
(98, 'Sit et itaque sint aut architecto enim qui.', 'Sint sed deleniti velit quas perferendis id. Sed vitae veniam et perferendis qui.', '2019-07-18', 6, 0, '2022-12-12 11:14:09', '2022-12-12 11:14:09'),
(99, 'Quo amet numquam rerum iusto.', 'Dicta cum ea velit ab ea iure. Et et sed ut laudantium.', '1999-04-26', 6, 0, '2022-12-12 11:14:09', '2022-12-12 11:14:09'),
(100, 'Repellendus et autem voluptates dolorem ducimus repudiandae.', 'Officiis ratione rerum quia. Aut quaerat impedit ut assumenda ut praesentium.', '1979-10-22', 6, 0, '2022-12-12 11:14:09', '2022-12-12 11:14:09'),
(101, 'Impedit soluta tempore ut quaerat.', 'Culpa aut ratione et autem neque aut et. Ducimus placeat iusto totam eaque earum excepturi ad sunt.', '2005-10-10', 6, 0, '2022-12-12 11:14:09', '2022-12-12 11:14:09'),
(102, 'Dignissimos sapiente possimus esse aperiam omnis voluptatem.', 'Reprehenderit minima reprehenderit voluptatem velit. Vitae fuga et voluptatem.', '1982-07-02', 6, 0, '2022-12-12 11:14:09', '2022-12-12 11:14:09'),
(104, 'Quae temporibus et assumenda impedit.', 'Hic ratione molestiae quibusdam natus. Aut magni earum voluptatem voluptate voluptas quam.', '1983-04-05', 6, 0, '2022-12-12 11:14:40', '2022-12-12 11:14:40'),
(105, 'Unde mollitia quam ratione at assumenda quas non voluptatibus.', 'Fuga rem et vero omnis ut id. Quia et aspernatur qui dolores nobis. Quibusdam itaque quia dolor et.', '1987-11-08', 6, 0, '2022-12-12 11:14:40', '2022-12-12 11:14:40'),
(106, 'Ea assumenda asperiores nobis dolores soluta natus modi.', 'Incidunt optio et illum quos. Mollitia veniam hic et vel.', '1979-05-18', 6, 0, '2022-12-12 11:14:40', '2022-12-12 11:14:40'),
(107, 'Qui incidunt possimus pariatur autem ut quas tenetur laborum.', 'Aut omnis doloremque eos unde. Dolorem voluptatum sed similique totam. At sint qui illum sed.', '1975-10-14', 6, 0, '2022-12-12 11:14:40', '2022-12-12 11:14:40'),
(112, 'TITOLO RICONOSCIBILE', 'BASTAAAAAAAAA', '1983-03-10', 6, 0, '2022-12-12 11:15:17', '2022-12-12 13:17:21'),
(139, 'titolo', 'nuov amail', '2022-12-22', 5, 1, '2022-12-12 11:59:58', '2022-12-12 12:50:02'),
(140, 'Assegno la prima task', 'Ciao rosa devi completare questa task', '2022-12-15', 7, 1, '2022-12-12 12:58:41', '2022-12-12 13:22:33'),
(141, 'TEST!£\"$!&/\"(/)', '%£$&%/&/%$/%&%/&(/=)\r\n\r\nFATTO!', '2022-12-09', 7, 1, '2022-12-12 13:20:12', '2022-12-12 13:21:14'),
(142, 'task 30398474649', 'hoihsbz o bz\r\n\r\nfatto', '2022-12-15', 7, 1, '2022-12-12 13:56:22', '2022-12-12 13:57:10');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `role`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mario', 'Rossi', 'admin', 'mario@email.com', NULL, '$2y$10$7Rs3gNNXoDInJAbPnTAzAOyar5Pi3rEDy2LJ5y6a4C0kDRdAaQZvq', NULL, '2022-12-08 08:26:37', '2022-12-08 08:26:37'),
(2, 'Giovanni', 'Bianchi', 'dipendente', 'giovannibianchi@mail.it', NULL, '$2y$10$sPaYoQAWILcU.hWzbuibXe09bmkI8KnogskJS4CnKFX7lA4InnWyq', NULL, '2022-12-08 08:27:31', '2022-12-08 08:27:31'),
(5, 'anna', 'lupa', 'dipendente', 'annalupa@mail.it', NULL, '$2y$10$fCnW09rmX5hAZ/FANCPw.OkvhB95HOgomqQOo/V41B8SSzn.hxn/a', NULL, '2022-12-09 14:04:34', '2022-12-09 14:04:34'),
(6, 'Franco', 'Primo', 'dipendente', 'francoprimo@mail.it', NULL, '$2y$10$dNe97w66xg9MhiQ/8ASVneBxgpyUoGgx5pV6ATRusYosib97UBEJS', NULL, '2022-12-10 11:17:28', '2022-12-10 11:17:28'),
(7, 'Rosa', 'Curto', 'dipendente', 'rosacurto@mail.it', NULL, '$2y$10$UkyQ6TyfegBwEe4vCBa4o.QP9FRoGetzVqUEo7.TIpqEMgHCQEQ5S', NULL, '2022-12-12 12:57:55', '2022-12-12 12:57:55');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indici per le tabelle `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT per la tabella `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
