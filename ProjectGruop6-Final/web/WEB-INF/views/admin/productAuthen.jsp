<%-- 
    Document   : productAuthen
    Created on : Sep 14, 2022, 4:37:28 AM
    Author     : ADmin
--%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

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


            .table-res {
                display: inline-block;
                overflow-x: auto;
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

            .product-img {
                width: 200px;
                height: 200px;
            }
        </style>
        <title>Hello, world!</title>
    </head>

    <body>
        <div class="col d-flex">
            <!--Div that will hold the pie chart-->
            <div class="d-flex flex-column position-fixed text-white bg-dark pt-3 nav-menu">
                <a href="#" class="d-flex align-items-center mb-3 mb-md-0 overflow-hidden  text-white text-decoration-none">
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
                        <a href="<c:url value="/admin/productAuthen.do"/>" class="nav-link active text-white">
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
                    </li>

                    <li class="nav-item">
                        <a href="<c:url value="/admin/reviewAuthen.do"/>" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#people-circle"></use>
                            </svg>
                            Đánh giá
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="<c:url value="/admin/adminAuthen.do"/>" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#people-circle"></use>
                            </svg>
                            Admin
                        </a>
                    </li>
                </ul>
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
            <div class="table-responsive container p-3 ">
                <div class="table-responsive-md container p-3">
                    <table class="table caption-top table-striped table-bordered over-flow-y table-hover border-dark">
                        <caption>Danh sách sản phẩm</caption>
                        <thead>
                            <tr>
                                <th scope="col">SKU</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col">Giá tiền</th>
                                <th scope="col">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="">1</td>

                                <td>Tên sản phẩm</td>
                                <td>
                                    <img class="img-fluid product-img" src="<c:url value="/images/930x700.png"/>" alt="">
                                </td>
                                <td>
                                    Giá tiền
                                <td>
                                    <div class="d-flex gap-3 ">
                                        <div class="col">
                                            <button type="button" class="btn btn-danger mb-3 "><a href="<c:url value="/admin/checkProductAd.do"/>"/>Chi tiết</a></button>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td style="">2</td>

                                <td>Tên sản phẩm</td>
                                <td>
                                    <img class="img-fluid product-img" src="<c:url value="/images/930x700.png"/>" alt="">
                                </td>
                                <td>
                                    Giá tiền
                                <td>
                                    <div class="d-flex gap-3 ">
                                        <div class="col">
                                            <button type="button" class="btn btn-danger mb-3"><a href="<c:url value="/admin/checkProductAd.do"/>"/>Chi tiết</a></button>
                                        </div>
                                    </div>
                                </td>
                            </tr><tr>
                                <td style="">3</td>

                                <td>Tên sản phẩm</td>
                                <td>
                                    <img class="img-fluid product-img" src="<c:url value="/images/930x700.png"/>" alt="">
                                </td>
                                <td>
                                    Giá tiền
                                <td>
                                    <div class="d-flex gap-3 ">
                                        <div class="col">
                                            <button type="button" class="btn btn-danger mb-3"><a href="<c:url value="/admin/checkProductAd.do"/>"/>Chi tiết</a></button>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                        </tbody>
                    </table>
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
            </div>

        </div>


        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script>
            const navElements = document.querySelectorAll(".nav-item");
            const removeActiveClass = (elements) => {
                elements.forEach(item => {
                    console.log("childNodes: ");
                    console.log(item.childNodes);
                    item.childNodes[1].classList.remove("active");
                })
            }
            navElements.forEach(i => {
                i.addEventListener("click", () => {
                    removeActiveClass(navElements)
                    i.childNodes[1].classList.add("active");
                })
            })
            const navBtn = document.querySelector(".navigate-button")
            let opened = false;
            const navMenu = document.querySelector(".nav-menu");

            navBtn.addEventListener("click", () => {
                console.log(1);
                opened = !opened;
                const navMenuStyle = navMenu.style
                if (opened) {

                    navBtn.innerHTML = '<ion-icon name="close-outline"></ion-icon>'
                    document.addEventListener("click", (e) => {
                        const classList = e.target.classList
                        if (!classList.contains("nav-menu") && !classList.contains("hydrated")) {
                            navMenuStyle.width = "0"
                            opened = false;
                            navBtn.innerHTML = '<ion-icon name="menu-outline"></ion-icon>'
                        }
                    })
                    navMenuStyle.width = "300px";
                } else {
                    navBtn.innerHTML = '<ion-icon name="menu-outline"></ion-icon>'
                    navMenuStyle.width = "0"
                }
            })

        </script>


    </body>
</html>
