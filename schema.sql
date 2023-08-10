-- Create genres table
CREATE TABLE genres (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Create music_albums table
CREATE TABLE music_albums (
    id INT PRIMARY KEY,
    genre_id INT,
    author VARCHAR(255),
    label VARCHAR(255),
    published_date DATE,
    on_spotify BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);
