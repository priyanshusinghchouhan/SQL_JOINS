SELECT name, role, city, state
FROM staff s
LEFT JOIN dealerships d ON s.dealership_id = d.id;