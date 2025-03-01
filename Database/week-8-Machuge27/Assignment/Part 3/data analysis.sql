-- Retrieve all students from rural schools with low performance (score < 70):
USE schoolmanagementsystem;

-- Average student performance by school location:
SELECT Schools.Location, AVG(PerformanceRecords.Score) AS AvgScore
FROM PerformanceRecords
JOIN Students ON PerformanceRecords.StudentID = Students.StudentID
JOIN Schools ON Students.SchoolID = Schools.SchoolID
GROUP BY Schools.Location;

-- Count of resources by school:
SELECT Schools.Name, COUNT(Resources.ResourceID) AS ResourceCount
FROM Schools
LEFT JOIN Resources ON Schools.SchoolID = Resources.SchoolID
GROUP BY Schools.Name;

-- Students from urban schools with high performance (score >= 70):
SELECT Students.Name, PerformanceRecords.Score, Schools.Location
FROM Students   
JOIN PerformanceRecords ON Students.StudentID = PerformanceRecords.StudentID
JOIN Schools ON Students.SchoolID = Schools.SchoolID
WHERE Schools.Location LIKE '%Urban%' AND PerformanceRecords.Score >= 70;

-- Students from rural schools with low performance (score < 70):
SELECT Students.Name, PerformanceRecords.Score, Schools.Location
FROM Students
JOIN PerformanceRecords ON Students.StudentID = PerformanceRecords.StudentID
JOIN Schools ON Students.SchoolID = Schools.SchoolID
WHERE Schools.Location LIKE '%Rural%' AND PerformanceRecords.Score < 70;

-- Retrieve all students from rural schools with low performance (score < 70):
SELECT Students.Name, PerformanceRecords.Score, Schools.Location
FROM Students
JOIN PerformanceRecords ON Students.StudentID = PerformanceRecords.StudentID
JOIN Schools ON Students.SchoolID = Schools.SchoolID
WHERE Schools.Location LIKE '%Rural%' AND PerformanceRecords.Score < 70;

-- Retrieve all students from urban schools with high performance (score >= 70):
SELECT Students.Name, PerformanceRecords.Score, Schools.Location
FROM Students
JOIN PerformanceRecords ON Students.StudentID = PerformanceRecords.StudentID
JOIN Schools ON Students.SchoolID = Schools.SchoolID
WHERE Schools.Location LIKE '%Urban%' AND PerformanceRecords.Score >= 70;

-- Summary 

CREATE VIEW DataSummary AS
SELECT 
    S.SchoolID,
    S.Name AS SchoolName,
    S.Location,
    S.InfrastructureScore,
    COUNT(R.ResourceID) AS TotalResources,
    SUM(R.Quantity) AS TotalResourceQuantity,
    AVG(PR.Score) AS AvgStudentPerformance
FROM 
    Schools S
LEFT JOIN 
    Resources R ON S.SchoolID = R.SchoolID
LEFT JOIN 
    Students St ON S.SchoolID = St.SchoolID
LEFT JOIN 
    PerformanceRecords PR ON St.StudentID = PR.StudentID
GROUP BY 
    S.SchoolID, S.Name, S.Location, S.InfrastructureScore;


SELECT * FROM DataSummary;