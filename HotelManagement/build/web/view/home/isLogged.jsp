<%-- 
    Document   : homepage
    Created on : Oct 21, 2021, 4:31:50 PM
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
        <link href="${contextPath}css/aos.css" rel="stylesheet" type="text/css"/>
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
                <a class="navbar-brand" href="index.html">Resort Phu Quoc</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="homepage" class="nav-link">Home</a></li>
                        <li class="nav-item"><a href="room" class="nav-link">Rooms</a></li>
                        <li class="nav-item"><a href="restaurant" class="nav-link">Restaurant</a></li>
                        <li class="nav-item"><a href="about" class="nav-link">About</a></li>
                        <li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
                        <c:if test="${sessionScope.user.is_admin == true}">
                            <li class="nav-item"><a href="admin" class="nav-link">Manager</a></li>
                        </c:if>
                        <li class="nav-item"><a href="#" class="nav-link">Welcome ${sessionScope.user.name}</a></li>
                        <li class="nav-item"><a href="homepage?action=logout" class="nav-link">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->
        <div class="hero">
            <div class="container-wrap d-flex justify-content-end align-items-end">
                <a href="https://www.youtube.com/watch?v=ism1XqnZJEg" class="icon-video popup-vimeo d-flex justify-content-center align-items-center">
                    <span class="ion-ios-play play"></span>
                </a>
            </div>
            <section class="home-slider owl-carousel">
                <div class="slider-item" style="background-image:url(${contextPath}/images/bg_1.jpg);">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row no-gutters slider-text align-items-center">
                            <div class="col-md-8 ftco-animate">
                                <div class="text mb-5 pb-5">
                                    <h1 class="mb-3">Radisson Blue Resort Phu Quoc</h1>
                                    <h2>More than a hotel... an experience</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="slider-item" style="background-image:url(${contextPath}/images/bg_2.jpg);">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row no-gutters slider-text align-items-center">
                            <div class="col-md-8 ftco-animate">
                                <div class="text mb-5 pb-5">
                                    <h1 class="mb-3">Experience Epic Beauty</h1>
                                    <h2>Phu Quoc Hotel &amp; Resort</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <section class="ftco-booking ftco-section ftco-no-pt ftco-no-pb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 pr-1 aside-stretch">
                        <form action="searchTRoom" class="booking-form" method="POST">
                            <div class="row">
                                <div class="col-md d-flex py-md-4">
                                    <div class="form-group align-self-stretch d-flex align-items-end">
                                        <div class="wrap bg-white align-self-stretch py-3 px-4">
                                            <label for="#">Check-in Date</label>
                                            <input type="date" name="check-in" class="form-control " placeholder="Check-in date">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md d-flex py-md-4">
                                    <div class="form-group align-self-stretch d-flex align-items-end">
                                        <div class="wrap bg-white align-self-stretch py-3 px-4">
                                            <label for="#">Check-out Date</label>
                                            <input type="date" name="check-out" class="form-control " placeholder="Check-out date">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md d-flex py-md-4">
                                    <div class="form-group align-self-stretch d-flex align-items-end">
                                        <div class="wrap bg-white align-self-stretch py-3 px-4">
                                            <label for="#">Room</label>
                                            <div class="form-field">
                                                <div class="select-wrap">
                                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                    <select name="roomtypeID" id="" class="form-control">
                                                        <c:forEach items="${requestScope.typeRooms}" var="r">
                                                            <option value="${r.roomTypeID}">${r.typeName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md d-flex py-md-4">
                                    <div class="form-group align-self-stretch d-flex align-items-end">
                                        <div class="wrap bg-white align-self-stretch py-3 px-4">
                                            <label for="#">Guests</label>
                                            <div class="form-field">
                                                <div class="select-wrap">
                                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                    <select name="maxGuest" id="" class="form-control">
                                                        <option value="1">1 Adult</option>
                                                        <option value="2">2 Adult</option>
                                                        <option value="3">3 Adult</option>
                                                        <option value="4">4 Adult</option>
                                                        <option value="5">5 Adult</option>
                                                        <option value="6">6 Adult</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md d-flex">
                                    <div class="form-group d-flex align-self-stretch">
                                        <!--<a href="#" class="btn btn-black py-5 py-md-3 px-4 align-self-stretch d-block"><span>Check Availability <small>Best Price Guaranteed!</small></span></a>-->
                                        <!--<div class="btn btn-black py-5 py-md-3 px-4 align-self-stretch d-block">-->
                                        <input type="submit" value="Check Availability" class="btn btn-black py-5 py-md-3 px-4 align-self-stretch d-block" />
                                        <!--<span><small>Best Price Guaranteed!</small></span>-->
                                        <!--</div>-->
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section ftco-no-pt ftco-no-pb ftco-services-wrap">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-3">
                        <a href="#" class="services-wrap img align-items-end d-flex" style="background-image: url(${contextPath}/images/roompq.jpg);">
                            <div class="text text-center pb-2">
                                <h3>Special Rooms</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="services-wrap img align-items-end d-flex" style="background-image: url(${contextPath}/images/phuquoc_3.jpg);">
                            <div class="text text-center pb-2">
                                <h3>Swimming Pool</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="#" class="services-wrap img align-items-end d-flex" style="background-image: url(${contextPath}/images/resto.jpg);">
                            <div class="text text-center pb-2">
                                <h3>Restaurant</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <div class="services-wrap services-overlay img align-items-center d-flex" style="background-image: url(${contextPath}/images/sleep.jpg);">
                            <div class="text text-center pb-2">
                                <h3 class="mb-0">Suites &amp; Rooms</h3>
                                <span>Special Rooms</span>
                                <div class="d-flex mt-2 justify-content-center">
                                    <div class="icon">
                                        <a href="#"><span class="ion-ios-arrow-forward"></span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Welcome to Phu Quoc Hotel</span>
                        <h2 class="mb-4">A New Vision of Luxury Hotel</h2>
                    </div>
                </div>
                <div class="row d-flex">
                    <div class="col-md pr-md-1 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services py-4 d-block text-center">
                            <div class="d-flex justify-content-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="flaticon-reception-bell"></span>
                                </div>
                            </div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Friendly Service</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md px-md-1 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services active py-4 d-block text-center">
                            <div class="d-flex justify-content-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="flaticon-serving-dish"></span>
                                </div>
                            </div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Get Breakfast</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md px-md-1 d-flex align-sel Searchf-stretch ftco-animate">
                        <div class="media block-6 services py-4 d-block text-center">
                            <div class="d-flex justify-content-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="flaticon-car"></span>
                                </div>
                            </div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Transfer Services</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md px-md-1 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services py-4 d-block text-center">
                            <div class="d-flex justify-content-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="flaticon-spa"></span>
                                </div>
                            </div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Suits &amp; SPA</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md pl-md-1 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services py-4 d-block text-center">
                            <div class="d-flex justify-content-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="ion-ios-bed"></span>
                                </div>
                            </div>
                            <div class="media-body">
                                <h3 class="heading mb-3">Cozy Rooms</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section bg-light ftco-room">
            <div class="container-fluid px-0">
                <div class="row no-gutters justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Phu Quoc Rooms</span>
                        <h2 class="mb-4">Hotel Master's Rooms</h2>
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col-lg-6">
                        <div class="room-wrap">
                            <div class="img d-flex align-items-center" style="background-image: url(${contextPath}/images/bg_3.jpg);">
                                <div class="text text-center px-4 py-4">
                                    <h2>Welcome to <a href="index.html">Phu Quoc</a> Hotel</h2>
                                    <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${requestScope.typeRooms}" var="r">
                        <div class="col-lg-6">
                            <div class="room-wrap d-md-flex">
                                <a href="rooms-single.html" class="img" style="background-image: url(data:image/jpg;base64,${r.base64Image});"></a>
                                <div class="half left-arrow d-flex align-items-center">
                                    <div class="text p-4 p-xl-5 text-center">
                                        <p class="star mb-0"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                        <p class="mb-0"><span class="price mr-1">$${r.price}</span> <span class="per">per night</span></p>
                                        <h3 class="mb-3"><a href="rooms-single.html">${r.typeName}</a></h3>
                                        <p class="pt-1"><a href="rooms-single.html" class="btn-custom px-3 py-2">View Room Details <span class="icon-long-arrow-right"></span></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
            </div>
        </section>


        <section class="ftco-section testimony-section bg-light">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Testimony</span>
                        <h2 class="mb-4">Our Happy Guest Says</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-8 ftco-animate">
                        <div class="row ftco-animate">
                            <div class="col-md-12">
                                <div class="carousel-testimony owl-carousel ftco-owl">
                                    <div class="item">
                                        <div class="testimony-wrap py-4 pb-5">
                                            <div class="user-img mb-4" style="background-image: url(${contextPath}/images/person_1.jpg)">
                                                <span class="quote d-flex align-items-center justify-content-center">
                                                    <i class="icon-quote-left"></i>
                                                </span>
                                            </div>
                                            <div class="text text-center">
                                                <p class="star"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                                <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                                                <p class="name">Nathan Smith</p>
                                                <span class="position">Guests</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="testimony-wrap py-4 pb-5">
                                            <div class="user-img mb-4" style="background-image: url(${contextPath}/images/person_2.jpg)">
                                                <span class="quote d-flex align-items-center justify-content-center">
                                                    <i class="icon-quote-left"></i>
                                                </span>
                                            </div>
                                            <div class="text text-center">
                                                <p class="star"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                                <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                                                <p class="name">Nathan Smith</p>
                                                <span class="position">Guests</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="testimony-wrap py-4 pb-5">
                                            <div class="user-img mb-4" style="background-image: url(${contextPath}/images/person_3.jpg)">
                                                <span class="quote d-flex align-items-center justify-content-center">
                                                    <i class="icon-quote-left"></i>
                                                </span>
                                            </div>
                                            <div class="text text-center">
                                                <p class="star"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                                <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                                                <p class="name">Nathan Smith</p>
                                                <span class="position">Guests</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="testimony-wrap py-4 pb-5">
                                            <div class="user-img mb-4" style="background-image: url(${contextPath}/images/person_1.jpg)">
                                                <span class="quote d-flex align-items-center justify-content-center">
                                                    <i class="icon-quote-left"></i>
                                                </span>
                                            </div>
                                            <div class="text text-center">
                                                <p class="star"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                                <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                                                <p class="name">Nathan Smith</p>
                                                <span class="position">Guests</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="testimony-wrap py-4 pb-5">
                                            <div class="user-img mb-4" style="background-image: url(${contextPath}/images/person_1.jpg)">
                                                <span class="quote d-flex align-items-center justify-content-center">
                                                    <i class="icon-quote-left"></i>
                                                </span>
                                            </div>
                                            <div class="text text-center">
                                                <p class="star"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                                <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                                                <p class="name">Nathan Smith</p>
                                                <span class="position">Guests</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-no-pt ftco-no-pb px-0">
            <div class="container-fluid px-0">
                <div class="row no-gutters justify-content-end">
                    <div class="col-md-12">
                        <div id="home" class="video-hero" style="height: 800px; background-image: url(${contextPath}/images/bg_1.jpg); background-size:cover; background-position: center center;">
                            <a class="player" data-property="{videoURL:'https://www.youtube.com/watch?v=ism1XqnZJEg',containment:'#home', showControls:false, autoPlay:true, loop:true, mute:true, startAt:0, opacity:1, quality:'default'}"></a>
                            <div class="container">
                                <div class="row justify-content-start d-flex align-items-end height-text ">
                                    <div class="col-md-8">
                                        <div class="text">
                                            <h1>We're Most Recommended Hotel</h1>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-menu" style="background-image: url(${contextPath}/images/restaurant-pattern.jpg);">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Restaurant</span>
                        <h2>Restaurant</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="pricing-entry d-flex ftco-animate">
                            <div class="img order-md-last" style="background-image: url(${contextPath}/images/menu-1.jpg);"></div>
                            <div class="desc pr-3 text-md-right">
                                <div class="d-md-flex text align-items-center">
                                    <h3 class="order-md-last heading-left"><span>Grilled Crab with Onion</span></h3>
                                    <span class="price price-left">$20.00</span>
                                </div>
                                <div class="d-block">
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                        <div class="pricing-entry d-flex ftco-animate">
                            <div class="img order-md-last" style="background-image: url(${contextPath}/images/menu-2.jpg);"></div>
                            <div class="desc pr-3 text-md-right">
                                <div class="d-md-flex text align-items-center">
                                    <h3 class="order-md-last heading-left"><span>Grilled Beef with potatoes</span></h3>
                                    <span class="price price-left">$29.00</span>
                                </div>
                                <div class="d-block">
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                        <div class="pricing-entry d-flex ftco-animate">
                            <div class="img order-md-last" style="background-image: url(${contextPath}/images/menu-3.jpg);"></div>
                            <div class="desc pr-3 text-md-right">
                                <div class="d-md-flex text align-items-center">
                                    <h3 class="order-md-last heading-left"><span>Grilled Beef with potatoes</span></h3>
                                    <span class="price price-left">$20.00</span>
                                </div>
                                <div class="d-block">
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                        <div class="pricing-entry d-flex ftco-animate">
                            <div class="img order-md-last" style="background-image: url(${contextPath}/images/menu-4.jpg);"></div>
                            <div class="desc pr-3 text-md-right">
                                <div class="d-md-flex text align-items-center">
                                    <h3 class="order-md-last heading-left"><span>Grilled Beef with potatoes</span></h3>
                                    <span class="price price-left">$20.00</span>
                                </div>
                                <div class="d-block">
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="pricing-entry d-flex ftco-animate">
                            <div class="img" style="background-image: url(${contextPath}/images/menu-5.jpg);"></div>
                            <div class="desc pl-3">
                                <div class="d-md-flex text align-items-center">
                                    <h3><span>Grilled Beef with potatoes</span></h3>
                                    <span class="price">$49.91</span>
                                </div>
                                <div class="d-block">
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                        <div class="pricing-entry d-flex ftco-animate">
                            <div class="img" style="background-image: url(${contextPath}/images/menu-6.jpg);"></div>
                            <div class="desc pl-3">
                                <div class="d-md-flex text align-items-center">
                                    <h3><span>Ultimate Overload</span></h3>
                                    <span class="price">$20.00</span>
                                </div>
                                <div class="d-block">
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                        <div class="pricing-entry d-flex ftco-animate">
                            <div class="img" style="background-image: url(${contextPath}/images/menu-7.jpg);"></div>
                            <div class="desc pl-3">
                                <div class="d-md-flex text align-items-center">
                                    <h3><span>Grilled Beef with potatoes</span></h3>
                                    <span class="price">$20.00</span>
                                </div>
                                <div class="d-block">
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                        <div class="pricing-entry d-flex ftco-animate">
                            <div class="img" style="background-image: url(${contextPath}/images/menu-8.jpg);"></div>
                            <div class="desc pl-3">
                                <div class="d-md-flex text align-items-center">
                                    <h3><span>Ham &amp; Pineapple</span></h3>
                                    <span class="price">$20.00</span>
                                </div>
                                <div class="d-block">
                                    <p>A small river named Duden flows by their place and supplies</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Read Blog</span>
                        <h2>Recent Blog</h2>
                    </div>
                </div>
                <div class="row d-flex">
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.html" class="block-20" style="background-image: url('${contextPath}/images/image_1.jpg');">
                            </a>
                            <div class="text mt-3 text-center">
                                <div class="meta mb-2">
                                    <div><a href="#">July 03, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                <p><a href="#" class="btn-custom">Read more</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.html" class="block-20" style="background-image: url('${contextPath}/images/image_2.jpg');">
                            </a>
                            <div class="text mt-3 text-center">
                                <div class="meta mb-2">
                                    <div><a href="#">July 03, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                <p><a href="#" class="btn-custom">Read more</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="blog-single.html" class="block-20" style="background-image: url('${contextPath}/images/image_3.jpg');">
                            </a>
                            <div class="text mt-3 text-center">
                                <div class="meta mb-2">
                                    <div><a href="#">July 03, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                    <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                                </div>
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                <p><a href="#" class="btn-custom">Read more</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="instagram">
            <div class="container-fluid">
                <div class="row no-gutters justify-content-center pb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <span class="subheading">Photos</span>
                        <h2><span>Instagram</span></h2>
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="${contextPath}/images/insta-1.jpg" class="insta-img image-popup" style="background-image: url(${contextPath}/images/insta-1.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="${contextPath}/images/insta-2.jpg" class="insta-img image-popup" style="background-image: url(${contextPath}/images/insta-2.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="images/insta-3.jpg" class="insta-img image-popup" style="background-image: url(${contextPath}/images/insta-3.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="${contextPath}/images/insta-4.jpg" class="insta-img image-popup" style="background-image: url(${contextPath}/images/insta-4.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="${contextPath}/images/insta-5.jpg" class="insta-img image-popup" style="background-image: url(${contextPath}/images/insta-5.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Phu Quoc</h2>
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
                                    <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
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
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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