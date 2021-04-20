-- 1 Get full details of all projects
SELECT *
FROM J;


-- 2 Get full details of all project in London
SELECT *
FROM J
WHERE J.CITY = 'London';


-- 3 Get supplier number for suppliers who supply project J1
SELECT S, J
FROM SPJ
WHERE J = 'J1';


-- 4 Get all shipments where the quantity is in the range 300 to 750 inclusive
SELECT DISTINCT S.S, S.SNAME, S.STATUS, S.CITY, SPJ.QTY
FROM SPJ,
     S
WHERE SPJ.S = S.S
  AND QTY >= 300
  AND QTY <= 700;


# 5 Get all part-color/part-city combinations Note Here and subsequently the team 
#  "all is to be taken-to mean" all currently represented-in the database. "not all"
#  possible
SELECT DISTINCT COLOR, CITY
FROM P;


# 6 Get all supplier-number/part-number/project-number triples such that the indicate
#  supplier, part and project are all colocaled(i.e all in the same city).
SELECT SPJ.S, SPJ.P, SPJ.J, S.CITY AS S_CITY, P.CITY AS P_CITY, J.CITY AS J_CITY
FROM S,
     P,
     J,
     SPJ
WHERE S.S = SPJ.S
  AND P.P = SPJ.P
  AND J.J = SPJ.J
  AND S.CITY = P.CITY
  AND S.CITY = J.CITY;


#  7 Get all supplier-number/part-number/project-number triples such that the indicate
#  supplier, part and project are not all colocaled.
SELECT SPJ.S, SPJ.P, SPJ.J, S.CITY AS S_CITY, P.CITY AS P_CITY, J.CITY AS J_CITY
FROM S,
     P,
     J,
     SPJ
WHERE S.S = SPJ.S
  AND P.P = SPJ.P
  AND J.J = SPJ.J
  AND S.CITY != P.CITY
  AND S.CITY != J.CITY;


# 8 Get all supplier-number/part-number/project-number triples such that no two indicated
#  supplier, part and project are colocated.
SELECT SPJ.S, SPJ.P, SPJ.J, S.CITY AS S_CITY, P.CITY AS P_CITY, J.CITY AS J_CITY
FROM S,
     P,
     J,
     SPJ
WHERE S.S = SPJ.S
  AND P.P = SPJ.P
  AND J.J = SPJ.J
  AND S.CITY != P.CITY
  AND S.CITY != J.CITY
  AND P.CITY != J.CITY;


-- 9 Get full details for parts supplied by a supplier in London.
SELECT P.P, P.PNAME, P.COLOR, P.WEIGHT, P.CITY, S.CITY AS S_CITY
FROM S,
     P,
     SPJ
WHERE S.S = SPJ.S
  AND P.P = SPJ.P
  AND S.CITY = 'London';


-- 10 Get part numbers for parts supplied by a supplier in London to a project in London
SELECT P.P, P.CITY AS P_CITY, S.CITY AS S_CITY, J.CITY AS J_CITY
FROM S,
     P,
     J,
     SPJ
WHERE S.S = SPJ.S
  AND P.P = SPJ.P
  AND J.J = SPJ.J
  AND S.CITY = 'London'
  AND J.CITY = 'London';


# 11 Get all pairs of city name such that a supplier in the first city supplies a
#  project the second city
SELECT DISTINCT S.S, S.CITY AS Supplier_City, J.J, J.CITY AS Project_City
FROM S,
     J
WHERE S.CITY != J.CITY;

# 12 Get part numbers for parts supplid to ah, project by a supplier in the same
#  city in the project
SELECT DISTINCT P.P, S.CITY AS S_CITY, J.CITY
FROM S,
     P,
     J,
     SPJ
WHERE S.CITY = J.CITY
  AND S.S = SPJ.S
  AND P.P = SPJ.P
  AND J.J = SPJ.J;

# 13 Get project numbers for projects supplied by at least, one supplier not in
#  the same city
SELECT DISTINCT P.P, S.CITY AS S_CITY, J.CITY AS PRO_CITY
FROM S,
     P,
     J,
     SPJ
WHERE S.S = SPJ.S
  AND P.P = SPJ.P
  and J.J = SPJ.J
  and S.CITY != J.CITY;


# 14 Get all pairs of part numbers such some supplier supplies a both the indicated
#   parts
SELECT DISTINCT P1.P AS P_NO_1, P2.P AS P_NO_2, P1.S AS S_1, P2.S AS S_2
FROM SPJ AS P1,
     SPJ AS P2
WHERE P1.S = P2.S
  AND P1.P != P2.P;


-- 15 Get the total number of projects supplied by supplier S1
SELECT COUNT(SPJ.P)
FROM SPJ
WHERE SPJ.S = 'S1';


-- 16 Get the total quantity of part P1 supplied by supplier S1
SELECT SUM(QTY)
FROM SPJ
WHERE SPJ.S = 'S1'
  AND SPJ.P = 'P1';


# 17 For each part being supplied to a project, get the part number the project
#  numbers and the corrosponding total quantity
SELECT J, P, SUM(QTY)
FROM SPJ
GROUP BY J, P;


# 18 Get part numbers for parts supplied to some project in an avarage quantity
#  of more then 350
SELECT P, AVG(QTY) AS Quantity
FROM SPJ
GROUP BY P;

SELECT T.P, T.Quantity
FROM (SELECT P, AVG(QTY) AS Quantity
      FROM SPJ
      GROUP BY P) AS T
WHERE T.Quantity > 350;

-- 19 Get project names for projects supplied by supplier S1.
SELECT J.JNAME, S.S
FROM S,
     J,
     SPJ
WHERE SPJ.S = S.S
  AND SPJ.J = J.J
  AND SPJ.S = 'S1';


