create table book
(
    id           int primary key,
    title        varchar(100),
    author       varchar(100),
    type         varchar(100),
    price        float,
    publish_date date
);
INSERT INTO book (id, title, author, type, price, publish_date) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 15.99, '1960-07-11'),
(2, '1984', 'George Orwell', 'Science Fiction', 12.50, '1949-06-08'),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 10.99, '1925-04-10');
INSERT INTO book (id, title, author, type, price, publish_date) VALUES
(4, 'Pride and Prejudice', 'Jane Austen', 'Romance', 9.99, '1813-01-28'),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 14.50, '1951-07-16'),
(6, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 11.75, '1937-09-21')