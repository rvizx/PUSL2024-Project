<%-- 
    Document   : test
    Created on : Jan 6, 2023, 8:41:32 PM
    Author     : rvz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <form action="/SendMail" method="post">
    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email"><br>
    <input type="submit" value="Send reset link">
  </form> 
</html>
