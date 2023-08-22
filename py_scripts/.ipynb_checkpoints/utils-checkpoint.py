import pandas as pd


def read_data(path: str) -> pd.DataFrame:
    name = path.split('.')
    if name[-1] == 'xlsx':
        return pd.read_excel(path)
    elif name[-1] == 'txt':
        return pd.read_csv(path, sep=';')
    elif name[-1] == 'dump':
        return read_data(".".join(name[:-1]))
