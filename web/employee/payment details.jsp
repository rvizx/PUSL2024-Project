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

  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <Style>
  table.table th:last-child {
    width: 150px;
  }
  </Style>
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
                border: 1px solid #106eea;
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
            background-color: #106eea;
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
          <a class="nav-link"   >
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
        <li class="nav-item">
          <a class="nav-link" href="user.html">
            <i class="mdi mdi mdi-account-plus menu-icon"></i>
            <span class="menu-title"> Customer Details</span>
          </a>
        </li>
        
        
        
       <li class="nav-item active">
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
      <div id="confirm">
        <div class="message"></div>
        <button class="yes">Yes</button>
        <button class="no">No</button>
    </div>
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">
            
            
            </div>
            <div class="col-12 grid-margin stretch-card">
              
            </div>
            
            <div class="container-lg">
              <div class="table-responsive">
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
                                  
                                  <th>Seat no</th>
                                  <th>Movie Name</th>
                                  <th>Price</th>
                                  
                                 
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td>200</td>
                                  <td>4500</td>
                                  <td>2023-01-09</td>
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
 
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
 
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  
  <script src="../../js/file-upload.js"></script>
</body>

</html>