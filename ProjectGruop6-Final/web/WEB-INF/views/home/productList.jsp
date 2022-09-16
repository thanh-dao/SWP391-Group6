<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            .next {
                margin-top: 50px;
            }
        </style>
    </head>
    <body>
        <div class="sort">
            <div class="container d-flex">
                <div class="dropdown">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                        Sắp xếp theo
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="<c:url value="/home/productList.do"/>">Giá tăng dần</a>
                        <a class="dropdown-item" href="<c:url value="/home/productList.do"/>">Giá giảm dần</a>
                        <a class="dropdown-item" href="<c:url value="/home/productList.do"/>">Từ a tới z</a>
                        <a class="dropdown-item" href="<c:url value="/home/productList.do"/>">Từ z tới a</a>
                        <a class="dropdown-item" href="<c:url value="/home/productList.do"/>">Số lượng bán</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="product">
            <div class="container">

                <div class="product__content row">
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
                <nav class="next" aria-label="Page navigation example">
                    <ul class="pagination d-flex justify-content-center">
                        <li class="page-item"><a class="page-link" href="#">Trước</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Sau</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

    </body>
</html>
