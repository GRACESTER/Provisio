/*
	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/25/2023
	Module 10.1: Web Dev Assignment

	
	This class will be used to return all of the reward point data to the RewardsPoints.jsp page.

*/


package javaBeans;
import java.sql.*;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;


public class Reward implements java.io.Serializable 
{
    //attributes to match database result
    private int resID = 0;
    private int hotelID = 0;
    private String hotelName = null;
    private LocalDate checkIn = null;
    private LocalDate checkOut = null;
    private int points = 0;

    //returns array of reward/reservation ids for the given customer
	static public ArrayList<Integer> getRewards(int custID)
	{
		ArrayList<Integer> RewardID = new ArrayList<Integer>();
		try 
		{
			DatabaseBean DBBean = new DatabaseBean();
            ResultSet results = DBBean.getResults("SELECT reservationID FROM provisio.reservations WHERE customerID = " + custID);

			while(results.next())
			{
				int id = results.getInt(1);
				RewardID.add((Integer)id);
			}

			DBBean.closeConnection();
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}

		return RewardID;
	}

    //constructor that creates new reward from database record based on given reservation id
	public Reward(int ID)
	{
		try 
		{
			DatabaseBean DBBean = new DatabaseBean();
			ResultSet results = DBBean.getResults("SELECT reservations.reservationID, hotels.hotelID, hotels.hotelName, reservations.checkIn, reservations.checkOut FROM reservations INNER JOIN hotels ON reservations.hotelID = hotels.hotelID WHERE reservationID = " + ID);

			while(results.next())
			{
				this.resID = results.getInt(1);
				this.hotelID = results.getInt(2);
				this.hotelName = results.getString(3);
				this.checkIn = LocalDate.parse(results.getString(4));
				this.checkOut = LocalDate.parse(results.getString(5));
                this.points = Period.between(checkIn, checkOut).getDays() * 150;
			}

			DBBean.closeConnection();
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}
	}

    //getters for attributes
	public int getResID() 
    {
		return resID;
	}

	public int getHotelID() 
    {
		return hotelID;
	}

	public String getHotelName() 
    {
		return hotelName;
	}

	public LocalDate getCheckIn() 
    {
		return checkIn;
	}

	public LocalDate getCheckOut() 
    {
		return checkOut;
	}

	public int getPoints() 
    {
		return points;
	}


    //static method to get a customers total reward points
    static public int getCustPoints(int custID)
    {
        int customerPoints = 0;

        try 
		{
			DatabaseBean DBBean = new DatabaseBean();
            ResultSet results = DBBean.getResults("SELECT loyaltypoints FROM provisio.customers WHERE customerID = " + custID);

			while(results.next())
			{
				customerPoints = results.getInt(1);
			}

			DBBean.closeConnection();
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
		}

        return customerPoints;
    }
}
