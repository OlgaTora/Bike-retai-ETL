INSERT OR IGNORE INTO DWH_TRANSACTIONS(
                    transaction_id,
					product_id,
					customer_id,
					transaction_date,
					online_order,
					order_status,
					brand,
					product_line,
					product_class,
					product_size,
                    list_price,
					standard_cost,
					product_first_sold_date
					)

SELECT CAST(transaction_id AS integer) AS transaction_id,
	CAST(product_id AS integer) AS product_id,
	CAST(customer_id AS integer) AS customer_id,
    CAST(transaction_date AS date) AS transaction_date,
    CAST(list_price AS real) AS list_price,
   	CAST(standard_cost AS real) AS standard_cost,
   	CAST(product_first_sold_date AS date) AS product_first_sold_date,
    online_order,
    order_status,
    brand,
	product_line,
	product_class,
	product_size
FROM   STG_TRANSACTIONS;
