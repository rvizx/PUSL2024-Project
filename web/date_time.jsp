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



<br><br>
        <Section class="">
            <div
                class="flex items-center my-4 before:flex-1 before:border-t before:border-gray-300 before:mt-0.5 after:flex-1 after:border-t after:border-gray-300 after:mt-0.5">
                <p class="text-3xl font-extrabold dark:text-white">SELECT DATE & TIME</p>
            </div>

        </Section><br>


        <div class="grid grid-cols-3">

            <div class="flex justify-center">
                <label for="countries" class="block mb-2 text-sm font-medium text-white pr-3 "><ion-icon name="calendar"
                        size="large"></ion-icon></label>
                <div class="mb-3 xl:w-96">
                    <select class="form-select appearance-none
            block
            w-full
            px-3
            py-1.5
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
                        aria-label="Default select example">

                        <option selected>JAN 10 TUE</option>
                        <option value="1">JAN 11 WED</option>
                        <option value="2">JAN 12 THU</option>
                        <option value="3">JAN 13 FRI</option>
                        <option value="4">JAN 14 SAT</option>
                        <option value="5">JAN 16 SUN</option>
                        <option value="6">JAN 17 MON</option>
                        <option value="7">JAN 18 TUE</option>
                        <option value="8">JAN 19 WED</option>
                        <option value="9">JAN 20 THU</option>
                    </select>
                </div>
            </div>

            <div class="flex justify-center">
                <label for="countries" class="block mb-2 text-sm font-medium text-white pr-3 "><ion-icon name="videocam"
                        size="large"></ion-icon></label>
                <div class="mb-3 xl:w-96">
                    <select class="form-select appearance-none
            block
            w-full
            px-3
            py-1.5
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
                        aria-label="Default select example">
                        <option selected>ALL MOVIES</option>
                        <option value="1">BLACK PANTHER: WAKANDA FOREVER</option>
                        <option value="2">BLACK ADAM</option>
                        <option value="3">TOP GUN : MAVERICK</option>
                        <option value="4">JURASSIC WORLD : DOMINION</option>
                        <option value="5">K.G.F: CHAPTER 2</option>
                    </select>
                </div>
            </div>
            <div class="flex justify-center">
                <label for="countries" class="block mb-2 text-sm font-medium text-white pr-3 "><ion-icon name="eye"
                        size="large"></ion-icon></label>
                <div class="mb-3 xl:w-96">
                    <select class="form-select appearance-none
            block
            w-full
            px-3
            py-1.5
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
                        aria-label="Default select example">
                        <option selected>ALL EXPERIENCE</option>
                        <option value="1">2D CLASS</option>
                        <option value="2">3D GOLD CLASS</option>
                    </select>
                </div>
            </div>
        </div>
        <br><br><br>



        <div class="grid grid-cols-2">
            <div>
                <div class="items-center justify-center">
                    <h1 class="text-white text-5xl font-bold">BLACK ADAM</h1><br>
                    <div class="flex flex-row items-center  ">
                        <ion-icon name="location"></ion-icon>
                        <h1 class="text-white text-2xl font-bold">Havelock City Mall</h1>
                    </div><br>
                    <div>
                        <h2 class="text-white text-xl">2D CLASS</h2>
                        <div class="flex items-center  mb-3">
                            <div class="inline-flex shadow-md hover:shadow-lg focus:shadow-lg" role="group">
                                <a href="#">
                                    <button type="button"
                                        class="rounded-l inline-block px-7 py-3 bg-[#DAA520] text-white font-medium text-m leading-snug uppercase hover:bg-[#F6C74E] focus:bg-[#F6C74E] focus:outline-none focus:ring-0 active:bg-[#F6C74E] transition duration-150 ease-in-out">10.30
                                        AM</button>
                                </a>
                                <a href="/bookingseat.jsp">
                                    <button type="button"
                                        class="inline-block px-7 py-3 bg-[#DAA520] text-white font-medium text-m leading-snug uppercase hover:bg-[#F6C74E] focus:bg-[#F6C74E] focus:outline-none focus:ring-0 active:bg-[#F6C74E] transition duration-150 ease-in-out">01.00
                                        PM</button>
                                </a>
                                <a href="#">
                                    <button type="button"
                                        class="inline-block px-7 py-3 bg-[#DAA520] text-white font-medium text-m leading-snug uppercase hover:bg-[#F6C74E] focus:bg-[#F6C74E] focus:outline-none focus:ring-0 active:bg-[#F6C74E] transition duration-150 ease-in-out">06.00
                                        PM</button>
                                </a>
                                <a href="#">
                                    <button type="button"
                                        class="rounded-r inline-block px-7 py-3 bg-[#DAA520] text-white font-medium text-m leading-snug uppercase hover:bg-[#F6C74E] focus:bg-[#F6C74E] focus:outline-none focus:ring-0 active:bg-[#F6C74E] transition duration-150 ease-in-out">09.00
                                        PM</button>
                                </a>
                            </div>
                        </div>
                    </div><br>
                    <div>
                        <h2 class="text-white text-xl">3D GOLD CLASS</h2>
                        <div class="flex items-center  mb-3">
                            <div class="inline-flex shadow-md hover:shadow-lg focus:shadow-lg" role="group">
                                <button type="button"
                                    class="rounded-l inline-block px-7 py-3 bg-gray-400 text-white font-medium text-m leading-snug uppercase   focus:outline-none focus:ring-0  transition duration-150 ease-in-out cursor-not-allowed "
                                    disabled>10.30
                                    AM</button>
                                <button type="button"
                                    class="rounded-r inline-block px-7 py-3 bg-gray-400 text-white font-medium text-m leading-snug uppercase   focus:outline-none focus:ring-0  transition duration-150 ease-in-out cursor-not-allowed "
                                    disabled>01.00
                                    PM</button>
                            </div>
                        </div>
                    </div>
    
                </div>
    
            </div>
            <div>
                <img class="h-auto max-w-full" src="/assets/images/ticket book page 1.png" alt="image description">
            </div>
    

        </div>
        










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