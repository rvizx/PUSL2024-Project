<!DOCTYPE html>
<html lang="en">

<head>
  
  
  <title>ABC Cinema</title>
  
  
  <link rel="stylesheet" href="css/style.css">
  <link href="table.css" rel="stylesheet">
  
  <link rel="shortcut icon" href="images/film.png" />

  
  <style>
    table.table th:nth-child(1) {
      width: 100px;
  }
  table.table th:nth-child(2) {
      width: 280px;
  }
  table.table th:nth-child(4) {
      width: 120px;
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
var ALERT_TITLE = "Alert";
var ALERT_BUTTON_TEXT = "Ok";

if(document.getElementById) {
    window.alert = function(txt) {
        createCustomAlert(txt);
    }
}

function createCustomAlert(txt) {
    d = document;

    if(d.getElementById("modalContainer")) return;

    mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
    mObj.id = "modalContainer";
    mObj.style.height = d.documentElement.scrollHeight + "px";

    alertObj = mObj.appendChild(d.createElement("div"));
    alertObj.id = "alertBox";
    if(d.all && !window.opera) alertObj.style.top = document.documentElement.scrollTop + "px";
    alertObj.style.left = (d.documentElement.scrollWidth - alertObj.offsetWidth)/2 + "px";
    alertObj.style.visiblity="visible";

    h1 = alertObj.appendChild(d.createElement("h1"));
    h1.appendChild(d.createTextNode(ALERT_TITLE));

    msg = alertObj.appendChild(d.createElement("p"));
    msg.innerHTML = txt;

    btn = alertObj.appendChild(d.createElement("a"));
    btn.id = "closeBtn";
    btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
    btn.href = "#";
    btn.focus();
    btn.onclick = function() { removeCustomAlert();return false; }

    alertObj.style.display = "block";

}

function removeCustomAlert() {
    document.getElementsByTagName("body")[0].removeChild(document.getElementById("modalContainer"));
}
function showConfirmBox() {
  document.getElementById("confirm-box").hidden = false;
}

function confirm(data) {
  if (data === "yes") {
    console.log(" user clicked yes");
  } else {
    console.log("user clicked No");
  }
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script>
            function functionConfirm(msg, myYes, myNo) {
                var confirmBox = $("#confirm");
                confirmBox.find(".message").text(msg);
                confirmBox.find(".yes,.no").unbind().click(function() {
                        confirmBox.hide();
                            });
                        confirmBox.find(".yes").click(myYes);
                        confirmBox.find(".no").click(myNo);
                        confirmBox.show();
            }
        </script>
        <style>
            #confirm {
                display: none;
                background-color: white;
                border: 1px solid rgb(189, 143, 28);
                position:fixed;
                width: 200px;
                height: 100px;
                left: 55%;
                margin-left: -100px;
                padding: 8px;
                box-sizing: border-box;
                text-align: center;
            }
        #confirm button {
            background-color: rgb(189, 143, 28);
            display: inline-block;
            border-radius: 5px;
            border: 1px solid white;
            padding: 5px;
            text-align: center;
            width: 80px;
            cursor: pointer;
            margin-top: 20px;
        }
        #confirm .message {
            text-align: center;
        }
        </style>
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
        
        
        
       <li class="nav-item">
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
        <li class="nav-item active">
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
    <div class="navbar-menu-wrapper  ">
      
      <div class="navbar-brand-wrapper ">
        <a class="navbar-brand brand-logo" href="index.html"><img src="images/abc logo.png" alt="logo"/></a>
        
      </div>
      
            
      
    </div>
    
      
      
        
  </nav>
      <div id="confirm">
        <div class="message"></div>
        <button class="yes">Yes</button>
        <button class="no">No</button>
    </div>
    <div class="main-panel">        
      <div class="content-wrapper">
        <div class="row">
          
          
          </div>
         
          
          <div class="container-lg">
            <div class="table table-responsive">
              
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                              <div class="col-sm-8"><h2>Customer <b> Feedback</b></h2></div>
                             
                          </div>
                      </div>
                      
                      <table class="table table-bordered">
                          <thead>
                              <tr>
                                  <th>Customer ID</th>
                                  
                                  
                                  <th>Feedback</th>
                                  <th>Admin Comment</th>
                                  
                                  <th>Complete</th>
                                  
                                 
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td>100</td>
                                  
                                 
                                  <td>sadfghjksdfret wertyu wertyu wertyu werty awerty</td>
                                  <td>
                                  </td>
                                  <td>
                                    <input type="button" value = "✔" onclick='functionConfirm("Done?", function yes() {
                                    
                                    },
                                    function no() {
                                    
                                    });'></button>
                                    
                                  
                                  </td>
                                 
                                 
                                   
</td>
                                 
                              </tr>
                              
                                    
                          </tbody>
                      </table>
                      <div id="confirm-box" hidden>
      <h3>Confirmation</h3>
      
      <button onclick="confirm('yes')">Yes</button>
      <button onclick="confirm('no')">No</button>
    </div>
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