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
        <Style>
            table.table th:last-child {
                width: 150px;
            }
        </Style>

        <script>

        </script>
    </head>
    <body>
        <div class=" divide">

 <link rel="stylesheet" href="css/style.css">
  <link href="table.css" rel="stylesheet">
  
  <link rel="shortcut icon" href="images/film.png" />
  <Style>
    table.table th:last-child {
      width: 150px;
    }
    </Style>
  
  <script>
 
</script>
</head>
<body>
  <div class=" divide">
    
    <nav class="sidebar sid "  >
      <ul class="nav">
        
          
          <center><img src="images/kindpng_2267500.png" height="40" width="40"></center>
          
        </li><br>
        <li class="nav-item " >
          <a class="nav-link" href="sfindex.jsp">
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
              <li class="nav-item"> <a class="nav-link" href="moviedetails.jsp">Movie Details</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item active">
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
        <li class="nav-item ">
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
                <!-- partial -->
                <div class="main-panel">        
                    <div class="content-wrapper">
                        <div class="row">


                        </div>
                        <div class="col-12 grid-margin stretch-card">
                            <div class="card">

                            </div>
                        </div>

                        <div class="container-lg">
                            <div class="table-responsive">
                                <div class="table-wrapper">
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-8"><h2>Customer <b>Details</b></h2></div>
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


    </body>

</html>