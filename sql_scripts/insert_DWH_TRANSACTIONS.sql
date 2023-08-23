INSERT OR IGNORE INTO DWH_TRANSACTIONS(
                    transaction_id,
					product_id,
					uniq_product_id,
					customer_id,
					transaction_date,
					online_order,
					order_status,
					product_first_sold_date
					)

SELECT CAST(transaction_id AS integer) AS transaction_id,
	CAST(product_id AS integer) AS product_id,
	CAST(uniq_product_id AS integer) AS uniq_product_id,
	CAST(customer_id AS integer) AS customer_id,
    date(transaction_date) AS transaction_date,
    COALESCE(online_order, 0),
   	date(COALESCE(product_first_sold_date, 0)) AS product_first_sold_date,
    order_status

FROM(
select * from STG_TRANSACTIONS as t
left join dwh_products as p
on t.list_price == t.list_price
and t.product_size == p.product_size
and t.product_class == p.product_class
and t.product_line == p.product_line
and t.brand == p.brand);
