<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            body{
                background: #FFFEFB;
            }
            .navigate-button {
                width: 30px;
                height: 30px;
                font-size: 1.5rem;
                display: flex;
                justify-content: center;
                align-items: center;
                border: none;
                margin: 0;
                box-sizing: content-box;
            }

            .nav-menu {
                transition: 0.3s;
                height: 100vh;
                width: 0;
            }

            .img-container {
                max-width: 350px !important;
            }

            .img-container>div {
                min-width: 300px;
                max-width: 90%;
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: space-around;
            }

            .product-img {
                width: 80px;
                height: 80px;
                margin-right: 10px;
            }

            .product-img img {
                width: 80px;
                height: 80px;
            }

            .order-link {
                cursor: pointer;
            }
            a{text-decoration: none;}

            .br-form {
                background: #F1F9FF;
                padding: 10px;
                border-radius: 3px;
                margin-bottom: 20px;
            }

            .br-od{
                padding-bottom: 20px;
                margin-top: 15px;
                border-bottom: 1.5px solid rgba(0,0,0,.09);
            }

            .hinden-text {
                margin: 0;
                font-size: 16px;
                padding: 3px;
                width: 100%;
                overflow: hidden;
                white-space: nowrap; 
                text-overflow: ellipsis;
                /*border-bottom: 1.5px solid rgba(0,0,0,.09);*/
            }
            .tooltip {
                position: relative;
                display: inline-block;
                border-bottom: 1px dotted black;
            }

            .tooltip .tooltiptext {
                visibility: hidden;
                width: 120px;
                background-color: black;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 5px 0;

                /* Position the tooltip */
                position: absolute;
                z-index: 1;
                top: 100%;
                left: 50%;
                margin-left: -60px;
            }

            .tooltip:hover .tooltiptext {
                visibility: visible;
            }

        </style>
        <title>＃</title>
    </head>
    <body>
        <div class="container">
            <h3>Lịch sử đơn hàng</h3>
            <div class="table-responsive container p-3 mt-5 mb-5">
                <c:forEach items="${orderList}" var="o">
                    <c:forEach items="${o.orderByShopList}" var="obs">
                        <div class="br-form">
                            <h6 class="d-flex">
                                <div class="mr-auto p-2">
                                    <span style="margin-right: 10px;">${obs.name}</span>
                                    <a href="#">
                                        Xem shop >>
                                    </a>
                                </div>
                                <div class="p-2">
                                    <c:choose>
                                        <c:when test = "${obs.status == 0}">
                                            <div style="color: red;">
                                                Đã hủy
                                            </div>
                                        </c:when>
                                        <c:when test = "${obs.status == 1}">
                                            <div style="color: green;">
                                                Giao hàng thành công
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div style="color: red;">
                                                Đang giao hàng
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>                                    
                                <a class="p-2" href="<c:url value="/cart/billInformation.do?osId=${obs.orderByShopId}"/>">Xem chi tiết >></a>
                            </h6>
                            <c:forEach items="${obs.orderDetailList}" var="od">
                                <!--<tr class="order-link" href="<c:url value="/cart/billInformation.do"/>">-->
                                <div class="d-flex br-od">
                                    <div class="product-img p-2">
                                        <img src="<c:url value="${od.product.getMainImage().url}"/>" alt="">
                                    </div>
                                    <div class="d-flex flex-column p-2">
                                        <a href="<c:url value="/home/productDetail.do?productId=${od.product.productId}"/>">
                                            <p class="tooltip-text hinden-text">
                                                ${od.product.name}
                                                <!--<span>${od.product.name}</span>-->
                                            </p></a>
                                        x${od.quantity}
                                    </div>
                                    <p class="text-right ml-auto p-2">${od.price}</p>
                                </div>
                            </c:forEach>
                            <p class="d-flex justify-content-end" 
                               style="padding: 20px 10px; margin: 0;">
                                Tổng số tiền: 
                                ${obs.total}
                            </p>
                            <div class="d-flex justify-content-end">
                                <button type="button" class="btn btn-primary">Mua lại</button>
                                <button type="button" class="btn btn-light">Đánh giá</button>
                            </div>
                        </div>
                    </c:forEach>
                </c:forEach>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script>
            function formatPrice(price) {
                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(parseInt(price));
            }
            const orderLinks = document.querySelectorAll(".order-link");
            console.log(orderLinks)
            orderLinks.forEach(i => {

                i.addEventListener("mousedown", () => {
                    clicked = true
                })
                i.addEventListener("mousemove", () => {
                    clicked = false
                })
                i.addEventListener("mouseup", () => {
                    if (clicked) {
                        window.location.href = i.getAttribute("href");
                    }
                })
            })
//            var style = document.createElement('style');
//            document.head.appendChild(style);
//            var matchingElements = [];
//            var allElements = document.getElementsByTagName('*');
//            for (var i = 0, n = allElements.length; i < n; i++) {
//                var attr = allElements[i].getAttribute('.tooltip-text span');
//                if (attr) {
//                    allElements[i].addEven
//                    tListener('mouseover', hoverEvent);
//                }
//            }
//            function hoverEvent(event) {
//                event.preventDefault();
//                x = event.x - this.offsetLeft;
//
//                y = event.y - this.offsetTop;
//                y += 10;
//                style.innerHTML = '*[data-tooltip]::after { left: ' + x + 'px; top: ' + y + 'px  }'
//            }
        </script>
    </body>
</html>
