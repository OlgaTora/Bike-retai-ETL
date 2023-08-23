INSERT OR IGNORE INTO DWH_PRODUCTS (product_id, list_price, standard_cost,
                                             brand,
                                             product_line,
                                             product_class,
			product_size)			
SELECT product_id,
        list_price,
	CAST(standard_cost AS real) AS standard_cost,
	brand,
        product_line,
        product_class,
        product_size	
        
FROM STG_TRANSACTIONS
group by list_price;

