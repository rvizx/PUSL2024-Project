
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Date</title>
    </head>
    <body>
        <p>${message}</p>
        <form action="datetime" method="post">
              <table>
                    <tr>
                        <td>Select Date</td>
                        <td><input type="date" name="s_date"></td>
                    </tr>
                   
                    
                    <tr>
                        <td>Select Time</td>
                        <td>    <select name="time" id="mtime">
                                    <option value="Select">Pick a time</option>
                                    <option value="10:30:00">10.30</option>
                                    <option value="12:30:00">12.30</option>
                                    <option value="14:30:00">2.30</option>
                                    <option value="18:30:00">6.30</option>
                              </select>
                        </td>
                    </tr>
                    
                    
                    <tr>
                        <td><input type="submit"></td>
                    </tr>
                    
              </table>
</form>
    </body>
</html>
