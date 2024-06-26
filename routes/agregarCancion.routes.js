import express from 'express';
import { addsongFunction, getSongFunction } from '../controller/Songs.controller.js';
import { DeleteSongs } from '../controller/Songs.controller.js';
const router = express.Router();

// Ruta para agregar una cancion
router.post('/AddSong', addsongFunction);

// Ruta para obtener canciones de una playlist
router.get('/GetSong/:playlist_id', getSongFunction);

router.delete('/DelSong', DeleteSongs);
export default router;
