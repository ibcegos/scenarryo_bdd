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
age_limit VARCHAR(255) DEFAULT 'tous public',	-- TABLE avec les diff�rents ages et message perso et logo
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
VALUES ('Harry Potter � l\'�cole des sorciers', 'Chris Columbus', '2001-12-05', '02:32:00',
'Orphelin, Harry Potter a �t� recueilli � contrec�ur par son oncle Vernon et sa tante P�tunia, aussi cruels que mesquins, qui n\'h�sitent pas � le faire dormir dans le placard sous l\'escalier. Constamment maltrait�, il doit en outre supporter les j�r�miades de son cousin Dudley, gar�on cupide et archi-g�t� par ses parents. De leur c�t�, Vernon et P�tunia d�testent leur neveu dont la pr�sence leur rappelle sans cesse le temp�rament "impr�visible" des parents du gar�on et leur mort myst�rieuse.
� l\'approche de ses 11 ans, Harry ne s\'attend � rien de particulier � ni carte, ni cadeau, ni m�me un go�ter d\'anniversaire. Et pourtant, c\'est � cette occasion qu\'il d�couvre qu\'il est le fils de deux puissants magiciens et qu\'il poss�de lui aussi d\'extraordinaires pouvoirs. Quand on lui propose d\'int�grer Poudlard, la prestigieuse �cole de sorcellerie, il trouve enfin le foyer et la famille qui lui ont toujours manqu� et s\'engage dans l\'aventure de sa vie.'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et la chambre des secrets', 'Chris Columbus', '2002-12-04', '02:30:00',
'Alors que l\'oncle Vernon, la tante P�tunia et son cousin Dudley re�oivent d\'importants invit�s � d�ner, Harry Potter est contraint de passer la soir�e dans sa chambre. Dobby, un elfe, fait alors son apparition. Il lui annonce que de terribles dangers menacent l\'�cole de Poudlard et qu\'il ne doit pas y retourner en septembre. Harry refuse de le croire.
Mais sit�t la rentr�e des classes effectu�e, ce dernier entend une voix malveillante. Celle-ci lui dit que la redoutable et l�gendaire Chambre des secrets est � nouveau ouverte, permettant ainsi � l\'h�ritier de Serpentard de semer le chaos � Poudlard. Les victimes, retrouv�es p�trifi�es par une force myst�rieuse, se succ�dent dans les couloirs de l\'�cole, sans que les professeurs - pas m�me le populaire Gilderoy Lockhart - ne parviennent � endiguer la menace. Aid� de Ron et Hermione, Harry doit agir au plus vite pour sauver Poudlard.'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et le prisonnier d\'Azkaban', 'Alfonso Cuar�n', '2004-06-02', '02:20:00',
'Sirius Black, un dangereux sorcier criminel, s\'�chappe de la sombre prison d\'Azkaban avec un seul et unique but : retrouver Harry Potter, en troisi�me ann�e � l\'�cole de Poudlard. Selon la l�gende, Black aurait jadis livr� les parents du jeune sorcier � leur assassin, Lord Voldemort, et serait maintenant d�termin� � tuer Harry...'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et la coupe de feu', 'Mike Newell', '2005-11-30', '02:35:00',
'La quatri�me ann�e � l\'�cole de Poudlard est marqu�e par le "Tournoi des trois sorciers". Les participants sont choisis par la fameuse "coupe de feu" qui est � l\'origine d\'un scandale. Elle s�lectionne Harry Potter alors qu\'il n\'a pas l\'�ge l�gal requis !
Accus� de tricherie et mis � mal par une s�rie d\'�preuves physiques de plus en plus difficiles, ce dernier sera enfin confront� � Celui dont on ne doit pas prononcer le nom, Lord V.'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et l\'ordre du ph�nix', 'David Yates', '2007-07-11', '02:18:00',
'Alors qu\'il entame sa cinqui�me ann�e d\'�tudes � Poudlard, Harry Potter d�couvre que la communaut� des sorciers ne semble pas croire au retour de Voldemort, convaincue par une campagne de d�sinformation orchestr�e par le Ministre de la Magie Cornelius Fudge. Afin de le maintenir sous surveillance, Fudge impose � Poudlard un nouveau professeur de D�fense contre les Forces du Mal, Dolor�s Ombrage, charg�e de maintenir l\'ordre � l\'�cole et de surveiller les faits et gestes de Dumbledore. Prodiguant aux �l�ves des cours sans grand int�r�t, celle qui se fait appeler la Grande Inquisitrice de Poudlard semble �galement d�cid�e � tout faire pour rabaisser Harry. Entour� de ses amis Ron et Hermione, ce dernier met sur pied un groupe secret, "L\'Arm�e de Dumbledore", pour leur enseigner l\'art de la d�fense contre les forces du Mal et se pr�parer � la guerre qui s\'annonce...'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et le prince de sang m�l�', 'David Yates', '2009-07-15', '02:32:00',
'L\'�tau d�moniaque de Voldemort se resserre sur l\'univers des Moldus et le monde de la sorcellerie. Poudlard a cess� d\'�tre un havre de paix, le danger rode au coeur du ch�teau... Mais Dumbledore est plus d�cid� que jamais � pr�parer Harry � son combat final, d�sormais imminent. Ensemble, le vieux ma�tre et le jeune sorcier vont tenter de percer � jour les d�fenses de Voldemort. Pour les aider dans cette d�licate entreprise, Dumbledore va relancer et manipuler son ancien coll�gue, le Professeur Horace Slughorn, qu\'il croit en possession d\'informations vitales sur le jeune Voldemort. Mais un autre "mal" hante cette ann�e les �tudiants : le d�mon de l\'adolescence ! Harry est de plus en plus attir� par Ginny, qui ne laisse pas indiff�rent son rival, Dean Thomas ; Lavande Brown a jet� son d�volu sur Ron, mais oubli� le pouvoir "magique" des chocolats de Romilda Vane ; Hermione, rong�e par la jalousie, a d�cid� de cacher ses sentiments, vaille que vaille. L\'amour est dans tous les coeurs - sauf un. Car un �tudiant reste �trangement sourd � son appel. Dans l\'ombre, il poursuit avec acharnement un but aussi myst�rieux qu\'inqui�tant... jusqu\'� l\'in�vitable trag�die qui bouleversera � jamais Poudlard...'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et les reliques de la mort - partie 1', 'David Yates', '2010-11-24', '02:25:00',
'Le pouvoir de Voldemort s\'�tend. Celui-ci contr�le maintenant le Minist�re de la Magie et Poudlard. Harry, Ron et Hermione d�cident de terminer le travail commenc� par Dumbledore, et de retrouver les derniers Horcruxes pour vaincre le Seigneur des T�n�bres. Mais il reste bien peu d\'espoir aux trois sorciers, qui doivent r�ussir � tout prix.'
);
INSERT INTO movie (title, producer,release_date, duration, synopsis)
VALUES ('Harry Potter et les reliques de la mort - partie 2', 'David Yates', '2011-07-13', '02:10:00',
'Dans la 2e Partie de cet �pisode final, le combat entre les puissances du bien et du mal de l�univers des sorciers se transforme en guerre sans merci. Les enjeux n�ont jamais �t� si consid�rables et personne n�est en s�curit�. Mais c�est Harry Potter qui peut �tre appel� pour l�ultime sacrifice alors que se rapproche l�ultime �preuve de force avec Voldemort.'
);



