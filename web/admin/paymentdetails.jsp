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
        <style>
            table.table th:nth-child(4) {
                width: 240px;
            }
            table.table th:nth-child(1) {
                width: 65px;
            }
            table.table th:nth-child(3) {
                width: 200px;
            }
            table.table th:nth-child(2) {
                width: 220px;
            }
        </style>


        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                var actions = $("table td:last-child").jsp();
                $(".add-new").click(function () {
                    $(this).attr("disabled", "disabled");
                    var index = $("table tbody tr:last-child").index();
                    var row = '<tr>' +
                            '<td><input type="text" class="form-control" name="name" id="name"></td>' +
                            '<td><input type="text" class="form-control" name="department" id="department"></td>' +
                            '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
                            '<td>' + actions + '</td>' +
                            '</tr>';
                    $("table").append(row);
                    $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
                    $('[data-toggle="tooltip"]').tooltip();
                });
                $(document).on("click", ".add", function () {
                    var empty = false;
                    var input = $(this).parents("tr").find('input[type="text"]');
                    input.each(function () {
                        if (!$(this).val()) {
                            $(this).addClass("error");
                            empty = true;
                        } else {
                            $(this).removeClass("error");
                        }
                    });
                    $(this).parents("tr").find(".error").first().focus();
                    if (!empty) {
                        input.each(function () {
                            $(this).parent("td").jsp($(this).val());
                        });
                        $(this).parents("tr").find(".add, .edit").toggle();
                        $(".add-new").removeAttr("disabled");
                    }
                });
                // Edit row on edit button click
                $(document).on("click", ".edit", function () {
                    $(this).parents("tr").find("td:not(:last-child)").each(function () {
                        $(this).jsp('<input type="text" class="form-control" value="' + $(this).text() + '">');
                    });
                    $(this).parents("tr").find(".add, .edit").toggle();
                    $(".add-new").attr("disabled", "disabled");
                });
                // Delete row on delete button click
                $(document).on("click", ".delete", function () {
                    $(this).parents("tr").remove();
                    $(".add-new").removeAttr("disabled");
                });
            });
        </script>





    </head>
    <body>
        <div class=" divide">

            <nav class="sidebar sid "  >
                <ul class="nav">


                    <center><img src="/admin/images/kindpng_2267500.png" height="40" width="40"></center>

                    </li><br>
                    <li class="nav-item " >
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



                    <li class="nav-item active">
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
                        <a class="nav-link" href="admin/apfeedback.jsp">

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
                            <a class="navbar-brand brand-logo" href="adindex.jsp"><img src="images/abc_logo.png" alt="logo"/></a>

                        </div>



                    </div>




                </nav>


                <div class="main-panel">        
                    <div class="content-wrapper">
                        <div class="row">


                        </div>


                        <div class="container-lg">
                            <div class="table table-responsive">

                                <div class="table-wrapper">
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-8"><h2>Payment <b>Details</b></h2></div>

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
                                                <th>Payment ID</th>
                                                <th>Customer ID</th>
                                                <th>Customer First Name</th>
                                                <th>Total Price(LKR)</th>


                                            </tr>

                                            <%
                                                try {
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT payment.pay_id,payment.c_id,customer.name,payment.total_amount FROM payment,customer "
                                                            + "WHERE payment.c_id=customer.c_id";

                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                                            %>

                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><%=resultSet.getString("payment.pay_id")%></td>
                                                <td><%=resultSet.getString("payment.c_id")%></td>
                                                <td><%=resultSet.getString("customer.name")%></td>
                                                <td><%=resultSet.getString("payment.total_amount")%></td>
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

</body>

</html>