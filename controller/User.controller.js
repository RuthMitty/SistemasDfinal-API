import { pool } from "../config/database.js";

export const createUser = async (req, res, next) => {
  const { auth0_id, email, name } = req.body;

  try {
    const query = 'SELECT * FROM users WHERE auth0_id = ?';
    const existingUser = await pool.query(query, [auth0_id]);

    if (existingUser.length > 0) {
      // El usuario ya está registrado
      return res.status(200).json({ message: "Usuario ya registrado" });
    }

    const insertQuery = 'INSERT INTO users (auth0_id, email, name) VALUES (?, ?, ?)';
    await pool.query(insertQuery, [auth0_id, email, name]);
    console.log("Por aqui estoy")
    return res.status(201).json({ message: 'Usuario registrado'});
  } catch (error) {
    console.error('Error al registrar el usuariossss:', error);
    return res.status(500).json({ error });
  }
};
//made by Alan T 