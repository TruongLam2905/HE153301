<%-- 
    Document   : booking
    Created on : Oct 26, 2021, 4:53:08 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:set var = "contextPath" value="${pageContext.request.contextPath}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">
        <link href="${contextPath}/css/animate.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/aos.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/flaticon.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/icomoon.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/ionicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/jquery.timepicker.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/magnific-popup.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/open-iconic-bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/owl.carousel.min.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/owl.theme.default.min.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">Roxandrea</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a href="isLogged" class="nav-link">Home</a></li>
                        <li class="nav-item active"><a href="room" class="nav-link">Rooms</a></li>
                        <li class="nav-item"><a href="restaurant" class="nav-link">Restaurant</a></li>
                        <li class="nav-item"><a href="about" class="nav-link">About</a></li>
                        <li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->
        <div class="hero-wrap" style="background-image: url('${contextPath}/images/bg_1.jpg');">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
                    <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
                        <div class="text">
                            <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home</a></span>
                                <span>About</span>
                            </p>
                            <h1 class="mb-4 bread">Rooms</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script>
            function getType1() {
                var getType = document.getElementById("getType");
                var selectedValue = getType.options[getType.selectedIndex].value;
                window.location.href = "booking?roomtypeID=" + selectedValue;
            }
        </script>
        <section class="ftco-section bg-light ftco-no-pb">
            <div class="container-fluid px-0">
                <div class="row no-gutters justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Roxandrea Rooms</span>
                        <h2 class="mb-4">Booking Rooms</h2>
                    </div>
                </div>
                <form class="form-booking" action="booking" method="POST">
                    <div class="row no-gutters">
                        <div class="col-lg-6">
                            <div class="room-wrap form-flex d-md-flex">
                                <div class="header-personal">
                                    <span>PERSONAL INFORMATION</span>
                                </div>
                                <div class="header-item">
                                    <span>Name</span> <br>
                                    <input type="text" hidden="hidden" name="id" value="${sessionScope.user.customerID}"/>
                                    <input type="text" name="name" value="${sessionScope.user.name}"/>
                                </div>
                                <div class="header-item">
                                    <span>Email</span> <br>
                                    <input type="text" name="email" value="${sessionScope.user.email}"/>
                                </div>
                                <div class="header-item">
                                    <span>Address</span> <br>
                                    <input type="text" name="address" value="${sessionScope.user.address}"/>
                                </div>
                                <div class="header-item">
                                    <span>Phone</span> <br>
                                    <input type="text" name="phone" value="${sessionScope.user.phone}"/>
                                </div>
                                <div class="header-item">
                                    <span>Guest</span> <br>
                                    <input type="text" name="Guest" value="${requestScope.maxG}"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="room-wrap form-flex d-md-flex">
                                <div class="header-personal">
                                    <span>RESERVATION INFORMATION</span>
                                </div>

                                <div class="header-item">

                                    <span>Type Of Room</span> <br>
                                    <select id="getType" name="typeRoom" onchange="getType1()">
                                        <c:forEach items="${requestScope.typeRooms}" var="r">
                                            <option
                                                ${requestScope.typeRoom.roomTypeID eq r.roomTypeID ?"selected=\"selected\"":""}
                                                value="${r.roomTypeID}" >
                                                ${r.typeName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="header-item">
                                    <span>No of Room</span> <br>
                                    <select name="NoRoom">
                                        <c:forEach items="${requestScope.rooms}" var="r">
                                            <option
                                                ${requestScope.room.roomID eq r.roomID ?"selected=\"selected\"":""}
                                                value="${room.roomID}">${room.roomID}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="header-item">
                                    <span>Reservation Date</span> <br>
                                    <input type="date" name="reserDate" />
                                </div>
                                <div class="header-item">
                                    <span>Check-In</span> <br>
                                    <input type="date" name="In" value="${requestScope.checkIn}"/>
                                </div>
                                <div class="header-item">
                                    <span>Check-Out</span> <br>
                                    <input type="date" name="Out" value="${requestScope.checkOut}"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="Submit-form">
                        <input class="Submit-form" type="submit" value="Continue Payment" />
                    </div>
                </form>



            </div>
        </section>

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Roxandrea</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Useful Links</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">Blog</a></li>
                                <li><a href="#" class="py-2 d-block">Rooms</a></li>
                                <li><a href="#" class="py-2 d-block">Amenities</a></li>
                                <li><a href="#" class="py-2 d-block">Gift Card</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Privacy</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">Career</a></li>
                                <li><a href="#" class="py-2 d-block">About Us</a></li>
                                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
                                <li><a href="#" class="py-2 d-block">Services</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Have a Questions?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain
                                            View, San Francisco, California, USA</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929
                                                210</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span
                                                class="text">info@yourdomain.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;
                            <script>
                                document.write(new Date().getFullYear());
                            </script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>.Downloaded from <a href="https://themeslab.org/"
                                                                                                                                                                                                        target="_blank">Themeslab</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </footer>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00" />
            </svg></div>


        <script src="${contextPath}/js/jquery.min.js"></script>
        <script src="${contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="${contextPath}/js/popper.min.js"></script>
        <script src="${contextPath}/js/bootstrap.min.js"></script>
        <script src="${contextPath}/js/jquery.easing.1.3.js"></script>
        <script src="${contextPath}/js/jquery.waypoints.min.js"></script>
        <script src="${contextPath}/js/jquery.stellar.min.js"></script>
        <script src="${contextPath}/js/owl.carousel.min.js"></script>
        <script src="${contextPath}/js/jquery.magnific-popup.min.js"></script>
        <script src="${contextPath}/js/aos.js"></script>
        <script src="${contextPath}/js/jquery.animateNumber.min.js"></script>
        <script src="${contextPath}/js/jquery.mb.YTPlayer.min.js"></script>
        <script src="${contextPath}/js/bootstrap-datepicker.js"></script>
        <!-- // <script src="js/jquery.timepicker.min.js"></script> -->
        <script src="${contextPath}/js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="${contextPath}/js/google-map.js"></script>
        <script src="${contextPath}/js/main.js"></script>
    </body>
</html>
