-- 1. Add the column (initially nullable)
/* 
   We use the ALTER TABLE keywords and the table name cars
   to add this new column, the dealership ID, which will be an integer.
   Now that's gonna add the column to our cars table.
   The data that exists already will have null values for dealership ID. So, no point to adding NOT NULL keywords for now.
*/

ALTER TABLE cars
ADD COLUMN dealership_id INTEGER;


-- 2. Insert data to backfill the dealership_id column

UPDATE cars 
  SET dealership_id = 1
  WHERE dealership_id IS NULL;

-- 3. Add the NOT NULL constraint
ALTER TABLE cars
ALTER COLUMN dealership_id SET NOT NULL;

-- 4. Add the foreign key constraint to dealership_id 
ALTER TABLE cars
ADD CONSTRAINT dealership_fk FOREIGN KEY (dealership_id)
REFERENCES dealerships(id);


/*
	Alter the cars table
		add a not null constraint to these columns:
			brand
			model
			year
			price
			color
			condition
			sold
*/

ALTER TABLE cars
ALTER COLUMN brand SET NOT NULL,
ALTER COLUMN  model SET NOT NULL,
ALTER COLUMN  year SET NOT NULL,
ALTER COLUMN  price SET NOT NULL,
ALTER COLUMN  color SET NOT NULL,
ALTER COLUMN  condition SET NOT NULL,
ALTER COLUMN  sold SET NOT NULL;
