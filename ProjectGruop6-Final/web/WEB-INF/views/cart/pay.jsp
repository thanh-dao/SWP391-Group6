<%-- 
    Document   : pay
    Created on : Sep 14, 2022, 4:14:06 AM
    Author     : ADmin
--%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh Toán</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;

            }

            html {
                position: relative;
                /* overflow: hidden; */
            }

            body {
                background-color: rgb(245, 245, 250);
                /*overflow: hidden;*/

            }

            .brand {
                text-decoration: none;
                color: white;
            }

            .brand:hover {
                color: darkgrey;
            }

            .header {
                background-color: #111;
                color: white;
                position: fixed;
                z-index: 1;
                width: 100%;
                padding-bottom: 20px;
                height: 7em;
                border-bottom: 0.5px solid rgb(89, 87, 87);
                top: 0;
            }

            .top-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px;
                letter-spacing: 3px;
                margin-bottom: 10px;
                border-bottom: 0.5px solid rgb(89, 87, 87);
            }

            .top-left {
                display: flex;
            }

            .top-left .brand {
                font-weight: bolder;
            }

            .top-left .wall {
                font-weight: bold;
                color: darkgrey;
                margin-left: 10px;
            }

            .sub-name {
                display: inline;
            }

            .top-right {
                text-transform: uppercase;
            }

            .bottom-header {
                height: 50px;
                padding: 30px;
            }

            .form-search {
                display: flex;
                justify-content: center;
            }

            .container-search {
                margin-left: 10px;
            }

            .search-input {
                width: 60%;
                padding: 5px 20px;
                border-top-left-radius: 20px;
                border-bottom-left-radius: 20px;
                border: none;
                margin-bottom: 10px;
            }

            .bottom-header .search-link {
                height: 34px;
                width: 34px;
                border-top-right-radius: 20px;
                border-bottom-right-radius: 20px;
                padding: 5px 5px 5px 15px;
                color: white;
            }

            .container-cart {
                display: inline;
            }

            .cart-link {
                text-decoration: none;
                color: white;
            }

            .cart-link:hover,
            .account-link:hover {
                color: darkgrey;
            }

            .container-account {
                display: inline;
            }

            .account-link {
                width: 34px;
                height: 34px;
                text-decoration: none;
                color: white;
            }

            .container-cart .cart-btn,
            .container-account {
                font-size: 20px;
                padding: 5px 5px 5px 15px;
                margin-left: 20px;
            }

            .style-margin {
                margin-top: 50px;
                margin-bottom: 200px;
            }

            .add-card-form {
                position: absolute;
                z-index: 1;
                top: 40%;
                left: 50%;
                height: auto;
                border: 1px solid #111;
                background-color: rgb(255, 255, 255);
                border-radius: 4px;
                width: 900px;
                height: 400px;
                transform: translate(-50%, -50%);
                padding: 20px 40px;
                box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
            }

            .input-form-item button+button {
                margin-left: 100px;
            }

            .input-form-item:first-child:before {
                content: 'Vui lòng nhập thông tin';
                font-size: 20px;
                font-weight: 500;
                line-height: 1.4;
                color: rgb(36, 36, 36);
            }


            .input-form-item {
                /* padding: 5px ; */
            }

            .input-form-item+.input-form-item {
                margin-top: 1.5em;
            }


            /* shipper */
            .shipper-item {
                position: relative;
                height: 100px;
                display: flex;
                align-items: center;
            }

            .shipper-item,
            .card-item {

                /* margin-top: 0.5rem; */
                padding: 20px 30px;
            }

            .icon {
                left: 20px;
                top: 20px;
            }

            .shipper-item:hover .icon {
                position: absolute;
                display: block;
                width: 16px;
                height: 16px;
                /* animation-duration: 4s; */
                animation: slide 2s linear;
                /* animation-iteration-count: infinite; */
                animation-timing-function: linear;


            }

            .shipper-item:hover .icon-delivery {
                position: absolute;
                display: block;
                width: 16px;
                height: 16px;
                /* animation-duration: 4s; */
                animation: moving-car 2s linear;
                /* animation-iteration-count: infinite; */
                animation-timing-function: linear;


            }

            @keyframes slide {
                0% {
                    left: 10px;
                    top: 10px;
                    /* transform: rotate(0deg); */
                }

                25% {
                    left: 300px;
                    top: -10px;
                    top: 10px;
                    /* transform: rotate(0); */
                }

                50% {
                    left: 300px;
                    top: 60px;
                    /* transform: rotate(90deg); */

                }

                75% {
                    top: 60px;
                    left: 0px;
                    bottom: 40px;
                    bottom: -40px;
                    /* transform: rotate(180deg); */
                }

                100% {
                    left: 20px;
                    top: 20px;
                    /* transform: rotate(270deg); */
                }
            }


            @keyframes moving-car {
                0% {
                    left: 10px;
                    top: 10px;
                    transform: rotate(0deg);
                }

                25% {
                    left: 220px;
                    top: -10px;
                    top: 10px;
                    transform: rotate(0);
                }

                50% {
                    left: 220px;
                    top: 60px;
                    transform: rotate(90deg);

                }

                75% {
                    top: 60px;
                    left: 0px;
                    bottom: 40px;
                    bottom: -40px;
                    transform: rotate(180deg);
                }

                100% {
                    left: 20px;
                    top: 20px;
                    transform: rotate(270deg);
                }
            }




            .shipper-cp {
                display: flex;

            }

            .shipper-item {
                text-align: center;
                position: relative;
                width: 50%;
                margin-top: 0.5em;
                font-size: 1.2em;

            }

            .shipper-item div {
                color: tomato;
                width: 3em;
                font-size: 1em;
                position: absolute;
                top: 0;
                right: 40%;
                text-shadow: 1px 2px aquamarine;
                font-weight: bold;
            }


            /* COLumn phải */
            .customer-action {
                padding: 20px 30px;
                /* border: 1px solid #111; */
                border-radius: 4px;
                background-color: rgb(255, 255, 255);
            }

            .block-header,
            .customer-infor,
            .price-total {
                display: flex;
                justify-content: space-between;
            }

            .block-header a {
                text-decoration: none;
            }

            .customer-infor-phone,
            .customer-infor-name {
                font-weight: bolder;
            }

            .customer-address {
                color: grey;
                width: auto;
            }

            .address-container {
                margin-bottom: 20px;
                padding-bottom: 20px;
                border-bottom: 0.5px solid;
            }

            .price-total {
                font-size: 20px;
            }

            .price-content span {
                color: red;
                font-weight: bold;
            }

            .btn-buy {
                background-color: aqua;
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
        </style>
    </head>

    <body>
        <div class="style-margin" style="background: rgb(245, 245, 250);">
            <div class="container" style="background: rgb(245, 245, 250);">
                <div style="margin-bottom: 18px;"></div>
                <form>

                    <div class="row">
                        <div class="col-md-8" style="background-color: rgb(255, 255, 255);">
                            <div class="container-shipper">
                                <h3 style="padding: 10px;">Chọn hãng giao hàng</h3>
                                <div class="row">
                                    <label class="shipper-item col-md-6 col-sm-6">
                                        <input type="radio" required="">
                                        <i class="fab fa-shopify"></i>
                                        <label for="hand">Nhận hàng trực tiếp</label><br>
                                    </label>
                                    <label class="shipper-item  col-md-6 col-sm-6">
                                        <input type="radio" required="">
                                        <i class="fas fa-shipping-fast"></i>
                                        <label>Giao hàng tận nhà</label><br>
                                    </label>
                                </div>
                            </div>
                            <div class="container-payment">
                                <h3 style="padding: 10px;">Chọn hình thức thanh toán </h3>
                                <div class="CardAddingForm">
                                    <div class="card-item">
                                        <input type="radio" required="">
                                        <i class="fas fa-hand-holding-usd"></i>
                                        <label for="cod">Thanh toán trực tiếp khi nhận hàng</label><br>
                                    </div>
                                    <div class="card-item">
                                        <input type="radio" required="">
                                        <i class="fas fa-credit-card"></i>
                                        <label for="visa">Thanh toán bằng thẻ</label><br>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="customer-action">
                                <div class="address-container">
                                    <div class="block-header">
                                        <h3>Giao đến</h3>
                                        <a href="<c:url value="/cart/shipInformation.do"/>">Thay đổi</a>
                                    </div>
                                    <div class="customer-infor">
                                        <p class="customer-infor-name">Họ và tên</p>
                                        <i></i>
                                        <p class="customer-infor-phone">Số điện thoại</p>
                                    </div>
                                    <div class="customer-address">
                                        Địa chỉ người mua
                                    </div>
                                </div>
                                <!-- thanh toán -->
                                <div class="price-summary">
                                    <div class="price-total">
                                        <fmt:setLocale value="vi_VN" />
                                        <span class="price-text">Tổng tiền</span>
                                        <div class="price-content">
                                            <span>
                                                <fmt:formatNumber type="currency" value="" />Tổng
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" name="action" value="step3" class="btn-buy" onclick="window.location.href='<c:url value="/cart/billInformation.do"/>'">Thanh Toán</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>

</html>