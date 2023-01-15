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
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  
  <link rel="stylesheet" href="/employee/css/style.css">
  <link href="/employee/table.css" rel="stylesheet">
  <link rel="shortcut icon" href="/employee/images/film.png" />

  <style>
    table.table th:nth-child(4) {
      width: 150px;
  
  }
  </style>
  
</script>
</head>
<body>
  <div class=" divide">
    
    <nav class="sidebar sid "  >
      <ul class="nav">
        
          
          <center><img src="/employee/images/kindpng_2267500.png" height="40" width="40"></center>
          
        </li><br>
        <li class="nav-item " >
          <a class="nav-link" href="/employee/staffiindex.jsp">
            Dashboard
            
          </a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link"   >
            Movies 
            
          </a>
          <div  >
            <ul class="nav  sub-menu">
              <li class="nav-item"> <a class="nav-link" href="/employee/movie.jsp">Add Movies</a></li>
              <li class="nav-item"> <a class="nav-link" href="/employee/managemovie.jsp">Manage Movies</a></li>
              <li class="nav-item"> <a class="nav-link" href="/employee/moviedetails.jsp">Movie Details</a></li>
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
          <a class="nav-link" href="show.jsp">
            
            Manage Shows
          </a>
        </li>
        <li class="nav-item active ">
          <a class="nav-link" href="booking.jsp">
           
            Booking Details
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
    <div class="navbar-menu-wrapper  ">
      
      <div class="navbar-brand-wrapper ">
        <a class="navbar-brand brand-logo" href="staffdetails.jsp"><img src="/admin/imabc_logo.pngo.png" alt="logo"/></a>
        
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
                                        <div class="col-sm-8"><h2>Booking <b>Details</b></h2></div>
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
                                    <thead>
                                        <tr>
                                            <th>Customer Name</th>
                                            <th>Ticket ID</th>
                                            <th>Seat Number</th>
                                            <th>Date Time</th>
                                        </tr>

                                        <%
                                            try {
                                                connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                statement = connection.createStatement();
                                                String sql = "SELECT ticket.t_id, ticket.seat_no, ticket.date_time, customer.name FROM ticket,customer WHERE ticket.c_id=customer.c_id";

                                                resultSet = statement.executeQuery(sql);
                                                while (resultSet.next()) {
                                        %>

                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><%=resultSet.getString("customer.name")%></td>
                                            <td><%=resultSet.getString("ticket.t_id")%></td>
                                            <td><%=resultSet.getString("ticket.seat_no")%></td>
                                            <td><%=resultSet.getString("ticket.date_time")%></td>


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