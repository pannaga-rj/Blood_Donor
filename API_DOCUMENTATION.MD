# VGS Backend API Documentation

Complete API documentation for the Vadiraja Gurusarvabhouma backend application.

## Table of Contents

1. [Base URL](#base-url)
2. [Authentication](#authentication)
3. [User Management APIs](#user-management-apis)
4. [Logo Management APIs](#logo-management-apis)
5. [Article Management APIs](#article-management-apis)
6. [Alert Management APIs](#alert-management-apis)
7. [Flash Alert Management APIs](#flash-alert-management-apis)
8. [Timing Management APIs](#timing-management-apis)
9. [Vishesha Management APIs](#vishesha-management-apis)
10. [Ekadashi Dwadashi Detail APIs](#ekadashi-dwadashi-detail-apis)
11. [Social Media Link APIs](#social-media-link-apis)
12. [Contact Management APIs](#contact-management-apis)
13. [Contact Location APIs](#contact-location-apis)
14. [Announcement Management APIs](#announcement-management-apis)
15. [App Feature APIs](#app-feature-apis)
16. [Seva Management APIs](#seva-management-apis)
17. [Seva Booking APIs](#seva-booking-apis)
18. [Online Seva Item APIs](#online-seva-item-apis)
19. [Daily Seva APIs](#daily-seva-apis)
20. [Gosevaa APIs](#gosevaa-apis)
21. [Darshan Management APIs](#darshan-management-apis)
22. [Calendar Data APIs](#calendar-data-apis)
23. [Analytics APIs](#analytics-apis)

---

## Base URL

```
http://localhost:8080/api
```

---

## Authentication

Most admin endpoints require the `X-User-Role` header with value `ADMIN`:

```
X-User-Role: ADMIN
```

---

## User Management APIs

### Register/Create User

**Endpoint:** `POST /api/users/register`

**Description:** Register a new user or update existing user

**Request Body:**
```json
{
  "phoneNumber": "8660743840",
  "countryCode": "+91",
  "countryName": "India",
  "firebaseUid": "firebase-user-id",
  "devoteeName": "John Doe",
  "email": "john@example.com",
  "address": "123 Main St",
  "city": "Bangalore",
  "state": "Karnataka",
  "pincode": "560001",
  "dateOfBirth": "1990-01-01",
  "rashi": "Mesha",
  "nakshatra": "Ashwini",
  "gothra": "Bharadwaja",
  "consentGiven": true,
  "consentUpdates": true,
  "consentVolunteer": false,
  "consentDataStorage": true
}
```

**Response:** `201 Created`
```json
{
  "id": 1,
  "phoneNumber": "8660743840",
  "countryCode": "+91",
  "countryName": "India",
  "firebaseUid": "firebase-user-id",
  "devoteeName": "John Doe",
  "email": "john@example.com",
  ...
}
```

---

### Get User by Phone Number

**Endpoint:** `GET /api/users/phone/{phoneNumber}`

**Description:** Retrieve user information by phone number

**Path Parameters:**
- `phoneNumber` (string): Phone number without country code

**Response:** `200 OK`
```json
{
  "id": 1,
  "phoneNumber": "8660743840",
  ...
}
```

---

### Get User by Firebase UID

**Endpoint:** `GET /api/users/firebase/{firebaseUid}`

**Description:** Retrieve user information by Firebase UID

**Path Parameters:**
- `firebaseUid` (string): Firebase user ID

**Response:** `200 OK`
```json
{
  "id": 1,
  "firebaseUid": "firebase-user-id",
  ...
}
```

---

### Check if User Exists

**Endpoint:** `GET /api/users/exists/{phoneNumber}`

**Description:** Check if a user exists with the given phone number

**Path Parameters:**
- `phoneNumber` (string): Phone number without country code

**Response:** `200 OK`
```json
true
```

---

### Update User

**Endpoint:** `PUT /api/users/update`

**Description:** Update user information

**Request Body:** Same as Register User

**Response:** `200 OK`
```json
{
  "id": 1,
  ...
}
```

---

### Update User Consents

**Endpoint:** `PUT /api/users/consents`

**Description:** Update user consent preferences

**Request Body:**
```json
{
  "phoneNumber": "8660743840",
  "consentGiven": true,
  "consentUpdates": true,
  "consentVolunteer": false,
  "consentDataStorage": true
}
```

**Response:** `200 OK`
```json
{
  "id": 1,
  ...
}
```

---

### Update FCM Token

**Endpoint:** `PUT /api/users/fcm-token`

**Description:** Update Firebase Cloud Messaging token for push notifications

**Query Parameters:**
- `phoneNumber` (string, required): User's phone number
- `fcmToken` (string, required): FCM token

**Response:** `200 OK`
```json
{
  "id": 1,
  "fcmToken": "fcm-token-string",
  ...
}
```

---

## Logo Management APIs

### Get All Logos (Public)

**Endpoint:** `GET /api/logos`

**Description:** Get all active logos

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "imageUrl": "https://example.com/logo.png",
    "displayOrder": 1,
    "isActive": true
  }
]
```

---

### Get All Logos (Admin)

**Endpoint:** `GET /api/logos/admin`

**Description:** Get all logos including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "imageUrl": "https://example.com/logo.png",
    "displayOrder": 1,
    "isActive": true
  }
]
```

---

### Create Logo

**Endpoint:** `POST /api/logos`

**Description:** Create a new logo (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "imageUrl": "https://example.com/logo.png",
  "displayOrder": 1,
  "isActive": true
}
```

**Response:** `201 Created`
```json
{
  "id": 1,
  "imageUrl": "https://example.com/logo.png",
  "displayOrder": 1,
  "isActive": true
}
```

---

### Update Logo

**Endpoint:** `PUT /api/logos/{id}`

**Description:** Update an existing logo (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Logo ID

**Request Body:**
```json
{
  "imageUrl": "https://example.com/logo-updated.png",
  "displayOrder": 2,
  "isActive": true
}
```

**Response:** `200 OK`
```json
{
  "id": 1,
  "imageUrl": "https://example.com/logo-updated.png",
  "displayOrder": 2,
  "isActive": true
}
```

---

### Delete Logo

**Endpoint:** `DELETE /api/logos/{id}`

**Description:** Delete a logo (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Logo ID

**Response:** `204 No Content`

---

### Reorder Logos

**Endpoint:** `POST /api/logos/reorder`

**Description:** Reorder logos by providing ordered list of IDs (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "ids": [3, 1, 2, 4]
}
```

**Response:** `200 OK`

---

## Article Management APIs

### Get Top 5 Articles (Public)

**Endpoint:** `GET /api/articles/top5`

**Description:** Get top 5 articles

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "titleEn": "Article Title",
    "titleKn": "ಲೇಖನ ಶೀರ್ಷಿಕೆ",
    "descriptionEn": "Article description",
    "descriptionKn": "ಲೇಖನ ವಿವರಣೆ",
    "imageUrl": "https://example.com/image.png",
    "displayOrder": 1,
    "isTop5": true,
    "isActive": true
  }
]
```

---

### Get All Articles (Public)

**Endpoint:** `GET /api/articles`

**Description:** Get all active articles

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "titleEn": "Article Title",
    "titleKn": "ಲೇಖನ ಶೀರ್ಷಿಕೆ",
    ...
  }
]
```

---

### Get All Articles (Admin)

**Endpoint:** `GET /api/articles/admin`

**Description:** Get all articles including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    ...
  }
]
```

---

### Create Article

**Endpoint:** `POST /api/articles`

**Description:** Create a new article (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "titleEn": "Article Title",
  "titleKn": "ಲೇಖನ ಶೀರ್ಷಿಕೆ",
  "descriptionEn": "Article description",
  "descriptionKn": "ಲೇಖನ ವಿವರಣೆ",
  "imageUrl": "https://example.com/image.png",
  "displayOrder": 1,
  "isTop5": false,
  "isActive": true
}
```

**Response:** `201 Created`
```json
{
  "id": 1,
  ...
}
```

---

### Update Article

**Endpoint:** `PUT /api/articles/{id}`

**Description:** Update an existing article (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Article ID

**Request Body:** Same as Create Article

**Response:** `200 OK`

---

### Delete Article

**Endpoint:** `DELETE /api/articles/{id}`

**Description:** Delete an article (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Article ID

**Response:** `204 No Content`

---

### Reorder Articles

**Endpoint:** `POST /api/articles/reorder`

**Description:** Reorder articles by providing ordered list of IDs (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "ids": [3, 1, 2, 4]
}
```

**Response:** `200 OK`

---

## Alert Management APIs

### Get All Alerts (Public)

**Endpoint:** `GET /api/alerts`

**Description:** Get all active alerts

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "messageEn": "Alert message",
    "messageKn": "ಎಚ್ಚರಿಕೆ ಸಂದೇಶ",
    "displayOrder": 1,
    "isActive": true
  }
]
```

---

### Get All Alerts (Admin)

**Endpoint:** `GET /api/alerts/admin`

**Description:** Get all alerts including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`

---

### Create Alert

**Endpoint:** `POST /api/alerts`

**Description:** Create a new alert (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "messageEn": "Alert message",
  "messageKn": "ಎಚ್ಚರಿಕೆ ಸಂದೇಶ",
  "displayOrder": 1,
  "isActive": true
}
```

**Response:** `201 Created`

---

### Update Alert

**Endpoint:** `PUT /api/alerts/{id}`

**Description:** Update an existing alert (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Alert ID

**Request Body:** Same as Create Alert

**Response:** `200 OK`

---

### Delete Alert

**Endpoint:** `DELETE /api/alerts/{id}`

**Description:** Delete an alert (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Alert ID

**Response:** `204 No Content`

---

### Reorder Alerts

**Endpoint:** `POST /api/alerts/reorder`

**Description:** Reorder alerts by providing ordered list of IDs (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "ids": [3, 1, 2, 4]
}
```

**Response:** `200 OK`

---

## Flash Alert Management APIs

### Get All Flash Alerts (Public)

**Endpoint:** `GET /api/flash-alerts`

**Description:** Get all active flash alerts

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "messageEn": "Flash alert message",
    "messageKn": "ಫ್ಲ್ಯಾಶ್ ಎಚ್ಚರಿಕೆ ಸಂದೇಶ",
    "isActive": true,
    "createdAt": "2024-01-01T00:00:00",
    "updatedAt": "2024-01-01T00:00:00"
  }
]
```

---

### Get Flash Alert by ID (Public)

**Endpoint:** `GET /api/flash-alerts/{id}`

**Description:** Get a specific flash alert by ID

**Path Parameters:**
- `id` (long): Flash Alert ID

**Response:** `200 OK`
```json
{
  "id": 1,
  "messageEn": "Flash alert message",
  ...
}
```

---

### Create Flash Alert (Admin)

**Endpoint:** `POST /api/flash-alerts/admin`

**Description:** Create a new flash alert (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "messageEn": "Flash alert message",
  "messageKn": "ಫ್ಲ್ಯಾಶ್ ಎಚ್ಚರಿಕೆ ಸಂದೇಶ",
  "isActive": true
}
```

**Response:** `201 Created`

---

### Get All Flash Alerts (Admin)

**Endpoint:** `GET /api/flash-alerts/admin`

**Description:** Get all flash alerts including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`

---

### Update Flash Alert (Admin)

**Endpoint:** `PUT /api/flash-alerts/admin/{id}`

**Description:** Update an existing flash alert (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Flash Alert ID

**Request Body:** Same as Create Flash Alert

**Response:** `200 OK`

---

### Delete Flash Alert (Admin)

**Endpoint:** `DELETE /api/flash-alerts/admin/{id}`

**Description:** Delete a flash alert (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Flash Alert ID

**Response:** `204 No Content`

---

## Timing Management APIs

### Get All Timings (Public)

**Endpoint:** `GET /api/timings`

**Description:** Get all active timings

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "location": "Main Temple",
    "morningDarshanaStart": "06:00:00",
    "morningDarshanaEnd": "12:00:00",
    "morningPrasadaStart": "11:00:00",
    "morningPrasadaEnd": "13:00:00",
    "eveningDarshanaStart": "17:00:00",
    "eveningDarshanaEnd": "20:00:00",
    "eveningPrasadaStart": "19:00:00",
    "eveningPrasadaEnd": "21:00:00",
    "displayOrder": 1,
    "isActive": true
  }
]
```

---

### Get All Timings (Admin)

**Endpoint:** `GET /api/timings/admin`

**Description:** Get all timings including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`

---

### Create Timing

**Endpoint:** `POST /api/timings`

**Description:** Create a new timing (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "location": "Main Temple",
  "morningDarshanaStart": "06:00:00",
  "morningDarshanaEnd": "12:00:00",
  "morningPrasadaStart": "11:00:00",
  "morningPrasadaEnd": "13:00:00",
  "eveningDarshanaStart": "17:00:00",
  "eveningDarshanaEnd": "20:00:00",
  "eveningPrasadaStart": "19:00:00",
  "eveningPrasadaEnd": "21:00:00",
  "displayOrder": 1,
  "isActive": true
}
```

**Response:** `201 Created`

---

### Update Timing

**Endpoint:** `PUT /api/timings/{id}`

**Description:** Update an existing timing (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Timing ID

**Request Body:** Same as Create Timing

**Response:** `200 OK`

---

### Delete Timing

**Endpoint:** `DELETE /api/timings/{id}`

**Description:** Delete a timing (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Timing ID

**Response:** `204 No Content`

---

### Reorder Timings

**Endpoint:** `POST /api/timings/reorder`

**Description:** Reorder timings by providing ordered list of IDs (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "ids": [3, 1, 2, 4]
}
```

**Response:** `200 OK`

---

## Vishesha Management APIs

### Get All Active Visheshas (Public)

**Endpoint:** `GET /api/visheshas`

**Description:** Get all active visheshas

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "date": "2024-01-15",
    "titleEn": "Vishesha Title",
    "titleKn": "ವಿಶೇಷ ಶೀರ್ಷಿಕೆ",
    "descriptionEn": "Description",
    "descriptionKn": "ವಿವರಣೆ",
    "isActive": true
  }
]
```

---

### Get All Visheshas (Admin)

**Endpoint:** `GET /api/visheshas/admin`

**Description:** Get all visheshas including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`

---

### Get Visheshas by Date Range

**Endpoint:** `GET /api/visheshas/filter`

**Description:** Get visheshas within a date range

**Query Parameters:**
- `startDate` (string, required): Start date in ISO format (YYYY-MM-DD)
- `endDate` (string, required): End date in ISO format (YYYY-MM-DD)

**Example:** `GET /api/visheshas/filter?startDate=2024-01-01&endDate=2024-01-31`

**Response:** `200 OK`

---

### Create Vishesha (Admin)

**Endpoint:** `POST /api/visheshas/admin`

**Description:** Create a new vishesha (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "date": "2024-01-15",
  "titleEn": "Vishesha Title",
  "titleKn": "ವಿಶೇಷ ಶೀರ್ಷಿಕೆ",
  "descriptionEn": "Description",
  "descriptionKn": "ವಿವರಣೆ",
  "isActive": true
}
```

**Response:** `201 Created`

---

### Update Vishesha (Admin)

**Endpoint:** `PUT /api/visheshas/admin/{id}`

**Description:** Update an existing vishesha (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Vishesha ID

**Request Body:** Same as Create Vishesha

**Response:** `200 OK`

---

### Delete Vishesha (Admin)

**Endpoint:** `DELETE /api/visheshas/admin/{id}`

**Description:** Delete a vishesha (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Vishesha ID

**Response:** `204 No Content`

---

## Ekadashi Dwadashi Detail APIs

### Get All Active Ekadashi Dwadashi Details (Public)

**Endpoint:** `GET /api/ekadashi-dwadashi-details`

**Description:** Get all active Ekadashi Dwadashi details

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "date": "2024-01-15",
    "titleEn": "Ekadashi Title",
    "titleKn": "ಏಕಾದಶಿ ಶೀರ್ಷಿಕೆ",
    "descriptionEn": "Description",
    "descriptionKn": "ವಿವರಣೆ",
    "isActive": true
  }
]
```

---

### Get All Ekadashi Dwadashi Details (Admin)

**Endpoint:** `GET /api/ekadashi-dwadashi-details/admin`

**Description:** Get all Ekadashi Dwadashi details including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`

---

### Get Ekadashi Dwadashi Details by Date Range

**Endpoint:** `GET /api/ekadashi-dwadashi-details/filter`

**Description:** Get Ekadashi Dwadashi details within a date range

**Query Parameters:**
- `startDate` (string, required): Start date in ISO format (YYYY-MM-DD)
- `endDate` (string, required): End date in ISO format (YYYY-MM-DD)

**Example:** `GET /api/ekadashi-dwadashi-details/filter?startDate=2024-01-01&endDate=2024-01-31`

**Response:** `200 OK`

---

### Create Ekadashi Dwadashi Detail (Admin)

**Endpoint:** `POST /api/ekadashi-dwadashi-details/admin`

**Description:** Create a new Ekadashi Dwadashi detail (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "date": "2024-01-15",
  "titleEn": "Ekadashi Title",
  "titleKn": "ಏಕಾದಶಿ ಶೀರ್ಷಿಕೆ",
  "descriptionEn": "Description",
  "descriptionKn": "ವಿವರಣೆ",
  "isActive": true
}
```

**Response:** `201 Created`

---

### Update Ekadashi Dwadashi Detail (Admin)

**Endpoint:** `PUT /api/ekadashi-dwadashi-details/admin/{id}`

**Description:** Update an existing Ekadashi Dwadashi detail (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Ekadashi Dwadashi Detail ID

**Request Body:** Same as Create Ekadashi Dwadashi Detail

**Response:** `200 OK`

---

### Delete Ekadashi Dwadashi Detail (Admin)

**Endpoint:** `DELETE /api/ekadashi-dwadashi-details/admin/{id}`

**Description:** Delete an Ekadashi Dwadashi detail (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Ekadashi Dwadashi Detail ID

**Response:** `204 No Content`

---

## Social Media Link APIs

### Get All Social Media Links (Public)

**Endpoint:** `GET /api/social-media`

**Description:** Get all active social media links

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "platform": "FACEBOOK",
    "url": "https://facebook.com/page",
    "isActive": true
  }
]
```

---

### Get All Social Media Links (Admin)

**Endpoint:** `GET /api/social-media/admin`

**Description:** Get all social media links including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`

---

### Create Social Media Link (Admin)

**Endpoint:** `POST /api/social-media/admin`

**Description:** Create a new social media link (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "platform": "FACEBOOK",
  "url": "https://facebook.com/page",
  "isActive": true
}
```

**Response:** `201 Created`

---

### Update Social Media Link (Admin)

**Endpoint:** `PUT /api/social-media/admin/{id}`

**Description:** Update an existing social media link (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Social Media Link ID

**Request Body:** Same as Create Social Media Link

**Response:** `200 OK`

---

### Delete Social Media Link (Admin)

**Endpoint:** `DELETE /api/social-media/admin/{id}`

**Description:** Delete a social media link (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Social Media Link ID

**Response:** `204 No Content`

---

## Contact Management APIs

### Submit Contact Query

**Endpoint:** `POST /api/contact/query`

**Description:** Submit a contact query

**Request Body:**
```json
{
  "fullName": "John Doe",
  "email": "john@example.com",
  "mobileNumber": "+918660743840",
  "category": "General Inquiry",
  "message": "Contact message"
}
```

**Response:** `201 Created`
```json
{
  "id": 1,
  "fullName": "John Doe",
  "email": "john@example.com",
  "mobileNumber": "+918660743840",
  "category": "General Inquiry",
  "message": "Contact message",
  "status": "PENDING",
  "createdAt": "2024-01-01T00:00:00"
}
```

---

### Get All Contact Queries (Admin)

**Endpoint:** `GET /api/contact/queries/admin`

**Description:** Get all contact queries (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "fullName": "John Doe",
    ...
  }
]
```

---

### Update Query Status (Admin)

**Endpoint:** `PUT /api/contact/queries/admin/{id}/status`

**Description:** Update the status of a contact query (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Contact Query ID

**Query Parameters:**
- `status` (string, required): New status (e.g., "PENDING", "RESOLVED", "CLOSED")

**Example:** `PUT /api/contact/queries/admin/1/status?status=RESOLVED`

**Response:** `200 OK`

---

## Contact Location APIs

### Get All Active Contact Locations (Public)

**Endpoint:** `GET /api/contact-locations`

**Description:** Get all active contact locations

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "locationName": "Main Office",
    "address": "123 Temple St",
    "city": "Bangalore",
    "state": "Karnataka",
    "pincode": "560001",
    "phoneNumber": "+918660743840",
    "email": "contact@example.com",
    "isActive": true,
    "isPro": false
  }
]
```

---

### Get All Contact Locations (Admin)

**Endpoint:** `GET /api/contact-locations/admin`

**Description:** Get all contact locations including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`

---

### Create Contact Location (Admin)

**Endpoint:** `POST /api/contact-locations/admin`

**Description:** Create a new contact location (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "locationName": "Main Office",
  "address": "123 Temple St",
  "city": "Bangalore",
  "state": "Karnataka",
  "pincode": "560001",
  "phoneNumber": "+918660743840",
  "email": "contact@example.com",
  "isActive": true,
  "isPro": false
}
```

**Response:** `201 Created`

---

### Update Contact Location (Admin)

**Endpoint:** `PUT /api/contact-locations/admin/{id}`

**Description:** Update an existing contact location (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Contact Location ID

**Request Body:** Same as Create Contact Location

**Response:** `200 OK`

---

### Delete Contact Location (Admin)

**Endpoint:** `DELETE /api/contact-locations/admin/{id}`

**Description:** Delete a contact location (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Contact Location ID

**Response:** `204 No Content`

---

## Announcement Management APIs

### Get All Announcements (Public)

**Endpoint:** `GET /api/announcements`

**Description:** Get all active announcements

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "titleEn": "Announcement Title",
    "titleKn": "ಘೋಷಣೆ ಶೀರ್ಷಿಕೆ",
    "messageEn": "Announcement message",
    "messageKn": "ಘೋಷಣೆ ಸಂದೇಶ",
    "isActive": true,
    "createdAt": "2024-01-01T00:00:00"
  }
]
```

---

### Get Announcement by ID (Public)

**Endpoint:** `GET /api/announcements/{id}`

**Description:** Get a specific announcement by ID

**Path Parameters:**
- `id` (long): Announcement ID

**Response:** `200 OK`
```json
{
  "id": 1,
  "titleEn": "Announcement Title",
  ...
}
```

---

### Create Announcement (Admin)

**Endpoint:** `POST /api/announcements/admin`

**Description:** Create a new announcement (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "titleEn": "Announcement Title",
  "titleKn": "ಘೋಷಣೆ ಶೀರ್ಷಿಕೆ",
  "messageEn": "Announcement message",
  "messageKn": "ಘೋಷಣೆ ಸಂದೇಶ",
  "isActive": true
}
```

**Response:** `201 Created`

---

### Get All Announcements (Admin)

**Endpoint:** `GET /api/announcements/admin`

**Description:** Get all announcements including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`

---

### Update Announcement (Admin)

**Endpoint:** `PUT /api/announcements/admin/{id}`

**Description:** Update an existing announcement (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Announcement ID

**Request Body:** Same as Create Announcement

**Response:** `200 OK`

---

### Delete Announcement (Admin)

**Endpoint:** `DELETE /api/announcements/admin/{id}`

**Description:** Delete an announcement (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Announcement ID

**Response:** `204 No Content`

---

## App Feature APIs

### Get All App Features

**Endpoint:** `GET /api/app-features`

**Description:** Get all app features with their enabled status

**Response:** `200 OK`
```json
[
  {
    "feature_name": "EVENT_CALENDAR",
    "is_enabled": true
  },
  {
    "feature_name": "ONLINE_SEVA",
    "is_enabled": true
  }
]
```

---

### Update Feature Status

**Endpoint:** `PUT /api/app-features/{featureName}`

**Description:** Update feature status (Admin only)

**Path Parameters:**
- `featureName` (string): Feature name (e.g., "EVENT_CALENDAR")

**Request Body:**
```json
{
  "is_enabled": true
}
```

**Response:** `200 OK`
```json
{
  "feature_name": "EVENT_CALENDAR",
  "is_enabled": true
}
```

---

## Seva Management APIs

### Get All Sevas

**Endpoint:** `GET /api/sevas`

**Description:** Get all SEVAS (for admin) or only enabled SEVAS (for users)

**Headers (Optional):**
- `X-User-Role: ADMIN` - Returns all SEVAS including disabled ones

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "seva_name": "Online Seva",
    "seva_code": "ONLINE_SEVA",
    "is_enabled": true,
    "icon_name": "online_seva_icon",
    "display_order": 1,
    "created_at": "2024-01-01T00:00:00",
    "updated_at": "2024-01-01T00:00:00"
  }
]
```

---

### Update Seva Status (Admin)

**Endpoint:** `PUT /api/sevas/{sevaCode}`

**Description:** Update SEVA status (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `sevaCode` (string): SEVA code (e.g., "ONLINE_SEVA")

**Request Body:**
```json
{
  "is_enabled": true
}
```

**Response:** `200 OK`
```json
{
  "id": 1,
  "seva_name": "Online Seva",
  "seva_code": "ONLINE_SEVA",
  "is_enabled": true,
  "display_order": 1,
  "updated_at": "2024-01-01T00:00:00"
}
```

---

### Update Seva Order (Admin)

**Endpoint:** `PUT /api/sevas/{sevaCode}/order`

**Description:** Update SEVA display order (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `sevaCode` (string): SEVA code

**Request Body:**
```json
{
  "display_order": 1
}
```

**Response:** `200 OK`

---

## Seva Booking APIs

### Create Seva Booking

**Endpoint:** `POST /api/seva-bookings`

**Description:** Create a new seva booking

**Headers (Optional):**
- `X-User-Phone: +918660743840` - User's phone number for validation

**Request Body:**
```json
{
  "userId": 1,
  "sevaCode": "ONLINE_SEVA",
  "sevaName": "Online Seva",
  "amount": 100.00,
  "paymentMode": "UPI",
  "cardType": null,
  "prasadamCollectionMode": "personal",
  "postalAddress": null,
  "paymentDetails": {
    "transactionId": "TXN123456",
    "paymentGateway": "Razorpay"
  },
  "sevaPerformingDate": "2024-01-15"
}
```

**Response:** `201 Created`
```json
{
  "id": 1,
  "userId": 1,
  "sevaCode": "ONLINE_SEVA",
  "sevaName": "Online Seva",
  "amount": 100.00,
  "paymentMode": "UPI",
  "paymentStatus": "PENDING",
  "prasadamCollectionMode": "personal",
  "sevaPerformingDate": "2024-01-15",
  "createdAt": "2024-01-01T00:00:00"
}
```

---

### Get Bookings by User

**Endpoint:** `GET /api/seva-bookings/user/{userId}`

**Description:** Get all bookings for a specific user

**Headers (Optional):**
- `X-User-Phone: +918660743840` - User's phone number for validation

**Path Parameters:**
- `userId` (long): User ID

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "userId": 1,
    "sevaCode": "ONLINE_SEVA",
    ...
  }
]
```

---

### Get Booking by ID

**Endpoint:** `GET /api/seva-bookings/{id}`

**Description:** Get a specific booking by ID

**Path Parameters:**
- `id` (long): Booking ID

**Response:** `200 OK`
```json
{
  "id": 1,
  "userId": 1,
  ...
}
```

---

### Update Payment Status

**Endpoint:** `PUT /api/seva-bookings/{id}/payment-status`

**Description:** Update payment status of a booking

**Path Parameters:**
- `id` (long): Booking ID

**Query Parameters:**
- `paymentStatus` (string, required): Payment status (e.g., "PENDING", "SUCCESS", "FAILED")
- `transactionId` (string, optional): Transaction ID

**Example:** `PUT /api/seva-bookings/1/payment-status?paymentStatus=SUCCESS&transactionId=TXN123456`

**Response:** `200 OK`

---

### Get Aggregated Bookings by Date (Admin)

**Endpoint:** `GET /api/seva-bookings/admin/aggregated`

**Description:** Get aggregated seva bookings by performing date (Admin only)

**Query Parameters:**
- `date` (string, optional): Date in ISO format (YYYY-MM-DD). Defaults to today if not provided

**Example:** `GET /api/seva-bookings/admin/aggregated?date=2024-01-15`

**Response:** `200 OK`
```json
{
  "date": "2024-01-15",
  "totalBookings": 10,
  "totalAmount": 1000.00,
  "bookingsBySeva": {
    "ONLINE_SEVA": {
      "count": 5,
      "amount": 500.00
    }
  }
}
```

---

## Online Seva Item APIs

### Get All Online Seva Items

**Endpoint:** `GET /api/online-seva-items`

**Description:** Get all items (for admin) or only active items (for users)

**Headers (Optional):**
- `X-User-Role: ADMIN` - Returns all items including inactive ones

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "name_en": "Item Name",
    "name_kn": "ಐಟಂ ಹೆಸರು",
    "price": 100.00,
    "is_active": true,
    "display_order": 1,
    "created_at": "2024-01-01T00:00:00",
    "updated_at": "2024-01-01T00:00:00"
  }
]
```

---

### Get Online Seva Item by ID

**Endpoint:** `GET /api/online-seva-items/{id}`

**Description:** Get a specific item by ID

**Path Parameters:**
- `id` (long): Item ID

**Response:** `200 OK`
```json
{
  "id": 1,
  "name_en": "Item Name",
  ...
}
```

---

### Create Online Seva Item (Admin)

**Endpoint:** `POST /api/online-seva-items`

**Description:** Create a new item (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "nameEn": "Item Name",
  "nameKn": "ಐಟಂ ಹೆಸರು",
  "price": 100.00,
  "isActive": true,
  "displayOrder": 1
}
```

**Response:** `201 Created`

---

### Update Online Seva Item (Admin)

**Endpoint:** `PUT /api/online-seva-items/{id}`

**Description:** Update an item (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Item ID

**Request Body:** Same as Create Online Seva Item

**Response:** `200 OK`

---

### Delete Online Seva Item (Admin)

**Endpoint:** `DELETE /api/online-seva-items/{id}`

**Description:** Delete an item (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Item ID

**Response:** `204 No Content`

---

## Daily Seva APIs

### Temple Management

#### Get All Temples (Public)

**Endpoint:** `GET /api/daily-seva/temples`

**Description:** Get all active temples

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "templeNameEn": "Temple Name",
    "templeNameKn": "ದೇವಸ್ಥಾನ ಹೆಸರು",
    "isActive": true
  }
]
```

---

#### Get All Temples (Admin)

**Endpoint:** `GET /api/daily-seva/temples/admin`

**Description:** Get all temples including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`

---

#### Create Temple (Admin)

**Endpoint:** `POST /api/daily-seva/temples/admin`

**Description:** Create a new temple (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "templeNameEn": "Temple Name",
  "templeNameKn": "ದೇವಸ್ಥಾನ ಹೆಸರು",
  "isActive": true
}
```

**Response:** `201 Created`

---

#### Update Temple (Admin)

**Endpoint:** `PUT /api/daily-seva/temples/admin/{id}`

**Description:** Update an existing temple (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Temple ID

**Request Body:** Same as Create Temple

**Response:** `200 OK`

---

#### Delete Temple (Admin)

**Endpoint:** `DELETE /api/daily-seva/temples/admin/{id}`

**Description:** Delete a temple (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Temple ID

**Response:** `204 No Content`

---

### Seva Management

#### Get Sevas by Temple (Public)

**Endpoint:** `GET /api/daily-seva/temples/{templeId}/sevas`

**Description:** Get all active sevas for a temple

**Path Parameters:**
- `templeId` (long): Temple ID

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "templeId": 1,
    "sevaNameEn": "Seva Name",
    "sevaNameKn": "ಸೇವಾ ಹೆಸರು",
    "isActive": true,
    "displayOrder": 1
  }
]
```

---

#### Get Sevas by Temple (Admin)

**Endpoint:** `GET /api/daily-seva/temples/{templeId}/sevas/admin`

**Description:** Get all sevas for a temple including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `templeId` (long): Temple ID

**Response:** `200 OK`

---

#### Create Seva (Admin)

**Endpoint:** `POST /api/daily-seva/sevas/admin`

**Description:** Create a new seva (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "templeId": 1,
  "sevaNameEn": "Seva Name",
  "sevaNameKn": "ಸೇವಾ ಹೆಸರು",
  "isActive": true,
  "displayOrder": 1
}
```

**Response:** `201 Created`

---

#### Update Seva (Admin)

**Endpoint:** `PUT /api/daily-seva/sevas/admin/{id}`

**Description:** Update an existing seva (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Seva ID

**Request Body:** Same as Create Seva

**Response:** `200 OK`

---

#### Delete Seva (Admin)

**Endpoint:** `DELETE /api/daily-seva/sevas/admin/{id}`

**Description:** Delete a seva (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Seva ID

**Response:** `204 No Content`

---

### Time Slot Management

#### Get Time Slots by Seva (Public)

**Endpoint:** `GET /api/daily-seva/sevas/{sevaId}/time-slots`

**Description:** Get all active time slots for a seva

**Path Parameters:**
- `sevaId` (long): Seva ID

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "sevaId": 1,
    "startTime": "09:00:00",
    "endTime": "10:00:00",
    "isActive": true
  }
]
```

---

#### Get Time Slots by Seva (Admin)

**Endpoint:** `GET /api/daily-seva/sevas/{sevaId}/time-slots/admin`

**Description:** Get all time slots for a seva including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `sevaId` (long): Seva ID

**Response:** `200 OK`

---

#### Create Time Slot (Admin)

**Endpoint:** `POST /api/daily-seva/time-slots/admin`

**Description:** Create a new time slot (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "sevaId": 1,
  "startTime": "09:00:00",
  "endTime": "10:00:00",
  "isActive": true
}
```

**Response:** `201 Created`

---

#### Update Time Slot (Admin)

**Endpoint:** `PUT /api/daily-seva/time-slots/admin/{id}`

**Description:** Update an existing time slot (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Time Slot ID

**Request Body:** Same as Create Time Slot

**Response:** `200 OK`

---

#### Delete Time Slot (Admin)

**Endpoint:** `DELETE /api/daily-seva/time-slots/admin/{id}`

**Description:** Delete a time slot (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Time Slot ID

**Response:** `204 No Content`

---

## Gosevaa APIs

### Get Gosevaa Information (Public)

**Endpoint:** `GET /api/gosevaa`

**Description:** Get Gosevaa information with video

**Response:** `200 OK`
```json
{
  "id": 1,
  "videoUrl": "https://example.com/video.mp4",
  "infoImageUrl": "https://example.com/image.png",
  "titleEn": "Gosevaa Title",
  "titleKn": "ಗೋಸೇವಾ ಶೀರ್ಷಿಕೆ",
  "descriptionEn": "Description",
  "descriptionKn": "ವಿವರಣೆ",
  "isActive": true,
  "createdAt": "2024-01-01T00:00:00",
  "updatedAt": "2024-01-01T00:00:00"
}
```

---

### Update Gosevaa Information (Admin)

**Endpoint:** `PUT /api/gosevaa/admin/info`

**Description:** Update Gosevaa information (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "video_url": "https://example.com/video.mp4",
  "info_image_url": "https://example.com/image.png",
  "title_en": "Gosevaa Title",
  "title_kn": "ಗೋಸೇವಾ ಶೀರ್ಷಿಕೆ",
  "description_en": "Description",
  "description_kn": "ವಿವರಣೆ"
}
```

**Response:** `200 OK`

---

## Darshan Management APIs

### Darshan Timings (Public)

#### Get All Darshan Timings

**Endpoint:** `GET /api/darshan/timings`

**Description:** Get all darshan timings

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "locationId": 1,
    "locationName": "Main Temple",
    "dayOfWeek": "MONDAY",
    "startTime": "06:00:00",
    "endTime": "12:00:00",
    "isActive": true
  }
]
```

---

### Darshan Timing Management (Admin)

#### Create or Update Darshan Timing

**Endpoint:** `POST /api/admin/darshan/timings`

**Description:** Create or update a darshan timing (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "locationId": 1,
  "dayOfWeek": "MONDAY",
  "startTime": "06:00:00",
  "endTime": "12:00:00",
  "isActive": true
}
```

**Response:** `200 OK`

---

#### Update Darshan Timing

**Endpoint:** `PUT /api/admin/darshan/timings/{id}`

**Description:** Update an existing darshan timing (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Darshan Timing ID

**Request Body:** Same as Create or Update Darshan Timing

**Response:** `200 OK`

---

#### Delete Darshan Timing

**Endpoint:** `DELETE /api/admin/darshan/timings/{id}`

**Description:** Delete a darshan timing (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Darshan Timing ID

**Response:** `204 No Content`

---

#### Get Timings by Location (Admin)

**Endpoint:** `GET /api/admin/darshan/timings/location/{locationId}`

**Description:** Get all timings for a specific location (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `locationId` (long): Location ID

**Response:** `200 OK`

---

### Darshan Slot Management (Admin)

#### Create Darshan Slot

**Endpoint:** `POST /api/admin/darshan/slots`

**Description:** Create a new darshan slot (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "locationId": 1,
  "timingId": 1,
  "slotTime": "09:00:00",
  "maxCapacity": 50,
  "isActive": true
}
```

**Response:** `201 Created`

---

#### Update Darshan Slot

**Endpoint:** `PUT /api/admin/darshan/slots/{id}`

**Description:** Update an existing darshan slot (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Darshan Slot ID

**Request Body:** Same as Create Darshan Slot

**Response:** `200 OK`

---

#### Delete Darshan Slot

**Endpoint:** `DELETE /api/admin/darshan/slots/{id}`

**Description:** Delete a darshan slot (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Darshan Slot ID

**Response:** `204 No Content`

---

#### Get Slots by Location (Admin)

**Endpoint:** `GET /api/admin/darshan/slots/location/{locationId}`

**Description:** Get all slots for a specific location (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `locationId` (long): Location ID

**Response:** `200 OK`

---

### Darshan Location Management (Admin)

#### Get All Darshan Locations

**Endpoint:** `GET /api/admin/darshan/locations`

**Description:** Get all darshan locations including inactive ones (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "locationName": "Main Temple",
    "address": "123 Temple St",
    "isActive": true
  }
]
```

---

#### Create Darshan Location

**Endpoint:** `POST /api/admin/darshan/locations`

**Description:** Create a new darshan location (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "locationName": "Main Temple",
  "address": "123 Temple St",
  "isActive": true
}
```

**Response:** `201 Created`

---

#### Update Darshan Location

**Endpoint:** `PUT /api/admin/darshan/locations/{id}`

**Description:** Update an existing darshan location (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Location ID

**Request Body:** Same as Create Darshan Location

**Response:** `200 OK`

---

#### Delete Darshan Location

**Endpoint:** `DELETE /api/admin/darshan/locations/{id}`

**Description:** Delete a darshan location (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Location ID

**Response:** `204 No Content`

---

## Calendar Data APIs

### Get Calendar Data by Date (Public)

**Endpoint:** `GET /api/calendar/date/{date}`

**Description:** Get calendar data for a specific date

**Path Parameters:**
- `date` (string): Date in ISO format (YYYY-MM-DD)

**Example:** `GET /api/calendar/date/2024-01-15`

**Response:** `200 OK`
```json
{
  "id": 1,
  "date": "2024-01-15",
  "tithiEn": "Tithi Name",
  "tithiKn": "ತಿಥಿ ಹೆಸರು",
  "nakshatraEn": "Nakshatra Name",
  "nakshatraKn": "ನಕ್ಷತ್ರ ಹೆಸರು",
  "paksha": "Shukla",
  "masa": "Magha",
  "isActive": true
}
```

---

### Get Calendar Data by Month (Public)

**Endpoint:** `GET /api/calendar/month/{year}/{month}`

**Description:** Get calendar data for a specific month

**Path Parameters:**
- `year` (integer): Year (e.g., 2024)
- `month` (integer): Month (1-12)

**Example:** `GET /api/calendar/month/2024/1`

**Response:** `200 OK`
```json
[
  {
    "id": 1,
    "date": "2024-01-01",
    ...
  }
]
```

---

### Get Calendar Data by Date Range (Public)

**Endpoint:** `GET /api/calendar/range`

**Description:** Get calendar data for a date range

**Query Parameters:**
- `startDate` (string, required): Start date in ISO format (YYYY-MM-DD)
- `endDate` (string, required): End date in ISO format (YYYY-MM-DD)

**Example:** `GET /api/calendar/range?startDate=2024-01-01&endDate=2024-01-31`

**Response:** `200 OK`

---

### Create or Update Calendar Data (Admin)

**Endpoint:** `POST /api/calendar/admin`

**Description:** Create or update calendar data (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Request Body:**
```json
{
  "date": "2024-01-15",
  "tithiEn": "Tithi Name",
  "tithiKn": "ತಿಥಿ ಹೆಸರು",
  "nakshatraEn": "Nakshatra Name",
  "nakshatraKn": "ನಕ್ಷತ್ರ ಹೆಸರು",
  "paksha": "Shukla",
  "masa": "Magha",
  "isActive": true
}
```

**Response:** `201 Created`

---

### Delete Calendar Data (Admin)

**Endpoint:** `DELETE /api/calendar/admin/{id}`

**Description:** Delete calendar data (Admin only)

**Headers:**
- `X-User-Role: ADMIN`

**Path Parameters:**
- `id` (long): Calendar Data ID

**Response:** `204 No Content`

---

## Analytics APIs

All analytics endpoints require admin access.

**Headers:**
- `X-User-Role: ADMIN`

---

### Get Daily Analytics

**Endpoint:** `GET /api/admin/analytics/daily`

**Description:** Get daily analytics for a specific date

**Query Parameters:**
- `date` (string, required): Date in ISO format (YYYY-MM-DD)

**Example:** `GET /api/admin/analytics/daily?date=2024-01-15`

**Response:** `200 OK`
```json
{
  "date": "2024-01-15",
  "totalBookings": 10,
  "totalRevenue": 1000.00,
  "bookingsBySeva": {...},
  "paymentModeBreakdown": {...}
}
```

---

### Get Weekly Analytics

**Endpoint:** `GET /api/admin/analytics/weekly`

**Description:** Get weekly analytics starting from a specific date

**Query Parameters:**
- `startDate` (string, required): Start date in ISO format (YYYY-MM-DD)

**Example:** `GET /api/admin/analytics/weekly?startDate=2024-01-15`

**Response:** `200 OK`

---

### Get Monthly Analytics

**Endpoint:** `GET /api/admin/analytics/monthly`

**Description:** Get monthly analytics for a specific month

**Query Parameters:**
- `year` (integer, required): Year (e.g., 2024)
- `month` (integer, required): Month (1-12)

**Example:** `GET /api/admin/analytics/monthly?year=2024&month=1`

**Response:** `200 OK`

---

### Get Custom Range Analytics

**Endpoint:** `GET /api/admin/analytics/range`

**Description:** Get analytics for a custom date range

**Query Parameters:**
- `startDate` (string, required): Start date in ISO format (YYYY-MM-DD)
- `endDate` (string, required): End date in ISO format (YYYY-MM-DD)

**Example:** `GET /api/admin/analytics/range?startDate=2024-01-01&endDate=2024-01-31`

**Response:** `200 OK`

---

### Get Active Users Statistics

**Endpoint:** `GET /api/admin/analytics/active-users`

**Description:** Get active users statistics

**Response:** `200 OK`
```json
{
  "totalUsers": 1000,
  "activeUsersLast7Days": 500,
  "activeUsersLast30Days": 800,
  "newUsersToday": 10
}
```

---

### Get Payment Mode Analytics

**Endpoint:** `GET /api/admin/analytics/payment-mode`

**Description:** Get payment mode analytics

**Query Parameters:**
- `startDate` (string, optional): Start date in ISO format (YYYY-MM-DD)
- `endDate` (string, optional): End date in ISO format (YYYY-MM-DD)

**Example:** `GET /api/admin/analytics/payment-mode?startDate=2024-01-01&endDate=2024-01-31`

**Response:** `200 OK`
```json
{
  "paymentModes": {
    "UPI": {
      "count": 50,
      "amount": 5000.00
    },
    "CARD": {
      "count": 30,
      "amount": 3000.00
    }
  }
}
```

---

### Get Seva-wise Analytics

**Endpoint:** `GET /api/admin/analytics/seva-wise`

**Description:** Get seva-wise analytics

**Query Parameters:**
- `startDate` (string, optional): Start date in ISO format (YYYY-MM-DD)
- `endDate` (string, optional): End date in ISO format (YYYY-MM-DD)

**Example:** `GET /api/admin/analytics/seva-wise?startDate=2024-01-01&endDate=2024-01-31`

**Response:** `200 OK`
```json
{
  "sevas": {
    "ONLINE_SEVA": {
      "count": 20,
      "amount": 2000.00
    },
    "DAILY_SEVA": {
      "count": 15,
      "amount": 1500.00
    }
  }
}
```

---

## Error Responses

### Common HTTP Status Codes

- `200 OK` - Request successful
- `201 Created` - Resource created successfully
- `204 No Content` - Resource deleted successfully
- `400 Bad Request` - Invalid request parameters
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Admin access required
- `404 Not Found` - Resource not found
- `409 Conflict` - Resource conflict (e.g., duplicate entry)
- `500 Internal Server Error` - Server error

### Error Response Format

```json
{
  "error": "Error message",
  "status": 400,
  "timestamp": "2024-01-01T00:00:00"
}
```

---

## Notes

1. All timestamps are in ISO 8601 format (YYYY-MM-DDTHH:mm:ss)
2. Date parameters should be in ISO format (YYYY-MM-DD)
3. Time parameters should be in HH:mm:ss format
4. All admin endpoints require the `X-User-Role: ADMIN` header
5. CORS is enabled for all origins (`*`)
6. Request bodies should use `Content-Type: application/json`
7. Phone numbers should be provided without country code in path parameters, but with country code in request bodies when applicable

---

## Support

For issues or questions, please contact the development team.

