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
  
    <header>
        <a href="index.jsp" class="home-link">
            <h1> Provisio </h1>
            </a>
        <h2>About Us </h2>
     </header>
     <body>
        <div id="navbar">

            <button onclick="location.href = 'index.jsp'" type="button"> Home</button>
        
            <button onclick="location.href = 'Registration.jsp'" type="button"> Registration</button>
            
            <button onclick="location.href = 'aboutUs.jsp'" type="button"> About Us</button>
            
            <button onclick="location.href = 'Reservations.jsp'" type="button"> Reservations</button>
            
            <button onclick="location.href = 'rewardPoints.jsp'" type="button"> Reward Points</button>
            
        </div>
        

        <div id="container">
            
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

            <div id="contactus"
                <p>Need some help? Email or call us using the information below: </p>
                <p>Reservations: reservations@provisio.com or 1-888-555-6778 </p>
                <p>Account Inquires: accounting@provisio.com or 1-888-555-0394 </p>
                <p>Reward Points: points@provisio.com or 1-888-555-3221</p>
            </div>

         
        </div>
    </body>
</html>
