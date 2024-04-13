create table if not exists Car(
    id int primary key,
    name varchar(255),
    price int,
    year int,
    color varchar(255)
);

INSERT INTO Car(id, name, price, year, color)
VALUES
    (1, 'BMW', 100000, 2019, 'black'),
    (2, 'Audi', 90000, 2018, 'white'),
    (3, 'Mercedes', 110000, 2017, 'red'),
    (4, 'Toyota', 50000, 2016, 'blue'),
    (5, 'Honda', 40000, 2015, 'green'),
    (6, 'Ford', 30000, 2014, 'yellow'),
    (7, 'Chevrolet', 20000, 2013, 'red'),
    (8, 'Nissan', 10000, 2012, 'white'),
    (9, 'Hyundai', 5000, 2011, 'pink'),
    (10, 'Kia', 1000, 2010, 'white');
