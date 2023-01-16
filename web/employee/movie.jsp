<!DOCTYPE html>
<html lang="en">

<head>
 <%
            HttpSession empsession = request.getSession(false);
            String sessionmail = (String) empsession.getAttribute("email");
            String Admin = "E-";

            if (sessionmail == null || !sessionmail.substring(0, 2).equals(Admin)) {
                
                String redmsg = "Please Login to your Employee account to continue!";
                request.setAttribute("message", redmsg);
                request.getRequestDispatcher("/emplogin.jsp").forward(request, response);

                response.sendRedirect("/emplogin.jsp");
                
                
            }
        %>

  <title>ABC Cinema</title>
 
  <link rel="stylesheet" href="css/style.css">
  <link href="table.css" rel="stylesheet">
  <link rel="shortcut icon" href="images/film.png" />
  <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.css" rel="stylesheet" />

  
  
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  
  
  <style>
@media screen and (min-width: 1000px) {
  .sid {
  min-height: calc(170vh - 65px);
}
}

  </style>
  
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
  <div class=" divide">
    
    <nav class="sidebar sid "  >
      <ul class="nav">
        
          
          <center><img src="images/kindpng_2267500.png" height="60" width="60" class="mt-10"></center>
          
        </li><br>
        <li class="nav-item " >
          <a class="nav-link uppercase font-bold" href="sfindex.jsp">
            Employee Dashboard
            
          </a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link uppercase font-bold"   >
            Movies 
            
          </a>
          <div  >
            <ul class="nav  sub-menu">
              <li class="nav-item active"> <a class="nav-link uppercase font-bold" href="movie.jsp">Add Movies</a></li>
              <li class="nav-item"> <a class="nav-link uppercase font-bold" href="managemovie.jsp">Manage Movies</a></li>
              <li class="nav-item"> <a class="nav-link uppercase font-bold" href="movie details.jsp">Movie Details</a></li>
            </ul>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link uppercase font-bold" href="user.jsp">
            
             Customer Details
          </a>
        </li>
        
        
        
       <li class="nav-item">
          <a class="nav-link uppercase font-bold" href="paymentdetails.jsp">
            
             Payment Details
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link uppercase font-bold" href="show.jsp">
            
            Manage Shows
          </a>
        </li>
        <li class="nav-item ">
          <a class="nav-link uppercase font-bold" href="booking.jsp">
           
            Booking Details
          </a>
        </li>
      
        <li class="nav-item">
                        <form method="post" action="/empLogoutServlet">
                        <input type="submit"
                               class="inline-block w-full px-10 py-3 bg-gray-700 text-white text-center  text-m leading-tight uppercase font-bold  shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out uppercase"
                               value="logout"></form>
                    </li>
        
      </ul>
    </nav>

 <div class="container-fluid page-body-wrapper ">
 
  <nav class="navbar   ">
    <div class="navbar-menu-wrapper ">
      
      <div class="navbar-brand-wrapper ">
        <a class="navbar-brand brand-logo" href="/admin/adindex.jsp"><img src="/admin/images/abc_logo.png" class="mt-5 px-10" alt="logo"></a>
        
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
                  <h4 class="card-title mb-8 font-bold uppercase text-xl">Movie details</h4>
                  
                  <form class="forms-sample" id="contact" method="post" action="">
                    
                    <div class="form-group" >
                      <label >Movie Name </label>
                      <input type="text" class="form-control" name="moviename" placeholder="Name" required>
                    </div>
                    
                    <div class="form-group">
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
                    <div class="form-group">
                      <label>File upload</label>
                      <input type="file" name="img[]" class="file-upload-default">
                      <div class="form-group ">
                                        <label >File upload</label>
                                        <input type="file"  name="img" class=""> <!-- file-upload-default -->
                                        <div class="input-group col-xs-12">
                                        </div>
                                    </div>


                                    <button type="submit" class="btn btn-primary bg-black ">Add Movie</button>
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