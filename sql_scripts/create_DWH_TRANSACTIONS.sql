CREATE TABLE if not exists DWH_TRANSACTIONS(
transaction_id integer primary key,
product_id integer,
uniq_product_id integer,
customer_id integer,
transaction_date date,
online_order varchar(128),
order_status varchar(128),
product_first_sold_date date,
create_dt date,
update_dt date,

FOREIGN KEY(uniq_product_id) REFERENCES DWH_PRODUCTS(uniq_product_id),
FOREIGN KEY(customer_id) REFERENCES DWH_CUSTOMERS(customer_id));

CREATE TRIGGER if not exists update_trigger_DWH_TRANSACTIONS AFTER UPDATE ON DWH_TRANSACTIONS
 BEGIN
  update DWH_TRANSACTIONS SET update_dt = current_timestamp WHERE transaction_id = NEW.transaction_id;
 END;

CREATE TRIGGER if not exists insert_trigger_DWH_TRANSACTIONS AFTER INSERT ON DWH_TRANSACTIONS
 BEGIN
  update DWH_TRANSACTIONS SET (create_dt, update_dt) = (current_timestamp,current_timestamp) WHERE transaction_id = NEW.transaction_id;
 END;
