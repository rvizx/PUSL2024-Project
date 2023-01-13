<!DOCTYPE html>
<html lang="en">

<head>
 
  <title>ABC Cinema</title>
 
  <link rel="stylesheet" href="css/style.css">
  <link href="table.css" rel="stylesheet">
  <link rel="shortcut icon" href="images/film.png" />

  
  
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  
  
  <style>
@media screen and (min-width: 1000px) {
  .sid {
  min-height: calc(170vh - 65px);
}
}
.ccard-body {
  padding-right: 1.25rem;
  padding-top:0%;
  padding-bottom: 0%;
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
              <li class="nav-item "> <a class="nav-link" href="movie.html">Add Movies</a></li>

              <li class="nav-item active"> <a class="nav-link" href="managemovies.jsp">Manage Movies</a></li>
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
                <li class="nav-item"> <a class="nav-link" href="stff.html">Add Employee</a></li>
              <li class="nav-item"> <a class="nav-link" href="empmanage.jsp">Manage Employee</a></li>
              <li class="nav-item"> <a class="nav-link" href="stff details.html">Employee Details</a></li>
            </ul>
          </div>
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
    <div class="navbar-menu-wrapper ">
      
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
            
                  
                  <h4 class="card-title">Search Movie Details</h4>
                  
                  <form class="forms-sample" id="contact" method="post">
                    
                    <div class="form-group " >
                      <label >Movie ID </label>
                      <input  type="text" class="" name="movieID" placeholder="Enter Movie ID" required>
                   
                    
                    
                    
                    
                    <button type="submit" class=" btn-primary ">Search</button>
                    
                  </form>
                  
                   
                </div>
              </div>
            </div>
            
       
            
              <div class="card">
                <div class="card-body">
                  
                  
                  <form class="forms-sample" id="contact" method="post">
                    
                    <div class="form-group" >
                      <label >Movie Name </label>
                      <input type="text" class="form-control" name="moviename" placeholder="Name" required>
                    </div>
                    
                    <div class="form-group ">
                      <label >Movie Language</label>
                        <select class="form-control" name="movielanguage" required>
                          <option>English</option>
                          <option>Sinhala</option>
                          <option>Tamil</option>
                          <option>Hindi</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label >Movie Status</label>
                          <select class="form-control" name="moviestatus" required>
                            <option>Coming Soon</option>
                            <option>Now Showing</option>
                            
                          </select>
                        </div>
                    <div class="form-group">
                      <label>Movie Genre</label>
                        <select class="form-control" name="moviegenre" required>
                          <option>Comedy</option>
                          <option>Thriller</option>
                          <option>Action</option>
                          <option>Mystery</option>
                          <option>Crime</option>
                          <option>Science</option>
                          <option>Romance</option>
                          <option>Horror</option>
                        </select>
                      </div>
                    <div class="form-group" >
                      <label > Movie Runtime </label>
                      <input type="time" class="form-control" name="movieruntime" placeholder="Movie Runtime" required>
                    </div>
                    <div class="form-group" >
                      <label>Movie Description </label>
                      <input type="text" class="form-control" name="moviedescription" placeholder="Movie Description" required>
                    </div>
                   
                     <div class="form-group" >
                                        <label>Trailer link</label>
                                        <input type="text" class="form-control" name="moviedtrailer" placeholder="Movie Trailer link" required>
                                    </div>
                    
                    <button type="submit" class="btn btn-primary ">Update</button>
                    <button type="submit" class="btn btn-primary " style="background-color:red;">Delete</button>
                    <button class="btn ">Cancel</button>
                  </form>
                </div>
              </div>
            </div>
            
            
        </div>
        
        
      </div>
    </div>
  </div>
  
 

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