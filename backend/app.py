import mysql.connector
import random
from collections import defaultdict

# -----------------------------
# DB CONNECTION
# -----------------------------
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
    clear_old()

    all_students = fetch_all_students()
    rooms = fetch_rooms()
    exams = fetch_exams()
    invigilators = fetch_invigilators()

    for exam in exams:
        date = exam['exam_date']
        slot = exam['time_slot']
        stream = exam['stream']

        print(f"\nProcessing: {date} | {slot} | {stream}")

        students = filter_students(all_students, stream)

        if not students:
            print("⚠ No students found")
            continue

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

                try:
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
                except Exception as e:
                    print("Seat insert error:", e)

                idx += 1

            if idx >= len(arranged):
                break   # <-- FIXED outer break

        # -------------------------
        # INVIGILATORS
        # -------------------------
        random.shuffle(invigilators)
        inv_index = 0

        for room in rooms:
            inv = invigilators[inv_index % len(invigilators)]

            try:
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
            except Exception as e:
                print("Invigilator error:", e)

            inv_index += 1

        conn.commit()

# -----------------------------
# RUN
# -----------------------------
generate()
print("\n✅ Seating & Invigilation Generated Successfully!")
