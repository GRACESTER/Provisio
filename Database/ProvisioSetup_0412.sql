/* 
	Capstone Blue Team
    Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
    04-02-2023
    Module 5.1 Assignment: Provisio: Database Dev Assignment
    
    This script will create the Database and tables needed for the Provisio Website Project
*/

/* Create the database */
DROP DATABASE IF EXISTS Provisio;
CREATE DATABASE IF NOT EXISTS Provisio;
/**********************/

-- remove user if it already exists to reset if needed
DROP USER IF EXISTS hotelManagement@'localhost';

-- create the user to manage hotel db and set password
-- give user privileges to manage db
CREATE USER hotelManagement@'localhost' IDENTIFIED BY 'roompass123';
GRANT ALL PRIVILEGES ON Provisio.*  TO hotelManagement@'localhost';


/*Create Tables*/
DROP TABLE IF EXISTS Provisio.Customers;
CREATE TABLE Provisio.Customers
(
	customerID int NOT NULL PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    userEmail VARCHAR(50),
    userPassword VARCHAR(500),
    loyaltyPoints int 
);

DROP TABLE IF EXISTS Provisio.Reservations;
CREATE TABLE Provisio.Reservations
(
	reservationID int NOT NULL PRIMARY KEY,
	customerID int,
    hotelID int,
    checkIn DATE,
    checkOut DATE,
    roomID int,
    price DOUBLE,
    guests int, -- number of guests 1-5
    wifi BOOLEAN, -- T/F if they want amenity
    breakfast BOOLEAN, -- T/F if they want amenity
    parking BOOLEAN -- T/F if they want amenity
);

DROP TABLE IF EXISTS Provisio.Hotels;
CREATE TABLE Provisio.Hotels
(
    hotelID int NOT NULL PRIMARY KEY,
    hotelName VARCHAR(50),
    hotelAddress VARCHAR(50),
    hotelPictureURL VARCHAR(100), -- Pictures will be stored in the website files and a query will pull the image url
    hotelNotes VARCHAR(100)
);

DROP TABLE IF EXISTS Provisio.Attractions;
CREATE TABLE Provisio.Attractions
(
    attractionID int NOT NULL PRIMARY KEY,
    hotelID int,
    attractionName VARCHAR(50),
    attractionDesc VARCHAR(50)
);

DROP TABLE IF EXISTS Provisio.Room;
CREATE TABLE Provisio.Room
(
    RoomID int NOT NULL PRIMARY Key Auto_Increment,
    RoomType VARCHAR(50),
    roomPrice Decimal(5,2)
);