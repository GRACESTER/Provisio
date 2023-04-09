<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@page import="java.sql.*"%>
=======
    <%@page import="java.sql.*"%>

    <%@page import="javaBeans.LoginSQL"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title> Provisio - Login Page</title>

<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

header {
    background-color: #333;
    padding: 20px;
    text-align: left;
}

h1 {
    color: white;
    font-size: 32px;
    margin: 0;
}

#navbar {
    display: flex;
    justify-content: right;
    padding: 10px 0;
}

button {
    background-color: blue;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    transition-duration: 0.4s;
}

button:hover {
    background-color: #45a049;
}

.container {
    max-width: 800px;
    margin: 30px auto;
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #fff;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    font-size: 14px;
    margin-bottom: 5px;
}

input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="checkbox"] {
    margin-top: 10px;
    margin-bottom: 20px;
}

.btn {
    background-color: blue;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
}

.btn:hover {
    background-color: #45a049;
}

.alert {
    padding: 20px;
    margin-top: 30px;
    border: 1px solid #ccc;
}

.alert-secondary {
    background-color: #f9f9f9;
}

h2 {
    margin-top: 0;
}

#forgot-password {
    margin-top: 15px;
    text-align: right;
}

.forms-wrapper {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

.form-container {
    flex: 1;
    padding: 20px;
    box-sizing: border-box;
}

.form-left {
    margin-right: 10px;
    border: 1px solid #ccc;
    background-color: #fff;
    border-radius: 4px;
}

.form-right {
    margin-left: 10px;
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 4px;
}	
		
		
	</style>
</head>
<body>
<header>

<h1>Provisio</h1>

<div id="navbar">

	<button onclick="location.href = 'Landing.jsp'" type="button"> Home</button>

	<button onclick="location.href = 'Registration.jsp'" type="button"> Registration</button>
	
	<button onclick="location.href = 'aboutUs.jsp'" type="button"> About Us</button>
	
	<button onclick="location.href = 'reservations.jsp'" type="button"> Reservations</button>
	
	<button onclick="location.href = 'rewardPoints.jsp'" type="button"> Reward Points</button>
	
</div>

</header>

<jsp:useBean id="javaBeans" class="javaBeans.LoginSQL" />
	<jsp:setProperty name="javaBeans" property="userEmail" param="userEmailField"/>
	<jsp:setProperty name="javaBeans" property="userPassword" param="password"/>
	
	
	<jsp:setProperty name="javaBeans" property="runTime" param="run"/>
	
	
	<div class="container">
    <div class="forms-wrapper">
        <div class="form-container form-left">
            <h2>Please Sign-in</h2>
            
            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="username" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" id="password" name="password" />
                </div>
                
                <label for="remember-me">Remember Me</label>
                <input type="checkbox" id="remember-me" name="remember-me">    
                
                <div id="login-failed" class="alert alert-danger mt-3" style="display: <%= request.getAttribute("errorMessage") == null ? "none" : "block" %>;">
                    <%= request.getAttribute("errorMessage") %>
                </div>
                
                <div class="form-group">
                    <input class="btn btn-primary" type="submit" value="SIGN-IN" />   
                </div>
            </form>
        </div>
        <div class="form-container form-right">
							<h2>Not enrolled in Provisio Rewards? </h2>
							
							<p> Provisio Rewards program allows you to earn points for each stay at any of our locations.<br>
								You can also earn points by adding any amenities, such as, breakfast, parking, and wifi to <br>
								your stay when you make your reservation. These points can be used towards future stays <br>
								at Provisio Hotels and also redeemed for any amenities of your choice during a future stay.
							</p>
							
							<button onclick="location.href = 'Registration.jsp'" type="button"> Join Now</button>						
						</div>
    
    </div>
</div>
		<table border="1">
	
	
		
		
		

		<%
		
		
		ResultSet results = javaBeans.ReturnQuery();		
		//Gets data and column count for output
		ResultSetMetaData resMetaData = results.getMetaData();
		int nCols = resMetaData.getColumnCount();
		%>
		<tr>
			<%
				//Outputs the column headers and names
				for (int kCol = 1; kCol <= nCols; kCol++) {
				out.print("<td><b>" + resMetaData.getColumnName(kCol) + "</b></td>");
			}
			%>
		</tr>
		<%
			//Looks for each row available
			while (results.next()) {
		%><tr>
			<%
				//Outputs each set of items in a row
				for (int kCol = 1; kCol <= nCols; kCol++) {
				out.print("<td>" + results.getString(kCol) + "</td>");
			}
			%>
		</tr>
		<%
			}
		%>
	</table>
		

</body>
</html>