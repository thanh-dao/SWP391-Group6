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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
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
    </style>
</head>

    <body>
        <div class="container ">
            <h4>Thông tin đơn hàng</h4>

            <div class="row">
                <div class="col-md-3">
                    <div class="br-form">
                        <h6 class="title-style">Thông tin khách hàng</h6>
                        <div class="txt-style">
                            <span class="font-bold">Tên: </span><span>Họ và Tên</span><br>
                            <span class="font-bold">Email: </span><span>Email</span><br>
                            <span class="font-bold">Số điện thoại: </span><span>Số điện thoại</span><br>
                            <span class="font-bold">Địa chỉ nhận hàng: </span><span>Địa chỉ nhận hàng</span><br>
                        </div>
                    </div>
                </div>
                <!-- san pham -->
                <div class="col-md-5 col-sm-6 col-xs-12">
                    <div class="br-form">
                        <table class="table table-striped ">
                            <thead>
                                <tr>
                                    <th scope="col">Thông tin sản phẩm</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="row" style="margin: 0">
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <div class="product-img">
                                                <a href="<c:url value="/home/productDetail.do"/>">
                                                    <picture> <img src="<c:url value="/images/690x400.png"/>" alt="">
                                                    </picture>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <div class="product-content">
                                                <a href="<c:url value="/home/productDetail.do"/>">Tên Sản Phẩm</a>
                                            </div>
                                            <fmt:setLocale value="vi_VN" />
                                            <div>
                                                <span class="product-content">Giá: </span>
                                                <fmt:formatNumber type="currency" value="">Giá sản phẩm</fmt:formatNumber>
                                            </div>
                                            <div>
                                                <span class="product-content">Số lượng:</span>
                                                <span>số lượng sản phẩm</span>
                                            </div>
                                            <button type="button"
                                                   class="button-22">Đánh
                                                giá</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="row" style="margin: 0">
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <div class="product-img">
                                                <a href="<c:url value="/home/productDetail.do"/>">
                                                    <picture> <img src="<c:url value="/images/690x400.png"/>" alt="">
                                                    </picture>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <div class="product-content">
                                                <a href="<c:url value="/home/productDetail.do"/>">Tên Sản Phẩm</a>
                                            </div>
                                            <fmt:setLocale value="vi_VN" />
                                            <div>
                                                <span class="product-content">Giá: </span>
                                                <fmt:formatNumber type="currency" value="">Giá sản phẩm</fmt:formatNumber>
                                            </div>
                                            <div>
                                                <span class="product-content">Số lượng:</span>
                                                <span>số lượng sản phẩm</span>
                                            </div>
                                            <button type="button"
                                                   class="button-22">Đánh
                                                giá</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="row" style="margin: 0">
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <div class="product-img">
                                                <a href="<c:url value="/home/productDetail.do"/>">
                                                    <picture> <img src="<c:url value="/images/690x400.png"/>" alt="">
                                                    </picture>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                            <div class="product-content">
                                                <a href="<c:url value="/home/productDetail.do"/>">Tên Sản Phẩm</a>
                                            </div>
                                            <fmt:setLocale value="vi_VN" />
                                            <div>
                                                <span class="product-content">Giá: </span>
                                                <fmt:formatNumber type="currency" value="">Giá sản phẩm</fmt:formatNumber>
                                            </div>
                                            <div>
                                                <span class="product-content">Số lượng:</span>
                                                <span>số lượng sản phẩm</span>
                                            </div>
                                            <button type="button"
                                                    class="button-22">Đánh
                                                giá</button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="txt-style">
                            <div style="font-weight: bold">Số tiền thanh toán: </div>

                            <!-- Giá gốc: <del>20.000</del><br>
                            Giảm giá: <span>20.000</span><br> -->
                            Phí giao hàng: <span>Phí giao</span>
                            <div style="color: red; font-weight: bold">Tổng cộng:
                                <span>Tổng đơn</span>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-4 col-sm-3 col-xs-2">
                    <div class="br-form">
                        <h6 class="title-style">Chi tiết đơn hàng: </h6>
                        <div class="txt-style">
                            <span class="font-bold">Đơn vị vận chuyển: </span><span>Đơn vị vận chuyển</span><br>
                            <span class="font-bold">Phương thức thanh toán: </span><span>Phương thức thanh toán</span><br>
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