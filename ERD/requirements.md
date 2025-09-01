# Airbnb Database Requirements Specification

## Entities and Attributes

### User
**Purpose:** Stores essential information about all registered users of the platform, including authentication credentials, personal information, and user roles.

| Field Name      | Data Type                         | Constraints                            | Description                            |
|------------------|-----------------------------------|----------------------------------------|----------------------------------------|
| `user_id`        | `UUID`                            | **Primary Key**, Indexed               | Unique identifier for the user         |
| `first_name`     | `VARCHAR`                         | **NOT NULL**                           | User's first name                       |
| `last_name`      | `VARCHAR`                         | **NOT NULL**                           | User's last name                        |
| `email`          | `VARCHAR`                         | **UNIQUE**, **NOT NULL**               | User's email address (used for login)  |
| `password_hash`  | `VARCHAR`                         | **NOT NULL**                           | Hashed password for authentication      |
| `phone_number`   | `VARCHAR`                         | Nullable                               | User's phone number (optional)          |
| `role`           | `ENUM('guest', 'host', 'admin')` | **NOT NULL**                           | User's role within the platform         |
| `created_at`     | `TIMESTAMP`                       | Default: `CURRENT_TIMESTAMP`           | Account creation timestamp              |


### Property
**Purpose:** Stores information about the listings posted by hosts.

| Field Name       | Data Type     | Constraints                                  | Description                               |
|------------------|---------------|----------------------------------------------|-------------------------------------------|
| `property_id`    | `UUID`        | **Primary Key**, Indexed                     | Unique identifier for the property         |
| `host_id`        | `UUID`        | **Foreign Key** → `users(user_id)`           | The user (host) who owns the property      |
| `name`           | `VARCHAR`     | **NOT NULL**                                 | Title of the property listing              |
| `description`    | `TEXT`        | **NOT NULL**                                 | Detailed description of the property       |
| `location`       | `VARCHAR`     | **NOT NULL**                                 | Address or general location                |
| `pricepernight`  | `DECIMAL`     | **NOT NULL**                                 | Nightly rental price                       |
| `created_at`     | `TIMESTAMP`   | Default: `CURRENT_TIMESTAMP`                 | Date when the listing was created          |
| `updated_at`     | `TIMESTAMP`   | Auto-updated on row modification             | Last updated timestamp                     |




### Booking
**Purpose:** Tracks reservations made by guests on available properties.

| Field Name      | Data Type     | Constraints                                  | Description                                |
|------------------|---------------|----------------------------------------------|--------------------------------------------|
| `booking_id`     | `UUID`        | **Primary Key**, Indexed                     | Unique identifier for the booking           |
| `property_id`    | `UUID`        | **Foreign Key** → `properties(property_id)`  | The booked property                         |
| `user_id`        | `UUID`        | **Foreign Key** → `users(user_id)`           | The guest who made the booking              |
| `start_date`     | `DATE`        | **NOT NULL**                                 | Check-in date                               |
| `end_date`       | `DATE`        | **NOT NULL**                                 | Check-out date                              |
| `total_price`    | `DECIMAL`     | **NOT NULL**                                 | Total cost for the stay                     |
| `status`         | `ENUM`        | (`pending`, `confirmed`, `canceled`), NOT NULL | Status of the booking                   |
| `created_at`     | `TIMESTAMP`   | Default: `CURRENT_TIMESTAMP`                 | Timestamp when the booking was created      |


### Payment
**Purpose:** Records payment details for each confirmed booking.

| Field Name       | Data Type     | Constraints                                  | Description                                  |
|------------------|---------------|----------------------------------------------|----------------------------------------------|
| `payment_id`     | `UUID`        | **Primary Key**, Indexed                     | Unique identifier for the payment             |
| `booking_id`     | `UUID`        | **Foreign Key** → `bookings(booking_id)`     | Associated booking                            |
| `amount`         | `DECIMAL`     | **NOT NULL**                                 | Payment amount                                |
| `payment_date`   | `TIMESTAMP`   | Default: `CURRENT_TIMESTAMP`                 | When the payment was processed                |
| `payment_method` | `ENUM`        | (`credit_card`, `paypal`, `stripe`), NOT NULL | Method used for the payment                 |

### Review
**Purpose:** Stores user-generated feedback on properties

| Field Name       | Data Type     | Constraints                                  | Description                                  |
|------------------|---------------|----------------------------------------------|----------------------------------------------|
| `review_id`      | `UUID`        | **Primary Key**, Indexed                     | Unique identifier for the review              |
| `property_id`    | `UUID`        | **Foreign Key** → `properties(property_id)`  | The reviewed property                         |
| `user_id`        | `UUID`        | **Foreign Key** → `users(user_id)`           | The user (guest) who submitted the review     |
| `rating`         | `INTEGER`     | **NOT NULL**, CHECK: `rating >= 1 AND <= 5`  | Rating score from 1 to 5                      |
| `comment`        | `TEXT`        | **NOT NULL**                                 | Text of the review                            |
| `created_at`     | `TIMESTAMP`   | Default: `CURRENT_TIMESTAMP`                 | Timestamp of review submission                |


### Message
**Purpose:** Allows users to communicate with each other (e.g., guests to hosts).

| Field Name       | Data Type     | Constraints                                  | Description                                  |
|------------------|---------------|----------------------------------------------|----------------------------------------------|
| `message_id`     | `UUID`        | **Primary Key**, Indexed                     | Unique identifier for the message             |
| `sender_id`      | `UUID`        | **Foreign Key** → `users(user_id)`           | Sender of the message                         |
| `recipient_id`   | `UUID`        | **Foreign Key** → `users(user_id)`           | Recipient of the message                      |
| `message_body`   | `TEXT`        | **NOT NULL**                                 | Content of the message                        |
| `sent_at`        | `TIMESTAMP`   | Default: `CURRENT_TIMESTAMP`                 | When the message was sent                     |