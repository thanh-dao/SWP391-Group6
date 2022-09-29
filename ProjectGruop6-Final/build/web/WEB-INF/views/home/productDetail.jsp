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
        <title>Product Detail</title>

        <style>

            .link {
                padding-top: 10px;
                margin-bottom: 10px;
            }

            .link a {
                font-size: 18px;
            }
            .buy button {
                background-color: #FFA500;
                transition: 0.5s;
                background-size: 200%;
                color: white;
                box-shadow: 0 0 20px #eee;
                border-radius: 30px;
                border: #eee;
                height: 50px;
                width: 350px;
            }

            .buy button:hover {
                background-position: right center;
                color: #fff;
                text-decoration: none;
                cursor: pointer;
            }

            .button_1{
                margin-top: 50px;
                margin-bottom: 20px;
            }

            p{
                font-size: 20px;
                margin: 2px;
                padding: 2px;
            }

            .font-bold {
                font-size: 20px;
                font-weight: 500;
            }

            .font-bold {
                font-weight: 500;
            }

            a {
                color: #FFA500;
                text-decoration: none;
            }

            a:hover {
                color: #4D8FFF;
                text-decoration: none;
            }

            body {
                background-color: #F0F0F0;
                height: auto;
            }

            .br-form {
                background: #FFFFFF;
                padding: 5px;
                border-radius: 3px;
                margin-bottom: 20px;
            }

            .avatar {
                height: 100px;
                width: 100px;
                border-radius: 50%;
                margin-right: 20px;
            }

            .avatar img{
                width: 100%;
            }

            .reviewer {
                height: 40px;
                width: 40px;
                border-radius: 50%;
                margin-right: 10px;
            }

            .reviewer img{
                width: 100%;
            }

            .review {
                padding: 10px;
                border-bottom: 1.5px solid rgba(0,0,0,.09);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="br-form">
                <div class="link">
                    <a href="<c:url value="/home/main.do"/>">Trang chủ</a> >>
                    <a href="<c:url value="/home/productList.do"/>">Loại sản phẩm</a> >>
                    <a href="<c:url value="/home/productDetail.do"/>">Tên sản phẩm</a>
                </div>

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
                            <h2>Tên sản phẩm</h2>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <div style="display: flex;">
                                <p style="margin-right: 30%">Đã bán: <span class="font-bold">201</span></p>
                                <p>Đánh giá: <span class="font-bold">190</span></p>

                            </div>
                            <p>Sản phẩm có sẵn: <span class="font-bold">1201</span><p/>
                            <h2 style="color: #E72425; text-align: right">200.000 VNĐ</h2>
                            <div class="buy d-flex justify-content-around">
                                <button type="button" onclick="addCartAjax()">Đặt hàng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="br-form">
                <h5>Thông tin người bán</h5>
                <div style="display: flex">
                    <div class="col-md-5" style="display: flex">
                        <a href="<c:url value="/home/main.do"/>" class="avatar">
                            <img src="<c:url value="/images/FBT.jpg"/>" alt="">
                        </a>
                        <p><a href="#">Tên người bán</a></p>
                    </div>
                    <div class="col-md-7">
                        <p>Số điện thoại: <span>0808</span></p>
                        <p>Địa chỉ: <span>TP HCM</span></p>
                    </div>
                </div>
            </div>

            <div class="br-form">
                <h5>Mô tả chi tiết: </h5>
                <p style="padding: 10px 0 10px 0;">
                    Mô tả:

                    Loại dự án: Đồng hồ điện tử LED
                    Loại móc cài: khóa ghim
                    Hình dạng trường hợp: hình vuông
                    Loại hiển thị: số
                    Phong cách: thể thao

                    Đặc điểm:

                    Kích thước:
                    Đường kính quay số: 43 mm
                    Độ dày vỏ: 14 mm
                    Chiều dài dây đeo: 255 mm
                    Chiều rộng băng: 22 mm

                    Chất liệu: TPE + ABS + PP

                    Màu sắc: 

                    Gói hàng bao gồm:
                    1x đồng hồ điện tử

                    Lưu ý:
                    1. Do màn hình khác nhau, có thể có một số khác biệt về màu sắc, xin vui lòng hiểu
                    2. Do đo lường thủ công, có thể có một chút lỗi, xin vui lòng thông cảm
                </p>
            </div>

            <div class="br-form">
                <h5 style="margin-top: 5px;">Đánh giá sản phẩm</h5>
                <div class="review">
                    <div style="display: flex">
                        <a href="<c:url value="/home/main.do"/>" class="reviewer">
                            <img src="<c:url value="/images/FBT.jpg"/>" alt="">
                        </a>
                        <p>
                            <a href="#">Tên người bán</a>
                            <br/>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                        </p>
                    </div>
                    <p>Khá đẹp, mặt đồng hồ như gương vậy có thể soi được</p>
                </div>
                <div class="review">
                    <div style="display: flex">
                        <a href="<c:url value="/home/main.do"/>" class="reviewer">
                            <img src="<c:url value="/images/FBT.jpg"/>" alt="">
                        </a>
                        <p>
                            <a href="#">Tên người bán</a>
                            <br/>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                        </p>
                    </div>
                    <p>Khá đẹp, mặt đồng hồ như gương vậy có thể soi được</p>
                </div>
                <nav aria-label="Page navigation example" style="margin-top: 5px;">
                    <ul class="pagination d-flex justify-content-center">
                        <li class="page-item "><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>

            </div>

            <div class="product">
                <h3>Các sản phẩm khác của <a href="#">Tên người bán</a></h3>
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
        <script>let email = ""</script>
        <h1>${sessionScope.acc.email != null}</h1>
        <c:if test="${sessionScope.acc.email != null}">
            <script> 
                email = '${sessionScope.acc.email}'
            </script>
        </c:if>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
            console.log(email)
                const getProductId = () => {
                    const urlParams = new URLSearchParams(window.location.search);
                    return urlParams.get('productId');
                }
                const addCartAjax = () => {
                    if (email == "") {
                        window.location.href = "/ProjectGroup6/user/login.do"
                    } else {
                        $.ajax("/ProjectGroup6/addCartAjax", {
                            method: "GET",
                            data: {
                                
                                email: email,
                                productId:  getProductId(),
                            },
                            success: function (data) {
                                console.log(data)
                            }
                        })
                    }
                }
//                        fetch("addCartAjax", {
//                            method: "GET",
//                            body: {
//                                email: email,
//                                productId:  getProductId(),
//                            }
//                        })
//                        .then(res => res.json())
//                        .then(res => console.log(res))
//                    }

        </script>
    </body>
</html>