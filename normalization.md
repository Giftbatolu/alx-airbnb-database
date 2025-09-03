# Database Normalization Explanation

## Objective

To apply normalization principles and ensure the database schema is in Third Normal Form (3NF), eliminating redundancy and ensuring data integrity.

## Normalization Steps

1. **First Normal Form (1NF)**
   - Ensured all tables have atomic values.
   - No repeating groups or arrays in any field.

2. **Second Normal Form (2NF)**
   - Confirmed all non-key attributes fully depend on the whole primary key.
   - Since all primary keys are single-column (UUIDs), this is naturally satisfied.

3. **Third Normal Form (3NF)**
   - Verified that there are no transitive dependencies i.e non-key attribute do not depend on each other .
   - All non-key attributes depend only on the primary key.

## Evaluation of Each Entity

### User

* Attributes are atomic and depend on `user_id` which is the primary key.
* No composite key.
* No transitive dependencies.

### Property

* `property_id` is PK.
* `host_id` FK → User(user\_id).
* No repeating groups or composite key.
* All attributes describe the property, and `host_id` references owner.

### Booking

* `booking_id` is PK.
* FKs: `property_id`, `user_id`.
* Attributes like `start_date`, `end_date`, `total_price`, `status` depend on booking.

### Payment

* `payment_id` is PK.
* FK: `booking_id`.
* `amount`, `payment_date`, `payment_method` relate to payment only.

### Review

* `review_id` is PK.
* FKs: `property_id`, `user_id`.
* `rating`, `comment` relate directly to review.

### Message

* `message_id` is PK.
* FK: `sender_id`, `recipient_id`.
* `message_body` and `sent_at` depend only on message.


**The schema design complies with 3NF. It avoids redundancy, ensures referential integrity, and supports efficient querying and maintenance.**