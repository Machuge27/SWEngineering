USE schoolmanagementsystem;

SELECT Students.Name, PerformanceRecords.Score, Schools.Location
FROM Students
JOIN PerformanceRecords ON Students.StudentID = PerformanceRecords.StudentID
JOIN Schools ON Students.SchoolID = Schools.SchoolID
WHERE Schools.Location LIKE '%Rural%' AND PerformanceRecords.Score < 70;

SELECT Students.Name, PerformanceRecords.Score, Schools.Location
FROM Students
JOIN PerformanceRecords ON Students.StudentID = PerformanceRecords.StudentID
JOIN Schools ON Students.SchoolID = Schools.SchoolID
WHERE Schools.Location LIKE '%Urban%' AND PerformanceRecords.Score >= 70;

SELECT Schools.Name, COUNT(Resources.ResourceID) AS ResourceCount
FROM Schools
LEFT JOIN Resources ON Schools.SchoolID = Resources.SchoolID
GROUP BY Schools.Name;

SELECT Schools.Location, AVG(PerformanceRecords.Score) AS AvgScore
FROM PerformanceRecords
JOIN Students ON PerformanceRecords.StudentID = Students.StudentID
JOIN Schools ON Students.SchoolID = Schools.SchoolID
GROUP BY Schools.Location;
