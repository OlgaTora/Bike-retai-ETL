CREATE TABLE if not exists DWH_FACT_TRANSACTIONS(
transaction_id BIGINT primary key, 
transaction_date timestamp,
amount real,
card_num varchar(128), 
oper_type varchar(128),
oper_result varchar(128),
terminal varchar(128),
create_dt date,
update_dt date,
FOREIGN KEY(terminal) REFERENCES DWH_DIM_TERMINALS(terminal_id)
FOREIGN KEY(card_num) REFERENCES DWH_FACTS_CARDS(card_num));


CREATE TRIGGER if not exists update_trigger_DWH_FACT_TRANSACTIONS AFTER UPDATE ON DWH_FACT_TRANSACTIONS
 BEGIN
  update DWH_FACT_TRANSACTIONS SET update_dt = current_timestamp WHERE transaction_id = NEW.transaction_id;
 END;

CREATE TRIGGER if not exists insert_trigger_DWH_FACT_TRANSACTIONS AFTER INSERT ON DWH_FACT_TRANSACTIONS
 BEGIN
  update DWH_FACT_TRANSACTIONS SET (create_dt, update_dt) = (current_timestamp,current_timestamp) WHERE transaction_id = NEW.transaction_id;
 END;