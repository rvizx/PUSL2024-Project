<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>

<%
                                        String driverName = "com.mysql.jdbc.Driver";
                                        String connectionUrl = "jdbc:mysql://localhost:3306/";
                                        String dbName = "abc_cinema";
                                        String userId = "pmauser";
                                        String password = "123NxUok4IL4pW9GvkJF8gO1C6MyRFed";

                                        try {
                                            Class.forName(driverName);
                                        } catch (ClassNotFoundException e) {
                                            e.printStackTrace();
                                        }

                                        
%>

<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tw-elements/dist/css/index.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/flowbite@1.6.0/dist/flowbite.min.css" />
    <link href="/assets/css/style.css" rel="stylesheet">
</head>

<body class=" bg-black">
    <div class="md:container md:mx-auto">


        <!--Nav Bar-->
        <nav class="p-5 bg-black shadow md:flex md:items-center md:justify-between">
            <div class="flex justify-between item-center">
                <span class="cursor-pointer">
                    <a href="index.jsp">
                        <img class="h-10 inline" src="/assets/images/abc_cinema_logo.png" alt="">
                    </a>
                </span>
                <span class="text-3xl cursor-pointer mx-2 md:hidden block">
                    <ion-icon name="grid" onclick="Menu(this)"></ion-icon>
                </span>

            </div>
            <ul class="md:flex md:items-center z-[-1] md:z-auto md:static absolute bg-black w-full left-0 md:w-auto md:py-0 py-6 md:pl-0 pl-7
    md:opacity-100 opacity-100 top-[-400px] transition-all ease-in duration-500">
                <li class="mx-6 my-6 md:my-0">
                    <a href="/index.jsp"
                        class="text-xl text-white font-[Inter] hover:text-[#DAA520] duration-500">HOME</a>
                </li>
                <li class="mx-6 my-6 md:my-0">
                    <a href="/movies.jsp"
                        class="text-xl text-white font-[Inter] hover:text-[#DAA520] duration-500">MOVIES</a>
                </li>
                <li class="mx-6 my-6 md:my-0">
                    <a href="/feedback.jsp"
                        class="text-xl text-white font-[Inter] hover:text-[#DAA520] duration-500">FEEDBACK</a>
                </li>

                <li class="mx-6 my-6 md:my-0">
                    <div class="search">
                        <input type="search" placeholder="SEARCH HERE">
                        <span>
                            <ion-icon name="search"></ion-icon>
                        </span>
                    </div>
                </li>
            </ul>

        </nav>

        <br>


        <section>

            <div
                class="flex items-center my-4 before:flex-1 before:border-t before:border-gray-300 before:mt-0.5 after:flex-1 after:border-t after:border-gray-300 after:mt-0.5">
                <p class="text-3xl font-extrabold dark:text-white">SELECT SEATS</p>
            </div>
            <br><br>


            <div class="grid grid-cols-5 items-center">
                <div>

                    <h1 class="text-5xl font-extrabold dark:text-white">Black Adam</h1>
                    <div class="flex flex-row items-center  ">
                        <ion-icon name="location"></ion-icon>
                        <h1 class="text-gray-200 text-xl font-bold">Havelock City Mall</h1>
                        
                    </div>
                    <h1 class="text-gray-200 text-m font-bold">2D CLASS</h1>

                    <div class="inline-flex rounded-md shadow-sm">
                        <a href="#" aria-current="page"
                        class="px-4 py-2 text-sm font-medium text-gray-900 bg-gray-700 dark:text-white dark:hover:text-white dark:hover:bg-gray-700  dark:focus:text-white">
                            JAN 10 THU
                        </a>
                        <a href="#"
                            class="px-4 py-2 text-sm font-medium text-gray-900 bg-[#DAA520] dark:text-white dark:hover:text-white dark:hover:bg-[#DAA520] dark:focus:text-white">
                            01.00PM
                        </a>
                    </div>

                </div>
                <div>

                </div>



                <div>
                    <div class="px-5 text-xl font-bold">
                        <h1 class="text-white">No. Of Tickets</h1>
                    </div>
                    <div class="flex justify-center">

                        <div class="mb-3 xl:w-96">
                            <select id="full-tickets" class="form-select appearance-none
                    block
                    w-56
                    px-3
                    py-1.5
                    rounded
                    text-base
                    font-normal
                    text-gray-700
                    bg-white bg-clip-padding bg-no-repeat
                    border border-solid border-gray-300
                    
                    transition
                    ease-in-out
                    m-0
                    focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                aria-label="Default select example">

                                <option selected>1</option>
                                <option value="1">2</option>
                                <option value="2">3</option>
                                <option value="3">4</option>
                                <option value="4">5</option>
                                <option value="5">6</option>
                                <option value="6">7</option>
                                <option value="7">8</option>
                                <option value="8">9</option>
                                <option value="9">10</option>
                            </select>
                        </div>
                    </div>

                </div>



                <div>
                    <div class="px-[80px] text-xl font-bold">
                        <h1 class="text-white">TOTAL</h1>
                    </div>
                    <div class="flex justify-center">
                        <div class="mb-3 xl:w-96">
                            <input type="text" class="
                              form-control
                              block
                              w-56
                              px-3
                              py-1.5
                              text-base
                              rounded
                              font-normal
                              text-gray-700
                              bg-white bg-clip-padding
                              border border-solid border-gray-300
                              transition
                              ease-in-out
                              m0-
                              focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none
                            " id="exampleFormControlInput1" />
                        </div>
                    </div>

                </div>
            </div>
            <br><br><br>



            <div class="lex items-center justify-center grid grid-cols-2">
                <div>
                    <div class="movie-container">
                        <label class="text-white">Pick a Movie</label>
                        <select id="movie">
                            <option value="10">Movie 1($10)</option>
                            <option value="12">Movie 2($12)</option>
                            <option value="8">Movie 3($8)</option>
                            <option value="9">Movie 4($9)</option>

                        </select>

                    </div>

                    <ul class="text-white showcase">
                        <li>
                            <div class="seat"></div>
                            <small class="text-white text-xl font-bold">Available</small>
                        </li>
                        <li>
                            <div class="seat selected"></div>
                            <small class="text-white text-xl font-bold">Selected</small>
                        </li>
                        <li>
                            <div class="seat reserved"></div>
                            <small class="text-white text-xl font-bold">Reserved</small>
                        </li>

                    </ul>

                    <div class="container">
                        <div class="screen"></div>                   
                        <div class="row px-20 m-5">
                            <%              try {                 
                                                    Connection connection = null;
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM seat WHERE seat_no LIKE '%A%'";                                                    
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                            %>
                            <div class="seat <%=resultSet.getString("seat_status")%> text-black text-2xl font-bold px-4 pt-1" onClick="getSeats('<%=resultSet.getString("seat_no")%>')"><%=resultSet.getString("seat_no")%></div>
                        <%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
            

%>
                        </div>
                        
                        <div class="row">
<%                          try {                 
                                                   Connection connection = null;
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM seat WHERE seat_no LIKE '%B%'";  
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                            %>

                            <div class="seat <%=resultSet.getString("seat_status")%> text-black text-l font-bold px-4 pt-2" onClick="getSeats('<%=resultSet.getString("seat_no")%>')"><%=resultSet.getString("seat_no")%></div>
                        <%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
            

%>
                        </div>
                        
                        <div class="row">
<%                          try {                 
                                                   Connection connection = null;
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM seat WHERE seat_no LIKE '%C%'";  
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                            %>
                            <div class="seat <%=resultSet.getString("seat_status")%> text-black text-l font-bold px-4 pt-2" onClick="getSeats('<%=resultSet.getString("seat_no")%>')"><%=resultSet.getString("seat_no")%></div>
                                                <%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
            

%>
                        </div>
                        
                        
                        
                        <div class="row">
                            <%                          try {                 
                                                   Connection connection = null;
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM seat WHERE seat_no LIKE '%D%'";  
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                            %>
                            <div class="seat <%=resultSet.getString("seat_status")%> text-black text-l font-bold px-4 pt-2" onClick="getSeats('<%=resultSet.getString("seat_no")%>')"><%=resultSet.getString("seat_no")%></div>
                                                                        <%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
            

%>
                        </div>
                        
                        
                        <div class="row">
                            <%                          try {                 
                                                   Connection connection = null;
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM seat WHERE seat_no LIKE '%E%'";  
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                            %>
                            <div class="seat <%=resultSet.getString("seat_status")%> text-black text-l font-bold px-4 pt-2" onClick="getSeats('<%=resultSet.getString("seat_no")%>')"><%=resultSet.getString("seat_no")%></div>
<%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
            

%>
                        </div>
                        
                        
                        <div class="row">
                            <%                          try {                 
                                                   Connection connection = null;
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM seat WHERE seat_no LIKE '%F%'";  
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                            %>
                            <div class="seat <%=resultSet.getString("seat_status")%> text-black text-l font-bold px-4 pt-2" onClick="getSeats('<%=resultSet.getString("seat_no")%>')"><%=resultSet.getString("seat_no")%></div>
<%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
            

%>
                        </div>
                        
                        
                        <div class="row">
                            <%                          try {                 
                                                    Connection connection = null;
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM seat WHERE seat_no LIKE '%G%'";  
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                            %>
                            <div class="seat <%=resultSet.getString("seat_status")%> text-black text-l font-bold px-4 pt-2" onClick="getSeats('<%=resultSet.getString("seat_no")%>')"><%=resultSet.getString("seat_no")%></div>
    <%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
            

%>
                        </div>
                        
                        
                        <div class="row">
                            <%                          try {                 
                                                   Connection connection = null;
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM seat WHERE seat_no LIKE '%H%'";  
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                            %>
                            <div class="seat <%=resultSet.getString("seat_status")%> text-black text-l font-bold px-4 pt-2" onClick="getSeats('<%=resultSet.getString("seat_no")%>')"><%=resultSet.getString("seat_no")%></div>
<%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
            

%>
                        </div>
                        
                        
                        <div class="row">
                            <%                          try {                 
                                                   Connection connection = null;
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM seat WHERE seat_no LIKE '%I%'";  
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                            %>
                            <div class="seat <%=resultSet.getString("seat_status")%> text-black text-l font-bold px-4 pt-2" onClick="getSeats('<%=resultSet.getString("seat_no")%>')"><%=resultSet.getString("seat_no")%></div>
  <%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
            

%>
                        </div>
                        
                        
                        <div class="row">
                            <%                          try {                 
                                                   Connection connection = null;
                                                    Statement statement = null;
                                                    ResultSet resultSet = null;
                                                    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                                                    statement = connection.createStatement();
                                                    String sql = "SELECT * FROM seat WHERE seat_no LIKE '%J%'";  
                                                    resultSet = statement.executeQuery(sql);
                                                    while (resultSet.next()) {
                            %>
                            <div class="seat <%=resultSet.getString("seat_status")%> text-black text-l font-bold px-4 pt-2" onClick="getSeats('<%=resultSet.getString("seat_no")%>')"><%=resultSet.getString("seat_no")%></div>
 <%
                                                    }

                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
            

%>
                        </div>

                    </div>



                </div>

                <div class="m-20">
                    <div class="flex flex-row items-center justify-center ">

                        <h1 class="text-white text-2xl font-bold">You have selected <button type="button"
                                class="inline-flex items-center px-5 py-1 text-l font-medium text-center text-white bg-[#DAA520] rounded-lg hover:bg-[#DAA520] ">
                                <span id="count">0</span>
                            </button> Ticket(s).

                            <br><br> Seats for a price of $<span id="total">0</span>
                        </h1>
                    </div><br>
                    <div class="flex flex-row items-center justify-center ">

                        <div class="flex items-center  mb-3 ">
                            <div class="">
                                <a href="/bookingpg1.jsp">
                                    <button type="button"
                                        class="px-10 py-3 m-4 text-base font-medium text-center text-white bg-[#545454] rounded-lg hover:bg-[#747474] dark:bg-[#545454] dark:hover:bg-[#747474] ">BACK</button>
                                </a>
                                <a href="/bookingpayment.jsp">
                                    <button type="button" onclick="sendSelectedSeats()"
                                        class="px-10 py-3 text-base font-medium text-center text-white bg-[#DAA520] rounded-lg hover:bg-[#F6C74E]  dark:bg-[#DAA520] dark:hover:bg-[#F6C74E] ">CONTINUE</button>
                                </a>

                            </div>
                        </div>
                    </div><br>


                    < </p>

                </div>

            </div>






        </section>










        <!--Footer-->
        <br><br><br>

        <footer class="p-4 bg-black  shadow md:px-6 md:py-8 ">
            <div class="sm:flex sm:items-center sm:justify-between">
                <a href="index.jsp" class="flex items-center mb-4 sm:mb-0">
                    <img src="/assets/images/abc_cinema_logo.png" class="h-8 mr-3" alt="Flowbite Logo" />
                    <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white"></span>
                </a>
                <ul class="flex flex-wrap items-center mb-6 text-sm text-gray-500 sm:mb-0 dark:text-gray-400">
                    <li>
                        <a href="#" class="mr-4 hover:underline md:mr-6 ">PRIVACY POLICY</a>
                    </li>
                    <li>
                        <a href="#" class="mr-4 hover:underline md:mr-6">TERMS & CONDITIONS</a>
                    </li>
                    <li>
                        <a href="#" class="mr-4 hover:underline md:mr-6 ">TERMS OF USE</a>
                    </li>
                    <li>
                        <a href="" class="hover:underline">CONTACT US</a>
                    </li>
                </ul>
            </div>
            <hr class="my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8" />
            <span class="block text-sm text-gray-500 sm:text-center dark:text-gray-400"><a href="#"
                    class="hover:underline"></a>COPYRIGHT Â© 2022 ABC CINEMA.ALL RIGHTS RESERVED.
            </span>
        </footer>




    </div>












    <script>
        function Menu(e) {
            let list = document.querySelector('ul');
            e.name === 'grid' ? (e.name = "close", list.classList.add('top-[80px]'), list.classList.add('opacity-100'))
                : (e.name = "grid", list.classList.remove('top-[80px]'), list.classList.remove(opacity - 100))
        }
        function getSeats(seat) {
        let seatIndex = selectedSeats.indexOf(seat);
        if(seatIndex !== -1) {
            selectedSeats.splice(seatIndex, 1);
        } else {
            selectedSeats.push(seat);
        }
            console.log(selectedSeats);  //remove this later
        }
    
        function sendSelectedSeats() {
        let halfTicketAmount = document.getElementById("half-tickets").value;
        let fullTicketAmount = document.getElementById("full-tickets").value;
        fetch('/bookseats', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({selectedSeats: selectedSeats, halfTicketAmount: halfTicketAmount, fullTicketAmount: fullTicketAmount})
        })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
            })
        .catch((error) => {
            console.error('Error:', error);
        });
    }
    </script>
    <script src="https://unpkg.com/flowbite@1.6.0/dist/flowbite.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/tw-elements/dist/js/index.min.js"></script>
    <script src="/assets/js/script.js"></script>
</body>

</html>