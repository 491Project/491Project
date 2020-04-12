CREATE TABLE Buddi (
	bID INTEGER NOT NULL AUTO_INCREMENT,
	bFirstName VARCHAR(50) NOT NULL,
    bLastName VARCHAR(50) NOT NULL,
    bEmail VARCHAR(50) NOT NULL,
    bPassword VARCHAR(100) NOT NULL,
    bDOB DATE NOT NULL,

	CONSTRAINT Buddi_PK PRIMARY KEY (bID, bEmail)
);

-- RECURSIVE RELATIONSHIP BETWEEN TWO BUDDIS
CREATE TABLE Friend (
	bID INTEGER NOT NULL,
	fID INTEGER NOT NULL,
    
    CONSTRAINT Friend_PK PRIMARY KEY (bID, fID),
    
    -- BOTH foreign keys reference same thing, bID
    CONSTRAINT Friend_Buddi_FK
	FOREIGN KEY(bID) REFERENCES Buddi(bID),
    
    CONSTRAINT Friend_Friend_FK
	FOREIGN KEY(fID) REFERENCES Buddi(bID)
);

INSERT INTO Friend
	VALUES (1, 2);

CREATE TABLE StudiSession (
    sessionID INTEGER NOT NULL AUTO_INCREMENT,
    sessionType BOOLEAN, -- WHERE TRUE IS PUBLIC AND FALSE IS PRIVATE
    sessionTopic VARCHAR(50) NOT NULL,
    sessionLocation VARCHAR(100) NOT NULL,
    
	CONSTRAINT StudiSession_PK PRIMARY KEY (sessionID)
);

 INSERT INTO StudiSession (sessionType, sessionTopic, sessionLocation)
 	VALUES (FALSE, 'Generics', 'BESST ROOM');

-- JUNCTION TABLE between buddi and session
-- needed for many-to-many relationship
CREATE TABLE BuddiSession (
	bID INTEGER NOT NULL,
    sessionID INTEGER NOT NULL,
    isHost BOOLEAN NOT NULL,
    
	CONSTRAINT BuddiSession_PK PRIMARY KEY (bID, sessionID),

    -- Foreign key from buddi to buddi session
    CONSTRAINT Buddi_BuddiSession_FK
	FOREIGN KEY(bID) REFERENCES Buddi(bID),
    
	-- Foreign key from session to buddi session
    CONSTRAINT StudiSession_BuddiSession_FK
	FOREIGN KEY(sessionID) REFERENCES StudiSession(sessionID)
);

 INSERT INTO BuddiSession (bID, sessionID, isHOST)
 	VALUES (2, 1, FALSE);

CREATE TABLE Post (
	bID INTEGER NOT NULL,
    pID INTEGER NOT NULL AUTO_INCREMENT,
    postClass VARCHAR(50) NOT NULL,
    postDescription TEXT NOT NULL,
    
    CONSTRAINT Post_PK PRIMARY KEY (pID),

	CONSTRAINT Buddi_Post_FK
	FOREIGN KEY(bID) REFERENCES Buddi(bID)
);

-- Query, studi session: Show who's the host of a studdi session
SELECT bFirstName FROM BuddiSession NATURAL JOIN Buddi WHERE BuddiSession.isHost = true;

-- Query, studi session: Show all the non-host students attending a studdi session
SELECT bFirstName FROM BuddiSession NATURAL JOIN Buddi WHERE BuddiSession.isHost = false;

-- Query, studi session: Show all students associated with a studdi session
 SELECT bID, bFirstName
 FROM StudiSession, BuddiSession NATURAL JOIN Buddi
 WHERE StudiSession.sessionID = 1;
 
 -- Query, friends: show friends list - do two select queries and append results
select bFirstName from Buddi where bID IN
(select fID from friend where bID = 2)
UNION
select bFirstName from Buddi where bID IN
(select bID from friend where fID = 2);

-- View tables
SELECT * FROM Buddi;
SELECT * FROM Post;
SELECT * FROM StudiSession;
SELECT * FROM BuddiSession;
SELECT * FROM Friend;
