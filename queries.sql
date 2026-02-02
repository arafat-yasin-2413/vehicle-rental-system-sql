create database vehicle_rental_system

create table users (
  user_id serial primary key,
  name varchar(150) not null,
  email varchar(100) unique not null,
  phone varchar(20) not null,
  role varchar(20) not null check (role in ('Admin', 'Customer'))
)


create table vehicles (
  vehicle_id serial primary key,
  name varchar(150) not null,
  type varchar(50) not null check (type in ('car', 'bike', 'truck')),
  model varchar(100) not null,
  registration_number varchar(50) unique not null,
  rental_price numeric(10,2) not null,
  status varchar(50) not null check (status in ('available', 'rented', 'maintenance'))
)


create table bookings (
  booking_id serial primary key,
  user_id int references users(user_id) on delete cascade,
  vehicle_id int references vehicles(vehicle_id) on delete cascade,
  start_date date not null,
  end_date date not null check (end_date > start_date),
  status varchar(50) not null check (status in ('pending', 'confirmed', 'completed', 'cancelled')),
  total_cost numeric(10,2) not null
)




-- problem 1 : Retrieve booking information along with:
-- Customer name
-- Vehicle name
-- Concepts used: INNER JOIN

select 
bk.booking_id, 
usr.name as customer_name, 
vh.name as vehicle_name, 
bk.start_date, 
bk.end_date, 
bk.status 

from bookings as bk

inner join users as usr on bk.user_id = usr.user_id 
inner join vehicles as vh on bk.vehicle_id = vh.vehicle_id;


-- problem 2 : Find all vehicles that have never been booked.
-- Concepts used: NOT EXISTS

select vehicle_id, name, type, model, registration_number, rental_price, status
from vehicles
where not exists (
  select 1 
  from bookings 
  where bookings.vehicle_id = vehicles.vehicle_id
)
order by vehicle_id asc

-- probleem 3 : Retrieve all available vehicles of a specific type (e.g. cars).
-- Concepts used: SELECT, WHERE

select *
from vehicles 
where type = 'car'

-- problem 4 : Find the total number of bookings for each vehicle 
-- and display only those vehicles that have more than 2 bookings.
-- Concepts used: GROUP BY, HAVING, COUNT

select 
vh.name as vehicle_name, 
count(bk.booking_id) as total_bookings

from bookings as bk

inner join vehicles as vh
on bk.vehicle_id = vh.vehicle_id
  
group by (bk.vehicle_id, vh.name)
having count(bk.vehicle_id) > 2;















