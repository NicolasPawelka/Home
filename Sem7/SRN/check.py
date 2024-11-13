import mariadb
import sys
import hashing

try:
    conn = mariadb.connect(
        user = "root",
        password = "Leon1212.",
        host = "localhost",
        database = "testDB"
    )
except mariadb.Error as e:
    print(f"Error connecting to MaridDB: {e}")
    sys.exit(1)

cur = conn.cursor()
password_hash = ""

user_name = input("Hello User please enter our name: ")
cur.execute(
    "SELECT password FROM user WHERE name=?",
    (user_name,)
)
result = cur.fetchone()
password = input("Now enter our password: ")

isCorrect = hashing.check_password(result[0],password)
print(f"Passwort korrekt?: {isCorrect}")

cur.close()
conn.close()