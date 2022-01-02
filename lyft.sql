-- Q1 Let’s examine the three tables.
SELECT * FROM trips;
-- Columns are: id(primary key), date, pickup, dropoff, rider_id, car_id, type, cost
SELECT * FROM riders; 
-- Columns are: id(primary key), first, last, username, rating, total_trips, referred
SELECT * FROM cars;
-- Columns are: id(primary key), model, OS, status, trips_completed

-- Q3 Try out a simple cross join between riders and cars.
SELECT * 
FROM riders
CROSS JOIN cars;

-- Q4 Find the columns to join between trips and riders and combine the two tables using a LEFT JOIN.
SELECT *
FROM trips
LEFT JOIN riders
ON trips.rider_id = riders.id;

-- Q5: Suppose we want to create a link between the trips and the cars used during those trips.
SELECT *
FROM riders
LEFT JOIN trips
ON trips.rider_id = riders.id;

-- Q4
  SELECT trips.date, 
   trips.pickup, 
   trips.dropoff, 
   trips.type, 
   trips.cost,
   riders.first, 
   riders.last,
   riders.username
FROM trips
LEFT JOIN riders 
  ON trips.rider_id = riders.id;

-- Q5
SELECT * 
FROM trips
INNER JOIN cars
  ON trips.car_id = cars.id;

-- Q6: Stack the riders table on top of the new table named riders2.
SELECT * 
FROM riders

UNION 

SELECT * 
FROM riders2;

-- Q7: What is the average cost for a trip?
SELECT AVG(cost)
FROM trips;
-- The average cost per trip is $31.92 

-- Q8: Find all the riders who have used Lyft less than 500 times!
SELECT *
FROM riders
WHERE total_trips < 500;
-- There are two riders who have used Lyft less than 500 times 

-- Q9: Calculate the number of cars that are active.
SELECT COUNT(*)
FROM cars
WHERE status = 'active';
-- There are three cars that are active

-- Q10: Write a query that finds the two cars that have the highest trips_completed.
SELECT * 
FROM cars 
ORDER BY trips_completed DESC
LIMIT 2; 
-- The two cars that have the highest trips_completed are Turing XL and Ada

-- Extra Query: 
WITH total_riders AS (
  SELECT * 
  FROM riders
UNION 
  SELECT * 
  FROM riders2
)
SELECT *
FROM total_riders
ORDER BY rating DESC;

