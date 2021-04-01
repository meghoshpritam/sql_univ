-- 1 Get full details of all parts in London.
SELECT * FROM P
WHERE CITY LIKE 'London';


-- 2 Get S# for suppliers who supply the part P1.
SELECT S from SP
WHERE P = 'P1';


-- 3 Get all part-color/part-city combinations.
SELECT P, COLOR, CITY FROM P;


-- 4 Get all S#/P# doubles such that all are co-located.
SELECT DISTINCT S.S, P.P, S.CITY as s_CIty, P.CITY as p_city FROM P, S
WHERE S.CITY = P.CITY;


-- 5 Get all S#, P# doubles such that they are not all co-located.
SELECT DISTINCT S.S, P.P, S.CITY as s_CIty, P.CITY as p_city FROM P, S
WHERE S.CITY != P.CITY;


-- 6 Get P# for parts supplied by a supplier in London.
SELECT DISTINCT SP.P, S.CITY, S.S FROM P, S, SP
WHERE S.S = SP.S AND P.P = SP.P AND S.CITY LIKE 'London';
-- or
SELECT DISTINCT SP.P FROM SP 
WHERE SP.S IN (SELECT S FROM S
WHERE CITY = 'London');


-- 7 Get all pairs of cities such that a supplier in the first city suppies a 
-- part in the second city.
SELECT DISTINCT SP.S, SP.P, S.CITY as s_CIty, P.CITY as p_city FROM P, S, SP
WHERE S.S = SP.S AND P.P = SP.P and S.CITY != P.CITY;

-- clear
DROP TABLE  S, P, SP;
