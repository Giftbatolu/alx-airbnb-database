USE airbnb_database; -- To select the intended database

-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT properties.property_id, properties.host_id, properties.name, properties.description, properties.location, properties.pricepernight
FROM properties
WHERE (
    SELECT AVG(reviews.rating)
    FROM reviews
    WHERE reviews.property_id = properties.property_id
) > 4.0;


-- SELECT *
-- FROM properties
-- WHERE property_id IN (
--     SELECT reviews.property_id
--     FROM reviews
--     WHERE rating > 4
-- );

-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT user_id, first_name, last_name, email
FROM users
WHERE (
    SELECT COUNT(user_id)
    FROM bookings
    WHERE bookings.user_id = users.user_id
) > 3;
