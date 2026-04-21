from flask import Flask, request, jsonify
import mysql.connector
import random

app = Flask(__name__)

# DB Connection
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="yourpassword",
    database="exam_system"
)

cursor = db.cursor(dictionary=True)

# ---------------------------
# Add Student
# ---------------------------
@app.route('/add_student', methods=['POST'])
def add_student():
    data = request.json
    query = "INSERT INTO students (name, admission_no, department, section) VALUES (%s,%s,%s,%s)"
    values = (data['name'], data['admission_no'], data['department'], data['section'])
    
    cursor.execute(query, values)
    db.commit()
    
    return jsonify({"message": "Student added successfully"})

# ---------------------------
# Add Room
# ---------------------------
@app.route('/add_room', methods=['POST'])
def add_room():
    data = request.json
    query = "INSERT INTO rooms (room_name, capacity) VALUES (%s,%s)"
    
    cursor.execute(query, (data['room_name'], data['capacity']))
    db.commit()
    
    return jsonify({"message": "Room added successfully"})

# ---------------------------
# Add Invigilator
# ---------------------------
@app.route('/add_invigilator', methods=['POST'])
def add_invigilator():
    data = request.json
    query = "INSERT INTO invigilators (name) VALUES (%s)"
    
    cursor.execute(query, (data['name'],))
    db.commit()
    
    return jsonify({"message": "Invigilator added successfully"})

# ---------------------------
# Generate Seating
# ---------------------------
@app.route('/generate_seating', methods=['GET'])
def generate_seating():
    
    # Clear old seating
    cursor.execute("DELETE FROM seating")
    db.commit()

    # Get students & rooms
    cursor.execute("SELECT * FROM students")
    students = cursor.fetchall()

    cursor.execute("SELECT * FROM rooms")
    rooms = cursor.fetchall()

    # Shuffle students
    random.shuffle(students)

    student_index = 0

    for room in rooms:
        capacity = room['capacity']

        for seat in range(1, capacity + 1):
            if student_index >= len(students):
                break

            student = students[student_index]

            query = """
                INSERT INTO seating (student_id, room_id, seat_number)
                VALUES (%s, %s, %s)
            """
            cursor.execute(query, (student['id'], room['id'], seat))

            student_index += 1

    db.commit()

    return jsonify({"message": "Seating generated successfully"})

# ---------------------------
# View Seating
# ---------------------------
@app.route('/view_seating', methods=['GET'])
def view_seating():
    query = """
    SELECT s.name, r.room_name, se.seat_number
    FROM seating se
    JOIN students s ON se.student_id = s.id
    JOIN rooms r ON se.room_id = r.id
    ORDER BY r.room_name, se.seat_number
    """
    
    cursor.execute(query)
    data = cursor.fetchall()

    return jsonify(data)

# ---------------------------
# Run Server
# ---------------------------
if __name__ == '__main__':
    app.run(debug=True)
