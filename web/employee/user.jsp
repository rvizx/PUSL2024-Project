<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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

        <title>ABC Cinema</title>



        <link rel="stylesheet" href="css/style.css">
        <link href="table.css" rel="stylesheet">

        <link rel="shortcut icon" href="images/film.png" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.css" rel="stylesheet" />
        <style>
            @media screen and (min-width: 1000px) {
                .sid {
                    min-height: calc(170vh - 65px);
                }
            }
            .ccard-body {
                padding-right: 1.25rem;
                padding-top:0%;
                padding-bottom: 0%;
            }
        </style>

        <script>

        </script>
    </head>
    <body>
        <div class=" divide">

            <nav class="sidebar sid " >
                <ul class="nav">


                    <center><img src="images/kindpng_2267500.png" height="60" width="60" class="mt-10"></center>

                    </li><br>
                    <li class="nav-item " >
                        <a class="nav-link uppercase font-bold" href="adindex.jsp">
                            Employee Dashboard

                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold"   >
                            Movies 

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="addmovie.jsp">Add Movies</a></li>
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="managemovie.jsp">Manage Movies</a></li>
                                <li class="nav-item "> <a class="nav-link uppercase font-bold" href="moviedetails.jsp">Movie Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link uppercase font-bold" href="customerdetail.jsp">

                            Customer Details
                        </a>
                    </li>



                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold" href="paymentdetails.jsp">

                            Payment Details
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold" href="show.jsp">

                            Manage Shows
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link uppercase font-bold" href="booking.jsp">

                            Booking Details
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

                <nav class="navbar">
                    <div class="navbar-menu-wrapper  ">

                        <div class="navbar-brand-wrapper ">
                             <a class="navbar-brand brand-logo" href="/admin/adindex.jsp"><img src="/admin/images/abc_logo.png" class="mt-5 px-10" alt="logo"></a>

                        </div>



                    </div>




                </nav>
            
            <!-- partial -->
            <div class="main-panel mt-10">        
                <div class="content-wrapper">
                    <div class="row">


                    </div>
                    <div class="col-12 grid-margin stretch-card">
                        
                    </div>

                    <div class="container-lg">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-8 "><h2 class="mb-8 font-bold uppercase text-xl">Customer Details</h2></div>
                                        <div class="col-sm-4">

                                        </div>
                                    </div>
                                </div>
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

                                <table class="table table-bordered">
                                    <tr>
                                        <th>Customer ID</th>
                                        <th>Customer First Name</th>
                                        <th>Customer Mobile</th>
                                        <th>Customer Email</th>
                                    </tr>
                                    <%
                                        try {
                                            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                            statement = connection.createStatement();
                                            String sql = "SELECT * FROM customer";

                                            resultSet = statement.executeQuery(sql);
                                            while (resultSet.next()) {
                                    %>

                                    <tr>

                                        <td><%=resultSet.getString("c_id")%></td>
                                        <td><%=resultSet.getString("name")%></td>
                                        <td><%=resultSet.getString("mobile")%></td>
                                        <td><%=resultSet.getString("email")%></td>

                                    </tr> 

                                    <%
                                            }

                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>


                                </table>
                            </div>
                        </div>
                    </div>     

                </div>



            </div>


        </div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.js"></script>
    </body>

</html>