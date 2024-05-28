













-- IMPORTANTE PRIMERO DEBEN DE CREAR LA BD LLAMADA
-- distribuidos luego importan esta bd de prueba 
-- Made by Alan T










SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




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
(3, 2, 'Jane\'s Chill Vibes', '2024-05-27 18:38:06'),
(4, 3, 'Alice\'s Top Hits', '2024-05-27 18:38:06');

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
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `songs`
--

INSERT INTO `songs` (`id`, `playlist_id`, `song_id`, `name`, `artist`, `added_at`) VALUES
(1, 1, 'song_001', 'Song A', 'Artist X', '2024-05-27 18:38:17'),
(2, 1, 'song_002', 'Song B', 'Artist Y', '2024-05-27 18:38:17'),
(3, 2, 'song_003', 'Song C', 'Artist Z', '2024-05-27 18:38:17'),
(4, 3, 'song_004', 'Song D', 'Artist X', '2024-05-27 18:38:17'),
(5, 4, 'song_005', 'Song E', 'Artist Y', '2024-05-27 18:38:17'),
(6, 4, 'song_006', 'Song F', 'Artist Z', '2024-05-27 18:38:17');

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
(3, 'auth0|112233445', 'user3@example.com', 'Alice Johnson', '2024-05-27 18:37:58');

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
  ADD KEY `playlist_id` (`playlist_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