-- 20 Get colors of parts supplied by supplier S1.
SELECT DISTINCT P.COLOR, SPJ.S
FROM P,
     SPJ
WHERE SPJ.P = P.P
  AND SPJ.S = 'S1';

-- 21 Get part number of parts supplied to any project in London.
SELECT DISTINCT SPJ.P, J.CITY
FROM SPJ,
     J
WHERE SPJ.J = J.J
  AND J.CITY = 'London';

# 22 Get project number for projetcs using at least one part available
#  for supplier S1
SELECT SPJ.J, SPJ.S
FROM SPJ
WHERE SPJ.S = 'S1';


# 23 Get supplier numbers for suppliers supplying at least one part supplied by
#  at least one supplier who supplies at least one red part
SELECT DISTINCT SPJ.S, P.COLOR
FROM SPJ,
     P
WHERE SPJ.P = P.P
  AND P.COLOR = 'Red';

-- 24 Get supplier numbers for suppliers with a status lower then that of supplier S1
SELECT STATUS AS STSTUS_OF_S1
FROM S
WHERE S.S = 'S1';

SELECT S.S, S.STATUS
FROM S
WHERE S.STATUS < (
    SELECT STATUS
    FROM S
    WHERE S.S = 'S1'
);

# 25 Get project numbers for project whose city is first in the alphabetic list
#  of such cities.
SELECT J.J, J.CITY
FROM J
WHERE J.CITY = (SELECT J.CITY
                FROM J
                ORDER BY CITY
                LIMIT 1);

# 26 Get project numbers for projects supplied with Part P1 in an average quantity greater
#  than the greatest quantity in which any part is supplied to project J1
SELECT SPJ.J, SPJ.P
FROM J,
     SPJ,
     (SELECT P, AVG(QTY) AS Average
      FROM SPJ
      GROUP BY P) AS T1
WHERE SPJ.J = J.J
  AND SPJ.P = 'P1'
  AND SPJ.P = T1.P
  AND T1.Average > (
    SELECT MAX(QTY)
    FROM SPJ
    WHERE SPJ.J = 'J1');


# 27 Gate supplier numbers for suppliers supplying some project with part P1 in a quantity
#  greater than the average shipment quantity of part P1 for that project.
SELECT S, QTY
FROM SPJ AS T1
WHERE T1.P = 'P1'
  AND QTY > (SELECT AVG(QTY) FROM SPJ AS T2 WHERE T2.P = 'P1' AND T1.J = T2.J);

-- 28 Get project numbers for projects not supplied with any red part by any London supplier.
SELECT DISTINCT SPJ.J, P.COLOR, S.CITY
FROM SPJ,
     P,
     S
WHERE P.COLOR != 'Red'
  AND S.CITY != 'London';

-- 29 Give project numbers for projects supplied entirely by supplier S1
SELECT J, S
FROM SPJ AS T1
WHERE NOT EXISTS(SELECT * FROM SPJ WHERE T1.J = SPJ.J AND S != 'S1');

-- 30 Get part numbers for parts supplied to all projects in London
SELECT SPJ.P, SPJ.J, J.CITY
FROM SPJ,
     J
WHERE SPJ.J = J.J
  AND J.CITY = 'London';

-- 31 Get supplier numbers for suppliers who supply the same part to all project
SELECT DISTINCT S.S, P.P, J.J
FROM S,
     P,
     J,
     SPJ
WHERE J.J = SPJ.J
  AND S.S = SPJ.S
  AND P.P = SPJ.P
  AND J.J IN (SELECT J FROM J);

# 32 Get project numbers for project supplied with at least all parts available
#  from supplier S1
SELECT DISTINCT J, S
FROM SPJ
WHERE P IN (SELECT P FROM SPJ WHERE S = 'S1')
  AND S = 'S1';

-- 33 Get all cities in which at least one supplier, part or project is located
SELECT DISTINCT S.CITY AS S_CITY, P.CITY AS P_CITY, J.CITY AS J_CITY
FROM S,
     P,
     J
WHERE S.CITY = P.CITY
  AND P.CITY = J.CITY;

# 34 Get part numbers for parts that are supplied either by a London supplier or
#  in London project
SELECT DISTINCT SPJ.P, S.CITY AS S_CITY, J.CITY AS J_CITY
FROM S,
     J,
     SPJ
WHERE S.S = SPJ.S
  AND J.J = SPJ.J
  AND (S.CITY = 'LONDON' OR J.CITY = 'LONDON');

# 35 Get suppliers numbers/part number pairs such that in indicated supplier
#  does not supply the indicated part.
SELECT DISTINCT S.S, P.P
FROM S,
     P,
     SPJ
WHERE NOT EXISTS(SELECT * FROM SPJ WHERE SPJ.S = S.S AND P.P = SPJ.P);

# 36 Get all pair of supplier numbers, Sx and Sy say, such that Sx and Sy supply exactly
#  the same set parts each.
SELECT T1.S, T2.S
FROM S AS T1,
     S AS T2
WHERE T1.S != T2.S
  AND NOT EXISTS(SELECT P
                 FROM P
                 WHERE EXISTS(SELECT * FROM SPJ WHERE SPJ.P = P.P AND SPJ.S = T1.S)
                   AND NOT EXISTS(SELECT * FROM SPJ WHERE SPJ.P = P.P AND SPJ.S = T2.S))
  AND NOT EXISTS(SELECT P
                 FROM P
                 WHERE EXISTS(SELECT * FROM SPJ WHERE SPJ.P = P.P AND SPJ.S = T2.S)
                   AND NOT EXISTS(SELECT * FROM SPJ WHERE SPJ.P = P.P AND SPJ.S = T1.S));
