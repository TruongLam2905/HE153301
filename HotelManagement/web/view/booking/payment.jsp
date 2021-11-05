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
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
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
                            <h1 class="mb-4 bread">Transaction</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div id="invoice">
                        <div class="toolbar hidden-print">
                            <div class="text-end">
                                <button type="button" class="btn btn-dark"><i class="fa fa-print"></i> Print</button>
                                <button type="button" class="btn btn-danger"><i class="fa fa-file-pdf-o"></i> Export as PDF</button>
                            </div>
                            <hr>
                        </div>
                        <div class="invoice overflow-auto">
                            <div style="min-width: 600px">
                                <header>
                                    <div class="row">
                                        <div class="col">
                                            <a href="javascript:;">
                                                <img src="assets/images/logo-icon.png" width="80" alt="">
                                            </a>
                                        </div>
                                        <div class="col company-details">
                                            <h2 class="name">
                                                <a target="_blank" href="javascript:;">
                                                    Phu Quoc Resort
                                                </a>
                                            </h2>
                                            <div>Phu Quoc, Viet Nam</div>
                                            <div>(123) 456-789</div>
                                            <div>resortphuquoc@gmail.com</div>
                                        </div>
                                    </div>
                                </header>
                                <main>
                                    <div class="row contacts">
                                        <div class="col invoice-to">
                                            <div class="text-gray-light">INVOICE TO:</div>
                                            <h2 class="to">${requestScope.customer.name}</h2>
                                            <div class="address">${requestScope.customer.address}</div>
                                            <div class="email"><a href="${requestScope.customer.email}">${requestScope.customer.email}</a>
                                            </div>
                                        </div>
                                        <div class="col invoice-details">
                                            <h1 class="invoice-id">${requestScope.trans.trans_id}</h1>
                                            <div class="date">Date of Invoice: ${requestScope.trans.trans_date}</div>
                                            <!--<div class="date">Due Date: 30/10/2018</div>-->
                                        </div>
                                    </div>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th class="text-left">DESCRIPTION</th>
                                                <th class="text-right">PER DAY PRICE</th>
                                                <th class="text-right">DAY</th>
                                                <th class="text-right">TOTAL</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.customer.bookings}" var="b">
                                                <tr>
                                                    <td class="no">04</td>
                                                    <td class="text-left">
                                                        <h3>
                                                            <a target="_blank" href="javascript:;">
                                                                ${b.room.roomType.typeName}
                                                            </a>
                                                        </h3>
                                                        <a target="_blank" href="javascript:;">
                                                            Room ${b.room.roomID}
                                                        </a></td>
                                                    <td class="unit">${b.room.roomType.price}</td>
                                                    <td class="qty">${b.day}</td>
                                                    <td class="total">${b.amount}</td>
                                                </tr>
                                            </c:forEach>
<!--                                            <tr>
                                                <td class="no">04</td>
                                                <td class="text-left">
                                                    <h3>
                                                        <a target="_blank" href="javascript:;">
                                                            Youtube channel
                                                        </a>
                                                    </h3>
                                                    <a target="_blank" href="javascript:;">
                                                        Useful videos
                                                    </a> to improve your Javascript skills. Subscribe and stay tuned :)</td>
                                                <td class="unit">$0.00</td>
                                                <td class="qty">100</td>
                                                <td class="total">$0.00</td>
                                            </tr>
                                            <tr>
                                                <td class="no">01</td>
                                                <td class="text-left">
                                                    <h3>Website Design</h3>Creating a recognizable design solution based on the company's existing visual identity</td>
                                                <td class="unit">$40.00</td>
                                                <td class="qty">30</td>
                                                <td class="total">$1,200.00</td>
                                            </tr>
                                            <tr>
                                                <td class="no">02</td>
                                                <td class="text-left">
                                                    <h3>Website Development</h3>Developing a Content Management System-based Website</td>
                                                <td class="unit">$40.00</td>
                                                <td class="qty">80</td>
                                                <td class="total">$3,200.00</td>
                                            </tr>
                                            <tr>
                                                <td class="no">03</td>
                                                <td class="text-left">
                                                    <h3>Search Engines Optimization</h3>Optimize the site for search engines (SEO)</td>
                                                <td class="unit">$40.00</td>
                                                <td class="qty">20</td>
                                                <td class="total">$800.00</td>
                                            </tr>-->
                                        </tbody>
                                        <tfoot>
