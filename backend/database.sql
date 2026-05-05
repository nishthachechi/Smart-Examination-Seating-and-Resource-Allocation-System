CREATE DATABASE examination;
USE examination;

CREATE TABLE cse_students_a
(admission_id VARCHAR(10), name VARCHAR(20), branch VARCHAR(20), section VARCHAR(20));
 
INSERT INTO cse_students_a VALUES
('CSE001','Rahul','CSE','A'),
('CSE002','Amit','CSE','A'),
('CSE003','Neha','CSE','A'),
('CSE004','Priya','CSE','A'),
('CSE005','Karan','CSE','A'),
('CSE006','Sneha','CSE','A'),
('CSE007','Arjun','CSE','A'),
('CSE008','Riya','CSE','A'),
('CSE009','Vikram','CSE','A'),
('CSE010','Pooja','CSE','A'),
('CSE011','Rohit','CSE','A'),
('CSE012','Anjali','CSE','A'),
('CSE013','Manoj','CSE','A'),
('CSE014','Divya','CSE','A'),
('CSE015','Suresh','CSE','A'),
('CSE016','Kavya','CSE','A'),
('CSE017','Nikhil','CSE','A'),
('CSE018','Meena','CSE','A'),
('CSE019','Harish','CSE','A'),
('CSE020','Swati','CSE','A'),
('CSE021','Ajay','CSE','A'),
('CSE022','Deepa','CSE','A'),
('CSE023','Varun','CSE','A'),
('CSE024','Isha','CSE','A'),
('CSE025','Tarun','CSE','A'),
('CSE026','Nisha','CSE','A'),
('CSE027','Yash','CSE','A'),
('CSE028','Komal','CSE','A'),
('CSE029','Abhishek','CSE','A'),
('CSE030','Shreya','CSE','A'),
('CSE031','Gaurav','CSE','A'),
('CSE032','Aarti','CSE','A'),
('CSE033','Ramesh','CSE','A'),
('CSE034','Bhavna','CSE','A'),
('CSE035','Sanjay','CSE','A'),
('CSE036','Payal','CSE','A'),
('CSE037','Kishore','CSE','A'),
('CSE038','Lata','CSE','A'),
('CSE039','Dev','CSE','A'),
('CSE040','Simran','CSE','A');

SELECT * FROM cse_students_a;

CREATE TABLE me_students_a
(admission_id VARCHAR(10), name VARCHAR(20), branch VARCHAR(20), section VARCHAR(20));

INSERT INTO me_students_a VALUES
('ME001','Aditya','ME','A'),
('ME002','Sanjana','ME','A'),
('ME003','Rakesh','ME','A'),
('ME004','Ananya','ME','A'),
('ME005','Vishal','ME','A'),
('ME006','Kritika','ME','A'),
('ME007','Sameer','ME','A'),
('ME008','Tanvi','ME','A'),
('ME009','Rajesh','ME','A'),
('ME010','Pallavi','ME','A'),
('ME011','Akhil','ME','A'),
('ME012','Nandini','ME','A'),
('ME013','Prakash','ME','A'),
('ME014','Shruti','ME','A'),
('ME015','Mahesh','ME','A'),
('ME016','Bhavya','ME','A'),
('ME017','Kunal','ME','A'),
('ME018','Rekha','ME','A'),
('ME019','Dinesh','ME','A'),
('ME020','Alka','ME','A'),
('ME021','Siddharth','ME','A'),
('ME022','Poonam','ME','A'),
('ME023','Rahulraj','ME','A'),
('ME024','Snehal','ME','A'),
('ME025','Manish','ME','A'),
('ME026','Charu','ME','A'),
('ME027','Harsh','ME','A'),
('ME028','Neelam','ME','A'),
('ME029','Rajat','ME','A'),
('ME030','Madhuri','ME','A'),
('ME031','Lokesh','ME','A'),
('ME032','Vaishali','ME','A'),
('ME033','Anil','ME','A'),
('ME034','Sakshi','ME','A'),
('ME035','Vinod','ME','A'),
('ME036','Ritu','ME','A'),
('ME037','Arvind','ME','A'),
('ME038','Geeta','ME','A'),
('ME039','Karthik','ME','A'),
('ME040','Ishita','ME','A');

