<%-- 
    Document   : productDetail
    Created on : Sep 14, 2022, 3:38:49 AM
    Author     : ADmin
--%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Product</title>
        <!-- Bootstrap CSS -->
        <style>
            .product__details {
                height:700px;
            }

            .buy button {
                background-image: linear-gradient(
                    to right,
                    #f55f8d 0%,
                    #f8ae56 51%,
                    #f55f8d 100%
                    );
                transition: 0.5s;
                background-size: 200%;
                color: white;
                box-shadow: 0 0 20px #eee;
                border-radius: 30px;
                border: #eee;
                height: 50px;
                width: 150px;
            }

            .buy button:hover {
                background-position: right center;
                color: #fff;
                text-decoration: none;
                cursor: pointer;
            } 

            .buy a {
                color: white;
            }

            .buy a:hover {
                text-decoration: none;
            }
            .button_1{
                margin-top: 50px;
            }
        </style>
    </head>
    <body>

        <div class="product__details">
            <div class="container">

                <div class="product__content">

                    <div class="row">
                        <div id="demo" class="carousel slide col-lg-7 col-md-7 col-sm-7" data-ride="carousel">

                            <!-- Indicators -->
                            <ul class="carousel-indicators">
                                <li data-target="#demo" data-slide-to="0" class="active"></li>
                                <li data-target="#demo" data-slide-to="1"></li>
                                <li data-target="#demo" data-slide-to="2"></li>
                            </ul>

                            <!-- The slideshow -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                                </div>
                                <div class="carousel-item">
                                    <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                                </div>
                                <div class="carousel-item">
                                    <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                                </div>
                            </div>

                            <!-- Left and right controls -->
                            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                <i class="fa-solid fa-chevron-left"></i>
                            </a>
                            <a class="carousel-control-next" href="#demo" data-slide="next">
                                <i class="fa-solid fa-chevron-right"></i>
                            </a>
                        </div>

                        <div class="col-lg-5 col-md-5 col-sm-5">
                            <h5>Tiêu đề</h5>
                            <h6>Tên sản Phẩm</h6>
                            <p>Giá sản phẩm</p>
                            <p>
                                - Mô tả chi tiết 1<br />
                                - Mô tả chi tiết 2<br />
                                - Mô tả chi tiết 3<br />
                                - Mô tả chi tiết 4<br />
                                - Mô tả chi tiết 5
                            </p>

                            <p>Liên hệ số: <strong>Số điện thoại người bán</strong></p>
                            <br />
                            <h5>Khu vực</h5>
                            <p>Địa chỉ người bán</p>
                            <div class="buy d-flex justify-content-around button_1">
                                <button><a href="<c:url value="#"/>">Lưu</a></button>
                                <button><a href="<c:url value="/home/uploadProduct.do"/>">Sửa</a></button>
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-lg-7 col-md-10 col-sm-12">
                            <a href="#">
                                <img style="width: 50px" src="<c:url value="/images/690x400.png"/>" class="img-thumbnail"
                                     alt="Avatar" /></a>
                            <a href="#" style="text-decoration: none; color: black; display: inline-block">
                                <h5>Người bán</h5>
                            </a>
                        </div>
                        <div class="col-lg-5 col-md-2"></div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>