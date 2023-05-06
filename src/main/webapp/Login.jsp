<!-- 

	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/09/2023
	Module 6.1: Web Dev Assignment

	
	This page will display a form for registration. The form fields will insert use RegistrationSQL.java to hash the password using the industry standard 
	SHA-2 encryption, and will insert the data into a MySQL table.

 -->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
    background-color: #89b2f5;
}

.header{
    background-color: #333;
    text-align: center;
    width: 100%;
    padding: 20px 0;
}
.header a
{
    text-decoration: none;
}
h1{
    text-align: left;
    padding-left: 20px;
    color: white;
    font-size: 32px;
    margin: 0;
    font-weight: 700;
}

#navbar {
    display: flex;
    justify-content: center;
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

.page-layout {
    display: flex;
    min-height: 100vh;
    flex-direction: column;
    justify-content: flex-start;
}

.container {
    max-width: 800px;
    margin: 30px auto;
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #0252d4;
    color:white;
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
    color: black;
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
    background-color: #0252d4;
    border-radius: 4px;
}

.form-right {
    margin-left: 10px;
    background-color: #0252d4;
    border: 1px solid #ccc;
    border-radius: 4px;
}	


.footer {
    margin-top: auto;
    width: 100%;
    color: white;
    background-color: #333;
    padding: 15px 0;
}
.footer p {
    padding: 0 25px 0;
}
		
		
	</style>
</head>
<body>

<div class="page-layout">
<%@ include file = "header.jsp" %>

<jsp:useBean id="javaBeans" class="javaBeans.LoginSQL" />
	<jsp:setProperty name="javaBeans" property="userEmail" param="userEmailField"/>
	<jsp:setProperty name="javaBeans" property="userPassword" param="password"/>
	
	
	
	
	
	<div class="container">
    <div class="forms-wrapper">
        <div class="form-container form-left">
            <h2>Please Sign-in</h2>
            
            	<jsp:setProperty name="javaBeans" property="runTime" param="run"/>
				<form method="post">
                <div class="form-group">
                
                    <label>Email Address</label>
                    <input type="email" name="userEmailField" class="form-control"/>
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
                     <input type="hidden" name="run" value=1>   
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
  <%
  if(AccountDetails.customerID > 0)
	  {
	  String site = new String("index.jsp");
      response.setStatus(response.SC_MOVED_TEMPORARILY);
      response.setHeader("Location", site); 
	  }
	 %>

<%@ include file = "footer.html" %>
</div>
</body>
</html>