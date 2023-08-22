import os
import shutil
from py_scripts.utils import read_data_sheets
from py_scripts.etl_task import ETL
from py_scripts.constants import DB_PATH, TABLES, SHEETS, DWH_TABLES


def run_etl(folder_path, file_name):
    table_stg, dwh_create_script, dwh_insert_script = '', '', ''
    task = ETL(DB_PATH)
    for sheet in SHEETS:
        data = read_data_sheets(f'{folder_path}{file_name}', sheet_name=sheet)
        if 'Transactions' in sheet:
            table_stg = 'STG_TRANSACTIONS'
        else:
            if 'CustomerAddress' in sheet or 'CustomerDemographic' in sheet:
                table_name = '_'.join([sheet[:8].upper(), sheet[8:].upper()])
                table_stg = f'STG_{table_name}'
            else:
                print('No such table in database')

        task.initialize_stg(table_stg)
        print(f'create stg {table_stg}')
        task.insert_data2stg(table_stg, data)
        print(f'update stg {table_stg}')

    for table in DWH_TABLES:
        task.create_and_update_dwh(TABLES[table]['dwh_create'])
        print(f'create dwh {table}')
        task.create_and_update_dwh(TABLES[table]['dwh_insert'])
        print(f'update dwh {table}')


if __name__ == "__main__":

    input_path = 'input_data/'
    archive_path = 'archive/'

    input_files = os.listdir(input_path)
    archive_files = os.listdir(archive_path)

    new_files = [x for x in input_files if x + '.dump' not in archive_files]
    for i in new_files:
        run_etl(input_path, i)
#       shutil.copy(f"{input_path}{i}", f"{archive_path}{i}.dump")
