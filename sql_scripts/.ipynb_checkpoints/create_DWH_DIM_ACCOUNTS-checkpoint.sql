CREATE TABLE if not exists DWH_DIM_ACCOUNTS(
    account   varchar(128) primary key,
    valid_to  date,
    client    INTEGER,
    create_dt date,
    update_dt date,
FOREIGN KEY(client) REFERENCES DWH_FACT_CLIENTS(client_id));


CREATE TRIGGER if not exists update_trigger_DWH_DIM_ACCOUNTS AFTER UPDATE ON DWH_DIM_ACCOUNTS
 BEGIN
  update DWH_DIM_ACCOUNTS SET update_dt = current_timestamp WHERE account = NEW.account;
 END;

CREATE TRIGGER if not exists insert_trigger_DWH_DIM_ACCOUNTS AFTER INSERT ON DWH_DIM_ACCOUNTS
 BEGIN
  update DWH_DIM_ACCOUNTS SET (create_dt, update_dt) = (current_timestamp,current_timestamp) WHERE account = NEW.account;
 END;