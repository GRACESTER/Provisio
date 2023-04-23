<!-- 


	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/14/2023
	Module 7.: Web Dev Assignment

	
	This page will display a reservation form. The form fields will insert use ReservationBookingSQL.java to insert the data into a MySQL table



 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>

 <%@page import="javaBeans.ReservationLookup"%>

<!DOCTYPE html>
<html>
<head>	
	<meta charset="UTF-8">
	<!-- Include jQuery library -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<title>Provisio Registration Page</title>
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

img
{
	height: 80%;
	width: 80%;

}

.reservation-lookup-titles
{
	display:inline-block;
	padding: 50px;
}

td{
	padding: -100px;
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


<br>

<!-- Add a script to define the callJavaMethod function -->
<script>

function outputChanges()
{
	var searchTextBox = document.getElementById("reservationID").value;
	console.log(searchTextBox);
	callJavaMethod(searchTextBox);
}

function clearReservationID()
{
	var searchTextBox = document.getElementById("reservationID").value = "";
}




function callJavaMethod(sendValue) {
  // Get the value of the textbox
  var value = sendValue;
  var htmlFullOutput = "";

  
  // Make an AJAX request to call the Servlet

  $.ajax({
    url: 'ReservationServlet',
    type: 'POST',
    data: { value: value },
    success: function(response) {
      // Handle the server response
      console.log("Server response: " + response);
      
      if(response == "NONE")
      {
    	  console.log("No Records Found");
    	  htmlFullOutput = "<tr><td><h2  style='color:white;'>Enter Reservation Number To Get Started!</h2></td></tr>";
    	  
      }
      else
      { 
      	const recordsArray = response.split("|");
      	
      
      
      	for(var i = 0; i < recordsArray.length; i++)
    	{
      		console.log("VALUE IS " + recordsArray[i]);
      		if(recordsArray[i] != "")
      		{
      			const items = recordsArray[i].split(","); 
        	  	var guestCount = "";
        	  	
        	  	//Evaluate Guest count so change wording ('Guests' versus 'Guest')
            	if(parseInt(items[8]) == 1)
            	{
            	 	guestCount = "1 Guest";
            	}
            	else
            	{
            	 	guestCount = items[8] + " Guests";
            	}
            	  	
            	var html1 = "<tr>";
            	var html2 = "<td style='width: 60%;'><img src='" + items[2] + "'>";
            	var html3 = "<td style='text-align: left;'>";
            	var html4 = "<h4>" + items[1] + " (" + items[0] + ")</h4>"
            	var html5 = "<h4>" + items[3] + "   -   " + items[4] + "</h4>"
            	var html6 = "<h4>" + items[5] + "   -   " + guestCount + "</h4>"
            	var html7 = "<h4>" + items[6] + "</h4>"
           		var html8 = "<h4>" + items[7] + "(150 Loyalty Points)</h4>"
            	var htmlOutput = html1 + html2 + html3 + html4 + html5 + html6 + html7 + html8;
            	console.log(htmlOutput);
            	htmlFullOutput += htmlOutput;	
      		}
    		
    	  }
       }  	  		
      /*
		  * Columns pulled from MySQL Table
		  * 0. reservationID
		  * 1. hotelName,
		  * 2. hotelPictureURL,
		  * 3. checkIn,
		  * 4. checkOut,
		  * 5. roomDescription,
		  * 6. Amenities,
		  * 7. price,
		  * 8. guests
		  */
      document.getElementById("waitForIt").innerHTML = htmlFullOutput;
      
      
    },
    error: function(xhr, status, error) {
      // Handle the error
      console.error("AJAX error: " + error);
    }
  });
 
}
</script>
    
 <div id="reg-hotel-info">
	<div class="reservation-lookup-titles">
		<h2>Reservation History</h2>
	</div>
	<div class="reservation-lookup-titles">
		<h3>Search</h3>
		<input type="text" id="reservationID" name="reservationID" value="Enter Reservation ID" onclick="clearReservationID()" oninput="outputChanges()"/>
	</div>	
</div>
  
  <div id="reg-hotel-form">
  	<table id="waitForIt">
  		<tr>
			<td><h2  style="color:white;">Enter Reservation Number To Get Started!</h2></td>
  		</tr>		 		 	
  	</table>
  </div>

<%@ include file = "footer.html" %>
</div>
		
</body>

</html>
