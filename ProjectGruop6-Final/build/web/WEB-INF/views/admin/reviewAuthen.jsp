<%-- 
    Document   : reviewAuthen
    Created on : Sep 14, 2022, 6:49:10 AM
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

            .product-img-review {
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
            }
            
            .search1 {
                margin-left: 80%;
                margin-bottom: 30px;
            }

            /* ngôi sao đánh giá */
            .rating-container {
                color: #fbc531;
                display: flex;
            }
        </style>
    </head>

    <body>
        <div class="container-fluid">
            <div class="col d-flex">
                <!--Div that will hold the pie chart-->
                <div class="d-flex flex-column position-fixed text-white bg-dark pt-3 nav-menu">
                    <a href="#"
                       class="d-flex align-items-center mb-3 mb-md-0 overflow-hidden  text-white text-decoration-none">
                        <svg class="bi me-2" width="40" height="32">
                        <use xlink:href="#bootstrap"></use>
                        </svg>
                        <span class="fs-4 text-align">Home</span>
                    </a>
                    <button class="navigate-button position-absolute" type="button">
                        <ion-icon name="menu-outline"></ion-icon>
                    </button>
                    <hr>
                    <ul class="nav nav-pills flex-column overflow-hidden mb-auto ">
                        <li class="nav-item">
                            <a href="<c:url value="/admin/productAuthen.do"/>" class="nav-link text-white">
                                <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#grid"></use>
                                </svg>
                                Sản phẩm
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/admin/deleteProduct.do"/>" class="nav-link text-white">
                                <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#grid"></use>
                                </svg>
                                Xóa sản phẩm
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/admin/dashBroad.do"/>" class="nav-link text-white">
                                <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#table"></use>
                                </svg>
                                Dashboard
                            </a>
                        </li                     
                        <li class="nav-item">
                            <a href="<c:url value="/admin/reviewAuthen.do"/>" class="nav-link active text-white">
                                <svg class="bi me-2" width="16" height="16">
                                <use xlink:href="#people-circle"></use>
                                </svg>
                                Đánh giá
                            </a>
                        </li>
                    </ul>
                    <hr>
                    <div class="dropdown p-3">
                        <a href="#"
                           class="d-flex align-items-center overflow-hidden text-white text-decoration-none dropdown-toggle"
                           id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                            <strong>mdo</strong>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                            <li><a class="dropdown-item" href="<c:url value="/user/userInformaion.do"/>">Trang</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Đăng Xuất</a></li>
                        </ul>
                    </div>
                </div>
                <div class="table-responsive container p-3 mt-5 mb-5">
                    <input class="search1" type="text">
                    <table class="table caption-top table-striped table-bordered table-hover border-dark">
                        <caption>Danh sách đánh giá</caption>
                        <thead>
                            <tr>
                                <th scope="col">Stt</th>
                                <th scope="col">Tên khách hàng</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col">Bình luận</th>
                                <th scope="col">Đánh giá</th>
                                <th scope="col">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td>1</td>
                                <td>Tên khách hàng 1</td>
                                <td>Tên sản phẩm</td>
                                <td class="img-container">
                                    <div>
                                        <!-- <img class="img-fluid  product-img-review-active " src="./img/930x700.png" alt=""> -->
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                    </div>
                                </td>
                                <td>Bình Luận<br>
                                    Bình Luận<br>
                                </td>
                                <td>
                                    <div class="rating-container">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex gap-3 ">
                                        <div class="col">
                                            <button type="button" class="btn btn-success mb-3">Approve</button>
                                            <button type="button" class="btn btn-danger mb-3">Reject</button>

                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>2</td>
                                <td>Tên khách hàng 2</td>
                                <td>Tên sản phẩm</td>
                                <td class="img-container">
                                    <div>
                                        <!-- <img class="img-fluid  product-img-review-active " src="./img/930x700.png" alt=""> -->
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">

                                    </div>
                                </td>
                                <td>Bình Luận<br>
                                    Bình Luận<br>
                                </td>
                                <td>
                                    <div class="rating-container">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex gap-3 ">
                                        <div class="col">
                                            <button type="button" class="btn btn-success mb-3">Approve</button>
                                            <button type="button" class="btn btn-danger mb-3">Reject</button>

                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>3</td>
                                <td>Tên khách hàng 3</td>
                                <td>Tên sản phẩm</td>
                                <td class="img-container">
                                    <div>
                                        <!-- <img class="img-fluid  product-img-review-active " src="./img/930x700.png" alt=""> -->
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">
                                        <img class="img-fluid product-img-review " src="<c:url value="/images/690x400.png"/>" alt="">

                                    </div>
                                </td>
                                <td>Bình Luận<br>
                                    Bình Luận<br>
                                </td>
                                <td>
                                    <div class="rating-container">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex gap-3 ">
                                        <div class="col">
                                            <button type="button" class="btn btn-success mb-3">Approve</button>
                                            <button type="button" class="btn btn-danger mb-3">Reject</button>

                                        </div>
                                    </div>
                                </td>
                            </tr>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination d-flex justify-content-center">
                <li class="page-item"><a class="page-link" href="#">Trước</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Sau</a></li>
            </ul>
        </nav>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </body>

</html>