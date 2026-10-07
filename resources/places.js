import db from '../db.js';

export const index = async (req, res) => {
    try {
        const query = `select * from destinations`;
        const [places] = await db.query(query);

        res.json(places);
    } catch (error) {
        res.status(500).json({ error: 'Errore nel recuper della lista' });
    }
};

export const show = async (req, res) => {
    const { id } = req.params;

    try {

        const [places] = await db.query('select * from destinations where id = ?', [id]);

        if (places.length === 0) {
            return res.status(404).json({ message: 'Luogo non trovato' });
        }

        const [reviews] = await db.query('select * from reviews where destination_id = ?', [id]);

        const [tags] = await db.query(
            `select tags.id, tags.name
            from tags
            join destination_tag on tags.id = destination_tag.tag_id
            where destination_tag.destination_id = ?`,
            [id]
        );

        res.json({
            ...places[0],
            tags,
            reviews
        });
        
    } catch (error) {
        res.status(500).json({ error: 'Errore nel recupero dei dettagli' });
    }
};
