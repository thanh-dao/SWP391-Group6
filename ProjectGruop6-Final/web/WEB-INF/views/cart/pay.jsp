<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh Toán</title>
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;

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
                padding: 10px 10px;
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

            .txt-style {
                padding: 0 0 8px 8px;
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

            .font-bold {
                font-weight: 500;
            }

            .info_user p {
                margin-bottom: 2px;
            }

            i {
                font-size: 15px;
                width: 16px;
                margin-right: 12px; 
                padding: 6px;
            }
        </style>
    </head>

    <body>
        <div class="style-margin">
            <div class="container">
                <div style="margin-bottom: 18px;"></div>
                <form action="pay.do" id="form" method="POST">
                    <div class="row">
                        <div class="col-md-8" style="background-color: rgb(255, 255, 255);">
                            <div class="container-shipper">
                                <h3 style="padding: 10px;">Chọn hãng giao hàng</h3>
                                <div class="row">
                                    <label class="shipper-item col-md-6 col-sm-6">
                                        <input id="dmt1" name="deliId" value="0" type="radio" required="">
                                        <i class="fab fa-shopify"></i>
                                        <label for="dmt1">Nhận hàng trực tiếp</label><br>
                                    </label>
                                    <label class="shipper-item  col-md-6 col-sm-6">
                                        <input id="dmt2" name="deliId" value="1" type="radio" required="">
                                        <i class="fas fa-shipping-fast"></i>
                                        <label for="dmt2" >Giao hàng tận nhà</label><br>
                                    </label>
                                </div>
                            </div>
                            <div class="container-payment">
                                <h3 style="padding: 10px;">Chọn hình thức thanh toán </h3>
                                <div class="CardAddingForm">
                                    <div class="card-item">
                                        <input id="cod" value="0" onchange="renderPaymentButton(this)" name="payId" type="radio" required="">
                                        <i class="fas fa-hand-holding-usd"></i>
                                        <label for="cod">Thanh toán trực tiếp khi nhận hàng</label><br>
                                    </div>
                                    <div class="card-item">
                                        <input id="paypal" value="1" onchange="renderPaymentButton(this)" name="payId" type="radio" required="">
                                        <i class="fas fa-credit-card"></i>
                                        <label for="paypal" >Thanh toán bằng Paypal</label><br>
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
                                    <div class="info_user">
                                        <div class="d-flex">
                                            <i class="fa-regular fa-user"></i>
                                            <p>${order.userName}</p>
                                        </div>
                                        <div class="d-flex">
                                            <i class="fa-solid fa-mobile-screen-button"></i>
                                            <p>${order.phone}</p>
                                        </div>
                                        <div class="d-flex">
                                            <i class="fa-regular fa-address-book"></i>
                                            <p>${order.address.houseNumber} -
                                                ${order.address.wardName} -
                                                ${order.address.districtName} -
                                                ${order.address.cityName}
                                            </p>
                                        </div>
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
                                <h1></h1>
                                <h1></h1>
                                <div id="paypal-button-container">
                                    <button type="submit" class="btn-buy">Thanh Toán</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input id="paypalOrderId" type="text" hidden name="paypalOrderId">
                </form>
            </div>
        </div>
        <script src="https://www.paypal.com/sdk/js?client-id=AcSATbC34qNTc0kDCzZGDxWFgnsdQpuWt8HMIPQwHfGU2UBgNx6lAPkoOtczUGEpWuHK0dm-ZOupi3iY" data-namespace="paypal_sdk"></script>
        <script>
                                            function renderPaymentButton(el) {
                                                const buttonContainer = document.querySelector("#paypal-button-container");
                                                const radioValue = el.value;
                                                if (radioValue === "1") {
                                                    buttonContainer.innerHTML = "";
                                                    const price = localStorage.getItem("usdPrice");
                                                    console.log(price)
                                                    if (price == null) {
                                                        window.location.href = "/ProjectGroup6/user/login.do"
                                                    }

                                                    paypal_sdk.Buttons({
                                                        createOrder: function (data, actions) {
                                                            return actions.order.create({
                                                                purchase_units: [{
                                                                        amount: {
                                                                            value: (Math.round(price * 100) / 100).toString(),
                                                                        }
                                                                    }]
                                                            })
                                                        },
                                                        onApprove: function (data, actions) {
                                                            return actions.order.capture().then(function (details) {
                                                                // This function shows a transaction success message to your buyer.
                                                                console.log(details)
                                                                document.querySelector("#paypalOrderId").value = details.id;
                                                                document.querySelector("#form").submit();
                                                            });
                                                        },
                                                        style: {
                                                            layout: 'vertical',
                                                            color: 'blue',
                                                            shape: 'rect',
                                                            label: 'paypal'
                                                        }
                                                    }).render('#paypal-button-container');
                                                } else {
                                                    buttonContainer.innerHTML = '<button type="submit" class="btn-buy">Thanh Toán</button>'
                                                }

                                            }
        </script>
    </body>

</html>