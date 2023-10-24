CREATE TABLE ActivityType (
    ActivityTypeId SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Activity (
    ActivityId SERIAL PRIMARY KEY,
    ActivityTypeId INT REFERENCES ActivityType(ActivityTypeId),
    Name VARCHAR(255) NOT NULL,
    ParentId INT REFERENCES Activity(ActivityId),
    AreaId INT
);

CREATE TABLE Program (
    ActivityId INT PRIMARY KEY REFERENCES Activity(ActivityId),
    ProgramDetails VARCHAR(255) NOT NULL
);

CREATE TABLE SubProgram (
    ActivityId INT PRIMARY KEY REFERENCES Activity(ActivityId),
    SubProgramDetails VARCHAR(255) NOT NULL
);

CREATE TABLE Project (
    ActivityId INT PRIMARY KEY REFERENCES Activity(ActivityId),
    ProjectDetails VARCHAR(255) NOT NULL
);

CREATE TABLE Contract (
    ActivityId INT PRIMARY KEY REFERENCES Activity(ActivityId),
    ContractDetails VARCHAR(255) NOT NULL,
    AreaId INT
);

CREATE TABLE Point (
    ActivityId INT PRIMARY KEY REFERENCES Activity(ActivityId),
    PointDetails VARCHAR(255) NOT NULL
);
