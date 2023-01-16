<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%
            HttpSession empsession = request.getSession(false);
            String sessionmail = (String) empsession.getAttribute("email");
            String Admin = "E-";

            if (sessionmail == null || !sessionmail.substring(0, 2).equals(Admin)) {
                
                String redmsg = "Please Login to your Employee account to continue!";
                request.setAttribute("message", redmsg);
                request.getRequestDispatcher("/emplogin.jsp").forward(request, response);

                response.sendRedirect("/emplogin.jsp");
                
                
            }
        %>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>ABC Cinema</title>
        <link rel="shortcut icon" href="/employee/images/film.png" />
        <link rel="stylesheet" href="/employee/css/style.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.css" rel="stylesheet" />

<!--        <style>
            @media screen and (min-width: 1000px) {
                .sid {
                    min-height: calc(130vh - 65px);
                }
            }

            table.table td:nth-child(1) {
                width: 900px;
            }

        </style>-->

        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">

            google.load('visualization', '1.0', {'packages': ['corechart']});

            google.setOnLoadCallback(drawChart);


            function drawChart() {



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

                var options3 = {'title': 'Line chart',
                    'width': 1000,
                    'height': 300};


                // Instantiate and draw our chart, passing in some options.

                var chart3 = new google.visualization.LineChart(document.getElementById('chart_div3'));
                chart3.draw(data3, options3);

            }
        </script>


    </head>
    <body>
        <div class=" divide">

            <nav class="sidebar sid "  >
                <ul class="nav">


                    <center><img src="images/kindpng_2267500.png" height="60" width="60" class="mt-10"></center>

                    </li><br>
                    <li class="nav-item active" >
                        <a class="nav-link " href="/employee/staffiindex.jsp">
                            Employee Dashboard

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
                        <a class="nav-link" href="/employee/user.jsp">

                            Customer Details
                        </a>
                    </li>



                    <li class="nav-item">
                        <a class="nav-link" href="/employee/paymentdetails.jsp">

                            Payment Details
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/employee/show.jsp">

                            Manage Shows
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="/employee/booking.jsp">

                            Booking Details
                        </a>
                    </li>

                    <li class="nav-item">
                        <form method="post" action="/empLogoutServlet">
                        <input type="submit"
                               class="inline-block w-full px-10 py-3 bg-gray-700 text-white text-center font-medium text-m leading-tight uppercase  shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out uppercase"
                               value="logout"></form>
                    </li>

                </ul>
            </nav>

            <div class="container-fluid page-body-wrapper ">

                <nav class="navbar   ">
                    <div class="navbar-menu-wrapper    ">

                        <div class="navbar-brand-wrapper ">
                            <a class="navbar-brand brand-logo" href="/admin/adindex.jsp"><img src="/admin/images/abc_logo.png" class="mt-5 px-10" alt="logo"></a>

                        </div>



                    </div>




                </nav>
                <br>
                <!-- partial -->
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <%
                                String id = request.getParameter("userId");
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


                            <div class="col-sm-8">
                                <h2 style="color:red;" class="mb-8 font-bold uppercase text-3xl">Admin Alert!</b></h2>
                                <table class="table table-bordered">
                                    <tbody>

                                        <%
                                            try {
                                                connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                statement = connection.createStatement();
                                                String sql = "SELECT * FROM admin_message";

                                                resultSet = statement.executeQuery(sql);
                                                while (resultSet.next()) {
                                        %>
                                        <tr>
                                            <td><%=resultSet.getString("message")%></td>
                                        </tr>
                                        <%
                                                }

                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>

                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>     


                    <img src="/admin/images/cinemahall_image.png">

                </div>




<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.js"></script>
                </body>

                </html>