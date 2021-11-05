<%-- 
    Document   : login
    Created on : Oct 23, 2021, 2:35:08 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:set var = "contextPath" value="${pageContext.request.contextPath}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${contextPath}/css/login.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/util.css" rel="stylesheet" type="text/css"/>
        <link href="${contextPath}/css/fontawesome-free-5.15.4-web/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100" style="background-image: url(${contextPath}/images/bg_1.jpg);">
                <div class="wrap-login100">

                    <br>
                    <form class="login100-form validate-form" action="login" method="POST">
                        <span class="login100-form-logo">
                            <img src="${contextPath}/images/images.png" class="logo-img" alt="Logo">
                        </span>

                        <span class="login100-form-title p-b-34 p-t-27">
                            Sign In
                        </span>

                        <div class="wrap-input100 validate-input" data-validate="Enter username">
                            <i class="far fa-user-circle "></i>
                            <input class="input100" type="text" name="user" placeholder="Username">
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <i class="fas fa-lock "></i>
                            <input class="input100" type="password" name="pass" placeholder="Password">
                        </div>

                        <div class="contact100-form-checkbox">
                            <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                            <label class="label-checkbox100" for="ckb1">
                                Remember me
                            </label>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Login
                            </button>
                        </div>

                        <div class="text-center p-t-90">
                            <a class="txt1" href="#">
                                Forgot Password?
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="${contextPath}/vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="${contextPath}/vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="${contextPath}/vendor/bootstrap/js/popper.js"></script>
        <script src="${contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="${contextPath}/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="${contextPath}/vendor/daterangepicker/moment.min.js"></script>
        <script src="${contextPath}/vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="${contextPath}/vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="${contextPath}/js/main.js"></script>
    </body>
</html>
