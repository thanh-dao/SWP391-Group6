<%-- 
    Document   : index
    Created on : Jun 7, 2022, 7:33:02 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Title</title>
        <!-- Bootstrap CSS -->
        <style>
            .discount {
                position: relative;
            }

            .discount .left, .discount .right {
                position: absolute;
                position: fixed;
            }

            .discount .right {
                margin-left: 1550px;
            }

            .discount img {
                width: 350px;
            }

            .carousel-item img {
                width: 100%;
                height: 550px;
            }

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
        <div class="discount">
            <img class="left img-fluid" src="<c:url value="/images/discount.jpg"/>"  onclick="window.location.href = '#'">
            <img class="right img-fluid" src="<c:url value="/images/discount.jpg"/>" onclick="window.location.href = '#'">
        </div>

        <div class="banner">
            <div class="container">
                <div id="demo" class="carousel slide" data-ride="carousel">

                    <!-- Indicators -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                        <li data-target="#demo" data-slide-to="3"></li>
                        <li data-target="#demo" data-slide-to="4"></li>
                    </ul>

                    <!-- The slideshow -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="img-fluid" src="<c:url value="/images/thuCung.jpg"/>"  onclick="window.location.href = '<c:url value="/home/productList.do?cateId=6"/>'">
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid" src="<c:url value="/images/nuocHoa.jpg"/>" onclick="window.location.href = '<c:url value="/home/productList.do?cateId=5"/>'">
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid" src="<c:url value="/images/doGiaDung.jpg"/>" onclick="window.location.href = '<c:url value="/home/productList.do?cateId=3"/>'">
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid" src="<c:url value="/images/thucAn.jpg"/>" onclick="window.location.href = '<c:url value="/home/productList.do?cateId=1"/>'">
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid" src="<c:url value="/images/sach.jpg"/>" onclick="window.location.href = '<c:url value="/home/productList.do?cateId=8"/>'">
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>
            </div>
        </div>






        <div class="product">
            <div class="container">
                <h3>SẢN PHẨM BÁN CHẠY</h3>
                <div class="product__content row">
                    <c:forEach items="${bestSellers}" var="i">
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do?productId=${i.productId}"/>">
                                <img class="img-fluid" src="${i.getMainImage().url}" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do?id=${i.productId}"/>">${i.name}</a><br>
                            <fmt:setLocale value="vi_VN"/>
                            <span><fmt:formatNumber value="${i.price}" type="currency"/></span>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>

        <div class="top__seller">
            <div class="container">
                <h3>SẢN PHẨM BÁN CHẠY</h3>
                <div class="product__content row">
                    <c:forEach items="${newProducts}" var="i">
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do?${i.productId}"/>">
                                <img class="img-fluid" src="${i.getMainImage().url}" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do"/>">${i.name}</a><br>
                            <span><fmt:formatNumber value="${i.price}" type="currency"/></span>
                        </div>
                    </c:forEach>
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