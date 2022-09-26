<%-- 
    Document   : main
    Created on : Jun 7, 2022, 9:02:45 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Layout Demo</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link href="../layouts/js/main.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <script src="https://kit.fontawesome.com/1d58ef5eb1.js" crossorigin="anonymous"></script>
        <style><%@include file="/WEB-INF/layouts/js/main.css"%></style>






    </head>
    <body>
        <div style="width: 100%; height: 500px">
            <!--header-->
            <div class="top-container">

                <h1>Vector.</h1>
                <div class="left-top-container">
                    <div>
                        <i class="fa fa-check-circle"></i>
                        <span>Market|</span>
                    </div>
                    <div>
                        <i class="fa fa-globe"></i>
                        <span>Group edition</span>
                    </div>
                </div>

            </div>

            <div class="header">
                <!-- HEADER -->
                <div class="container">
                    <div class="top-header">
                        <div class="row content-header">
                            <div class="col-md-2 logo-container">

                                <a href="#home">
                                    <div class="logo-content">
                                        <img id="myImage" src="<c:url value="/images/logo_goodMarket.png"/>" alt="">
                                    </div>
                                </a>

                            </div>
                            <div class="col-md">

                                <!-- Các options trên header -->
                                <div class="options-header">
                                    <!-- HOME -->
                                    <div class="style-options-header hover">
                                        <a href="#home">
                                            <i class="fas fa-home"></i>
                                            <span>Trang chủ</span>
                                        </a>
                                    </div>

                                    <!-- Quản lí thông tin -->
                                    <div class="style-options-header hover">
                                        <a href="#quanLiTin">
                                            <i class="fas fa-table"></i>
                                            <span>Quản lí tin</span>
                                        </a>
                                    </div>

                                    <!-- Đơn hàng -->
                                    <div class="style-options-header hover">
                                        <a href="#DonHang">
                                            <i class="fas fa-shopping-cart"></i>
                                            <span>Đơn hàng</span>
                                        </a>
                                    </div>

                                    <!-- ADMIN -->
                                    <div class="style-options-header hover admin-box">
                                        <a href="#ADMIN">
                                            <i class="fas fa-user-shield"></i>
                                            <span class="admin">ADMIN</span>
                                        </a>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- Search, login -->
                    <div class="sub-header">
                        <div style="width: 100%;">
                            <div class="search">
                                <div class="icon"> </div>
                                <div class="input">
                                    <input type="text" placeholder="TÌm kiếm sản phẩm" id="searchInput">
                                </div>
                                <span class="close-search"></span>
                            </div>
                        </div>
                        <div class="login-status ">
                            <div class="login style-options-header hover">
                                <div class="login-content">
                                    <a href="#account">
                                        <i class="far fa-user"></i>
                                        <span>Login</span>
                                    </a>
                                </div>
                            </div>
                            <div class="post-status style-options-header hover">
                                <div class="post-status-content">
                                    <a href="#post">
                                        <i class="fas fa-comment-alt"></i>
                                        <span>Đăng tin
                                        </span></a>

                                </div>
                            </div>
                        </div>
                    </div>

                    <ul class="nav-list">
                        <li class="nav-item hover">
                            <a class="nav-link" href="#"><i class="fas fa-mobile-alt"></i> Điện thoại</a>
                        </li>
                        <li class="nav-item hover">
                            <a class="nav-link" href="#"><i class="fas fa-laptop"></i> Laptop</a>
                        </li>
                        <li class="nav-item hover">
                            <a class="nav-link" href="#"><i class="fas fa-tablet"></i> Tablet</a>
                        </li>
                        <li class="nav-item hover">
                            <a class="nav-link" href="#"><i class="fas fa-microchip"></i> Phụ kiện <i
                                    class="fas fa-caret-down"></i></a>
                        </li>
                        <li class="nav-item hover">
                            <a class="nav-link" href="#"> <i class="fab fa-algolia"></i> Đồng hồ thông minh</a>
                        </li>
                        <li class="nav-item hover">
                            <a class="nav-link" href="#"><i class="fab fa-battle-net"></i> Đồng hồ thời trang</a>
                        </li>
                        <li class="nav-item hover">
                            <a class="nav-link" href="#"> <i class="fas fa-desktop"></i> PC,máy in <i
                                    class="fas fa-caret-down"></i></a>
                        </li>
                        <li class="nav-item hover">
                            <a class="nav-link" href="#">Máy cũ, giá rẻ</a>
                        </li>
                        <li class="nav-item hover">
                            <a class="nav-link" href="#">Sim, thẻ cào</a>
                        </li>
                        <li class="nav-item hover">
                            <a class="nav-link" href="#">Trả góp, điện nước</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--content-->
        <div>

            <!--Including view-->
            <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp"/>

        </div>


        <!--footer-->            
        <footer class="text-center">
            <div class="container">
                <p class="txt_footer">
                    Công ty TNHH F.E.P<br>
                    Điện thoại:09999999999<br>
                    Gmail: chaydeadlinededithuctap@fep.com<br>
                    Copyrights &copy; by SWP391 Class. All Rights Reserved.
                </p>
            </div>

        </footer>

    </body>
    <script><%@include file="/WEB-INF/layouts/js/main.js"%></script>
</html>