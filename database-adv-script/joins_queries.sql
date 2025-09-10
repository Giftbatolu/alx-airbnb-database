USE airbnb_database;

-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT users.first_name, users.last_name, users.email, bookings.start_date, bookings.end_date, bookings.total_price, bookings.status, bookings.property_id
FROM users INNER JOIN bookings 
ON users.user_id = bookings.user_id;

-- Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT properties.name, properties.description, properties.location, properties.pricepernight, reviews.rating, reviews.comment
FROM properties LEFT JOIN reviews
ON properties.property_id = reviews.property_id;


-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT users.first_name, users.last_name, users.email, bookings.start_date, bookings.end_date, bookings.total_price, bookings.status, bookings.property_id
FROM users LEFT JOIN bookings 
ON users.user_id = bookings.user_id
UNION
SELECT users.first_name, users.last_name, users.email, bookings.start_date, bookings.end_date, bookings.total_price, bookings.status, bookings.property_id
FROM users RIGHT JOIN bookings 
ON users.user_id = bookings.user_id;