import express from 'express';
import db from './db.js';
import placesRouter from './resources/routes.js';
import dotenv from 'dotenv';

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());
app.use('/api', placesRouter);
app.use('/images', express.static('public/images'));

app.get("/", (req, res) => {
    res.send('Server attivo');
});

app.listen(port, () => {
    console.log(`Server in ascolto sulla porta ${port}`);
});