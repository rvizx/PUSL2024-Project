<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
  
  
  <title>ABC Cinema</title>
  
  
  <link rel="stylesheet" href="css/style.css">
  <link href="table.css" rel="stylesheet">
  
  <link rel="shortcut icon" href="images/film.png" />

  
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
                confirmBox.find(".yes,.no").unbind().click(function() {
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
              <li class="nav-item"> <a class="nav-link" href="moviedetails.jsp">Movie Details</a></li>
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
              <li class="nav-item"> <a class="nav-link" href="stffdetails.jsp">Employee Details</a></li>
            </ul>
          </div>
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
        <li class="nav-item active">
          <a class="nav-link" href="review.jsp">
            
            Approve Feedback
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="log.jsp">
           
            Logout
          </a>
        </li>
        
      </ul>
    </nav>

 <div class="container-fluid page-body-wrapper ">
 
  <nav class="navbar   ">
    <div class="navbar-menu-wrapper  ">
      
      <div class="navbar-brand-wrapper ">
        <a class="navbar-brand brand-logo" href="index.jsp"><img src="images/abc logo.png" alt="logo"/></a>
        
      </div>
      
            
      
    </div>
    
      
      
        
  </nav>
      
    <div class="main-panel">        
      <div class="content-wrapper">
        <div class="row">
          
          
          </div>
          <br>
         
          <div class="card">
            <div class="card-body">
             
              
              <form class="forms-sample" id="contact" method="post">
                <div class="form-group">
                  <label >Send Message</label>
                  <input type="text" class="form-control"  name="empname" placeholder="Enter Message here" required>
                </div>
               
                
                
                <button type="submit" class="btn btn-primary  ">Send Message to Staff</button>
                
              </form>
            </div>
          </div>
        </div>
          <div class="container-lg">
            <div class="table table-responsive">
              
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                              <div class=""><h2>Customer <b> Feedback</b></h2></div>
                             
                          </div>
                      </div>
                      
                      <table class="table table-bordered">
                          <thead>
                              <tr>
                                  <th>Customer ID</th>
                                  
                                  
                                  <th>Feedback</th>
                                  
                                  
                                 
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td>100</td>
                                  
                                 
                                  <td>sadfghjksdfret wertyu wertyu wertyu werty awerty</td>
                                  
                                 
                                 
                                   
</td>
                                 
                              </tr>
                              
                                    
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