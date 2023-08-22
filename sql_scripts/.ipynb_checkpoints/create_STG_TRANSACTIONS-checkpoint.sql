DROP TABLE if exists STG_TRANSACTIONS;
CREATE TABLE if not exists STG_TRANSACTIONS(
transaction_id varchar(128), 
transaction_date varchar(128),
amount varchar(128),
card_num varchar(128), 
oper_type varchar(128),
oper_result varchar(128),
terminal varchar(128));