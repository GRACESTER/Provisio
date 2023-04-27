<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- 

	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/09/2023
	Module 6.1: Web Dev Assignment

	
	This is the landing page for the web site which will load first without selection of a specific page.
 -->

<!DOCTYPE html>
<html lang = "en">
    <head>
        <link href="Provisio.css" type="text/css" rel="stylesheet" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet">

    </head>

    <body>
        <div class="page-layout">

         <%@ include file = "header.jsp" %>

            <div class="content">
                <div id="landing-page-gallery">
                    <div class="grid-item">       
                        <figure>
                            <h3>Hyatt - Los Angeles</h3>
                            <img src="images/351/hotelImage.jpg" alt="pic1"/>
                            <figcaption>Upmarket Downtown hotel with Spanish Colonial styling.</figcaption>
                        </figure>
                    </div>
        
                    <div class="grid-item">
                        <figure>
                            <h3> Edgewater - Seattle</h3>
                            <img src="images/445/hotelImage.jpg" alt="pic2"/>
                            <figcaption>New American spot with views unlike any other.</figcaption>
                        </figure>
                    </div>
        
                    <div class="grid-item">
                        <figure>
                            <h3> Blossom - Houston</h3>
                            <img src="images/595/hotelImage.jpg" alt="pic3"/>
                            <figcaption>Refined quarters in an upmarket hotel.</figcaption>
                        </figure>
                    </div>
                    
                </div> <!-- end of images -->
        
                <div id="landing-page">
                    <a href="Locations.jsp">Click here to book a hotel!</a>
                    
                </div>
            </div> <!-- end content -->

           <%@ include file = "footer.html" %>

        </div>
    </body>
</html>
