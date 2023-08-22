CREATE TABLE if not exists DWH_CUSTOMERS(
customer_id integer primary key,
first_name varchar(128),
last_name varchar(128),
gender varchar(128),
address varchar(128),
postcode integer, 
state varchar(128),
country varchar(128),
property_valuation varchar(128),
past_3_years_bike_related_purchases integer,
DOB date,
job_title varchar(128),
job_industry_category varchar(128),
wealth_segment varchar(128),
deceased_indicator varchar(6),
owns_car varchar(6),
tenure integer,
create_dt date,
update_dt date);


CREATE TRIGGER if not exists update_trigger_DWH_CUSTOMERS AFTER UPDATE ON DWH_CUSTOMERS
 BEGIN
  update DWH_CUSTOMERS SET update_dt = current_timestamp WHERE customer_id = NEW.customer_id;
 END;

CREATE TRIGGER if not exists insert_trigger_DWH_CUSTOMERS AFTER INSERT ON DWH_CUSTOMERS
 BEGIN
  update DWH_CUSTOMERS SET (create_dt, update_dt) = (current_timestamp,current_timestamp) WHERE customer_id = NEW.customer_id;
 END;
