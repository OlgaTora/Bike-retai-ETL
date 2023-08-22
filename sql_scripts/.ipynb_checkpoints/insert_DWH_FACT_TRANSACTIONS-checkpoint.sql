INSERT OR IGNORE INTO DWH_FACT_TRANSACTIONS (transaction_id,
                                   transaction_date,amount,
                                   card_num, oper_type, oper_result, terminal

                                   )
SELECT cast(transaction_id as bigint) as transaction_id,
        datetime(transaction_date) as transaction_date,
        cast(amount as real) as amount,
        card_num , oper_type, oper_result,terminal
FROM   STG_TRANSACTIONS;