SELECT * FROM me_students_a;

CREATE TABLE ece_students_a
(admission_id VARCHAR(10), name VARCHAR(20), branch VARCHAR(20), section VARCHAR(20));

INSERT INTO ece_students_a VALUES
('ECE001','Arjunesh','ECE','A'),
('ECE002','Mehul','ECE','A'),
('ECE003','Pavitra','ECE','A'),
('ECE004','Ritika','ECE','A'),
('ECE005','Saurabh','ECE','A'),
('ECE006','Ishani','ECE','A'),
('ECE007','Naveen','ECE','A'),
('ECE008','Tanya','ECE','A'),
('ECE009','Bhavesh','ECE','A'),
('ECE010','Kiran','ECE','A'),
('ECE011','Suraj','ECE','A'),
('ECE012','Lavanya','ECE','A'),
('ECE013','Tejas','ECE','A'),
('ECE014','Monika','ECE','A'),
('ECE015','Raghav','ECE','A'),
('ECE016','Priti','ECE','A'),
('ECE017','Aniket','ECE','A'),
('ECE018','Sunita','ECE','A'),
('ECE019','Hemant','ECE','A'),
('ECE020','Jyoti','ECE','A'),
('ECE021','Nitin','ECE','A'),
('ECE022','Seema','ECE','A'),
('ECE023','Uday','ECE','A'),
('ECE024','Bharti','ECE','A'),
('ECE025','Keshav','ECE','A'),
('ECE026','Shilpa','ECE','A'),
('ECE027','Rohanish','ECE','A'),
('ECE028','Ankita','ECE','A'),
('ECE029','Chirag','ECE','A'),
('ECE030','Deepika','ECE','A'),
('ECE031','Girish','ECE','A'),
('ECE032','Preeti','ECE','A'),
('ECE033','Mohan','ECE','A'),
('ECE034','Sonal','ECE','A'),
('ECE035','Vivek','ECE','A'),
('ECE036','Rachna','ECE','A'),
('ECE037','Pranav','ECE','A'),
('ECE038','Shobha','ECE','A'),
('ECE039','Darshan','ECE','A'),
('ECE040','Neelima','ECE','A');

SELECT * FROM ece_students_a;

CREATE TABLE cse_ds_students_a
(admission_id VARCHAR(10), name VARCHAR(20), branch VARCHAR(20), section VARCHAR(20));

INSERT INTO cse_ds_students_a VALUES
('DS001','Aarav','CSE-DS','A'),
('DS002','Vihaan','CSE-DS','A'),
('DS003','Aanya','CSE-DS','A'),
('DS004','Diya','CSE-DS','A'),
('DS005','Kabir','CSE-DS','A'),
('DS006','Myra','CSE-DS','A'),
('DS007','Ishaan','CSE-DS','A'),
('DS008','Saanvi','CSE-DS','A'),
('DS009','Reyansh','CSE-DS','A'),
('DS010','Kiara','CSE-DS','A'),
('DS011','Ayaan','CSE-DS','A'),
('DS012','Anika','CSE-DS','A'),
('DS013','Vivaan','CSE-DS','A'),
('DS014','Sara','CSE-DS','A'),
('DS015','Advik','CSE-DS','A'),
('DS016','Navya','CSE-DS','A'),
('DS017','Rudra','CSE-DS','A'),
('DS018','Ira','CSE-DS','A'),
('DS019','Shaurya','CSE-DS','A'),
('DS020','Avni','CSE-DS','A'),
('DS021','Atharv','CSE-DS','A'),
('DS022','Riyaanshi','CSE-DS','A'),
('DS023','Devansh','CSE-DS','A'),
('DS024','Pari','CSE-DS','A'),
('DS025','Yuvan','CSE-DS','A'),
('DS026','Ishita','CSE-DS','A'),
('DS027','Aryan','CSE-DS','A'),
('DS028','Meher','CSE-DS','A'),
('DS029','Krish','CSE-DS','A'),
('DS030','Anvi','CSE-DS','A'),
('DS031','Laksh','CSE-DS','A'),
('DS032','Prisha','CSE-DS','A'),
('DS033','Arnav','CSE-DS','A'),
('DS034','Aadhya','CSE-DS','A'),
('DS035','Kiaan','CSE-DS','A'),
('DS036','Samaira','CSE-DS','A'),
('DS037','Dhruv','CSE-DS','A'),
('DS038','Tara','CSE-DS','A'),
('DS039','Arush','CSE-DS','A'),
('DS040','Vanya','CSE-DS','A');

