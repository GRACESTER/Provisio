/*

* Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko

* 04-09-2023

* Module 6.1: Web Dev Assignment

*

* This code will receive the values from the Login.jsp. It will hash the password received, and search the MySQL database to find the record.

* The data is called back directly from the ResultSet which is populated after the RunInsertQuery method has completed execution

* Encryption code from the following source:
 	Bilal-hungund
	https://www.geeksforgeeks.org/sha-256-hash-in-java/	
* 
*/



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

public class LoginSQL {
	
	public ResultSet results;


	public static int runTime;

	private static String userEmail;

	private static String userPassword;



/*Receives and sets the variables*/


	public void setUserEmail(String userEmail)

	{

		this.userEmail = userEmail;
		System.out.println("It's me");

	}
	
	public void setUserPassword(String userPassword)

	{

		this.userPassword = userPassword;
		System.out.println("Hi!");

	}



	/*Runs the RunInsertQuery method*/

	public void setRunTime(int runTime)

	{
		System.out.println("I'm the problem!");
		this.runTime = runTime;

		ReturnQuery1();

	}
	
	// Start of Encryption
	
	public static byte[] getSHA(String input) throws NoSuchAlgorithmException
    {
		System.out.println("I guess it could also be me...");
        // Static getInstance method is called with hashing SHA
        MessageDigest md = MessageDigest.getInstance("SHA-256");
 
        // digest() method called
        // to calculate message digest of an input
        // and return array of byte
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }
     
    public static String toHexString(byte[] hash)
    {
    	System.out.println("I guess it could also be me too...");
        // Convert byte array into signum representation
        BigInteger number = new BigInteger(1, hash);
 
        // Convert message digest into hex value
        StringBuilder hexString = new StringBuilder(number.toString(16));
 
        // Pad with leading zeros
        while (hexString.length() < 64)
        {
            hexString.insert(0, '0');
        }
 
        return hexString.toString();
    }
    
    //End of Encryption

    public void ReturnQuery1()

	{
    	System.out.println("It's me.");
		String dbSchema = "provisio";

		String dbUserName = "hotelManagement";

		String dbPassword = "roompass123";


		String dbTable = dbSchema + ".customers";
		String hashedPassword = "";

		try 
		{
			hashedPassword = toHexString(getSHA(userPassword));
		}
		catch(Exception e)
		{
		}

		try 
		{

			Class.forName("com.mysql.cj.jdbc.Driver");


			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbSchema, dbUserName, dbPassword);

			Statement stmt = conn.createStatement();



			ResultSet rs = stmt.executeQuery("SELECT customerID, firstName, lastName, userEmail FROM " + dbTable + " WHERE userEmail = '" + userEmail + "' AND userPassword = '" + hashedPassword + "'");

			results = rs;
			
			while(rs.next())
			{
				AccountDetails.customerID = rs.getInt(1);
				AccountDetails.firstName = rs.getString(2);
				AccountDetails.userEmail = rs.getString(3);
				System.out.println("Customer ID: " + rs.getString(1));
				System.out.println("First Name" + rs.getString(2));
				System.out.println("User Email: " + rs.getString(3));
			}

			System.out.println("Finished Evaluating");

			

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


		String dbTable = dbSchema + ".customers";
		String hashedPassword = "";

		try 
		{
			hashedPassword = toHexString(getSHA(userPassword));
		}
		catch(Exception e)
		{
		}

		try 
		{

			Class.forName("com.mysql.cj.jdbc.Driver");


			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbSchema, dbUserName, dbPassword);

			Statement stmt = conn.createStatement();



			ResultSet rs = stmt.executeQuery("SELECT customerID, firstName, userEmail FROM " + dbTable + " WHERE userEmail = '" + userEmail + "' AND userPassword = '" + hashedPassword + "'");

			results = rs;
			
			while(rs.next())
			{
				AccountDetails.customerID = rs.getInt(1);
				AccountDetails.firstName = rs.getString(2);
				AccountDetails.userEmail = rs.getString(3);
				System.out.println("Customer ID: " + rs.getString(1));
				System.out.println("First Name" + rs.getString(2));
				System.out.println("User Email: " + rs.getString(3));
			}

			return rs;

		}
		catch(Exception e)
		{
			//e.printStackTrace();
			return null;
		}	
		
	}

}
