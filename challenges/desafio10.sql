CREATE TABLE IF NOT EXISTS fav_songs (
    id_user INT NOT NULL,
    id_song INT NOT NULL,
    CONSTRAINT PRIMARY KEY (id_user, id_song),
    FOREIGN KEY (id_user) REFERENCES users (id_user),
    FOREIGN KEY (id_song) REFERENCES songs (id_song)
);

INSERT INTO fav_songs (id_user, id_song) VALUES
('1','3'),
('1','6'),
('1','10'),
('2','4'),
('3','1'),
('3','3'),
('4','7'),
('4','4'),
('5','10'),
('5','3'),
('8','4'),
('9','7'),
('10','3');