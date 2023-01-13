<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
    Document   : test2
    Created on : 13-Jan-2023, 01:21:29
    Author     : sanid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "abc_cinema";
    String userId = "root";
    String password = "";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        ArrayList<String> dataList = new ArrayList<String>();
        Connection con = DriverManager.getConnection("jdbc:your-db-url", "username", "password");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT m_name FROM movie");
        while (rs.next()) {

            String mname = rs.getString("name");
            String data = new String(mname);
            dataList.add(data);
        }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP List Users Records</title>
    </head>
    <body>

        <c:forEach items="${dataList}" var="data">
            <form method="post" action="">
                <select name="movie">
                    <option value="0">Select a movie</option>
                    <option value="1">Man</option>
                </select>
                <input type="submit">
            </form>
        </c:forEach>
    </body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
