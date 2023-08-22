import pandas as pd
import sqlite3 as sq
from py_scripts.utils import open_sql_file, format_date
from py_scripts.logger import logger


class ETL:

    def __init__(self, db_path):
        self.db_path = db_path

    def _set_connect(self):
        """Function for connect to data base."""
        return sq.connect(self.db_path)

    def initialize_stg(self, stg_table_name: str) -> None:
        """Function for initizlize STG table"""
        self.read_sql_script(f'sql_scripts/create_{stg_table_name}.sql')

    def insert_data2stg(self, stg_table_name: str, data: pd.DataFrame) -> None:
        """Function for insert data to STG table"""
        format_date(data)
        data = data.astype('str')
        query = f"""INSERT INTO {stg_table_name}({",".join(list(data))})
                        VALUES ({",".join(['?' for _ in range(data.shape[1])])})"""
        connect = self._set_connect()

        try:
            cur = connect.cursor()
            cur.executemany(query, list(data.to_records(index=False)))
            connect.commit()
        except ConnectionError as con_error:
            logger.info(con_error)
        except sq.Error as sql_error:
            logger.info(sql_error)
            if connect:
                connect.rollback()
        finally:
            if connect:
                connect.close()

    def create_and_update_dwh(self, dwh_table_name: str) -> None:
        """Function for create and update DWH table"""
        self.read_sql_script(dwh_table_name)

    def read_sql_script(self, sql_path: str) -> None:
        """Function for execute sql script to table"""
        connect = self._set_connect()
        try:
            cur = connect.cursor()
            sql_script = open_sql_file(sql_path)
            cur.executescript(sql_script)
            connect.commit()
        except ConnectionError as conn_error:
            logger.info(conn_error)
        except FileNotFoundError as file_error:
            logger.info(file_error)
        except sq.Error as sql_error:
            logger.info(sql_error)
            if connect:
                connect.rollback()
        finally:
            if connect:
                connect.close()
