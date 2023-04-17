/*
 * 
 * Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/14/2023
	Module 7.: Web Dev Assignment

	
	This is the Java code for both the Reservation-Booking.jsp and the Reservation-Summary.jsp. It handles the MySQL insert, update, delete, and retrieval from various requests on both pages
 */



package javaBeans;


import java.math.BigDecimal;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ReservationBookingSQL {
	
	
	public ResultSet results;


	public static int runTime;

	private static int reservationID;
	
	private static int id;

	private static String checkin;

	private static String checkout;

	private static String roomID;
	
	private static int hotelID;
	
	private static double price;


	private static String guests;
	private static int wificheckbox;
	private static int breakfastcheckbox;
	private static int parkingcheckbox;



/*Receives and sets the variables*/

	public void setCheckin(String checkin)

	{

		this.checkin = checkin;
	}

	public void setCheckout(String checkout)

	{

		this.checkout = checkout;


	}


	public void setRoomID(String roomID)

	{

		this.roomID = roomID;


	}
	
	public void setHotelID(int hotelID)
	{
		this.hotelID = hotelID;
	}
	
	public void setGuests(String guests)

	{

		this.guests = guests;

	}
	
	public void setWificheckbox(String wificheckbox)
	{
		
		System.out.println("WIFI VALUE IS " + wificheckbox);
		if(wificheckbox.equals("on"))
		{
			this.wificheckbox = 1;
		}

		else
		{
			this.wificheckbox = 0;
		}
		
		System.out.println("WIFI VALUE IS NOW " + this.wificheckbox);

	}
	public void setBreakfastcheckbox(String breakfastcheckbox)

	{
		System.out.println("Breakfast VALUE IS " + breakfastcheckbox);
		if(breakfastcheckbox.equals("on"))
		{
			this.breakfastcheckbox = 1;
		}

		else
		{
			this.breakfastcheckbox = 0;
		}
		
		System.out.println("Breakfast VALUE IS NOW " + this.breakfastcheckbox);

	}
	public void setParkingcheckbox(String parkingcheckbox)

	{
		System.out.println("parking VALUE IS " + parkingcheckbox);

		if(parkingcheckbox.equals("on"))
		{
			this.parkingcheckbox = 1;
		}

		else
		{
			this.parkingcheckbox = 0;
		}
		
		System.out.println("parking VALUE IS NOW " + this.parkingcheckbox);

	}

	
	public String getRoomDescription(String roomIDStr) {
	    if (roomIDStr == null) {
	        return "Unknown";
	    }
	    int roomID = Integer.parseInt(roomIDStr);
	    switch (roomID) {
	        case 1:
	            return "Double Full Beds";
	        case 2:
	            return "Queen";
	        case 3:
	            return "Double Queen Beds";
	        case 4:
	            return "King";
	        default:
	            return "Unknown";
	    }
	}
	
	public int getId() {
	    return this.id;
	}






	/*Runs the RunInsertQuery method*/

	public void setRunTime(int runTime)

	{

		this.runTime = runTime;

		RunInsertQuery();

	}
	
	public static void RunInsertQuery()

	{

		String dbSchema = "provisio";

		String dbUserName = "hotelManagement";

		String dbPassword = "roompass123";


		String dbTable = dbSchema + ".reservations";
		
		
			try 
			{

				Class.forName("com.mysql.cj.jdbc.Driver");


				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbSchema, dbUserName, dbPassword);

				Statement stmt = conn.createStatement();



				//Create random ID for record

				double rand = Math.random() * 100000;

				id = (int)rand;
				
				
				///////////////////////////////////////////////////////////////////////
				
				//STATIC VALUES FOR QUERY TESTING
				
				//Create random customerID (TESTING)
				rand = Math.random() * 100000;
				int customerID = (int)rand;
		

				//Insert data into table




				PreparedStatement pstmt = conn.prepareStatement("INSERT INTO " + dbTable + "(reservationID, customerID, hotelID, checkIn, checkOut, roomID, guests, wifi, breakfast, parking, price) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				pstmt.setInt(1, id);
				pstmt.setInt(2, customerID);
				pstmt.setInt(3, hotelID);
				pstmt.setString(4, checkin.toString());
				pstmt.setString(5, checkout.toString());
				pstmt.setInt(6, Integer.parseInt(roomID));
				pstmt.setString(7, guests);
				pstmt.setInt(8, wificheckbox);
				pstmt.setInt(9, breakfastcheckbox);
				pstmt.setInt(10, parkingcheckbox);
				pstmt.setDouble(11, price);

				pstmt.executeUpdate();
				

				System.out.println("inserted");

				//PreparedStatement pstmt = conn.prepareStatement("INSERT INTO " + dbTable + "(reservationID, customerID, hotelID, checkIn, checkOut, guests, wifi, breakfast, parking) VALUES('" + id + "', '" + customerID + "', '" + hotelID + "', '" + checkin + "', '" + checkout + "', '" + guests + "', '" + wificheckbox + "', '" + breakfastcheckbox + "', '" + parkingcheckbox + "')");

				//pstmt.executeUpdate();

			}

			catch(Exception e)

			{


				e.printStackTrace();

			}
	}		




	public ResultSet ReturnQuery()

	{

		String dbSchema = "provisio";

		String dbUserName = "hotelManagement";

		String dbPassword = "roompass123";



		String dbTable = dbSchema + ".reservations";


		try {

			Class.forName("com.mysql.cj.jdbc.Driver");


			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbSchema, dbUserName, dbPassword);

			Statement stmt = conn.createStatement();




			ResultSet rs = stmt.executeQuery("SELECT * FROM " + dbTable + " WHERE reservationID = " + id);


			results = rs;

			return rs;

		}

		catch(Exception e)

		{

			e.printStackTrace();
	
			return null;

		}



	}
	
	public void ConfirmReservation(int reservationID, double price)
	{	
		System.out.println("Confirming Reservation!");
		String dbSchema = "provisio";

		String dbUserName = "hotelManagement";

		String dbPassword = "roompass123";


		String dbTable = dbSchema + ".reservations";
		
		try
		{
			System.out.println("Confirming Reservation! - Starting SQL! Reservation ID is " + reservationID + " And price is " + price);
			Class.forName("com.mysql.cj.jdbc.Driver");


			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbSchema, dbUserName, dbPassword);

			Statement stmt = conn.createStatement();
			
			System.out.println("Confirming Reservation! - Preparing Update Statement");
			PreparedStatement pstmt = conn.prepareStatement("UPDATE provisio.reservations SET price = " + price + " WHERE reservationID = " + reservationID);	
			pstmt.executeUpdate();
			
			System.out.println("Reservation has been updated and confirmed!");
		}
		catch(Exception e)
		{
			System.out.println("Reservation FAILURE");
		}
			
	}
	
	public void CancelReservation(int reservationID)
	{
		System.out.println("Confirming Reservation!");
		String dbSchema = "provisio";

		String dbUserName = "hotelManagement";

		String dbPassword = "roompass123";


		String dbTable = dbSchema + ".reservations";
		
		try
		{
			System.out.println("Cancelled Reservation! - Starting SQL! Reservation ID is " + reservationID + " And price is " + price);
			Class.forName("com.mysql.cj.jdbc.Driver");


			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbSchema, dbUserName, dbPassword);

			Statement stmt = conn.createStatement();
		
			System.out.println("Cancelled Reservation! - Preparing Update Statement");
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM provisio.reservations WHERE reservationID = " + reservationID);	
			pstmt.executeUpdate();
		
			System.out.println("Reservation has been Cancelled!");
		
		}
		catch(Exception e)
		{
			System.out.println("Cancellation FAILURE");
		}
	}

}
