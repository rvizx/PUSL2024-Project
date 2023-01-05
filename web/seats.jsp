<%-- 
    Document   : seats
    Created on : Jan 5, 2023, 11:24:37 AM
    Author     : rvz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Seats</title>
    </head>
    
    
    <!-- haven't implemented yet  16-30 -->
    
    <h1>Booked Seats</h1>
    <ul>
      <%
        String[] bookedSeats = (String[]) request.getAttribute("bookedSeats");
        for (String seat: bookedSeats) {
      %>
      <li><%= seat %></li>
      <%
        }
      %>
    </ul>
    
    <!-- haven't implemented yet -->
    
    
    
    <body>
         
        <h1>select seats</h1>
        <form action="/bookseats" method="post">
          <label for="selectedSeats">Select seats:</label><br>
          <select name="selectedSeats" multiple>
            <option value="A1">A1</option>
            <option value="A2">A2</option>
            <option value="A3">A3</option>
            <option value="B1">B1</option>
            <option value="B2">B2</option>
            <option value="B3">B3</option>    
        </select>
        <br>
    <input type="submit" value="Book seats">
</form>
        
        
        

    </body>
</html>

