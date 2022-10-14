<%-- 
    Document   : cart
    Created on : Sep 14, 2022, 4:13:58 AM
    Author     : ADmin
--%>
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
                                        <th><input type="checkbox" onclick="handleSelectAll()" name=""></th>
                                        <th class="col-md-6 col-5">Sản phẩm</th>
                                        <th class="col-md-3 col-3">Đơn giá</th>
                                        <th class="col-md-3 col-4">Số lượng</th>
                                    </tr>
                                </thead>
                            </table>
                            <c:forEach items="${order.getOrderByShopList()}" var="i">
                                <table class="table table-striped">
                                    <thead style="background-color: #FFEFD5;">                                  
                                        <tr row>
                                            <th><input type="checkbox" onclick="handleSelectByShop(this)" name="${i.orderByShopId}"></th>
                                            <th class="col-md-6 col-5 font-a">Sản phẩm của <a href="#">${i.getName()}</a></th>
                                            <th class="col-md-3 col-3"></th>
                                            <th class="col-md-3 col-4"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${i.getOrderDetailList()}" var="p">
                                            <tr>
                                                <th><input type="checkbox" class="product-item" price="${p.getProduct().price}" id="${p.productId}" onclick="" name=""></th>
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
                                                        <button class="btn-style-left" onclick="handleCart(${p.getProductId()}, ${i.orderByShopId}, ${p.getQuantity()}, 'minus', this)">-</button>
                                                        <input class="ip-qua-style" value=${p.getQuantity()}>
                                                        <button class="btn-style-right" onclick="handleCart(${p.getProductId()}, ${i.orderByShopId}, ${p.getQuantity()}, 'sum', this)">+</button>
                                                        <div class=" style-product-cart delete-icon"
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
                                        <span class="customer-info">
                                            Địa chỉ nhận hàng
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <!-- thanh toán -->
                            <span class="title-style">Tổng cộng</span>
                            <div class="price-content txt-style">
                                <span>Tổng : 
                                    <span id="price" class="price-content">
                                        <fmt:setLocale value="vi_VN"/>
                                        <fmt:formatNumber value="" type="currency"/>
                                    </span>
                                </span>
                            </div>
                            <button class="btn-buy" onclick="window.location.href = '<c:url value="/cart/pay.do"/>'">Thanh Toán</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script>
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
                                        productId: pId,
                                        func: "delete",
                                        osId: osId,
                                    },
                                    success: function (data, textStatus, jqXHR) {
                                        swal("Đã xóa thành công", {
                                            icon: "success",
                                        });
                                        const tableRow = el.parentElement.parentElement.parentElement.parentElement
                                        tableRow.remove()
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        swal("Xóa thất bại!!!", {
                                            icon: "error",
                                        });
                                    }
                                })
                            }
                        });
            }
            const handleCart = (pId, osId, quantity, option, el) => {
                if (option == 'minus') {
                    quantity -= 1;
                    if (quantity <= 0) {
                        deleteOrderDetail(pId, osId, el);
                    }
                } else if (option == 'sum') {
                    quantity += 1;
                }
                $.ajax("<c:url value="/cart/cart.do"/>", {
                    data: {
                        pId: pId,
                        func: 'update',
                        quan: quantity,
                        osId: osId,
                    }
                })
            }
            const handleSelectByShop = (el) => {
                const container = el.parentElement.parentElement.parentElement.parentElement;
                container.querySelectorAll("tbody input[type=checkbox]").forEach(i => {
                    i.checked = !i.checked;
                })
                document.getElementById("price").innerHTML = total();
            }
            const handleSelectAll = () => {
                const container = document.querySelectorAll("input[type=checkbox]").forEach(i => {
                    i.checked = !i.checked;
                })
                document.getElementById("price").innerHTML = total();
            }
            const total = () => {
                var price = 0;
                document.querySelectorAll('.product-item').forEach(i => {
                    if (i.checked == true)
                        price += parseInt(i.getAttribute("price"))
                })
                return price;
            }

            $(document).ready(function () {
                total();
            });
        </script>
    </body>

</html>