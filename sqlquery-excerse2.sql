/* Find all rooms that can seat at least 100 people */
SELECT *
FROM rooms R
WHERE R.capacity >= 100;

/* Find the course or courses with the earliest start time */
SELECT *
FROM courses C
WHERE C.start_time = (SELECT MIN(C.start_time) FROM courses C);

/* Find all courses taken by BIF majors */
SELECT C.name
FROM departments D, majorsIn MI, students S, enrolled E, courses C
WHERE D.id = MI.depart_id AND S.id = MI.students_id AND S.id = E.students_id AND C.crn = E.courses_crn AND D.name = "BIF";

/* Create a list of all students who are not enrolled in a course  */
SELECT *
FROM students S
WHERE S.id NOT IN (SELECT E.students_id FROM enrolled E);

/* Find the number of CS students enrolled in CSC275 */
SELECT *
FROM students S, enrolled E, courses C, majorsIn MI, departments D
WHERE C.crn = E.courses_crn AND S.id = E.students_id AND MI.students_id = S.id AND Mi.depart_id = D.id AND C.name ="CSC275" AND D.name = "CS";

/* Find the number of CS students enrolled in any course */
SELECT DISTINCT S.name
FROM students S, enrolled E, courses C, majorsIn MI, departments D
WHERE C.crn = E.courses_crn AND S.id = E.students_id AND MI.students_id = S.id AND Mi.depart_id = D.id AND D.name = "CS";

/* Find the number of majors that each student has declared */
SELECT S.name, COUNT(S.name) As MajorsCount
FROM students S, majorsIn MI, departments D
WHERE S.id = MI.students_id AND D.id = MI.depart_id
GROUP BY S.name;

/* For each department with more than one majoring student, print the
department’s name and the number of majoring students */
SELECT D.name, COUNT(D.name) AS NumberofStudents 
FROM students S, majorsIn MI, departments D 
WHERE S.id = MI.students_id AND D.id = MI.depart_id GROUP BY D.name;