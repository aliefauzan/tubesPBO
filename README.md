# Warehouse Storage Tracking System

A robust warehouse inventory management system built with Java, App Engine, and Cloud SQL.

## Overview

This application provides an efficient solution for tracking warehouse storage, managing inventory, and recording transaction history. It allows users to:

- View, add, edit, and remove products in inventory
- Track product entries and withdrawals
- View transaction history
- Monitor stock levels with a user-friendly dashboard

## Technologies Used

- **Backend**: Java with JDBC for database connectivity
- **Frontend**: JSP (JavaServer Pages) with Bootstrap 5 for responsive UI
- **Database**: Cloud SQL (MySQL)
- **Hosting**: Google App Engine for scalable backend services

## Features

- **User Authentication**: Secure login and registration system
- **Dashboard**: Overview of current inventory status and recent transactions
- **Inventory Management**: Add, edit, view, and delete products
- **Transaction Tracking**: Record and view history of all product movements
- **Responsive Design**: Mobile-friendly interface

## Database Structure

The application uses several tables including:
- `users`: Stores user authentication information
- `barang`: Stores product inventory information
- `history`: Records transaction history for inventory changes

## Installation and Setup

### Prerequisites
- Java Development Kit (JDK) 8 or higher
- NetBeans IDE or equivalent
- MySQL database
- Google Cloud SDK (for App Engine deployment)

### Local Development
1. Clone the repository
2. Open the project in NetBeans IDE
3. Configure database connection in `src/java/JDBC/JDBC.java`
4. Build and run the project

### Deployment
1. Configure App Engine settings in your Google Cloud Console
2. Deploy using Google Cloud SDK:
   ```
   gcloud app deploy
   ```

## Project Structure

- `src/java/JDBC`: Database connection and query methods
- `web`: JSP pages and web assets
  - `index.jsp`: Login page
  - `menu.jsp`: Dashboard view
  - `view.jsp`: Inventory listing
  - `add.jsp`: Form to add new products
  - `ambil.jsp`: Form to withdraw products
  - `history.jsp`: Transaction history view
