package javaBeans;
/*
 * 
 * 	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/30/2023

	
	This page will store certain user information while the session is active so that the data can be routed to the correct account.
 */
public class AccountDetails {
	
	public static String userEmail = "";
	public static String firstName = "";
	public static int customerID = 0;
	public static int currentReservationNumber = 0;
	
	
	public static void RemoveDetailsForSignout()
	{
		userEmail = "";
		firstName = "";
		customerID = 0;
		currentReservationNumber = 0;
	}
	

}