SELECT * FROM cse_ds_students_a;

CREATE TABLE cse_cy_students_a
(admission_id VARCHAR(10), name VARCHAR(20), branch VARCHAR(20), section VARCHAR(20));

INSERT INTO cse_cy_students_a VALUES
('CY001','Abeer','CSE_CY','A'),
('CY002','Darsh','CSE_CY','A'),
('CY003','Esha','CSE_CY','A'),
('CY004','Falguni','CSE_CY','A'),
('CY005','Gautam','CSE_CY','A'),
('CY006','Himani','CSE_CY','A'),
('CY007','Ilesh','CSE_CY','A'),
('CY008','Jhanvi','CSE_CY','A'),
('CY009','Kairav','CSE_CY','A'),
('CY010','Lavina','CSE_CY','A'),
('CY011','Mitesh','CSE_CY','A'),
('CY012','Niharika','CSE_CY','A'),
('CY013','Omkar','CSE_CY','A'),
('CY014','Pavani','CSE_CY','A'),
('CY015','Qasim','CSE_CY','A'),
('CY016','Roshni','CSE_CY','A'),
('CY017','Samar','CSE_CY','A'),
('CY018','Tanisha','CSE_CY','A'),
('CY019','Utkarsh','CSE_CY','A'),
('CY020','Vaidehi','CSE_CY','A'),
('CY021','Wasim','CSE_CY','A'),
('CY022','Xena','CSE_CY','A'),
('CY023','Yogesh','CSE_CY','A'),
('CY024','Zoya','CSE_CY','A'),
('CY025','Amitabh','CSE_CY','A'),
('CY026','Bindu','CSE_CY','A'),
('CY027','Chandan','CSE_CY','A'),
('CY028','Damini','CSE_CY','A'),
('CY029','Eknath','CSE_CY','A'),
('CY030','Farah','CSE_CY','A'),
('CY031','Govind','CSE_CY','A'),
('CY032','Heena','CSE_CY','A'),
('CY033','Indrajit','CSE_CY','A'),
('CY034','Jagruti','CSE_CY','A'),
('CY035','Keshavraj','CSE_CY','A'),
('CY036','Leena','CSE_CY','A'),
('CY037','Mukund','CSE_CY','A'),
('CY038','Nagma','CSE_CY','A'),
('CY039','Onkar','CSE_CY','A'),
('CY040','Parveen','CSE_CY','A');

SELECT * FROM cse_cy_students_a;

CREATE TABLE eee_students_a
(admission_id VARCHAR(10), name VARCHAR(20), branch VARCHAR(20), section VARCHAR(20));

