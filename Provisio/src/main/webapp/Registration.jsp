<!-- 

	Tim Alvarado, Chris Beatty, Joel Mardock, Grace Steranko
	04/09/2023
	Module 6.1: Web Dev Assignment

	
	This page will display a form for registration. The form fields will insert use RegistrationSQL.java to hash the password using the industry standard 
	SHA-2 encryption, and will insert the data into a MySQL table.

 -->

<%@page import="javaBeans.AccountDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>
    <%@page import="javaBeans.RegistrationSQL"%>
    
    <% 
    	if(AccountDetails.customerID > 0)
    		{
    			System.out.println("Customer must be logged in! Here is their number: " + AccountDetails.customerID);
    			response.sendRedirect("index.html");
    		}
    	else
    	{
    		System.out.println("Customer must NOT be logged in! Here is hopefully a zero: " + AccountDetails.customerID);
    	}
    %>
    
<!DOCTYPE html>
<html>
<head>	
	<meta charset="UTF-8">
	<title>Provisio Registration Page</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
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
input[type="password"],
input[type="text"] {
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

a.header-link,
a.header-link:hover,
a.header-link:visited,
a.header-link:active {
  text-decoration: none;
  color: inherit;
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
<%@ include file = "header.html" %>


<br>

<jsp:useBean id="javaBeans" class="javaBeans.RegistrationSQL" />
	<jsp:setProperty name="javaBeans" property="firstName" param="firstName"/>
	<jsp:setProperty name="javaBeans" property="lastName" param="lastName"/>
	<jsp:setProperty name="javaBeans" property="userEmail" param="userEmail"/>
	<jsp:setProperty name="javaBeans" property="userPassword" param="userPassword"/>
	
	
	<jsp:setProperty name="javaBeans" property="runTime" param="run"/>
	<form method="Post" class="form-container" onsubmit="validateForm()">
	
	* Indicates Required Field
	<br>
	 <div class="form-group">
      <label for="firstName">First Name*</label>
      <input type="text" id="firstName" name="firstName" required>
    </div>
  	
  	<div class="form-group">
      <label for="lastName">Last Name*</label>
      <input type="text" id="lastName" name="lastName" required>
    </div>
    
    <div class="form-group">
      <label for="email">Email Address*</label>
      <input type="email" id="email" name="userEmail" class="form-control" required>
    </div>
    
      <div class="form-group">
      <label for="email">Verify Email Address*</label>
      <input type="email" id="verifyEmail" name="verifyUserEmail" class="form-control" required>
    </div>
    
    <script>
    function validateForm() {
        var email = document.getElementById("email").value;
        var verifyEmail = document.getElementById("verifyEmail").value;
        if (email !== verifyEmail) {
            alert("Email addresses do not match.");
            return false;
        }
        return true;
    }
    
    
	</script>
    
    <div class="form-group">
      <label for="password">Password*</label>
      <input type="password" id="password" name="userPassword" required>
    </div>
    <div class="form-group">
      <label for="confirmPassword">Confirm Password*</label>
      <input type="password" id="confirmPassword" name="confirmPassword" required>
    </div>
   
    <div class="form-group">
      <input class="btn btn-primary" type="submit" value="REGISTER">
    </div>
    
    <div class="form-group">
      <input type="checkbox" id="ageVerification" name="ageVerification" required>
      <label for="ageVerification">I am at least 18 years old</label>
    </div>
    
    <div class="form-group">
      <input type="checkbox" id="termsConditions" name="termsConditions" required>
      <label for="termsConditions">I agree to the <a href="terms.jsp">Terms and Conditions</a></label>
    </div>
    
    <input type="hidden" name="run" value=1>
    
  </form>
  
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
