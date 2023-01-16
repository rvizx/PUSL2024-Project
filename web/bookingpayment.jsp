<!doctype html>
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

    <!--HTML Select Country Phone Code List with Flags-->
    <link rel="stylesheet" href="https://cdn.tutorialjinni.com/intl-tel-input/17.0.8/css/intlTelInput.css" />
    <script src="https://cdn.tutorialjinni.com/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>


    <link href="/assets/css/style.css" rel="stylesheet">



    <style>
        body {
            font-family: Arial;
            font-size: 17px;
            padding: 8px;
        }

        * {
            box-sizing: border-box;
        }

        .row {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            margin: 0 -16px;
        }

        .col-25 {
            -ms-flex: 25%;
            flex: 25%;
        }

        .col-50 {
            -ms-flex: 50%;
            flex: 50%;
        }

        .col-75 {
            -ms-flex: 75%;
            flex: 75%;
        }

        .col-25,
        .col-50,
        .col-75 {
            padding: 0 16px;
        }

        .container {
            background-color: #000000;
            padding: 5px 20px 15px 20px;
            border: 1px solid rgb(0, 0, 0);
            border-radius: 5px;
        }

        input[type=text] {
            width: 100%;
            margin-bottom: 20px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        label {
            margin-bottom: 10px;
            display: block;
        }

        .icon-container {
            margin-bottom: 20px;
            padding: 7px 0;
            font-size: 24px;
        }


        a {
            color: #2196F3;
        }

        hr {
            border: 2px solid rgb(218, 165, 32);
        }

        span.price {
            float: right;
            color: rgb(255, 255, 255);
        }

        .payment-method {
            display: flex;
            margin-bottom: 60px;
            justify-content: space-between;
        }



        .card-logos {
            display: flex;
            width: 150px;
            justify-content: space-between;
            align-items: center;
        }

        .radio-input {
            margin-top: 20px;
        }

        input[type='radio'] {
            display: inline-block;
        }

        .input-fields {
            display: flex;
            justify-content: space-between;
        }

        .input-fields label {
            display: block;
            margin-bottom: 10px;
            color: #b4b4b4;
        }

        /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
        @media (max-width: 800px) {
            .row {
                flex-direction: column-reverse;
            }

            .col-25 {
                margin-bottom: 20px;
            }
        }
    </style>

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


        <br>

        <section>
            <div
                class="flex items-center my-4 before:flex-1 before:border-t before:border-gray-300 before:mt-0.5 after:flex-1 after:border-t after:border-gray-300 after:mt-0.5">
                <p class="text-3xl font-extrabold dark:text-white">BOOKING SUMMARY</p>
            </div>
            <br><br>



            <div class="row">
                <div class="col-25">
                    <div class="container">
                        <form action="/details" method="POST">

                            <div class="row">
                                <div class="col-50 pb-5">
                                    <h3 class="text-3xl font-bold text-white mt-3 pb-3">YOUR DETAILS</h3>
                                    <!-- <label for="fname"></i> FIRST NAME</label> -->
                                    <input type="text" id="fname" name="firstname" placeholder="FULL NAME">
                                    <!-- <label for="email"></i> EMAIL</label> -->
                                    <input type="text" id="email" name="email" placeholder="EMAIL">
                                    <!-- <label for="phone"></i> PHONE NUMBER</label> -->
                                    <input name="phone" type="text" id="phone" name="phone" placeholder="PHONE NUMBER"
                                        class="">
                                    <div class="flex items-center my-5">
                                        <input id="link-checkbox" type="checkbox" value=""
                                            class="w-4 h-4  text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                        <label for="link-checkbox" class="ml-2 my-2 text-sm font-medium text-white">I
                                            agree
                                            with the <a href="#"
                                                class="text-blue-300 dark:text-blue-300 hover:underline font-bold">terms and
                                                conditions</a></label>
                                    </div>
                                </div>
                            </div>

                            <a href="https://www.paypal.com/lk/home">
                                <button type="button"
                                    class="w-full text-gray-900 bg-[#DAA520] hover:bg-[#F7BE38] focus:ring-4 focus:outline-none focus:ring-[#F7BE38]/50 font-medium rounded-lg text-l uppercase font-black px-10 py-3.5 text-center inline-flex items-center dark:focus:ring-[#F7BE38]/50 mr-2 mb-2">
                                    <svg class="w-4 h-4 mr-2 ml-[180px]" aria-hidden="true" focusable="false"
                                        data-prefix="fab" data-icon="paypal" role="img"
                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                                        <path fill="currentColor"
                                            d="M111.4 295.9c-3.5 19.2-17.4 108.7-21.5 134-.3 1.8-1 2.5-3 2.5H12.3c-7.6 0-13.1-6.6-12.1-13.9L58.8 46.6c1.5-9.6 10.1-16.9 20-16.9 152.3 0 165.1-3.7 204 11.4 60.1 23.3 65.6 79.5 44 140.3-21.5 62.6-72.5 89.5-140.1 90.3-43.4 .7-69.5-7-75.3 24.2zM357.1 152c-1.8-1.3-2.5-1.8-3 1.3-2 11.4-5.1 22.5-8.8 33.6-39.9 113.8-150.5 103.9-204.5 103.9-6.1 0-10.1 3.3-10.9 9.4-22.6 140.4-27.1 169.7-27.1 169.7-1 7.1 3.5 12.9 10.6 12.9h63.5c8.6 0 15.7-6.3 17.4-14.9 .7-5.4-1.1 6.1 14.4-91.3 4.6-22 14.3-19.7 29.3-19.7 71 0 126.4-28.8 142.9-112.3 6.5-34.8 4.6-71.4-23.8-92.6z">
                                        </path>
                                    </svg>
                                    Check out with PayPal
                                </button>
                            </a>




                        </form>
                    </div>
                </div>
                <div class="col-25">
                    <div class="container">
                        <h4 class="text-3xl font-bold mt-3 pb-5 text-white">PURCHASE SUMMARY</h4>
                        <p class="text-white text-xl"><a href="#">FULL TICKETS (x2)</a> <span class="price">Rs.1500.00</span></p>
                        <p><a href="#"></p>
                        <p><a href="#"></span></p>
                            <br>
                        <hr>
                        <br>
                        <p class="text-white font-bold text-xl" >AMOUNT PAYABLE<span class="price" style="color:rgb(255, 255, 255)"><b>Rs.1500.00</b></span></p><br>
                        <hr class="my-1">
                        <hr>
                    </div>
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
        var input = document.querySelector("#phone");
        window.intlTelInput(input, {
            separateDialCode: true,
            excludeCountries: ["in", "il"],
            preferredCountries: ["lk"]
        });
    </script>



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