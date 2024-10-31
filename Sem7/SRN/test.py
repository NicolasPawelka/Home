import mariadb
import sys


try:
    conn = mariadb.connect(
        user = "root",
        password = "Leon1212.",
        host = "localhost",
        database = "test"
    )
except mariadb.Error as e:
    print(f"Error connecting to MaridDB: {e}")
    sys.exit(1)

cur = conn.cursor()