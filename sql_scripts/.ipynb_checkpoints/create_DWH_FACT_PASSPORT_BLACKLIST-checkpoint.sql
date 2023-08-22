CREATE TABLE if not exists DWH_FACT_PASSPORT_BLACKLIST( 
passport varchar(128) primary key,
date date,
create_dt date,
update_dt date);
 
CREATE TRIGGER if not exists update_trigger_DWH_FACT_PASSPORT_BLACKLIST AFTER UPDATE ON DWH_FACT_PASSPORT_BLACKLIST
 BEGIN
  update DWH_FACT_PASSPORT_BLACKLIST SET update_dt = current_timestamp WHERE passport = NEW.passport;
 END;

CREATE TRIGGER if not exists insert_trigger_DWH_FACT_PASSPORT_BLACKLIST AFTER INSERT ON DWH_FACT_PASSPORT_BLACKLIST
 BEGIN
  update DWH_FACT_PASSPORT_BLACKLIST SET (create_dt, update_dt) = (current_timestamp,current_timestamp) WHERE passport = NEW.passport;
 END;