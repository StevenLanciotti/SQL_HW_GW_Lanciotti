# Unions

## Instructions

1. Use the `rental_db` database that was created during exercise 1 of Unit 9.2

2. Create a view, called `all_parties` using `UNION` and write a PostgreSQL statement to return all of the actors, staff, and customers. Return the `first_name` and `last_name` columns from each of those tables and also indicate the type of record. (Hint: Hardcode the type of record in each of the queries that will be part of the union)

3. Use `UNION` to display from the tables `customer` and `customer_list` the ID of all customers who live in the city of London. Determine whether both tables contain the same customers by using `UNION ALL`. (Hint: Consider using subqueries or joins... either will work).
