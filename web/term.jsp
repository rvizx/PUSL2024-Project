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
                    <a href="/Index.jsp"
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
                <p class="text-3xl font-extrabold dark:text-white">TERMS & CONDITIONS</p>
            </div>
            <br>

            <h1 class="text-white text-2xl font-bold">Introduction</h1>

            <p class="text-white text-m text-justify mt-6 ">
                Welcome to <span class="font-bold">ABC CINEMA</span>! By using our website, mobile app, and/or
                purchasing tickets or food and
                beverages from us, you agree to be bound by the following terms and conditions (the "Terms"). Please
                read these Terms carefully before using our services. If you do not agree to these Terms, you should not
                use our services.
            </p>

            <h1 class="text-white text-2xl font-bold mt-6">Ticket Purchases</h1>

            <ul class="text-white text-m text-justify mt-6 list-disc px-10">
                <li>All ticket sales are final and non-refundable.</li>
                <li>You must be at least 18 years old to purchase tickets or enter the theater without a parent or
                    guardian.</li>
                <li>Tickets may not be resold or offered for resale.</li>
                <li>We reserve the right to refuse admission to any ticket holder for any reason, including but not
                    limited to, disorderly conduct or failure to comply with these Terms.</li>
            </ul>


            <h1 class="text-white text-2xl font-bold mt-6">Food and Beverage Purchases</h1>

            <ul class="text-white text-m text-justify mt-6 list-disc px-10">
                <li>Food and beverages may not be brought into the theater.</li>
                <li>We reserve the right to refuse service to any guest for any reason.</li>
                <li>We are not responsible for any allergic reactions to our food or beverages.</li>
            </ul>


            <h1 class="text-white text-2xl font-bold mt-6">Conduct</h1>

            <ul class="text-white text-m text-justify mt-6 list-disc px-10">
                <li>We reserve the right to remove any guest from the theater for any reason, including but not limited
                    to, disorderly conduct or failure to comply with these Terms.</li>
                <li>Guests are prohibited from using any device to record or transmit audio or video of any movie being
                    shown in the theater without the express written consent of <span class="font-bold">ABC
                        CINEMA</span>.</li>
                <li>Guests are prohibited from bringing weapons of any kind into the theater.</li>
                <li>Guests are prohibited from smoking or using any tobacco products in the theater.</li>
            </ul>



            <h1 class="text-white text-2xl font-bold mt-6">Privacy Policy</h1>

            <p class="text-white text-m text-justify mt-6 ">
                Our Privacy Policy explains how we collect and use your personal information. By using our services, you
                agree to our Privacy Policy.
            </p>


            <h1 class="text-white text-2xl font-bold mt-6">Changes to These Terms</h1>

            <p class="text-white text-m text-justify mt-6 ">
                We may update these Terms from time to time to reflect changes in our practices or to comply with legal
                requirements. We will post any changes to these Terms on our website, so please check back periodically
                to review the most current version.
            </p>


            <h1 class="text-white text-2xl font-bold mt-6">Contact Us</h1>

            <p class="text-white text-m text-justify mt-6 ">
                If you have any questions or concerns about these Terms or our services, please contact us at <a href="#"><span
                        class="underline text-blue-300 dark:text-blue-300 hover:underline font-bold">info@abccinema.com</span></a>.
            </p>

            <p class="text-white text-xl font-bold text-justify mt-10 ">
                Thank you for choosing <span class="font-bold">ABC CINEMA</span> !
            </p>
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