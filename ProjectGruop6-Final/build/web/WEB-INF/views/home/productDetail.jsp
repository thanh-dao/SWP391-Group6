<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="../css/main.css" rel="stylesheet" type="text/css"/>
        <style>
            .link {padding-top: 10px;margin-bottom: 10px;}
            .link a {font-size: 18px;}
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
            .product_content {
                font-size: 20px;
                font-weight: 500;
            }
            .product_content {
                font-weight: 500;
            }
            .font-a a{
                color: #FDC632;
                text-decoration: none;
            }
            a:hover {
                color: none;
                text-decoration: none;
            }
            .avatar {
                height: 50px;
                width: 50px;
                border-radius: 50%;
                margin-right: 20px;
            }
            .avatar img{
                width: 100%;
                border-radius: 50%;
            }
            .reviewer {
                height: 40px;
                width: 40px;
                border-radius: 50%;
                margin-right: 10px;
            }
            .reviewer img{
                width: 100%;
                border-radius: 50%;
            }
            .review {
                padding: 10px;
                border-bottom: 1.5px solid rgba(0,0,0,.09);
            }
            .star{
                color: #FFA500;
                font-size:20px;
            }
            .star-s{
                color: #FFA500;
                font-size:15px;
            }
            .img-nav-btn{
                width: 50px; 
                height: 50px; 
                background: #ccc; 
                border-radius: 50%;
                opacity: 0.8;
            }
            .carousel-control-next:focus, 
            .carousel-control-prev:focus{
            }
            .carousel-control-next:hover, .carousel-control-prev:hover{
                opacity: 1;
            }
            .carousel-item{width: 540px; height: 540px;}
            .carousel-item img{width: 100%; height: 100%;}
        </style>
    </head>
    <body>
        <div class="container" >
            ${product.status == null ? "null" : "not null"}
            <c:if test="${product == null}">
                <h1 style="text-align: center; height: 600px;">Sản phẩm không tồn tại</h1>
            </c:if>
            <c:if test="${product != null}">
                <div class="br-form">
                    <div class="link font-a">
                        <a href="<c:url value="/home/main.do"/>">Trang chủ</a> >>
                        <c:forEach items="${sessionScope.cateList}" var="i">
                            <c:if test ="${i.cateId == product.cateId}">
                                <a href="<c:url value="/home/productList.do?cateId=${product.cateId}"/>">
                                    ${i.name}
                                </a> >>
                            </c:if>
                        </c:forEach>
                        <a href="<c:url value="/home/productDetail.do?productId=${product.productId}"/>">${product.name}</a>
                    </div>
                    <div class="product__content">
                        <div class="row">
                            <div id="demo" class="carousel slide col-lg-6 col-md-6 col-sm-6" data-ride="carousel">
                                <!-- The slideshow -->
                                <div class="carousel-inner">
                                    <c:forEach items="${product.imgList}" varStatus="count" var="i">
                                        <c:if test ="${count.index == 0}">
                                            <div class="carousel-item active">
                                                <img class="img-fluid" src="<c:url value="${i.url}"/>">
                                            </div>
                                        </c:if>
                                        <div class="carousel-item">
                                            <img class="img-fluid" src="<c:url value="${i.url}"/>">
                                        </div>
                                    </c:forEach>
                                    <ul class="carousel-indicators" style="bottom: 0; margin: 0;background-color: #FFA500;width: 100%;">
                                        <c:forEach items="${product.imgList}" varStatus="count" var="i">
                                            <script>
                                                console.log(${count.index})
                                            </script>
                                            <li data-target="#demo" data-slide-to="${count.index } " class="${count.index  == 0 ? "active" : ""}"></li>
                                            </c:forEach>
                                    </ul>
                                    <!-- Left and right controls -->
                                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                        <div class="d-flex justify-content-center align-items-center img-nav-btn">
                                            <i class="m-0 fa-solid fa-chevron-left "></i>
                                        </div>
                                    </a>
                                    <a class="carousel-control-next" href="#demo" data-slide="next">
                                        <div class="d-flex justify-content-center align-items-center img-nav-btn" >
                                            <i class="m-0 fa-solid fa-chevron-right "></i>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <h3>${product.name}</h3>
                                <div style="margin: 10px 0; font-size: 20px; ">
                                    ${rating}
                                    <c:if test ="${rating == 0}"><span class="fa fa-star-o star"></span></c:if>
                                    <c:if test ="${rating > 0 && rating <= 0.5}"><span class="fa fa-star-half-o star"></span></c:if>
                                    <c:if test ="${rating > 0.5 }"><span class="fa fa-star star"></span></c:if>
                                    <c:if test ="${rating <= 1}"><span class="fa fa-star-o star"></span></c:if>
                                    <c:if test ="${rating > 1 && rating <= 1.5}"><span class="fa fa-star-half-o star"></span></c:if>
                                    <c:if test ="${rating > 1.5}"><span class="fa fa-star star"></span></c:if>
                                    <c:if test ="${rating <= 2}"><span class="fa fa-star-o star"></span></c:if>
                                    <c:if test ="${rating > 2 && rating <=2.5}"><span class="fa fa-star-half-o star"></span></c:if>
                                    <c:if test ="${rating > 2.5}"><span class="fa fa-star star"></span></c:if>
                                    <c:if test ="${rating <= 3}"><span class="fa fa-star-o star"></span></c:if>
                                    <c:if test ="${rating > 3 && rating <= 3.5}"><span class="fa fa-star-half-o star"></span></c:if>
                                    <c:if test ="${rating > 3.5}"><span class="fa fa-star star"></span></c:if>
                                    <c:if test ="${rating <= 4}"><span class="fa fa-star-o star"></span></c:if>
                                    <c:if test ="${rating > 4 && rating <= 4.5}"><span class="fa fa-star-half-o star"></span></c:if>
                                    <c:if test ="${rating > 4.5}"><span class="fa fa-star star"></span></c:if>
                                    </div>
                                    <div style="display: flex;">
                                        <p style="margin-right: 30%">Đã bán: <span class="product_content">${product.soldCount}</span></p>
                                    <p>Đánh giá: <span class="product_content">${reviewer.size()}</span></p>

                                </div>
                                <p>Sản phẩm có sẵn: <span class="product_content">${product.quantity}</span><p/>
                                <h2 style="color: #E72425; text-align: right; margin-right: 20px;">
                                    <fmt:setLocale value="vi_VN"/>
                                    <fmt:formatNumber  type = "currency" value="${product.price}"/></h2>
                                <script>
                                    var isNullUser = true
                                    <c:if test="${user != null}">
                                    isNullUser = false
                                    </c:if>
                                </script>
                                <div class="buy d-flex justify-content-around" style="margin: 50px 0 20px 0;">
                                    <button onclick="addOrder(${product.productId})">Mua</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="br-form">
                    <h5>Thông tin người bán</h5>
                    <div style="display: flex">
                        <div class="col-md-5 col-sm-5 font-a" style="display: flex">
                            <a href="<c:url value="/user/shopInformation.do?seller=${seller.email}"/>" class="avatar">
                                <img src="<c:url value="${seller.avatarLink}"/>" alt="">
                            </a>
                            <p><a href="<c:url value="/user/shopInformation.do?seller=${seller.email}"/>">${seller.firstName} ${seller.lastName}</a></p>
                        </div>
                        <div class="col-md-7 col-sm-7">
                            <p>Số điện thoại: <span>${seller.phone}</span></p>
                        </div>

                    </div><p>Địa chỉ: <span>${seller.address.houseNumber} ${seller.address.wardName}
                            ${seller.address.districtName} ${seller.address.cityName}</span></p>
                </div>
                <div class="br-form">
                    <h5>Mô tả chi tiết: </h5>
                    <p style="padding: 10px 0 10px 0;">${product.description}</p>
                </div>
                <div class="br-form">
                    <h5 style="margin-top: 5px;">Đánh giá sản phẩm</h5>
                    <div class="review">
                        <c:if test="${empty reviewer}">
                            <p style="text-align: center;">Hiện chưa có đánh giá nào</p>
                        </c:if>
                        <c:forEach items="${reviewer}" var="i">
                            <div class="font-a" style="display: flex">
                                <a href="<c:url value="/home/main.do"/>" class="reviewer">
                                    <img src="<c:url value="${i.avatarLink}"/>" alt="">
                                </a>
                                <p>
                                    <a href="#" style="margin-right: 20px;">${i.name}</a>
                                    <c:if test ="${i.rating == 0}"><span class="fa fa-star-o star-s"></span></c:if>
                                    <c:if test ="${i.rating > 0 && i.rating <= 0.5}"><span class="fa fa-star-half-o star-s"></span></c:if>
                                    <c:if test ="${i.rating > 0.5 }"><span class="fa fa-star star-s"></span></c:if>
                                    <c:if test ="${i.rating <= 1}"><span class="fa fa-star-o star-s"></span></c:if>
                                    <c:if test ="${i.rating > 1 && i.rating <= 1.5}"><span class="fa fa-star-half-o star-s"></span></c:if>
                                    <c:if test ="${i.rating > 1.5}"><span class="fa fa-star star-s"></span></c:if>
                                    <c:if test ="${i.rating <= 2}"><span class="fa fa-star-o star-s"></span></c:if>
                                    <c:if test ="${i.rating > 2 && i.rating <=2.5}"><span class="fa fa-star-half-o star-s"></span></c:if>
                                    <c:if test ="${i.rating > 2.5}"><span class="fa fa-star star-s"></span></c:if>
                                    <c:if test ="${i.rating <= 3}"><span class="fa fa-star-o star-s"></span></c:if>
                                    <c:if test ="${i.rating > 3 && i.rating <= 3.5}"><span class="fa fa-star-half-o star-s"></span></c:if>
                                    <c:if test ="${i.rating > 3.5}"><span class="fa fa-star star-s"></span></c:if>
                                    <c:if test ="${i.rating <= 4}"><span class="fa fa-star-o star-s"></span></c:if>
                                    <c:if test ="${i.rating > 4 && i.rating <= 4.5}"><span class="fa fa-star-half-o star-s"></span></c:if>
                                    <c:if test ="${i.rating > 4.5}"><span class="fa fa-star star-s"></span></c:if>
                                    </p>
                                </div>
                                <p>${i.comment}</p>
                            <span style="display: flex; justify-content: flex-end;">${i.date}</span>
                        </c:forEach>
                    </div>
                </div>
                <c:if test="${!empty productList}">
                    <div class="br-form">
                        <div  class="d-flex justify-content-between">
                            <h3 class="font-a">Các sản phẩm khác của 
                                <a href="#">${seller.firstName} ${seller.lastName}</a>
                            </h3>
                            <a href="#">Xem thêm >></a>
                        </div>
                        <div class="product__content row" style="margin: 0 -5px;">
                            <c:forEach items="${productList}" var="i">
                                <div class=" col-lg-2 col-md-3 col-sm-4 col-4" 
                                     style="padding: 5px; position: static;">
                                    <div class="product__item">
                                        <a href="<c:url value="/home/productDetail.do?productId=${i.productId}"/>">
                                            <img class="img-fluid" src="${i.getMainImage().url}" alt="">
                                            <p class="tooltip-text hinden-text">${i.name}
                                                <span>${i.name}</span>
                                            </p>
                                            <fmt:setLocale value="vi_VN"/>
                                            <div style="display: flex; justify-content: flex-end; padding-top: 5px;">
                                                <fmt:formatNumber value="${i.price}" type="currency"/>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <c:if test="${!empty productListCategory}">
                    <div class="br-form" style="padding-bottom: 5px;">
                        <div style="display: flex; justify-content: space-between;">
                            <h3 class="font-a">Các sản phẩm cùng loại khác </h3>
                            <a href="#">Xem thêm >></a>
                        </div>
                        <div class="product__content row" style="margin: 0 -5px;">
                            <c:forEach items="${productListCategory}" var="i">
                                <div class=" col-lg-2 col-md-3 col-sm-4 col-4" 
                                     style="padding: 5px; position: static;">
                                    <div class="product__item">
                                        <a href="<c:url value="/home/productDetail.do?productId=${i.productId}"/>">
                                            <img class="img-fluid" src="${i.getMainImage().url}" alt="">
                                            <p class="tooltip-text hinden-text">${i.name}
                                                <span>${i.name}</span>
                                            </p>
                                            <fmt:setLocale value="vi_VN"/>
                                            <div style="display: flex; justify-content: flex-end; padding-top: 5px;">
                                                <fmt:formatNumber value="${i.price}" type="currency"/>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </c:if>
        </div>
    </body>
    <script>
        const addOrder = (pId) => {
            if (isNullUser == true) {
                localStorage.setItem("previousUrl", window.location.href)
                window.location.href = '/ProjectGroup6/user/login.do'
            }
            $.ajax("<c:url value="/cart/cart.do"/>", {
                data: {
                    func: 'add',
                    pId: pId,
                },
                success: function (data, textStatus, jqXHR) {
                    swal("Đã thêm vào giỏ hàng", {
                        icon: "success",
                        buttons: false,
                        timer: 1000
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("Thêm vào giỏ hàng thất bại!!!", {
                        icon: "error",
                        buttons: false,
                        timer: 1000
                    });
                }
            })
        }
        const tooltips = document.querySelectorAll('.tooltip-text span');
        //        window.onmousemove = function (e) {
//            var x = (e.clientX + 20) + 'px',
//                    y = (e.clientY + 20) + 'px';
//            for (var i = 0; i < tooltips.length; i++) {
//                tooltips[i].style.top = y;
//                tooltips[i].style.left = x;
//            }
//        };
        var style = document.createElement('style');
        document.head.appendChild(style);
        var matchingElements = [];
        var allElements = document.getElementsByTagName('*');
        for (var i = 0, n = allElements.length; i < n; i++) {
            var attr = allElements[i].getAttribute('.tooltip-text span');
            if (attr) {
                allElements[i].addEven
                tListener('mouseover', hoverEvent);
            }
        }
        function hoverEvent(event) {
            event.preventDefault();
            x = event.x - this.offsetLeft;
            y = event.y - this.offsetTop;
            y += 10;
            style.innerHTML = '*[data-tooltip]::after { left: ' + x + 'px; top: ' + y + 'px  }'
        }
        let setBtn = () => {
            const btn = document.querySelector('.buy').querySelector('button')
            if (${product.quantity} == 0) {
                btn.setAttribute('disabled', true);
                btn.innerHTML = 'Hết hàng';
                btn.style.backgroundColor = 'GRAY';
            } else if (${product.status == 0} || ${empty product.authen}) {
                btn.setAttribute('disabled', true);
                btn.innerHTML = 'Ngưng bán';
                btn.style.color = 'black';
                btn.style.backgroundColor = 'GRAY';
            } else if (${empty product.status}) {
                btn.setAttribute('disabled', true);
                btn.innerHTML = 'Đã xóa';
                btn.style.color = 'black';
                btn.style.backgroundColor = 'GRAY';
            }
        }
        $(document).ready(function () {
            setBtn();
        });
    </script>
</html>