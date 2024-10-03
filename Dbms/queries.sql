CREATE TABLE category_header (

    cat_code INT(5) PRIMARY KEY,

    cat_desc VARCHAR(20)

);

CREATE TABLE route_header (

    route_id INT(5) PRIMARY KEY,

    route_no INT(5),

    cat_code INT(5),

    origin VARCHAR(20),

    destination VARCHAR(20),

    fare DECIMAL(7,2),

    distance INT(3),

    capacity INT(3),

    FOREIGN KEY (cat_code) REFERENCES category_header(cat_code)

);
 

CREATE TABLE place_header (

    place_id INT(5) PRIMARY KEY,

    place_name VARCHAR(20) NOT NULL,

    place_address VARCHAR(50),

    bus_station VARCHAR(10)

);
 

CREATE TABLE fleet_header (

    fleet_id INT(5) PRIMARY KEY,

    day DATE,

    route_id INT(5),

    cat_code INT(5),

    FOREIGN KEY (route_id) REFERENCES route_header(route_id),

    FOREIGN KEY (cat_code) REFERENCES category_header(cat_code)

);
 

CREATE TABLE ticket_header (

    fleet_id INT(5),

    ticket_no INT(5) PRIMARY KEY,

    doi DATE NOT NULL,

    dot DATE NOT NULL,

    time_travel CHAR(8),

    board_place VARCHAR(20),

    origin VARCHAR(40),

    destination VARCHAR(40),

    adult INT(3),

    children INT(3),

    total_fare DECIMAL(7,2),

    route_id INT(5),

    FOREIGN KEY (fleet_id) REFERENCES fleet_header(fleet_id),

    FOREIGN KEY (route_id) REFERENCES route_header(route_id)

);
 

CREATE TABLE ticket_detail (

    ticket_no INT(5),

    name VARCHAR(20),

    sex CHAR(1),

    age INT(3),

    fare DECIMAL(5,2),

    FOREIGN KEY (ticket_no) REFERENCES ticket_header(ticket_no)

);
 

CREATE TABLE route_detail (

    route_id INT(5),

    place_id INT(5),

    nonstop CHAR(1),

    FOREIGN KEY (route_id) REFERENCES route_header(route_id),

    FOREIGN KEY (place_id) REFERENCES place_header(place_id)

);

insert into category_header values (01, "super delux"),
(02, "delux"),
(03, "super fast"),
(04, "normal");



insert into route_header values(101, 33,01,"Madurai","Madras",35,205,50),
(102,25,02,"Trichy","Madurai",40,159,50),
(103, 15, 03, "Thanjavur", "Madurai", 59,140,50),
(104,36,04,"Madras","Banglore", 79,375,50),
(105,40,01,"Banglore","Madras", 80,375,50),
(106, 38, 02, "Madras", "Madurai", 39,250,50),
(107, 39, 03, "Hydrabad", "Madras", 50,430,50),
(108, 41, 04, "Madras", "Cochin", 47,576,50);

ALTER TABLE place_header
MODIFY bus_station VARCHAR(50);


INSERT INTO place_header (Place_id, Place_name, Place_address, Bus_station)
VALUES
('01', 'Madras', '10, ptc road', 'Parrys'),
('02', 'Madurai', '21, canal bank road', 'Kknagar'),
('03', 'Trichy', '11, first cross road', 'Bheltown'),
('04', 'Banglore', '15, first main road', 'Cubbon park'),
('05', 'Hydrabad', '115, lake view road', 'Charminar'),
('06', 'Thanjavur', '12, temple road', 'Railway jn');

INSERT INTO fleet_header (Fleet_id, Day, Route_id, Cat_code)
VALUES
('01', '1996-04-10', '101', '01'),
('02', '1996-04-10', '101', '01'),
('03', '1996-04-10', '101', '01'),
('04', '1996-04-10', '102', '02'),
('05', '1996-04-10', '102', '03'),
('06', '1996-04-10', '103', '04');

INSERT INTO ticket_header VALUES('01', '01', '1996-04-10', '1996-05-10', '15:00:00', 'Parrys', 'Madras', 'Madurai', 1, 1, 60, 101),('02', '02', '1996-04-12', '1996-05-05', '09:00:00', 'Kknagar', 'Madurai', 'Madras', 2, 1, 60, 102),('03', '03', '1996-04-21', '1996-05-15', '21:00:00', 'Cubbon park', 'Bangalore', 'Madras', 4, 2, 400, 101);

INSERT INTO ticket_detail
VALUES
('01', 'Charu', 'F', 24, 14.06),
('01', 'Lathu', 'F', 10, 15.55),
('02', 'Anand', 'M', 28, 17.80),
('02', 'Guatham', 'M', 28, 16.00),
('02', 'Bala', 'M', 9, 17.65),
('05', 'Sandip', 'M', 30, 18.00);

INSERT INTO route_detail
VALUES
('105', '01', 'N'),
('012', '02', 'S'),
('106', '01', 'S'),
('108', '05', 'N'),
('106', '02', 'N');