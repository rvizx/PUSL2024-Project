<!DOCTYPE html>
<html lang="en">

<head>
 
  <title>ABC Cinema</title>
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  
  <link rel="stylesheet" href="css/style.css">
  <link href="table.css" rel="stylesheet">
  <link rel="shortcut icon" href="images/film.png" />

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
              <li class="nav-item"> <a class="nav-link" href="movie.jsp">Manage Movies</a></li>
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
              <li class="nav-item"> <a class="nav-link" href="stff.jsp">Manage Employee</a></li>
              <li class="nav-item"> <a class="nav-link" href="stff details.jsp">Employee Details</a></li>
            </ul>
          </div>
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
    <div class="navbar-menu-wrapper  ">
      
      <div class="navbar-brand-wrapper ">
        <a class="navbar-brand brand-logo" href="adindex.jsp"><img src="images/abc logo.png" alt="logo"/></a>
        
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
                              <div class="col-sm-8"><h2>Movie <b>Details</b></h2></div>
                              <div class="col-sm-4">
                                  
                              </div>
                          </div>
                      </div>
                      <table class="table table-bordered">
                          <thead>
                              <tr>
                                  <th>Customer ID</th>
                                  <th>Customer Name</th>
                                  <th>Date</th>
                                  <th>TIme</th>

                                  
                                  <th>Seat No</th>
                                  <th>Movie Name</th>
                                 
                                 
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td>09</td>
                                  <td>jhon</td>
                                  <td>2022-01-09</td>
                                  <td>9.00</td>
                                  <td>3 </td>
                                  <td>Lusifer</td>
                                  
                                  
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