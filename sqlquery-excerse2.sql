SELECT *
FROM rooms R
WHERE R.capacity >= 100;

SELECT *
FROM courses C
WHERE C.start_time = (SELECT MIN(C.start_time) FROM courses C);

SELECT C.name
FROM departments D, majorsIn MI, students S, enrolled E, courses C
WHERE D.id = MI.depart_id AND S.id = MI.students_id AND S.id = E.students_id AND C.crn = E.courses_crn AND D.name = "BIF"; 