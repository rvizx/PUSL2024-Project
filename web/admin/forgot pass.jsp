<!DOCTYPE html>
<html>
  <head>
    <title>ABC Cinema</title>
    <link rel="stylesheet" type="text/css" href="log.css" />
    <link rel="shortcut icon" href="images/film.png" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
      rel="stylesheet"
    />
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
    <img class="wave" width="550" height="400" src="images/film.png" />
    <div class="container">
      <div class="img"></div>
      <div class="login-content">
        <form id="contact" method="post" action="index.html">
          <br><br><br>
          
          <h2 class="title">Forgot Password</h2>

          
    
<div class="input-div one">
  <div class="i">
    <i class="fas fa-user"></i>
  </div>
  <div class="div">
  
  <input type="int"  class="input" id="contact_name" name="mobile" placeholder="Mobile" required></input>
  
</div>
</div>
<div class="input-div one">
  <div class="i">
    <i class="fas fa-user"></i>
  </div>
  <div class="div">
  
  <input type="email" class="input" id="contact_email" name="email" placeholder="Email" required></input>
  
</div>
</div>


				
<div id="message">
  
<p id="letter"   class="invalid">A <b>lowercase</b> letter</p>
<p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>

<p id="length" class="invalid">Minimum <b>8 characters</b></p>
</div>


<div class="my-3">
  
<div id="contact_submit">				
  <a href="index.html"> <input  class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="Send Mail" type="submit" onclick="validate()"></button></a>
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
var lowerCaseLetters = /[a-z]/g;
if(myInput.value.match(lowerCaseLetters)) {  
letter.classList.remove("invalid");
letter.classList.add("valid");
} else {
letter.classList.remove("valid");
letter.classList.add("invalid");
}

var upperCaseLetters = /[A-Z]/g;
if(myInput.value.match(upperCaseLetters)) {  
capital.classList.remove("invalid");
capital.classList.add("valid");
} else {
capital.classList.remove("valid");
capital.classList.add("invalid");
}


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