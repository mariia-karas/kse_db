USE AS1;

-- Let's insert into them some random (or not :) data

INSERT INTO Departments VALUES
(1, 'Computer Science', 'Shpakivnya'),
(2, 'Mathematics', 'Feofaniya'),
(3, 'History', 'Obolon'),
(4, 'Physics', 'Dehtyarivska'),
(5, 'Economics', 'TBA');

INSERT INTO Professors VALUES
(1, 'Prof. Mahova', 1, 3500.00),
(2, 'Prof. Shynkarenko', 2, 3200.00),
(3, 'Prof. Shevchenko', 3, 3100.00),
(4, 'Prof. Pompeo', 4, 4000.00),
(5, 'Prof. Stadnyi', 1, 3700.00);

INSERT INTO Courses VALUES
(1, 'Math', 1, 1, 5),
(2, 'Arts', 1, 5, 4),
(3, 'English', 2, 2, 4),
(4, 'PE', 3, 3, 3),
(5, 'Law', 4, 4, 5),
(6, 'Microeconomics', 5, 5, 3);

INSERT INTO Students VALUES
(1, 'Andrii', 2022, 1),
(2, 'Oksana', 2021, 2),
(3, 'Mariia', 2023, 3),
(4, 'Petro', 2021, 1),
(5, 'Dmytro', 2022, 4),
(6, 'Iryna', 2023, 5),
(7, 'Olga', 2020, 2),
(8, 'Maksym', 2021, 1);

INSERT INTO Enrollments VALUES
(1, 1, 1, 90.5),
(2, 1, 2, 85.0),
(3, 2, 3, 88.0),
(4, 3, 4, 92.5),
(5, 4, 1, 79.0),
(6, 5, 5, 94.0),
(7, 6, 6, 87.5),
(8, 8, 2, 83.0),
(9, 2, 1, 91.0),
(10, 7, 3, 76.5);

