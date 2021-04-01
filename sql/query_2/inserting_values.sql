-- insert values in table S
INSERT INTO S (S, SNAME, STATUS, CITY)
VALUES ('S1', 'Smith', 20, 'London'),
       ('S2', 'Jones', 10, 'Paris'),
       ('S3', 'Blake', 30, 'Paris'),
       ('S4', 'Clark', 20, 'London'),
       ('S5', 'Adams', 30, 'Athens');


-- insert values in table P
INSERT INTO P (P, PNAME, COLOR, WEIGHT, CITY)
VALUES ('P1', 'Nut', 'Red', 12.0, 'London'),
       ('P2', 'Bolt', 'Green', 17.0, 'Paris'),
       ('P3', 'Screw', 'Blue', 17.0, 'Rome'),
       ('P4', 'Screw', 'Red', 14.0, 'London'),
       ('P5', 'Cam', 'Blue', 12.0, 'Paris'),
       ('P6', 'Cog', 'Red' , 19.0, 'London');


-- insert values in table J
INSERT INTO J (J, JNAME, CITY)
VALUES ('J1', 'Sorter', 'Paris'),
       ('J2', 'Display', 'Rome'),
       ('J3', 'OCR', 'Athens'),
       ('J4', 'Console', 'Athens'),
       ('J5', 'RAID', 'London'),
       ('J6', 'EDS', 'Oslo'),
       ('J7', 'ARP', 'London');


-- insert values in table SPJ
INSERT INTO SPJ (S, P, J, QTY)
VALUES ('S1', 'P1', 'J1', 200),
       ('S1', 'P1', 'J4', 700),
       ('S2', 'P3', 'J1', 400),
       ('S2', 'P3', 'J2', 200),
       ('S2', 'P3', 'J3', 200),
       ('S2', 'P3', 'J4', 500),
       ('S2', 'P3', 'J5', 600),
       ('S2', 'P3', 'J6', 400),
       ('S2', 'P3', 'J7', 800),
       ('S2', 'P5', 'J2', 100),
       ('S3', 'P3', 'J1', 200),
       ('S3', 'P4', 'J2', 500),
       ('S4', 'P6', 'J3', 300),
       ('S4', 'P6', 'J7', 300),
       ('S5', 'P2', 'J2', 200),
       ('S5', 'P2', 'J4', 100),
       ('S5', 'P5', 'J5', 500),
       ('S5', 'P5', 'J7', 100),
       ('S5', 'P6', 'J2', 200),
       ('S5', 'P1', 'J4', 100),
       ('S5', 'P3', 'J4', 200),
       ('S5', 'P4', 'J4', 800),
       ('S5', 'P5', 'J4', 400),
       ('S5', 'P6', 'J4', 500);
