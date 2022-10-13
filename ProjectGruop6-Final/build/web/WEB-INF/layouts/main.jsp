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
        <!--<link href="D:\FPT\CN5\SWP\ProjectFEP\SWP391-Group6\ProjectGruop6-Final\web\WEB-INF\layouts\main.css" rel="stylesheet" type="text/css">-->
        <!--<link href="main.css" rel="stylesheet" type="text/css"/>-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Header starts */
            /*            @media screen and (max-width: 768px) {
                            . {
                                display: none;
                            }
                        }*/

            header {
                /*margin-top: 20px;*/
                padding-top: 5px;
                padding-right: 0px;
                background-color: orange;
                margin-bottom: 10px;
            }

            .logo img {
                height: 100px;
                width: 100px;
                border-radius: 50%;
            }

            .header__content {
                /*padding: 5px;*/
                margin: 10px 0 20px 0;
                /*width: 100%;*/
            }

            .header__content ul {
                width: 100%;
                /*padding-right: 80px;*/
            }

            header li {
                list-style: none;
                padding-top: 10px;
            }

            header button {
                /*height: 50px;*/
                /*width: 100px;*/
                /*margin-top: 25px;*/
                border:none;
                background-color: orange;
            }

            header .header__content a{
                color: black;
                font-weight: 450;
            }

            header .header__content a:hover {
                color: gray;
                text-decoration: none;
            }

            i {
                margin-right: 4px;
            }

            .category a {
                color: black;
            }

            .category a:hover {
                color: gray;
                text-decoration: none;
            }

            header .category {
                /*margin-top: 20px;*/
                padding-bottom: 5px;
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

            .search {
                display: flex;
                position: relative;
                /*padding: 2px 0 2px 0;*/
                width: 100%;
                height: 40px;
                background: #fff;
                border-radius: 60px;
                box-shadow: 0 0 0 5px #ffba00;
                border: none;
                outline: none;
            }

            .input-search{
                border-radius: 0 50% 50% 0;
                width: 680px;
                height: 100%;
            }

            .search input {
                border-radius: 0 50% 50% 0;
                position: absolute;
                /*top: 0;*/
                width: 100%;
                height: 100%;
                /*left: 0;*/
                border: none;
                outline: none;
                font-size: 18px;
            }

            .search-icon {
                /*justify-content: center;*/
                background-color: #FFFFFF;
                padding: 7px;
                border-radius: 50% 0 0 50%;
                hight: 36px;
                width: 36px;
                light: 0;
                top: 0;
                bottom: 0;

            }

            .search-result-layer {
                display: none;
                background-color: #fff;
                width: 80%;
                margin-top: 5px;
            }
            .search-result-layer li {
                cursor: pointer;
                padding: 5px 10px;
            }
            .search-result-layer li:hover {
                background-color: #fafafa;
            }
            .flex-grow-2{
                width: 20%;
            }
            .flex-wrap{
                flex-wrap: wrap;
            }
            /*==============================================================================*/
            .container-account {
                display: inline; 
                position: relative;
            }

            .user-dropdown {
                display: none;
            }

            .container-account:hover .user-dropdown {
                display: block;
            }

            .account-link {
                display: flex;
                height: 40px;
                width: 40px;
                text-decoration: none;
            }

            .container-cart .cart-btn,
            .container-account {
                font-size: 20px;
                padding: 5px 5px 5px 15px;
            }

            .account-btn {
                display: flex;
            }

            .item-text {
                white-space: nowrap;
                display: flex;
                flex-direction: column;
            }

            .user-dropdown {
                position: absolute;
                border: 1px solid rgb(239, 239, 239);
                width: auto;
                border-radius: 3px;
                box-shadow: rgb(0 0 0 / 18%) 0px 6px 12px 0px;
                padding: 0;
                box-shadow: rgb(0 0 0 / 18%) 0px 6px 12px 0px;
                background: rgb(255, 255, 255);
                top: 70px;
                left: -30px;
            }

            .user-dropdown p:hover {
                background-color: rgb(245, 244, 245);
                color: rgb(0, 0, 0);
                font-size: 12px;
            }

            .user-dropdown p {
                cursor: pointer;
                /* display: flex; */
                /* align-items: center; */
                text-align: center;
                min-width: 200px;
                margin: 0;
                padding: 8px 20px;
                color: rgb(51, 51, 51);
                font-size: 12px;
                font-weight: 400;
                text-decoration: none;
            }

            .user-dropdown a:hover {
                opacity: 0.95;
            }

            .user-dropdown a {
                text-decoration: none;
                display: flex;
                color: rgb(51, 51, 51);
                font-size: 12px;
                font-weight: 400;
                align-items: center;
                cursor: pointer;
                padding: 10px 10px;
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

            footer .footer__right {
                font-size: 30px;
                line-height: 100px;
            }

            footer .footer__right a {
                height: 30px;
                width: 30px;
                cursor: pointer;
            }

            footer .footer__right i{
                height: 30px;
                width: 30px;
            }

            /*==============================================================================*/
        </style>

    </head>
    <body>

        <!--header-->

        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <header>
            <div class="container">
                <div class="row">
                    <div class="header__left col-md-2">
                        <a class="logo" href="<c:url value="/home/main.do"/>">
                            <img src="<c:url value="/images/FBT.jpg"/>" alt="">
                        </a>
                    </div>
                    <div class="col-md-8">
                        <div class="header__content d-flex justify-content-around">
                            <button ><a href="<c:url value="/home/main.do"/>"><i class="fas fa-home icon-header"></i>Trang chủ</a></button>
                            <button ><a href="<c:url value="/order/stored.do"/>"><i class="fas fa-table"></i>Quản lý tin</a></button>
                            <button ><a href="<c:url value="/home/uploadProduct.do"/>"><i class="fa-sharp fa-solid fa-file-pen"></i>Đăng tin</a></button>
                            <button ><a href="<c:url value="/order/history.do"/>"><i class="fa-sharp fa-solid fa-clipboard"></i>Đơn hàng</a></button>

                            <button style="display: ${sessionScope.user.roleId== 1 or sessionScope.user.roleId== 2 ? "block":"none"}"><a href="<c:url value="/admin/productAuthen.do"/>"><i class="fas fa-user-shield"></i>Duyệt</a></button>

                            <button ><a href="<c:url value="/cart/cart.do"/>"><i class="fa-solid fa-cart-shopping"></i>Giỏ hàng</a></button>
                            <c:if test ="${sessionScope.user == null}">
                                <button ><a href="<c:url value="/user/login.do"/>"><i class="fa-sharp fa-solid fa-right-to-bracket"></i>Đăng nhập</a></button>
                            </c:if>                            
                        </div>
                        <div class="search">
                            <div class="search-icon">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <form action="searchProduct.do"  class="input-search">
                                <input  class="position-relative" name="name" onclick="showLayer()" oninput="searchAjax(this)" type="text" placeholder="Tìm kiếm sản phẩm " id="searchInput">   
                                <div class="position-absolute search-result-layer">
                                </div>
                                <input type="submit" hidden>
                            </form>

                        </div>
                    </div>
                    <div class="col-md-2">
                        <c:if test ="${sessionScope.user != null}">
                            <div class="container-account">
                                <div class="account-link">
                                    <a class="account-link" href="#" >
                                        <img style="border-radius: 50%;" src="${sessionScope.user.avatarLink}" alt="">
                                    </a>

                                    <div class="account-btn">
                                        <div>
                                            <span class="item-text">
                                                <span class="account-title" style="font-size: 80%; padding: 5px;">${sessionScope.user.firstName} ${sessionScope.user.lastName}</span>
                                            </span>
                                        </div>
                                        <div class="user-dropdown">
                                            <a href="<c:url value="/user/userInformation.do"/>">
                                                <p>Tài khoản của tôi</p
                                            </a>
                                            <a href="<c:url value="/user/logout.do"/>">
                                                <p>Đăng xuất</p>
                                            </a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </c:if>
                    </div>

                </div>

                <div class="category">
                    <div class="container">
                        <ul class="d-flex justify-content-between flex-wrap">
                            <c:forEach items="${sessionScope.cateList}" var="i">
                                <li class='flex-grow-2'>
                                    <a href="<c:url value="/home/productList.do?cateId=${i.cateId}"/>">
                                        ${i.icon}
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
        <footer>
            <div class="container">
                <div class="row">
                    <div class="footer__left col-lg-10 col-md-9 col-sm-8">
                        <p class="txt_footer">
                            Công ty TNHH F.E.P<br>
                            Điện thoại: 09999999999<br>
                            Copyrights &copy; by SWP391 Class. All Rights Reserved.
                        </p>
                    </div>

                    <div style="width: " class="footer__right col-lg-2 col-md-3 col-sm-4">
                        <a href="<c:url value="https://www.facebook.com/fptaround"/>" target="_blank"><i style="color: blue" class="fa-brands fa-facebook"></i></a>
                        <a href="<c:url value="https://www.instagram.com/fptuniversityhcm/"/>" target="_blank"><i style="color: pink" class="fa-brands fa-instagram"></i></a>
                        <a href="<c:url value="https://www.youtube.com/c/FPTUniversityHCM"/>" target="_blank"><i style="color: red" class="fa-brands fa-youtube"></i></a>
                    </div>
                </div>

            </div>

        </footer>
    </body>

    <script>
        const searchResultLayer = document.querySelector(".search-result-layer");
        const searchBar = document.querySelector(".search");
        const showLayer = () => {
            searchResultLayer.style.display = "block";
            searchResultLayer.offsetWidth = searchBar.offsetWidth;
        }
        window.addEventListener("click", (e) => {
            if (searchResultLayer.style.display == "block" && e.target !== searchBar) {
                searchResultLayer.style.display = "none"
            }
        })
        const searchAjax = (el) => {
            const value = el.value
            $.ajax("/ProjectGroup6/GetProductAjax", {
                data: {
                    func: "getSearchResult",
                    productName: value
                },
                success: function (data) {
                    searchResultLayer.innerHTML = "";
                    console.log(data)
                    data.forEach(i => {
                        console.log("<li onclick='this.querySelector('a').click()'>" +
                                '<a href="/ProjectGroup6/home/productDetail.do?productId=' + i.productId + '">' + i.name + '</a>' +
                                '</li>')
                        searchResultLayer.innerHTML += "<li onclick='this.querySelector('a').click()'>" +
                                '<a href="/ProjectGroup6/home/productDetail.do?productId=' + i.productId + '">' + i.name + '</a>' +
                                '</li>'
                    })
                }
            })
        }
    </script>
</html>