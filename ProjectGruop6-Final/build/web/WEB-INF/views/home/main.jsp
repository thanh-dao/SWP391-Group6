<%-- 
    Document   : index
    Created on : Jun 7, 2022, 7:33:02 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Title</title>
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

            .product .container{
                margin-top: 50px;
            }

            .product__item {
                width: 100%;
                transition: 0.5s;
            }

            .product__item a {
                color: black;
                font-size: 18px;
            }

            .product__item img {
                transition: 0.5s;
            }

            .product__item img:hover {
                transform: translateY(-5px);
                transition: 0.5s;
            }

            .product__item a:hover {
                color:blue;
                text-decoration: none;
            }

            .product__item img {
                height: 230px;
            }

            .product__item span {
                font-size: 20px;
                color: red;
            }

            .top__seller .container {
                margin-top: 50px;
            }
            .intro{
                margin-top: 50px;              
            }

        </style>
    </head>

    <body>
        <div class="body">
            <div class="product">
                <div class="container">
                    <h3>SẢN PHẨM MỚI</h3>
                    <div class="product__content row">
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>

                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>



                    </div>
                </div>
            </div>

            <div class="top__seller">
                <div class="container">
                    <h3>SẢN PHẨM BÁN CHẠY</h3>
                    <div class="product__content row">
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div><div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do"/>">
                                <img class="img-fluid" src="<c:url value="/images/690x400.png"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a><br>
                            <span>Giá sản phẩm</span>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <div class="purpose">
            <div class="container intro">
                <h1>FBT</h1>
                <p>Đây là thông tin chung của web: Sứ Mệnh, Cốt Lỗi, Mục Tiêu.</p>
            </div>
        </div>
    </body>

</html>