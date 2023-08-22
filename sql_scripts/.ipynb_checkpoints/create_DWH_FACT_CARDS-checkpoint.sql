CREATE TABLE if not exists DWH_FACT_CARDS(
card_num varchar(128) primary key, 
account varchar(128),
create_dt date,
update_dt date,
FOREIGN KEY(account) REFERENCES DWH_DIM_TERMINALS(terminal_id));


CREATE TRIGGER if not exists update_trigger_DWH_FACT_CARDS AFTER UPDATE ON DWH_FACT_CARDS
 BEGIN
  update DWH_FACT_CARDS SET update_dt = current_timestamp WHERE card_num = NEW.card_num;
 END;

CREATE TRIGGER if not exists insert_trigger_DWH_FACT_CARDS AFTER INSERT ON DWH_FACT_CARDS
 BEGIN
  update DWH_FACT_CARDS SET (create_dt, update_dt) = (current_timestamp,current_timestamp) WHERE card_num = NEW.card_num;
 END;