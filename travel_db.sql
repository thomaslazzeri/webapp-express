create database if not exists travel_db;
use travel_db; 

drop table if exists destination_tag;
drop table if exists reviews;
drop table if exists tags;
drop table if exists destinations;

create table destinations (
    id int unsigned auto_increment primary key,
    name varchar(100) not null,
    country varchar(100) not null,
    description text,
    image varchar(255),
    price decimal(8,2) not null,
    created_at timestamp default current_timestamp
);

create table reviews (
    id int unsigned auto_increment primary key,
    destination_id int unsigned not null,
    author varchar(100) not null,
    rating tinyint unsigned not null check (rating between 1 and 5),
    text text,
    created_at timestamp default current_timestamp,
    foreign key (destination_id) references destinations(id) on delete cascade
);

create table tags (
    id int unsigned auto_increment primary key,
    name varchar (50) not null unique
);

create table destination_tag (
    destination_id int unsigned not null,
    tag_id int unsigned not null,
    primary key (destination_id, tag_id),
    foreign key (destination_id) references destinations(id) on delete cascade,
    foreign key (tag_id) references tags(id) on delete cascade
);

insert into destinations (name, country, description, image, price) VALUES
('Jaipur', 'India', 'La città rosa del Rajasthan: palazzi, forti e bazar colorati.', 'jaipur.jpg', 1100.00),
('Kyoto', 'Giappone', 'Templi, giardini zen e quartieri storici in legno.', 'kyoto.jpg', 1400.00),
('Parigi', 'Francia', 'Musei, boulevard e caffè lungo la Senna.', 'parigi.jpg', 600.00),
('Barcellona', 'Spagna', 'Architettura di Gaudí, spiagge e tapas.', 'barcellona.jpg', 380.00),
('New York', 'Stati Uniti', 'Grattacieli, Central Park e musei di livello mondiale.', 'new-york.jpg', 1200.00),
('Santorini', 'Grecia', 'Case bianche a picco sul mare e tramonti sulla caldera.', 'santorini.jpg', 750.00),
('Marrakech', 'Marocco', 'Souk colorati, giardini e la piazza Jemaa el-Fnaa.', 'marrakech.jpg', 520.00),
('Reykjavik', 'Islanda', 'Aurore boreali, geyser e lagune geotermali.', 'reykjavik.jpg', 980.00),
('Bali', 'Indonesia', 'Risaie, templi e spiagge tropicali.', 'bali.jpg', 1300.00),
('Praga', 'Repubblica Ceca', 'Ponti, castello e centro storico da fiaba.', 'praga.jpg', 350.00);

insert into reviews (destination_id, author, rating, text) values
(1, 'Marco', 5, 'Colori, profumi e cibo speziato: un viaggio indimenticabile.'),
(2, 'Giulia', 4, 'Splendida ma molto affollata in alta stagione.'),
(3, 'Luca', 4, 'Un classico che non delude, meglio evitare i weekend.'),
(4, 'Sara', 5, 'Mare, cibo e architettura: il mix perfetto.'),
(5, 'Andrea', 4, 'Energia incredibile, ma tutto costa parecchio.'),
(6, 'Elena', 5, 'I tramonti valgono da soli il viaggio.'),
(7, 'Paolo', 4, 'Un\'esperienza per tutti i sensi, contrattare è d\'obbligo.'),
(8, 'Chiara', 5, 'Paesaggi unici, abbiamo visto l\'aurora boreale.'),
(9, 'Davide', 4, 'Relax e natura, consiglio di muoversi in scooter.'),
(10, 'Francesca', 5, 'Una città da fiaba, perfetta anche per un weekend.');

insert into tags (name) values
('Cultura'),
('Spiaggia'),
('Relax'),
('Natura'),
('Economico'),
('Città'),
('Avventura');

insert into destination_tag (destination_id, tag_id) values
(1, 1), (1, 5),          -- Jaipur: Cultura, Economico
(2, 1), (2, 3), (2, 4),  -- Kyoto: Cultura, Relax, Natura
(3, 1), (3, 6),          -- Parigi: Cultura, Città
(4, 2), (4, 5), (4, 6),  -- Barcellona: Spiaggia, Economico, Città
(5, 1), (5, 6),          -- New York: Cultura, Città
(6, 2), (6, 3),          -- Santorini: Spiaggia, Relax
(7, 1), (7, 5),          -- Marrakech: Cultura, Economico
(8, 4), (8, 7),          -- Reykjavik: Natura, Avventura
(9, 2), (9, 3), (9, 4),  -- Bali: Spiaggia, Relax, Natura
(10, 1), (10, 5), (10, 6);-- Praga: Cultura, Economico, Città