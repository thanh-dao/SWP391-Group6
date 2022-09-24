<%-- 
    Document   : main
    Created on : Jun 7, 2022, 9:02:45 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Layout Demo</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            body {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Header starts */
            header {
                padding-right: 0px;
                background-color: orange;
                margin-bottom: 50px;
            }

            header .logo a {
                height: 120px;
                width: 120px;
                margin-top: 15px;
            }

            header .logo img {
                height: 120px;
                width: 140px;
                border-radius: 50%;
                margin-top: 15px;
            }

            header header__right {
                width: 1000px;
            }

            .header__content {
                width: 100%;
            }

            .header__content ul {
                width: 100%;
                padding-right: 80px;
            }

            header li {
                list-style: none;
                padding-top: 10px;
            }

            header button {
                height: 50px;
                width: 140px;
                margin-top: 18px;
                border:none;
                background-color: orange;

            }

            header .header__content a{
                color: black;
                font-weight: bold;
                font-size: 17px;
            }

            header .header__content a:hover {
                color: gray;
                text-decoration: none;
            }

            .category a {
                color: black;
            }

            .category a:hover {
                color: gray;
                text-decoration: none;
            }

            header .search {
                margin-top: 20px;
            }

            header .search__input {
                width: 100%;
                margin: auto;
                height:40px;
            }

            header .category {
                margin-top: 20px;
                padding-bottom: 20px;
            }

            header .category ul {
                padding-left: 0px;
            }

            /* Header ends */
            /* Product starts */
            .product__item {
                transition: 0.5s;
            }

            .product__item:hover {
                transform: translateY(-5px);
                transition: 0.5s;
            }

            footer {
                background-color: orange;
                margin-bottom: 0px;
                padding: 20px;
                margin-top: 80px; 
            }
            .txt_footer{
                line-height: 28px;
            }
        </style>

    </head>
    <body>

        <!--header-->
        <header>
            <div class="container">
                <div class="d-flex">
                    <div class="logo">
                        <a href="<c:url value="/home/main.do"/>">
                            <img class="img-fluid" src="<c:url value="/images/FBT.jpg"/>" alt="">
                        </a>
                    </div>
                    <div class="header__right">
                        <div class="header__content d-flex justify-content-around">
                            <button><a href="<c:url value="/home/main.do"/>">Trang chủ</a></button>
                            <button><a href="<c:url value="/order/stored.do"/>">Quản lý tin</a></button>
                            <button><a href="<c:url value="/order/history.do"/>">Đơn hàng</a></button>
                            <button><a href="<c:url value="/user/login.do"/>">Đăng nhập</a></button>
                            <button><a href="<c:url value="/admin/productAuthen.do"/>">Admin</a></button>
                            <button><a href="<c:url value="/cart/cart.do"/>"><i class="fa-solid fa-cart-shopping"></i></a></button>
                            <button id="post" class="btn-grad"><a href="<c:url value="/home/uploadProduct.do"/>">Đăng tin</a></button>
                        </div>
                        <div class="search">
                            <div class="container">
                                <form action="">
                                    <input class="search__input" type="text" placeholder="Tìm kiếm"></input>    
                                </form>
                            </div>
                        </div>
                    </div>


                </div>



                <div class="category">
                    <div class="container">
                        <ul class="d-flex justify-content-between flex-wrap">

                            <c:forEach items="${cateList}" var="i">
                                <li>
                                    <a href="<c:url value="/home/productList.do?cateId=${i.cateId}"/>">
                                        <i class="fa-solid fa-mobile-screen-button"></i>
                                        <span>${i.name}</span>
                                    </a>
                                </li>
                            </c:forEach>


                        </ul>

                    </div>

                </div>
            </div>
        </header>

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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
                integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- counting up -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"
                integrity="sha512-ZKNVEa7gi0Dz4Rq9jXcySgcPiK+5f01CqW+ZoKLLKr9VMXuCsw3RjWiv8ZpIOa0hxO79np7Ec8DDWALM0bDOaQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script src="./Counting-Up-To-Numerical-Values-On-Scroll-jQuery-Countup-js/jquery.countup.js">
        </script>


        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            $('.counter').countUp();
        </script>
    </body>

</html>