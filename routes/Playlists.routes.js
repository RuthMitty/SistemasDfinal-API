import express from "express";
import { sPlaylist } from "../controller/playlists.controller.js";

const searchPlaylist= express.Router();

searchPlaylist.get('/MyPlaylist/:user_id', sPlaylist);

export default searchPlaylist;
