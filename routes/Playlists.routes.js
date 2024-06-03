import express from "express";
import { sPlaylist } from "../controller/playlists.controller.js";
import { AddPlaylist } from "../controller/playlists.controller.js";
import { DelPlaylist } from "../controller/playlists.controller.js";

const Playlist= express.Router();

Playlist.get('/MyPlaylist/:user_id', sPlaylist);

Playlist.post('/AddPlaylist', AddPlaylist);

Playlist.delete('/DeletePlaylist', DelPlaylist);

export default Playlist;
