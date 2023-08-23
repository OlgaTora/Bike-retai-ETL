DB_PATH = 'bike.db'

SHEETS = ['Transactions', 'CustomerAddress', 'CustomerDemographic']
DWH_TABLES = ['PRODUCTS', 'TRANSACTIONS', 'CUSTOMERS']

TABLES = {
    'TRANSACTIONS': {'std': './sql_scripts/create_STG_TRANSACTIONS.sql',
                     'dwh_create': './sql_scripts/create_DWH_TRANSACTIONS.sql',
                     'dwh_insert': './sql_scripts/insert_DWH_TRANSACTIONS.sql'},

    'CUSTOMERS': {'dwh_create': './sql_scripts/create_DWH_CUSTOMERS.sql',
                  'dwh_insert': './sql_scripts/insert_DWH_CUSTOMERS.sql'},

    'PRODUCTS': {'dwh_create': './sql_scripts/create_DWH_PRODUCTS.sql',
                 'dwh_insert': './sql_scripts/insert_DWH_PRODUCTS.sql'},

    'CUSTOMER_ADDRESS': {'std': './sql_scripts/create_STG_CUSTOMER_ADDRESS.sql'},

    'CUSTOMER_DEMOGRAPHIC': {'std': './sql_scripts/create_STG_CUSTOMER_DEMOGRAPHIC.sql'},
}
