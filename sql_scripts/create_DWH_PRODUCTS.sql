CREATE TABLE if not exists DWH_PRODUCTS(
uniq_product_id integer primary key autoincrement, 
product_id integer,
brand varchar(128),
product_line varchar(128),
product_class varchar(128),
product_size varchar(128),
list_price real unique,
standard_cost real);

