<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <%
            HttpSession empsession = request.getSession(false);
            String sessionmail=(String)empsession.getAttribute("email");
            String Admin="A-";
            
            
            
            
            if (sessionmail == null || !sessionmail.substring(0, 2).equals(Admin)) {
                
                String redmsg = "Please Login to your Admin account to continue!";
                request.setAttribute("message", redmsg);
                request.getRequestDispatcher("/emplogin.jsp").forward(request, response);
                response.sendRedirect("/emplogin.jsp");
            } 
        %>
        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>ABC Cinema</title>
        <link rel="shortcut icon" href="/admin/images/film.png" />
        <link rel="stylesheet" href="/admin/css/style.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

        <style>
            @media screen and (min-width: 1000px) {
                .sid {
                    min-height: calc(130vh - 65px);
                }
            }



        </style>

        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">

            google.load('visualization', '1.0', {'packages': ['corechart']});

            google.setOnLoadCallback(drawChart);


            function drawChart() {


                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Topping');
                data.addColumn('number', 'Slices');
                data.addRows([
                    ['Mushrooms', 3],
                    ['Onions', 1],
                    ['Olives', 1],
                    ['Zucchini', 1],
                    ['Pepperoni', 2]
                ]);
                // Create the data table.
                var data2 = new google.visualization.DataTable();
                data2.addColumn('string', 'Topping');
                data2.addColumn('number', 'Slices');
                data2.addRows([
                    ['Mushrooms', 3],
                    ['Onions', 1],
                    ['Olives', 15],
                    ['Zucchini', 1],
                    ['Pepperoni', 2]
                ]);

                var data3 = new google.visualization.DataTable();
                data3.addColumn('string', 'Year');
                data3.addColumn('number', 'Sales');
                data3.addColumn('number', 'Expenses');
                data3.addRows([
                    ['2004', 1000, 400],
                    ['2005', 1170, 460],
                    ['2006', 860, 580],
                    ['2007', 1030, 540]
                ]);


                // Set chart options
                var options = {'title': 'How Much Pizza I Ate Last Night',
                    'width': 500,
                    'height': 300};
                // Set chart options
                var options2 = {'title': 'How Much Pizza You Ate Last Night',
                    'width': 500,
                    'height': 300};
                // Set chart options
                var options3 = {'title': 'Line chart',
                    'width': 1000,
                    'height': 300};


                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);
                var chart2 = new google.visualization.BarChart(document.getElementById('chart_div2'));
                chart2.draw(data2, options2);
                var chart3 = new google.visualization.LineChart(document.getElementById('chart_div3'));
                chart3.draw(data3, options3);
                var chart4 = new google.visualization.DonutChart(document.getElementById('chart_div4'));
                chart4.draw(data4, options4);

            }
        </script>


    </head>
    <body>
        <div class=" divide">

            <nav class="sidebar sid "  >
                <ul class="nav">


                    <center><img src="images/kindpng_2267500.png" height="40" width="40"></center>

                    </li><br>
                    <li class="nav-item active" >
                        <a class="nav-link" href="/admin/adindex.jsp">
                            Dashboard

                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"   >
                            Movies 

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="/admin/addmovie.jsp">Add Movies</a></li>
                                <li class="nav-item"> <a class="nav-link" href="/admin/managemovie.jsp">Manage Movies</a></li>
                                <li class="nav-item"> <a class="nav-link" href="/admin/moviedetails.jsp">Movie Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/customerdetail.jsp">

                            Customer Details
                        </a>
                    </li>



                    <li class="nav-item">
                        <a class="nav-link" href="/admin/paymentdetails.jsp">

                            Payment Details
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"   >

                            Employees

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="/admin/addemployee.jsp">Add Employee</a></li>
                                <li class="nav-item"> <a class="nav-link" href="/admin/empmanage.jsp">Manage Employee</a></li>
                                <li class="nav-item"> <a class="nav-link" href="/admin/staffdetails.jsp">Employee Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/show.jsp">

                            Manage Shows
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="/admin/booking.jsp">

                            Booking Details
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="/admin/apfeedback.jsp">

                            Approve Feedback
                        </a>
                    </li>
                    <li class="nav-item">
                        <form name="nm" method="post" action="/empLogoutServlet">
                            <input type="submit" value="Logout" class="btn-primary btn px-10">
                        </form>
                    </li>

                </ul>
            </nav>

            <div class="container-fluid page-body-wrapper ">

                <nav class="navbar   ">
                    <div class="navbar-menu-wrapper    ">

                        <div class="navbar-brand-wrapper ">
                            <a class="navbar-brand brand-logo" href="/admin/adindex.jsp"><img src="/admin/images/abc_logo.png" alt="logo"/></a>
                        </div>



                    </div>




                </nav>
                <br>
                <!-- partial -->

                <div class="row">

                    <div class="card">
                        <div id="chart_div"></div></div>
                    <div class="card">
                        <div id="chart_div2"></div></div>
                    <br>
                    <div class="card">
                        <div id="chart_div3"></div></div>




                </div>

            </div>

        </div>





    </body>

</html>