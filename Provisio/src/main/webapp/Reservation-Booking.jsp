<!-- 


	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/14/2023
	Module 7.: Web Dev Assignment

	
	This page will display a reservation form. The form fields will insert use ReservationBookingSQL.java to insert the data into a MySQL table



 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>

 <%@page import="javaBeans.ReservationBookingSQL"%>

<!DOCTYPE html>
<html>
<head>	
	<meta charset="UTF-8">
	<title>Provisio Registration Page</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #89b2f5;
    color: white;
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
	
	background-color: #237FE5;
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
	
	background-color: #237FE5;
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

#reg-hotel-info-textbox
{
	text-align:center;
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
<%@ include file = "header.jsp" %>


<br>


	
<jsp:useBean id="javaBeans" class="javaBeans.ReservationBookingSQL" />
	<jsp:setProperty name="javaBeans" property="checkin" param="checkin"/>
	<jsp:setProperty name="javaBeans" property="checkout" param="checkout"/>
	<jsp:setProperty name="javaBeans" property="roomID" param="roomID"/>

	<jsp:setProperty name="javaBeans" property="guests" param="guests"/>
	<jsp:setProperty name="javaBeans" property="wificheckbox" param="wificheckbox"/>
	<jsp:setProperty name="javaBeans" property="breakfastcheckbox" param="breakfastcheckbox"/>
	<jsp:setProperty name="javaBeans" property="parkingcheckbox" param="parkingcheckbox"/>
	<jsp:setProperty name="javaBeans" property="hotelID" param="hotelID"/>
	
	
	<jsp:setProperty name="javaBeans" property="runTime" param="run"/>
	<form method="Post" class="form-container" action="Reservation-Booking.jsp" onsubmit="validateForm()">
    
    <input type="hidden" name="run" value=1>
    
  <div id="reg-hotel-info">

	<div id="reg-hotel-info-textbox">
	<h3>Select Hotel</h3>
		<select style="width: 300px; margin-left:auto; margin-right:auto;" id="hotelID" name="hotelID">
					<option value="445">Hyatt, Los Angeles</option>
					<option value="595">Edgewater, Seattle</option>
					<option value="734">Blossom, Houston</option>
					<option value="351">DoubleTree, Orlando</option>
					<option value="804">Godfrey, Boston</option>
				</select>

	</div>
	
</div>
	<p>  
  
  <div id="reg-hotel-form">
  	<table>
  		<tr>
  			<td><h4>Check In Date</h4></td>
  			<td><div class="date-picker">
  				<input type="date" placeholder="Select a date" id="checkin" name="checkin">
				</div>
			</td>
  		</tr>
  		<tr>
  			<td><h4>Check Out Date</h4></td>
  			<td><div class="date-picker">
  				<input type="date" placeholder="Select a date" id="checkout" name="checkout">
				</div>
			</td>
  		</tr>
  		<tr>
  			<td>
  				<h4>Room Size</h4></td>

  			<td><select id="roomID" name="roomID">
  					<option>Select Room Size</option>
    				<option value="1">Double Full Beds</option>
    				<option value="2">Queen</option>
    				<option value="3">Double Queen Beds</option>
    				<option value="4">King</option>

				</select>
			</td>
  		</tr>
  		<tr>
  			<td><h4>Guests</h4></td>
  			<td>
  				<select id="guests" name="guests">
  				<option>Select Number of Guests</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><h4>Amenities</h4></td>
			<td>
				<label for="wificheckbox">WiFi ($12.99 per stay)</label>
				<input type="checkbox" id="wificheckbox" name="wificheckbox" >
      	
      			<label for="breakfastcheckbox">Breakfast ($8.99 per night)</label>	
      			<input type="checkbox" id="breakfastcheckbox" name="breakfastcheckbox" >
      			
      			<label for="parkingcheckbox">Parking ($19.99 per night)</label>
		      	<input type="checkbox" id="parkingcheckbox" name="parkingcheckbox" >

		      	
		      </td>
		 </tr>
		 <tr>
		 	<td><h4>Loyalty Points</h4></td>
		 	<td>150 per night</td>
		 </tr>
		 <tr>
		 	<td></td>

		 	<td><input class="btn btn-primary" type="submit" value="Book Hotel Stay">
		 	</td>
		 		 	
  	</table>
  	
  	</div>
  	<script>

var confirmation = localStorage.getItem("Confirmed");

if(confirmation > 0)
	{
		localStorage.clear();
		window.location.assign("index.jsp");
		
	}
	</script>
  	 </form>
  	  <%
  if(AccountDetails.currentReservationNumber > 0)
	  {
	  String site = new String("Reservation-Summary.jsp");
      response.setStatus(response.SC_MOVED_TEMPORARILY);
      response.setHeader("Location", site); 
	  }
	 %>

<%@ include file = "footer.html" %>
</div>
		
</body>

</html>
