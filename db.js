import mysql from 'mysql2/promise.js';

export const connection = await mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'sqlPassword',
    database: 'travel_db'
});

console.log('Connesso al database travel_db');