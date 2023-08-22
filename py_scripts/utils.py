import pandas as pd
import openpyxl


def read_data_sheets(path: str, sheet_name: str) -> pd.DataFrame:
    name = path.split('.')
    if name[-1] == 'xlsx':
        data = pd.read_excel(path, sheet_name)
        for column in list(data):
            if column == 'default':
                data = data.rename(columns={'default': 'default_'})
        return data
    else:
        print('File have to be in excel ')


def open_sql_file(file_path: str) -> str:
    with open(file_path, 'r') as sql_file:
        return sql_file.read()

    # elif name[-1] == 'txt':
    #    return pd.read_csv(path, sep=';')
    # elif name[-1] == 'dump':
    #    return read_data_sheets(".".join(name[:-1]))
