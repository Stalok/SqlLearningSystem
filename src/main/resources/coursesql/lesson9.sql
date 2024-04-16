create database test;
CREATE TABLE movies (
                        id INT PRIMARY KEY,
                        title VARCHAR(100),
                        genre VARCHAR(50),
                        release_year INT,
                        director_id INT
);
CREATE TABLE directors (
                           id INT PRIMARY KEY,
                           first_name VARCHAR(50),
                           last_name VARCHAR(50)
);
CREATE TABLE actors (
                        id INT PRIMARY KEY,
                        first_name VARCHAR(50),
                        last_name VARCHAR(50)
);
CREATE TABLE movie_cast (
                            movie_id INT,
                            actor_id INT,
                            role VARCHAR(50),
                            PRIMARY KEY (movie_id, actor_id)
);
INSERT INTO movies (id, title, genre, release_year, director_id)
VALUES
    (1, 'The Shawshank Redemption', 'Drama', 1994, 1),
    (2, 'The Godfather', 'Crime', 1972, 2),
    (3, 'Inception', 'Sci-Fi', 2010, 3);
INSERT INTO directors (id, first_name, last_name)
VALUES
    (1, 'Frank', 'Darabont'),
    (2, 'Francis Ford', 'Coppola'),
    (3, 'Christopher', 'Nolan');
INSERT INTO actors (id, first_name, last_name)
VALUES
    (1, 'Morgan', 'Freeman'),
    (2, 'Marlon', 'Brando'),
    (3, 'Leonardo', 'DiCaprio');
INSERT INTO movie_cast (movie_id, actor_id, role)
VALUES
    (1, 1, 'Red'),
    (1, 2, 'Vito Corleone'),
    (3, 3, 'Cobb');

INSERT INTO actors (id, first_name, last_name)
VALUES
    (4, 'Frank', 'Darabont'),
    (5, 'Frank', 'De Niro'),
    (6, 'Tom', 'Darabont');
SELECT * FROM movies;
