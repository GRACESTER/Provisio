/*

* Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko

* 04-09-2023

* Module 6.1: Web Dev Assignment

*

* This code will receive the values from the Registration.jsp. It will hash the password received, and insert data into a MySQL Database.

* The data is called back directly from the ResultSet which is populated after the RunInsertQuery method has completed execution

* Encryption code from the following source:
 	Bilal-hungund
	https://www.geeksforgeeks.org/sha-256-hash-in-java/	
* 
*/

package javaBeans;
import java.sql.*;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class RegistrationSQL 
{

	public ResultSet results;


	public static int runTime;


	private static int id;

	private static String firstName;

	private static String lastName;
	private static String userEmail;

	private static String userPassword;



/*Receives and sets the variables*/

	public void setFirstName(String firstName)

	{

		this.firstName = firstName;
	}

	public void setLastName(String lastName)

	{

		this.lastName = lastName;


	}

	public void setUserEmail(String userEmail)

	{

		this.userEmail = userEmail;

	}
	
	public void setUserPassword(String userPassword)

	{

		this.userPassword = userPassword;

	}



	/*Runs the RunInsertQuery method*/

	public void setRunTime(int runTime)

	{

		this.runTime = runTime;

		RunInsertQuery();

	}
	
	// Start Encryption
	
	public static byte[] getSHA(String input) throws NoSuchAlgorithmException
    {
        // Static getInstance method is called with hashing SHA
        MessageDigest md = MessageDigest.getInstance("SHA-256");
 
        // digest() method called
        // to calculate message digest of an input
        // and return array of byte
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }
     
    public static String toHexString(byte[] hash)
    {
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

	public static void RunInsertQuery()

	{

		String dbSchema = "provisio";

		String dbUserName = "hotelManagement";

		String dbPassword = "roompass123";


		String dbTable = dbSchema + ".customers";
		
		try 
		{
			String hashedPassword = toHexString(getSHA(userPassword));
		
			try 
			{

				Class.forName("com.mysql.cj.jdbc.Driver");


				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbSchema, dbUserName, dbPassword);

				Statement stmt = conn.createStatement();



				//Create random ID for record

				double rand = Math.random() * 100000;

				id = (int)rand;


				//Insert data into table


				PreparedStatement pstmt = conn.prepareStatement("INSERT INTO " + dbTable + "(customerID, firstName, lastName, userEmail, userPassword) VALUES('" + id + "', '" + firstName + "', '" + lastName + "', '" + userEmail + "', + '" + hashedPassword + "')");

				pstmt.executeUpdate();
				
				AccountDetails.customerID = id;
				AccountDetails.userEmail = userEmail;
				AccountDetails.firstName = firstName;
				
				System.out.println("LOGGED IN Customer ID: " + AccountDetails.customerID);
				System.out.println("LOGGED IN Customer Email: " + AccountDetails.userEmail);
				System.out.println("LOGGED IN Customer First Name: " + AccountDetails.firstName);

			}

			catch(Exception e)

			{

				e.printStackTrace();

			}
		}
		catch(Exception e)
		{
			
		}


		

	}


	public ResultSet ReturnQuery()

	{

		String dbSchema = "provisio";

		String dbUserName = "root";

		String dbPassword = "password";


		String dbTable = dbSchema + ".customers";


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

