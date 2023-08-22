INSERT OR IGNORE INTO DWH_TRANSACTIONS(
                    transaction_id,
					product_id,
					customer_id,
					transaction_date,
					online_order,
					order_status)
					
SELECT CAST(transaction_id AS integer) AS transaction_id,
	CAST(product_id AS integer) AS product_id,
	CAST(customer_id AS integer) AS customer_id,
        transaction_date,
        online_order,
        order_status
FROM   STG_TRANSACTIONS;

