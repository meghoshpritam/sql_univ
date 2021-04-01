-- insert values in table S
INSERT INTO S (S, SNAME, STATUS, CITY)
VALUES ('S1', 'Smith', 20, 'London'),
       ('S2', 'Jones', 10, 'Paris'),
       ('S3', 'Blake', 30, 'Paris'),
       ('S4', 'Clark', 20, 'London'),
       ('S5', 'Adams', 30, 'Athens');

SELECT *
FROM S;

-- insert values in table P
INSERT INTO P (P, PNAME, COLOR, WT, CITY)
VALUES ('P1', 'Nut', 'Red', 12, 'London'),
       ('P2', 'Bolt', 'Green', 17, 'Paris'),
       ('P3', 'Screw', 'Blue', 17, 'Rome'),
       ('P4', 'Screw', 'Red', 14, 'London'),
       ('P5', 'Cam', 'Blue', 12, 'Paris'),
       ('P6', 'Cog', 'Red' , 19, 'London');
SELECT *
FROM P;

-- insert values in table SP
INSERT INTO SP (S, P, QTY)
VALUES ('S1', 'P1', 300),
       ('S1', 'P2', 200),
       ('S1', 'P3', 400),
       ('S1', 'P4', 200),
       ('S1', 'P5', 100),
       ('S1', 'P6', 100),
       ('S2', 'P1', 300),
       ('S2', 'P2', 400),
       ('S3', 'P2', 200),
       ('S4', 'P2', 200),
       ('S4', 'P4', 300),
       ('S4', 'P5', 400);
SELECT *
FROM SP;
