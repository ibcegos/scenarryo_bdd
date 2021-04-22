-- --------------------------------- drop all tables ---------------------------------------

-- delete table for film_show
DROP TABLE IF EXISTS film_show;
-- delete table for schedule
DROP TABLE IF EXISTS schedule;
-- delete table for movie
DROP TABLE IF EXISTS movie;
-- delete table for room
DROP TABLE IF EXISTS room;
-- delete table for category
DROP TABLE IF EXISTS category;
-- delete table for actor
DROP TABLE IF EXISTS actor;

-- --------------------------------- create all tables --------------------------------------

-- creating table for room
DROP TABLE IF EXISTS room;
CREATE TABLE IF NOT EXISTS room (
id INT UNIQUE NOT NULL AUTO_INCREMENT,
room_number TINYINT UNIQUE NOT NULL,
seats_quantity SMALLINT,
-- room_size DOUBLE,	
-- id_cinema INT,
PRIMARY KEY (id)
-- FOREIGN KEY (id_cinema) REFERENCES cinema(id)
);

-- creating table for category
DROP TABLE IF EXISTS category;
CREATE TABLE IF NOT EXISTS category (
id int UNIQUE NOT NULL AUTO_INCREMENT,
genre VARCHAR(255),
PRIMARY KEY (id)
);

-- creating table for actor
DROP TABLE IF EXISTS actor;
CREATE TABLE IF NOT EXISTS actor (
id int UNIQUE NOT NULL AUTO_INCREMENT,
firstname VARCHAR(255),
lastname VARCHAR(255),
PRIMARY KEY (id)
);

-- creating table for movie
DROP TABLE IF EXISTS movie;
CREATE TABLE IF NOT EXISTS movie (
id INT UNIQUE NOT NULL AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
producer VARCHAR(255),
release_date DATE,
age_limit VARCHAR(255) DEFAULT 'tous public',	-- TABLE avec les différents ages et message perso et logo
synopsis TEXT,
duration TIME,
-- voice VARCHAR(255),   TABLE pour voice/subtitle/vo ...
poster LONGBLOB,
id_category INT,
id_actor INT,
PRIMARY KEY (id),
FOREIGN KEY (id_category) REFERENCES category(id),
FOREIGN KEY (id_actor) REFERENCES actor(id)
);

-- creating table for schedule
DROP TABLE IF EXISTS schedule;
CREATE TABLE IF NOT EXISTS schedule (
id int UNIQUE NOT NULL AUTO_INCREMENT,
film_show_date DATE,
starting_hour TIME,
ending_hour TIME,
PRIMARY KEY (id)
);

-- creating table for film_show (06)
DROP TABLE IF EXISTS film_show;
CREATE TABLE IF NOT EXISTS film_show (
id INT UNIQUE NOT NULL AUTO_INCREMENT,
price_ticket DOUBLE,
booked_seats SMALLINT,
id_room INT,
id_movie INT,
id_schedule INT,
PRIMARY KEY (id),
FOREIGN KEY (id_room) REFERENCES room(id),
FOREIGN KEY (id_movie) REFERENCES movie(id),
FOREIGN KEY (id_schedule) REFERENCES schedule(id)
);


-- --------------------------------------- add data ------------------------------------------

INSERT INTO room (room_number, seats_quantity) VALUES (1, 600);
INSERT INTO room (room_number, seats_quantity) VALUES (2, 500);
INSERT INTO room (room_number, seats_quantity) VALUES (3, 1000);
INSERT INTO room (room_number, seats_quantity) VALUES (4, 200);
INSERT INTO room (room_number, seats_quantity) VALUES (5, 1000);

