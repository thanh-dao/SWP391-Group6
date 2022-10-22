
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
        <c:if test="${not empty productList}">
            <div class="container br-form">
                <h3 style="text-align: center; ">Duyệt sản phẩm</h3>
                <ul class="nav nav-tabs" style="margin-bottom: 20px;">               
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<c:url value="/order/stored.do?status=ar"/>">Đang bán</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="<c:url value="/order/stored.do?status=nary"/>">Đang chờ duyệt</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="<c:url value="/order/stored.do?status=nar"/>">Không được duyệt</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="<c:url value="/order/stored.do?status=ss"/>">Ngừng bán</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="<c:url value="/order/stored.do?status=oos"/>">Hết hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">Dashboard</a>
                    </li>
                </ul>
                <table class="table table-striped" id="productTable">
                    <thead style="background-color: #FFEFD5;">
                        <tr id="list-header">
                            <th class="col-1" scope="col">Ngày đăng</th>
                            <th class="col-6" scope="col">Sản phẩm</th>
                            <th scope="col" class="col-1">Hình ảnh</th>
                            <th class="col-2" scope="col">Giá</th>
                            <th class="col-2" scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </c:if>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script>
            var table;
            var productList = ${productList};
                        console.log(productList);
            function formatPrice(price) {
                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(parseInt(price));
            }
            var modifiedUsers = [];
            function initTableData() {
                modifiedUsers = productList.map((p, index) => {
                    const dt = '<button type="button" class="btn btn-info" onclick="previewProduct(' + index + ')" data-toggle="modal" data-target="#exampleModalScrollable">Chi tiết</button>';
                    const ss = '<button type="button" class="btn btn-secondary" onclick="handleProduct(' + p.productId + ',option, this)" data-toggle="modal">Ngừng bán</button>';
                    const as = '<button type="button" class="btn btn-primary" onclick="handleProduct(' + p.productId + ',option, this)" data-toggle="modal">Bán lại</button>';
                    const d = '<button type="button" class="btn btn-danger mb-3" onclick="handleProduct(' + p.productId + ',option, this)">Xóa</button>';
                    const u = '<button type="button" class="btn btn-success mb-3" onclick="handleProduct(' + p.productId + ',option)">Cập nhật</button>';
                    if (String('${status}') == 'ar') {
                        option = dt + ss + u
                    } else if (String('${status}') == 'nar') {
                        option = dt + u + d
                    } else if (String('${status}') == 'nary') {
                        option = dt + u + d
                    } else if (String('${status}') == 'ss') {
                        option = dt + as + d
                    } else if (String('${status}') == 'oos') {
                        option = dt + u + d
                    }
                    console.log(option);
                    return {
                        id: p.productId,
                        date: p.date,
                        name: `<a href="/ProjectGroup6/home/productDetail.do?productId=` + p.productId + `"> 
                                <p class="tooltip-text">` + p.name + `<span>` + p.name + `</span></p>`,
                        image: p.image,
                        price: `<div style="display: flex; justify-content: flex-end; padding-top: 5px; color: red;">` + formatPrice(p.price) +
                                `</div>`,
                        option: option,
                        description: p.description
                    };
                });
                console.log(modifiedUsers);
                table = $('#productTable').DataTable({
                    "processing": true,
                    data: modifiedUsers,
                    columns: [
                        {data: 'date'},
                        {data: 'name'},
                        {data: 'image',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data.filter(i => i.isMainImg)[0].url + '"height="100" width="100"/>';
                            }
                        },
                        {data: 'price'},
                        {data: 'option'},
                    ]
                });
            }
//            const tabs = document.querySelectorAll(".nav-link")
//            // console.log(tabs)
//            const removeActiveClass = (elements) => {
//                elements.forEach(i => {
//                    i.classList.remove("active")
//                })
//            }
//            tabs.forEach(i => {
//                i.addEventListener("click", () => {
//                    removeActiveClass(tabs);
//                    i.classList.add("active");
//                })
//            });
        </script>
    </body>
</html>
