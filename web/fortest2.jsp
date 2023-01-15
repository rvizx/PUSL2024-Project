<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter;"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html lang="en">

    <head>


        <title>ABC Cinema</title>


        <link rel="stylesheet" href="css/style.css">
        <link href="table.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/film.png" />


        <script>

        </script>
    </head>
    <body>
        <form  method="post" action="/fileupload" enctype="multipart/form-data">
            <input type="text" name="num">
            <input type="file" name="file">
            <input type="submit" value="Upload">
        </form>


    </body>

</html>