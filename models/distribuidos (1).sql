-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2024 a las 20:07:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `distribuidos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `playlists`
--

INSERT INTO `playlists` (`id`, `user_id`, `name`, `created_at`) VALUES
(1, 1, 'John\'s Favorites', '2024-05-27 18:38:06'),
(2, 1, 'Workout Playlist', '2024-05-27 18:38:06'),
(4, 3, 'Alice\'s Top Hits', '2024-05-27 18:38:06'),
(5, 1, 'Prueaba', '2024-05-30 22:29:14'),
(7, 8, 'Prueba de inserccion de playlist', '2024-06-03 03:46:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `song_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Preview_Song` varchar(255) DEFAULT NULL,
  `Release_Date` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `songs`
--

INSERT INTO `songs` (`id`, `playlist_id`, `song_id`, `name`, `artist`, `added_at`, `Preview_Song`, `Release_Date`, `Image`, `user_id`) VALUES
(5, 4, 'song_005', 'Song E', 'Artist Y', '2024-05-27 18:38:17', '', '', '', NULL),
(6, 4, 'song_006', 'Song F', 'Artist Z', '2024-05-27 18:38:17', '', '', '', NULL),
(7, 1, 'Prueba', 'Pruebasong', 'Kanye west', '2024-05-30 19:49:24', '', '', '', NULL),
(21, 1, 'song123', 'Song Name', 'Artist Name', '2024-05-30 20:20:44', '', '', '', NULL),
(22, 2, 'song123', 'Song Name', 'Artist Name', '2024-05-30 21:15:01', '', '', '', NULL),
(23, 4, 'song123', 'Song Name', 'Artist Name', '2024-05-30 21:31:59', '', '', '', NULL),
(24, 1, 'jijia', 'Madona', 'Esto es una prueba', '2024-06-01 05:09:34', 'ISJSI', 'JIJIJIJA', 'Aquiel url de la imagen', NULL),
(25, 2, 'jijia', 'Madona', 'Esto es una prueba', '2024-06-01 05:18:26', 'ISJSI', 'JIJIJIJA', 'Aquiel url de la imagen', NULL),
(26, 1, '76YpLOgJcD2YInDHs5u69s', 'De la Vida Como Pelicula, Tragedia, Comedia y Ficcion', 'Canserbero', '2024-06-01 05:24:55', 'https://p.scdn.co/mp3-preview/a7d071211e8c20f85f422362ba894f5f6e86d11a?cid=d70d86f359464fa7813434cedffcc29e', '2011-09-16', 'https://i.scdn.co/image/ab67616d0000b273d4cf80983615376b69ee7c7a', NULL),
(27, 1, '6d3q0F9VNtdxQUTVlRcet6', 'Querer Querernos', 'Canserbero', '2024-06-01 05:26:28', 'https://p.scdn.co/mp3-preview/7a46b5c7eb57a93c6fb578e56dad83d7b3ae9b6f?cid=d70d86f359464fa7813434cedffcc29e', '2011-09-16', 'https://i.scdn.co/image/ab67616d0000b273b67647d776568c8aa90c889d', NULL),
(28, 1, '7mykoq6R3BArsSpNDjFQTm', 'I Really Want to Stay at Your House', 'Various Artists', '2024-06-01 16:03:17', 'https://p.scdn.co/mp3-preview/4458f61d9260d98a9143303c0db8a50e4677672a?cid=d70d86f359464fa7813434cedffcc29e', '2020-12-18', 'https://i.scdn.co/image/ab67616d0000b273a91a5b301baac1f46e6f30eb', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `auth0_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `auth0_id`, `email`, `name`, `created_at`) VALUES
(1, 'auth0|123456789', 'user1@example.com', 'John Doe', '2024-05-27 18:37:58'),
(2, 'auth0|987654321', 'user2@example.com', 'Jane Smith', '2024-05-27 18:37:58'),
(3, 'auth0|112233445', 'user3@example.com', 'Alice Johnson', '2024-05-27 18:37:58'),
(4, 'holasoyelid', 'HolasoyelEmail', 'HolasouElNamae', '2024-05-28 21:33:01'),
(5, 'holasoyelid2', 'HolasoyelEmail2', 'HolasouElNama2e', '2024-05-28 21:35:06'),
(6, 'holasoyelid3', 'HolasoyelEmail3', 'HolasouElNama3', '2024-05-28 21:48:23'),
(7, 'google-oauth2|109278716227921021640', 'atrejo96@alumnos.uaq.mx', 'ALAN ORLANDO TREJO TINAJERO', '2024-05-28 22:11:21'),
(8, 'google-oauth2|105581402727840841494', 'alan78707@gmail.com', 'Alan Trejo Tinajero', '2024-05-29 14:50:41');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `playlist_id` (`playlist_id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
