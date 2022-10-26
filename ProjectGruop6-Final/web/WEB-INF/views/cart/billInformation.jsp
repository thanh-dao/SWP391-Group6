<%-- 
    Document   : billInformation
    Created on : Sep 14, 2022, 6:48:42 AM
    Author     : ADmin
--%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            /* CSS */
            .button-22 {
                /* display: inline-block; */
                align-items: center;
                appearance: button;
                background-color: #0276FF;
                border-radius: 8px;
                border-style: none;
                box-shadow: rgba(255, 255, 255, 0.26) 0 1px 2px inset;
                box-sizing: border-box;
                color: #fff;
                cursor: pointer;
                display: flex;
                flex-direction: row;
                flex-shrink: 0;
                font-family: "RM Neue", sans-serif;
                font-size: 1;
                /* line-height: 1.15; */
                /* padding: 10px 21px; */
                text-align: center;
                text-transform: none;
                transition: color .13s ease-in-out, background .13s ease-in-out, opacity .13s ease-in-out, box-shadow .13s ease-in-out;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                max-width: 85px;
                /* height: 20px; */
                margin: 5px;
            }

            .button-22:active {
                background-color: #006AE8;
            }

            .button-22:hover {
                background-color: #1C84FF;
            }

            .br-form {
                height: auto;
                padding: 0;
                /* padding-bottom: 3%; */
                background: #F0F0F0;
                border-radius: 5px;
            }

            .font-bold {
                font-weight: 500;
            }

            .product-img {
                width: 100px;
                height: 100px;
                padding: 0;
                margin: 0;
            }

            .product-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .style-product-cart {
                display: flex;
                align-items: center;

            }

            .product-content {
                font-weight: 500;
            }

            .product-content a {
                font-weight: 400;
                text-decoration: none;
                color: rgb(17, 16, 16);
            }

            .product-content:hover a {
                color: #308DFC;
            }

            .txt-style {
                padding: 0 0 8px 8px;
            }

            .title-style {
                font-weight: bold;
                padding: 8px
            }
            i {
                font-size: 15px;
                width: 16px;
                margin-right: 12px; 
                padding: 6px;
            }
            .info_user p {
                margin-bottom: 2px;
            }
        </style>
    </head>

    <body>
        <div class="container ">
            <h4>Thông tin đơn hàng</h4>
            <div class="row">
                <div class="col-md-3">
                    <h6 class="d-flex justify-content-between">Thông tin khách hàng
                        <a href="<c:url value="/user/userInformation.do"/>">Thay đổi</a></h6>
                    <div class="info_user">
                        <div class="d-flex">
                            <i class="fa-regular fa-user"></i>
                            <p>${user.firstName} ${user.lastName}</p>
                        </div>
                        <div class="d-flex">
                            <i class="fa-regular fa-envelope"></i>
                            <p>${user.email}</p>
                        </div>
                        <div class="d-flex">
                            <i class="fa-solid fa-mobile-screen-button"></i>
                            <p>${user.phone}</p>
                        </div>
                        <div class="d-flex"><i class="fa-regular fa-address-book"></i><p>${user.address.houseNumber} -
                                ${user.address.wardName} -
                                ${user.address.districtName} -
                                ${user.address.cityName}
                            </p>
                        </div>
                    </div>
                </div>
                <!-- san pham -->
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <c:forEach items="${orderDetailList}" var="obs">
                        <div class="br-form">
                            <h6 class="d-flex">
                                <div class="mr-auto p-2">
                                    <span style="margin-right: 10px;">${obs.name}</span>
                                    <a href="#">
                                        Xem shop >>
                                    </a>
                                </div>
                                <div class="p-2">
                                    <c:choose>
                                        <c:when test = "${obs.status == 0}">
                                            <div style="color: red;">
                                                Đã hủy
                                            </div>
                                        </c:when>
                                        <c:when test = "${obs.status == 1}">
                                            <div style="color: green;">
                                                Giao hàng thành công
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div style="color: red;">
                                                Đang giao hàng
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>                                    
                                <a class="p-2" href="<c:url value="/cart/billInformation.do?os=${obs.orderByShopId}"/>">Xem chi tiết >></a>
                            </h6>
                            <c:forEach items="${obs.orderDetailList}" var="od">
                                <!--<tr class="order-link" href="<c:url value="/cart/billInformation.do"/>">-->
                                <div class="d-flex br-od">
                                    <div class="product-img p-2">
                                        <img src="<c:url value="${od.product.getMainImage().url}"/>" alt="">
                                    </div>
                                    <div class="d-flex flex-column p-2">
                                        <a href="<c:url value="/home/productDetail.do?productId=${od.product.productId}"/>">
                                            <p class="tooltip-text hinden-text">
                                                ${od.product.name}
                                                <!--<span>${od.product.name}</span>-->
                                            </p></a>
                                        x${od.quantity}
                                    </div>
                                    <p class="text-right ml-auto p-2">${od.price}</p>
                                </div>
                            </c:forEach>
                            <p class="d-flex justify-content-end" 
                               style="padding: 20px 10px; margin: 0;">
                                Tổng số tiền: 
                                ${obs.total}
                            </p>
                            <div class="d-flex justify-content-end">
                                <button type="button" class="btn btn-primary">Mua lại</button>
                                <button type="button" class="btn btn-light">Đánh giá</button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-2">
                    <div class="br-form">
                        <h6 class="title-style">Chi tiết đơn hàng: </h6>
                        <div class="txt-style">
                            <i class="fa-solid fa-truck-fast"></i><span>Đơn vị vận chuyển</span><br>
                            <i class="fa-regular fa-credit-card"></i><span>Phương thức thanh toán</span><br>
                            <h6 style="color:green; text-align:center; font-weight: 700; padding-top: 5px;">Trạng thái đơn hàng
                            </h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div type="button" style="margin:1%; display:block; text-align: center;">
            <button type="button" class="btn btn-primary" onclick="window.location.href = '<c:url value="/home/main.do"/>'">Trang chủ</button>
        </div>
    </body>

</html>