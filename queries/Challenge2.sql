-- Joins b/w multiple tables

/*
  Q1. Get every dealership's city and the number of sold cars in that dealership.
    Include every dealership, even those with 0 sold cars.
*/

-- SELECT city, state, COUNT(sold_cars.id) AS sold_cars_count
--   FROM dealerships
--   LEFT JOIN cars ON cars.dealership_id = dealerships.id
--   LEFT JOIN sold_cars ON sold_cars.cars_id = cars.id
-- GROUP BY city, state;


/*
  Q2. Get the seller's name, dealership city, and sold_price for every sold car.
*/

-- SELECT name, city, sold_price 
--   FROM staff
--   INNER JOIN dealerships ON dealerships.id = staff.dealership_id
--   INNER JOIN sold_cars ON sold_cars.seller = staff.id;


/*
  Q3. Get the brand, model, seller's name, and dealership city for every sold car.
*/

-- SELECT name, brand, model, city, sold 
--   FROM sold_cars
--   LEFT JOIN cars ON cars.id = sold_cars.cars_id
--   INNER JOIN staff ON staff.id = sold_cars.seller
--   INNER JOIN dealerships ON dealerships.id = staff.dealership_id;


/*
  Q4. Get a list of every salesperson (name + role), along 
    with their dealership city and the date of their sale.
    A salesperson who has never sold anything should still appear,
    with NULL for the sale information.
*/

-- SELECT name, role, city, sold_date
--   FROM staff
--   LEFT JOIN sold_cars ON sold_cars.seller = staff.id
--   LEFT JOIN dealerships ON dealerships.id = staff.dealership_id
-- WHERE role = 'Salesperson';


/*
  Q5. Get every dealership's city and state, 
   along with the average price of cars currently 
   available at that dealership.
   Include dealerships that have no cars.
*/

-- SELECT city, state, ROUND(AVG(cars.price), 2) AS avg_price
--   FROM dealerships
--   LEFT JOIN cars ON cars.dealership_id = dealerships.id
-- GROUP BY city, state;

/*
  Q11. Tell me the names of salespersons who have sold more 
    than one car.
*/

-- SELECT name, role, COUNT(sold_cars.cars_id) AS count_sold_cars
--    FROM staff
--    INNER JOIN sold_cars ON sold_cars.seller = staff.id
-- GROUP BY name, role
-- HAVING COUNT(sold_cars.cars_id) > 1;


/*
  Q12. For every dealership, show:
   city
   state
   total cars
   sold cars
   unsold cars
  Even dealerships with no cars should appear.
*/

-- SELECT city, state, COUNT(cars.id) AS Total_Cars,
--   COUNT(sold_cars.cars_id) AS Sold_Cars,
--   COUNT(cars.id) - COUNT(sold_cars.cars_id) AS Unsold_Cars
-- FROM dealerships
--   LEFT JOIN cars ON cars.dealership_id = dealerships.id
--   LEFT JOIN sold_cars ON sold_cars.cars_id = cars.id
-- GROUP BY city, state;


/*
   How many cars have been sold by each dealership.
*/

SELECT city, state, COUNT(sold_cars.id) AS Total_Cars_sold
  FROM dealerships
  LEFT JOIN cars ON cars.dealership_id = dealerships.id
  LEFT JOIN sold_cars ON sold_cars.cars_id = cars.id
GROUP BY city, state;


SELECT
	D.city,
	D.state,
	COUNT(SC.id) AS cars_sold
FROM sold_cars SC
	LEFT JOIN cars C ON SC.cars_id = C.id
	RIGHT JOIN dealerships D ON C.dealership_id = D.id
GROUP BY D.city, D.state
ORDER BY cars_sold DESC;






