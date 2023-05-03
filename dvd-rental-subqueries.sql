-- Find customers who have made total payments > 175

SELECT customer_id, sum(amount) AS total_payments
FROM payment
GROUP BY customer_id
HAVING sum(amount) > 175;

-- Subquery getting our customer info

SELECT first_name, last_name
FROM customer;

-- Using the subquery

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING sum(amount) > 175
);

-- Find all the films that language is in English

SELECT language_id
FROM "language"
WHERE name = 'English';

SELECT title, description
FROM film
WHERE language_id IN (
	SELECT language_id
	FROM "language"
	WHERE name = 'English'
);

-- find every payment above the average payment

SELECT avg(amount)
FROM payment;

SELECT COUNT(amount), amount
FROM payment 
WHERE amount > (
	SELECT avg(amount) 
	FROM payment
)
GROUP BY amount
ORDER BY amount DESC;

-- Find all films with an actor with last name = Allen

SELECT first_name, last_name, actor_id
FROM actor
WHERE last_name = 'Allen';

SELECT film_id
FROM film_actor
WHERE actor_id IN (
	SELECT actor_id
	FROM actor
	WHERE last_name = 'Allen'
);

SELECT count(film_id)
FROM film
WHERE film_id IN (
	SELECT film_id
	FROM film_actor
	WHERE actor_id IN (
		SELECT actor_id
		FROM actor
		WHERE last_name = 'Allen'
	)
);