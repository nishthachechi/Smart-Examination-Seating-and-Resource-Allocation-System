from flask import Flask, jsonify, render_template, request, session, redirect, url_for
from flask_cors import CORS
import mysql.connector
import random
from collections import defaultdict

app = Flask(__name__)
app.secret_key = 'your_secret_key_here' # Required for sessions
CORS(app)

# -----------------------------
# DB CONNECTION HELPER
# -----------------------------
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="root@123", # Ensure this matches your actual password
        database="examination"
    )

# -----------------------------
# LOGIC FUNCTIONS
# -----------------------------

def fetch_all_students(cursor):
    tables = [
        "cse_students_a", "me_students_a", "ece_students_a",
        "cse_ds_students_a", "cse_cy_students_a",
        "eee_students_a", "cse_aiml_students_a"
    ]
    students = []
    for t in tables:
        try:
            cursor.execute(f"SELECT * FROM {t}")
            students.extend(cursor.fetchall())
        except Exception as e:
            print(f"⚠ Table {t} missing or error: {e}")
    return students

def filter_students(students, stream):
    if not stream: return []
    stream = stream.strip().lower()
    if stream in ["all", "common"]: return students
    
    # Normalizing stream names for matching
    branches = [s.strip().upper() for s in stream.replace("&", "/").split("/")]
    return [s for s in students if s['branch'].upper() in branches]

def alternate_seating(students):
    groups = defaultdict(list)
    for s in students:
        groups[s['branch']].append(s)
    
    for g in groups.values():
        random.shuffle(g)
        
    result = []
    while any(groups.values()):
        for branch in list(groups.keys()):
            if groups[branch]:
                result.append(groups[branch].pop())
    return result

def generate_logic():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    try:
        # Clear old data
        cursor.execute("DELETE FROM seating_arrangement")
        cursor.execute("DELETE FROM resource_allocation")

        all_students = fetch_all_students(cursor)
        cursor.execute("SELECT * FROM rooms ORDER BY room_number")
        rooms = cursor.fetchall()
        cursor.execute("SELECT DISTINCT exam_date, time_slot, stream FROM exam_timetable")
        exams = cursor.fetchall()
        cursor.execute("SELECT * FROM invigilators")
        invigilators = cursor.fetchall()

        total_seats = sum(room['capacity'] for room in rooms)

        for exam in exams:
            date, slot, stream = exam['exam_date'], exam['time_slot'], exam['stream']
            students = filter_students(all_students, stream)

            if not students: continue

            random.shuffle(students)
            arranged = alternate_seating(students)

            idx = 0
            for room in rooms:
                # Seating logic
                for seat in range(1, room['capacity'] + 1):
                    if idx >= len(arranged): break
                    
                    s = arranged[idx]
                    cursor.execute("""
                        INSERT INTO seating_arrangement 
                        (admission_id, name, branch, section, room_number, seat_number, exam_date, time_slot)
                        VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
                    """, (s['admission_id'], s['name'], s['branch'], s['section'], 
                          room['room_number'], seat, date, slot))
                    idx += 1
                
                if idx >= len(arranged): break

            # Invigilation assignment per room
            if invigilators:
                random.shuffle(invigilators)
                for i, room in enumerate(rooms):
                    inv = invigilators[i % len(invigilators)]
                    cursor.execute("""
                        INSERT INTO resource_allocation (registration_id, name, room_number, exam_date, time_slot)
                        VALUES (%s,%s,%s,%s,%s)
                    """, (inv['registration_id'], inv['name'], room['room_number'], date, slot))

        conn.commit()
        return True, "Success"
    except Exception as e:
        conn.rollback()
        return False, str(e)
    finally:
        cursor.close()
        conn.close()

# -----------------------------
# ROUTES
# -----------------------------

@app.route('/admin')
def admin_dashboard():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT COUNT(*) AS total FROM invigilators")
    total_teachers = cursor.fetchone()['total']
    
    cursor.execute("SELECT COUNT(*) AS total FROM rooms")
    total_rooms = cursor.fetchone()['total']
    
    cursor.execute("SELECT COUNT(*) AS total FROM seating_arrangement")
    total_plans = cursor.fetchone()['total']
    
    cursor.execute("SELECT * FROM exam_timetable")
    exams = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('index.html', total_students=240, total_teachers=total_teachers, 
                           total_rooms=total_rooms, total_plans=total_plans, exams=exams)

@app.route('/api/allocate', methods=['POST'])
def allocate():
    success, message = generate_logic()
    if success:
        return jsonify({"success": True, "message": "Allocation completed!"})
    else:
        return jsonify({"success": False, "error": message}), 500

@app.route("/seating-plan")
def seating_plan():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM seating_arrangement")
    seating = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template("seating-plan.html", seating=seating)

if __name__ == '__main__':
    app.run(port=5000, debug=True)
