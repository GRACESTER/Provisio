package javaBeans;

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


	private static int id;

	private static String checkin;

	private static String checkout;
	private static String roomSize;

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

	public void setRoomSize(String roomSize)

	{

		this.roomSize = roomSize;

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
		
				//Hotel ID Random
				rand = Math.random() * 100000;
				int hotelID = (int)rand;


				//Insert data into table


				PreparedStatement pstmt = conn.prepareStatement("INSERT INTO " + dbTable + "(reservationID, customerID, hotelID, checkIn, checkOut, guests, wifi, breakfast, parking) VALUES('" + id + "', '" + customerID + "', '" + hotelID + "', '" + checkin + "', '" + checkout + "', '" + guests + "', '" + wificheckbox + "', '" + breakfastcheckbox + "', '" + parkingcheckbox + "')");

				pstmt.executeUpdate();

			}

			catch(Exception e)

			{

				e.printStackTrace();

			}
	}		




	public ResultSet ReturnQuery()

	{

		String dbSchema = "provisio";

		String dbUserName = "root";

		String dbPassword = "password";


		String dbTable = dbSchema + ".reservations";


		try {

			Class.forName("com.mysql.cj.jdbc.Driver");


			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbSchema, dbUserName, dbPassword);

			Statement stmt = conn.createStatement();



			ResultSet rs = stmt.executeQuery("SELECT * FROM " + dbTable);

			results = rs;

			return rs;

		}

		catch(Exception e)

		{

			e.printStackTrace();
	
			return null;

		}



	}

}
