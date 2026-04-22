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

CREATE TABLE seating_arrangement
(admission_id VARCHAR(10),name VARCHAR(20),branch VARCHAR(20),section VARCHAR(20),room_number INT, seat_number INT);
SELECT * FROM seating_arrangement;

CREATE TABLE resource_allocation
(registration_id VARCHAR(10),name VARCHAR(20),room_number INT);

SELECT * FROM resource_allocation;







