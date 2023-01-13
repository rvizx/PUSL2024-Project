<%-- 
    Document   : forgot
    Created on : Jan 6, 2023, 12:01:24 AM
    Author     : rvz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
<body>
  <h1>Forgot Password</h1>
  <form action="/../forogotpassword" method="post">
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email"><br>
    <input type="submit" value="Send reset link">
  </form> 
</body>
