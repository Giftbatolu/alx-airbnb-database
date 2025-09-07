USE airbnb_database;

-- Data foe user table
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('10000000-0000-0000-0000-000000000001', 'Emma', 'Watson', 'emmawatson01@gmail.com', 'hash1234', '+2348151234567', 'guest'),
('10000000-0000-0000-0000-000000000003', 'Olivia', 'Davis', 'oliviadavis@gmail.com', 'hash3456', NULL, 'guest'),
('10000000-0000-0000-0000-000000000002', 'Liam', 'Brown', 'liambrown@gmail.com', 'hash2345', '+2349163883993', 'host'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Jones', 'bob@example.com', 'hashed_pw2', '+2349187654321', 'host'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Admin', 'charlieadmin@gmail.com', 'hashed_pw3', NULL, 'admin'),
('10000000-0000-0000-0000-000000000004', 'Noah', 'Wilson', 'noahwilson@gmail.com', 'hash4567', '+2347053456789', 'admin');

-- Data for property table
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000002', 'Modern Loft', 'Spacious loft with city views', 'New York, NY', 250.00),
('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', 'Beachside Bungalow', 'Steps away from the beach', 'Santa Monica, CA', 180.00);

-- Data for booking table
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
('30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '2025-09-15', '2025-09-18', 750.00, 'confirmed'),
('30000000-0000-0000-0000-000000000002', '20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000003', '2025-10-05', '2025-10-10', 900.00, 'pending');

-- Data for payment table
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES 
('40000000-0000-0000-0000-000000000001', '30000000-0000-0000-0000-000000000001', 750.00, 'credit_card'),
('40000000-0000-0000-0000-000000000002', '30000000-0000-0000-0000-000000000002', 900.00, 'paypal');

-- Data for review table
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES 
('50000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', 4, 'Great location, very clean.'),
('50000000-0000-0000-0000-000000000002', '20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000003', 5, 'Loved the beach view and cozy vibe!');

-- Data for message table
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES 
('60000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000002', 'Hi! Is the loft available next weekend?'),
('60000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000002', 'Can I check in early on the 5th?');