DROP TABLE if exists STG_TERMINALS;
CREATE TABLE if not exists STG_TERMINALS(
terminal_id varchar(128), 
terminal_type varchar(128),
terminal_city varchar(128),
terminal_address varchar(128));