<!DOCTYPE html>
<html>
  <head>
    <title> ABC Cinema</title>
    <link rel="stylesheet" type="text/css" href="log.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
      rel="stylesheet"
    />
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="images/film.png" />

    <style>
      #message {
        display:none;
        background: #f1f1f1;
        color: #000;
        position: relative ;
        padding: px;
        margin-top: 2px;
      }
      
      #message p {
        padding: px px;
        font-size: 15px;
        align-items: center ;
      }
      
      .valid {
        color: rgb(16, 24, 255);
      }
      
      .valid:before {
        position:relative ;
        left: -35px;
        content: "✔";
      }
      
      .invalid {
        color: red;
      }
      
      .invalid:before {
        position: relative;
        left: -35px;
        content: "✖";
      }
      
      
      </style>

  </head>
<body>
    <img class="wave" src="images/film.png" />
    <div class="container">
      <div class="img"></div>
      <div class="login-content">
    <form id="contact" method="post" action="index.html">
        
        <h2 class="title">Admin Login </h2>
        <div class="input-div one">
            <div class="i">
              <i class="fas fa-user"></i>
            </div>
            <div class="div">
            
            <input type="email"  class="input" id="contact_name" name="name" placeholder="Email" required></input>
            
        </div>
    </div>
        <div class="input-div pass">
            <div class="i">
              <i class="fas fa-lock"></i>
            </div>
            <div class="div">
            
            <input type="password" class="input" name="psw" id="psw" autocomplete="off" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
           			
        </div>
    </div>					
        
        <a href="forgot pass.html">Forgot Password</a>
        	
        <div class="my-3">
            
        <div id="contact_submit">				
            <a href="index.html"> <input  class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"  type="submit" onclick="validate()"></button></a>
        </div>
       
        </div>
    </form>

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