# 🍔 ZioBite - Food Delivery Web Application

![Java](https://img.shields.io/badge/Java-17-orange)
![JSP](https://img.shields.io/badge/JSP-Servlet-blue)
![MySQL](https://img.shields.io/badge/MySQL-Database-blue)
![JDBC](https://img.shields.io/badge/JDBC-Connectivity-green)
![License](https://img.shields.io/badge/License-MIT-green)

## 📌 Project Overview

**ZioBite** is a modern Food Delivery Web Application developed using **Java, JSP, Servlets, JDBC, and MySQL** following the **DAO Design Pattern**.

The application enables users to browse restaurants, explore menus, add food items to the cart, place orders securely, and track previous orders through an elegant Order History interface.

---

# 🚀 Features

### 👤 User Module

* User Registration
* User Login & Logout
* Session Management
* Secure Authentication

### 🍽 Restaurant Module

* Browse Restaurants
* Restaurant Details
* Restaurant Images
* Cuisine Information
* Delivery Time
* Ratings

### 📋 Menu Module

* Restaurant-wise Menu
* Food Images
* Food Description
* Price Display
* Availability Status

### 🛒 Cart Module

* Add to Cart
* Update Quantity
* Remove Item
* Dynamic Price Calculation

### 💳 Checkout Module

* Delivery Address
* Cash on Delivery
* UPI Payment
* Credit / Debit Card
* Delivery Fee
* Platform Fee
* GST Calculation
* Grand Total

### 📦 Order Module

* Place Order
* Store Order Details
* Store Order Items
* Payment Method
* Order Status
* Order History

### 📜 Order History

* Restaurant Details
* Ordered Food Items
* Food Images
* Quantity
* Delivery Fee
* Platform Fee
* Grand Total
* Payment Mode
* Order Date
* Order Status

---

# 🛠 Technology Stack

## Frontend

* HTML5
* CSS3
* JavaScript
* JSP

## Backend

* Java
* Servlets
* JDBC

## Database

* MySQL

## Design Pattern

* DAO Design Pattern

## Server

* Apache Tomcat 10

## IDE

* Eclipse IDE

---

# 📂 Project Structure

```text
ZioBite
│
├── src
│   ├── DAO
│   ├── DAOImpl
│   ├── DBConnection
│   ├── model
│   └── servlet
│
├── WebContent
│   ├── css
│   ├── images
│   ├── js
│   ├── login.jsp
│   ├── register.jsp
│   ├── home.jsp
│   ├── restaurant.jsp
│   ├── menu.jsp
│   ├── cart.jsp
│   ├── checkout.jsp
│   ├── orderHistory.jsp
│   └── orderSuccess.jsp
│
├── database
│   └── ziobite.sql
│
└── README.md
```

---

# 🗄 Database Tables

* user
* restaurant
* menu
* cart
* orders
* order_item

---

# 📷 Screenshots

## 🏠 Home Page

(Add Screenshot Here)

---

## 🍽 Restaurant Page

(Add Screenshot Here)

---

## 📋 Menu Page

(Add Screenshot Here)

---

## 🛒 Cart Page

(Add Screenshot Here)

---

## 💳 Checkout Page

(Add Screenshot Here)

---

## 📦 Order History

(Add Screenshot Here)

---

# ⚙ Installation

### Clone Repository

```bash
git clone https://github.com/sarathi-sekar/ZioBite-Food-Delivery-WebApp.git
```

### Import Project

* Open Eclipse IDE
* Import Existing Dynamic Web Project

### Database

* Create MySQL Database

```sql
CREATE DATABASE ziobite;
```

* Import

```
database/ziobite.sql
```

### Configure Database

Update your JDBC configuration inside

```
DBConnection.java
```

### Run

* Apache Tomcat 10
* Start Server
* Open Browser

```
http://localhost:8080/ZioBite
```

---

# 💡 Highlights

* Responsive User Interface
* MVC Architecture
* DAO Design Pattern
* JDBC Connectivity
* Session Management
* Dynamic Order Processing
* Professional UI Design

---

# 📈 Future Enhancements

* Live Order Tracking
* Email Notifications
* Restaurant Dashboard
* Admin Dashboard
* Coupon System
* Wallet Payment
* Online Payment Gateway
* Food Reviews & Ratings
* Wishlist
* Search & Filter

---

# 👨‍💻 Developed By

**Sarathi Sekar**

B.Tech Artificial Intelligence & Data Science

2026 Graduate

---

# ⭐ Support

If you like this project, don't forget to ⭐ Star this repository on GitHub.
