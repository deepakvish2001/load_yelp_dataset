import pandas as pd
from db_connect import engine

def show_table():
    tables = pd.read_sql_query(
        "Select table_name from information_schema.tables where table_schema = 'public';", con=engine
    )
    print("\tables name")
    print(tables)

def show_column():
    column = pd.read_sql_query(
        "Select table_name, column_name, "
    )