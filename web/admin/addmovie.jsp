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
                
                String redmsg = "Please Login to your Employee account to continue!";
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
                    min-height: calc(130vh - 65px);
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

            <nav class="sidebar sid">
                <ul class="nav">


                    <center><img src="/admin/images/kindpng_2267500.png" height="60" width="60" class="mt-10"></center>

                    </li><br>
                    <li class="nav-item " >
                        <a class="nav-link" href="/admin/adindex.jsp">
                            Dashboard

                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"   >
                            Movies 

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item active"> <a class="nav-link" href="/admin/addmovie.jsp">Add Movies</a></li>
                                    <li class="nav-item "> <a class="nav-link" href="/admin/managemovie.jsp">Manage Movies</a></li>
                                <li class="nav-item"> <a class="nav-link" href="/admin/moviedetails.jsp">Movie Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/customerdetail.jsp">

                            Customer Details
                        </a>
                    </li>



                    <li class="nav-item">
                        <a class="nav-link" href="/admin/paymentdetails.jsp">

                            Payment Details
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"   >

                            Employees

                        </a>
                        <div  >
                            <ul class="nav  sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="/admin/addemployee.jsp">Add Employee</a></li>
                                 <li class="nav-item"> <a class="nav-link" href="/admin/empmanage.jsp">Manage Employee</a></li>
                                <li class="nav-item"> <a class="nav-link" href="/admin/staffdetails.jsp">Employee Details</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/show.jsp">

                            Manage Shows
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="/admin/booking.jsp">

                            Booking Details
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="/admin/apfeedback.jsp">

                            Approve Feedback
                        </a>
                    </li>
                    <li class="nav-item">
                        <form method="post" action="/empLogoutServlet">
                        <input type="submit"
                               class="inline-block w-full px-10 py-3 bg-gray-700 text-white text-center font-medium text-m leading-tight uppercase  shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out uppercase"
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
                                <p>${message}</p>
                                <h4 class="card-title mb-8 font-bold uppercase text-xl">Movie details</h4>

                                <form class="forms-sample" id="contact" method="post" enctype="multipart/form-data" action="/addmovie">
<%
                                            String id = request.getParameter("userId");
                                            String driverName = "com.mysql.jdbc.Driver";
                                            String connectionUrl = "jdbc:mysql://localhost:3306/";
                                            String dbName = "abc_cinema";
                                            String userId = "root";
                                            String password = "";

                                            try {
                                                Class.forName(driverName);
                                            } catch (ClassNotFoundException e) {
                                                e.printStackTrace();
                                            }

                                            Connection connection = null;
                                            Statement statement = null;
                                            ResultSet resultSet = null;
                                        %>
                                        <div class="form-group">
                                        <label >Movie ID</label>
                                        <select class="form-control" name="movie" required>
                                            <option value="0">Select an ID </option>
                                            <%
                                                try {
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM movie";
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                                            %>

                                            <option value="<%=resultSet.getString("m_id")%>"><%=resultSet.getString("m_id")%></option>

                                            <%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </select>
                                        </div>
                                    <div class="form-group" >
                                        <label>Movie Name</label>
                                        <input type="text" class="form-control" name="moviename" placeholder="Name" required>
                                    </div>

                                    <div class="form-group">
                                        <label >Movie Language</label>
                                        <select class="form-control" name="movielanguage" required>
                                            <option value="English" >English</option>
                                            <option value="Sinhala" >Sinhala</option>
                                            <option value="Tamil" >Tamil</option>
                                            <option value="Hindi" >Hindi</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label >Movie Status</label>
                                        <select class="form-control" name="moviestatus" required>
                                            <option value="0">Coming Soon</option>
                                            <option value="1">Now Showing</option>

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Movie Genre</label>
                                        <select class="form-control" name="moviegenre" required>
                                            <option value="Comedy">Comedy</option>
                                            <option value="Adventure">Adventure</option>
                                            <option value="Thriller">Thriller</option>
                                            <option value="Action">Action</option>
                                            <option value="Mystery">Mystery</option>
                                            <option value="Crime">Crime</option>
                                            <option value="Sci-fi">Sci-fi</option>
                                            <option value="Romance">Romance</option>
                                            <option value="Horror">Horror</option>
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