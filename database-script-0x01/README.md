# Airbnb Database Schema

This repository contains a SQL script to create a basic Airbnb-style relational database schema using MySQL. It includes user accounts, properties, bookings, payments, reviews, and messaging between users.

## File: `schema.sql`

### Description

This script:

- Creates a database named `airbnb_database`
- Defines six main tables:
  - `users`
  - `properties`
  - `booking`
  - `payments`
  - `reviews`
  - `messages`
- Includes foreign key constraints, indexing, UUID-based primary keys, and ENUM types for status fields.

## Prerequisities

- MySQL 8.0+ or install using `sudo apt install mysql-server`
- Run `sudo service mysql start` to start MySQL service

## Usage
**To run the schema.sql script**
```bash
sudo mysql -u root -p < database-script-0x01/schema.sql

OR
sudo mysql -u root -p (TO login)
source database-script-0x01/schema.sql (TO run the script)
```