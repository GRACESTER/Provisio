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
        <%@ include file = "header.html" %>

        <h2>Locations</h2>
        <%
        ArrayList<Integer> IDs = Location.getLocations();
        ArrayList<Location> Locations = new ArrayList<Location>();
        
        for (Integer ID : IDs)
        {
        	Locations.add(new Location(ID));
        }
        
        //ResultSet hotels = DBBean.getResults("SELECT * FROM hotels");
        //while(hotels.next())
        for (Location loc : Locations)
        {
            %>
            <table id="location">
                <tr>
                    <td>
                        <!-- hotel name -->
                        <% out.print("<h3>"+ loc.getName() + "</h3>"); %>
                    </td>
                    <td><!-- hotel address -->
                        <% out.print("<p>"+ loc.getAddress() + "</p>"); %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <!-- hotel picture -->
                        <%
                        String imgPath = loc.getPictureURL();
                        out.print("<img id=\"hotelPic\" src=\"" +imgPath+ "\" alt=\"hotel image\"");
                        %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <!-- hotel notes -->
                        <% out.print("<p>"+ loc.getNotes() + "</p>"); %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <!-- hotel attractions -->
                        <table>
                        	<tr>
                        		<h3>Available Attractions</h3>
                        	</tr>
	                        <%
	                        ArrayList<Integer> attIDs = Attraction.getAttractions(loc.getID());
	                        ArrayList<Attraction> Attractions = new ArrayList<Attraction>();
	                        
	                        for (Integer attID : attIDs)
	                        {
	                        	Attractions.add(new Attraction(attID));
	                        }
	                        
	                        //ResultSet hotels = DBBean.getResults("SELECT * FROM hotels");
	                        //while(hotels.next())
	                        for (Attraction att : Attractions)
	                        {
	                            {
	                                %>
	                                <tr>
	                                    <td>
	                                        <!-- attraction name -->
	                                        <% out.print("<h4>"+ att.getName() + "</h3>"); %>
	                                    </td>
	                                    <td><!-- attraction description -->
	                                        <% out.print("<p>"+ att.getDescription() + "</p>"); %>
	                                    </td>
	                                </tr>
	                                <%
	                            }
	                        }
	                        %>
                        </table>
                    </td>
                </tr>

            </table>
            <%
        }
        %>
    </body>
</html>