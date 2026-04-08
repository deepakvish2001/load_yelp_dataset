import psycopg2
from sqlalchemy import create_engine

# Create database
try:
    conn = psycopg2.connect(
        host='localhost',
        user='postgres',
        password='sa123',
        dbname='postgres',
        port='5432'
    )
    conn.autocommit = True
    cursor = conn.cursor()

    cursor.execute("CREATE DATABASE yelp;")
    print("Database createed successfully")

except psycopg2.errors.DuplicateDatabase:
    print("Database already exist")

finally:
    if 'cursor' in locals():
        cursor.close()
    if 'conn' in locals():
        conn.close()

engine = create_engine("postgresql://postgres:sa123@localhost:5432/yelp")
print("connect to Yelp Database")