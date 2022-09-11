SELECT *
FROM rooms R
WHERE R.capacity >= 100;

SELECT *
FROM courses C
WHERE C.start_time = (SELECT MIN(C.start_time) FROM courses C)