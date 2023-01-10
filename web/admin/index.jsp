
<!DOCTYPE html>
<html lang="en">

<head>
 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>ABC Cinema</title>
  
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
  <link rel="shortcut icon" href="images/" />
  <style>
  @media screen and (min-width: 1000px) {
    .sid {
    min-height: calc(150vh - 65px);
  }
  }
</style>
</head>
<body>
  <div class="container-scroller d-flex">
    
    <nav class="sidebar sidebar-offcanvas sid "  id="sidebar">
      <ul class="nav">
        <li class="nav-item sidebar-category">
          
          <center><img src="images/kindpng_2267500.png" height="40" width="40"></center>
          <span></span>
        </li><br>
        <li class="nav-item" >
          <a class="nav-link" href="index.html">
            <i class="mdi mdi-view-quilt menu-icon"></i>
            <span class="menu-title">Dashboard</span>
            
          </a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link"   >
            <i class="mdi mdi-movie menu-icon"></i>
            <span class="menu-title">Movies </span>
            
          </a>
          <div  id="ui-basic">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="movie.html">Manage Movies</a></li>
              <li class="nav-item"> <a class="nav-link" href="movie details.html">Movie Details</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="user.html">
            <i class="mdi mdi mdi-account-plus menu-icon"></i>
            <span class="menu-title"> Customer Details</span>
          </a>
        </li>
        
        
        
       <li class="nav-item">
          <a class="nav-link" href="Payment details.html">
            <i class="mdi mdi-cards-outline menu-icon"></i>
            <span class="menu-title"> Payment Details</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link"   >
            <i class="mdi mdi mdi-account-plus menu-icon"></i>
            <span class="menu-title"> Employees</span>
            
          </a>
          <div  id="ui-basic">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="stff.html">Manage Employee</a></li>
              <li class="nav-item"> <a class="nav-link" href="stff details.html">Employee Details</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="show.html">
            <i class="mdi mdi-movie menu-icon"></i>
            <span class="menu-title">Manage Shows</span>
          </a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="booking.html">
            <i class="mdi mdi-cards-outline menu-icon"></i>
            <span class="menu-title">Booking Details</span>
          </a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="review.html">
            <i class="mdi mdi-cards-outline menu-icon"></i>
            <span class="menu-title">Approve Feedback</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="log.html">
            <i class="mdi mdi-account-remove menu-icon"></i>
            <span class="menu-title">Logout</span>
          </a>
        </li>
        
      </ul>
    </nav>

 <div class="container-fluid page-body-wrapper ">
 
  <nav class="navbar col-lg-12 col-12 px-0 py-0 py-lg-4 d-flex flex-row  ">
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end ">
      <button class="navbar-toggler navbar-toggler align-self-center " type="button" data-toggle="minimize">
        <span class="mdi mdi-menu"></span>
      </button>
      <div class="navbar-brand-wrapper ">
        <a class="navbar-brand brand-logo" href="index.html"><img src="images/abc logo.png" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="images/logo-mini.svg" alt="logo"/></a>
      </div>
      <h4 class="font-weight-bold mb-0 d-none d-md-block mt-1"></h4>
      <ul class="navbar-nav navbar-nav-right">
        <li class="nav-item">
          <h4 class="mb-0 font-weight-bold d-none d-xl-block"></h4>
        </li>
        
        
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>       
      
    </div>
    
      
      
        
  </nav>
  <br>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-12 col-xl-6 grid-margin stretch-card">
              <div class="row w-100 flex-grow">
                <div class="col-md-12 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <p class="card-title">Website Audience Metrics</p>
                      <p class="text-muted">25% more traffic than previous week</p>
                      <div class="row mb-3">
                        <div class="col-md-7">
                          <div class="d-flex justify-content-between traffic-status">
                            <div class="item">
                              <p class="mb-">Users</p>
                              <h5 class="font-weight-bold mb-0">93,956</h5>
                              <div class="color-border"></div>
                            </div>
                            <div class="item">
                              <p class="mb-">Bounce Rate</p>
                              <h5 class="font-weight-bold mb-0">58,605</h5>
                              <div class="color-border"></div>
                            </div>
                            <div class="item">
                              <p class="mb-">Page Views</p>
                              <h5 class="font-weight-bold mb-0">78,254</h5>
                              <div class="color-border"></div>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-5">
                          <ul class="nav nav-pills nav-pills-custom justify-content-md-end" id="pills-tab-custom"
                            role="tablist">
                            <li class="nav-item">
                              
                            </li>
                            <li class="nav-item">
                              
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" id="pills-contact-tab-custom" data-toggle="pill" href="#pills-music"
                                role="tab" aria-controls="pills-contact" aria-selected="false">
                                Month
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                      <canvas id="audience-chart"></canvas>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex align-items-center justify-content-between flex-wrap">
                        <p class="card-title">Weekly Balance</p>
                        <p class="text-success font-weight-medium">20.15 %</p>
                      </div>
                      <div class="d-flex align-items-center flex-wrap mb-3">
                        <h5 class="font-weight-normal mb-0 mb-md-1 mb-lg-0 mr-3">$22.736</h5>
                        <p class="text-muted mb-0">Avg Sessions</p>
                      </div>
                      <canvas id="balance-chart" height="130"></canvas>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex align-items-center justify-content-between flex-wrap">
                        <p class="card-title">Today Task</p>
                        <p class="text-success font-weight-medium">45.39 %</p>
                      </div>
                      <div class="d-flex align-items-center flex-wrap mb-3">
                        <h5 class="font-weight-normal mb-0 mb-md-1 mb-lg-0 mr-3">17.247</h5>
                        <p class="text-muted mb-0">Avg Sessions</p>
                      </div>
                      <canvas id="task-chart" height="130"></canvas>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-xl-6 grid-margin stretch-card">
              <div class="row w-100 flex-grow">
                <div class="col-md-6 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <p class="card-title">Regional Load</p>
                      <p class="text-muted">Last update: 2 Hours ago</p>
                      <div class="regional-chart-legend d-flex align-items-center flex-wrap mb-1"
                        id="regional-chart-legend"></div>
                      <canvas height="280" id="regional-chart"></canvas>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body pb-0">
                      <div class="d-flex align-items-center mb-4">
                        <p class="card-title mb-0 mr-1">Today activity</p>
                        <div class="badge badge-info badge-pill">2</div>
                      </div>
                      <div class="d-flex flex-wrap pt-2">
                        <div class="mr-4 mb-lg-2 mb-xl-0">
                          <p>Time On Site</p>
                          <h4 class="font-weight-bold mb-0">77.15 %</h4>
                        </div>
                        <div>
                          <p>Page Views</p>
                          <h4 class="font-weight-bold mb-0">14.15 %</h4>
                        </div>
                      </div>
                    </div>
                    <canvas height="150" id="activity-chart"></canvas>
                  </div>
                </div>
                <div class="col-md-12 stretch-card">
                  <div class="card">
                    <div class="card-body pb-0">
                      <p class="card-title">Server Status 247</p>
                      <div class="d-flex justify-content-between flex-wrap">
                        <p class="text-muted">Last update: 2 Hours ago</p>
                        <div class="d-flex align-items-center flex-wrap server-status-legend mt-3 mb-3 mb-md-0">
                          <div class="item mr-3">
                            <div class="d-flex align-items-center">
                              <div class="color-bullet"></div>
                              <h5 class="font-weight-bold mb-0">128GB</h5>
                            </div>
                            <p class="mb-">Total Usage</p>
                          </div>
                          <div class="item mr-3">
                            <div class="d-flex align-items-center">
                              <div class="color-bullet"></div>
                              <h5 class="font-weight-bold mb-0">92%</h5>
                            </div>
                            <p class="mb-">Memory Usage</p>
                          </div>
                          <div class="item mr-3">
                            <div class="d-flex align-items-center">
                              <div class="color-bullet"></div>
                              <h5 class="font-weight-bold mb-0">16%</h5>
                            </div>
                            <p class="mb-">Disk Usage</p>
                          </div>
                        </div>
                      </div>
                    </div>
                    <canvas height="170" id="status-chart"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
  
       
      </div>
      
    </div>
  
  </div>
  


  <script src="vendors/js/vendor.bundle.base.js"></script>
  
  <script src="vendors/chart.js/Chart.min.js"></script>
  
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
 
  <script src="js/dashboard.js"></script>
  
  
</body>

</html>