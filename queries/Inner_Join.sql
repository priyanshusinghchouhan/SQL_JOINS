-- SELECT name, role, city, state 
--  FROM staff
--  INNER JOIN dealerships ON dealership_id = dealerships.id;


/*
	Show the staff and the sales they made.	
*/
SELECT name, role, sold_date, sold_price
  FROM staff
  INNER JOIN sold_cars ON staff.id = sold_cars.seller;


