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


export const AddPlaylist = async (req, res, next)=>{
  const {Name, user_id} = req.body;
  try{
    const query = `Insert into playlists (name, user_id) values (?,?)`;
    await pool.query(query,[Name, user_id]);
    return res.status(201).json({message: 'Playlist Creada'});

  }catch (error){
    console.log('Error al insertar la playlist', error);
    return res.status(500).json({error});
  }
}


export const DelPlaylist = async (req, res, next) => {
  const { id } = req.body;

  try {
    // Eliminar todas lascanciones de la playlist
    const deleteSongsQuery = 'DELETE FROM songs WHERE playlist_id = ?';
    await pool.query(deleteSongsQuery, [id]);

    // procede a eliminar la playlist
    const deletePlaylistQuery = 'DELETE FROM playlists WHERE id = ?';
    const result = await pool.query(deletePlaylistQuery, [id]);
    
    if (result.affectedRows > 0) {
      return res.status(200).json({ message: 'Playlist borrada exitosamente' });
    } else {
      return res.status(404).json({ message: 'La playlist no fue encontrada' });
    }
  } catch (error) {
    console.log('Error al borrar la playlist:', error);
    return res.status(500).json({ error: 'Error al borrar la playlist' });
  }
};
