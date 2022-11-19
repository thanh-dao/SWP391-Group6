<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh Toán</title>
        <link href="../css/main.css" rel="stylesheet" type="text/css"/>
        <style>
            html, body {
                height: 100%;
            }
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
                display: flex;
                align-items: center;
            }

            .shipper-item,
            .card-item {
                /* margin-top: 0.5rem; */
                padding: 10px 30px;
            }
            .icon {
                left: 20px;
                top: 20px;
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
            .price-content {
                padding: 0 10px;
                font-size: 15px;
                color: red;
            }
            .txt-style {
                padding: 0 0 8px 8px;
            }
            .title-style {
                font-weight: bold;
                padding: 8px
            }
            p{
                margin: 0;
            }
            i {
                font-size: 15px;
                width: 16px;
                margin-right: 12px; 
                padding: 6px;
            }
            .btn{width: 100%;}
        </style>
    </head>
    <body>
        <div class="container">
            <div style="margin-bottom: 18px;"></div>
            <form action="pay.do" id="form" method="POST">
                <div class="row">
                    <div class="col-md-8" style="background-color: rgb(255, 255, 255);">
                        <div class="container-shipper">
                            <h3 style="padding: 10px;">Chọn phương thức giao hàng</h3>
                            <div class="row">
                                <label class="shipper-item col-md-6 col-sm-6">
                                    <input onclick="setShipPrice()" checked id="dmt1" name="deliId" value="0" type="radio" required="">
                                    <i class="fab fa-shopify"></i>
                                    <label for="dmt1">Nhận hàng trực tiếp</label><br>
                                </label>
                                <label class="shipper-item  col-md-6 col-sm-6">
                                    <input onclick="setShipPrice()" id="dmt2" name="deliId" value="1" type="radio" required="">
                                    <i class="fas fa-shipping-fast"></i>
                                    <label for="dmt2" >Giao hàng tận nhà</label><br>
                                </label>
                            </div>
                        </div>
                        <div class="container-payment">
                            <h3 style="padding: 10px;">Chọn phương thức thanh toán </h3>
                            <div class="CardAddingForm">
                                <div class="card-item">
                                    <input id="cod" value="0" checked onchange="renderPaymentButton(this)" name="payId" type="radio" required="">
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
                        <div class="br-form">
                            <div class="address-container">
                                <div class="block-header" style="padding: 10px;">
                                    <h3>Giao đến</h3>
                                    <a href="<c:url value="/cart/shipInformation.do"/>">Thay đổi</a>
                                </div>
                                <div class="txt-style">
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
                            <span class="title-style">Đơn giá</span>
                            <div class="price-content txt-style">
                                <span class="d-flex justify-content-between" 
                                      style="font-weight: normal; color: black;">Phí giao hàng: 
                                    <span id="price-ship" class="price-content">
                                    </span>
                                </span>
                                <span class="d-flex justify-content-between"
                                      style="font-weight: normal; color: black;">Giá sản phẩm: 
                                    <span id="price" class="price-content"></span>
                                </span>
                                <span class="d-flex justify-content-between" style="font-weight: bold;">Thành tiền: 
                                    <span id="price-total" class="price-content">
                                    </span>
                                </span>
                            </div>
                            <div id="paypal-button-container">
                                <button type="submit" class="btn btn-primary">Thanh Toán</button>
                            </div>
                        </div>
                    </div>
                </div>
                <input id="paypalOrderId" type="text" hidden name="paypalOrderId">
            </form>
        </div>
        <script src="https://www.paypal.com/sdk/js?client-id=AcSATbC34qNTc0kDCzZGDxWFgnsdQpuWt8HMIPQwHfGU2UBgNx6lAPkoOtczUGEpWuHK0dm-ZOupi3iY" data-namespace="paypal_sdk"></script>
        <script>
                                        var order = ${order.toJson()};
                                        let totalMoney = 0;
                                        const setShipPrice = () => {
                                            totalShipPrice();
                                            total();
                                        }
                                        const totalShipPrice = () => {
                                            var total = 0;
                                            if (document.querySelector('#dmt2').checked) {
                                                order.orderByShopList.forEach(i => {
                                                    total += i.transportFee;
                                                })
                                            }
                                            document.querySelector('#price-ship').innerHTML = formatter.format(total);
                                            return total;
                                        }
                                        const totalProductPrice = () => {
                                            let total = 0;
                                            order.orderByShopList.forEach(i => {
                                                i.orderDetailList.forEach(o => {
                                                    total += o.product.price;
                                                })
                                                total += i.transportFee;
                                            })
                                            document.querySelector('#price').innerHTML = formatter.format(total);
                                            return total;
                                        }
                                        const total = () => {
                                            const total = totalProductPrice() + totalShipPrice();
                                            document.getElementById("price-total").innerHTML = formatter.format(total);
                                            return total;
                                        }
                                        $(document).ready(function () {
                                            totalProductPrice();
                                            totalMoney = total();
                                        });
                                        const formatter = new Intl.NumberFormat('vn-VN', {
                                            style: 'currency',
                                            currency: 'VND',
                                            minimumFractionDigits: 0
                                        })
                                        async function renderPaymentButton(el) {
                                            const buttonContainer = document.querySelector("#paypal-button-container");
                                            const radioValue = el.value;
                                            if (radioValue === "1") {
                                                buttonContainer.innerHTML = "";
                                                const price = await getUsdPrice(totalMoney);
                                                console.log(totalMoney)
                                                console.log(price)
                                                if (price == null) {
//                                                    window.location.href = "/ProjectGroup6/user/login.do"
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
                                                buttonContainer.innerHTML = '<button type="submit" class="btn btn-primary">Thanh Toán</button>'
                                            }
                                        }

                                        const getUsdPrice = async (vnd) => {
                                            var myHeaders = new Headers();
                                            myHeaders.append("apikey", "Egj2knbKqmkBva9q7FsIrUWpEqQ32Dpa");
                                            var requestOptions = {
                                                method: 'GET',
                                                redirect: 'follow',
                                                headers: myHeaders
                                            };
                                            await fetch("https://api.apilayer.com/exchangerates_data/convert?to=USD&from=VND&amount=" + vnd.toString(), requestOptions)
                                                    .then(response => response.json())
                                                    .then(data => {
                                                        localStorage.setItem("usdPrice", data.result);
                                                    })
                                                    .catch(error => console.log('error', error));
                                            let price = localStorage.getItem("usdPrice");
                                            localStorage.removeItem("usdPrice");
                                            return price;
                                        }
        </script>
    </body>
</html>