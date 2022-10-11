<%-- 
    Document   : reviewAuthen
    Created on : Sep 14, 2022, 6:49:10 AM
    Author     : ADmin
--%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="/DataTables/datatables.css">

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reviews</title>
        <style>
            a{text-decoration: none;}
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
            .product-img {
                width: 100px;
                height: 100px;
                padding: 0;
                margin: 0;
            }

            .product-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            /*            .product-img-review {
                            width: 80px;
                            height: 80px;
                            padding-bottom: 10px;
                            padding-right: 10px;
                        }
                        .product-img-review-active {
                            margin-bottom: 10px;
                            width: 100%;
                            height: auto;
                            max-height: 150px;
                        }*/
            .search1 {
                margin-left: 80%;
                margin-bottom: 30px;
            }
            /* ngôi sao đánh giá */
            .rating-container {
                color: #fbc531;
                display: flex;
            }
            button{
                font-size: 10px;
                padding: 0;
                width: 100%;
                height: 50px;
            }
        </style>
    </head>

    <body>
        <div class="container-fluid">
            <h1 class="display-4 my-4 text-info">List of users</h1>
            <table class="table table-striped" id="users" style="width: 100%;">
                <thead >
                    <tr id="list-header">
                        <th class="col-1" scope="col">Ngày đăng</th>
                        <th class="col-2" scope="col">Người đăng</th>
                        <th class="col-3" scope="col">Sản phẩm</th>
                        <th class="col-5" scope="col">Đánh giá</th>
                        <th class="col-1" scope="col">Lựa chọn</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${reviewList}" var="i">
                        <tr>
                            <td>${i.date}</td>
                            <td>${i.avatarLink} ${i.name}</td>
                            <td>
                                ${i.product.getName()}
                                <!--${i.product.getMainImage().getUrl()}-->
                                <div class="product-img">
                                    <img src="<c:url value="${i.product.getMainImage().getUrl()}"/>" alt="">

                                </div>

                            </td>
                            <td>
                                ${i.rating}
                                ${i.comment}
                                <c:forEach items="${i.image}" var="u">
                                    <div class="product-img">
                                        <img src="<c:url value="${u.getUrl()}"/>" alt="">
                                    </div>
                                </c:forEach>
                            </td>
                            <td>
                                <button type="button" class="btn btn-success mb-3">Chấp nhận</button>
                                <button type="button" class="btn btn-danger mb-3">Từ chối</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script type="text/javascript" charset="utf8" src="/DataTables/datatables.js"></script>
    </body>

</html>