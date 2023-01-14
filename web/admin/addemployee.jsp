<!DOCTYPE html>
<html lang="en">

<head>
  
  <title>ABC Cinema</title>
  
  <link rel="stylesheet" href="/admin/css/style.css">
  <link href="/admin/table.css" rel="stylesheet">
  <link rel="shortcut icon" href="images/film.png" />

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
	// Add row on add button click
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
	// Edit row on edit button click
	$(document).on("click", ".edit", function(){		
        $(this).parents("tr").find("td:not(:last-child)").each(function(){
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
  <div class="divide">
    
    <nav class="sidebar sid "  >
      <ul class="nav">
        
          
          <center><img src="/admin/images/kindpng_2267500.png" height="40" width="40"></center>
          
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
              <li class="nav-item"> <a class="nav-link" href="addmovie.jsp">Add Movies</a></li>
               <li class="nav-item"> <a class="nav-link" href="/admin/managemovie.jsp">Manage Movies</a></li>
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
               <li class="nav-item active"> <a class="nav-link" href="addemployee.jsp">Add Employee</a></li>
                <li class="nav-item"> <a class="nav-link" href="empmanage.jsp">Manage Employee</a></li>
                <li class="nav-item "> <a class="nav-link" href="staffdetails.jsp">Employee Details</a></li>
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
    <div class="navbar-menu-wrapper  ">
      
      <div class="navbar-brand-wrapper ">
        <a class="navbar-brand brand-logo" href="adindex.jsp"><img src="/admin/images/abc logo.png" alt="logo"/></a>
        
      </div>
      
            
      
    </div>
    
      
      
        
  </nav>
        <br>
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">
            
            
            </div>
            ${message}
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Employee details</h4>
                  
                  <form class="forms-sample" id="contact" method="post" action="/addstaff">
                    <div class="form-group">
                      <label >Employee Name</label>
                      <input type="text" class="form-control"  name="empname" placeholder="Name" required>
                    </div>
                    <div class="form-group">
                      <label >Employee Email</label>
                      <input type="email" class="form-control" name="empmail"  placeholder="Email" required>
                    </div>
                    
                      <div class="form-group">
                        <label >Employee Password</label>
                        <input type="password" class="form-control"  name="emppassword" placeholder="Password" required>
                      </div>
                    
                    
                    <button type="submit" class="btn btn-primary  ">Add User</button>
                    <button class="btn ">Cancel</button>
                  </form>
                </div>
              </div>
            </div>
            
            
            
            
          </div>
        </div>
       
      </div>
    </div>
  </div>
  

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