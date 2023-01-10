<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>ABC Cinema</title>
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  
  <link rel="stylesheet" href="css/style.css">
  <link href="table.css" rel="stylesheet">
  <link rel="shortcut icon" href="images/film.png" />
  <Style>
    table.table th:last-child {
      width: 150px;
    }
    </Style>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script>
  $(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	var actions = $("table td:last-child").html();
    $(".add-new").click(function(){
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
	$(document).on("click", ".add", function(){
		var empty = false;
		var input = $(this).parents("tr").find('input[type="text"]');
        input.each(function(){
			if(!$(this).val()){
				$(this).addClass("error");
				empty = true;
			} else{
                $(this).removeClass("error");
            }
		});
		$(this).parents("tr").find(".error").first().focus();
		if(!empty){
			input.each(function(){
				$(this).parent("td").html($(this).val());
			});			
			$(this).parents("tr").find(".add, .edit").toggle();
			$(".add-new").removeAttr("disabled");
		}		
    });
	// Edit row on edit button click
	$(document).on("click", ".edit", function(){		
        $(this).parents("tr").find("td:not(:last-child)").each(function(){
			$(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
		});		
		$(this).parents("tr").find(".add, .edit").toggle();
		$(".add-new").attr("disabled", "disabled");
    });
	// Delete row on delete button click
	$(document).on("click", ".delete", function(){
        $(this).parents("tr").remove();
		$(".add-new").removeAttr("disabled");
    });
});
</script>
</head>
<body>
  <div class="container-scroller d-flex">
    <!-- sidebar -->
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
      <ul class="nav">
        <li class="nav-item sidebar-category">
          <center><img src="images/kindpng_2267500.png" height="40" width="40"></center>
          <span></span>
        </li><br>
        <li class="nav-item">
          <a class="nav-link" href="index.html">
            <i class="mdi mdi-view-quilt menu-icon"></i>
            <span class="menu-title">Dashboard</span>
            
          </a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link"    >
            <i class="mdi mdi-movie menu-icon"></i>
            <span class="menu-title">Movies</span>
            
          </a>
          <div  id="ui-basic">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="movie.html">Manage Movies</a></li>
              <li class="nav-item"> <a class="nav-link" href="movie details.html">Movie Details</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item active">
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
        <li class="nav-item  ">
          <a class="nav-link" href="review.html">
            <i class="mdi mdi-cards-outline menu-icon"></i>
            <span class="menu-title">Customer Feedback</span>
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
    <div class="container-fluid page-body-wrapper">
      <!-- navbar -->
      <nav class="navbar col-lg-12 col-12 px-0 py-0 py-lg-4 d-flex flex-row">
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
          <div class="navbar-brand-wrapper">
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
                              <tr>
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
  </div>
 
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  
  <script src="../../js/file-upload.js"></script>
 <script src="test.js"></script>
    <script>
      var myInput = document.getElementById("psw");
      var letter = document.getElementById("letter");
      var capital = document.getElementById("capital");
   
      var length = document.getElementById("length");
      
      myInput.onfocus = function() {
        document.getElementById("message").style.display = "block";
      }
      
      myInput.onblur = function() {
        document.getElementById("message").style.display = "none";
      }
      
      myInput.onkeyup = function() {
        // Validate lowercase letters
        var lowerCaseLetters = /[a-z]/g;
        if(myInput.value.match(lowerCaseLetters)) {  
          letter.classList.remove("invalid");
          letter.classList.add("valid");
        } else {
          letter.classList.remove("valid");
          letter.classList.add("invalid");
        }
        
        // Validate capital letters
        var upperCaseLetters = /[A-Z]/g;
        if(myInput.value.match(upperCaseLetters)) {  
          capital.classList.remove("invalid");
          capital.classList.add("valid");
        } else {
          capital.classList.remove("valid");
          capital.classList.add("invalid");
        }
      
       
        // Validate length
        if(myInput.value.length >= 8) {
          length.classList.remove("invalid");
          length.classList.add("valid");
        } else {
          length.classList.remove("valid");
          length.classList.add("invalid");
        }
      }
      </script>
</body>

</html>