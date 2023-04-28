<!-- 


	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/22/2023
	Module 

	
	This page will provide customers with a page to look up how many points they have earned.
    Displays a table of data with columns for reservationId, location, check-in date, check-out date, and points earned, as well as total points earned.


 -->
 <%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="javaBeans.AccountDetails" %>
<%@ page import="javaBeans.DatabaseBean" %>
<%@ page import="javaBeans.Reward" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>


<html>
    <head>
        <meta charset="UTF-8">
        <title>Reward Points</title>

        <link rel="stylesheet" href="/Provisio/Provisio.css" type="text/css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;700&display=swap" rel="stylesheet">
    </head>

    <body>
        <div class="page-layout">
            <%@ include file = "header.jsp" %>
    
            <div class="content-rewards">
            
            	<h2 class="body-title">Rewards Points</h2>
            	<%
            	//make sure a user is logged in
            	if(AccountDetails.customerID == 0)
        		{
            		out.print("<h4 class=\"body-title\">Please Log In or Create Account to view Rewards Points</h4>");
        		}
        		else
        		{
	                out.print("<h4>Customer Number: " + AccountDetails.customerID + "</h4>");
	                
		            //setup arraylists for reservation ids and reservation/reward objects
		            //first arraylist populated with reservation ids from database 
		            ArrayList<Integer> IDs = Reward.getRewards(AccountDetails.customerID);
		            ArrayList<Reward> Rewards = new ArrayList<Reward>();
		            
		            //fill location arraylist with reservations based on the ids pulled from database
		            for (Integer ID : IDs)
		            {
		                Rewards.add(new Reward(ID));
		            }
		            
		            %>
		            
		            <!-- display table with reservation and reward point information -->
		            <table class="rewards-table">
						<!-- Table Header Info -->
		            	<tr>
		            		<th>Reservation Number</th>
		            		<th>Hotel Number</th>
		            		<th>Hotel Name</th>
		            		<th>Check In Date</th>
		            		<th>Check Out Date</th>
		            		<th>Rewards Points</th>
		            	</tr>
		            	
	            		<%
			            //begin outputting each reservation's reward data to page
			            for (Reward rew : Rewards)
			            {
			                %>
			                <tr>
			                	<td> <% out.print(rew.getResID()); %> </td>
			                	<td> <% out.print(rew.getHotelID()); %> </td>
			                	<td> <% out.print(rew.getHotelName()); %> </td>
			                	<td> <% out.print(rew.getCheckIn()); %> </td>
			                	<td> <% out.print(rew.getCheckOut()); %> </td>
			                	<td class="number"> <% out.print(rew.getPoints()); %> </td>
			                </tr>
			                <%
			            }
		            	%>
		            	
		            	<!-- final row shows total points for customer -->
		            	<tr class="total">
		            		<td colspan="5">Total Loyalty Points</td>
		            		<td class="number"> <% out.print(Reward.getCustPoints(AccountDetails.customerID)); %> </td>
		            	</tr>
		            </table>
		            <%
	            }
	            %>
            </div>
	            
            <%@ include file = "footer.html" %>
        </div>
    </body>
</html>