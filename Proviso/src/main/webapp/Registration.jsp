<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Provisio - Registration Page</title>
</head>


<body>
  <h2>Registration Page</h2>
  <div>  
      <p class="lead">Enter your information to complete registration</p>
  </div>
  <div>
    <div>
      <form action="registration" method="post" name="regform">
        <div class="form-row">
          <div class="col">
            <label for="first-name">First name</label>
            <input type="text" placeholder="Enter first name" required>
                      </div>
          <div class="col">
            <label for="last-name">Last name</label>
            <input type="text" placeholder="Enter last name" required>
          </div>
        </div>
        <div class="form-row">
          <div class="col">
            <label for="last-name">Email</label>
            <input type="email" placeholder="Enter email" required>
          </div>
          <div class="col">
          </div>
        </div>
        <div class="form-row">
          <div class="col">
            <label for="password1">Password</label>
            <input type="password" placeholder="Create password" required>
            <small id="password-help" class="form-text ">Must be 8 characters, one uppercase and one lowercase</small>
          </div>
          <div class="col">
            <label for="password2">Verify Password</label>
            <input type="password" placeholder="Verify password" required>
            <small>Please Re-enter your password</small>
          </div>
        </div>
		    <button type="submit" id="submit" class="btn btn-primary float-right">REGISTER</button>
		</form>
    </div>
  </div>
</body>
</html>