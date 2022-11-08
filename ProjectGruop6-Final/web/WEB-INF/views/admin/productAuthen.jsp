<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--DataTables--> 
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
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
                z-index: 1;
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
                <li class="nav-item" onclick="setActive(this)">
                    <a href="<c:url value="/admin/productAuthen.do?status=nary"/>" class="nav-link active text-white">
                        <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#grid"></use>
                        </svg>
                        Sản phẩm
                    </a>
                </li>
                <li class="nav-item " onclick="setActive(this)">
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
        <div class="col d-flex">
            <!--            Div that will hold the pie chart-->

        </div>
        <c:if test="${not empty productList}">
            <div class="container br-form">
                <h3 style="text-align: center; ">Kiểm duyệt sản phẩm</h3>
                <ul class="nav nav-tabs" style="margin-bottom: 20px;">               
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<c:url value="/admin/productAuthen.do?status=nary"/>">Chờ duyệt</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="<c:url value="/admin/productAuthen.do?status=ar"/>">Đã duyệt</a>
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



        <!-- Modal -->
        <div class="modal fade bd-example-modal-xl" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">Chi tiết sản phẩm</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <html>
                            <head>
                                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                                <title>Product Detail</title>
                                <link href="<c:url value="/css/productDetail.css"/>" rel="stylesheet" type="text/css"/>

                            </head>
                            <body>
                                <div class="container" >
                                    <div class="br-form">

                                        <div class="product__content">
                                            <div class="row">
                                                <div id="demo" class="carousel slide col-lg-6 col-md-6 col-sm-6" data-ride="carousel">
                                                    <div class="bd-example">
                                                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                                            <ol class="carousel-indicators-modal">

                                                            </ol>
                                                            <div class="carousel-inner">

                                                            </div>
                                                            <a style="background-color:  #4c1a1b;" class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                            <a  style="background-color:  #4c1a1b;"  class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                                <span class="sr-only">Next</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 col-md-6 col-sm-6">
                                                    <h3 class="product-name-modal"></h3>

                                                    <div style="display: flex;">
                                                        <p style="margin-right: 30%">Đã bán: <span class="font-bold">0</span></p>
                                                        <p>Đánh giá: <span class="font-bold">0</span></p>

                                                    </div>
                                                    <p>Số lượng sản phẩm: <span class="font-bold product-quantity"></span><p/>
                                                    <h2 style="color: #E72425; text-align: right; margin-right: 20px;">
                                                        <fmt:setLocale value="vi_VN"/>
                                                        <fmt:formatNumber  type = "currency" value="${product.price}"/></h2>
                                                    <div class="buy d-flex justify-content-around" style="margin: 50px 0 20px 0;">
                                                        <button type="button" onclick="return false">Mua</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="br-form">
                                        <h5>Thông tin người bán</h5>
                                        <div style="display: flex">
                                            <div class="col-md-5 col-sm-5 font-a" style="display: flex">
                                                <a href="#" class="avatar">
                                                    <img src="" alt="">
                                                </a>
                                                <p><a href="#" class="seller-name">${sessionScope.user.firstName} ${sessionScope.user.lastName}</a></p>
                                            </div>
                                            <div class="col-md-7 col-sm-7">
                                                <p>Số điện thoại: <span class="seller-phone">${sessionScope.user.phone}</span></p>

                                            </div>

                                        </div><p>Địa chỉ: <span class="seller-address"></span></p>
                                    </div>

                                    <div class="br-form">
                                        <h5>Mô tả chi tiết: </h5>
                                        <p id="description-preview"style="padding: 10px 0 10px 0;">${product.description}</p>
                                    </div>
                            </body>
                            <script>
                                const tooltips = document.querySelectorAll('.tooltip-text span');
                                //        window.onmousemove = function (e) {
                                //            var x = (e.clientX + 20) + 'px',
                                //                    y = (e.clientY + 20) + 'px';
                                //            for (var i = 0; i < tooltips.length; i++) {
                                //                tooltips[i].style.top = y;
                                //                tooltips[i].style.left = x;
                                //            }
                                //        };
                                var style = document.createElement('style');
                                document.head.appendChild(style);
                                var matchingElements = [];
                                var allElements = document.getElementsByTagName('*');
                                for (var i = 0, n = allElements.length; i < n; i++) {
                                    var attr = allElements[i].getAttribute('.tooltip-text span');
                                    if (attr) {
                                        allElements[i].addEventListener('mouseover', hoverEvent);
                                    }
                                }
                                function hoverEvent(event) {
                                    event.preventDefault();
                                    x = event.x - this.offsetLeft;
                                    y = event.y - this.offsetTop;
                                    y += 10;
                                    style.innerHTML = '*[data-tooltip]::after { left: ' + x + 'px; top: ' + y + 'px  }'
                                }
                            </script>
                        </html>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Không duyệt</button>
                        <button type="button" class="btn btn-success">Duyệt</button>
                    </div>
                </div>
            </div>
        </div>                    
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script>
                                const params = new Proxy(new URLSearchParams(window.location.search), {
                                    get: (searchParams, prop) => searchParams.get(prop),
                                });
                                function redirect(productId) {
                                    window.open('/ProjectGroup6/admin/checkProductAd.do?productId=' + productId, '_blank');
                                }
                                var table;
                                var productList = ${productList};
                                //            console.log(productList);
                                var productName;
                                function formatPrice(price) {
                                    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(parseInt(price));
                                }
                                var modifiedUsers = []

                                function  previewProduct(index) {

                                    const product = modifiedUsers[index];
                                    console.log(product)
                                    $.ajax("<c:url value="/GetsellerAjax"/>", {
                                        data: {
                                            proId: product.id
                                        },
                                        success: function (data) {
                                            data = JSON.parse(data)
                                            document.querySelector(".avatar img").src = data.avatarLink;
                                            document.querySelector(".seller-name").innerHTML = data.firstName + " " + data.lastName;
                                            document.querySelector(".seller-phone").innerHTML = data.phone;
                                            document.querySelector(".seller-address").innerHTML = data.address.houseNumber + " " + data.address.wardName + " " +
                                                    data.address.districtName + " " + data.address.cityName;
                                        }
                                    })
                                    document.querySelector("#description-preview").innerHTML = product.description;
                                    document.querySelector(".product-name-modal").innerHTML = product.name;
                                    const indicatiorModal = document.querySelector(".carousel-indicators-modal");
                                    const carouselInnerModal = document.querySelector(".carousel-inner");
                                    for (var i = 0; i < product.image.length; i++) {
                                        const img = product.image[i];
                                        console.log("img" + JSON.stringify(img))
                                        carouselInnerModal.innerHTML +=
                                                '<div class="carousel-item ' + (i == 0 ? 'active' : '') + '" >' +
                                                '<img src="' + img.url + ' " class="d-block w-100" alt="">' +
                                                `</div>
                                                </div>`
                                    }
                                    const tableRow = document.querySelectorAll('tbody tr')[index]
                                    document.querySelector(".modal-footer > .btn-danger").onclick = function () {
                                        $.ajax('<c:url value="/admin/approvingProduct.do"/>', {
                                            data: {
                                                productId: product.id,
                                                acction: "No"

                                            },
                                            success: function (data, textStatus, jqXHR) {
                                                tableRow.remove()
                                                document.querySelector('.close').click()
                                            }
                                        })
                                    }

                                    document.querySelector(".modal-footer > .btn-success").onclick = function () {
                                        $.ajax('<c:url value="/admin/approvingProduct.do"/>', {
                                            data: {
                                                productId: product.id,
                                                acction: "Yes"
                                            },
                                            success: function (data, textStatus, jqXHR) {
                                                tableRow.remove()
                                                document.querySelector('.close').click()

                                            }, error: function (jqXHR, textStatus, errorThrown) {
                                                console.log(errorThrown)
                                            }
                                        })
                                    }
                                }

                                function formatDate(date) {
                                    const today = new Date(date);
                                    const yyyy = today.getFullYear();
                                    let mm = today.getMonth() + 1; // Months start at 0!
                                    let dd = today.getDate();

                                    if (dd < 10)
                                        dd = '0' + dd;
                                    if (mm < 10)
                                        mm = '0' + mm;

                                    return dd + '/' + mm + '/' + yyyy;
                                }
                                function initTableData() {
                                    modifiedUsers = productList.map((p, index) => {
                                        if (String('${status}') == 'nary') {
                                            option = '<button type="button" class="btn btn-primary" onclick="previewProduct(' + index + ')" data-toggle="modal" data-target="#exampleModalScrollable">Chi tiết</button>';
//                        option += ``
                                        } else if (String('${status}') == 'ar') {
                                            option = `<button type="button" onclick="deleteProduct(` + p.productId + `, this)" class="btn btn-danger mb-3">Xóa</button>`;
                                        }
                                        return {
                                            id: p.productId,
                                            date: formatDate(p.createAt),
                                            name: `<a href="/ProjectGroup6/home/productDetail.do?productId=` + p.productId + `"> 
                                <p class="tooltip-text">` + p.name + `<span>` + p.name + `</span></p>`,
                                            image: p.imgList,
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
                                                    const mainImg = data.filter(i => i.isMainImg);
                                                    return '<img src="' + data[0].url + '"height="100" width="100"/>';
                                                }
                                            },
                                            {data: 'price'},
                                            {data: 'option'},
                                        ]
                                    });
                                }
                                const navElements = document.querySelectorAll(".nav-item");
                                const removeActiveClass = (selector) => {
                                    const elements = document.querySelector(selector).querySelectorAll(".nav-item");
                                    elements.forEach(item => {
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

                                    switch (params.status) {
                                        case "nary":
                                            document.querySelector('body > div > div.container.br-form > ul > li:nth-child(1) > a').classList.add("active");
                                            break;
                                        case "ar" :
                                            console.log(1)
                                            removeActiveClass('.nav.nav-tabs')
                                            document.querySelector('body > div > div.container.br-form > ul > li:nth-child(2) > a').classList.add("active");
                                    }
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

                                function setActive(el) {
                                    document.querySelectorAll(".nav-item").forEach(i => {
                                        i.classList.remove("active")
                                    })
                                    el.classList.add("active")
                                }
        </script>


    </body>
</html>
