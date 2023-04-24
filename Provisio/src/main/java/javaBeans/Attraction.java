/*
	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/23/2023
	Module 9.1: Web Dev Assignment

	
	This class will query the Attraction information to return to the locations section so that there will be additional information available

*/



package javaBeans;
import java.sql.*;
import java.util.ArrayList;


public class Attraction implements java.io.Serializable 
{
    private int ID = 0;
    private int hotelID = 0;
    private String name = null;
    private String description = null;

	static public ArrayList<Integer> getAttractions(int hotelID)
	{
		ArrayList<Integer> AttID = new ArrayList<Integer>();
		try 
		{
			DatabaseBean DBBean = new DatabaseBean();
			ResultSet results = DBBean.getResults("SELECT attractionID FROM provisio.attractions WHERE hotelID = " + hotelID);

			while(results.next())
			{
				int id = results.getInt(1);
				AttID.add((Integer)id);
			}

			DBBean.closeConnection();
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}

		return AttID;
	}

	public Attraction(int ID)
	{
		try 
		{
			DatabaseBean DBBean = new DatabaseBean();
			ResultSet results = DBBean.getResults("SELECT * FROM provisio.attractions WHERE attractionID = " + ID);

			while(results.next())
			{
				this.ID = results.getInt(1);
				this.hotelID = results.getInt(2);
				this.name = results.getString(3);
				this.description = results.getString(4);
			}

			DBBean.closeConnection();
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}
	}

	public Attraction(int ID, int hotelID, String name, String description)
    {
        this.ID = ID;
        this.hotelID = hotelID;
        this.name = name;
        this.description = description;
	}

	public int getID()
    {
		return ID;
	}

	public int getHotelID()
    {
		return hotelID;
	}

	public String getName()
    {
		return name;
	}

	public String getDescription()
    {
		return description;
	}


}