<!--                                            <tr>
                                                <td colspan="2"></td>
                                                <td colspan="2">SUBTOTAL</td>
                                                <td>$5,200.00</td>
                                            </tr>-->
<!--                                            <tr>
                                                <td colspan="2"></td>
                                                <td colspan="2">TAX 25%</td>
                                                <td>$1,300.00</td>
                                            </tr>-->
                                            <tr>
                                                <td colspan="2"></td>
                                                <td colspan="2">GRAND TOTAL</td>
                                                <td>$${requestScope.trans.total}</td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    
                                    <div class="notices">
                                        <div>NOTICE:</div>
                                        <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
                                    </div>
                                </main>
                                <footer>Invoice was created on a computer and is valid without the signature and seal.</footer>
                            </div>
                            <!--DO NOT DELETE THIS div. IT is responsible for showing footer always at the bottom-->
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <style type="text/css">
            body{margin-top:20px;
                 background-color: #f7f7ff;
            }
            #invoice {
                padding: 0px;
            }

            .invoice {
                position: relative;
                background-color: #FFF;
                min-height: 680px;
                padding: 15px
            }

            .invoice header {
                padding: 10px 0;
                margin-bottom: 20px;
                border-bottom: 1px solid #0d6efd
            }

            .invoice .company-details {
                text-align: right
            }

            .invoice .company-details .name {
                margin-top: 0;
                margin-bottom: 0
            }

            .invoice .contacts {
                margin-bottom: 20px
            }

            .invoice .invoice-to {
                text-align: left
            }

            .invoice .invoice-to .to {
                margin-top: 0;
                margin-bottom: 0
            }

            .invoice .invoice-details {
                text-align: right
            }

            .invoice .invoice-details .invoice-id {
                margin-top: 0;
                color: #0d6efd
            }

            .invoice main {
                padding-bottom: 50px
            }

            .invoice main .thanks {
                margin-top: -100px;
                font-size: 2em;
                margin-bottom: 50px
            }

            .invoice main .notices {
                padding-left: 6px;
                border-left: 6px solid #0d6efd;
                background: #e7f2ff;
                padding: 10px;
            }

            .invoice main .notices .notice {
                font-size: 1.2em
            }

            .invoice table {
                width: 100%;
                border-collapse: collapse;
                border-spacing: 0;
                margin-bottom: 20px
            }

            .invoice table td,
            .invoice table th {
                padding: 15px;
                background: #eee;
                border-bottom: 1px solid #fff
            }

            .invoice table th {
                white-space: nowrap;
                font-weight: 400;
                font-size: 16px
            }

            .invoice table td h3 {
                margin: 0;
                font-weight: 400;
                color: #0d6efd;
                font-size: 1.2em
            }

            .invoice table .qty,
            .invoice table .total,
            .invoice table .unit {
                text-align: right;
                font-size: 1.2em
            }

            .invoice table .no {
                color: #fff;
                font-size: 1.6em;
                background: #0d6efd
            }

            .invoice table .unit {
                background: #ddd
            }

            .invoice table .total {
                background: #0d6efd;
                color: #fff
            }

            .invoice table tbody tr:last-child td {
                border: none
            }

            .invoice table tfoot td {
                background: 0 0;
                border-bottom: none;
                white-space: nowrap;
                text-align: right;
                padding: 10px 20px;
                font-size: 1.2em;
                border-top: 1px solid #aaa
            }

            .invoice table tfoot tr:first-child td {
                border-top: none
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0px solid rgba(0, 0, 0, 0);
                border-radius: .25rem;
                margin-bottom: 1.5rem;
                box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
            }

            .invoice table tfoot tr:last-child td {
                color: #0d6efd;
                font-size: 1.4em;
                border-top: 1px solid #0d6efd
            }

            .invoice table tfoot tr td:first-child {
                border: none
            }

            .invoice footer {
                width: 100%;
                text-align: center;
                color: #777;
                border-top: 1px solid #aaa;
                padding: 8px 0
            }

            @media print {
                .invoice {
                    font-size: 11px !important;
                    overflow: hidden !important
                }
                .invoice footer {
                    position: absolute;
                    bottom: 10px;
                    page-break-after: always
                }
                .invoice>div:last-child {
                    page-break-before: always
                }
            }

            .invoice main .notices {
                padding-left: 6px;
                border-left: 6px solid #0d6efd;
                background: #e7f2ff;
                padding: 10px;
            }
        </style>

        <script type="text/javascript">

        </script>

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
