/* 
	Capstone Blue Team
    Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
    04-12-2023
    Provisio: Database Dev Assignment
    
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
    roomID int, -- 1 = double full beds, 2 = queen, 3 = double queen beds, and 4 = king
    guests int, -- number of guests 1-5
    wifi BOOLEAN, -- T/F if they want amenity
    breakfast BOOLEAN, -- T/F if they want amenity
    parking BOOLEAN, -- T/F if they want amenity
    price DECIMAL(6,2) -- 6 digits, 2 after decimal, 4 before, good for dollar value
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
	hotelID INT,
	attractionName VARCHAR(50),
	attractionDescription VARCHAR(500)
);

DROP TABLE IF EXISTS Provisio.Rooms;
CREATE TABLE Provisio.Rooms
(
	roomID int NOT NULL PRIMARY KEY,
	roomDescription VARCHAR(20), -- 1 = double full beds, 2 = queen, 3 = double queen beds, and 4 = king
	roomPrice DECIMAL(6,2) -- 6 digits, 2 after decimal, 4 before, good for dollar value
);


/*Populate Tables*/
INSERT INTO Provisio.Customers(customerID, firstName, lastName, userEmail, userPassword, loyaltyPoints)
VALUES
(1234, 'John', 'Smith', 'johnsmith@gmail.com', SHA2('ilovehotels123', 256), 750),
(5263, 'Jane', 'Doe', 'janedoe@gmail.com', SHA2('ihatehotels456', 256), 300),
(8844, 'Engelbert', 'Abernathy', 'eng.abernathy@gmail.com', SHA2('travel4business', 256), 3450),
(7654, 'Kate', 'Cross', 'kcross@yahoo.com', SHA2('outdoorlover99', 256), 1800),
(3369, 'Liza', 'Walker', 'lizalady@hotmail.com', SHA2('apple123', 256), 2100),
(1475, 'Jason', 'Kennedy', 'jasonk@gmail.com', SHA2('z00mz00m', 256), 1650)
;


INSERT INTO Provisio.Hotels(hotelID, hotelName, hotelAddress, hotelPictureURL, hotelNotes)
VALUES
-- (872, 'Hilton', '1234 Hilton Way, Hilton, USA 900000', 'images/872/hotelImage.jpeg', 'Not a Hilton Hotel'),
-- (225, 'Marriot', '1234 Marriott Ave, Marriott, USA 800000', 'images/225/hotelImage.jpeg', 'Is a Marriott Hotel'),
(445, 'Hyatt', '939 S Figueroa St, Los Angeles, CA 90015', 'images/445/hotelImage.jpg', 'Upmarket Downtown hotel with Spanish Colonial styling, an outdoor pool & chic Mediterranean dining.'),
(595, 'Edgewater', '2411 Alaskan Wy, Seattle, WA 98121', 'images/595/hotelImage.jpg', 'Local seafood leads the seasonal menus at this New American spot with views unlike any other.'),
(734, 'Blossom', '7118 Bertner Ave, Houston, TX 77030', 'images/734/hotelImage.jpg', 'Refined quarters in an upmarket hotel featuring a rooftop pool, a restaurant & a fitness center.'),
(351, 'DoubleTree', '5780 Major Blvd, Orlando, FL 32819', 'images/351/hotelImage.jpg', 'Casual lodging at the entrance to Universal Studios, with an outdoor pool, restaurants & a shuttle.'),
(804, 'Godfrey', '505 Washington St, Boston, MA 02111', 'images/804/hotelImage.jpg', 'Polished hotel in a pre-war building offering contemporary rooms & suites, plus a sophisticated bar.')
;

INSERT INTO Provisio.Rooms(roomID, roomDescription, roomPrice)
VALUES
(1, "Double Full", 115.50),
(2, "Queen", 131.50),
(3, "Double Queen", 157.50),
(4, "King", 173.25)
;


INSERT INTO Provisio.Attractions(attractionID, hotelID,	attractionName,	attractionDescription)
VALUES
(41, 445, "LA Dodgers Game", "The 3rd oldest ballpark in America, with a 55,000-seat capacity, it offers fans sweeping views of Los Angeles. The Californian sun provides a great backdrop for fans to enjoy their Dodger experience"),
(42, 445, "Iconic Sights of LA Tour", "Tick off Los Angeles’ top attractions in just one day on this city tour. Zip seamlessly between dispersed attractions such as Santa Monica Pier, Venice Beach, Hollywood, Beverly Hills and more via air-conditioned coach."),
(43, 445, "Aquarium of the Pacific", "Explore the farthest depths of the Pacific Ocean right in Long Beach. Get a close encounter more than 500 marine species, from predatory reef sharks and delicate sea horses to playful penguins and otters."),

(51, 595, "Mt. Rainier Day Trip", "With massive glaciers, powerful waterfalls, and alpine meadows, Mount Rainier National Park is among one of Washington's most spectacular reserves."),
(52, 595, "Harbor Cruise", "See some of Seattle’s most famous landmarks from the water during this guided harbor cruise that has been running since 1949. Hop aboard, and head to either the lower deck or upper sun deck to take in stunning views of Mt. Rainier, the Space Needle, and the Seattle Great Wheel."),
(53, 595, "Space Needle and Chihuly Garden and Glass", "Visit two Seattle attractions in one day. From the Space Needle Observation Deck, enjoy sweeping views over Puget Sound, Mount Rainier, and downtown Seattle. Next door at ground level, take in the galleries of Chihuly Garden and Glass museum, which contain colorful exhibits of glass art set in exquisitely landscaped indoor and outdoor gardens."),

