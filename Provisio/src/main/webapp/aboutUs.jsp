<!-- 
	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/14/2023
	Module 8.1: Web Dev Assignment
	
	This page will display the about us page information
 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">


    <head>
        <title>Contact and About Us Page</title>
        <link rel="stylesheet" href="Provisio.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet">
     
    </head>
    
     <body>
	     <div class="page-layout">
			<%@ include file = "header.jsp" %>
	
	        <div class="content">
	            
	            <div id="aboutus-gallery">
	                <div class="grid-item3">
	                    <figure>
	                         <img src="images/building.png">
	                        <figcaption> Provisio HQ. Sarasota, Florida </figcaption>
	                    </figure>
	                </div>
	                <div class="grid-item4">
	                    <figure>
	                        <img src="images/agent.png">
	                        <figcaption>Our agents at work for you.</figcaption>
	                    </figure>
	                </div>
	                <div class="grid-item5">
	                    <figure>
	                           <img src="images/medal.png">
	                           <figcaption>Our award from the World Travel Awards</figcaption>
	                    </figure>
	                </div>
	            </div>
	
	            <div id="aboutus">
	                <p> Provisio was  founded in 2021, shortly after the COVID-19 pandemic started coming to an end. At Provisio, we could see that people were yearning to get back out of the house and start exploring the world again. We want to make your travel booking experience as easy as possible so you can focus on doing the things that you love.   </p>
	                <p> Our team as Provisio has taken the utmost care when looking for locations and attractions for our clients. We have a large number of specialists who are constantly on the hunt for the best deals and the most exclusive travel locations.   </p>
	                <p> We are available 24/7, 365 days a year. Our specialists are always available to help you with your reservations and answer any last minute questions that you have. As a matter a fact, people are so satified by our service that we won Best Booking Website from the World Travel Awards in 2021 and 2022!</p>
	                <b></b>
	                <b></b>
	            </div>
	
	            <div id="contactus">
	                <p>Need some help? Email or call us using the information below: </p>
	                <p>Reservations: reservations@provisio.com or 1-888-555-6778 </p>
	                <p>Account Inquires: accounting@provisio.com or 1-888-555-0394 </p>
	                <p>Reward Points: points@provisio.com or 1-888-555-3221</p>
	            </div>
	
	        </div>
	        
	        
			<%@ include file = "footer.html" %>
		</div>
    </body>
</html>