INSERT INTO eee_students_a VALUES
('EEE001','Aadesh','EEE','A'),
('EEE002','Bhaskar','EEE','A'),
('EEE003','Chaitra','EEE','A'),
('EEE004','Deepika','EEE','A'),
('EEE005','Eshwar','EEE','A'),
('EEE006','Fathima','EEE','A'),
('EEE007','Gagan','EEE','A'),
('EEE008','Harika','EEE','A'),
('EEE009','Imran','EEE','A'),
('EEE010','Janani','EEE','A'),
('EEE011','Karthikeyan','EEE','A'),
('EEE012','Likhitha','EEE','A'),
('EEE013','Madhav','EEE','A'),
('EEE014','Naveena','EEE','A'),
('EEE015','Omprakash','EEE','A'),
('EEE016','Padmini','EEE','A'),
('EEE017','Rithvik','EEE','A'),
('EEE018','Sowmya','EEE','A'),
('EEE019','Tejendra','EEE','A'),
('EEE020','Usha','EEE','A'),
('EEE021','Vamsi','EEE','A'),
('EEE022','Wahida','EEE','A'),
('EEE023','Yogendra','EEE','A'),
('EEE024','Zarina','EEE','A'),
('EEE025','Anirudh','EEE','A'),
('EEE026','Bhavani','EEE','A'),
('EEE027','Charan','EEE','A'),
('EEE028','Diksha','EEE','A'),
('EEE029','Eswaran','EEE','A'),
('EEE030','Farzana','EEE','A'),
('EEE031','Gokul','EEE','A'),
('EEE032','Hemalatha','EEE','A'),
('EEE033','Irfan','EEE','A'),
('EEE034','Jeevika','EEE','A'),
('EEE035','Kishan','EEE','A'),
('EEE036','Lalitha','EEE','A'),
('EEE037','Moin','EEE','A'),
('EEE038','Nandita','EEE','A'),
('EEE039','Ojas','EEE','A'),
('EEE040','Pranitha','EEE','A');

SELECT * FROM eee_students_a;

CREATE TABLE cse_aiml_students_a
(admission_id VARCHAR(10), name VARCHAR(20), branch VARCHAR(20), section VARCHAR(20));

INSERT INTO cse_aiml_students_a VALUES
('AIML001','Aarush','CSE_AIML','A'),
('AIML002','Bhavik','CSE_AIML','A'),
('AIML003','Charvi','CSE_AIML','A'),
('AIML004','Dhwani','CSE_AIML','A'),
('AIML005','Eshan','CSE_AIML','A'),
('AIML006','Falak','CSE_AIML','A'),
('AIML007','Gauransh','CSE_AIML','A'),
('AIML008','Hridya','CSE_AIML','A'),
('AIML009','Ivaan','CSE_AIML','A'),
('AIML010','Jivika','CSE_AIML','A'),
('AIML011','Kairavraj','CSE_AIML','A'),
('AIML012','Liyana','CSE_AIML','A'),
('AIML013','Moksh','CSE_AIML','A'),
('AIML014','Niyati','CSE_AIML','A'),
('AIML015','Oviya','CSE_AIML','A'),
('AIML016','Pranay','CSE_AIML','A'),
('AIML017','Quresh','CSE_AIML','A'),
('AIML018','Ridhima','CSE_AIML','A'),
('AIML019','Shaan','CSE_AIML','A'),
('AIML020','Trisha','CSE_AIML','A'),
('AIML021','Ujjwal','CSE_AIML','A'),
('AIML022','Vihana','CSE_AIML','A'),
('AIML023','Waseem','CSE_AIML','A'),
('AIML024','Xavier','CSE_AIML','A'),
('AIML025','Yatin','CSE_AIML','A'),
('AIML026','Zainab','CSE_AIML','A'),
('AIML027','Adhrit','CSE_AIML','A'),
('AIML028','Binal','CSE_AIML','A'),
('AIML029','Chetanraj','CSE_AIML','A'),
('AIML030','Devika','CSE_AIML','A'),
('AIML031','Eklavya','CSE_AIML','A'),
('AIML032','Fiza','CSE_AIML','A'),
('AIML033','Girishan','CSE_AIML','A'),
('AIML034','Hiral','CSE_AIML','A'),
('AIML035','Ishwar','CSE_AIML','A'),
('AIML036','Juhi','CSE_AIML','A'),
('AIML037','Krunal','CSE_AIML','A'),
('AIML038','Luv','CSE_AIML','A'),
('AIML039','Manvith','CSE_AIML','A'),
('AIML040','Nazia','CSE_AIML','A');

