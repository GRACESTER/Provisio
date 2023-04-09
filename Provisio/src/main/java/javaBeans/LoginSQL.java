package javaBeans;

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

	}
	
	public void setUserPassword(String userPassword)

	{

		this.userPassword = userPassword;

	}



	/*Runs the RunInsertQuery method*/

	public void setRunTime(int runTime)

	{

		this.runTime = runTime;

		ReturnQuery();

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



			ResultSet rs = stmt.executeQuery("SELECT * FROM " + dbTable + " WHERE userEmail = '" + userEmail + "'");

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