(71, 734, "Space Center Houston", "All-day access to the center: letting you explore must-sees such as the Astronaut and Starship Galleries; take a tram tour of the NASA Johnson Space Center, and more; at your own pace."),
(72, 734, "City Driving Tour", "Ideal for first-time visitors interested in an efficient orientation, this small-group tour provides easy first-hand views of Houston’s top architecture, historical landmarks, green spaces, and sporting venues."),
(73, 734, "Indoor Skydiving", "Try skydiving without the death-defying heights and high price-tag of jumping from an airplane! This indoor skydiving experience at iFly Houston Woodlands simulates the adrenaline rush of a freefall in the safe and adjustable environment."),

(31, 351, "Glass Bottom Guided Kayak Tour", "Florida is home to a biodiverse ecosystem and one of the best ways to explore is by kayak. Board a glass-bottom kayak with a small group and follow your guide on an eco-tour of Rainbow Springs for unparalleled views of the underwater world."),
(32, 351, "Helicopter Night Tour", "See magical Orlando from a helicopter! You can have a bird’s eye view of the theme parks, the Orlando Eye, the Florida sunset or even catch some fireworks on your sightseeing chopper tour."),
(33, 351, "Wander & Eat on Orlando's Main Street", "Get off the beaten path and try some great food while you’re at it with a visit to Orlando's Milk District, one of the best spots in town to sample delicious cuisine. On this small-group guided tour, you'll try all sorts of food and drink with your local guide."),

(81, 804, "Duck Boat Sightseeing City Tour", "Boston is best seen by land and water, and this duck tour takes you from Boston Common to the Charles River on a single excursion, all while riding in a rolling, floating piece of American military history."),
(82, 804, "Revolutionary Story Walking Tour", "Learn about Boston’s revolutionary history on a walking tour that emphasizes good storytelling. Enjoy personalized attention from your guide in your small group as you walk a curated route that includes the Freedom Trail."),
(83, 804, "Boston Ghosts and Gravestones Trolley Tour", "Hop aboard the Trolley of the Doomed and unveil the haunted side of Boston on this alternative evening tour of the city’s spookiest corners. Lead by a costumed host, this tour dives into the haunted history of the city by visiting two of the oldest burying grounds in Boston.")
;

INSERT INTO Provisio.Reservations(reservationID, customerID, hotelID, checkIn, checkOut, roomID, guests, wifi, breakfast, parking, price)
VALUES
(67283, 1234, 445, '2023-04-18', '2023-04-23', 4, 3, FALSE, TRUE, TRUE, 969.5),
(82734, 5263, 595, '2023-07-26', '2023-07-28', 3, 1, TRUE, FALSE, TRUE, 352.97),

(88156, 8844, 445, '2022-08-18', '2022-08-21', 2, 1, TRUE, FALSE, TRUE, 447.96),
(88145, 8844, 595, '2022-08-26', '2022-08-28', 2, 1, TRUE, FALSE, TRUE, 302.97),
(88956, 8844, 595, '2022-09-02', '2022-09-04', 4, 2, TRUE, TRUE, TRUE, 400.95),
(88456, 8844, 734, '2022-09-14', '2022-09-18', 2, 1, TRUE, FALSE, TRUE, 592.95),
(88854, 8844, 351, '2022-10-12', '2022-10-20', 2, 1, TRUE, FALSE, TRUE, 1172.91),
(88226, 8844, 351, '2022-10-28', '2022-11-01', 4, 2, TRUE, TRUE, TRUE, 788.91),

(76885, 7654, 351, '2022-06-06', '2022-06-09', 2, 1, TRUE, FALSE, FALSE, 387.99),
(76656, 7654, 804, '2022-08-10', '2022-08-12', 2, 1, TRUE, FALSE, FALSE, 262.99),
(76225, 7654, 351, '2022-11-18', '2022-11-25', 3, 2, TRUE, TRUE, TRUE, 1265.85),

(33558, 3369, 445, '2022-03-03', '2022-03-13', 4, 2, FALSE, TRUE, TRUE, 1939.80),
(33448, 3369, 445, '2022-12-08', '2022-12-12', 4, 2, FALSE, TRUE, TRUE, 775.92),

(14332, 1475, 445, '2022-04-18', '2022-04-19', 1, 1, TRUE, FALSE, FALSE, 122.99),
(14667, 1475, 351, '2022-06-04', '2022-06-08', 3, 2, TRUE, TRUE, TRUE, 728.91),
(14877, 1475, 445, '2022-06-16', '2022-06-18', 1, 1, TRUE, FALSE, FALSE, 232.99),
(14490, 1475, 734, '2022-11-14', '2022-11-18', 1, 1, TRUE, FALSE, FALSE, 452.99)
;