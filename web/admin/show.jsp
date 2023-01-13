<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        <div class="divide">

            <nav class="sidebar sid "  >
                <ul class="nav">

                    
                    <center><img src="images/kindpng_2267500.png" height="40" width="40"></center>

                    </li><br>
                    <li class="nav-item " >
                        <a class="nav-link" href="adindex.jsp">
                            Dashboard

                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"   >
                            Movies 

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="movie.jsp">Add Movies</a></li>
                                 <li class="nav-item"> <a class="nav-link" href="managemovie.jsp">Manage Movies</a></li>
                                <li class="nav-item"> <a class="nav-link" href="movie details.jsp">Movie Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="user.jsp">

                            Customer Details
                        </a>
                    </li>



                    <li class="nav-item">
                        <a class="nav-link" href="paymentdetails.jsp">

                            Payment Details
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"   >

                            Employees

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="stff.jsp">Add Employee</a></li>
                                <li class="nav-item"> <a class="nav-link" href="empmanage.jsp">Manage Employee</a></li>
                                <li class="nav-item "> <a class="nav-link" href="staffdetails.jsp">Employee Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="show.jsp">

                            Manage Shows
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="booking.jsp">

                            Booking Details
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="review.jsp">

                            Approve Feedback
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/emplogin.jsp">

                            Logout
                        </a>
                    </li>

                </ul>
            </nav>

            <div class="container-fluid page-body-wrapper ">

                <nav class="navbar   ">
                    <div class="navbar-menu-wrapper   ">

                        <div class="navbar-brand-wrapper ">
                            <a class="navbar-brand brand-logo" href="adindex.jsp"><img src="images/abc logo.png" alt="logo"/></a>

                        </div>



                    </div>




                </nav>
                <br>
                <div class="main-panel">        
                    <div class="content-wrapper">
                        <div class="row">



                        </div>

                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Show details</h4>

                                <form class="forms-sample" id="contact" method="post" action="showdetails">
                                    <div class="form-group">
                                        <label >Show Date</label>
                                        <input type="date" class="form-control"  name="date" placeholder="Name" required>
                                    </div>

                                    <div class="form-group">
                                        <label >Show Time</label>
                                        <select class="form-control" name="time" required>
                                            <option value="10:30:00">10.30 AM</option>
                                            <option value="13:00:00">01.00 PM</option>
                                            <option value="18:00:00">06.00 PM</option>
                                            <option value="21:00:00">09.00 PM</option>
                                        </select>
                                    </div>
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
                                    %>
                                    <div class="form-group">
                                        <label >Movie Name</label>
                                        <%
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
                                        <select name="movie">
                                            <c:forEach items="${dataList}" var="String">
                                                <option value="${String.mname}">${String.mname}</option>
                                            </c:forEach>

                                        </select>
                                        <%
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>

                                    </div>
                                    <button type="submit" class="btn btn-primary mr-2">Add Show</button>
                                    <button type="clear" class="btn btn-light">Cancel</button>
                                </form>
                            </div>
                        </div>
                    </div>




                </div>
            </div>

        </div>

    </div>

</div>


</body>

</html>