<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="javaBeans.LoginSQL"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="javaBeans" class="javaBeans.LoginSQL" />
	<jsp:setProperty name="javaBeans" property="userEmail" param="userEmailField"/>
	<jsp:setProperty name="javaBeans" property="userPassword" param="userPasswordField"/>
	
	
	<jsp:setProperty name="javaBeans" property="runTime" param="run"/>
	<form method="post">


		<label>Email Address</label>
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