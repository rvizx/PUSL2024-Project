<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html>


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



    <%              try {
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql = "SELECT * FROM movie WHERE m_id=1";
            resultSet = statement.executeQuery(sql);
            resultSet.next();
                String m_name1 = resultSet.getString("m_name");
                String m_language1 = resultSet.getString("m_language");
                String genre1 = resultSet.getString("genre");

                
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql2 = "SELECT * FROM movie WHERE m_id=2";
            resultSet = statement.executeQuery(sql2);
            resultSet.next();
                String m_name2 = resultSet.getString("m_name");
                String m_language2 = resultSet.getString("m_language");
                String genre2 = resultSet.getString("genre");
                
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql3 = "SELECT * FROM movie WHERE m_id=3";
            resultSet = statement.executeQuery(sql3);
            resultSet.next();
                String m_name3 = resultSet.getString("m_name");
                String m_language3 = resultSet.getString("m_language");
                String genre3 = resultSet.getString("genre");

            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql4 = "SELECT * FROM movie WHERE m_id=4";
            resultSet = statement.executeQuery(sql4);
            resultSet.next();
                String m_name4 = resultSet.getString("m_name");
                String m_language4 = resultSet.getString("m_language");
                String genre4 = resultSet.getString("genre");

            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql5 = "SELECT * FROM movie WHERE m_id=5";
            resultSet = statement.executeQuery(sql5);
            resultSet.next();
                String m_name5 = resultSet.getString("m_name");
                String m_language5 = resultSet.getString("m_language");
                String genre5 = resultSet.getString("genre");
                
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql6 = "SELECT * FROM movie WHERE m_id=6";
            resultSet = statement.executeQuery(sql6);
            resultSet.next();
                String m_name6 = resultSet.getString("m_name");
                String m_language6 = resultSet.getString("m_language");
                String genre6 = resultSet.getString("genre");

            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql7 = "SELECT * FROM movie WHERE m_id=7";
            resultSet = statement.executeQuery(sql7);
            resultSet.next();
                String m_name7 = resultSet.getString("m_name");
                String m_language7 = resultSet.getString("m_language");
                String genre7 = resultSet.getString("genre");
                
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql8 = "SELECT * FROM movie WHERE m_id=8";
            resultSet = statement.executeQuery(sql8);
            resultSet.next();
                String m_name8 = resultSet.getString("m_name");
                String m_language8 = resultSet.getString("m_language");
                String genre8 = resultSet.getString("genre");

            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql9 = "SELECT * FROM movie WHERE m_id=9";
            resultSet = statement.executeQuery(sql9);
            resultSet.next();
                String m_name9 = resultSet.getString("m_name");
                String m_language9 = resultSet.getString("m_language");
                String genre9 = resultSet.getString("genre");
                
            connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
            statement = connection.createStatement();
            String sql10 = "SELECT * FROM movie WHERE m_id=10";
            resultSet = statement.executeQuery(sql10);
            resultSet.next();
                String m_name10 = resultSet.getString("m_name");
                String m_language10 = resultSet.getString("m_language");
                String genre10 = resultSet.getString("genre");                

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
                        <img class="h-10 inline" src="/assets/images/ABC Cinema LOGO.png" alt="">
                    </a>
                </span>
                <span class="text-3xl cursor-pointer mx-2 md:hidden block">
                    <ion-icon name="grid" onclick="Menu(this)"></ion-icon>
                </span>

            </div>
            <ul class="md:flex md:items-center z-[-1] md:z-auto md:static absolute bg-black w-full left-0 md:w-auto md:py-0 py-6 md:pl-0 pl-7
    md:opacity-100 opacity-100 top-[-400px] transition-all ease-in duration-500">
                <li class="mx-6 my-6 md:my-0">
                    <a href="/index.jsp" class="text-xl text-white font-[Inter] hover:text-[#DAA520] duration-500">HOME</a>
                </li>
                <li class="mx-6 my-6 md:my-0">
                    <a href="/movies.jsp" class="text-xl text-white font-[Inter] hover:text-[#DAA520] duration-500">MOVIES</a>
                </li>
                <li class="mx-6 my-6 md:my-0">
                    <a href="/feedback.jsp" class="text-xl text-white font-[Inter] hover:text-[#DAA520] duration-500">FEEDBACK</a>
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



        <br><br><br>
        <!--Select Bar-->

        <div
            class="flex items-center my-4 before:flex-1 before:border-t before:border-gray-300 before:mt-0.5 after:flex-1 after:border-t after:border-gray-300 after:mt-0.5">
            <p class="text-5xl font-extrabold dark:text-white">Now Showing</p>
        </div>

        <br><br>



        <div class="grid grid-cols-2">

            <div class="flex justify-center">
                <label for="countries" class="block mb-2 text-sm font-medium text-white pt-2 pr-10">GENRE</label>
                <div class="mb-3 xl:w-96">
                    <select class="form-select appearance-none
  block
  w-full
  px-3
  py-1.5
  text-base
  font-normal
  text-gray-700
  bg-white bg-clip-padding bg-no-repeat
  border border-solid border-gray-300
  rounded
  transition
  ease-in-out
  m-0
  focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
                        <option selected>ALL GENRES</option>
                        <option value="1">ACTION</option>
                        <option value="2">ANIMATION</option>
                        <option value="3">COMEDY</option>
                        <option value="4">ROMANCCE</option>
                        <option value="5">THRILLER</option>
                    </select>
                </div>
            </div>

            <div class="flex justify-center">
                <label for="countries" class="block mb-2 text-sm font-medium text-white pt-2 pr-10">LANGUAGE</label>
                <div class="mb-3 xl:w-96">
                    <select class="form-select appearance-none
  block
  w-full
  px-3
  py-1.5
  text-base
  font-normal
  text-gray-700
  bg-white bg-clip-padding bg-no-repeat
  border border-solid border-gray-300
  rounded
  transition
  ease-in-out
  m-0
  focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
                        <option selected>ALL LANGUAGES</option>
                        <option value="1">ENGLISH</option>
                        <option value="2">HINDI</option>
                        <option value="3">SINHALA</option>
                        <option value="4">TAMIL</option>
                    </select>
                </div>
            </div>
        </div>



        <br><br><br>

        <!--Now Showing-->
        <section>
            <div class="grid grid-cols-3 gap-12 ">
                <div class="flex justify-center">
                    <div class="max-w-sm bg-white rounded-lg shadow-lg">
                        <a href="#!">
                            <img class="rounded-t-lg" src="/assets/images/card 1.png" alt="" />
                        </a>
                        <div class="p-6">
                                <h5 class="mb-2 text-xl font-medium text-gray-900"><%=m_name1%>
                            </h5>
                            <p class="mb-4 text-base text-gray-700">
                                    <%=m_language1%> | <%=genre1%>
                            </p>
                            <button type="button"
                                class=" inline-block px-6 py-2.5 bg-black text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out">Book
                                Tickets</button>
                            <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                        </div>
                    </div>
                </div>
                <div class="flex justify-center">
                    <div class="max-w-sm bg-white rounded-lg shadow-lg">
                        <a href="#!">
                            <img class="rounded-t-lg" src="/assets/images/card 2.png" alt="" />
                        </a>
                        <div class="p-6">
                                <h5 class="mb-2 text-xl font-medium text-gray-900"><%=m_name2%></h5><br>

                                <p class="mb-4 text-base text-gray-700">
                                     <%=m_language2%> | <%=genre2%>
                                </p>
                            <button type="button"
                                class=" inline-block px-6 py-2.5 bg-black text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out">Book
                                Tickets</button>
                            <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                        </div>
                    </div>
                </div>
                <div class="flex justify-center">
                    <div class="max-w-sm bg-white rounded-lg shadow-lg">
                        <a href="#!">
                            <img class="rounded-t-lg" src="/assets/images/card 3.png" alt="" />
                        </a>
                        <div class="p-6">
                                <h5 class="mb-2 text-xl font-medium text-gray-900"><%=m_name3%>
                                </h5><br>
                                <p class="mb-4 text-base text-gray-700">
                                    <%=m_language3%> | <%=genre3%>
                                </p>
                            <button type="button"
                                class=" inline-block px-6 py-2.5 bg-black text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out">Book
                                Tickets</button>
                            <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                        </div>
                    </div>
                </div>
                <div class="flex justify-center">
                    <div class="max-w-sm bg-white rounded-lg shadow-lg">
                        <a href="#!">
                            <img class="rounded-t-lg" src="/assets/images/card 4.png" alt="" />
                        </a>
                        <div class="p-6">
                                <h5 class="mb-2 text-xl font-medium text-gray-900"><%=m_name4%>
                                </h5><br>
                                <p class="mb-4 text-base text-gray-700">
                                     <%=m_language4%> | <%=genre4%>
                                </p>
                            <button type="button"
                                class=" inline-block px-6 py-2.5 bg-black text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out">Book
                                Tickets</button>
                            <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                        </div>
                    </div>
                </div>
                <div class="flex justify-center">
                    <div class="max-w-sm bg-white rounded-lg shadow-lg">
                        <a href="#!">
                            <img class="rounded-t-lg" src="/assets/images/card 5.png" alt="" />
                        </a>
                        <div class="p-6">
                                <h5 class="mb-2 text-xl font-medium text-gray-900"><%=m_name5%>
                                </h5><br>
                                <p class="mb-4 text-base text-gray-700">
                                     <%=m_language5%> | <%=genre5%>
                       </p>
                            <button type="button"
                                class=" inline-block px-6 py-2.5 bg-black text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out">Book
                                Tickets</button>
                            <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                        </div>
                    </div>
                </div>
                <div class="flex justify-center">
                    <div class="max-w-sm bg-white rounded-lg shadow-lg">
                        <a href="#!">
                            <img class="rounded-t-lg" src="/assets/images/card 1.png" alt="" />
                        </a>
                        <div class="p-6">
                                <h5 class="mb-2 text-xl font-medium text-gray-900"><%=m_name6%>
                                </h5><br>
                                <p class="mb-4 text-base text-gray-700">
                                     <%=m_language6%> | <%=genre6%>
                       </p>
                            <button type="button"
                                class=" inline-block px-6 py-2.5 bg-black text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out">Book
                                Tickets</button>
                            <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>





        <br><br><br>
        <div
            class="flex items-center my-4 before:flex-1 before:border-t before:border-gray-300 before:mt-0.5 after:flex-1 after:border-t after:border-gray-300 after:mt-0.5">
            <p class="text-5xl font-extrabold dark:text-white">COMING SOON</p>
        </div>

        <br><br>


        <!--Coming soon-->
        <section>
            <div class="grid grid-cols-4 gap-12 ">
                <div class="flex justify-center">
                    <div class="max-w-sm bg-white rounded-lg shadow-lg">
                        <a href="#!">
                            <img class="rounded-t-lg" src="/assets/images/card 6.png" alt="" />
                        </a>
                        <div class="p-6">
                                <h5 class="mb-2 text-xl font-medium text-gray-900">><%=m_name7%>
                                </h5>
                                <p class="mb-4 text-base text-gray-700">
                                     <%=m_language7%> | <%=genre7%>
                                </p>

                            <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                        </div>
                    </div>
                </div>
                <div class="flex justify-center">
                    <div class="max-w-sm bg-white rounded-lg shadow-lg">
                        <a href="#!">
                            <img class="rounded-t-lg" src="/assets/images/card 7.png" alt="" />
                        </a>
                        <div class="p-6">
                                <h5 class="mb-2 text-xl font-medium text-gray-900">><%=m_name8%></h5>
                                <p class="mb-4 text-base text-gray-700">
                                     <%=m_language8%> | <%=genre8%>
                                </p>
                            <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                        </div>
                    </div>
                </div>
                <div class="flex justify-center">
                    <div class="max-w-sm bg-white rounded-lg shadow-lg">
                        <a href="#!">
                            <img class="rounded-t-lg" src="/assets/images/card 8.png" alt="" />
                        </a>
                        <div class="p-6">
                                <h5 class="mb-2 text-xl font-medium text-gray-900">><%=m_name9%>
                                    WISH</h5>
                                <p class="mb-4 text-base text-gray-700">
                                     <%=m_language9%> | <%=genre9%>
                                </p>
                            <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                        </div>
                    </div>
                </div>
                <div class="flex justify-center">
                    <div class="max-w-sm bg-white rounded-lg shadow-lg">
                        <a href="#!">
                            <img class="rounded-t-lg" src="/assets/images/card 9.png" alt="" />
                        </a>
                        <div class="p-6">
                                <h5 class="mb-2 text-xl font-medium text-gray-900">><%=m_name10%></h5>
                                <p class="mb-4 text-base text-gray-700">
                                     <%=m_language10%> | <%=genre10%>
                                </p>
                            <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                        </div>
                    </div>
                </div>

            </div>

        </section>


    <%
                        } catch (Exception e) {
                                e.printStackTrace();
                }

    %>     



        <!--Footer-->
        <br><br><br>

        <footer class="p-4 bg-black  shadow md:px-6 md:py-8 ">
            <div class="sm:flex sm:items-center sm:justify-between">
                <a href="index.jsp" class="flex items-center mb-4 sm:mb-0">
                    <img src="/assets/images/ABC Cinema LOGO.png" class="h-8 mr-3" alt="Flowbite Logo" />
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
                        <a href="#" class="hover:underline">CONTACT US</a>
                    </li>
                </ul>
            </div>
            <hr class="my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8" />
            <span class="block text-sm text-gray-500 sm:text-center dark:text-gray-400"><a href="#"
                    class="hover:underline"></a>COPYRIGHT Â© 2022 ABC CINEMA.ALL RIGHTS RESERVED.
            </span>
        </footer>




    </div>




                                     <%=m_language5%> | <%=genre5%>
                                
         





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
