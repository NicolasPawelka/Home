import mariadb
import sys
import hashing



try:
    conn = mariadb.connect(
        user = "app_User",
        host = "localhost",
        database = "testDB"
    )
except mariadb.Error as e:
    print(f"Error connecting to MaridDB: {e}")
    sys.exit(1)

cur = conn.cursor()

user_name = input("Hello User please enter our name: ")
password = input("Now enter our password: ")
password = hashing.hash_password(password)


query = "INSERT INTO user (name, password) VALUES (?, ?)"
cur.execute(query, (user_name,password ))

conn.commit()
cur.close()
conn.close()

user_name = ""
password = ""

