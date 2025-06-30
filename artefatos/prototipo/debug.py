from database import get_connection, DATABASE
import mysql.connector

def repopulate_database():
    conn = get_connection()
    cursor = conn.cursor()
    try:
        with open('data.sql', 'r') as file:
            data = file.read()
        cursor.execute(data, multi=True)
        conn.commit()
        print("Banco de dados repopulado com sucesso.")
    except mysql.connector.Error as err:
        print(f"Erro ao repopular o banco de dados: {err}")
    finally:
        conn.close()

def reset_database():
    conn = get_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("DROP DATABASE IF EXISTS " + DATABASE)
        with open('schema.sql', 'r') as file:
            schema = file.read()
        cursor.execute(schema, multi=True)
        conn.commit()
        print("Banco de dados reiniciado com sucesso.")
        print("Repopulando o banco de dados...")
        repopulate_database()
    except mysql.connector.Error as err:
        print(f"Erro ao reiniciar o banco de dados: {err}")
    finally:
        conn.close()
