<%-- 
    Document   : productDetail
    Created on : Sep 14, 2022, 3:38:49 AM
    Author     : ADmin
--%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>

        <style>

            .link {
                padding-top: 10px;
                margin-bottom: 10px;
            }

            .link a {
                font-size: 18px;
            }
            .buy button {
                background-color: #FFA500;
                transition: 0.5s;
                background-size: 200%;
                color: white;
                box-shadow: 0 0 20px #eee;
                border-radius: 30px;
                border: #eee;
                height: 50px;
                width: 350px;
            }

            .buy button:hover {
                background-position: right center;
                color: #fff;
                text-decoration: none;
                cursor: pointer;
            }

            .button_1{
                margin-top: 50px;
                margin-bottom: 20px;
            }

            p{
                font-size: 20px;
                margin: 2px;
                padding: 2px;
            }

            .font-bold {
                font-size: 20px;
                font-weight: 500;
            }

            .font-bold {
                font-weight: 500;
            }

            .font-a a{
                color: #FFA500;
                text-decoration: none;
            }

            a:hover {
                color: none;
                text-decoration: none;
            }

            body {
                background-color: #F0F0F0;
                height: auto;
            }

            .br-form {
                background: #FFFFFF;
                padding: 10px;
                border-radius: 3px;
                margin-bottom: 10px;
            }

            .avatar {
                height: 50px;
                width: 50px;
                border-radius: 50%;
                margin-right: 20px;
            }

            .avatar img{
                width: 100%;
                border-radius: 50%;
            }

            .reviewer {
                height: 40px;
                width: 40px;
                border-radius: 50%;
                margin-right: 10px;
            }

            .reviewer img{
                width: 100%;
                border-radius: 50%;
            }

            .review {
                padding: 10px;
                border-bottom: 1.5px solid rgba(0,0,0,.09);
            }

            .star{
                color: #FFA500;
                font-size:20px;
            }

            .star-s{
                color: #FFA500;
                font-size:15px;
            }

            .product__item {
                /*background-color: #FFE5CC;*/
                background-color: #ffefd5 ;
                margin-bottom: 10px;
                width: 100%;
                height: 250px;
                transition: 0.5s;
                border-radius: 5px;
            }

            .product__item a {
                color: black;
                font-size: 18px;
            }

            .product__item img {
                width: 180px;
                transition: 0.5s;
                height: 70%;
            }

            .product__item a:hover {
                color: #FFA500;
                text-decoration: none;
            }

            .product__item div {
                padding: 0 10px;
                font-size: 20px;
                color: red;
            }

            .img-nav-btn{
                width: 50px; 
                height: 50px; 
                background: #ccc; 
                border-radius: 50%;
                opacity: 0.8;
            }
            .carousel-control-next:focus, 
            .carousel-control-prev:focus{
            }
            .carousel-control-next:hover, .carousel-control-prev:hover{
                opacity: 1;
            }

            .hinden-text {
                margin: 0;
                font-size: 16px;
                padding: 3px;
                width: 100%;
                overflow: hidden;
                white-space: nowrap; 
                text-overflow: ellipsis;
                border-bottom: 1.5px solid rgba(0,0,0,.09);
            }

            .tooltip-text {
                text-decoration:none;
                position:relative;
            }
            .tooltip-text span {
                display:none;
            }
            .tooltip-text:hover span {
                border-radius: 3px;
                font-size: 16px;
                padding: 1px 5px;
                display: block;
                position:fixed;
                overflow:hidden;
                background-color: #35363A;
                color: #CCC;
                z-index: 1000;
                white-space: nowrap;
            }
        </style>
    </head>
    <body>
        <div class="container" >
            <div class="br-form">
                <div class="product__content">
                    <div class="row">
                        <div id="demo" class="carousel slide col-lg-6 col-md-6 col-sm-6" data-ride="carousel">
                            <!-- The slideshow -->
                            <div class="carousel-inner">
                                <c:forEach items="${product.imgList}" varStatus="count" var="i">
                                    <c:if test ="${count.index == 0}">
                                        <div class="carousel-item active">
                                            <img class="img-fluid" src="<c:url value="${i.url}"/>">
                                        </div>
                                    </c:if>
                                    <div class="carousel-item">
                                        <img class="img-fluid" src="<c:url value="${i.url}"/>">
                                    </div>
                                </c:forEach>
                                <ul class="carousel-indicators" style="bottom: 0; margin: 0;background-color: #FFA500;width: 100%;">
                                    <c:forEach items="${product.imgList}" varStatus="count" var="i">
                                        <script>
                                            console.log(${count.index})
                                        </script>
                                        <li data-target="#demo" data-slide-to="${count.index } " class="${count.index  == 0 ? "active" : ""}"></li>
                                        </c:forEach>

                                </ul>
                                <!-- Left and right controls -->
                                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                    <div class="d-flex justify-content-center align-items-center img-nav-btn">
                                        <i class="m-0 fa-solid fa-chevron-left "></i>
                                    </div>
                                </a>
                                <a class="carousel-control-next" href="#demo" data-slide="next">
                                    <div class="d-flex justify-content-center align-items-center img-nav-btn" >
                                        <i class="m-0 fa-solid fa-chevron-right "></i>
                                    </div>
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <h3>${product.name}</h3>
                            <div style="display: flex;">
                            </div>
                            <p>Số lượng sản phẩm: <span class="font-bold">${product.quantity}</span><p/>
                            <h2 style="color: #E72425; text-align: right; margin-right: 20px;">
                                <fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber  type = "currency" value="${product.price}"/></h2>
                            <div class="buy d-flex justify-content-around" style="margin: 50px 0 20px 0;">
                                <button onclick="window.location.href = '<c:url value="/admin/approvingProduct.do?productId=${product.productId}&acction=Yes"/>'">Duyệt</button>
                                <button onclick="window.location.href = '<c:url value="/admin/approvingProduct.do?productId=${product.productId}&acction=No"/>'">Không Duyệt</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="br-form">
                <h5>Thông tin người bán</h5>
                <div style="display: flex">
                    <div class="col-md-5 col-sm-5 font-a" style="display: flex">
                        <a href="<c:url value="/home/main.do"/>" class="avatar">
                            <img src="<c:url value="${seller.avatarLink}"/>" alt="">
                        </a>
                        <p><a href="#">${seller.firstName} ${seller.lastName}</a></p>
                    </div>
                    <div class="col-md-7 col-sm-7">
                        <p>Số điện thoại: <span>${seller.phone}</span></p>

                    </div>

                </div><p>Địa chỉ: <span>${seller.address.houseNumber} ${seller.address.wardName}
                        ${seller.address.districtName} ${seller.address.cityName}</span></p>
            </div>

            <div class="br-form">
                <h5>Mô tả chi tiết: </h5>
                <p style="padding: 10px 0 10px 0;">${product.description}</p>
            </div>
        </div>
    </body>

</html>