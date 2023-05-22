DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artists (
	id_artist INT NOT NULL AUTO_INCREMENT,
    artist_name VARCHAR(100) NOT NULL,
    CONSTRAINT PRIMARY KEY (id_artist)
);

INSERT INTO artists (artist_name) VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

CREATE TABLE plans (
	id_plan INT NOT NULL AUTO_INCREMENT,
    plan_type VARCHAR(45) NOT NULL,
    plan_value DOUBLE NOT NULL,
    CONSTRAINT PRIMARY KEY (id_plan)
);

INSERT INTO plans (plan_type, plan_value) VALUES
('gratuito', '0'),
('familiar', '7.99'),
('universitário', '5.99'),
('pessoal', '6.99');

CREATE TABLE users (
	id_user INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    user_age INT NOT NULL,
    asing_plan DATE NOT NULL,
    id_plan INT NOT NULL,
    CONSTRAINT PRIMARY KEY (id_user),
    FOREIGN KEY (id_plan) REFERENCES plans (id_plan)
);

INSERT INTO users (user_name, user_age, id_plan, asing_plan) VALUES
('Barbara Liskov', '82', '1', '2019-10-20'),
('Robert Cecil Martin', '58', '1', '2017-01-06'),
('Ada Lovelace', '37', '2', '2017-12-30'),
('Martin Fowler', '46', '2', '2017-01-17'),
('Sandi Metz', '58', '2', '2018-04-29'),
('Paulo Freire', '19', '3', '2018-02-14'),
('Bell Hooks', '26', '3', '2018-01-05'),
('Christopher Alexander', '85', '4', '2019-06-05'),
('Judith Butler', '45', '4', '2020-05-13'),
('Jorge Amado', '58', '4', '2017-02-17');

CREATE TABLE albuns (
	id_album INT NOT NULL AUTO_INCREMENT,
    album_name VARCHAR(100) NOT NULL,
    album_release YEAR NOT NULL,
    id_artist INT NOT NULL,
    CONSTRAINT PRIMARY KEY (id_album),
    FOREIGN KEY (id_artist) REFERENCES artists (id_artist)
);

INSERT INTO albuns (album_name, album_release, id_artist) VALUES
('Renaissance', '2022', '1'),
('Jazz', '1978', '2'),
('Hot Space', '1982', '2'),
('Falso Brilhante', '1998', '3'),
('Vento de Maio', '2001', '3'),
('QVVJFA?', '2003', '4'),
('Somewhere Far Beyond', '2007', '5'),
('I Put A Spell On You', '2012', '6');

CREATE TABLE songs (
	id_song INT NOT NULL AUTO_INCREMENT,
    song_name VARCHAR(100) NOT NULL,
    id_artist INT NOT NULL,
    id_album INT NOT NULL,
    song_duration INT NOT NULL,
    CONSTRAINT PRIMARY KEY (id_song),
    FOREIGN KEY (id_album) REFERENCES albuns (id_album),
    FOREIGN KEY (id_artist) REFERENCES artists (id_artist)
);

INSERT INTO songs (song_name, id_artist, id_album, song_duration) VALUES
('Break My Soul', '1', '1', '279'),
("Virgo's Groove", '1', '1', '369'),
('Alien Superstar', '1', '1', '116'),
("Don't Stop Me Now", '2', '2', '203'),
('Under Pressure', '2', '3', '152'),
('Como Nossos Pais', '3', '4', '105'),
('O Medo de Amar é o Medo de Ser Livre', '3', '5', '207'),
('Samba em Paris', '4', '6', '267'),
("The Bard's Song", '5', '7', '244'),
('Feeling Good', '6', '8', '100');

CREATE TABLE follow (
	id_artist INT NOT NULL,
    id_user INT NOT NULL,
    CONSTRAINT PRIMARY KEY (id_artist, id_user),
    FOREIGN KEY (id_artist) REFERENCES artists (id_artist),
    FOREIGN KEY (id_user) REFERENCES users (id_user)
);

INSERT INTO follow (id_artist, id_user) VALUES
('1', '1'),
('2', '1'),
('3', '1'),
('1', '2'),
('3', '2'),
('2', '3'),
('4', '4'),
('5', '5'),
('6', '5'),
('6', '6'),
('1', '6'),
('6', '7'),
('3', '9'),
('2', '10');

CREATE TABLE play_history (
    id_user INT NOT NULL,
    id_song INT NOT NULL,
    date_play DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY (id_user, id_song),
    FOREIGN KEY (id_user) REFERENCES users (id_user),
    FOREIGN KEY (id_song) REFERENCES songs (id_song)
);

INSERT INTO play_history (id_user, id_song, date_play) VALUES
('1', '8', '2022-02-28 10:45:55'),
('1', '2', '2020-05-02 05:30:35'),
('1', '10', '2020-03-06 11:22:33'),
('2', '10', '2022-08-05 08:05:17'),
('2', '7', '2020-01-02 07:40:33'),
('3', '10', '2020-11-13 16:55:13'),
('3', '2', '2020-12-05 18:38:30'),
('4', '8', '2021-08-15 17:10:10'),
('5', '8', '2022-01-09 01:44:33'),
('5', '5', '2020-08-06 15:23:43'),
('6', '7', '2017-01-24 00:31:17'),
('6', '1', '2017-10-12 12:35:20'),
('7', '4', '2011-12-15 22:30:49'),
('8', '4', '2012-03-17 14:56:41'),
('9', '9', '2022-02-24 21:14:22'),
('10', '3', '2015-12-13 08:30:22');
