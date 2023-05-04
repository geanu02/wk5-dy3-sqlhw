-- Week 5 - Wednesday
-- Questions

-- 1. List all customers who live in Texas (use JOINs)

SELECT *
FROM customer AS c
JOIN address AS a
ON c.address_id = a.address_id
WHERE a.district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT 
	CONCAT(c.first_name, ' ', c.last_name) AS full_name,
	p.amount AS payment_amount
FROM payment AS p
JOIN customer AS c
ON p.customer_id = c.customer_id
WHERE p.amount > 6.99;

-- 3. Show all customers names who have made payments over $175 (use Subqueries)

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING sum(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city table) 

SELECT CONCAT(c.first_name, ' ', c.last_name) AS full_name
FROM city
JOIN address AS a
ON city.city_id = a.city_id
JOIN customer AS c
ON a.address_id = c.address_id
WHERE city.country_id = 66;

-- 5. Which staff member had the most transactions?

SELECT 
	CONCAT(s.first_name, ' ', s.last_name) AS full_name,
	COUNT(p.payment_id)
FROM staff AS s
JOIN payment AS p
ON s.staff_id = p.staff_id
GROUP BY s.first_name, s.last_name
ORDER BY count(p.payment_id) DESC;

-- 6. How many movies of each rating are there?

SELECT DISTINCT rating, COUNT(film_id) AS no_of_movies
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT DISTINCT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
);

-- 8. How many free rentals did our stores give away?

SELECT COUNT(r.rental_id)
FROM rental AS r
JOIN payment AS p
ON r.rental_id = p.rental_id
WHERE p.amount <= 0;