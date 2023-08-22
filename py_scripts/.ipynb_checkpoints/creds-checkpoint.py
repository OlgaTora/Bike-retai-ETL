tables_info = {
    'TRANSACTIONS': {'std': './sql_scripts/create_STG_TRANSACTIONS.sql',
                    'dwh_create': './sql_scripts/create_DWH_FACT_TRANSACTIONS.sql',
                    'dwh_insert': './sql_scripts/insert_DWH_FACT_TRANSACTIONS.sql'},

    'PASSPORT_BLACKLIST': {'std': './sql_scripts/create_STG_PASSPORT_BLACKLIST.sql',
                    'dwh_create': './sql_scripts/create_DWH_FACT_PASSPORT_BLACKLIST.sql',
                    'dwh_insert': './sql_scripts/insert_DWH_FACT_PASSPORT_BLACKLIST.sql'},

    'TERMINALS': {'std': './sql_scripts/create_STG_TERMINALS.sql',
                    'dwh_create': './sql_scripts/create_DWH_DIM_TERMINALS.sql',
                    'dwh_insert': './sql_scripts/insert_DWH_DIM_TERMINALS.sql'},

    'CLIENTS': {'dwh_create': 'sql_scripts/create_DWH_FACT_CLIENTS.sql',
                'dwh_insert': 'sql_scripts/insert_DWH_FACT_CLIENTS.sql'},


    'ACCOUNTS': {'dwh_create': 'sql_scripts/create_DWH_DIM_ACCOUNTS.sql',
                 'dwh_insert': 'sql_scripts/insert_DWH_DIM_ACCOUNTS.sql'},

    'CARDS': {
                'dwh_create': 'sql_scripts/create_DWH_FACT_CARDS.sql',
                'dwh_insert': 'sql_scripts/insert_DWH_FACTS_CARDS.sql'

              }

}

DB_PATH = 'mydb.db'