<%-- 
    Document   : cart
    Created on : Sep 14, 2022, 4:13:58 AM
    Author     : ADmin
--%>
<%@page import="services.GhnApi"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                background-color: #FF9900;
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

            .font-a a{
                color: #FFA500;
                text-decoration: none;
            }

            .product_style a {
                color: black;
                font-size: 15px;
            }

            .product_style a:hover {
                color: #FFA500;
                text-decoration: none;
            }

            .price-content {
                padding: 0 10px;
                font-size: 15px;
                color: red;
            }

            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            /* Firefox */
            input[type=number] {
                -moz-appearance: textfield;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="cart-content">
                <div class="row">
                    <div class="col-md-8 font-a">
                        <div class="br-form">
                            <div class="block-header" style="padding: 10px;">
                                <h3>Giỏ hàng</h3>
                            </div>
                            <table style="margin-bottom: 1rem;">
                                <thead>                                  
                                    <tr row>
                                        <th><input id="selectAll" type="checkbox" onclick="createOrder()" onclick="handleSelectAll(this)" name=""></th>
                                        <th class="col-md-6 col-5">Sản phẩm</th>
                                        <th class="col-md-3 col-3">Đơn giá</th>
                                        <th class="col-md-3 col-4" style="display: flex; justify-content: space-between;">
                                            <span>Số lượng</span>
                                            <div class=" style-product-cart delete-icon " onclick="deleteAll()" 
                                                 style="justify-content: center">
                                                <a class="show-cart" style="color: white"><i
                                                        class="fas fa-trash delete-trash"></i></a>
                                            </div>
                                        </th>
                                    </tr>
                                </thead>
                            </table>
                            <c:forEach items="${order.getOrderByShopList()}" var="i">
                                <table class="table table-striped cart-table">
                                    <thead style="background-color: #FFEFD5;">                                  
                                        <tr row>
                                            <th><input type="checkbox" onclick="handleSelectByShop(this)" name="${i.orderByShopId}"></th>
                                            <th class="col-md-6 col-5 font-a">Sản phẩm của <a href="#">${i.getName()}</a></th>
                                            <th class="col-md-3 ">
                                            </th>
                                            <th class="col-md-4 shipping-price">
                                                <c:if test="${sessionScope.user.address != null}">
                                                    <%--<%=GhnApi ghn = new GhnApi() %>--%>
                                                    <fmt:setLocale value="vi-VN"/>
                                                    Phí ship: 
                                                    <fmt:formatNumber type="currency" value='${GhnApi.getShipingFee(
                                                                                               i.getAddress().cityName, sessionScope.user.address.cityName, 
                                                                                               i.getAddress().districtName,sessionScope.user.address.districtName,
                                                                                               sessionScope.user.address.wardName, "2")}' />
                                                </c:if>
                                            </th>

                                            <!--<th class="col-md-3"></th>-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${i.getOrderDetailList()}" var="p">
                                            <tr>
                                                <th><input type="checkbox" onclick="handleSelect(this)" class="product-item" price="${p.getProduct().price}" id="${p.productId}" onclick="" name=""></th>
                                                <td style="margin: 0">
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-6" style="padding: 0;">
                                                            <a href="<c:url value="/home/productDetail.do?productId=${p.getProductId()}"/>">
                                                                <div class="product-img">
                                                                    <picture> <img src="<c:url value="${p.getProduct().getMainImage().getUrl()}"/>" alt="">
                                                                    </picture>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-lg-8 col-md-6 col-sm-6 col-xs-6 product_style">
                                                            <a href="<c:url value="/home/productDetail.do?productId=${p.getProductId()}"/>">${p.getProduct().getName()}</a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="price-content">
                                                    <fmt:setLocale value="vi_VN"/>
                                                    <fmt:formatNumber value="${p.getProduct().getPrice()}" type="currency"/>
                                                </td>
                                                <td>
                                                    <div class="quantity-button">
                                                        <button class="btn-style-left" onclick="handleCart(${p.getProductId()}, ${i.orderByShopId}, 'minus', this)">-</button>
                                                        <input type="number"   class="ip-qua-style" pattern="/^[1-9]\d*$/" oninput="updateMoneyPerProduct(this, ${p.getQuantity()},${p.getProductId()}, ${i.orderByShopId})" value=${p.getQuantity()}>
                                                        <button class="btn-style-right" onclick="handleCart(${p.getProductId()}, ${i.orderByShopId}, 'sum', this)">+</button>
                                                        <div class=" style-product-cart delete-icon " onclick="deleteOrderDetail(${p.getProductId()}, ${i.orderByShopId}, this)" 
                                                             style="justify-content: center">
                                                            <a class="show-cart" style="color: white"><i
                                                                    class="fas fa-trash delete-trash"></i></a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:forEach>
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
                                        <c:choose>
                                            <c:when test = "${empty order.address.houseNumber || 
                                                              empty order.address.wardName || 
                                                              empty order.address.districtName||
                                                              empty order.address.cityName}">
                                                    Chưa cập nhật địa chỉ nhận hàng
                                            </c:when>
                                            <c:otherwise>
                                                <span class="customer-info">
                                                    ${order.address.houseNumber}, 
                                                    ${order.address.wardName}, 
                                                    ${order.address.districtName}, 
                                                    ${order.address.cityName}
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            <!-- thanh toán -->
                            <span class="title-style">Tổng cộng</span>
                            <div class="price-content txt-style">
                                <span>Thành tiền : 
                                    <span id="price" class="price-content">
                                    </span>
                                </span>
                            </div>
                            <c:choose>
                                <c:when test = "${empty order.address.houseNumber || 
                                                  empty order.address.wardName || 
                                                  empty order.address.districtName||
                                                  empty order.address.cityName ||
                                                  empty user.phone ||
                                                  not empty order.orderByShopList}">
                                        <a class="genric-btn primary circle" onclick="handlePay()" href="<c:url value="/cart/shipInformation.do"/>">Thanh Toán</a>
                                </c:when>
                                <c:when test = "${not empty order.orderByShopList}">
                                    <button class="btn-buy" onclick="window.location.href = '<c:url value="/cart/pay.do"/>'">Thanh Toán</button>
                                </c:when>
                                <c:otherwise>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            let products = [];
            const handlePay = () => {
                const price = parseInt(document.querySelector("#price").innerHTML.substring(1).replace(",", ""));
                localStorage.setItem("vndPrice", price);
                var myHeaders = new Headers();
                myHeaders.append("apikey", "Egj2knbKqmkBva9q7FsIrUWpEqQ32Dpa");

                var requestOptions = {
                    method: 'GET',
                    redirect: 'follow',
                    headers: myHeaders
                };

                fetch("https://api.apilayer.com/exchangerates_data/convert?to=USD&from=VND&amount=" + price.toString(), requestOptions)
                        .then(response => response.json())
                        .then(data => {
                            localStorage.setItem("usdPrice", data.result);
                        })
                        .catch(error => console.log('error', error));


                $.ajax("<c:url value="/cart/pay.do"/>", {
                    data: {
                        pIdList: createOrder(),
                    }
                })
            }
            const createOrder = () => {
                const els = document.querySelectorAll('.product-item')
                els.forEach(item => {
                    if (item.checked) {
                        products.push(
                                {
                                    id: item.getAttribute("id"),
                                    quantity: item.parentElement.parentElement.querySelector(".ip-qua-style").value,
                                }
                        );
                    } else {
                        products = products.filter(item => item.id !== item.getAttribute("id"))
                    }
                })

                return products;
            }
            const deleteAll = () => {
                swal({
                    title: "",
                    text: "Xác nhận xóa sản phẩm này?",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                $.ajax("<c:url value="/cart/cart.do"/>", {
                                    data: {
                                        func: "deleteAll",
                                    },
                                    success: function (data, textStatus, jqXHR) {
                                        swal("Đã xóa thành công", {
                                            icon: "success",
                                            buttons: false,
                                            timer: 1000,
                                        });
                                        document.querySelectorAll(".cart-table").forEach(i => {
                                            i.remove()
                                        })
                                        document.getElementById("price").innerHTML = total();
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        swal("Xóa thất bại!!!", {
                                            icon: "error",
                                            buttons: false,
                                            timer: 1000,
                                        });
                                    }
                                })
                            }
                        });
            }
            function updateMoneyPerProduct(el, quantity, pId, osId) {
                const intValue = parseInt(el.value)
                if (intValue < 1) {
                    el.value = quantity;
                } else {
                    $.ajax("<c:url value="/cart/cart.do"/>", {
                        data: {
                            pId: pId,
                            func: 'update',
                            quan: intValue,
                            osId: osId,
                        }
                    })
                    document.getElementById("price").innerHTML = total();
                }

            }
            const deleteOrderDetail = (pId, osId, el) => {
                swal({
                    title: "",
                    text: "Xác nhận xóa sản phẩm này?",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                $.ajax("<c:url value="/cart/cart.do"/>", {
                                    data: {
                                        pId: pId,
                                        func: "delete",
                                        osId: osId,
                                    },
                                    success: function (data, textStatus, jqXHR) {
                                        swal("Đã xóa thành công", {
                                            icon: "success",
                                            buttons: false,
                                            timer: 1000,
                                        });
                                        const tableRow = el.parentElement.parentElement.parentElement
                                        const tableBody = tableRow.parentElement;
                                        const tableElement = tableBody.parentElement;
                                        tableRow.remove()
                                        if (tableBody.innerHTML.trim() === "") {
                                            tableElement.remove();
                                        }
                                        document.getElementById("price").innerHTML = total();
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        swal("Xóa thất bại!!!", {
                                            icon: "error",
                                            buttons: false,
                                            timer: 1000,
                                        });
                                    }
                                })
                            }
                        });
            }
            const handleCart = (pId, osId, option, el) => {
                let quantity = parseInt(el.parentElement.querySelector(".ip-qua-style").value)
                if (option == 'minus') {
                    quantity -= 1;
                    if (quantity < 1) {
                        quantity = 1;
                        deleteOrderDetail(pId, osId, el);
                    }

                } else if (option == 'sum') {
                    quantity += 1;
//                    console.log(quantity);
                }
                el.parentElement.querySelector(".ip-qua-style").value = quantity;
                $.ajax("<c:url value="/cart/cart.do"/>", {
                    data: {
                        pId: pId,
                        func: 'update',
                        quan: quantity,
                        osId: osId,
                    }
                })
                document.getElementById("price").innerHTML = total();
            }
            const handleSelectByShop = (el) => {
                const container = el.parentElement.parentElement.parentElement.parentElement;
                if (el.checked == false) {
                    const selectAll = document.getElementById("selectAll")
                    selectAll.checked = false
                }
                container.querySelectorAll("tbody input[type=checkbox]").forEach(i => {
                    i.checked = el.checked;
                })
                document.getElementById("price").innerHTML = total();
            }
            const handleSelectAll = (el) => {
                const container = document.querySelectorAll("input[type=checkbox]").forEach(i => {
                    i.checked = el.checked;
                })
                document.getElementById("price").innerHTML = total();
            }
            const handleSelect = (el) => {
                if (el.checked == false) {
                    const selectByShop = el.parentElement.parentElement.parentElement.parentElement.childNodes[1].querySelectorAll("input[type=checkbox]")
                    selectByShop[0].checked = false
                    const selectAll = document.getElementById("selectAll")
                    selectAll.checked = false
                } else if (el.checked == true) {

                }

                document.getElementById("price").innerHTML = total();
            }
            const total = () => {
                var price = 0;
                document.querySelectorAll('.product-item').forEach(i => {
                    if (i.checked == true) {
                        const quantity = parseInt(i.parentElement.parentElement.querySelector(".ip-qua-style").value)
                        price += parseInt(i.getAttribute("price") * quantity)
                        console.log(price)
                    }
                })
                const formatter = new Intl.NumberFormat('vn-VN', {
                    style: 'currency',
                    currency: 'VND',
                    minimumFractionDigits: 0
                })
                return formatter.format(price)
            }

            $(document).ready(function () {
                total();
            });
        </script>
    </body>

</html>