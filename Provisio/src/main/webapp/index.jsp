<!-- 

	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/09/2023
	Module 6.1: Web Dev Assignment

	
	This is the landing page for the web site which will load first without selection of a specific page.
 -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang = "en">
    <head>
        <link href="Provisio.css" type="text/css" rel="stylesheet" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet">

    </head>

    <body>

        <header>
            <div id="site-title">
                   <h1>Provisio Home</h1> 
            </div> <!-- end of site-title -->


            <h2>Landing Page</h2>

            <div id="navbar">

                <button onclick="location.href = 'index.jsp'" type="button"> Home</button>
            
                <button onclick="location.href = 'Registration.jsp'" type="button"> Registration</button>
                
                <button onclick="location.href = 'aboutUs.jsp'" type="button"> About Us</button>
                
                <button onclick="location.href = 'Reservation-Booking.jsp'" type="button"> Reservations</button>
                
                <button onclick="location.href = 'rewardPoints.jsp'" type="button"> Reward Points</button>
                
            </div> <!-- end of navbar -->
            
        </header>


            <div id="landing-page-gallery">
            <div class="grid-item6">       
            <figure>
                <h3>Destination One</h3>
                <img src="images/hotelpic1.jfif" alt="pic1"/>
                <figcaption>Destination 1 - Beach side getaway</figcaption>
            </figure>
            </div>

            <div class="grid-item7">
            <figure>
                <h3> Destination Two</h3>
                <img src="images/hotelpic2.jfif" alt="pic2"/>
                            <figcaption>Destination 2- Fun nights downtown by the casinos.</figcaption>
                </figure>
            </div>

            <div class="grid-item8">
            <figure>
                <h3> Destination Three</h3>
                <img src="images/hotelpic3.jpg" alt="pic3"/>
                            <figcaption>Destination 3 - Located in the old town with charm.</figcaption>
             </figure>
            </div>

            <br>
            <br>
            <br>
        </div> <!-- end of container -->
                <div id="landing-page">
                    <a href="Location.jsp">Click here to get started!</a>
                    
                </div>

        

        <div id="footer">
            <p> &copy; 2023 - Provisio </p>
         </div>    
                
    </body>

</html>
