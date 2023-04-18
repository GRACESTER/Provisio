package javaBeans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.lang.Integer;

/**
 * Servlet implementation class ReservationServlet
 */
@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String receivedInput = request.getParameter("value");
		System.out.println("THE VALUE OF VALUE IS " + receivedInput);
		
		int reservationID;
		
		try {
			reservationID = Integer.parseInt(receivedInput);
			String reservations = GetReservationData(reservationID);
			response.getWriter().write(reservations);
		}
		catch(Exception e){
			System.out.println("ERROR");
		}
		
		
		//ArrayList<String[]> reservations = new ArrayList<String[]>();
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	public String GetReservationData(int reservationNumber)
	{
		String dbSchema = "provisio";

		String dbUserName = "hotelManagement";

		String dbPassword = "roompass123";



		String dbTable = dbSchema + ".reservations";
		
		ArrayList<String[]> reservations = new ArrayList<String[]>();
		
		String sendBack = "";


		try {

			Class.forName("com.mysql.cj.jdbc.Driver");


			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbSchema, dbUserName, dbPassword);

			Statement stmt = conn.createStatement();


			

			ResultSet rs = stmt.executeQuery("SELECT reservationID,hotelName,hotelPictureURL,checkIn,checkOut,roomDescription,CONCAT(IF(wifi > 0, 'WiFi ',''), '', IF(breakfast>0, 'Breakfast ', ''), '', IF(parking>0, 'Parking ', '')) AS Amenities,price,guests FROM provisio.reservations r	JOIN provisio.hotels h	ON r.hotelID = h.hotelID JOIN provisio.rooms rm ON r.roomID = rm.roomID WHERE reservationID = " + reservationNumber);
			
			 
			 /*
			  * Columns pulled from MySQL Table
			  * 1. reservationID
			  * 2. hotelName,
			  * 3. hotelPictureURL,
			  * 4. checkIn,
			  * 5. checkOut,
			  * 6. roomDescription,
			  * 7. Amenities,
			  * 8. price,
			  * 9. guests
			  */
			int count = 0;
			    
			    while (rs.next()) 
			    {
			    	count++;
			      String resID = rs.getString(1); // reservationID
			      String hotelName = rs.getString(2); // hotelName
			      String hotelPictureURL = rs.getString(3); // hotelPictureURL
			      String checkIn = rs.getString(4); // checkIn
			      String checkOut = rs.getString(5); // checkOut
			      String roomDescription = rs.getString(6); // roomDescription
			      String amenities = rs.getString(7); // amenities
			      String price = rs.getString(8); // price
			      String guests = rs.getString(9); //guests
		      
			      //String[] record = {resID, checkIn, checkOut};	
			      String total = resID + "," + hotelName + "," + hotelPictureURL + "," + checkIn + "," + checkOut + "," + roomDescription + "," + amenities + "," + price + "," + guests + "|";
			      
			      sendBack += total;
			    }
			    if (count == 0) {
			    	
				    System.out.println("No records found");
				    return "NONE";
				}
			    else
			    {
			    	System.out.println("TOTAL RECORDS " + count);
			    	return sendBack;
			    }

			

		}

		catch(Exception e)

		{

			e.printStackTrace();
	
			return null;

		}
	}
	
	
	

}
