CREATE TABLE if not exists DWH_FACT_CLIENTS(
    client_id         varchar(128) primary key,
    last_name         varchar(128),
    first_name        varchar(128),
    patronymic        varchar(128),
    date_of_birth     date,
    passport_num      varchar(128),
    passport_valid_to date,
    phone             varchar(128),
    create_dt         date,
    update_dt         date);


CREATE TRIGGER if not exists update_trigger_DWH_FACT_CLIENTS AFTER UPDATE ON DWH_FACT_CLIENTS
 BEGIN
  update DWH_FACT_CLIENTS SET update_dt = current_timestamp WHERE client_id = NEW.client_id;
 END;

CREATE TRIGGER if not exists insert_trigger_DWH_FACT_CLIENTS AFTER INSERT ON DWH_FACT_CLIENTS
 BEGIN
  update DWH_FACT_CLIENTS SET (create_dt, update_dt) = (current_timestamp,current_timestamp) WHERE client_id = NEW.client_id;
 END;