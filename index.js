import express from 'express';
import bodyParser from 'body-parser';
import userRoutes from './routes/users.routes.js';
import cors from './middleware/cors.js'

// const cors = require('./middleware/cors.js');


//Aqui nadamas se importan todos los datos
const app = express();
app.use(cors);

app.use(express.json());
app.use(bodyParser.json());

app.use('/api', userRoutes);

app.listen(process.env.PORT || 3001, () => {
  console.log("Servidor Backend corriendo en el puerto 3001");
});
//Made by Alan T