<!-- 
	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/14/2023
	Module 8.1: Web Dev Assignment
	
	This page will display the results of the previously submitted reservation form. The confirm reservation button will update the price in the MySQL table. The cancel reservation button will delete the record.
 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation Summary Page</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #89b2f5;
}
.header{
    background-color: #333;
    text-align: center;
    width: 100%;
    padding: 20px 0;
}
.header a
{
    text-decoration: none;
}
h1{
    text-align: left;
    padding-left: 20px;
    color: white;
    font-size: 32px;
    margin: 0;
    font-weight: 700;
}

#navbar {
    display: flex;
    justify-content: center;
    padding: 10px 0;
}
button {
    background-color: blue;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    transition-duration: 0.4s;
}
button:hover {
    background-color: #45a049;
}

.page-layout {
    display: flex;
    min-height: 100vh;
    flex-direction: column;
    justify-content: flex-start;
}

.container {
    max-width: 800px;
    margin: 30px auto;
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #fff;
}
.form-group {
    margin-bottom: 15px;
}
label {
    display: block;
    font-size: 14px;
    margin-bottom: 5px;
}
input[type="email"],
input[type="password"],
input[type="text"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}
input[type="checkbox"] {
    margin-top: 10px;
    margin-bottom: 20px;
}
.btn {
    background-color: blue;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
}
.btn:hover {
    background-color: #45a049;
}
.alert {
    padding: 20px;
    margin-top: 30px;
    border: 1px solid #ccc;
}
.alert-secondary {
    background-color: #f9f9f9;
}
h2 {
    margin-top: 0;
}
#forgot-password {
    margin-top: 15px;
    text-align: right;
}
.forms-wrapper {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}
.form-container {
    flex: 1;
    padding: 20px;
    box-sizing: border-box;
}
.form-left {
    margin-right: 10px;
    border: 1px solid #ccc;
    background-color: #fff;
    border-radius: 4px;
}
.form-right {
    margin-left: 10px;
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 4px;
}
a.header-link,
a.header-link:hover,
a.header-link:visited,
a.header-link:active {
  text-decoration: none;
  color: inherit;
}
#reg-hotel-info
{
	
	background-color: #0252d4;
	height: 200px;
	width: 700px;
	margin-left: auto;
	margin-right: auto;
	display: flex;
  	justify-content: center;
  	align-items: center;
	
}
#reg-hotel-form
{
	
	background-color: #0252d4;
	/* height: 2000px; */
	width: 700px;
	margin: 0 auto;
	text-align: center;
	
}
#reg-hotel-info-image
{
	background-color: gray;
	width: 20%;
	height: 20%;
	display: inline-block;
	vertical-align: middle;
	margin-right: 10px;
}
#reg-hotel-info-textbox
{
	
	width: 20%;
	height: 100%;
	display: inline-block;
	vertical-align: middle;
	margin-left: 10px;
}
#reg-hotel-form-left
{
	background-color: gray;
	width: 20%;
	height: 100%;
	display: inline-block;
	vertical-align: middle;
	margin-right: 10px;
}
#reg-hotel-form-right
{
	
	width: 20%;
	height: 100%;
	display: inline-block;
	vertical-align: middle;
	margin-left: 10px;
}
table {
  border-collapse: collapse;
  width: 100%;
  max-width: 800px;
  margin: 0 auto;
  font-size: 14px;
}
table th {
  color: #444444;
  font-weight: bold;
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #cccccc;
}
table td {
  padding: 8px;
  border-bottom: 1px solid #cccccc;
}
select {
  width: 50%;
  padding: 8px;
  border: 1px solid #cccccc;
  border-radius: 4px;
  background-color: #ffffff;
  font-size: 14px;
  color: #444444;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 24 24' fill='%23444444' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M7 10l5 5 5-5z'/%3E%3C/svg%3E");
  background-position: right 8px center;
  background-repeat: no-repeat;
}
select:focus {
  outline: none;
  border-color: #0252d4;
}
select option {
  background-color: #ffffff;
  color: #444444;
  font-size: 14px;
  padding: 8px;
}
.date-picker {
  position: relative;
}
.date-picker input {
  width: 40%;
  padding: 8px;
  border: 1px solid #cccccc;
  border-radius: 4px;
  background-color: #ffffff;
  font-size: 14px;
  color: #444444;
  text-align: center;
}
.date-picker input::-webkit-calendar-picker-indicator {
  position: absolute;
  top: 50%;
  right: calc(50% - 70px);
  transform: translateY(-50%);
  width: 16px;
  height: 16px;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 24 24' fill='%23444444' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M19 4h-1V2h-2v2H8V2H6v2H5c-1.11 0-2 .89-2 2v14a2 2 0 002 2h14a2 2 0 002-2V6a2 2 0 00-2-2zm0 16H5V9h14v11z'/%3E%3Cpath d='M0 0h24v24H0z' fill='none'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: center;
  cursor: pointer;
  
}
.date-picker input:focus {
  outline: none;
  border-color: #0252d4;
}

