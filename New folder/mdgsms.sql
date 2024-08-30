CREATE TABLE JOBTITLE (
    JobTitleId INT PRIMARY KEY,
    EmployeeId INT,
    Title VARCHAR(100),
    Description TEXT
);

CREATE TABLE PERSON (
    PersonId INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    MiddleName VARCHAR(50),
    Suffix CHAR(5),
    DoB DATETIME,
    Email VARCHAR(100)
);

CREATE TABLE ROLE (
    RoleId INT PRIMARY KEY,
    Title VARCHAR(50),
    Description VARCHAR(300)
);

CREATE TABLE USER_ACCOUNT (
    UserId INT PRIMARY KEY,
    PersonId INT,
    RoleId INT,
    Username VARCHAR(100),
    Password VARCHAR(100),
    Salt VARCHAR(10),
    FOREIGN KEY (PersonId) REFERENCES PERSON(PersonId),
    FOREIGN KEY (RoleId) REFERENCES ROLE(RoleId)
);

CREATE TABLE EMPLOYEE (
    EmployeeId INT PRIMARY KEY,
    PersonId INT,
    JobTitleId INT,
    UserId INT,
    FOREIGN KEY (PersonId) REFERENCES PERSON(PersonId),
    FOREIGN KEY (JobTitleId) REFERENCES JOBTITLE(JobTitleId),
    FOREIGN KEY (UserId) REFERENCES USER_ACCOUNT(UserId)
);

CREATE TABLE ADDRESS (
    AddressId INT PRIMARY KEY,
    PersonId INT,
    HouseNum INT,
    Street VARCHAR(50),
    Barangay VARCHAR(100),
    City VARCHAR(100),
    Province VARCHAR(100),
    Zipcode VARCHAR(10),
    FOREIGN KEY (PersonId) REFERENCES PERSON(PersonId)
);

CREATE TABLE ADDRESSPERSON (
    PersonId INT,
    AddressId INT,
    Type VARCHAR(20),
    FOREIGN KEY (PersonId) REFERENCES PERSON(PersonId),
    FOREIGN KEY (AddressId) REFERENCES ADDRESS(AddressId)
);

CREATE TABLE CONTACTNUM (
    ContactNumId INT PRIMARY KEY,
    PersonId INT,
    Type VARCHAR(20),
    Title CHAR(15),
    Numbers VARCHAR(11),
    FOREIGN KEY (PersonId) REFERENCES PERSON(PersonId)
);

CREATE TABLE PARENT (
    ParentId INT PRIMARY KEY,
    PersonId INT,
    Occupation VARCHAR(100),
    FOREIGN KEY (PersonId) REFERENCES PERSON(PersonId)
);

CREATE TABLE SCHOLARSHIPSTATUS (
    ScholarshipStatusId INT PRIMARY KEY,
    Name CHAR(8),
    Description TEXT
);

CREATE TABLE PREVSCHOOL (
    PrevSchoolId INT PRIMARY KEY,
    AddressId INT,
    ContactNumId INT,
    Name VARCHAR(150),
    Email VARCHAR(100),
    Address VARCHAR(300),
    ContactNum VARCHAR(11),
    FOREIGN KEY (AddressId) REFERENCES ADDRESS(AddressId),
    FOREIGN KEY (ContactNumId) REFERENCES CONTACTNUM(ContactNumId)
);

CREATE TABLE STUDENT (
    StudentId INT PRIMARY KEY,
    PersonId INT,
    SchoolYear CHAR(10),
    PrevSchoolId INT,
    ScholarshipStatusId INT,
    UserId INT,
    FOREIGN KEY (PersonId) REFERENCES PERSON(PersonId),
    FOREIGN KEY (PrevSchoolId) REFERENCES PREVSCHOOL(PrevSchoolId),
    FOREIGN KEY (ScholarshipStatusId) REFERENCES SCHOLARSHIPSTATUS(ScholarshipStatusId),
    FOREIGN KEY (UserId) REFERENCES USER_ACCOUNT(UserId)
);

CREATE TABLE RELATION (
    ParentId INT,
    StudentId INT,
    Name CHAR(10),
    FOREIGN KEY (ParentId) REFERENCES PARENT(ParentId),
    FOREIGN KEY (StudentId) REFERENCES STUDENT(StudentId)
);

CREATE TABLE CHATROOM (
    ChatRoomId INT PRIMARY KEY,
    Name CHAR(8)
);

CREATE TABLE CHATUSER (
    ChatRoomId INT,
    UserId INT,
    DateOpened DATETIME,
    FOREIGN KEY (ChatRoomId) REFERENCES CHATROOM(ChatRoomId),
    FOREIGN KEY (UserId) REFERENCES USER_ACCOUNT(UserId)
);

CREATE TABLE MESSAGE (
    MessageId INT PRIMARY KEY,
    ChatRoomId INT,
    MessageText TEXT,
    Sender VARCHAR(300),
    DateSent DATETIME,
    FOREIGN KEY (ChatRoomId) REFERENCES CHATROOM(ChatRoomId)
);

CREATE TABLE SCHOLARSHIP (
    ScholarshipId INT PRIMARY KEY,
    Name VARCHAR(150),
    Description TEXT,
    AvailableSlots TINYINT(3),
    Status BIT
);

CREATE TABLE ACADEMICYEAR (
    AcademicYearId INT PRIMARY KEY,
    Year INT
);

CREATE TABLE SEMESTER (
    SemesterId INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE TERM (
    TermId INT PRIMARY KEY,
    AcademicYearId INT,
    SemesterId INT,
    FOREIGN KEY (AcademicYearId) REFERENCES ACADEMICYEAR(AcademicYearId),
    FOREIGN KEY (SemesterId) REFERENCES SEMESTER(SemesterId)
);

CREATE TABLE APPLICATION (
    ApplicationId INT PRIMARY KEY,
    StudentId INT,
    EmployeeId INT,
    ScholarshipId INT,
    DateFiled DATETIME,
    DateTerminated DATETIME,
    TermId INT,
    Current BIT,
    FOREIGN KEY (StudentId) REFERENCES STUDENT(StudentId),
    FOREIGN KEY (EmployeeId) REFERENCES EMPLOYEE(EmployeeId),
    FOREIGN KEY (ScholarshipId) REFERENCES SCHOLARSHIP(ScholarshipId),
    FOREIGN KEY (TermId) REFERENCES TERM(TermId)
);

CREATE TABLE FILEREQ (
    FileReqId INT PRIMARY KEY,
    ApplicationId INT,
    Name VARCHAR(150),
    Description TEXT,
    Submitted BIT,
    FOREIGN KEY (ApplicationId) REFERENCES APPLICATION(ApplicationId)
);

CREATE TABLE ANNOUNCEMENT (
    AnnouncementId INT PRIMARY KEY,
    UserId INT,
    Title VARCHAR(300),
    Text TEXT,
    DatePosted DATETIME,
    FOREIGN KEY (UserId) REFERENCES USER_ACCOUNT(UserId)
);