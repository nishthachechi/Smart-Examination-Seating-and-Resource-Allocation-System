import mysql.connector
import random

# ---------------------------
# DATABASE CONNECTION
# ---------------------------
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="yourpassword",   # <-- change this
    database="examination"
)

cursor = db.cursor(dictionary=True)

# ---------------------------
# FETCH ALL STUDENTS
# ---------------------------
def get_all_students():
    tables = [
        "cse_students_a",
        "me_students_a",
        "ece_students_a",
        "cse_ds_students_a",
        "cse_cy_students_a",
        "eee_students_a",
        "cse_aiml_students_a"
    ]
    
    all_students = []
    
    for table in tables:
        cursor.execute(f"SELECT * FROM {table}")
        data = cursor.fetchall()
        all_students.extend(data)
    
    return all_students


# ---------------------------
# FETCH ROOMS
# ---------------------------
def get_rooms():
    cursor.execute("SELECT * FROM rooms")
    return cursor.fetchall()


# ---------------------------
# FETCH INVIGILATORS
# ---------------------------
def get_invigilators():
    cursor.execute("SELECT * FROM invigilators")
    return cursor.fetchall()


# ---------------------------
# GENERATE SEATING
# ---------------------------
def generate_seating():

    # Clear old data
    cursor.execute("DELETE FROM seating_arrangement")
    cursor.execute("DELETE FROM resource_allocation")
    db.commit()

    # Fetch data
    students = get_all_students()
    rooms = get_rooms()
    invigilators = get_invigilators()

    # Shuffle students & invigilators
    random.shuffle(students)
    random.shuffle(invigilators)

    student_index = 0
    invigilator_index = 0

    # Assign students to rooms
    for room in rooms:
        room_no = room['room_number']
        capacity = room['capacity']

        # Assign invigilator to room
        if invigilator_index < len(invigilators):
            inv = invigilators[invigilator_index]

            cursor.execute("""
                INSERT INTO resource_allocation (registration_id, name, room_number)
                VALUES (%s, %s, %s)
            """, (inv['registration_id'], inv['name'], room_no))

            invigilator_index += 1

        # Fill students
        for seat in range(1, capacity + 1):
            if student_index >= len(students):
                break

            s = students[student_index]

            cursor.execute("""
                INSERT INTO seating_arrangement 
                (admission_id, name, branch, section, room_number, seat_number)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (
                s['admission_id'],
                s['name'],
                s['branch'],
                s['section'],
                room_no,
                seat
            ))

            student_index += 1

    db.commit()
    print("✅ Seating and invigilator allocation completed!")


# ---------------------------
# VIEW RESULTS
# ---------------------------
def view_seating():
    cursor.execute("SELECT * FROM seating_arrangement")
    data = cursor.fetchall()

    for row in data[:20]:   # print first 20
        print(row)


def view_invigilators():
    cursor.execute("SELECT * FROM resource_allocation")
    data = cursor.fetchall()

    for row in data:
        print(row)


# ---------------------------
# RUN PROGRAM
# ---------------------------
if __name__ == "__main__":
    generate_seating()
    
    print("\n--- SAMPLE SEATING ---")
    view_seating()
    
    print("\n--- INVIGILATOR ALLOCATION ---")
    view_invigilators()
