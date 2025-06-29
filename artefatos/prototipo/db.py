import mysql.connector
import streamlit as st

USER = st.secrets["USER"]
PASSWORD = st.secrets["PASSWORD"]
DATABASE = st.secrets["DATABASE_NAME"]

print(USER)
print(PASSWORD)
print(DATABASE)

def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user=USER,
            password=PASSWORD,
            database=DATABASE
        )
        if connection.is_connected():
            print("Connected to the database")
            return connection
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None
    finally:
        if connection and connection.is_connected():
            connection.close()
            print("Database connection closed")

