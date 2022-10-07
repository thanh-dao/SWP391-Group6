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
                    <li class="nav-item" style="display: ${ sessionScope.acc.roleId== 2 ? "block":"none"}">
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
            </div>
            <div class="table-responsive container p-3 ">
                <div class="table-responsive-md container p-3">
                    <table class="table caption-top table-striped table-bordered over-flow-y table-hover border-dark">
                        <caption>Danh sách sản phẩm</caption>
                        <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col">Giá tiền</th>
                                <th scope="col">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${listProduct}" varStatus="loop">
                                <tr>
                                    <td style="">${loop.count}</td>

                                    <td>${p.getName()}</td>
                                    <td>
                                        <img class="img-fluid product-img" src="<c:url value="${p.getMainImage().url}"/>" alt="">
                                    </td>
                                    <td>
                                        ${p.getPrice()} VNĐ
                                    <td>
                                        <div class="d-flex gap-3 ">
                                            <div class="col">
                                                <button type="button" class="btn btn-danger mb-3 "><a href="<c:url value="/admin/checkProductAd.do?productId=${p.productId}"/>"/>Chi tiết</a></button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

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
