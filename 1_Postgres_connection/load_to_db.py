from read_json import business_df, checkin_df, tip_df ,review_df,user_df
from db_connect import engine

def load_dataframe(df, table_name):
    df.to_sql(
        name=table_name,
        con=engine,
        if_exists='replace',
        index=False
    )
    print(f"{table_name} uploaded successfully 🚀")

load_dataframe(business_df, 'business')
load_dataframe(checkin_df, 'checkin')
load_dataframe(tip_df, 'tip')
load_dataframe(review_df, 'review')
load_dataframe(user_df, 'user')