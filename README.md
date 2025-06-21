# Restaurant Management System - ESP32 Smart Ordering Platform

A comprehensive IoT-based restaurant management system for **Bistro 92**, featuring ESP32-powered smart ordering pads, real-time order processing, and intelligent dashboard analytics.

![Smart Ordering Device Interface](https://github.com/user-attachments/assets/83a51de6-58bc-4e5f-8bd6-b8a8072866a4)

## 🌟 Features

### Core Functionality

- **Smart Ordering Interface**: ESP32-based touchpad system for table-side ordering
- **Real-time Order Management**: RESTful API with concurrency control and stock management
- **Live Dashboard**: Power BI integration for order tracking and analytics
- **Cloud Integration**: Seamless data synchronization with Google Sheets
- **Rate Limiting**: Built-in protection against API abuse

### Advanced Capabilities

- **Inventory Management**: Real-time stock tracking with automatic reservation
- **Concurrency Control**: Handles multiple simultaneous orders without data conflicts
- **Nutritional Information**: Interactive allergen and dietary preference support
- **Customer Personalization**: Menu recommendations
- **Scalable Architecture**: Cloud-ready design for high-volume operations

## 📊 API Documentation

### Base URL

```
http://localhost:3000
```

### Endpoints

#### Create Order

```http
POST /orders
Content-Type: application/json

{
    "table_no": 1,
    "items": [
        {"item_id": 1, "quantity": 2},
        {"item_id": 2, "quantity": 1}
    ],
    "total_price": 25.50
}
```

#### Get Order

```http
GET /orders/{order_id}
```

#### Update Order

```http
PUT /orders/{order_id}
Content-Type: application/json

{
    "items": [{"item_id": 1, "quantity": 3}],
    "total_price": 30.00,
    "status": "Completed"
}
```

#### Delete Order

```http
DELETE /orders/{order_id}
```

#### Get All Orders

```http
GET /orders
```

### Response Format

**Success Response:**

```json
{
  "order_id": 1,
  "status": "Order placed successfully",
  "order_time": "2025-04-27T15:01:15.625Z"
}
```

**Error Response:**

```json
{
  "error": "Not enough stock for item Burger"
}
```

## 🗄️ Database Schema

The system uses PostgreSQL with optimized indexing for fast query performance:

```sql
CREATE TABLE public."Orders"
(
    "ID" SERIAL PRIMARY KEY,
    "OrderID" INTEGER NOT NULL,
    "TableNo" INTEGER NOT NULL,
    "Item" TEXT NOT NULL,
    "Quantity" INTEGER NOT NULL,
    "ConfirmedAt" TIMESTAMP,
    "CompletedAt" TIMESTAMP
);
```

### Sample Queries

**Get orders from the last hour:**

```sql
SELECT *
FROM public."Orders"
WHERE "ConfirmedAt" >= (
    SELECT MAX("ConfirmedAt")
    FROM public."Orders"
) - INTERVAL '1 hour';
```

[View Complete Database Schema](./Bistro%2092%20Orders.sql)

## 🏗️ System Architecture

### Hardware Components

- **ESP32 Microcontroller**: Core processing unit for table devices
- **OLED Display (128x64)**: Menu visualization and order confirmation
- **Physical Buttons**: Tactile navigation interface
- **WiFi Module**: Cloud connectivity for real-time updates

### Software Stack

- **Backend**: Node.js with Express framework
- **Database**: PostgreSQL with optimized schemas
- **Cloud Storage**: Google Sheets integration via Apps Script
- **Dashboard**: Power BI for real-time analytics
- **Rate Limiting**: Express-rate-limit middleware
- **Caching**: Redis for improved performance (optional)

### Security Features

- Rate limiting (100 requests/minute per IP)
- Input validation and sanitization
- HTTPS encryption for cloud communication
- Tamper-resistant hardware mounting

## 📊 Dashboard Analytics

The Power BI dashboard provides:

- Real-time order status tracking
- Average fulfillment time metrics
- Daily/weekly sales analytics
- Peak hour identification
- Customer preference insights

![Dashboard Preview](Bistro%2092%20Dashboard%20Sample.png)

[View Complete Dashboard](./Bistro%2092%20Dashboard.pbix)

## 🔧 Hardware Demo

Watch the hardware demonstration: [Hardware Video](https://youtu.be/azEXXtFjfoU)
