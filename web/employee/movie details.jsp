<!DOCTYPE html>
<html lang="en">

<head>
 
  <title>ABC Cinema</title>
 
 
  <link rel="stylesheet" href="css/style.css">
  <link href="table.css" rel="stylesheet">
  <link rel="shortcut icon" href="images/film.png" />
<style>
  table.table th:nth-child(4) {
    width: 140px;
}
table.table th:nth-child(1) {
    width: 65px;
}
table.table th:nth-child(8) {
    width: 80px;
}
table.table th:nth-child(7) {
    width: 120px;
}
</style>
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script>
  $(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	var actions = $("table td:last-child").jsp();
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
				$(this).parent("td").jsp($(this).val());
			});			
			$(this).parents("tr").find(".add, .edit").toggle();
			$(".add-new").removeAttr("disabled");
		}		
    });
	$(document).on("click", ".edit", function(){		
        $(this).parents("tr").find("td:not(:last-child ,:nth-child(4))").each(function(){
			$(this).jsp('<input type="text" class="form-control" value="' + $(this).text() + '">');
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
    
    <nav class="sidebar sid " >
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
              <li class="nav-item active"> <a class="nav-link" href="movie details.jsp">Movie Details</a></li>
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
        <a class="navbar-brand brand-logo" href="sfindex.jsp"><img src="images/abc_logo.png" alt="logo"/></a>
        
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
                                  <th>Movie ID</th>
                                  <th>Movie Name</th>
                                  <th>Movie Language</th>
                                  <th>Status</th>
                                  <th>Genre</th>
                                  <th>Runtime</th>
                                  <th>Description</th>
                                  <th>Actions</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td>09</td>
                                  <td>Happy Birthday</td>
                                  <td> English</td>
                                  <td>
                                    <select id ="cr">
                                      <option>Now Showing </option>
                                    <option>Coming Soon</option>
                                  </select></td>
                                  <td>Comedy</td>
                                  <td>3 hr</td>
                                  <td>better as a movie and so good and best</td>
                                  
                                  <td>
                                      <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                      <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
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