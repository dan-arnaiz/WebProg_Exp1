+-----------------------+        +-----------------------+
|        Person         |        |      Scholarship      |
|-----------------------|        |-----------------------|
| - PersonId: int (PK)  |<------>| - ScholarshipId: int  |
| - FirstName: varchar  |        | - Name: varchar       |
| - LastName: varchar   |        | - Description: Text   |
| - MiddleName: varchar |        | - AvailableSlots: int |
| - Suffix: char        |        | - Status: bit         |
| - DoB: DateTime       |        +-----------------------+
| - Email: varchar      |        
+-----------------------+        
          ^                             
          |                             
          |                             
 +------------------+   +------------------+   +------------------+   +------------------+
 |     Student      |   |     Parent       |   |    Employee      |   |       User       |
 |------------------|   |------------------|   |------------------|   |------------------|
 | - StudentId: int |   | - ParentId: int  |   | - EmployeeId: int |   | - UserId: int    |
 | - PersonId: int  |<--| - PersonId: int  |<--| - PersonId: int   |<--| - PersonId: int  |
 | - Type: char     |   | - Occupation:    |   | - JobTitleId: int |   | - RoleId: int    |
 | - SchoolYear:    |   |   varchar        |   | - UserId: int     |   | - Username:      |
 | - PrevSchoolId:  |   +------------------+   +------------------+   |   varchar        |
 | - ScholarshipSta-|                                                 | - Password:       |
 | tusId: int       |                                                 |   varchar        |
 | - UserId: int    |                                                 | - Salt: varchar  |
 +------------------+                                                 +------------------+
         |                                                                 ^
         |                                                                 |
         v                                                                 v
 +------------------+                                              +------------------+
 |  Scholarship     |<----------------------------------------------|      Role        |
 |   Status         |                                               |------------------|
 |------------------|                                               | - RoleId: int    |
 | - ScholarshipSta-|                                               | - Title: varchar |
 | tusId: int       |                                               | - Description:   |
 | - Name: char     |                                               |   varchar        |
 | - Description:   |                                               +------------------+
 |   Text           |                                                     
 +------------------+                                                     
                                                                         
