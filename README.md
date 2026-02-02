
# VEHICLE RENTAL SYSTEM (SQL)

This project shows some SQL operations on Vehicle Rental System. There are two roles here - Admin & Customer. Initially there are tables of some users and vehicles. Then the booking table comes. Booking table has two references from users and vehicles table. Here I have used `PostgreSQL` as my database.
Here is the table structures given below: 
 






## Table Structures

### Users Table (Demo)

- `user_id` : INT **PRIMARY KEY**
- `name` : VARCHAR
- `email`: VARCHAR UNIQUE
- `phone`: VARCHAR
- `role`: VARCHAR (enum: "Admin", "Customer")

| user_id   | name         | email              | phone        | role     |
| :--------:| :----------- | :----------------- | :------------| :--------|
| 1         | Rahim Khan   | rahim@gmail.com    | 01766 543423 | Customer |
| 2         | Karim Hasan  | karim@gmail.com    | 01876 665533 | Admin    |
| 3         | Sadik Hossen | sadik@gmail.com    | 01755 446677 | Customer |
| 4 | Sajid Islam | sajid@gmail.com | 01877 555666 | Customer|



### Vehicles Table (Demo)
- `vehicle_id` : INT **PRIMARY KEY**
- `name` : VARCHAR
- `type`: VARCHAR (enum: "card", "truck", "bike")
- `model`: VARCHAR
- `registration_number`: VARCHAR UNIQUE
- `rental_price`: NUMERIC(10,2)
- `status`: VARCHAR (enum: "Admin", "Customer")

| vehicle_id | name | type | model | registration_number | rental_price | status |
| :--------: | :---- | :--- | :----- | :----- | :----- | :----- |
| 1 | Toyota Aspire | car   | 2017 |DHA-3001| 5500 | available|
| 2 |	Honda Civic   |	car	  | 2021 |DEF-4568|	6000|	rented|
| 3 |	Yamaha R15    |	bike	| 2023 |GHI-7890|	2500	|available|
| 4	| Ford F-150    |	truck	| 2020 |JKL-6587|	7000|	maintenance|

### Bookings Table (Demo)
- `booking_id` : INT **PRIMARY KEY**
- `user_id` : INT **FOREIGN KEY**
- `vehicle_id`: INT **FOREIGN KEY**
- `start_date`: DATE
- `end_date`: DATE
- `status`: VARCHAR (enum: "pending", "confirmed", "completed", "cancelled")
- `total_cost`: NUMERIC(10,2)

| booking_id | user_id | vehicle_id | start_date | end_date | status | total_cost|
| :-------- | :------ | :------- | :-------| :--------| :------- | :---------|
|1|	1|	2|	2025-10-01|	2025-10-05|	completed	|24000|
|2|	1|	2|	2025-11-01|	2025-11-03|	completed	|12000|
|3|	3|	3|	2025-12-01|	2025-12-02|	confirmed	|2500|
|4|	1|	4|	2025-12-10|	2025-12-12|	pending	|14000|
|5| 1|  1|  2025-12-14| 2025-12-17| cancelled| 16500|




## Relations

- One user can have multiple booking instances : 1 to Many
- A single vehicle can be linked with multiple booking instances : 1 to Many
- Each row of the bookings table can link with only 1 userId : 1 to 1
- Each row of the bookings table can link with only 1 vehicleId : 1 to 1

## SQL Queries
### Query 1: JOIN
Retrieve booking information along with:

- Customer name
- Vehicle name

**Concepts used**: INNER JOIN

### Query 2: EXISTS
Find all vehicles that have never been booked.

**Concepts used**: NOT EXISTS

### Query 3: WHERE
Retrieve all available vehicles of a specific type (e.g. cars).

**Concepts used**: SELECT, WHERE

### Query 4: GROUP BY and HAVING
Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

**Concepts used**: GROUP BY, HAVING, COUNT


------------------
#### Thanks for reading the whole document. 