.footer {
    margin-top: auto;
    width: 100%;
    color: white;
    background-color: #333;
    padding: 15px 0;
}
.footer p {
    padding: 0 25px 0;
}

</style>


</head>
<body>

<div class="page-layout">
<%@ include file = "header.html" %>



<%@ page import="javaBeans.ReservationBookingSQL" %>
<%@ page import="java.sql.ResultSet" %>
<%
ReservationBookingSQL reservationBooking = new ReservationBookingSQL();
%>

<jsp:useBean id="javaBeans" class="javaBeans.ReservationBookingSQL" scope="request" />

<%
	int prevResID = reservationBooking.getId();
	
 	System.out.println(prevResID);
	
    ResultSet results = javaBeans.ReturnQuery();
    double roomPricePerNight = 150.00;
    double wifiPrice = 12.99;
    double breakfastPricePerNight = 8.99;
    double parkingPricePerNight = 19.99;
    int loyaltyPointsPerNight = 150;

    if (results != null && results.next()) {
    	int id = results.getInt("reservationID");
        String checkin = results.getString("checkIn");
        String checkout = results.getString("checkOut");
        String roomID = results.getString("roomID");
        String guests = results.getString("guests");
        int hotelID = results.getInt("hotelID");
        int wifi = results.getInt("wifi");
        int breakfast = results.getInt("breakfast");
        int parking = results.getInt("parking");

        java.util.Date checkinDate = java.sql.Date.valueOf(checkin);
        java.util.Date checkoutDate = java.sql.Date.valueOf(checkout);
        long daysBetween = (checkoutDate.getTime() - checkinDate.getTime()) / (1000 * 60 * 60 * 24);
        int numberOfNights = (int) daysBetween;

        double totalPrice = numberOfNights * roomPricePerNight;
        if (wifi == 1) {
            totalPrice += wifiPrice;
        }
        if (breakfast == 1) {
            totalPrice += breakfastPricePerNight * numberOfNights;
        }
        if (parking == 1) {
            totalPrice += parkingPricePerNight * numberOfNights;
        }

        int loyaltyPointsEarned = numberOfNights * loyaltyPointsPerNight;
%>


    <h2>Reservation Summary</h2>
    <p>Reservation ID: <%= id %> </p>
    <p>Check-in Date: <%= checkin %></p>
    <p>Check-out Date: <%= checkout %></p>
   	<p>Room Size: <%= roomID != null ? javaBeans.getRoomDescription(String.valueOf(roomID)) : "NA" %></p>
    <p>Number of Guests: <%= guests %></p>
    <p>Hotel ID: <%= hotelID %></p>
    <p>Total Price: $<%= String.format("%.2f", totalPrice) %></p>
    <p>Points Earned: <%= loyaltyPointsEarned %></p>


<%
   // Check if the form has been submitted
   
   
   if(request.getMethod().equals("POST")) {   
	   
	   // Check which button was pressed
	      String button = request.getParameter("button");
	      if(button != null && button.equals("Confirm Reservation")) {
	    	  System.out.println("REQUEST BEING HANDLED with reservation ID of " + javaBeans.getId());
	          // Create an instance of the ReservationBookingSQL class
	          ReservationBookingSQL booking = new ReservationBookingSQL();     
	          // Call the ConfirmReservation() method with the reservation ID
	          booking.ConfirmReservation(javaBeans.getId(), totalPrice);
	         System.out.println("Reservation confirmed!");
	
	      } else if(button != null && button.equals("Cancel Reservation")) {
	    	  ReservationBookingSQL booking = new ReservationBookingSQL();     
	          // Call the ConfirmReservation() method with the reservation ID
	          booking.CancelReservation(javaBeans.getId());
	         System.out.println("Reservation cancelled!");
	         // TODO: add code to cancel the reservation
	      }
	   
	  
   }
%>


    <form method="post" action="">
        <input type="hidden" name="reservationID" value="<%= javaBeans.getId() %>" />
        <input type="submit" name = button value="Confirm Reservation" />
    </form>
    <form method="post" action="">
        <input type="hidden" name="reservationID" value="<%= javaBeans.getId() %>" />
        <input type="submit" name="button" value="Cancel Reservation" />
    </form>
    
   

<%  } else { %>
    <p>Error: Reservation not found.</p>
<%  } %>


<%@ include file = "footer.html" %>
</div>
		
</body>

</html>