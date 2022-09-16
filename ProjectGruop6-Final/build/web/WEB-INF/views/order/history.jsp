<%-- 
    Document   : history
    Created on : Sep 14, 2022, 6:42:12 AM
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
        <style>
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

            td {
                word-wrap: break-word;
                max-width: 200px;
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

            .product-img-review {
                width: 80px;
                height: 80px;
                padding-bottom: 10px;
                padding-right: 10px;
            }

            .product-history-img {
                /* display: flex; */
                text-align: left;
                width: 80px;
                height: 80px;
            }

            .product-history-img div {
                width: 100%;
                height: 100%;
            }

            .product-price {
                text-align: right;
            }

            .order-link {
                cursor: pointer;
            }
            a{text-decoration: none;}
        </style>
        <title>＃</title>
    </head>

    <body>

        <div class="container">
            <h3>Lịch sử đơn hàng</h3>
            <div class="table-responsive container p-3 mt-5 mb-5">

                <table class="table caption-top table-striped table-hover">                                   
                    <caption>#Mã Đơn Hàng 1</caption>
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="order-link" href="<c:url value="/cart/billInformation.do"/>">
                            <td class="product-history-img">
                                <div>
                                    <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                </div>
                            </td>
                            <td>
                                <div class="history-text">
                                    <p class="product-name">Tên sản phẩm</p>
                                    <p class="product-store">
                                        Số lượng sản phẩm: 1
                                    </p>
                                </div>
                            </td>
                            <td>
                                <p class="product-price">Giá tiền</p>
                            </td>
                        </tr>
                        <tr class="order-link" href="<c:url value="/cart/billInformation.do"/>">
                            <td class="product-history-img">
                                <div>
                                    <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                </div>
                            </td>
                            <td>
                                <div class="history-text">
                                    <p class="product-name">Tên sản phẩm</p>
                                    <p class="product-store">
                                        Số lượng sản phẩm: 1
                                    </p>
                                </div>
                            </td>
                            <td>
                                <p class="product-price">Giá tiền</p>
                            </td>
                        </tr>
                        <tr class="order-link" href="<c:url value="/cart/billInformation.do"/>">
                            <td class="product-history-img">
                                <div>
                                    <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                </div>
                            </td>
                            <td>
                                <div class="history-text">
                                    <p class="product-name">Tên sản phẩm</p>
                                    <p class="product-store">
                                        Số lượng sản phẩm: 2
                                    </p>
                                </div>
                            </td>
                            <td>
                                <p class="product-price">Giá tiền</p>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <table class="table caption-top table-striped table-hover">                                   
                    <caption>#Mã Đơn Hàng 2</caption>
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="order-link" href="<c:url value="/cart/billInformation.do"/>">
                            <td class="product-history-img">
                                <div>
                                    <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                </div>
                            </td>
                            <td>
                                <div class="history-text">
                                    <p class="product-name">Tên sản phẩm</p>
                                    <p class="product-store">
                                        Số lượng sản phẩm: 1
                                    </p>
                                </div>
                            </td>
                            <td>
                                <p class="product-price">Giá tiền</p>
                            </td>
                        </tr>
                        <tr class="order-link" href="<c:url value="/cart/billInformation.do"/>">
                            <td class="product-history-img">
                                <div>
                                    <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                </div>
                            </td>
                            <td>
                                <div class="history-text">
                                    <p class="product-name">Tên sản phẩm</p>
                                    <p class="product-store">
                                        Số lượng sản phẩm: 1
                                    </p>
                                </div>
                            </td>
                            <td>
                                <p class="product-price">Giá tiền</p>
                            </td>
                        </tr>
                        <tr class="order-link "href="<c:url value="/cart/billInformation.do"/>">
                            <td class="product-history-img">
                                <div>
                                    <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                </div>
                            </td>
                            <td>
                                <div class="history-text">
                                    <p class="product-name">Tên sản phẩm</p>
                                    <p class="product-store">
                                        Số lượng sản phẩm: 2
                                    </p>
                                </div>
                            </td>
                            <td>
                                <p class="product-price">Giá tiền</p>
                            </td>
                        </tr>
                    </tbody>
                </table>



            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script>
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
        </script>
    </body>

</html>
