<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Provisio - Login Page</title>
</head>


<body>
<div class="container" style="margin-bottom: 100px">
		<h2>Sign-in</h2>
        
		<div class="row">
        	<div>
					<div class="form-group">
						<label>Email Address</label>
						<input type="email" name="username" class="form-control"/>
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" id="password" name="password" />
					</div>
					<div class="form-group">
						<input class="btn btn-primary " type="submit" value="SIGN-IN" />   
						
                        <div id="login-failed" class="alert alert-danger mt-3"> 
							User name or password incorrect, Please try again
						</div>
					</div>
					<div class="form-group"></div>
						<div class="alert alert-secondary" role="alert">
							Don't have a login? <a href="Registration.jsp" class="alert-link">Click Here</a> to complete your registration
						</div>
    				</div>
         	</div>
        	</div>
</body>
</html>