#!python3
"""
pyspark-script.py - Reads data from PostgreSQL and ClickHouse tables.


"""

import logging
import pandas as pd
from sqlalchemy import create_engine
import clickhouse_connect

log = logging.getLogger(__name__)

def read_from_postgres():
    """Read dataframe from Postgres."""
    engine = create_engine('postgresql://ps_user:test123@localhost:5432/ps_db')
    log.info("Connected to Postgres")
    df = pd.read_sql('SELECT * FROM users', engine)
    log.info("Postgres data read")
    return df

def add_to_clickhouse(dataframe):
    """Write dataframe to ClickHouse"""
    
    client = clickhouse_connect.get_client(
        host="localhost",
        port=8123,
        username="ch_user",
        password="test123")
    log.info("Connected to ClickHouse")
    client.insert_df("users", dataframe)
    log.info("Data migrated into ClickHouse successfully")

def main():
    logging.basicConfig(
        level=logging.INFO,
        format="%(message)s"
    )
    df_pg = read_from_postgres()
    log.info("PostgreSQL data:\n%s", df_pg)
    add_to_clickhouse(df_pg)

if __name__ == "__main__":
    main()
