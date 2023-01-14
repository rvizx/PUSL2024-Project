
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

 

</style>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">

  google.load('visualization', '1.0', {'packages':['corechart']});

  google.setOnLoadCallback(drawChart);

 
  function drawChart() {

   
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Topping');    
    data.addColumn('number', 'Slices');
    data.addRows([
      ['Mushrooms', 3],
      ['Onions', 1],
      ['Olives', 1],
      ['Zucchini', 1],
      ['Pepperoni', 2]
    ]);
    // Create the data table.
    var data2 = new google.visualization.DataTable();
    data2.addColumn('string', 'Topping');
    data2.addColumn('number', 'Slices');
    data2.addRows([
      ['Mushrooms', 3],
      ['Onions', 1],
      ['Olives', 15],
      ['Zucchini', 1],
      ['Pepperoni', 2]
    ]);

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
    var options = {'title':'How Much Pizza I Ate Last Night',
                   'width':500,
                   'height':300};
    // Set chart options
    var options2 = {'title':'How Much Pizza You Ate Last Night',
                   'width':500,
                   'height':300};
    // Set chart options
    var options3 = {'title':'Line chart',
                   'width':1000,
                   'height':300};
 

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
    var chart2 = new google.visualization.BarChart(document.getElementById('chart_div2'));
    chart2.draw(data2, options2);
    var chart3 = new google.visualization.LineChart(document.getElementById('chart_div3'));
    chart3.draw(data3, options3);
    var chart4 = new google.visualization.DonutChart(document.getElementById('chart_div4'));
    chart4.draw(data4, options4);

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
              <li class="nav-item"> <a class="nav-link" href="addmovie.jsp">Add Movies</a></li>
               <li class="nav-item"> <a class="nav-link" href="managemovie.jsp">Manage Movies</a></li>
              <li class="nav-item"> <a class="nav-link" href="moviedetails.jsp">Movie Details</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="customerdetail.jsp">
            
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
              <li class="nav-item"> <a class="nav-link" href="addemployee.jsp">Add Employee</a></li>
              <li class="nav-item"> <a class="nav-link" href="empmanage.jsp">Manage Employee</a></li>
              <li class="nav-item"> <a class="nav-link" href="staffdetails.jsp">Employee Details</a></li>
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
    <div class="navbar-menu-wrapper    ">
      
      <div class="navbar-brand-wrapper ">
        <a class="navbar-brand brand-logo" href="adindex.jsp"><img src="images/abc_logo.png" alt="logo"/></a>
        
      </div>
      
            
      
    </div>
    
      
      
        
  </nav>
  <br>
      <!-- partial -->
     
          <div class="row">
            
            <div class="card">
            <div id="chart_div"></div></div>
            <div class="card">
        <div id="chart_div2"></div></div>
        <br>
        <div class="card">
        <div id="chart_div3"></div></div>
                    
          
  
       
      </div>
      
    </div>
  
  </div>
  


  
  
</body>

</html>