import mysql  from "mysql2";
import util  from "util";
import {DB_HOST, DB_PORT,DB_USER,DB_PASSWORD,DB_DATABASE} from "../src/config.js";


export const pool = mysql.createPool({
    connectionLimit: 10,
    host: DB_HOST,
    database: DB_DATABASE,
    user: DB_USER,
    password: DB_PASSWORD,
    port: DB_PORT
});

pool.query = util.promisify(pool.query);

//Descomentar esto para hacer una prueba de conexion a la BD
// pool.getConnection((err, connection) => {
//     if (err) {
//         console.error("Error al conectar a la base de datos:", err);
//         return;
//     }
//     console.log("Conexión exitosa a la base de datos");
//     connection.release();
// });
//Made by Alan T
