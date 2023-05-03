-- find first last name of all actors in film alice fantasia


SELECT a.first_name, a.last_name
FROM film AS f
JOIN film_actor AS fa
ON f.film_id = fa.film_id
JOIN actor AS a
ON fa.actor_id = a.actor_id
WHERE f.title = 'Alice Fantasia';

-- find the name of all the films in the category: animation

SELECT f.title
FROM category AS ca
JOIN film_category AS fc
ON ca.category_id = fc.category_id
JOIN film AS f
ON fc.film_id = f.film_id
WHERE ca.name = 'Animation';

-- find all staff who lives in Canada

SELECT st.first_name, st.last_name
FROM country AS co
JOIN city AS ci
ON co.country_id = ci.country_id
JOIN address AS ad
ON ci.city_id = ad.city_id
JOIN staff AS st
ON ad.address_id = st.address_id
WHERE co.country = 'Canada';

-- How many times have movies feature Nick Wahlberg been rented?

SELECT *
FROM actor
WHERE last_name = 'Wahlberg';

SELECT CONCAT(a.first_name, ' ', a.last_name) AS full_name,
	COUNT(r.rental_date) AS no_of_rentals
FROM rental AS r
JOIN inventory AS i
ON r.inventory_id = i.inventory_id
JOIN film AS f
ON i.film_id = f.film_id
JOIN film_actor AS fa
ON f.film_id = fa.film_id
JOIN actor AS a
ON fa.actor_id = a.actor_id
WHERE a.first_name = 'Nick' AND a.last_name = 'Wahlberg'
GROUP BY a.first_name, a.last_name;

-- Find the first and last names of all Cambodian customers who 
-- rented a movie starting with the letters "A" or "G"

SELECT
	title AS 'Movie Title',
	CONCAT(first_name, ' ', last_name) AS 'Customer Name',
	country AS Country
FROM country AS co
JOIN city AS ci
ON co.country_id = ci.country_id
JOIN address AS ad
ON ci.city_id = ad.city_id
JOIN customer AS c
ON ad.address_id = c.address_id
JOIN rental AS r
ON c.customer_id = r.customer_id 
JOIN inventory AS inv
ON r.inventory_id = inv.inventory_id
JOIN film AS fi
ON inv.film_id = fi.film_id
WHERE 
	country = 'Cambodia' AND 
	(fi.title LIKE 'G%' OR fi.title LIKE 'A%');
