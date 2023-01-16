<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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

        <title>ABC Cinema</title>


        <link rel="stylesheet" href="/admin/css/style.css">
        <link href="/admin/table.css" rel="stylesheet">

        <link rel="shortcut icon" href="/admin/images/film.png" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.css" rel="stylesheet" />


        <style>
            table.table th:nth-child(1) {
                width: 100px;
            }
            table.table th:nth-child(2) {
                width: 580px;
            }


        </style>

        <script>

        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script>
            function functionConfirm(msg, myYes, myNo) {
                var confirmBox = $("#confirm");
                confirmBox.find(".message").text(msg);
                confirmBox.find(".yes,.no").unbind().click(function () {
                    confirmBox.hide();
                });
                confirmBox.find(".yes").click(myYes);
                confirmBox.find(".no").click(myNo);
                confirmBox.show();
            }
        </script>
        <style>
            #confirm {
                display: none;
                background-color: white;
                border: 1px solid rgb(189, 143, 28);
                position:fixed;
                width: 200px;
                height: 100px;
                left: 55%;
                margin-left: -100px;
                padding: 8px;
                box-sizing: border-box;
                text-align: center;
            }
            #confirm button {
                background-color: rgb(189, 143, 28);
                display: inline-block;
                border-radius: 5px;
                border: 1px solid white;
                padding: 5px;
                text-align: center;
                width: 80px;
                cursor: pointer;
                margin-top: 20px;
            }
            #confirm .message {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class=" divide">

            <nav class="sidebar sid "  >
                <ul class="nav">


                    <center><img src="images/kindpng_2267500.png" height="60" width="60" class="mt-10"></center>

                    </li><br>
                    <li class="nav-item " >
                        <a class="nav-link uppercase font-bold" href="/admin/adindex.jsp">
                            Admin Dashboard

                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold"   >
                            Movies

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/addmovie.jsp">Add Movies</a></li>
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/managemovie.jsp">Manage Movies</a></li>
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/moviedetails.jsp">Movie Details</a></li>
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
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/staffdetails.jsp">Employee Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold" href="/admin/show.jsp">

                            Manage Shows
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link uppercase font-bold" href="/admin/booking.jsp">

                            Booking Details
                        </a>
                    </li>
                    <li class="nav-item active ">
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
                <div class="navbar-menu-wrapper  ">

                    <div class="navbar-brand-wrapper ">
                        <a class="navbar-brand brand-logo" href="/admin/adindex.jsp"><img src="/admin/images/abc_logo.png" class="mt-5 px-10" alt="logo"></a>

                    </div>



                </div>

            <div class="container-fluid page-body-wrapper ">



                <div class="main-panel mt-10">
                    <div class="content-wrapper">
                        <div class="row">


                        </div>
                        <br>

                        <div class="card">
                            <div class="card-body">


                                <form class="forms-sample" id="contact" method="post" action="/feedbackmessage">
                                    <div class="form-group">
                                        <label class="mb-8 font-bold uppercase text-xl">Send Message</label>
                                        <input type="text" class="form-control"  name="adminmsg" placeholder="Enter Message here" required>
                                    </div>



                                    <button type="submit" class="btn btn-primary bg-black ">Send Message to Staff</button>
                                    <p>${message}</p>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="container-lg">
                        <div class="table table-responsive">

                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class=""><h2 class="mb-8 font-bold uppercase text-xl">Customer Feedback</h2></div>

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
                                    <thead>
                                        <tr>
                                            <th>Customer Name</th>
                                            <th>Feedback</th>
                                        </tr>
                                        <%
                                            try {
                                                connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                statement = connection.createStatement();
                                                String sql = "SELECT name,message FROM feedback";

                                                resultSet = statement.executeQuery(sql);
                                                while (resultSet.next()) {
                                        %>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><%=resultSet.getString("name")%></td>
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


                </div>
            </div>



        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.js"></script>
</body>

</html>