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

            .font-a a{
                color: #FFA500;
                /*text-decoration: none;*/
            }

            .hinden-text {
                margin: 0;
                font-size: 16px;
                padding: 3px;
                width: 75px;
                overflow: hidden;
                white-space: nowrap; 
                text-overflow: ellipsis;
            }

            .tooltip-text {
                text-decoration:none;
                position:relative;
            }
            .tooltip-text span {
                display:none;
            }
            .tooltip-text:hover span {
                border-radius: 3px;
                font-size: 16px;
                padding: 1px 5px;
                display: block;
                position:fixed;
                overflow:hidden;
                background-color: #35363A;
                color: #CCC;
                z-index: 1000;
                white-space: nowrap;
            }

            a {
                color: black;
            }

            a:hover {
                color: none;
                text-decoration: none;
                color: #FFA500;
            }

            .br-form {
                background: #FFF;
                padding: 10px;
                border-radius: 3px;
                margin-bottom: 10px;
            }
        </style>
        <title>Hello, world!</title>
    </head>

    <body>
        <div class="col d-flex">
            <!--            Div that will hold the pie chart-->
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
                        <a href="<c:url value="/admin/productAuthen.do?status=nary"/>" class="nav-link active text-white">
                            <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#grid"></use>
                            </svg>
                            Sản phẩm
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
                        <a href="<c:url value="/admin/reviewAuthen.do?status=nary"/>" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#people-circle"></use>
                            </svg>
                            Đánh giá
                        </a>
                    </li>
                    <li class="nav-item" style="display: ${sessionScope.user.roleId == 1 ? "block":"none"}">
                        <a href="<c:url value="/admin/adminAuthen.do?status=user"/>" class="nav-link text-white">
                            <svg class="bi me-2" width="16" height="16">
                            <use xlink:href="#people-circle"></use>
                            </svg>
                            Admin
                        </a>
                    </li>
                </ul>
                <hr>
            </div>
        </div>
        <c:if test="${not empty productList}">
            <div class="container br-form">
                <h3 style="text-align: center; ">Duyệt sản phẩm</h3>
                <ul class="nav nav-tabs" style="margin-bottom: 20px;">               
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<c:url value="/admin/productAuthen.do?status=nary"/>">Chờ duyệt</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/admin/productAuthen.do?status=ar"/>">Đã duyệt</a>
                    </li>
                </ul>
                <table class="table table-striped" id="productTable">
                    <thead style="background-color: #FFEFD5;">
                        <tr id="list-header">
                            <th class="col-2" scope="col">Ngày đăng</th>
                            <th class="col-6" scope="col">Tên sản phẩm</th>
                            <th scope="col" class="col-1">Hình ảnh</th>
                            <th class="col-2" scope="col">Giá</th>
                            <th class="col-1" scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </c:if>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script>
            var table;
            var productList = ${productList};
            //            console.log(productList);
            var productName;
            function initTableData() {
                var modifiedUsers = productList.map(p => {
                    if (String('${status}') == 'nary') {
                        option = `<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">Launch demo modal</button>`;
                    } else if (String('${status}') == 'ar') {
                        option = `<button type="button" onclick="deleteProduct(` + p.productId + `, this)" class="btn btn-danger mb-3">Xóa</button>`;
                    }
                    console.log(option);
                    return {
                        date: p.date,
                        name: `<a href="/ProjectGroup6/home/productDetail.do?productId=` + p.productId + `"> 
                                <p class="tooltip-text">` + p.name + `<span>` + p.name + `</span></p>`,
                        image: p.image,
                        price: `<div style="display: flex; justify-content: flex-end; padding-top: 5px; color: red;">` + p.price +
                                `</div>`,
                        option: option,
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
                                return '<img src="' + data + '" alt="' + data + '"height="100" width="100"/>';
                            }
                        },
                        {data: 'price'},
                        {data: 'option'},
                    ]
                });
            }
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
            $(document).ready(function () {
                initTableData();
            });
            const deleteProduct = (pId, el) => {
                swal({
                    title: "",
                    text: "Bạn có muốn xóa sản phẩm này?",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                $.ajax("<c:url value="/GetProductAjax"/>", {
                                    data: {
                                        productId: pId,
                                        func: "deleteProduct",
                                        emailAdmin: '${sessionScope.user.email}',
                                    },
                                    success: function (data, textStatus, jqXHR) {
                                        swal("Đã xóa thành công", {
                                            icon: "success",
                                        });
                                        const tableRow = el.parentElement.parentElement
                                        tableRow.remove()
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        swal("Xóa thất bại!!!", {
                                            icon: "error",
                                        });
                                    }
                                })
                            }
                        });
            }
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
