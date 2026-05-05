import mysql.connector
import random
from collections import defaultdict

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="examination"
)
cursor = conn.cursor(dictionary=True)

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
# STREAM FILTER (FIXED)
# -----------------------------
def filter_students(students, stream):
    if stream.lower() in ["all", "common"]:
        return students

    stream = stream.replace("&", "/")
    branches = [s.strip().upper() for s in stream.split("/")]

    return [
        s for s in students
        if any(b == s['branch'].upper() for b in branches)
    ]

# -----------------------------
# ALTERNATING BRANCH LOGIC
# -----------------------------
def alternate(students):
    groups = defaultdict(list)
    for s in students:
        groups[s['branch']].append(s)

    for g in groups.values():
        random.shuffle(g)

    result = []
    while any(groups.values()):
        for k in list(groups.keys()):
            if groups[k]:
                result.append(groups[k].pop())
    return result

# -----------------------------
# MAIN LOGIC
# -----------------------------
def generate():
    all_students = fetch_all_students()
    rooms = fetch_rooms()
    exams = fetch_exams()
    invigilators = fetch_invigilators()

    for exam in exams:
        date = exam['exam_date']
        slot = exam['time_slot']
        stream = exam['stream']

        print(f"Processing {date} | {slot} | {stream}")

        students = filter_students(all_students, stream)
        random.shuffle(students)

        arranged = alternate(students)

        idx = 0

        # -------------------------
        # SEATING
        # -------------------------
        seating_data = []

        for room in rooms:
            for seat in range(1, room['capacity'] + 1):
                if idx >= len(arranged):
                    break

                s = arranged[idx]

                seating_data.append((
                    s['admission_id'], s['name'], s['branch'], s['section'],
                    room['room_number'], seat, date, slot
                ))

                idx += 1

        cursor.executemany("""
            INSERT IGNORE INTO seating_arrangement
            (admission_id, name, branch, section, room_number, seat_number, exam_date, time_slot)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
        """, seating_data)

        # -------------------------
        # INVIGILATORS (FIXED LOGIC)
        # -------------------------
        random.shuffle(invigilators)
        used = set()
        inv_data = []

        for room in rooms:
            for inv in invigilators:
                if inv['registration_id'] not in used:
                    used.add(inv['registration_id'])

                    inv_data.append((
                        inv['registration_id'],
                        inv['name'],
                        room['room_number'],
                        date,
                        slot
                    ))
                    break

        cursor.executemany("""
            INSERT IGNORE INTO resource_allocation
            (registration_id, name, room_number, exam_date, time_slot)
            VALUES (%s,%s,%s,%s,%s)
        """, inv_data)

        conn.commit()

# -----------------------------
# RUN
# -----------------------------
generate()
print("✅ Seating & Invigilation Generated Successfully!")

