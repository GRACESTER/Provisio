<!-- 

	Joel Mardock
	02/12/2023
	Module 8 Programming Assignment

	
	This page will display a form and the results of the table. The form fields will insert the records into the table and will 
	re-query it after the submit button is pressed. The data is passed to JavaBeans.DoGetMethod

 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%@page import="javaBeans.RegistrationSQL"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Form Example</title>
</head>
<body>
<jsp:useBean id="javaBeans" class="javaBeans.RegistrationSQL" />
	<jsp:setProperty name="javaBeans" property="firstName" param="firstNameField"/>
	<jsp:setProperty name="javaBeans" property="lastName" param="lastNameField"/>
	<jsp:setProperty name="javaBeans" property="userEmail" param="userEmailField"/>
	<jsp:setProperty name="javaBeans" property="userPassword" param="userPasswordField"/>
	
	
	<jsp:setProperty name="javaBeans" property="runTime" param="run"/>
	<form method="post">
		<label>Please Enter Your First Name</label>
		<input type="text" name="firstNameField"><br>
		
		<label>Please Enter Your Last Name</label>
		<input type="text" name="lastNameField"><br>
		
		<label>Please Enter Your Email Address</label>
		<input type="text" name="userEmailField"><br>
		
			<label>Please Type Your Password</label>
		<input type="text" name="userPasswordField"><br>
		<input type="hidden" name="run" value=1>
		<input type="submit" value="Submit">
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
		
	</form>
</body>
</html>