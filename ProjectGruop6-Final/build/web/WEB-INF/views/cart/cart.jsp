<%-- 
    Document   : cart
    Created on : Sep 14, 2022, 4:13:58 AM
    Author     : ADmin
--%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông tin sản phẩm</title>
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                background-color: #FFFFFF;
                height: auto;
            }

            /* Firefox */
            input[type="number"] {
                -moz-appearance: textfield;
            }

            html {
                scroll-behavior: smooth;
                font-family: Arial, Helvetica, sans-serif;
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

            .product-real-prices {
                color: #333;
            }

            .quantity-button {
                display: flex;
            }

            .quantity-button input {
                width: 15%;
                height: auto;
            }

            .style-product-cart {
                display: flex;
                align-items: center;

            }

            .delete-trash {
                color: #333;
                font-size: 20px;
                transition: 0.8s;
            }

            .delete-trash:hover {
                transform: rotate(-45deg);
                color: grey;
                transition: 0.5s;
            }

            .block-header {
                padding-left: 1rem;
                display: flex;
                justify-content: space-between;
            }

            .block-header a {
                text-decoration: none;
            }

            .customer-info {
                color: grey;
                width: auto;
            }

            .address-container {
                margin-bottom: 20px;
                padding-bottom: 20px;
                border-bottom: 0.5px solid;
            }

            .price-content span {
                color: red;
                font-weight: bold;
            }

            .btn-buy {
                background-color: #FFA500;
                margin-top: 20px;
                width: 100%;
                padding: 10px;
                color: white;
                text-transform: uppercase;
                font-weight: 600;
                box-shadow: rgb(0 0 0 / 17%) 0px -23px 25px 0px inset, rgb(0 0 0 / 15%) 0px -36px 30px 0px inset, rgb(0 0 0 / 10%) 0px -79px 40px 0px inset, rgb(0 0 0 / 6%) 0px 2px 1px, rgb(0 0 0 / 9%) 0px 4px 2px;
                border-radius: 50px;
            }

            .btn-buy::after {
                position: relative;
                content: "\276f";
                padding: 0.5em;
                right: 0;
                transition: 0.5s;
            }

            .btn-buy:hover {
                background: #f69679;
            }

            .btn-buy:hover::after {
                right: -10px;
                transition: 0.15s linear;
            }

            .delete-icon {
                padding-left: 8%;
            }

            .btn-style-left {
                font-weight: bold;
                /* font-size: 1rem; */
                color: #3d3a3a;
                padding: 2% 6%;
                border: 3px solid #ffffff;
                border-radius: 12px 0px 0px 12px;
            }

            .btn-style-right {
                font-weight: bold;
                color: #3d3a3a;
                padding: 2% 6%;
                border: 3px solid #ffffff;
                border-radius: 0px 12px 12px 0px;
            }

            .ip-qua-style {
                text-align: center;
                color: #3d3a3a;
                border: 3px solid #ffffff;
            }

            .br-form {
                height: auto;
                padding: 5px;
                padding-bottom: 3%;
                background: #F0F0F0;
                border-radius: 5px;
            }

            .txt-style {
                padding: 0 0 8px 8px;
            }

            .title-style {
                font-weight: bold;
                padding: 8px
            }

            .font-bold {
                font-weight: 500;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="cart-content">
                <div class="row">
                    <div class="col-md-8">
                        <div class="br-form">
                            <div class="block-header" style="padding: 10px;">
                                <h3>Giỏ hàng</h3>
                            </div>
                            <table style="margin-bottom: 1rem;">
                                <thead>                                  
                                    <tr row>
                                        <th><input type="checkbox" name=""></th>
                                        <th class="col-md-6 col-5">Sản phẩm</th>
                                        <th class="col-md-3 col-3">Đơn giá</th>
                                        <th class="col-md-3 col-4">Số lượng</th>
                                    </tr>
                                </thead>
                            </table>

                            <table class="table table-striped ">
                                <c:forEach items="${order.getOrderByShopList()}" var="i">
                                    <thead>                                  
                                        <tr row>
                                            <th><input type="checkbox" name=""></th>
                                            <th class="col-md-6 col-5">${i.getName()}</th>
                                            <th class="col-md-3 col-3"></th>
                                            <th class="col-md-3 col-4"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${i.getOrderDetailList()}" var="p">
                                            <tr>
                                                <th><input type="checkbox" name=""></th>
                                                <td style="margin: 0">
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
                                                            <div class="product-img">
                                                                <picture> <img src="<c:url value="/images/690x400.png"/>" alt="">
                                                                </picture>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 font-bold">
                                                            <a href="">${p.getName()}</a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                        <fmt:setLocale value="vi_VN" />
                                        <span class="product-real-prices">
                                            <fmt:formatNumber type="currency" value="">Giá bán</fmt:formatNumber>
                                        </span>
                                        </td>
                                        <td>
                                            <div class="quantity-button">
                                                <button class="btn-style-left">-</button>
                                                <input class="ip-qua-style" value=${p.getQuantity()}>
                                                <button class="btn-style-right">+</button>
                                                <div class=" style-product-cart delete-icon"
                                                     style="justify-content: center">
                                                    <a class="show-cart" style="color: white"><i
                                                            class="fas fa-trash delete-trash"></i></a>
                                                </div>
                                            </div>
                                        </td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <th><input type="checkbox" name=""></th>
                                        <td style="margin: 0">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
                                                    <div class="product-img">
                                                        <picture> <img src="<c:url value="/images/690x400.png"/>" alt="">
                                                        </picture>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 font-bold">
                                                    <a href="">Tên Sản Phẩm</a>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                    <fmt:setLocale value="vi_VN" />
                                    <span class="product-real-prices">
                                        <fmt:formatNumber type="currency" value="">Giá bán</fmt:formatNumber>
                                    </span>
                                    </td>
                                    <td>
                                        <div class="quantity-button">
                                            <button class="btn-style-left">-</button>
                                            <input class="ip-qua-style" value="1">
                                            <button class="btn-style-right">+</button>
                                            <div class=" style-product-cart delete-icon"
                                                 style="justify-content: center">
                                                <a class="show-cart" style="color: white"><i
                                                        class="fas fa-trash delete-trash"></i></a>
                                            </div>
                                        </div>
                                    </td>
                                    </tr>
                                    <tr>
                                        <th><input type="checkbox" name=""></th>
                                        <td style="margin: 0">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
                                                    <div class="product-img">
                                                        <picture> <img src="<c:url value="/images/690x400.png"/>" alt="">
                                                        </picture>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 font-bold">
                                                    <a href="">Tên Sản Phẩm</a>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                    <fmt:setLocale value="vi_VN" />
                                    <span class="product-real-prices">
                                        <fmt:formatNumber type="currency" value="">Giá bán</fmt:formatNumber>
                                    </span>
                                    </td>
                                    <td>
                                        <div class="quantity-button">
                                            <button class="btn-style-left">-</button>
                                            <input class="ip-qua-style" value="1">
                                            <button class="btn-style-right">+</button>
                                            <div class=" style-product-cart delete-icon"
                                                 style="justify-content: center">
                                                <a class="show-cart" style="color: white"><i
                                                        class="fas fa-trash delete-trash"></i></a>
                                            </div>
                                        </div>
                                    </td>
                                    </tr>
                                    </tbody>
                                </c:forEach>
                            </table>
                            <!--l===========================================================================-->
                            <table class="table table-striped ">
                                <thead>                                  
                                    <tr row>
                                        <th><input type="checkbox" name=""></th>
                                        <th class="col-md-6 col-5">Tên người bán 2</th>
                                        <th class="col-md-3 col-3"></th>
                                        <th class="col-md-3 col-4"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th><input type="checkbox" name=""></th>
                                        <td style="margin: 0">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
                                                    <div class="product-img">
                                                        <picture> <img src="<c:url value="/images/690x400.png"/>" alt="">
                                                        </picture>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 font-bold">
                                                    <a href="">Tên Sản Phẩm</a>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                <fmt:setLocale value="vi_VN" />
                                <span class="product-real-prices">
                                    <fmt:formatNumber type="currency" value="">Giá bán</fmt:formatNumber>
                                </span>
                                </td>
                                <td>
                                    <div class="quantity-button">
                                        <button class="btn-style-left">-</button>
                                        <input class="ip-qua-style" value="1">
                                        <button class="btn-style-right">+</button>
                                        <div class=" style-product-cart delete-icon"
                                             style="justify-content: center">
                                            <a class="show-cart" style="color: white"><i
                                                    class="fas fa-trash delete-trash"></i></a>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name=""></th>
                                    <td style="margin: 0">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
                                                <div class="product-img">
                                                    <picture> <img src="<c:url value="/images/690x400.png"/>" alt="">
                                                    </picture>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 font-bold">
                                                <a href="">Tên Sản Phẩm</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                <fmt:setLocale value="vi_VN" />
                                <span class="product-real-prices">
                                    <fmt:formatNumber type="currency" value="">Giá bán</fmt:formatNumber>
                                </span>
                                </td>
                                <td>
                                    <div class="quantity-button">
                                        <button class="btn-style-left">-</button>
                                        <input class="ip-qua-style" value="1">
                                        <button class="btn-style-right">+</button>
                                        <div class=" style-product-cart delete-icon"
                                             style="justify-content: center">
                                            <a class="show-cart" style="color: white"><i
                                                    class="fas fa-trash delete-trash"></i></a>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                <tr>
                                    <th><input type="checkbox" name=""></th>
                                    <td style="margin: 0">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6">
                                                <div class="product-img">
                                                    <picture> <img src="<c:url value="/images/690x400.png"/>" alt="">
                                                    </picture>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 font-bold">
                                                <a href="">Tên Sản Phẩm</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                <fmt:setLocale value="vi_VN" />
                                <span class="product-real-prices">
                                    <fmt:formatNumber type="currency" value="">Giá bán</fmt:formatNumber>
                                </span>
                                </td>
                                <td>
                                    <div class="quantity-button">
                                        <button class="btn-style-left">-</button>
                                        <input class="ip-qua-style" value="1">
                                        <button class="btn-style-right">+</button>
                                        <div class=" style-product-cart delete-icon"
                                             style="justify-content: center">
                                            <a class="show-cart" style="color: white"><i
                                                    class="fas fa-trash delete-trash"></i></a>
                                        </div>
                                    </div>
                                </td>
                                </tr>
                                </tbody>
                                <!--l==================================================-->
                            </table>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="br-form">
                            <div class="address-container">
                                <div class="block-header" style="padding: 10px;">
                                    <h3>Giao đến</h3>
                                    <a href="<c:url value="/cart/shipInformation.do"/>">Thay đổi</a>
                                </div>
                                <div class="txt-style">
                                    <div>
                                        <span class="font-bold">Họ và tên: </span><span>${user.firstName} ${user.lastName}</span>
                                    </div>
                                    <div>
                                        <span class="font-bold">Số điện thoại: </span><span>${user.phone}</span><br>
                                    </div>
                                    <div>
                                        <span class="font-bold">Địa chỉ: </span>
                                        <span class="customer-info">
                                            Địa chỉ nhận hàng
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <!-- thanh toán -->
                            <span class="title-style">Tổng cộng</span>
                            <div class="price-content txt-style">
                                <span>Tổng</span>
                            </div>
                            <button class="btn-buy" onclick="window.location.href = '<c:url value="/cart/pay.do"/>'">Thanh Toán</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </body>

</html>