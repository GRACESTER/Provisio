/*
	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/23/2023
	Module 9.1: Web Dev Assignment

	
	This class will be used to return all of the location data to the Location.jsp page.

*/


package javaBeans;
import java.sql.*;
import java.util.ArrayList;


public class Location implements java.io.Serializable 
{
    private int ID = 0;
    private String name = null;
    private String address = null;
    private String pictureURL = null;
    private String notes = null;

	static public ArrayList<Integer> getLocations()
	{
		ArrayList<Integer> LocID = new ArrayList<Integer>();
		try 
		{
			DatabaseBean DBBean = new DatabaseBean();
			ResultSet results = DBBean.getResults("SELECT hotelID FROM provisio.hotels;");

			while(results.next())
			{
				int id = results.getInt(1);
				LocID.add((Integer)id);
			}

			DBBean.closeConnection();
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}

		return LocID;
	}

	public Location(int ID)
	{
		try 
		{
			DatabaseBean DBBean = new DatabaseBean();
			ResultSet results = DBBean.getResults("SELECT * FROM provisio.hotels WHERE hotelID = " + ID);

			while(results.next())
			{
				this.ID = results.getInt(1);
				this.name = results.getString(2);
				this.address = results.getString(3);
				this.pictureURL = results.getString(4);
				this.notes = results.getString(5);
			}

			DBBean.closeConnection();
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}
	}

	public Location(int ID, String name, String address, String pictureURL, String notes)
    {
		this.ID = ID;
		this.name = name;
		this.address = address;
		this.pictureURL = pictureURL;
		this.notes = notes;
	}

	public int getID()
    {
		return ID;
	}

	public String getName()
    {
		return name;
	}

	public String getAddress()
    {
		return address;
	}

	public String getPictureURL()
    {
		return pictureURL;
	}

	public String getNotes()
    {
		return notes;
	}


}