SELECT * FROM cse_aiml_students_a;

CREATE TABLE rooms 
(room_number INT , capacity INT); 
INSERT INTO rooms (room_number, capacity) VALUES
(101, 40),
(102, 40),
(103, 40),
(104, 40),
(105, 40),
(106, 40),
(107, 40);

SELECT * FROM rooms; 

CREATE TABLE exam_timetable (
    exam_date DATE,
    day VARCHAR(20),
    time_slot VARCHAR(30),
    subject VARCHAR(255),
    stream VARCHAR(100),
    subject_code VARCHAR(20)
);

INSERT INTO exam_timetable (exam_date, day, time_slot, subject, stream, subject_code) VALUES

-- 13 April 2026 (Monday)
('2026-04-13', 'Monday', '9:30-11:00', 'Numerical Methods', 'CSE', 'BAMCS201'),
('2026-04-13', 'Monday', '9:30-11:00', 'Calculus Laplace Transform & Numerical Techniques', 'EEE & ECE', 'BAMEE201'),
('2026-04-13', 'Monday', '9:30-11:00', 'Differential Calculus & Numerical Methods', 'CV', 'BAMCV201'),

('2026-04-13', 'Monday', '2:30-4:00', 'Samskrutika / Balake Kannada', 'CSE/EEE/CV', 'BSKHD209'),

('2026-04-13', 'Monday', '9:30-11:00', 'Applied Chemistry for Smart Systems', 'CSE', 'BACCS202'),
('2026-04-13', 'Monday', '9:30-11:00', 'Applied Chemistry for Emerging Electronics', 'EEE/ECE', 'BACEE202'),
('2026-04-13', 'Monday', '9:30-11:00', 'Applied Chemistry for Adv. Metal Protection', 'ME', 'BACME202'),

('2026-04-13', 'Monday', '2:30-4:00', 'Communication Skills', 'CSE/ECE/EEE/ME', 'BEGHD206'),

-- 15 April 2026 (Wednesday)
('2026-04-15', 'Wednesday', '9:30-11:00', 'Quantum Physics & Applications', 'CS', 'BAPCS202'),
('2026-04-15', 'Wednesday', '9:30-11:00', 'Physics of Electrical & Electronic Materials', 'EEE', 'BAPEE202'),
('2026-04-15', 'Wednesday', '9:30-11:00', 'Physics for Sustainable Structural Systems', 'CV', 'BAPCV202'),

('2026-04-15', 'Wednesday', '2:30-4:00', 'Introduction to AI & Applications', 'ETC', 'BAIAP205'),

('2026-04-15', 'Wednesday', '9:30-11:00', 'Numerical Methods', 'CSE', 'BAMCS201'),
('2026-04-15', 'Wednesday', '9:30-11:00', 'Calculus Laplace Transform & Numerical Techniques', 'ECE', 'BAMEE201'),
('2026-04-15', 'Wednesday', '9:30-11:00', 'Multivariable Calculus & Numerical Methods', 'ME', 'BAMME201'),

('2026-04-15', 'Wednesday', '2:30-4:00', 'Indian Constitution & Engineering Ethics', 'All', 'BICHD207'),

-- 16 April 2026 (Thursday)
('2026-04-16', 'Thursday', '9:30-11:00', 'Programming in C', 'CSE', 'BCSEN203'),
('2026-04-16', 'Thursday', '9:30-11:00', 'Basics of Electrical Engineering', 'EEE', 'BEEEN203'),
('2026-04-16', 'Thursday', '9:30-11:00', 'Engineering Mechanics', 'CV', 'BCVEN203'),

