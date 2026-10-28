/*
	Select the city and average car price
	Round that car price to a whole number
	
	Only show dealerships which have cars
	
	Group by dealership city and state
*/

-- SELECT ROUND(AVG(price), 2) AS avg_price, city, state
--   FROM cars
--   LEFT JOIN dealerships ON dealership_id = dealerships.id
-- GROUP BY city, state;


/*
  How much money has each salesperson made ?
*/

-- SELECT name, role, SUM(sold_price) AS money_earned
--  FROM staff
--  LEFT JOIN sold_cars ON staff.id = seller
-- WHERE role = 'Salesperson'
-- GROUP BY name, role
-- ORDER BY money_earned ASC;

/*
  How many unsold cars do we have in each of our dealerships ?
  Include every single dealership
*/

SELECT city, state, COUNT(cars.id) AS car_count 
 FROM cars
 FULL JOIN dealerships ON dealerships.id = dealership_id
WHERE sold IS NOT TRUE
GROUP BY city, state
ORDER BY car_count ASC;

