
# VEHICLE RENTAL SYSTEM (SQL)

This project shows some SQL operations on Vehicle Rental System. There are two roles here - Admin & Customer. Initially there are tables of some users and vehicles. Then the booking table comes. Booking table has two references from users and vehicles table.
Here is the table structures given below: 
 



## Table Structures

### Users Table (Demo)

- `user_id` : INT **PRIMARY KEY**
- `name` : VARCHAR
- `email`: VARCHAR
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
- `type`: VARCHAR
- `model`: VARCHAR
- `registration_number`: VARCHAR (enum: "Admin", "Customer")
- `rental_price`: VARCHAR (enum: "Admin", "Customer")
- `status`: VARCHAR (enum: "Admin", "Customer")

| vehicle_id | name | type | model | registration_number | rental_price | status |
| :--------: | :---- | :--- | :----- | :----- | :----- | :----- |
| 1 | Toyota Aspire | car   | 2017 |DHA-3001| 5500 | available|
| 2 |	Honda Civic   |	car	  | 2021 |DEF-4568|	6000|	rented|
| 3 |	Yamaha R15    |	bike	| 2023 |GHI-7890|	2500	|available|
| 4	| Ford F-150    |	truck	| 2020 |JKL-6587|	7000|	maintenance|

### Bookings Table (Demo)


| booking_id | user_id | vehicle_id | start_date | end_date | status | total_cost|
| :-------- | :------ | :------- | :-------| :--------| :------- | :---------|
|1|	1|	2|	2025-10-01|	2025-10-05|	completed	|24000|
|2|	1|	2|	2025-11-01|	2025-11-03|	completed	|12000|
|3|	3|	3|	2025-12-01|	2025-12-02|	confirmed	|2500|
|4|	1|	4|	2025-12-10|	2025-12-12|	pending	|14000|



