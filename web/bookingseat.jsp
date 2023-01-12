<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>



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
    <script>
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

</script>
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
                        <h1 class="text-white">No. Of Full Tickets</h1>
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
                    <div class="px-5 text-xl font-bold">
                        <h1 class="text-white">No. Of Half Tickets</h1>
                    </div>
                    <div class="flex justify-center">

                        <div class="mb-3 xl:w-96">
                            <select id="half-tickets" class="form-select appearance-none block w-56 px-3 py-1.5 rounded text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">

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
                        <c:forEach var="status" items="${bookedSeats}" varStatus="status"></c:forEach>
                        <div class="row px-20 m-5">
                            <div class="seat ${status} text-black text-2xl font-bold px-4 pt-1" onClick="getSeats('A1')">A1</div>
                            <div class="seat ${status} text-black text-2xl font-bold px-4 pt-1" onClick="getSeats('A2')">A2</div>
                            <div class="seat ${status} reserved text-black font-bold text-2xl px-4 pt-1" onClick="getSeats('A3')">A3</div>
                            <div class="seat ${status} text-black text-2xl font-bold px-4 pt-1" onClick="getSeats('A4')">A4</div>
                            <div class="seat ${status} text-black text-2xl font-bold px-4 pt-1" onClick="getSeats('A5')">A5</div>
                            <div class="seat ${status} text-black text-2xl font-bold px-4 pt-1" onClick="getSeats('A6')">A6</div>
                            <div class="seat ${status} text-black text-2xl font-bold px-4 pt-1" onClick="getSeats('A7')">A7</div>
                            <div class="seat ${status} text-black text-2xl font-bold px-4 pt-1" onClick="getSeats('A8')">A8</div>
                        </div>
                        <div class="row">
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('B1')">B1</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('B2')">B2</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('B3')">B3</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('B4')">B4</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('B5')">B5</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('B6')">B6</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('B7')">B7</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('B8')">B8</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('B9')">B9</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('B10')">B10</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('B11')">B11</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('B12')">B12</div>
                        </div>
                        <div class="row">
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('C1')">C1</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('C2')">C2</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('C3')">C3</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('C4')">C4</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('C5')">C5</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('C6')">C6</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('C7')">C7</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('C8')">C8</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('C9')">C9</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('C10')">C10</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('C11')">C11</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('C12')">C12</div>
                        </div>
                        <div class="row">
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('D1')">D1</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('D2')">D2</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('D3')">D3</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('D4')">D4</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('D5')">D5</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('D6')">D6</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('D7')">D7</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('D8')">D8</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('D9')">D9</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('D10')">D10</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('D11')">D11</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('D12')">D12</div>
                        </div>
                        <div class="row">
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('E1')">E1</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('E2')">E2</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('E3')">E3</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('E4')">E4</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('E5')">E5</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('E6')">E6</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('E7')">E7</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('E8')">E8</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('E9')">E9</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('E10')">E10</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('E11')">E11</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('E12')">E12</div>
                        </div>
                        <div class="row">
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('F1')">F1</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('F2')">F2</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('F3')">F3</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('F4')">F4</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('F5')">F5</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('F6')">F6</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('F7')">F7</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('F8')">F8</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('F9')">F9</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('F10')">F10</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('F11')">F11</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('F12')">F12</div>
                        </div>
                        <div class="row">
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('G1')">G1</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('G2')">G2</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('G3')">G3</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('G4')">G4</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('G5')">G5</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('G6')">G6</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('G7')">G7</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('G8')">G8</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('G9')">G9</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('G10')">G10</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('G11')">G11</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('G12')">G12</div>
                        </div>
                        <div class="row">
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('H1')">H1</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('H2')">H2</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('H3')">H3</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('H4')">H4</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('H5')">H5</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('H6')">H6</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('H7')">H7</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('H8')">H8</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('H9')">H9</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('H10')">H10</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('H11')">H11</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('H12')">H12</div>
                        </div>
                        <div class="row">
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('I1')">I1</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('I2')">I2</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('I3')">I3</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('I4')">I4</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('I5')">I5</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('I6')">I6</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('I7')">I7</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('I8')">I8</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('I9')">I9</div>
                            <div class="seat ${status} reserved text-black text-l font-bold px-3 pt-2" onClick="getSeats('I10')">I10</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('I11')">I11</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('I12')">I12</div>
                        </div>
                        <div class="row">
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('J1')">J1</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('J2')">J2</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('J3')">J3</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('J4')">J4</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('J5')">J5</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('J6')">J6</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('J7')">J7</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('J8')">J8</div>
                            <div class="seat ${status} text-black text-l font-bold px-4 pt-2" onClick="getSeats('J9')">J9</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('J10')">J10</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('J11')">J11</div>
                            <div class="seat ${status} text-black text-l font-bold px-3 pt-2" onClick="getSeats('J12')">J12</div>
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
    </script>
    <script src="https://unpkg.com/flowbite@1.6.0/dist/flowbite.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/tw-elements/dist/js/index.min.js"></script>
    <script src="script.js"></script>
</body>

</html>