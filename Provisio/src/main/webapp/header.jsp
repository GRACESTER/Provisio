
     <%@ page import="javaBeans.AccountDetails" %>
<div class="header">
    <a href="index.html" class="home-link">
        <h1> Provisio </h1>
    </a>
    
    <div id="navbar">
    
    
    	<%	if(AccountDetails.firstName != "")
    		{
    			out.write("<div class='header-text'><h3 style='color:white;'>Welcome, " + AccountDetails.firstName + "!</h3></div>");
    		}
    	%>
    		
   
    
        <button onclick="location.href = 'index.html'" type="button"> Home</button>
    
        <button onclick="location.href = 'aboutUs.jsp'" type="button"> About Us</button>
        
        <button onclick="location.href = 'Locations.jsp'" type="button"> Locations</button>

        <button onclick="location.href = 'Reservation-Booking.jsp'" type="button"> Book Reservation</button>
		
		<button onclick="location.href = 'Reservation-Lookup.jsp'" type="button"> Look Up Reservation</button>
        
        <button onclick="location.href = 'rewardPoints.jsp'" type="button"> Reward Points</button>
        <% 
        	if(AccountDetails.customerID == 0)
        	{
        %>
        		 <button onclick="location.href = 'Login.jsp'" type="button"> Log In</button>
        		 <button onclick="location.href = 'Registration.jsp'" type="button"> Create Account</button>
        <%
        
        	}
        	else
        	{
        %>		
        		 <button onclick="location.href = 'Registration.jsp'" type="button"> Sign Out</button>
        	<% 	 
        	}
        %>	 
        	
        	
      
       

       
        
    </div>
</div> <!-- end header -->