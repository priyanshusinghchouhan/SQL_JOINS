-- JOINS B/W 2 tables.

/*
  Q1. Get the name and role of every staff member who has sold at least one car.
*/

SELECT DISTINCT name, role 
  FROM staff 
  INNER JOIN sold_cars ON sold_cars.seller = staff.id; 


/*
  Q2. Get each salesperson's name and the sold_price of every car they sold.
*/

SELECT name, role, sold_price 
  FROM staff
  INNER JOIN sold_cars ON sold_cars.seller = staff.id
WHERE role = 'Salesperson';


/*
  Q3. Get the brand, model, and sold date of every sold car.
*/

SELECT brand, model, sold_date 
  FROM cars
  INNER JOIN sold_cars ON sold_cars.cars_id = cars.id;


/*
   Q4. Get the names of all salespersons who have never sold a car.
*/

SELECT name, role
  FROM staff
  LEFT JOIN sold_cars ON sold_cars.seller = staff.id
WHERE sold_cars.seller IS NULL
   AND role = 'Salesperson';


/*
  Q5. Get every salesperson's name and the number of cars they have sold.
    Salespersons with 0 sales must also be included.
*/

SELECT name, role, COUNT(cars_id) AS total_cars_sold
  FROM staff
  LEFT JOIN sold_cars ON sold_cars.seller = staff.id
WHERE role = 'Salesperson'
GROUP BY name, role;