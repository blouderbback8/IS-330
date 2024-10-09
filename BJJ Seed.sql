USE bjj_lineage;

-- Insert data into Users table
INSERT INTO Users (name, password) VALUES
('admin', 'adminpass'),
('user', 'userpass');

-- Insert data into People table (BJJ fighters and instructors)
INSERT INTO People (name, age, belt_rank, gender) VALUES
('Brian Ortega', 32, 'Black Belt', 'Male'),
('Kron Gracie', 35, 'Black Belt', 'Male'),
('Mackenzie Dern', 30, 'Black Belt', 'Female'),
('Rickson Gracie', 65, 'Red Belt', 'Male'),
('Helio Gracie', 95, 'Red Belt', 'Male'),
('Gordon Ryan', 28, 'Black Belt', 'Male');

-- Insert data into Schools table (BJJ schools)
INSERT INTO Schools (name, location) VALUES
('Gracie Academy', 'Rio de Janeiro, Brazil'),
('10th Planet Jiu-Jitsu', 'Los Angeles, USA'),
('Alliance Jiu-Jitsu', 'Sao Paulo, Brazil');

-- Insert data into MembershipAffiliation table (Links People to Schools)
INSERT INTO MembershipAffiliation (person_id, school_id, join_date) VALUES
(1, 1, '2010-01-01'), -- Brian Ortega joins Gracie Academy
(2, 1, '2005-01-01'), -- Kron Gracie joins Gracie Academy
(3, 2, '2012-06-15'), -- Mackenzie Dern joins 10th Planet
(4, 1, '1980-01-01'), -- Rickson Gracie joins Gracie Academy
(6, 3, '2018-03-10'); -- Gordon Ryan joins Alliance Jiu-Jitsu

-- Insert data into Instructions table (Links Teachers to Students)
INSERT INTO Instructions (teacher_id, student_id, date) VALUES
(4, 1, '2010-01-01'), -- Rickson Gracie teaches Brian Ortega
(4, 2, '2005-01-01'), -- Rickson Gracie teaches Kron Gracie
(5, 4, '1980-01-01'); -- Helio Gracie teaches Rickson Gracie

-- Insert data into Tournaments table (BJJ tournaments)
INSERT INTO Tournaments (name, location, date) VALUES
('IBJJF World Championship', 'Los Angeles, USA', '2023-06-15'),
('UFC 264', 'Las Vegas, USA', '2021-07-10'),
('ADCC 2022', 'Abu Dhabi, UAE', '2022-09-18');

-- Insert data into Rounds table (Tracks Rounds Between People in Tournaments)
INSERT INTO Rounds (person1_id, person2_id, tournament_id, round_date) VALUES
(1, 2, 1, '2023-06-15'), -- Brian Ortega vs. Kron Gracie in IBJJF World Championship
(6, 3, 2, '2021-07-10'); -- Gordon Ryan vs. Mackenzie Dern in UFC 264

-- a. Selecting data from one table (Selecting all people)
SELECT * FROM People;

-- b. Selecting data from two or more tables using a JOIN condition (Joining People and Schools)
SELECT People.name AS fighter, Schools.name AS school_name, MembershipAffiliation.join_date
FROM People
JOIN MembershipAffiliation ON People.person_id = MembershipAffiliation.person_id
JOIN Schools ON MembershipAffiliation.school_id = Schools.school_id;

-- c. Inserting a row into a table using INSERT (Add a new fighter)
INSERT INTO People (name, age, belt_rank, gender) 
VALUES ('Andre Galvao', 41, 'Black Belt', 'Male');

-- d. Updating a row using UPDATE (Update Kron Gracie's belt rank)
UPDATE People
SET belt_rank = 'Coral Belt'
WHERE name = 'Kron Gracie';

-- e. Deleting a row using DELETE (Delete Andre Galvao)
DELETE FROM People WHERE name = 'Andre Galvao';

-- Display all data from People after the updates
SELECT * FROM People;
