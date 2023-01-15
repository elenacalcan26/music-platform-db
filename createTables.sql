CREATE TABLE Users (
    username VARCHAR(30),
    name VARCHAR(30),
    email VARCHAR(30) NOT NULL,

    CONSTRAINT pk_username PRIMARY KEY (username),
    CONSTRAINT unique_email UNIQUE (email)
);

CREATE TABLE Artists (
    id INT,
    name VARCHAR(30) NOT NULL,

    CONSTRAINT pk_artist_id PRIMARY KEY (id)
);

CREATE TABLE Genres (
    id INT,
    name VARCHAR(20) NOT NULL,

    CONSTRAINT pk_id_genre PRIMARY KEY (id),
    CONSTRAINT unique_genre_name UNIQUE (name)
);

CREATE TABLE Albums (
    id INT,
    title VARCHAR(50) NOT NULL,
    id_genre INT NOT NULL,
    id_artist INT NOT NULL,
    release_date DATE NOT NULL,
    label VARCHAR(50)

    CONSTRAINT pk_albums_id PRIMARY KEY (id),
    CONSTRAINT fk_album_artist FOREIGN KEY (id_artist) REFERENCES Artists (id),
    CONSTRAINT fk_album_genre FOREIGN KEY (id_genre) REFERENCES Genres (id)
);

CREATE TABLE Songs (
    id INT,
    title VARCHAR(50) NOT NULL,
    id_artist INT NOT NULL,
    id_album INT,
    id_genre INT NOT NULL,
    length TIME NOT NULL,

    CONSTRAINT pk_song_id PRIMARY KEY (id),
    CONSTRAINT fk_song_artist FOREIGN KEY (id_artist) REFERENCES Artists (id),
    CONSTRAINT fk_song_album FOREIGN KEY (id_album) REFERENCES Albums (id),
    CONSTRAINT fk_song_genre FOREIGN KEY (id_genre) REFERENCES Genres (id)
);

CREATE TABLE Favorite_Songs (
    id INT IDENTITY,
    username VARCHAR(30) NOT NULL,
    id_song INT NOT NULL

    CONSTRAINT pk_fav_id PRIMARY KEY (id),
    CONSTRAINT fk_fav_user FOREIGN KEY (username) REFERENCES Users (username),
    CONSTRAINT fk_fav_song FOREIGN KEY (id_song) REFERENCES Songs (id)
);
