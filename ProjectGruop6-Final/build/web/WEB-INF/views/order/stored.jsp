
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            .nav {
                /* just */
                background-color: #FFFF99;
                padding-left: 20px;

            }
            a{text-decoration: none;}
            .nav-item {
                /* padding: 0 10px; */
                /* background-color: #; */
            }

            .nav-link {
                /* padding: 10px; */
            }

            .nav-item:hover .nav-link {
                /* background-color: #F8F8FF; */
                /* color: #FFCC00; */
                /* font-size: 1.1rem; */
            }
        </style>
        <title>Document</title>
    </head>

    <body>
        <div class="container">
            <ul class="nav nav-tabs ">               
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Đang bán</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Hết hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Đang chờ duyệt</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="#">Dashboard</a>
                </li>
            </ul>
        </div>



        <div class="table-responsive container p-3 ">
            <div class="table-responsive-md container p-3">
                <table class="table caption-top table-striped table-bordered over-flow-y table-hover border-dark">
                    <caption>Danh sách sản phẩm đang bán</caption>
                    <thead>
                        <tr>
                            <th scope="col">SKU</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Hình ảnh</th>
                            <th scope="col">Giá tiền</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="">
                                1
                            </td>
                            <td>Tên sản phẩm</td>
                            <td>
                                <img class="img-fluid product-img" src="<c:url value="/images/690x400.png"/>" alt="">
                            </td>

                            <td>Giá tiền</td>
                            <td style="color: green">Thành công
                            </td>
                            <td>
                                <div class="d-flex gap-3 ">
                                    <div class="col">
                                        <button type="button" class="btn btn-info mb-3">Chi tiết</button>
                                        <button type="button" class="btn btn-success mb-3">Cập nhật</button>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td style="">
                                2
                            </td>
                            <td>Tên sản phẩm</td>
                            <td>
                                <img class="img-fluid product-img" src="<c:url value="/images/690x400.png"/>" alt="">
                            </td>

                            <td>Giá tiền</td>
                            <td style="color: green">Thành công
                            </td>
                            <td>
                                <div class="d-flex gap-3 ">
                                    <div class="col">
                                        <button type="button" class="btn btn-info mb-3">Chi tiết</button>
                                        <button type="button" class="btn btn-success mb-3">Cập nhật</button>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td style="">
                                3
                            </td>
                            <td>Tên sản phẩm</td>
                            <td>
                                <img class="img-fluid product-img" src="<c:url value="/images/690x400.png"/>" alt="">
                            </td>

                            <td>Giá tiền</td>
                            <td style="color: green">Thành công
                            </td>
                            <td>
                                <div class="d-flex gap-3 ">
                                    <div class="col">
                                        <button type="button" class="btn btn-info mb-3">Chi tiết</button>
                                        <button type="button" class="btn btn-success mb-3">Cập nhật</button>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td style="">
                                4
                            </td>
                            <td>Tên sản phẩm</td>
                            <td>
                                <img class="img-fluid product-img" src="<c:url value="/images/690x400.png"/>" alt="">
                            </td>

                            <td>Giá tiền</td>
                            <td style="color: green">Thành công
                            </td>
                            <td>
                                <div class="d-flex gap-3 ">
                                    <div class="col">
                                        <button type="button" class="btn btn-info mb-3">Chi tiết</button>
                                        <button type="button" class="btn btn-success mb-3">Cập nhật</button>
                                    </div>
                                </div>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination d-flex justify-content-center">
                    <li class="page-item "><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script>
            const tabs = document.querySelectorAll(".nav-link")
            // console.log(tabs)
            const removeActiveClass = (elements) => {
                elements.forEach(i => {
                    i.classList.remove("active")
                })
            }
            tabs.forEach(i => {
                i.addEventListener("click", () => {
                    removeActiveClass(tabs);
                    i.classList.add("active");
                })
            });
        </script>
    </body>

</html>
