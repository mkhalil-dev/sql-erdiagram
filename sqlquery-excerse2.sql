SELECT *
FROM rooms R
WHERE R.capacity >= 100;

SELECT *
FROM courses C
WHERE C.start_time = (SELECT MIN(C.start_time) FROM courses C);

SELECT C.name
FROM departments D, majorsIn MI, students S, enrolled E, courses C
WHERE D.id = MI.depart_id AND S.id = MI.students_id AND S.id = E.students_id AND C.crn = E.courses_crn AND D.name = "BIF";

SELECT *
FROM students S
WHERE S.id NOT IN (SELECT E.students_id FROM enrolled E);

SELECT *
FROM students S, enrolled E, courses C, majorsIn MI, departments D
WHERE C.crn = E.courses_crn AND S.id = E.students_id AND MI.students_id = S.id AND Mi.depart_id = D.id AND C.name ="CSC275" AND D.name = "CS";

SELECT DISTINCT S.name
FROM students S, enrolled E, courses C, majorsIn MI, departments D
WHERE C.crn = E.courses_crn AND S.id = E.students_id AND MI.students_id = S.id AND Mi.depart_id = D.id AND D.name = "CS"