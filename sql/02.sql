/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

/* get country */
SELECT country 
    FROM country

/* get number of customers per country  */    
JOIN city USING (country_id)
JOIN address USING (city_id)
JOIN customer USING (address_id)

/* get highest at top */
GROUP BY country
ORDER BY count(customer_id) DESC

/* find actual highest */
LIMIT 1;
