# Database Schema Documentation
## Vadiraja Gurusarvabhouma Project

**Database System:** PostgreSQL  
**Schema Name:** public  


---

## Table of Contents

1. [User Management Tables](#user-management-tables)
2. [Content Management Tables](#content-management-tables)
3. [Seva Management Tables](#seva-management-tables)
4. [Calendar & Panchanga Tables](#calendar--panchanga-tables)
5. [Contact & Social Media Tables](#contact--social-media-tables)
6. [Darshan & Timings Tables](#darshan--timings-tables)
7. [Feature Management Tables](#feature-management-tables)

---

## User Management Tables

### 1. users

Stores user/devotee information including personal details, authentication, and consent preferences.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing user ID |
| phone_number | VARCHAR | NOT NULL | Local phone number (without country code) |
| country_code | VARCHAR(10) | DEFAULT '+91' | Country code (e.g., "+91", "+1") |
| country_name | VARCHAR(100) | DEFAULT 'India' | Country name |
| firebase_uid | VARCHAR | | Firebase authentication UID |
| devotee_name | VARCHAR | | Full name of the devotee |
| email | VARCHAR | | Email address |
| address | TEXT | | Street address |
| city | VARCHAR | | City name |
| state | VARCHAR | | State/Province name |
| pincode | VARCHAR | | Postal/ZIP code |
| date_of_birth | DATE | | Date of birth |
| rashi | VARCHAR | | Astrological sign (Rashi) |
| nakshatra | VARCHAR | | Birth star (Nakshatra) |
| gothra | VARCHAR | | Family lineage (Gothra) |
| consent_given | BOOLEAN | DEFAULT false | General consent flag |
| consent_updates | BOOLEAN | DEFAULT false | Consent for updates and notifications |
| consent_volunteer | BOOLEAN | DEFAULT false | Consent for volunteer signup |
| consent_data_storage | BOOLEAN | DEFAULT false | Consent for data storage for communications |
| consent_unsubscribe | BOOLEAN | DEFAULT false | Unsubscribe from communications |
| role | VARCHAR | DEFAULT 'USER' | User role: 'USER' or 'ADMIN' |
| is_active | BOOLEAN | DEFAULT true | Account active status |
| fcm_token | VARCHAR(500) | | Firebase Cloud Messaging token for push notifications |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Index on `phone_number` (typically unique)
- Index on `firebase_uid`
- Index on `is_active`

**Relationships:**
- Referenced by: `seva_bookings` (user_id)

---

### 2. admins

Stores administrative user information.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| phone_number | VARCHAR(15) | PRIMARY KEY | Admin phone number (unique identifier) |
| name | VARCHAR(100) | NOT NULL | Admin full name |
| role | VARCHAR(20) | DEFAULT 'admin' | Admin role |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |

**Indexes:**
- Primary key on `phone_number`

---

## Content Management Tables

### 3. announcements / Events Calendar 

Stores events metadata.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing announcement ID |
| announcement_type | VARCHAR(30) | NOT NULL | Type: 'ANNOUNCEMENT' or 'FESTIVAL' |
| event_date | DATE | NOT NULL | Date of the event |
| thumbnail_url | TEXT | NOT NULL | Thumbnail image URL |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| display_order | INT | DEFAULT 0 | Display order for sorting |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Index on `announcement_type`
- Index on `is_active`
- Index on `display_order`
- Index on `event_date`

**Relationships:**
- Has one: `announcement_contents` (announcement_id)
- Has many: `announcement_attachments` (announcement_id)

---

### 4. announcement_contents

Stores bilingual (English/Kannada) content for announcements.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing content ID |
| announcement_id | BIGINT | NOT NULL, FOREIGN KEY | Reference to announcements.id |
| title_en | VARCHAR(255) | NOT NULL | English title |
| title_kn | VARCHAR(255) | NOT NULL | Kannada title |
| short_description_en | TEXT | | English short description |
| short_description_kn | TEXT | | Kannada short description |
| full_description_en | TEXT | | English full description |
| full_description_kn | TEXT | | Kannada full description |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Foreign key index on `announcement_id`
- Unique constraint on `announcement_id` (one-to-one relationship)

**Relationships:**
- References: `announcements` (announcement_id) ON DELETE CASCADE

---

### 5. announcement_attachments

Stores image attachments for announcements.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing attachment ID |
| announcement_id | BIGINT | NOT NULL, FOREIGN KEY | Reference to announcements.id |
| image_url | TEXT | NOT NULL | Image URL |
| display_order | INT | DEFAULT 0 | Display order for sorting images |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |

**Indexes:**
- Primary key on `id`
- Foreign key index on `announcement_id`
- Index on `display_order`

**Relationships:**
- References: `announcements` (announcement_id) ON DELETE CASCADE

---

### 6. flash_alerts

Stores flash alert metadata for quick notifications.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing flash alert ID |
| alert_type | VARCHAR(30) | NOT NULL | Type: 'ANNOUNCEMENT', 'FESTIVAL', 'FOOD_ALERT', 'GENERAL' |
| thumbnail_url | TEXT | NOT NULL | Thumbnail image URL |
| event_date | DATE | | Optional event date |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| display_order | INT | DEFAULT 0 | Display order for sorting |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Index on `alert_type`
- Index on `is_active`
- Index on `display_order`

**Relationships:**
- Has one: `flash_alert_contents` (flash_alert_id)

---

### 7. flash_alert_contents

Stores bilingual content for flash alerts.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing content ID |
| flash_alert_id | BIGINT | NOT NULL, FOREIGN KEY | Reference to flash_alerts.id |
| title_en | VARCHAR(255) | NOT NULL | English title |
| title_kn | VARCHAR(255) | NOT NULL | Kannada title |
| short_description_en | TEXT | NOT NULL | English short description |
| short_description_kn | TEXT | NOT NULL | Kannada short description |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Foreign key index on `flash_alert_id`
- Unique constraint on `flash_alert_id` (one-to-one relationship)

**Relationships:**
- References: `flash_alerts` (flash_alert_id) ON DELETE CASCADE

---

## Seva Management Tables

### 8. sevas

Master table for managing different types of SEVAS features.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing seva ID |
| seva_name | VARCHAR(150) | NOT NULL | Display name (e.g., "Gosevaa", "Online Seva") |
| seva_code | VARCHAR(50) | UNIQUE, NOT NULL | Unique code (e.g., "gosevaa", "online_seva") |
| is_enabled | BOOLEAN | DEFAULT TRUE | Feature toggle |
| icon_name | VARCHAR(100) | | Optional icon name for customization |
| display_order | INTEGER | NOT NULL, DEFAULT 0 | Display order |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Unique index on `seva_code`
- Index on `is_enabled`
- Index on `display_order`

**Default Data:**
- Gosevaa (gosevaa)
- Online Seva (online_seva)
- Daily Seva (daily_seva)
- E-Kanike (e_kanike)

**Relationships:**
- Referenced by: `seva_bookings` (seva_id)

---

### 9. gosevaa

Stores GoSeva information with video and bilingual content.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing GoSeva ID |
| video_url | VARCHAR(500) | | Video URL for carousel display |
| info_image_url | VARCHAR(500) | | Thumbnail/info image URL |
| title_en | TEXT | | English title |
| title_kn | TEXT | | Kannada title |
| description_en | TEXT | | English description |
| description_kn | TEXT | | Kannada description |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Index on `is_active`

---

### 10. seva_bookings

Stores all Seva bookings with payment and booking details.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing booking ID |
| user_id | BIGINT | NOT NULL, FOREIGN KEY | Reference to users.id |
| seva_id | BIGINT | NOT NULL, FOREIGN KEY | Reference to sevas.id |
| seva_name | VARCHAR(200) | NOT NULL | Seva name (stored for historical reference) |
| amount | DECIMAL(12, 2) | NOT NULL, CHECK > 0 | Amount paid for the seva |
| payment_mode | VARCHAR(50) | NOT NULL | Payment mode: 'Credit Card', 'Debit Card', 'UPI', 'Net Banking', 'Cash' |
| card_type | VARCHAR(50) | | Card type for card payments |
| payment_status | VARCHAR(30) | DEFAULT 'PENDING' | Status: 'PENDING', 'COMPLETED', 'FAILED', 'REFUNDED' |
| payment_transaction_id | VARCHAR(200) | | Transaction ID from payment gateway |
| payment_date | TIMESTAMP WITH TIME ZONE | | Payment completion date |
| prasadam_collection_mode | VARCHAR(20) | NOT NULL | Collection mode: 'personal' or 'post' |
| postal_address | TEXT | | Required if collection mode is 'post' |
| booking_status | VARCHAR(30) | DEFAULT 'CONFIRMED' | Status: 'CONFIRMED', 'CANCELLED', 'COMPLETED' |
| booking_date | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Booking creation date |
| seva_performing_date | DATE | | Date when seva will be performed |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Constraints:**
- CHECK: payment_mode IN ('Credit Card', 'Debit Card', 'UPI', 'Net Banking', 'Cash')
- CHECK: prasadam_collection_mode IN ('personal', 'post')
- CHECK: payment_status IN ('PENDING', 'COMPLETED', 'FAILED', 'REFUNDED')
- CHECK: booking_status IN ('CONFIRMED', 'CANCELLED', 'COMPLETED')
- CHECK: amount > 0

**Indexes:**
- Primary key on `id`
- Foreign key index on `user_id`
- Foreign key index on `seva_id`
- Index on `payment_status`
- Index on `booking_status`
- Index on `booking_date` DESC
- Index on `seva_performing_date`

**Relationships:**
- References: `users` (user_id) ON DELETE CASCADE
- References: `sevas` (seva_id) ON DELETE RESTRICT

---

### 11. daily_seva_temples

Stores temple information for Daily Seva feature.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing temple ID |
| temple_name_en | VARCHAR(200) | NOT NULL | English temple name |
| temple_name_kn | VARCHAR(200) | NOT NULL | Kannada temple name |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| display_order | INTEGER | NOT NULL, DEFAULT 0 | Display order |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Index on `is_active`
- Index on `display_order`

**Relationships:**
- Has many: `daily_sevas` (temple_id)

---

### 12. daily_sevas

Stores seva information for each temple.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing daily seva ID |
| temple_id | BIGINT | NOT NULL, FOREIGN KEY | Reference to daily_seva_temples.id |
| seva_name_en | VARCHAR(200) | NOT NULL | English seva name |
| seva_name_kn | VARCHAR(200) | NOT NULL | Kannada seva name |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| display_order | INTEGER | NOT NULL, DEFAULT 0 | Display order |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Foreign key index on `temple_id`
- Index on `is_active`
- Index on `display_order`

**Relationships:**
- References: `daily_seva_temples` (temple_id) ON DELETE CASCADE
- Has many: `daily_seva_time_slots` (seva_id)

---

### 13. daily_seva_time_slots

Stores time slots for each daily seva.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing time slot ID |
| seva_id | BIGINT | NOT NULL, FOREIGN KEY | Reference to daily_sevas.id |
| start_time | TIME | NOT NULL | Start time |
| end_time | TIME | NOT NULL | End time (must be after start_time) |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Constraints:**
- CHECK: end_time > start_time

**Indexes:**
- Primary key on `id`
- Foreign key index on `seva_id`
- Index on `is_active`

**Relationships:**
- References: `daily_sevas` (seva_id) ON DELETE CASCADE

---

### 14. online_seva_items

Stores individual online seva items that users can book.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing item ID |
| name_en | VARCHAR(200) | NOT NULL | English seva name |
| name_kn | VARCHAR(200) | NOT NULL | Kannada seva name |
| price | DECIMAL(12, 2) | NOT NULL | Price of the seva |
| is_active | BOOLEAN | DEFAULT TRUE | Availability status |
| display_order | INTEGER | NOT NULL, DEFAULT 0 | Display order |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Index on `is_active`
- Index on `display_order`

---

## Calendar & Panchanga Tables

### 15. calendar_data

Stores astrological and calendar metadata for each date.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing calendar data ID |
| calendar_date | DATE | NOT NULL, UNIQUE | Date for the calendar entry |
| tithi_value | DECIMAL(5, 2) | | Numeric tithi value (e.g., 58.3) |
| nakshatra_value | DECIMAL(5, 2) | | Numeric nakshatra value (e.g., 57.04) |
| sunrise_time | TIME | | Sunrise time |
| sunset_time | TIME | | Sunset time |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Unique index on `calendar_date`
- Index on `is_active`
- Index on `calendar_date`
- Composite index on (EXTRACT(YEAR FROM calendar_date), EXTRACT(MONTH FROM calendar_date))

**Relationships:**
- Has one: `calendar_contents` (calendar_data_id)

---

### 16. calendar_contents

Stores bilingual text content for calendar data (Panchanga information).

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing content ID |
| calendar_data_id | BIGINT | NOT NULL, UNIQUE, FOREIGN KEY | Reference to calendar_data.id |
| vishwaavasu_samvat_en | VARCHAR(100) | | English year name |
| vishwaavasu_samvat_kn | VARCHAR(100) | | Kannada year name |
| ayana_en | VARCHAR(50) | | English ayana (Uttarayana/Dakshinayana) |
| ayana_kn | VARCHAR(50) | | Kannada ayana |
| rithu_en | VARCHAR(50) | | English season |
| rithu_kn | VARCHAR(50) | | Kannada season |
| sauramasa_en | VARCHAR(50) | | English solar month |
| sauramasa_kn | VARCHAR(50) | | Kannada solar month |
| chandramasa_en | VARCHAR(50) | | English lunar month |
| chandramasa_kn | VARCHAR(50) | | Kannada lunar month |
| paksha_en | VARCHAR(50) | | English paksha (Krishna/Shukla) |
| paksha_kn | VARCHAR(50) | | Kannada paksha |
| tithi_en | VARCHAR(100) | | English tithi information |
| tithi_kn | VARCHAR(100) | | Kannada tithi information |
| nakshatra_en | VARCHAR(100) | | English nakshatra information |
| nakshatra_kn | VARCHAR(100) | | Kannada nakshatra information |
| yoga_en | VARCHAR(100) | | English yoga |
| yoga_kn | VARCHAR(100) | | Kannada yoga |
| karana_en | VARCHAR(100) | | English karana |
| karana_kn | VARCHAR(100) | | Kannada karana |
| notes_en | TEXT | | English additional notes |
| notes_kn | TEXT | | Kannada additional notes |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Unique index on `calendar_data_id`
- Foreign key index on `calendar_data_id`

**Relationships:**
- References: `calendar_data` (calendar_data_id) ON DELETE CASCADE

---

## Contact & Social Media Tables

### 17. contact_locations

Stores contact information for different temple locations.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing location ID |
| location_name | VARCHAR(150) | NOT NULL | Location name (e.g., "Sode Sri Vadiraja Matha") |
| address | TEXT | NOT NULL | Full address |
| email | VARCHAR(150) | NOT NULL | Contact email |
| phone | VARCHAR(30) | | Contact phone number |
| latitude | DOUBLE PRECISION | NOT NULL | Geographic latitude |
| longitude | DOUBLE PRECISION | NOT NULL | Geographic longitude |
| is_pro | BOOLEAN | DEFAULT FALSE, NOT NULL | PRO location flag |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Index on `is_active`
- Index on `is_pro`

---

### 18. contact_queries

Stores contact form submissions from users.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing query ID |
| full_name | VARCHAR(150) | NOT NULL | Submitter's full name |
| email | VARCHAR(150) | NOT NULL | Submitter's email |
| mobile_number | VARCHAR(30) | | Submitter's mobile number |
| category | VARCHAR(100) | NOT NULL | Query category: 'General Inquiry', 'Seva', 'Booking', 'Feedback', 'Other' |
| message | TEXT | NOT NULL | Query message content |
| status | VARCHAR(30) | DEFAULT 'NEW' | Status: 'NEW', 'IN_PROGRESS', 'RESOLVED' |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |

**Indexes:**
- Primary key on `id`
- Index on `status`
- Index on `created_at` DESC

---

### 19. social_media_links

Stores social media platform links.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing link ID |
| platform | VARCHAR(50) | NOT NULL, UNIQUE | Platform name (e.g., 'INSTAGRAM', 'FACEBOOK', 'YOUTUBE', 'WHATSAPP') |
| url | VARCHAR(500) | NOT NULL | Social media URL |
| display_order | INTEGER | NOT NULL | Display order |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Unique index on `platform`
- Index on `display_order`
- Index on `is_active`

---

## Darshan & Timings Tables

### 20. darshan_locations

Stores temple locations for darshan and prasada timings.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing location ID |
| location_name | VARCHAR(150) | NOT NULL | Location name |
| location_code | VARCHAR(50) | UNIQUE | Unique location code |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Unique index on `location_code`
- Index on `is_active`

**Relationships:**
- Has many: `darshan_prasada_timings` (location_id)

---

### 21. darshan_prasada_timings

Stores darshan and prasada timings for each location and session.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing timing ID |
| location_id | BIGINT | NOT NULL, FOREIGN KEY | Reference to darshan_locations.id |
| session_type | VARCHAR(20) | NOT NULL | Session: 'MORNING' or 'EVENING' |
| service_type | VARCHAR(20) | NOT NULL | Service: 'DARSHAN' or 'PRASADA' |
| start_time | TIME | NOT NULL | Start time |
| end_time | TIME | NOT NULL | End time (must be after start_time) |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Constraints:**
- CHECK: session_type IN ('MORNING', 'EVENING')
- CHECK: service_type IN ('DARSHAN', 'PRASADA')
- CHECK: end_time > start_time
- UNIQUE: (location_id, session_type, service_type)

**Indexes:**
- Primary key on `id`
- Foreign key index on `location_id`
- Index on `is_active`
- Unique index on (location_id, session_type, service_type)

**Relationships:**
- References: `darshan_locations` (location_id) ON DELETE CASCADE

---

## Feature Management Tables

### 22. app_features

Stores feature flags for enabling/disabling app features.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| id | BIGSERIAL | PRIMARY KEY | Auto-incrementing feature ID |
| feature_name | VARCHAR(100) | UNIQUE, NOT NULL | Feature name (e.g., 'EVENT_CALENDAR', 'GALLERY') |
| is_enabled | BOOLEAN | NOT NULL, DEFAULT TRUE | Feature enabled status |
| created_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record creation timestamp |
| updated_at | TIMESTAMP WITH TIME ZONE | DEFAULT CURRENT_TIMESTAMP | Record last update timestamp |

**Indexes:**
- Primary key on `id`
- Unique index on `feature_name`
- Index on `is_enabled`

**Default Features:**
- EVENT_CALENDAR
- GALLERY
- ROOM_BOOKING_FORM
- ARTIFACTS
- BRANCH_DICTIONARY
- YOUTH_QUIZ
- TITHINIRNAYA_PANCHANGA
- CONTACT_US

---



## Entity Relationship Diagram (ERD) Summary

### Main Relationships:

1. **User Management:**
   - `users` → `seva_bookings` (one-to-many)

2. **Content Management:**
   - `announcements` → `announcement_contents` (one-to-one)
   - `announcements` → `announcement_attachments` (one-to-many)
   - `flash_alerts` → `flash_alert_contents` (one-to-one)

3. **Seva Management:**
   - `sevas` → `seva_bookings` (one-to-many)
   - `users` → `seva_bookings` (one-to-many)
   - `daily_seva_temples` → `daily_sevas` (one-to-many)
   - `daily_sevas` → `daily_seva_time_slots` (one-to-many)

4. **Calendar:**
   - `calendar_data` → `calendar_contents` (one-to-one)

5. **Darshan & Timings:**
   - `darshan_locations` → `darshan_prasada_timings` (one-to-many)

---

## Database Statistics

- **Total Tables:** 22
- **Total Indexes:** ~50+
- **Foreign Key Relationships:** 12
- **Bilingual Support Tables:** 6 (announcement_contents, flash_alert_contents, calendar_contents, daily_seva_temples, daily_sevas, online_seva_items)

---

## Notes

1. **Bilingual Support:** The database supports English and Kannada (Kannada) languages for content tables.

2. **Soft Deletes:** Most tables use `is_active` flags instead of hard deletes for data preservation.

3. **Timestamps:** All tables include `created_at` and `updated_at` timestamps for audit trails.

4. **Cascade Deletes:** Related content tables use CASCADE delete to maintain referential integrity.

5. **Payment Integration:** The `seva_bookings` table supports multiple payment modes and tracks transaction status.

6. **Feature Flags:** The `app_features` table allows runtime feature toggling without code deployment.

---

## Database Version Information

- **PostgreSQL Version:** Recommended 12.0+
- **Character Encoding:** UTF-8
- **Time Zone:** UTC (stored as TIMESTAMP WITH TIME ZONE)

---


**For:**  Sri Vadiraja Vaibhavotsava  
**Maintained By:**  Team Vadiraja Gurusarvabhouma


