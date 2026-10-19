SELECT name, role, city, state
FROM staff s
RIGHT JOIN dealerships d ON s.dealership_id = d.id;