('2026-04-16', 'Thursday', '9:30-11:00', 'Building Sciences & Mechanics', 'Common', 'BENSC204A'),
('2026-04-16', 'Thursday', '9:30-11:00', 'Introduction to Electrical Engineering', 'Common', 'BENSC204B'),
('2026-04-16', 'Thursday', '9:30-11:00', 'Introduction to Electronics & Communication', 'Common', 'BENSC204C'),
('2026-04-16', 'Thursday', '9:30-11:00', 'Introduction to Mechanical Engineering', 'Common', 'BENSC204D'),
('2026-04-16', 'Thursday', '9:30-11:00', 'Essentials of Information Technology', 'Common', 'BENSC204E'),

-- 17 April 2026 (Friday)
('2026-04-17', 'Friday', '9:30-11:00', 'Building Sciences & Mechanics', 'Common', 'BENSC204A'),
('2026-04-17', 'Friday', '9:30-11:00', 'Intro to Electrical Engineering', 'Common', 'BENSC204B'),
('2026-04-17', 'Friday', '9:30-11:00', 'Intro to Electronics & Communication', 'Common', 'BENSC204C'),
('2026-04-17', 'Friday', '9:30-11:00', 'Intro to Mechanical Engineering', 'Common', 'BENSC204D'),
('2026-04-17', 'Friday', '9:30-11:00', 'Essentials of IT', 'Common', 'BENSC204E'),

('2026-04-17', 'Friday', '9:30-11:00', 'Introduction to C Programming', 'Common', 'BPRLC205A'),
('2026-04-17', 'Friday', '9:30-11:00', 'Python Programming', 'Common', 'BPRLC205B');

SELECT * FROM exam_timetable;
CREATE TABLE room_seats 
 (
    room_number INT,
    seat_number INT,
    PRIMARY KEY (room_number, seat_number)
);

INSERT INTO room_seats (room_number, seat_number) VALUES

-- Room 101
(101,1),(101,2),(101,3),(101,4),(101,5),(101,6),(101,7),(101,8),(101,9),(101,10),
(101,11),(101,12),(101,13),(101,14),(101,15),(101,16),(101,17),(101,18),(101,19),(101,20),
(101,21),(101,22),(101,23),(101,24),(101,25),(101,26),(101,27),(101,28),(101,29),(101,30),
(101,31),(101,32),(101,33),(101,34),(101,35),(101,36),(101,37),(101,38),(101,39),(101,40),

-- Room 102
(102,1),(102,2),(102,3),(102,4),(102,5),(102,6),(102,7),(102,8),(102,9),(102,10),
(102,11),(102,12),(102,13),(102,14),(102,15),(102,16),(102,17),(102,18),(102,19),(102,20),
(102,21),(102,22),(102,23),(102,24),(102,25),(102,26),(102,27),(102,28),(102,29),(102,30),
(102,31),(102,32),(102,33),(102,34),(102,35),(102,36),(102,37),(102,38),(102,39),(102,40),

-- Room 103
(103,1),(103,2),(103,3),(103,4),(103,5),(103,6),(103,7),(103,8),(103,9),(103,10),
(103,11),(103,12),(103,13),(103,14),(103,15),(103,16),(103,17),(103,18),(103,19),(103,20),
(103,21),(103,22),(103,23),(103,24),(103,25),(103,26),(103,27),(103,28),(103,29),(103,30),
(103,31),(103,32),(103,33),(103,34),(103,35),(103,36),(103,37),(103,38),(103,39),(103,40),

-- Room 104
(104,1),(104,2),(104,3),(104,4),(104,5),(104,6),(104,7),(104,8),(104,9),(104,10),
(104,11),(104,12),(104,13),(104,14),(104,15),(104,16),(104,17),(104,18),(104,19),(104,20),
(104,21),(104,22),(104,23),(104,24),(104,25),(104,26),(104,27),(104,28),(104,29),(104,30),
(104,31),(104,32),(104,33),(104,34),(104,35),(104,36),(104,37),(104,38),(104,39),(104,40),

