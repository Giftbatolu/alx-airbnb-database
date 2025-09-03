CREATE DATABASE IF NOT EXISTS airbnb_database;
USE airbnb_database;

CREATE TABLE IF NOT EXISTS users (
user_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
password_hash VARCHAR(255) NOT NULL,
phone_number VARCHAR(50) NULL,
role ENUM('guest', 'host', 'admin'),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

INDEX idx_email (email)
);

CREATE TABLE IF NOT EXISTS properties (
property_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
host_id CHAR(36) NOT NULL,
name VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
location VARCHAR(255) NOT NULL,
pricepernight DECIMAL(10, 2) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

INDEX idx_host_id (host_id),
FOREIGN KEY(host_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS booking (
booking_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
property_id CHAR(36) NOT NULL,
user_id CHAR(36) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_price DECIMAL(10, 2) NOT NULL,
status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

INDEX idx_property_id (property_id),
INDEX idx_user_id (user_id),
FOREIGN KEY(property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS payments (
payment_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
booking_id CHAR(36) NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,

INDEX idx_booking_id (booking_id),
FOREIGN KEY(booking_id) REFERENCES booking(booking_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS reviews (
review_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
property_id CHAR(36) NOT NULL,
user_id CHAR(36) NOT NULL,
rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
comment TEXT NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

INDEX idx_property_id (property_id),
INDEX idx_user_id (user_id),

FOREIGN KEY(property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS messages (
message_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
sender_id CHAR(36) NOT NULL,
recipient_id CHAR(36) NOT NULL,
message_body TEXT NOT NULL,
sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

INDEX (message_id),

FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE,
FOREIGN KEY (recipient_id) REFERENCES users(user_id) ON DELETE CASCADE
);