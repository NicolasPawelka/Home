import mysql.connector

try:
    # Establish connection
    connection = mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password"
    )
    
    if connection.is_connected():
        print("Connected to MariaDB")
    else:
        print("Failed to connect to MariaDB")

    # Your code to work with the database goes here

except mysql.connector.Error as err:
    print("Error:", err)

finally:
    if 'connection' in locals() and connection.is_connected():
        connection.close()
        print("Connection closed.")
import mysql.connector

try:
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Leon1212"
    )
    cursor = connection.cursor()

    # Create database
    cursor.execute("CREATE DATABASE mydatabase")

    print("Database created successfully.")

except mysql.connector.Error as error:
    print("Error:", error)

finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("Connection closed.")