-- Room 105
(105,1),(105,2),(105,3),(105,4),(105,5),(105,6),(105,7),(105,8),(105,9),(105,10),
(105,11),(105,12),(105,13),(105,14),(105,15),(105,16),(105,17),(105,18),(105,19),(105,20),
(105,21),(105,22),(105,23),(105,24),(105,25),(105,26),(105,27),(105,28),(105,29),(105,30),
(105,31),(105,32),(105,33),(105,34),(105,35),(105,36),(105,37),(105,38),(105,39),(105,40),

-- Room 106
(106,1),(106,2),(106,3),(106,4),(106,5),(106,6),(106,7),(106,8),(106,9),(106,10),
(106,11),(106,12),(106,13),(106,14),(106,15),(106,16),(106,17),(106,18),(106,19),(106,20),
(106,21),(106,22),(106,23),(106,24),(106,25),(106,26),(106,27),(106,28),(106,29),(106,30),
(106,31),(106,32),(106,33),(106,34),(106,35),(106,36),(106,37),(106,38),(106,39),(106,40),

-- Room 107
(107,1),(107,2),(107,3),(107,4),(107,5),(107,6),(107,7),(107,8),(107,9),(107,10),
(107,11),(107,12),(107,13),(107,14),(107,15),(107,16),(107,17),(107,18),(107,19),(107,20),
(107,21),(107,22),(107,23),(107,24),(107,25),(107,26),(107,27),(107,28),(107,29),(107,30),
(107,31),(107,32),(107,33),(107,34),(107,35),(107,36),(107,37),(107,38),(107,39),(107,40);

SELECT * FROM room_seats;

CREATE TABLE invigilators 
(registration_id VARCHAR(10), name VARCHAR(20), department VARCHAR(20));

INSERT INTO invigilators VALUES
('INV001','Sharma','CSE'),
('INV002','Reddy','ECE'),
('INV003','Kumar','ME'),
('INV004','Patil','EEE'),
('INV005','Singh','CSE'),
('INV006','Verma','ECE'),
('INV007','Joshi','ME'),
('INV008','Nair','EEE'),
('INV009','Das','CSE'),
('INV010','Iyer','ECE'),
('INV011','Mehta','ME'),
('INV012','Kulkarni','EEE'),
('INV013','Gupta','CSE'),
('INV014','Shetty','ECE');

SELECT * FROM invigilators;

-- -----------------------------
-- SEATING TABLE
-- -----------------------------
CREATE TABLE seating_arrangement (
    id INT AUTO_INCREMENT PRIMARY KEY,

    exam_date DATE,
    time_slot VARCHAR(30),

    room_number INT,
    seat_number INT,

    admission_id VARCHAR(10),
    name VARCHAR(20),
    branch VARCHAR(20),
    section VARCHAR(10),

    -- Prevent same seat being used twice in same exam
    UNIQUE (exam_date, time_slot, room_number, seat_number),

    -- Prevent same student getting multiple seats in same exam
    UNIQUE (exam_date, time_slot, admission_id));

-- -----------------------------
-- INVIGILATOR TABLE
-- -----------------------------

CREATE TABLE resource_allocation (
    id INT AUTO_INCREMENT PRIMARY KEY,

    exam_date DATE,
    time_slot VARCHAR(30),

    room_number INT,

    registration_id VARCHAR(10),
    name VARCHAR(20),

    -- One invigilator per room per exam
    UNIQUE (exam_date, time_slot, room_number),

    -- Same invigilator can't be in two rooms at same time
    UNIQUE (exam_date, time_slot, registration_id));

-- -----------------------------
-- CLEAR OLD DATA BEFORE RUN
-- -----------------------------
TRUNCATE TABLE seating_arrangement;
TRUNCATE TABLE resource_allocation;
