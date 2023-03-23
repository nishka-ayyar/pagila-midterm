/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 */

SELECT DISTINCT first_name, last_name
FROM actor

/* appeared in children */
WHERE actor.actor_id in
    (SELECT actor_id
        FROM actor
        JOIN film_actor using (actor_id)
        JOIN film using (film_id)
        JOIN film_category using (film_id)
        JOIN category using (category_id)
        WHERE name = 'Children'

/* never in horror */ 
   AND actor.actor_id not in
    (SELECT DISTINCT actor_id
        FROM actor
        JOIN film_actor using (actor_id)
        JOIN film using (film_id)
        JOIN film_category using (film_id)
        JOIN category using (category_id)
        WHERE name = 'Horror')

ORDER BY first_name, last_name;
