<%--
    Document   : date_time2
    Created on : 16-Jan-2023, 04:17:41
    Author     : sanid
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!doctype html>
<html>
    <%
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

        HashMap<String, Object> info = (HashMap<String, Object>) session.getAttribute("info");
        String m_id = (String) info.get("m_id");

        try {
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql = "SELECT * FROM movie WHERE m_id=" + m_id;
            resultSet = statement.executeQuery(sql);
            resultSet.next();
            String m_name = resultSet.getString("m_name");


    %>

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
                        <a href="/contactus.jsp"
                           class="text-xl text-white font-[Inter] hover:text-[#DAA520] duration-500">FEEDBACK</a>
                    </li>

                    <li class="mx-6 my-6 md:my-0">
                        <div class="flex justify-center">
                            <div class="w-96">
                                <div class="input-group relative flex flex-wrap items-stretch w-full ">
                                    <input type="search"
                                           class="form-control rounded relative uppercase flex-auto min-w-0 block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300  transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                           placeholder="Search" aria-label="Search" aria-describedby="button-addon2">
                                    <button
                                        class="btn inline-block rounded px-6 py-2.5 bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase  shadow-md hover:bg-[#F6C74E] hover:shadow-lg focus:bg-[#F6C74E]  focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#F6C74E] active:shadow-lg transition duration-150 ease-in-out flex items-center"
                                        type="button" id="button-addon2">
                                        <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="search"
                                             class="w-4" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <path fill="currentColor"
                                              d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z">
                                        </path>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>

            </nav>



            <br><br>
            <Section class="">
                <div
                    class="flex items-center my-4 before:flex-1 before:border-t before:border-gray-300 before:mt-0.5 after:flex-1 after:border-t after:border-gray-300 after:mt-0.5">
                    <p class="text-3xl font-extrabold dark:text-white">SELECT DATE & TIME</p>
                </div>

            </Section><br>



            <%  connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                statement = connection.createStatement();
                String movieId = m_id;
                String sql2 = "SELECT * FROM shows WHERE m_id='" + movieId + "'";
                resultSet = statement.executeQuery(sql2);

            %>


            <div class="grid grid-cols-2 ">
                <div>
                    <div class="items-center justify-center px-12">
                        <h1 class="text-white text-5xl font-bold"><%=m_name%></h1><br>
                        <div class="flex flex-row items-center pb-5 ">
                            <ion-icon name="location"></ion-icon>
                            <h1 class="text-white text-xl font-bold uppercase">Havelock City Mall - Havelock</h1>
                        </div><br>
                        <div>


                            <h2 class="text-white text-xl font-bold mb-3">SELECT DATE</h2>
                            <div class="flex items-center  mb-3">
                                <div class="flex justify-center">
                                    <label for="countries" class="block mb-2 text-sm font-medium text-white pr-3 "><ion-icon
                                            name="calendar" size="large"></ion-icon></label>
                                    <div class="mb-3 xl:w-96">
                                        <form name="datetime" method="post" action="/date_time">
                                            <select class="form-select appearance-none
                                                    block
                                                    w-full
                                                    px-3
                                                    py-2
                                                    text-base
                                                    rounded
                                                    font-normal
                                                    text-gray-700
                                                    bg-white bg-clip-padding bg-no-repeat
                                                    border border-solid border-gray-300

                                                    transition
                                                    ease-in-out
                                                    m-0
                                                    focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                                    aria-label="Default select example" name="date">
                                                <%

                                                    while (resultSet.next()) {
                                                        // 2023:02:14 20:30:00
                                                        String datetime = resultSet.getString("date_time");
                                                        String inputdate = datetime.substring(0, 10);
                                                        String time = datetime.substring(12, 19);
                                                        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
                                                        SimpleDateFormat outputFormat = new SimpleDateFormat("MMM dd EEE");
                                                        Date date = inputFormat.parse(inputdate);
                                                        String outputDate = outputFormat.format(date);

                                                %>

                                                <option value="<%=inputdate%>"><%=outputDate%></option>

                                                <%}%>

                                            </select>
                                    </div>
                                </div>
                            </div>
                        </div><br>
                        <div>
                            <h2 class="text-white text-xl font-bold mb-3">SELECT TIME</h2>
                            <div class="flex items-center  mb-3">
                                <div class="flex justify-center">
                                    <label for="countries" class="block mb-2 text-sm font-medium text-white pr-3 "><ion-icon
                                            name="time" size="large"></ion-icon></label>
                                    <div class="mb-3 xl:w-96">
                                        <select class="form-select appearance-none
                                                block
                                                w-full
                                                px-3
                                                py-2
                                                text-base
                                                rounded
                                                font-normal
                                                text-gray-700
                                                bg-white bg-clip-padding bg-no-repeat
                                                border border-solid border-gray-300

                                                transition
                                                ease-in-out
                                                m-0
                                                focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                                aria-label="Default select example" name="time">




                                            <option  value="10:30">10:30 AM</option>
                                            <option  value="13:00">01:00 PM</option>
                                            <option  value="18:30">06:30 PM</option>
                                            <option  value="09:00">09:00 PM</option>


                                            <script>
                                                function updateValue() {
                                                    var select = document.getElementById("mySelect");
                                                    var selectedValue = select.options[select.selectedIndex].value;
                                                    console.log(selectedValue);
                                                }
                                            </script>

                                        </select>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <input type="submit"
                               class="inline-block mt-5 px-10 py-4 bg-gray-700 text-white font-medium text-m leading-tight uppercase rounded shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out uppercase"
                               value="next">
                        </form>
                    </div>

                </div>
                <div class="px-12">
                    <img class="h-auto max-w-full" src="/assets/images/card_<%=m_id%>.png" alt="image description">
                </div>


            </div>


            <%

                } catch (Exception e) {
                }
            %>








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
                            <a href="privancy.jsp" class="mr-4 hover:underline md:mr-6 ">PRIVACY POLICY</a>
                        </li>
                        <li>
                            <a href="term.jsp" class="mr-4 hover:underline md:mr-6">TERMS & CONDITIONS</a>
                        </li>
                        <li>
                            <a href="feedback.jsp" class="mr-4 hover:underline md:mr-6 ">FEEDBACK</a>
                        </li>
                        <li>
                            <a href="emplogin.jsp" class="hover:underline">STAFF</a>
                        </li>
                    </ul>
                </div>
                <hr class="my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8" />
                <span class="block text-sm text-gray-500 sm:text-center dark:text-gray-400"><a href="#"
                        class="hover:underline"></a>COPYRIGHT © 2022 ABC CINEMA.ALL RIGHTS RESERVED.
                </span>
            </footer>

        </div>












        <script>
            function Menu(e) {
                let list = document.querySelector('ul');
                e.name === 'grid' ? (e.name = "close", list.classList.add('top-[80px]'), list.classList.add('opacity-100'))
                        : (e.name = "grid", list.classList.remove('top-[80px]'), list.classList.remove(opacity - 100))
            }
        </script>
        <script src="https://unpkg.com/flowbite@1.6.0/dist/flowbite.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/tw-elements/dist/js/index.min.js"></script>
    </body>

</html>
