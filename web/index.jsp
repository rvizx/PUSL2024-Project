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

<body class="bg-black">

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
    </div>

    <!--Carousel-->
    <section>
        <div id="carouselExampleIndicators" class="carousel slide relative" data-bs-ride="carousel ">
            <div class="carousel-indicators absolute right-0 bottom-0 left-0 flex justify-center p-0 mb-4">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                    aria-label="Slide 4"></button>
            </div>
            <div class="carousel-inner relative w-full h-[865px] overflow-hidden ">
                <div class="carousel-item active float-left w-full">
                    <img src="/assets/images/slide 1.png" class="block w-full" alt="Wild Landscape" />
                </div>
                <div class="carousel-item float-left w-full">
                    <img src="/assets/images/slide 2.png" class="block w-full" alt="Camera" />
                </div>
                <div class="carousel-item float-left w-full">
                    <img src="/assets/images/slide 3.png" class="block w-full" alt="Exotic Fruits" />
                </div>
                <div class="carousel-item float-left w-full">
                    <img src="/assets/images/slide 4.png" class="block w-full" alt="Exotic Fruits" />
                </div>
            </div>
            <button
                class="carousel-control-prev absolute top-0 bottom-0 flex items-center justify-center p-0 text-center border-0 hover:outline-none hover:no-underline focus:outline-none focus:no-underline left-0"
                type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon inline-block bg-no-repeat" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button
                class="carousel-control-next absolute top-0 bottom-0 flex items-center justify-center p-0 text-center border-0 hover:outline-none hover:no-underline focus:outline-none focus:no-underline right-0"
                type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon inline-block bg-no-repeat" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

    </section>


    <div class="md:container md:mx-auto">

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
            focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                        aria-label="Default select example">
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
            focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                        aria-label="Default select example">
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
                            <h5 class="mb-2 text-xl font-medium text-gray-900">BLACK PANTHER: WAKANDA FOREVER
                            </h5>
                            <p class="mb-4 text-base text-gray-700">
                                English | Action
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
                            <h5 class="mb-2 text-xl font-medium text-gray-900">BLACK ADAM</h5><br>
                            <p class="mb-4 text-base text-gray-700">
                                English | Action | Adventure
                            </p>
                            <a href="/bookingpg1.jsp">
                                <button type="button"
                                class=" inline-block px-6 py-2.5 bg-black text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out">Book
                                Tickets</button>
                            </a>
                            <a href="#">
                                <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                            </a>
                            
                            
                        </div>
                    </div>
                </div>
                <div class="flex justify-center">
                    <div class="max-w-sm bg-white rounded-lg shadow-lg">
                        <a href="#!">
                            <img class="rounded-t-lg" src="/assets/images/card 3.png" alt="" />
                        </a>
                        <div class="p-6">
                            <h5 class="mb-2 text-xl font-medium text-gray-900">TOP GUN : MAVERICK
                            </h5><br>
                            <p class="mb-4 text-base text-gray-700">
                                English | Action
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
                            <h5 class="mb-2 text-xl font-medium text-gray-900">JURASSIC WORLD : DOMINION
                            </h5><br>
                            <p class="mb-4 text-base text-gray-700">
                                English | Action
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
                            <h5 class="mb-2 text-xl font-medium text-gray-900">K.G.F: CHAPTER 2
                            </h5><br>
                            <p class="mb-4 text-base text-gray-700">
                                English | Action
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
                    <div class="max-w-sm bg-blck rounded-lg shadow-lg pt-56">
                        <a href="/movies.jsp">
                            <button type="button"
                            class=" inline-block px-6 py-2.5  bg-white text-black font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-[#DAA520] hover:shadow-lg focus:bg-[#DAA520] focus:shadow-lg focus:outline-none focus:ring-0 active:bg-[#DAA520] active:shadow-lg transition duration-150 ease-in-out">VIEW
                            ALL</button>
                        </a>
                        
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
                            <h5 class="mb-2 text-xl font-medium text-gray-900">AVATAR : THE WAY OF WATER
                            </h5>
                            <p class="mb-4 text-base text-gray-700">
                                English | Action
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
                            <h5 class="mb-2 text-xl font-medium text-gray-900">DEVOTION</h5>
                            <p class="mb-4 text-base text-gray-700">
                                English | Action
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
                            <h5 class="mb-2 text-xl font-medium text-gray-900">PUSS IN BOOTS: THE LAST
                                WISH</h5>
                            <p class="mb-4 text-base text-gray-700">
                                English | Action
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
                            <h5 class="mb-2 text-xl font-medium text-gray-900">SHOTGUN WEDDING</h5>
                            <p class="mb-4 text-base text-gray-700">
                                English | Action
                            </p>
                            <button type="button"
                                class=" inline-block px-6 py-2.5  bg-[#DAA520] text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-black hover:shadow-lg focus:bg-black focus:shadow-lg focus:outline-none focus:ring-0 active:bg-black active:shadow-lg transition duration-150 ease-in-out">Trailer</button>
                        </div>
                    </div>
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
                        <a href="#" class="hover:underline">CONTACT US</a>
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