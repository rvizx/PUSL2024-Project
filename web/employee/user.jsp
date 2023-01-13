<!DOCTYPE html>
<html lang="en">

<head>
  
 
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
              <li class="nav-item"> <a class="nav-link" href="movie details.jsp">Movie Details</a></li>
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

 <div class="container-fluid page-body-wrapper ">
 
  <nav class="navbar   ">
    <div class="navbar-menu-wrapper  ">
      
      <div class="navbar-brand-wrapper ">
        <a class="navbar-brand brand-logo" href="sfindex.jsp"><img src="images/abc logo.png" alt="logo"/></a>
        
      </div>
      
            
      
    </div>
    
      
      
        
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
                      <table class="table table-bordered">
                          <thead>
                            <th>Customer ID</th>
                                  <th>Customer Frist Name</th>
                                  <th>Customer Last Name</th>
                                  <th>Customer Mobile</th>
                                  <th>Customer Email</th>
                               
                                  
                                  
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td>100</td>
                                  <td>Jhon </td>
                                  <td>Smith</td>
                                  <td>(171) 555-2222</td>
                                  <td>Jon@gmail.com</td>
                                  
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

  
</body>

</html>