import pandas as pd


def read_data_sheets(path: str, sheet_name: str) -> pd.DataFrame:
    """Function for read file sheets and resolve problem with name 'default"""
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
    """Function for open sql script"""
    with open(file_path, 'r') as sql_file:
        return sql_file.read()


def format_date(df: pd.DataFrame):
    "Function to modify uncorrect date format."
    if 'product_first_sold_date' in df.columns:
        df['product_first_sold_date'] = (
            pd.to_datetime("1900-01-01") + pd.to_timedelta(df['product_first_sold_date'], unit="D"))
