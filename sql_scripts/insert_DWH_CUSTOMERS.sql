INSERT OR IGNORE INTO DWH_CUSTOMERS(
                    customer_id,
					first_name,
					last_name,
					gender,
					address,
					postcode, 
					state,
					country,
					property_valuation,
                    past_3_years_bike_related_purchases,
					DOB,
					job_title,
					job_industry_category,
					wealth_segment,
					deceased_indicator,
					owns_car)
					
SELECT CAST(customer_id AS integer) AS customer_id,
	CAST(postcode AS integer) AS postcode,
	CAST(past_3_years_bike_related_purchases AS integer) AS past_3_years_bike_related_purchases,
    DOB,
	first_name,
	last_name,
	gender,
	address,
	state,
	country,
	property_valuation,
	job_title,
	job_industry_category,
	wealth_segment,
	deceased_indicator,
	owns_car
        
FROM (
SELECT * FROM STG_TRANSACTIONS as t LEFT JOIN
STG_CUSTOMER_DEMOGRAPHIC AS cd ON t.customer_id == cd.customer_id)
LEFT JOIN STG_CUSTOMER_ADDRESS AS ca ON cd.customer_id == ca.customer_id AS new_table)
;

LECT tracks.title, albums.title, artist.name  FROM tracks LEFT JOIN
 Albums ON tracks.album_id = albums.id
 LEFT JOIN artist ON albums.artist_id = artist.id;