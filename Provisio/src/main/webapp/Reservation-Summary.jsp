<!-- 
	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/14/2023
	Module 8.1: Web Dev Assignment
	
	This page will display the results of the previously submitted reservation form. The confirm reservation button will update the price in the MySQL table. The cancel reservation button will delete the record.
 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="javaBeans.AccountDetails"%>
     <%@page import="java.util.Calendar" %>
     <%@page import="java.text.SimpleDateFormat" %>
     <%@page import="java.text.ParseException" %>
     <%@page import="java.time.LocalDate" %>
     <%@page import="java.util.Date" %>
     <%@page import="java.time.ZoneId" %>
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
button.center {
    display: block;
    margin: 20px auto;
    align: center
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
    background-color: #e2e3e5;
    border-color: #d6d8db;
    color: #383d41;
}
.alert-success {
    background-color: #d4edda;
    border-color: #c3e6cb;
    color: #155724;
}
.alert-danger {
    background-color: #f8d7da;
    border-color: #f5c6cb;
    color: #721c24;
}
.alert-warning {
    background-color: #fff3cd;
    border-color: #ffeeba;
    color: #856404;
}
.alert-info {
    background-color: #d1ecf1;
    border-color: #bee5eb;
    color: #0c5460;
}
.alert-light {
    background-color: #fefefe;
    border-color: #fdfdfe;
    color: #818182;
}
.alert-dark {
    background-color: #d6d8d9;
    border-color: #c6c8ca;
    color: #1b1e21;
}
/* Add the following styles to center the buttons */
.buttons-wrapper {
    display: flex;
    justify-content: center;
    margin: 20px 0;
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
table {
    background-color: #0252d4;
    color: white;
    border-collapse: collapse;
    margin: 0 auto;
    width: 50%;
    max-width: 100%;
    height: auto%;
    max-height: 80vh;
}
th, td {
    padding: 8px;
    text-align: left;
}
h2 {
    text-align: center;
}
.form-wrapper {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 20px;
    margin:0 auto;
    width: 100%;
    overflow:auto;
    
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
    double roomPricePerNight = 1;
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
        
        
        String wifiString = "";
        String breakfastString = "";
        String parkingString = "";
        
        if(wifi > 0)
        {
        	wifiString = "WiFi";
        }
        if(breakfast > 0)
        {
        	breakfastString = "Breakfast";
        }
        if(parking > 0)
        {
        	parkingString = "Parking";
        }
        
        java.util.Date checkinDate = java.sql.Date.valueOf(checkin);
        java.util.Date checkoutDate = java.sql.Date.valueOf(checkout);
        long daysBetween = (checkoutDate.getTime() - checkinDate.getTime()) / (1000 * 60 * 60 * 24);
        int numberOfNights = (int) daysBetween;
        
     	int[][] holidayDates = {
     			{Calendar.JULY, 4},//4th of july holiday
     			{Calendar.DECEMBER, 31},//NYE holiday
     			{Calendar.JANUARY, 1} //NY day holiday
     	};
     	
     	//setting room price        
        switch (roomID) {
        case "1":
            roomPricePerNight = 115.50;
            break;
        case "2":
        	roomPricePerNight = 131.50;
            break;
        case "3":
        	roomPricePerNight = 157.50;
            break;
        case "4":
        	roomPricePerNight = 173.25;
            break;
    	}
     	
     	double priceIncrease = 1.05;
     	double totalPrice = 0.0;
     	
     	System.out.println("Checkin Date: " + checkinDate);
     	
     	LocalDate checkinLocalDate = new java.sql.Date(checkinDate.getTime()).toLocalDate();
     	
     	for (int i = 0; i < numberOfNights; ++i) {
     		boolean isHolidayDate = false;
     		
     		int currentMonth = checkinLocalDate.getMonthValue();
     		int currentDayOfMonth = checkinLocalDate.getDayOfMonth();
     		for (int[] date : holidayDates) {
     			if (currentMonth == date[0] + 1 && currentDayOfMonth == date[1]){
     				isHolidayDate = true;
     				break;
     			}
     		}
     		
     		double currentPrice = isHolidayDate ? roomPricePerNight * priceIncrease : roomPricePerNight;
     		totalPrice += currentPrice;
     		
     		checkinLocalDate = checkinLocalDate.plusDays(1);
     	}
        //double totalPrice = numberOfNights * roomPricePerNight;
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
    <table border="1">
    <tr>
    <th>Reservation ID</th>
    <td><%= id %></td> 
    </tr>

    <tr>
    <th>Check-in Date</th> 
    <td><%= checkin %></td> 
    </tr>

    <tr>
    <th>Check-out Date</th> 
    <td><%= checkout %></td> 
    </tr>

    <tr>
   	<th>Room Size</th>
   	<td> <%= roomID != null ? javaBeans.getRoomDescription(String.valueOf(roomID)) : "NA" %></td> 
   	</tr>

   	<tr>
    <th>Number of Guests</th> 
    <td><%= guests %></td> 
    </tr>

    <tr>
    <th>Hotel ID</th> 
    <td><%= hotelID %></td> 
    </tr>

    <tr>
    <th>Amenities</th>
    <td><%=wifiString%> <%=breakfastString%> <%=parkingString%></td>
    </tr>

    <tr>
    <th>Total Price</th> 
    <td>$<%= String.format("%.2f", totalPrice) %></td> 
    </tr>

    <tr>
    <th>Points Earned</th> 
    <td><%= loyaltyPointsEarned %></td> 
    </tr>    
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
	          booking.ConfirmReservation(javaBeans.getId(), totalPrice, loyaltyPointsEarned);
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
<%  } else { %>
    <p>Error: Reservation not found.</p>
<%  } %>

 <%
  if(AccountDetails.currentReservationNumber == 0)
	  {
	  String site = new String("Reservation-Booking.jsp");
      response.setStatus(response.SC_MOVED_TEMPORARILY);
      response.setHeader("Location", site); 
	  }
 
 if(AccountDetails.currentReservationNumber > 1)
 {
	 AccountDetails.currentReservationNumber = 0;
 }
	 %>
</table>


<script>
var confirmation = localStorage.getItem("Confirmed");
if(confirmation > 0)
	{
		localStorage.clear();
		window.location.assign("index.jsp");
		
	}
	
	function ConfirmReservation()
	{
		alert("Reservation Confirmed!");
		localStorage.setItem("Confirmed", 1);
		
		//console.log("Hello, World!");
	}
</script>
<div class="form-wrapper">
    <form method="post" action="">
        <input type="hidden" name="reservationID" value="<%= javaBeans.getId() %>" />
        <input type="submit" name = button value="Confirm Reservation" onclick="ConfirmReservation()" class="center" />
    </form>
    <form method="post" action="">
        <input type="hidden" name="reservationID" value="<%= javaBeans.getId() %>" />
        <input type="submit" name="button" value="Cancel Reservation" class="center" />
    </form>
</div>




<%@ include file = "footer.html" %>
</div>

</body>

</html>