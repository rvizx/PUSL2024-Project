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
        <%
            HttpSession empsession = request.getSession(false);
            String sessionmail = (String) empsession.getAttribute("email");
            String Admin = "A-";

            if (sessionmail == null || !sessionmail.substring(0, 2).equals(Admin)) {

                String redmsg = "Please Login to your Admin account to continue!";
                request.setAttribute("message", redmsg);
                request.getRequestDispatcher("/emplogin.jsp").forward(request, response);
                response.sendRedirect("/emplogin.jsp");
            }
        %>

        <title>ABC Cinema</title>


        <link rel="stylesheet" href="/admin/css/style.css">
        <link href="/admin/table.css" rel="stylesheet">
        <link rel="shortcut icon" href="/admin/images/film.png" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.css" rel="stylesheet" />


        <script>

        </script>
    </head>
    <body>
        <div class="divide">

            <nav class="sidebar sid "  >
                <ul class="nav">


                    <center><img src="images/kindpng_2267500.png" height="60" width="60" class="mt-10"></center>

                    </li><br>
                    <li class="nav-item " >
                        <a class="nav-link uppercase font-bold" href="/admin/adindex.jsp">
                            Admin Dashboard

                        </a>
                    </li>

                    <li class="nav-item uppercase font-bold">
                        <a class="nav-link"   >
                            Movies 

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/addmovie.jsp">Add Movies</a></li>
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/managemovie.jsp">Manage Movies</a></li>
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/movie details.jsp">Movie Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold" href="/admin/customerdetail.jsp">

                            Customer Details
                        </a>
                    </li>



                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold" href="/admin/paymentdetails.jsp">

                            Payment Details
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold"   >

                            Employees

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/addemployee.jsp">Add Employee</a></li>
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/empmanage.jsp">Manage Employee</a></li>
                                <li class="nav-item "> <a class="nav-link uppercase font-bold" href="/admin/staffdetails.jsp">Employee Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item active uppercase font-bold">
                        <a class="nav-link" href="/admin/show.jsp">

                            Manage Shows
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link uppercase font-bold" href="/admin/booking.jsp">

                            Booking Details
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link uppercase font-bold" href="/admin/apfeedback.jsp">
                            Approve Feedback
                        </a>
                    </li>
                    <li class="nav-item">
                        <form method="post" action="/empLogoutServlet">
                            <input type="submit"
                                   class="inline-block w-full px-10 py-3 bg-gray-700 text-white text-center  text-m leading-tight uppercase font-bold  shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out uppercase"
                                   value="logout"></form>
                    </li>
                </ul>
            </nav>

            <div class="container-fluid page-body-wrapper ">

                <nav class="navbar   ">
                    <div class="navbar-menu-wrapper   ">
                        <div class="navbar-brand-wrapper ">
                            <a class="navbar-brand brand-logo" href="/admin/adindex.jsp"><img src="/admin/images/abc_logo.png" class="mt-5 px-10" alt="logo"></a>
                        </div>
                    </div>

                </nav>
                <br>
                <div class="main-panel mt-10">        
                    <div class="content-wrapper">
                        <div class="row">



                        </div>

                        <div class="card">
                            <div class="card-body">
                                <p>${message}</p>
                                <h4 class="card-title mb-8 font-bold uppercase text-xl">Show details</h4>

                                <form class="forms-sample" id="contact" method="post" action="/showdetails">
                                    <div class="form-group">
                                        <label >Show Date</label>
                                        <input type="date" class="form-control"  name="date" placeholder="date" required>
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
                                        String id = request.getParameter("userId");
                                        String driverName = "com.mysql.jdbc.Driver";
                                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                                        String dbName = "abc_cinema";
                                        String userId = "pmauser";
                                        String password = "123NxUok4IL4pW9GvkJF8gO1C6MyRFed";

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
                                        <select class="form-control" name="movie" required>
                                            <option value="0">Select a Movie </option>
                                            <%
                                                try {
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM movie";
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                                            %>

                                            <option value="<%=resultSet.getString("m_name")%>"><%=resultSet.getString("m_name")%></option>

                                            <% }%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label >Employee Name(Enter the person who adds the show!)</label>
                                        <select class="form-control" name="empID" required>
                                            <option value="0">Select Employee</option>
                                            <% connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                statement = connection.createStatement();
                                                String sql1 = "SELECT * FROM employee";
                                                resultSet = statement.executeQuery(sql1);
                                                while (resultSet.next()) {

                                            %>

                                            <option value="<%=resultSet.getString("emp_id")%>"><%=resultSet.getString("name")%></option>

                                            <%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>

                                            <select>
                                                </div>

                                                <button type="submit" class="btn btn-primary mr-2 bg-black">Add Show</button>
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

                                                <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.js"></script>
                                                </body>

                                                </html>