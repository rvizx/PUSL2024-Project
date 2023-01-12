<!DOCTYPE html>
<html lang="en">

<head>
  
  
  <title>ABC Cinema</title>
  

  <link rel="stylesheet" href="css/style.css">
  <link href="table.css" rel="stylesheet">
   <link rel="shortcut icon" href="images/film.png" />

  
  <script>
 
</script>
</head>
<body>
  <div class="divide">
    
    <nav class="sidebar sid "  >
      <ul class="nav">
        
          
          <center><img src="images/kindpng_2267500.png" height="40" width="40"></center>
          
        </li><br>
        <li class="nav-item " >
          <a class="nav-link" href="index.html">
            Dashboard
            
          </a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link"   >
            Movies 
            
          </a>
          <div  >
            <ul class="nav  sub-menu">
              <li class="nav-item"> <a class="nav-link" href="movie.html">Manage Movies</a></li>
              <li class="nav-item"> <a class="nav-link" href="movie details.html">Movie Details</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="user.html">
            
             Customer Details
          </a>
        </li>
        
        
        
       <li class="nav-item">
          <a class="nav-link" href="Payment details.html">
            
             Payment Details
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link"   >
           
             Employees
            
          </a>
          <div  >
            <ul class="nav  sub-menu">
              <li class="nav-item"> <a class="nav-link" href="stff.html">Manage Employee</a></li>
              <li class="nav-item "> <a class="nav-link" href="stff details.html">Employee Details</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="show.html">
            
            Manage Shows
          </a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="booking.html">
           
            Booking Details
          </a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="review.html">
            
            Approve Feedback
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="log.html">
           
            Logout
          </a>
        </li>
        
      </ul>
    </nav>

 <div class="container-fluid page-body-wrapper ">
 
  <nav class="navbar   ">
    <div class="navbar-menu-wrapper   ">
      
      <div class="navbar-brand-wrapper ">
        <a class="navbar-brand brand-logo" href="index.html"><img src="images/abc logo.png" alt="logo"/></a>
        
      </div>
      
            
      
    </div>
    
      
      
        
  </nav>
        <br>
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">
            
            
            </div>
            
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Show details</h4>
                  
                  <form class="forms-sample" id="contact" method="post">
                    <div class="form-group">
                      <label >Show Date</label>
                      <input type="date" class="form-control"  placeholder="Name" required>
                    </div>
                    
                    <div class="form-group">
                        <label >Show Time</label>
                          <select class="form-control"  required>
                            <option>09.00 - 12.00</option>
                            <option>02.00 - 05.00</option>
                            <option>07.00 - 09.30</option>
                            
                          </select>
                        </div>
                    
                      <div class="form-group">
                        <label >Movie ID</label>
                        <input type="text" class="form-control" name="movieid" placeholder="Movie ID" required>
                      </div>
                      <div class="form-group">
                        <label >Movie Name</label>
                        <input type="text" class="form-control" name="moviename" placeholder="Movie Name" required>
                      </div>
                    
                    <button type="submit" class="btn btn-primary mr-2">Edit Show</button>
                    <button class="btn btn-light">Cancel</button>
                  </form>
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