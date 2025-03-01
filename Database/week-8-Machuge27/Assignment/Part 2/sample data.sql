-- Insert sample data into Schools
INSERT INTO Schools (SchoolID, Name, Location, InfrastructureScore)
VALUES 
(1, 'Rural School A', 'Rural Area 1', 4),
(2, 'Urban School B', 'Urban Area 1', 8),
(3, 'Urban School C', 'Urban Area 2', 7),
(4, 'Rural School D', 'Rural Area 2', 5);


-- Insert sample data into Students
INSERT INTO Students (StudentID, Name, Age, SchoolID)
VALUES 
(1, 'Alice Johnson', 12, 1),
(2, 'Bob Smith', 13, 1),
(3, 'Charlie Brown', 14, 2),
(4, 'Daisy White', 15, 2),
(5, 'Eve Green', 16, 3),
(6, 'Frank Black', 17, 3),
(7, 'Grace Grey', 18, 4),
(8, 'Henry Blue', 17, 4);

-- Insert sample data into Teachers
INSERT INTO Teachers (TeacherID, Name, SchoolID, Subject)
VALUES 
(1, 'Ms. Davis', 1, 'Math'),
(2, 'Mr. Wilson', 2, 'Science'),
(3, 'Ms. Lee', 3, 'English'),
(4, 'Mr. Brown', 4, 'History'),
(5, 'Ms. White', 1, 'Art');

-- Insert sample data into Resources
INSERT INTO Resources (ResourceID, SchoolID, ResourceType, Quantity)
VALUES 
(1, 1, 'Textbooks', 50),
(2, 1, 'Computers', 5),
(3, 2, 'Textbooks', 100),
(4, 2, 'Computers', 20),
(5, 3, 'Textbooks', 75),
(6, 3, 'Computers', 10),
(7, 4, 'Textbooks', 25),
(8, 4, 'Computers', 2);

-- Insert sample data into PerformanceRecords
INSERT INTO PerformanceRecords (RecordID, StudentID, Subject, Score)
VALUES 
(1, 1, 'Math', 65),
(2, 2, 'Math', 70),
(3, 3, 'Science', 85),
(4, 4, 'Science', 90),
(5, 5, 'English', 75),
(6, 6, 'English', 80),
(7, 7, 'History', 60),
(8, 8, 'History', 55);

SHOW TABLES;

SELECT * FROM Schools;