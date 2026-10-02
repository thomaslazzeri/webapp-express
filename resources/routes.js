import express from 'express';
import { index, show } from './places.js';

const router = express.Router();

router.get('/places', index);

router.get('/places/:id', show);

export default router;