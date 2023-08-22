INSERT OR IGNORE INTO DWH_PRODUCTS (product_id, 
					brand,
					product_line,
					product_class,
					product_size,
					list_price, 	
					standard_cost,
					product_first_sold_date)
					
SELECT CAST(product_id AS integer) AS product_id,
	CAST(standard_cost AS real) AS standard_cost,
	CAST(list_price AS real) AS list_price, 	 	
        product_first_sold_date,
        brand,
        product_line,
        product_class,
        product_size
FROM STG_TRANSACTIONS;

