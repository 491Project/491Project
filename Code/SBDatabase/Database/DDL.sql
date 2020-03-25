CREATE SCHEMA StuddiBuddi;

CREATE TABLE TestTable (
	studentID INT(9) NOT NULL,
	studentName VARCHAR(50) NOT NULL,

	CONSTRAINT TestTable_PK PRIMARY KEY (studentID)
);