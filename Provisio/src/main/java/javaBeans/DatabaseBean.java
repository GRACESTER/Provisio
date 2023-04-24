/*
	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/23/2023
	Module 9.1: Web Dev Assignment

	
	This Java class stores the connection information for the Database
*/



package javaBeans;
import java.sql.*;

public class DatabaseBean implements java.io.Serializable
{
	//setup database objects
	Connection con = null;
	Statement stmt = null;
	ResultSet resultSet = null;
	
	public DatabaseBean() throws ClassNotFoundException
	{
		//connect to database
        try
        {                
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio", "hotelManagement", "roompass123");
                         
            stmt = con.createStatement();
        }
        catch(Exception e)
        {
        	
        }
	}
	
	
	public java.sql.ResultSet getResults(String SQL) throws ClassNotFoundException
	{
        //get resultset of given SQL String
	    try
	    {
	        resultSet = stmt.executeQuery(SQL);
	    }
	    catch(java.sql.SQLException e)
	    {

	    }
	    
	    //return results
	    return resultSet;
	}
	
	public void closeConnection()
	{
		//close connections
		try
		{
   			stmt.close();
	        con.close();
	    }
	    catch(java.sql.SQLException e)
		{
	    	
	    }
	}

}
