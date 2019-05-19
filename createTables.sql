DROP TABLE IF EXISTS admins;

DROP TABLE IF EXISTS trucks;

DROP TABLE IF EXISTS drivers CASCADE;

DROP TABLE IF EXISTS loads CASCADE;

DROP TABLE IF EXISTS load_item CASCADE;

-- create table for administrators

CREATE TABLE admins (
  admin_id int NOT NULL PRIMARY KEY,
  first_name varchar(25) NOT NULL,
  last_name varchar(25) NOT NULL,
  email varchar(25) NOT NULL,
  PASSWORD varchar(25) NOT NULL
);

-- Create table for trucks

CREATE TABLE trucks (
  truck_id int NOT NULL PRIMARY KEY,
  truck_make varchar(10) NOT NULL,
  truck_model varchar(10) NOT NULL,
  truck_year int NOT NULL
);

-- Create table for drivers

CREATE TABLE drivers (
  driver_id int NOT NULL PRIMARY KEY,
  first_name varchar(25) NOT NULL,
  last_name varchar(25) NOT NULL,
  phone_number varchar(25) NOT NULL,
  truck_id int REFERENCES trucks (truck_id)
);

-- Create table for loads

CREATE TABLE loads (
  load_id int NOT NULL PRIMARY KEY,
  driver_id int NOT NULL REFERENCES drivers (driver_id),
  pickup_date date NOT NULL,
  pickup_address varchar NOT NULL,
  delivery_date date NOT NULL,
  delivery_address varchar NOT NULL,
  special_instructions varchar
);

-- create table for load items

CREATE TABLE load_item (
  load_item_id int NOT NULL PRIMARY KEY,
  load_id int NOT NULL REFERENCES loads (load_id),
  vehicle_make varchar,
  vehicle_model varchar,
  vehicle_year int,
  vehicle_vin int,
  vehicle_innoperable BOOLEAN,
  notes VARCHAR
);

