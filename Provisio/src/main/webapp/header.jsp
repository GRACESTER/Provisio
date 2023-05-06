
     <%@ page import="javaBeans.AccountDetails" %>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div class="header">
    <a href="index.jsp" class="home-link">
        <h1> Provisio </h1>
    </a>
    
    <div id="navbar">
    
    
    	<%	if(AccountDetails.firstName != "")
    		{
    			out.write("<div class='header-text'><h3 style='color:white;'>Welcome, " + AccountDetails.firstName + "!</h3></div>");
    		}
    	%>
    		
   
    
        <button onclick="location.href = 'index.jsp'" type="button"> Home</button>
    
        <button onclick="location.href = 'aboutUs.jsp'" type="button"> About Us</button>
        
        <button onclick="location.href = 'Locations.jsp'" type="button"> Locations</button>

        <button onclick="location.href = 'Reservation-Booking.jsp'" type="button"> Book Reservation</button>
		
		<button onclick="location.href = 'Reservation-Lookup.jsp'" type="button"> Look Up Reservation</button>
        
        <button onclick="location.href = 'RewardsPoints.jsp'" type="button"> Reward Points</button>
        <% 
        	if(AccountDetails.customerID == 0)
        	{
        %>
        		 <button onclick="location.href = 'Login.jsp'" type="button"> Log In/Create Account</button>
        <%
        
        	}
        	else
        	{
        	
        %>		
        
        <script>
        
        function CallSignout()
        {
        	var value = 1;
     
        	$.ajax
        	({
            	url: 'SignOut',
            	type: 'POST',
            	data: { value: value },
            	success: function(response) 
            	{
              		// Handle the server response
              		console.log("Server response: " + response); 
              		location.href="index.html";
            	},
            	error: function(xhr, status, error) 
            	{
              		// Handle the error
              		console.error("AJAX error: " + error);
            	}
          	});
        
        }
        </script>
        		<form action="${pageContext.request.contextPath}/SignOut.java" method="post">
        		 	<button type="button" name="button1" onclick="CallSignout()"> Sign Out</button>
        		 </form>
        <% 	 
        	}
        %>	 
        	
        	
      
       

       
        
    </div>
</div> <!-- end header -->