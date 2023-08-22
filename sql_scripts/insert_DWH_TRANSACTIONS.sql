INSERT OR IGNORE INTO DWH_TRANSACTIONS(
                    transaction_id,
					product_id,
					customer_id,
					transaction_date,
					list_price,
					standard_cost,
					product_first_sold_date,
					online_order,
					order_status,
					brand,
					product_line,
					product_class,
					product_size
					)

SELECT CAST(transaction_id AS integer) AS transaction_id,
	CAST(product_id AS integer) AS product_id,
	CAST(customer_id AS integer) AS customer_id,
    date(transaction_date) AS transaction_date,
    CAST(list_price AS real) AS list_price,
   	CAST(COALESCE(standard_cost, 0) AS real) AS standard_cost,
   	date(COALESCE(product_first_sold_date, 0)) AS product_first_sold_date,
    COALESCE(online_order, 0),
    COALESCE(brand, 0),
	COALESCE(product_line, 0),
	COALESCE(product_class, 0),
	COALESCE(product_size, 0),
    order_status

FROM STG_TRANSACTIONS;
