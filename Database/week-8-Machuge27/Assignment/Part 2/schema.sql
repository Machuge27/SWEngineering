
-- Entities:

-- Schools: 
    -- Represents schools, including their location and infrastructure score.

-- Students: 
    -- Represents students, including their demographic information and school affiliation.

-- Teachers: 
    -- Represents teachers, including their subjects and school affiliation.

-- Resources: 
    -- Represents teaching resources available at each school.

-- PerformanceRecords: 
    -- Represents student performance data (e.g., test scores).

-- Relationships:

-- A School has multiple Students, Teachers, and Resources.

-- A Student has multiple PerformanceRecords.

-- A Teacher is associated with one School.


CREATE DATABASE SchoolManagementSystem;

USE SchoolManagementSystem;

-- Table: Schools
CREATE TABLE Schools (
    SchoolID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    InfrastructureScore INT CHECK (InfrastructureScore BETWEEN 1 AND 10)
);

-- Table: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age BETWEEN 5 AND 18),
    SchoolID INT,
    FOREIGN KEY (SchoolID) REFERENCES Schools(SchoolID)
);

-- Table: Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    SchoolID INT,
    Subject VARCHAR(50),
    FOREIGN KEY (SchoolID) REFERENCES Schools(SchoolID)
);

-- Table: Resources
CREATE TABLE Resources (
    ResourceID INT PRIMARY KEY,
    SchoolID INT,
    ResourceType VARCHAR(100) NOT NULL,
    Quantity INT CHECK (Quantity >= 0),
    FOREIGN KEY (SchoolID) REFERENCES Schools(SchoolID)
);

-- Table: PerformanceRecords
CREATE TABLE PerformanceRecords (
    RecordID INT PRIMARY KEY,
    StudentID INT,
    Subject VARCHAR(50) NOT NULL,
    Score INT CHECK (Score BETWEEN 0 AND 100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);