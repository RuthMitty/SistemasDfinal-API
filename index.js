import express from 'express';
import bodyParser from 'body-parser';
import userRoutes from './routes/users.routes.js';
import cors from './middleware/cors.js'
import addsong from './routes/agregarCancion.routes.js';
import searchPlaylist from './routes/Playlists.routes.js';
import  getsong  from './routes/agregarCancion.routes.js';
//Aqui nadamas se importan todos los datos
const app = express();
app.use(cors);

app.use(express.json());
app.use(bodyParser.json());
//rutas
app.use('/api', userRoutes);
app.use('/api',searchPlaylist);
app.use('/api', addsong);
app.use('/api', getsong);
app.listen(process.env.PORT || 3001, () => {
  console.log("Servidor Backend corriendo en el puerto 3001");
});
//Made by Alan T