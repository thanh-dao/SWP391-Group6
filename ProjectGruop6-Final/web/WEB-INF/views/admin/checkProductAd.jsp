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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            a{text-decoration: none;}
            .product__details {
                height:700px;
            }

            .buy button {
                background-color: orange;
                border-radius: 30px;
                border: #eee;
                height: 50px;
                width: 150px;
            }

            .buy button:hover {
                background-color: orangered;
                text-decoration: none;
                cursor: pointer;
            } 
            
            .buy a {
                color: white;
            }
            
            .buy a:hover {
                text-decoration: none;
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
                            <div class="buy d-flex justify-content-around">
                                <button><a href="<c:url value="#"/>">Chấp thuận</a></button>
                                <button><a href="<c:url value="#"/>">Từ chối</a></button>
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