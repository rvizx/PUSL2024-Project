<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter;"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
<%
            HttpSession empsession = request.getSession(false);
            String sessionmail=(String)empsession.getAttribute("email");
            String Admin="A-";
            
            
            
            
            if (sessionmail == null || !sessionmail.substring(0, 2).equals(Admin)) {
                
                String redmsg = "Please Login to your Admin account to continue!";
                request.setAttribute("message", redmsg);
                request.getRequestDispatcher("/emplogin.jsp").forward(request, response);
                response.sendRedirect("/emplogin.jsp");
            } 
        %>
        <title>ABC Cinema</title>

        <link rel="stylesheet" href="/admin/css/style.css">
        <link href="/admin/table.css" rel="stylesheet">
        <link rel="shortcut icon" href="/admin/images/film.png" />
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.css" rel="stylesheet" />


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
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                var actions = $("table td:last-child").jsp();
                $(".add-new").click(function () {
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
                $(document).on("click", ".add", function () {
                    var empty = false;
                    var input = $(this).parents("tr").find('input[type="text"]');
                    input.each(function () {
                        if (!$(this).val()) {
                            $(this).addClass("error");
                            empty = true;
                        } else {
                            $(this).removeClass("error");
                        }
                    });
                    $(this).parents("tr").find(".error").first().focus();
                    if (!empty) {
                        input.each(function () {
                            $(this).parent("td").jsp($(this).val());
                        });
                        $(this).parents("tr").find(".add, .edit").toggle();
                        $(".add-new").removeAttr("disabled");
                    }
                });
                // Edit row on edit button click
                $(document).on("click", ".edit", function () {
                    $(this).parents("tr").find("td:not(:last-child)").each(function () {
                        $(this).jsp('<input type="text" class="form-control" value="' + $(this).text() + '">');
                    });
                    $(this).parents("tr").find(".add, .edit").toggle();
                    $(".add-new").attr("disabled", "disabled");
                });
                // Delete row on delete button click
                $(document).on("click", ".delete", function () {
                    $(this).parents("tr").remove();
                    $(".add-new").removeAttr("disabled");
                });
            });
        </script>
    </head>
    <body>
        
        <div class=" divide">

            <nav class="sidebar sid ">
                <ul class="nav">


                    <center><img src="/admin/images/kindpng_2267500.png" height="60" width="60" class="mt-10"></center>

                    </li><br>
                    <li class="nav-item " >
                        <a class="nav-link uppercase font-bold" href="/admin/adindex.jsp">
                            Admin Dashboard

                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold"   >
                            Movies 

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item "> <a class="nav-link uppercase font-bold" href="addmovie.jsp">Add Movies</a></li>

                                <li class="nav-item active"> <a class="nav-link uppercase font-bold" href="/admin/managemovies.jsp">Manage Movies</a></li>
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/moviedetails.jsp">Movie Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold" href="/admin/customerdetail.jsp">

                            Customer Details
                        </a>
                    </li>



                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold" href="/admin/paymentdetails.jsp">

                            Payment Details
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold"   >

                            Employees

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/addemployee.jsp">Add Employee</a></li>
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/empmanage.jsp">Manage Employee</a></li>
                                <li class="nav-item"> <a class="nav-link uppercase font-bold" href="/admin/stffdetails.jsp">Employee Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link uppercase font-bold" href="/admin/show.jsp">

                            Manage Shows
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link uppercase font-bold" href="/admin/booking.jsp">

                            Booking Details
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link uppercase font-bold" href="/admin/apfeedback.jsp">

                            Approve Feedback
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
                

               <nav class="navbar">
                    <div class="navbar-menu-wrapper ">

                        <div class="navbar-brand-wrapper ">
                            <a class="navbar-brand brand-logo" href="/admin/adindex.jsp"><img src="/admin/images/abc_logo.png" class="mt-5 px-10" alt="logo"/></a>

                        </div>



                    </div>




                </nav>
         
                <br>
                <div class="main-panel mt-10">        
                    <div class="content-wrapper">
                        <div class="row">


                        </div>
                       
                        <h4 class="card-title mb-8 font-bold uppercase text-xl">Search Movie Details</h4>

                        <form class="forms-sample" id="contact" method="post" action="/managemovie">

                            <div class="form-group " >
                                <label >Movie ID </label>
                                <input  type="text" class=""  name="movieID" placeholder="Enter Movie ID" required>
                                <button type="submit" class=" btn-primary bg-black px-10 py-2.5">Search</button>

                        </form>

                    </div>
                </div>
            </div>

                 
                 

            <%  String mid = (String) request.getAttribute("MID");
                String driverName = "com.mysql.jdbc.Driver";

                try {
                    Class.forName(driverName);

                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/abc_cinema", "pmauser", "123NxUok4IL4pW9GvkJF8gO1C6MyRFed");
                    st = con.createStatement();

                    PreparedStatement ps = con.prepareStatement("SELECT * FROM movie WHERE m_id=?");
                    ps.setString(1, mid);
                    ResultSet rs = ps.executeQuery();

            %>
            
            

            <div class="card">
                <div class="card-body">
                    <form class="forms-sample" id="contact" method="post">

                        <% 
                            
                            while (rs.next()) {

                        %>
                        <div class="form-group" >
                            <label >Movie ID- ${mid} </label>
                            
                        </div>
                        <div class="form-group" >
                            <label >Movie Name </label>
                            <input type="text" value="<%=rs.getString("m_name")%>" class="form-control" name="moviename" placeholder="Name" required>
                        </div>

                        <div class="form-group ">
                            <label >Movie Language</label>
                            <input type="text" value="<%=rs.getString("m_language")%>" class="form-control" name="moviename" placeholder="Name" required>
                        </div>
                        <div class="form-group">
                            <label >Movie Status (1 - Now Showing, 0 - Coming soon)</label>
                            <input type="text" value="<%=rs.getString("m_status")%>" class="form-control" name="moviename" placeholder="Name" required>
                        </div>
                        <div class="form-group">
                            <label>Movie Genre</label>
                            <input type="text" value="<%=rs.getString("genre")%>" class="form-control" name="moviename" placeholder="Name" required>
                        </div>
                        <div class="form-group" >
                            <label > Movie Runtime </label>
                            <input type="time" class="form-control" value="<%=rs.getString("runtime")%>" name="movieruntime" placeholder="Movie Runtime" required>
                        </div>
                        <div class="form-group" >
                            <label>Movie Description </label>
                            <input type="text" class="form-control" value="<%=rs.getString("description")%>" name="moviedescription" placeholder="Movie Description" required>
                        </div>

                        <div class="form-group" >
                            <label>Trailer link</label>
                            <input type="text" class="form-control" value="<%=rs.getString("trailer_link")%>" name="moviedtrailer" placeholder="Movie Trailer link" required>
                        </div>

                        <button type="submit" class="btn btn-primary bg-black">Update</button>
                        <button type="submit" class="btn btn-primary " style="background-color:red;">Delete</button>
                        <button class="btn ">Cancel</button>
                        <%

                                }

                            } catch (ClassNotFoundException e) {
                                e.printStackTrace();
                            }


                        %>
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

            myInput.onfocus = function () {
                document.getElementById("message").style.display = "block";
            }

            myInput.onblur = function () {
                document.getElementById("message").style.display = "none";
            }

            myInput.onkeyup = function () {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (myInput.value.match(lowerCaseLetters)) {
                    letter.classList.remove("invalid");
                    letter.classList.add("valid");
                } else {
                    letter.classList.remove("valid");
                    letter.classList.add("invalid");
                }

                // Validate capital letters
                var upperCaseLetters = /[A-Z]/g;
                if (myInput.value.match(upperCaseLetters)) {
                    capital.classList.remove("invalid");
                    capital.classList.add("valid");
                } else {
                    capital.classList.remove("valid");
                    capital.classList.add("invalid");
                }


                // Validate length
                if (myInput.value.length >= 8) {
                    length.classList.remove("invalid");
                    length.classList.add("valid");
                } else {
                    length.classList.remove("valid");
                    length.classList.add("invalid");
                }
            }
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.2/flowbite.min.js"></script>
</body>

</html>