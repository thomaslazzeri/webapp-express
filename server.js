import express from 'express';
import placesRouter from './resources/routes.js';
import dotenv from 'dotenv';
import { notFound } from './middlewares/notFound.js';
import { errorHandler } from './middlewares/errorsHandler.js';
import cors from 'cors';

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

app.use(cors({
    origin: 'http://localhost:5173'
}));

app.use(express.json());
app.use('/images', express.static('public/images'));

app.use('/api', placesRouter);

app.get("/", (req, res) => {
    res.send('Server attivo');
});

app.use(notFound);
app.use(errorHandler);

app.listen(port, () => {
    console.log(`Server in ascolto sulla porta ${port}`);
});