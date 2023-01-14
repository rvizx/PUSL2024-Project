
<!DOCTYPE html>
<html lang="en">

<head>
 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>ABC Cinema</title>
  <link rel="shortcut icon" href="images/film.png" />
  <link rel="stylesheet" href="css/style.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
  
  <style>
  @media screen and (min-width: 1000px) {
    .sid {
    min-height: calc(130vh - 65px);
  }
  }

  table.table td:nth-child(1) {
      width: 900px;
  }

</style>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">

  google.load('visualization', '1.0', {'packages':['corechart']});

  google.setOnLoadCallback(drawChart);

 
  function drawChart() {

   

    var data3 = new google.visualization.DataTable();
    data3.addColumn('string', 'Year');
    data3.addColumn('number', 'Sales');
    data3.addColumn('number', 'Expenses');
    data3.addRows([
      ['2004', 1000, 400],
      ['2005', 1170, 460],
      ['2006',  860, 580],
      ['2007', 1030, 540]
    ]);
    

    // Set chart options
    
    var options3 = {'title':'Line chart',
                   'width':1000,
                   'height':300};
 

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
        
          
          <center><img src="images/kindpng_2267500.png" height="40" width="40"></center>
          
        </li><br>
        <li class="nav-item active" >
          <a class="nav-link" href="index.jsp">
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
        <li class="nav-item">
          <a class="nav-link" href="user.jsp">
            
             Customer Details
          </a>
        </li>
        
        
        
       <li class="nav-item">
          <a class="nav-link" href="Payment details.jsp">
            
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
          <a class="nav-link" href="log.jsp">
           
            Logout
          </a>
        </li>
        
      </ul>
    </nav>

 <div class="container-fluid page-body-wrapper ">
 
  <nav class="navbar   ">
    <div class="navbar-menu-wrapper    ">
      
      <div class="navbar-brand-wrapper ">
        <a class="navbar-brand brand-logo" href="index.jsp"><img src="images/abc logo.png" alt="logo"/></a>
        
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
             
          <table class="table table-bordered">
             
              <tbody>
                  <tr>
                    <div class="col-sm-8"><h2 style="color:red;" >Admin<b> Alert !
                      
                     
                      <td>sadfghjksdfret wertyu wertyu wertyu werty awerty</td>
                    
                     
                  </tr>
                  
                        
              </tbody>
          </table>
         
      </div>
  </div>
</div>     


           <div class="card">
            <div class="card-body">
          
            
          
        <br>
        <div class="card">
        <div id="chart_div3"></div></div>
                    
          
  
       
      </div>
      
    </div>
  
  </div>
  


  
  
</body>

</html>