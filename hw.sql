

-- 1. How many actors are there with the last name ‘Wahlberg’?
-- 2 actors

SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
--4802 payments

SELECT count(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
-- The store has the most copies of film_id: 1 (1489 copies)
SELECT inventory_id, COUNT(film_id) as copies
FROM inventory 
GROUP BY inventory_id
ORDER BY copies
LIMIT 1;



-- 4. How many customers have the last name ‘William’?
--0 Customers

SELECT last_name
FROM customer
WHERE last_name = 'William';



-- 5. What store employee (get the id) sold the most rentals?
-- Staff_id: 1 , sold the most rentals (8040 rentals)
SELECT staff_id, COUNT(rental_id) as rentals
FROM rental 
GROUP BY staff_id
ORDER BY rentals DESC
LIMIT 1;


-- 6. How many different district names are there?
--378 district names
SELECT count(DISTINCT district)
FROM address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- Film id: 508 (with 15 actors)
SELECT film_id, COUNT((actor_id)) AS actors
FROM film_actor
GROUP BY film_id 
ORDER BY actors DESC 
LIMIT 1;



-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- 13 customers
SELECT customer_id, last_name
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';



-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)

--3 payment amounts (2.99, 6.99, 4.99)
SELECT amount, COUNT(rental_id) as rentals
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;


-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
-- There are 5 rating categories, and there are the most PG-13 rated movies (223 movies)

SELECT COUNT(DISTINCT rating)
FROM film;

SELECT rating, count(film_id) as movies
FROM film
GROUP BY rating
ORDER BY movies;



