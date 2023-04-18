package javaBeans;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.ws.rs.*;

public class ReservationLookup {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String value = request.getParameter("value");
		  // Call the Java method with the value parameter
		  // ...

		  // Send a response back to the client
		  response.getWriter().write("Java method called with value: " + value);
		}
	
	public String ReturnHelloWorld()
	{
		return "Hello, World!";
	}

}
