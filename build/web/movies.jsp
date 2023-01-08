<%-- 
    Document   : welcome
    Created on : 03-Jan-2023, 11:53:18
    Author     : sanid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies</title>
        
        
    </head>
    <body>
        <h1>Welcome</h1>
        <h2>Here are some movies for you!</h2>
        <h3>Select the movie you wanna watch</h3>
        <form method="post" action="movies" >
            <select name="movie" id="mov">
                <option value="Select">Pick a movie</option>
                <option value="uncharted">Uncharted</option>
                <option value="MIB">MIB</option>
                <option value="Pathan">Pathan</option>
                <option value="Brahmasthra">Brahmasthra</option>
            </select>
            <input type="submit">
        </form>
        
    </body>
</html>
