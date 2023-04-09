/*

* Joel Mardock

* 02/12/2023

* Module 8 Programming Assignment

*

* This code will receive the values from the Form.jsp. After that, it will call the RunInsertQuery method and

* will put the data into the database table.

*

* The data is called back directly from the ResultSet which is populated after the RunInsertQuery method has completed execution

*/

package javaBeans;
import java.sql.*;

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

	public static void RunInsertQuery()

	{

		String dbSchema = "provisio";

		String dbUserName = "root";

		String dbPassword = "password";


		String dbTable = dbSchema + ".customers";


		try {

			Class.forName("com.mysql.cj.jdbc.Driver");


			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbSchema, dbUserName, dbPassword);

			Statement stmt = conn.createStatement();



			//Create random ID for record

			double rand = Math.random() * 100000;

			id = (int)rand;


			//Insert data into table


			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO " + dbTable + "(customerID, firstName, lastName, userEmail, userPassword) VALUES('" + id + "', '" + firstName + "', '" + lastName + "', '" + userEmail + "', + '" + userPassword + "')");

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

