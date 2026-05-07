from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

import mysql.connector
import random
# ... rest of the code stays the same
import mysql.connector
import random
from collections import defaultdict

# -----------------------------
# DB CONNECTION
# -----------------------------
try:
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="your_password",
        database="examination"
    )
    cursor = conn.cursor(dictionary=True)
except Exception as e:
    print("❌ Database connection failed:", e)
    exit()

# -----------------------------
# FETCH DATA
# -----------------------------
def fetch_all_students():
    tables = [
        "cse_students_a","me_students_a","ece_students_a",
        "cse_ds_students_a","cse_cy_students_a",
        "eee_students_a","cse_aiml_students_a"
    ]
    students = []
    for t in tables:
        cursor.execute(f"SELECT * FROM {t}")
        students.extend(cursor.fetchall())
    return students

def fetch_rooms():
    cursor.execute("SELECT * FROM rooms ORDER BY room_number")
    return cursor.fetchall()

def fetch_exams():
    cursor.execute("""
        SELECT DISTINCT exam_date, time_slot, stream 
        FROM exam_timetable
    """)
    return cursor.fetchall()

def fetch_invigilators():
    cursor.execute("SELECT * FROM invigilators")
    return cursor.fetchall()

# -----------------------------
# CLEAR OLD DATA
# -----------------------------
def clear_old():
    cursor.execute("DELETE FROM seating_arrangement")
    cursor.execute("DELETE FROM resource_allocation")
    conn.commit()

# -----------------------------
# STREAM FILTER
# -----------------------------
def filter_students(students, stream):
    if not stream:
        return []

    stream = stream.strip().lower()

    if stream in ["all", "common"]:
        return students

    stream = stream.replace("&", "/")
    branches = [s.strip().upper() for s in stream.split("/")]

    return [s for s in students if s['branch'].upper() in branches]

# -----------------------------
# ALTERNATE BRANCH SEATING
# -----------------------------
def alternate(students):
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

# -----------------------------
# MAIN LOGIC
# -----------------------------
def generate():
    try:
        clear_old()

        all_students = fetch_all_students()
        rooms = fetch_rooms()
        exams = fetch_exams()
        invigilators = fetch_invigilators()

        total_seats = sum(room['capacity'] for room in rooms)

        for exam in exams:
            date = exam['exam_date']
            slot = exam['time_slot']
            stream = exam['stream']

            print(f"\n📌 Processing: {date} | {slot} | {stream}")

            students = filter_students(all_students, stream)

            if not students:
                print("⚠ No students found")
                continue

            if len(students) > total_seats:
                print("⚠ Warning: Not enough seats! Some students will not be assigned.")

            random.shuffle(students)
            arranged = alternate(students)

            idx = 0

            # -------------------------
            # SEATING
            # -------------------------
            for room in rooms:
                for seat in range(1, room['capacity'] + 1):

                    if idx >= len(arranged):
                        break

                    s = arranged[idx]

                    cursor.execute("""
                        INSERT INTO seating_arrangement
                        (admission_id, name, branch, section,
                         room_number, seat_number, exam_date, time_slot)
                        VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
                    """, (
                        s['admission_id'],
                        s['name'],
                        s['branch'],
                        s['section'],
                        room['room_number'],
                        seat,
                        date,
                        slot
                    ))

                    idx += 1

                if idx >= len(arranged):
                    break

            # -------------------------
            # INVIGILATORS
            # -------------------------
            if not invigilators:
                print("⚠ No invigilators available")
            else:
                random.shuffle(invigilators)

                for i, room in enumerate(rooms):
                    inv = invigilators[i % len(invigilators)]

                    cursor.execute("""
                        INSERT INTO resource_allocation
                        (registration_id, name, room_number, exam_date, time_slot)
                        VALUES (%s,%s,%s,%s,%s)
                    """, (
                        inv['registration_id'],
                        inv['name'],
                        room['room_number'],
                        date,
                        slot
                    ))

            conn.commit()

        print("\n✅ Seating & Invigilation Generated Successfully!")

    except Exception as e:
        conn.rollback()
        print("❌ Error occurred:", e)

    finally:
        cursor.close()
        conn.close()

@app.route('/admin')
def admin_dashboard():

    cursor = conn.cursor(dictionary=True)

    # TOTAL STUDENTS
    total_students = 240

    # TOTAL TEACHERS
    cursor.execute("SELECT COUNT(*) AS total FROM invigilators")
    total_teachers = cursor.fetchone()['total']

    # TOTAL ROOMS
    cursor.execute("SELECT COUNT(*) AS total FROM rooms")
    total_rooms = cursor.fetchone()['total']

    # TOTAL SEATING PLANS
    cursor.execute("SELECT COUNT(*) AS total FROM seating_arrangement")
    total_plans = cursor.fetchone()['total']

    # EXAM TABLE
    cursor.execute("SELECT * FROM exams")
    exams = cursor.fetchall()

    return render_template(
        'index.html',
        total_students=total_students,
        total_teachers=total_teachers,
        total_rooms=total_rooms,
        total_plans=total_plans,
        exams=exams
    )

# -----------------------------
# RUN
# -----------------------------
# -----------------------------
# RUN FLASK SERVER
# -----------------------------
@app.route('/api/generate', methods=['POST'])
def api_generate():
    generate() # This runs your existing algorithm
    return jsonify({"message": "Seating Generated Successfully!"})

if __name__ == '__main__':
    print("🚀 Backend server is running on http://127.0.0.1:5000")
    app.run(port=5000, debug=True)


