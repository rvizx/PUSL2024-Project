<!DOCTYPE html>
<html lang="en">

<head>
  
  
  <title>ABC Cinema</title>
  
  <link rel="stylesheet" href="css/style.css">
  <link href="table.css" rel="stylesheet">
  <link rel="shortcut icon" href="images/film.png" />
  <style>
    table.table th:nth-child(4) {
      width: 240px;
  }
  table.table th:nth-child(1) {
      width: 65px;
  }
  table.table th:nth-child(3) {
      width: 200px;
  }
  table.table th:nth-child(2) {
      width: 220px;
  }
  </style>
  
  
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
  <div class=" divide">
    
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
        
        
        
       <li class="nav-item active">
          <a class="nav-link" href="Payment details.html">
            
             Payment Details
          </a>
        </li>
        
        <li class="nav-item">
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
     
      
  <div class="main-panel">        
    <div class="content-wrapper">
      <div class="row">
        
        
        </div>
       
        
        <div class="container-lg">
          <div class="table table-responsive">
            
              <div class="table-wrapper">
                  <div class="table-title">
                      <div class="row">
                              <div class="col-sm-8"><h2>Payment <b>Details</b></h2></div>
                             
                          </div>
                      </div>
                      
                      <table class="table table-bordered">
                          <thead>
                              <tr>
                                  <th>Payment ID</th>
                                  <th>Customer First Name</th>
                                  
                                  <th>Cus ID</th>
                                  
                                  <th>Price</th>
                                  
                                 
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td>200</td>
                                  <td>kamal</td>
                                  
                                  <td>100</td>
                                  <td>5500.00</td>
                                 
                                 
                                   
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