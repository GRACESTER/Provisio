package javaBeans;

/*
 * 
 * 	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/30/2023

	
	This page will call a method which will remove user credentials from the session, effectively logging them out of the account.
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignOut
 */
@WebServlet("/SignOut")
public class SignOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AccountDetails.RemoveDetailsForSignout();
		System.out.println("Details removed!");
		System.out.println("User Email is now " + AccountDetails.userEmail);
		System.out.println("User Email is now " + AccountDetails.customerID);
		System.out.println("User Email is now " + AccountDetails.firstName);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
