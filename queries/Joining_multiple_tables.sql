/*
  Can you get me a list of Sold cars with seller's
  name, city and the date of the sale ?
*/ 

-- SELECT
-- 	C.brand,
-- 	C.model,
--     C.sold,
-- 	S.name AS seller_name,
-- 	D.city,
-- 	TO_CHAR(SC.sold_date, 'DD-MM-YYYY') AS date_of_sale
-- FROM sold_cars SC
-- 	INNER JOIN cars C ON SC.cars_id = C.id
--     LEFT JOIN staff S ON SC.seller = S.id
--     LEFT JOIN dealerships D ON S.dealership_id = D.id;


/*
   Tell me who hasn't sold cars.
*/

SELECT name, role, city 
  FROM sold_cars
  FULL JOIN staff ON staff.id = sold_cars.seller
  LEFT JOIN dealerships ON dealerships.id = staff.dealership_id
 WHERE sold_cars.id IS NULL  
  AND staff.role = 'Salesperson';
  
/*
   How many cars have been sold by each dealership.
*/

SELECT
	D.city,
	D.state,
	COUNT(SC.id) AS cars_sold
FROM sold_cars SC
	LEFT JOIN cars C ON SC.cars_id = C.id
	RIGHT JOIN dealerships D ON C.dealership_id = D.id
GROUP BY D.city, D.state
ORDER BY cars_sold DESC;