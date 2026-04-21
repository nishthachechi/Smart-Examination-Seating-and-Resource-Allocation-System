CREATE DATABASE exam_system;

USE exam_system;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    admission_no VARCHAR(50),
    department VARCHAR(50),
    section VARCHAR(10)
);

CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR(50),
    capacity INT
);

CREATE TABLE invigilators (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE seating (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    room_id INT,
    seat_number INT
);
