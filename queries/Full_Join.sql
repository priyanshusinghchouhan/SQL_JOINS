/*
	Select name, role from staff and city, state from dealerships
	Join the staff table to dealerships using full join
		match the staff.dealership_id to dealerships.id
*/

-- SELECT name, role, city, state 
--  FROM staff
--  FULL JOIN dealerships ON dealership_id = dealerships.id;


/*
  List all salesperson and sold cars
*/

SELECT name, role, sold_price
 FROM staff 
 FULL JOIN sold_cars ON staff.id = seller;