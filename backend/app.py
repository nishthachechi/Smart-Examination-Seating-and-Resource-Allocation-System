import mysql.connector
import random
from collections import defaultdict

# -----------------------------
# DATABASE CONNECTION
# -----------------------------
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="examination"
)
cursor = conn.cursor(dictionary=True)

# -----------------------------
# FETCH ALL STUDENTS
# -----------------------------
def fetch_all_students():
    tables = [
        "cse_students_a",
        "me_students_a",
        "ece_students_a",
        "cse_ds_students_a",
        "cse_cy_students_a",
        "eee_students_a",
        "cse_aiml_students_a"
    ]
    
    students = []
    
    for table in tables:
        cursor.execute(f"SELECT * FROM {table}")
        students.extend(cursor.fetchall())
    
    return students

# -----------------------------
# FETCH ROOMS
# -----------------------------
def fetch_rooms():
    cursor.execute("SELECT * FROM rooms ORDER BY room_number")
    return cursor.fetchall()

# -----------------------------
# FETCH INVIGILATORS
# -----------------------------
def fetch_invigilators():
    cursor.execute("SELECT * FROM invigilators")
    return cursor.fetchall()

# -----------------------------
# FETCH EXAMS
# -----------------------------
def fetch_exams():
    cursor.execute("""
        SELECT DISTINCT exam_date, time_slot, stream 
        FROM exam_timetable
    """)
    return cursor.fetchall()

# -----------------------------
# FILTER STUDENTS BY STREAM
# -----------------------------
def filter_students_by_stream(students, stream):
    if stream == "All" or stream == "Common":
        return students

    stream_list = [s.strip() for s in stream.split("/")]

    filtered = [
        s for s in students
        if any(branch in s['branch'] for branch in stream_list)
    ]

    return filtered

# -----------------------------
# ALTERNATE BRANCH DISTRIBUTION
# -----------------------------
def alternate_branch_distribution(students):
    branch_groups = defaultdict(list)

    for s in students:
        branch_groups[s['branch']].append(s)

    # Shuffle inside each branch
    for b in branch_groups:
        random.shuffle(branch_groups[b])

    result = []

    while any(branch_groups.values()):
        for b in list(branch_groups.keys()):
            if branch_groups[b]:
                result.append(branch_groups[b].pop())

    return result

# -----------------------------
# CLEAR OLD DATA (OPTIONAL)
# -----------------------------
def clear_old_data():
    cursor.execute("DELETE FROM seating_arrangement")
    cursor.execute("DELETE FROM resource_allocation")
    conn.commit()

# -----------------------------
# GENERATE SEATING
# -----------------------------
def generate_seating():
    all_students = fetch_all_students()
    rooms = fetch_rooms()
    exams = fetch_exams()
    invigilators = fetch_invigilators()

    used_invigilators = set()

    for exam in exams:
        exam_date = exam['exam_date']
        time_slot = exam['time_slot']
        stream = exam['stream']

        print(f"Processing {exam_date} | {time_slot} | {stream}")

        # Filter students for this exam
        students = filter_students_by_stream(all_students, stream)

        # Unique shuffle per exam
        random.shuffle(students)

        # Alternate branches
        arranged_students = alternate_branch_distribution(students)

        seat_index = 0

        # -----------------------------
        # SEAT ALLOCATION
        # -----------------------------
        for room in rooms:
            room_no = room['room_number']
            capacity = room['capacity']

            for seat in range(1, capacity + 1):
                if seat_index >= len(arranged_students):
                    break

                s = arranged_students[seat_index]

                cursor.execute("""
                    INSERT INTO seating_arrangement
                    (admission_id, name, branch, section, room_number, seat_number, exam_date, time_slot)
                    VALUES (%s,%s,%s,%s,%s,%s,%s,%s)
                """, (
                    s['admission_id'],
                    s['name'],
                    s['branch'],
                    s['section'],
                    room_no,
                    seat,
                    exam_date,
                    time_slot
                ))

                seat_index += 1

        # -----------------------------
        # INVIGILATOR ASSIGNMENT
        # -----------------------------
        random.shuffle(invigilators)

        for i, room in enumerate(rooms):
            inv = invigilators[i % len(invigilators)]

            # Avoid same invigilator reuse in same exam
            key = (inv['registration_id'], exam_date, time_slot)

            if key in used_invigilators:
                continue

            used_invigilators.add(key)

            cursor.execute("""
                INSERT INTO resource_allocation
                (registration_id, name, room_number, exam_date, time_slot)
                VALUES (%s,%s,%s,%s,%s)
            """, (
                inv['registration_id'],
                inv['name'],
                room['room_number'],
                exam_date,
                time_slot
            ))

        conn.commit()

# -----------------------------
# MAIN EXECUTION
# -----------------------------
if __name__ == "__main__":
    clear_old_data()  # optional
    generate_seating()
    print("\n✅ Seating & Invigilation Generated Successfully!")
