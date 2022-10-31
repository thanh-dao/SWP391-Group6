<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="../css/main.css" rel="stylesheet" type="text/css"/>
        <style>
            .shop__background {
                /*background-color: red;*/
                /*background-color: #F1F9FF;*/
                /*background-color: #DCEDFC;*/
                /*background-color: #EAF1FB;*/
                background-image: linear-gradient(to bottom right, #002347, #F1F9FF);
                display: flex;
            }
            .shop__ava img {
                width: 30%;
            }
            .shop__button {
                display: flex;
                justify-content: space-around;
                margin-top: 20px;
            }
        </style>
        <script>
            const formatter = new Intl.NumberFormat('vn-VN', {
                style: 'currency',
                currency: 'VND',
                minimumFractionDigits: 0
            })
        </script>
    </head>
    <body>
        <div class="container">
            <div class="shop__content row br-form">
                <div class="left col-6 shop__background">
                    <div class="d-flex align-items-center">
                        <div class="avatar">
                            <img src="<c:url value="${seller.avatarLink}"/>" alt="">
                        </div>
                        <p class="avatar-name">${seller.firstName} ${seller.lastName}</p>
                    </div>
                </div>
                <div class="d-flex col-6 justify-content-between">
                    <div class="d-flex flex-column">
                        <p>Sảm phẩm: ${count == null ? "0" : count} </p>
                        <p>Đánh giá: ${rating == null ? "0" : count}</p>
                    </div>
                    <div class="d-flex flex-column">
                        <p>Tỉ lệ hủy đơn: ${cr == null ? "0" : count}</p>
                        <p>Địa chỉ: ${seller.address.cityName != null ? seller.address.cityName : "Địa chỉ chưa cập nhật"}</p>
                    </div>
                </div>
            </div>
            <c:if test="${!empty productList}">
                <div class="produrct row br-form">
                    <div  class="d-flex justify-content-between" style="width: 100%;">
                        <h4 class="font-a">Tất cả sản phẩm</h4>
                        <div><a href="#">Xem thêm >></a></div>
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
                                        <div id="id${i.productId}" style="display: flex; justify-content: flex-end; padding-top: 5px;">
                                            <script>
                                                document.querySelector("#id${i.productId}").innerHTML=formatter.format(${i.price})
                                            </script>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
