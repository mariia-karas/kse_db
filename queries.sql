USE AS1;

-- A CTE is created to calculate the average grade across all enrollments in the university.
WITH average_grades AS (
    SELECT AVG(grade) AS uni_avg
    FROM Enrollments
)

-- This query joins five tables: Students, Enrollments, Courses, Professors, and Departments.
-- It retrieves all students whose individual grade is greater than or equal to the university average.
-- The average value is taken from the CTE using a subquery inside the WHERE clause.
SELECT 
    s.student_name,
    s.enrollment_year,
    d.department_name,
    c.course_name,
    p.professor_name,
    e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Professors p ON c.professor_id = p.professor_id
JOIN Departments d ON s.department_id = d.department_id
WHERE e.grade >= (
	SELECT uni_avg 
    FROM average_grades
    ) 

-- UNION is used to combine results from two SELECT statements without duplicate rows
UNION

-- The next part part groups data by student, department, course, and professor.
-- It calculates the average grade per student using AVG(e.grade).
-- The HAVING clause filters only those students whose enrollment year is greater than or equal to the average enrollment year (calculated via a subquery).
SELECT 
    s.student_name,
    s.enrollment_year,
    d.department_name,
    c.course_name,
    p.professor_name,
    AVG(e.grade) AS avg_grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Professors p ON c.professor_id = p.professor_id
JOIN Departments d ON s.department_id = d.department_id
GROUP BY s.student_name, s.enrollment_year, d.department_name, c.course_name, p.professor_name
HAVING s.enrollment_year > (
	SELECT AVG(enrollment_year) 
    FROM Students
	)

-- The combined results from both queries are sorted in descending order by grade (or average grade).
-- LIMIT 10 returns only the top 10 records with the highest grades.
ORDER BY grade DESC
LIMIT 10;
