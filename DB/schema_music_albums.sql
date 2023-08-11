-- schema.sql

-- Create genres table
CREATE TABLE genres (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255)
);

-- Create music_albums table
CREATE TABLE music_albums (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre_id INT,
    author VARCHAR(255),
    label VARCHAR(255),
    published_date DATE,
    on_spotify BOOLEAN,
    genre_id INTEGER,
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);
