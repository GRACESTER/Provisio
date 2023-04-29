package javaBeans;

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