INSERT INTO schedule (film_show_date, starting_hour, ending_hour)VALUES ('2021-04-20', '10:00:00', '12:00:00');
INSERT INTO schedule (film_show_date, starting_hour, ending_hour)VALUES ('2021-04-20', '12:00:00', '14:00:00');
INSERT INTO schedule (film_show_date, starting_hour, ending_hour)VALUES ('2021-04-20', '14:00:00', '16:00:00');
INSERT INTO schedule (film_show_date, starting_hour, ending_hour)VALUES ('2021-04-20', '16:00:00', '18:00:00');
INSERT INTO schedule (film_show_date, starting_hour, ending_hour)VALUES ('2021-04-20', '18:00:00', '20:00:00');
INSERT INTO schedule (film_show_date, starting_hour, ending_hour)VALUES ('2021-04-20', '20:00:00', '22:00:00');

INSERT INTO film_show (price_ticket , booked_seats)VALUES (5.5, 200);
INSERT INTO film_show (price_ticket , booked_seats)VALUES (7.5, 300);
INSERT INTO film_show (price_ticket , booked_seats)VALUES (5.5, 500);

INSERT INTO category (genre)VALUES ('aventure');
INSERT INTO category (genre)VALUES ('action');
INSERT INTO category (genre)VALUES ('science fiction');
INSERT INTO category (genre)VALUES ('drame');

INSERT INTO actor (firstname, lastname)VALUES ('Daniel', 'Radcliffe');
INSERT INTO actor (firstname, lastname)VALUES ('Rupert', 'Grint');
INSERT INTO actor (firstname, lastname)VALUES ('Emma', 'Watson');

INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter à l\'école des sorciers', 'Chris Columbus', '2001-12-05', '02:32:00',
'Orphelin, Harry Potter a été recueilli à contrecœur par son oncle Vernon et sa tante Pétunia, aussi cruels que mesquins, qui n\'hésitent pas à le faire dormir dans le placard sous l\'escalier. Constamment maltraité, il doit en outre supporter les jérémiades de son cousin Dudley, garçon cupide et archi-gâté par ses parents. De leur côté, Vernon et Pétunia détestent leur neveu dont la présence leur rappelle sans cesse le tempérament "imprévisible" des parents du garçon et leur mort mystérieuse.
À l\'approche de ses 11 ans, Harry ne s\'attend à rien de particulier – ni carte, ni cadeau, ni même un goûter d\'anniversaire. Et pourtant, c\'est à cette occasion qu\'il découvre qu\'il est le fils de deux puissants magiciens et qu\'il possède lui aussi d\'extraordinaires pouvoirs. Quand on lui propose d\'intégrer Poudlard, la prestigieuse école de sorcellerie, il trouve enfin le foyer et la famille qui lui ont toujours manqué… et s\'engage dans l\'aventure de sa vie.'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et la chambre des secrets', 'Chris Columbus', '2002-12-04', '02:30:00',
'Alors que l\'oncle Vernon, la tante Pétunia et son cousin Dudley reçoivent d\'importants invités à dîner, Harry Potter est contraint de passer la soirée dans sa chambre. Dobby, un elfe, fait alors son apparition. Il lui annonce que de terribles dangers menacent l\'école de Poudlard et qu\'il ne doit pas y retourner en septembre. Harry refuse de le croire.
Mais sitôt la rentrée des classes effectuée, ce dernier entend une voix malveillante. Celle-ci lui dit que la redoutable et légendaire Chambre des secrets est à nouveau ouverte, permettant ainsi à l\'héritier de Serpentard de semer le chaos à Poudlard. Les victimes, retrouvées pétrifiées par une force mystérieuse, se succèdent dans les couloirs de l\'école, sans que les professeurs - pas même le populaire Gilderoy Lockhart - ne parviennent à endiguer la menace. Aidé de Ron et Hermione, Harry doit agir au plus vite pour sauver Poudlard.'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et le prisonnier d\'Azkaban', 'Alfonso Cuarón', '2004-06-02', '02:20:00',
'Sirius Black, un dangereux sorcier criminel, s\'échappe de la sombre prison d\'Azkaban avec un seul et unique but : retrouver Harry Potter, en troisième année à l\'école de Poudlard. Selon la légende, Black aurait jadis livré les parents du jeune sorcier à leur assassin, Lord Voldemort, et serait maintenant déterminé à tuer Harry...'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et la coupe de feu', 'Mike Newell', '2005-11-30', '02:35:00',
'La quatrième année à l\'école de Poudlard est marquée par le "Tournoi des trois sorciers". Les participants sont choisis par la fameuse "coupe de feu" qui est à l\'origine d\'un scandale. Elle sélectionne Harry Potter alors qu\'il n\'a pas l\'âge légal requis !
Accusé de tricherie et mis à mal par une série d\'épreuves physiques de plus en plus difficiles, ce dernier sera enfin confronté à Celui dont on ne doit pas prononcer le nom, Lord V.'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et l\'ordre du phénix', 'David Yates', '2007-07-11', '02:18:00',
'Alors qu\'il entame sa cinquième année d\'études à Poudlard, Harry Potter découvre que la communauté des sorciers ne semble pas croire au retour de Voldemort, convaincue par une campagne de désinformation orchestrée par le Ministre de la Magie Cornelius Fudge. Afin de le maintenir sous surveillance, Fudge impose à Poudlard un nouveau professeur de Défense contre les Forces du Mal, Dolorès Ombrage, chargée de maintenir l\'ordre à l\'école et de surveiller les faits et gestes de Dumbledore. Prodiguant aux élèves des cours sans grand intérêt, celle qui se fait appeler la Grande Inquisitrice de Poudlard semble également décidée à tout faire pour rabaisser Harry. Entouré de ses amis Ron et Hermione, ce dernier met sur pied un groupe secret, "L\'Armée de Dumbledore", pour leur enseigner l\'art de la défense contre les forces du Mal et se préparer à la guerre qui s\'annonce...'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et le prince de sang mêlé', 'David Yates', '2009-07-15', '02:32:00',
'L\'étau démoniaque de Voldemort se resserre sur l\'univers des Moldus et le monde de la sorcellerie. Poudlard a cessé d\'être un havre de paix, le danger rode au coeur du château... Mais Dumbledore est plus décidé que jamais à préparer Harry à son combat final, désormais imminent. Ensemble, le vieux maître et le jeune sorcier vont tenter de percer à jour les défenses de Voldemort. Pour les aider dans cette délicate entreprise, Dumbledore va relancer et manipuler son ancien collègue, le Professeur Horace Slughorn, qu\'il croit en possession d\'informations vitales sur le jeune Voldemort. Mais un autre "mal" hante cette année les étudiants : le démon de l\'adolescence ! Harry est de plus en plus attiré par Ginny, qui ne laisse pas indifférent son rival, Dean Thomas ; Lavande Brown a jeté son dévolu sur Ron, mais oublié le pouvoir "magique" des chocolats de Romilda Vane ; Hermione, rongée par la jalousie, a décidé de cacher ses sentiments, vaille que vaille. L\'amour est dans tous les coeurs - sauf un. Car un étudiant reste étrangement sourd à son appel. Dans l\'ombre, il poursuit avec acharnement un but aussi mystérieux qu\'inquiétant... jusqu\'à l\'inévitable tragédie qui bouleversera à jamais Poudlard...'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et les reliques de la mort - partie 1', 'David Yates', '2010-11-24', '02:25:00',
'Le pouvoir de Voldemort s\'étend. Celui-ci contrôle maintenant le Ministère de la Magie et Poudlard. Harry, Ron et Hermione décident de terminer le travail commencé par Dumbledore, et de retrouver les derniers Horcruxes pour vaincre le Seigneur des Ténèbres. Mais il reste bien peu d\'espoir aux trois sorciers, qui doivent réussir à tout prix.'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et les reliques de la mort - partie 2', 'David Yates', '2011-07-13', '02:10:00',
'Dans la 2e Partie de cet épisode final, le combat entre les puissances du bien et du mal de l’univers des sorciers se transforme en guerre sans merci. Les enjeux n’ont jamais été si considérables et personne n’est en sécurité. Mais c’est Harry Potter qui peut être appelé pour l’ultime sacrifice alors que se rapproche l’ultime épreuve de force avec Voldemort.'
);



