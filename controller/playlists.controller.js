import { pool } from "../config/database.js";

export const sPlaylist = async (req, res, next) => {
  const { user_id } = req.params;

  try {
    const query = "SELECT * FROM playlists WHERE user_id = ?";
    const playlists = await pool.query(query, [user_id]);
    console.log(playlists);
    return res.status(200).json({ playlists }); 
  } catch (error) {
    console.log('Error al obtener las playlists:', error);
    return res.status(500).json({ error: "Error al obtener las playlists" });
  }
};
