<!-- 


	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/19/2023
	Module 

	
	This page will display the hotels available to book through the Provisio website along with the available attractions at each one.



 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="javaBeans.DatabaseBean" %>
<%@ page import="javaBeans.Location"%>
<%@ page import="javaBeans.Attraction"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>

<!-- set up bean to access DB -->
<%-- <jsp:useBean id="DBBean" class="javaBeans.DatabaseBean"> --%>
<%-- </jsp:useBean> --%>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Hotel Locations</title>

        <link rel="stylesheet" href="/Provisio/Provisio.css" type="text/css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;700&display=swap" rel="stylesheet">
    </head>

    <body>
        <div class="page-layout">
			<%@ include file = "header.html" %>
	
	        <div class="content-location">
	            <h2 class="body-title">Locations</h2>
	
	            <%
	            //setup arraylists for hotel ids and hotel/location objects
	            //first arraylist populated with hotel ids from database 
	            ArrayList<Integer> IDs = Location.getLocations();
	            ArrayList<Location> Locations = new ArrayList<Location>();
	            
	            //fill location arraylist with locations based on the ids pulled from database
	            for (Integer ID : IDs)
	            {
	                Locations.add(new Location(ID));
	            }
	            
	            //begin outputting each location's data to page
	            for (Location loc : Locations)
	            {
	                %>
	                <div class="location">
	                    <div class="location-title">
	                        <!-- hotel name and address-->
	                        <% out.print("<h3>"+ loc.getName() + "</h3>"); %>
	                        <% out.print("<p>"+ loc.getAddress() + "</p>"); %>
	                    </div>
	
	                    <div class="location-picture">
	                        <!-- hotel picture -->
	                        <%
	                        String imgPath = loc.getPictureURL();
	                        out.print("<img id=\"hotelPic\" src=\"" +imgPath+ "\" alt=\"hotel image\">");
	                        %>
	                    </div>
	
	                    <div class="location-notes">
	                        <!-- hotel notes -->
	                        <% out.print("<p>"+ loc.getNotes() + "</p>"); %>
	                    </div>
	
	                    <div class="location-attractions">
	                        <!-- hotel attractions -->
	                        <div class="attraction-title">
	                            <h3 class="attraction-title">Available Attractions</h3>
	                        </div>
	
	                        <%
	                        //setup arraylists for attraction ids and attraction objects
	                        //first arraylist populated with attraction ids from database, but only ones from this hotel id
	                        ArrayList<Integer> attIDs = Attraction.getAttractions(loc.getID());
	                        ArrayList<Attraction> Attractions = new ArrayList<Attraction>();
	                        
	                        //fill attraction arraylist with attractions based on the ids pulled from database
	                        for (Integer attID : attIDs)
	                        {
	                            Attractions.add(new Attraction(attID));
	                        }
	                        
	                        //begin outputting each attraction's data to page
	                        for (Attraction att : Attractions)
	                        {
	                            {
		                            %>
		                            <div class="attraction-item">
		                                <div class="attraction-name">
		                                    <% out.print("<h4>"+ att.getName() + "</h4>"); %>
		                                </div>
		                                <div class="attraction-desc">
		                                    <% out.print("<p>"+ att.getDescription() + "</p>"); %>
		                                </div>
		                            </div>                           
		                            <%
	                            }
	                        }
	                        %>
	                        
	                    </div>
	                </div>
	                <%
	            }
	            %>
	        </div>
	        
	
			<%@ include file = "footer.html" %>
        </div>
    </body>
</html>