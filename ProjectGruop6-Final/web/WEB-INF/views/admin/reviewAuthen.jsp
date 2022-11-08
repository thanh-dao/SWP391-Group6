<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reviews</title>
        <!--DataTables--> 
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <style>
            body{
                background-color: #F0F0F0;
            }
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
                z-index: 1;
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
            tbody td {
                padding: 1px;
            }
        </style>
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
                <li class="nav-item">
                    <a href="<c:url value="/admin/productAuthen.do?status=nary"/>" class="nav-link text-white">
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
                    <a href="<c:url value="/admin/reviewAuthen.do?status=nary"/>" class=" active nav-link text-white">
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
            <!--Div that will hold the pie chart-->

        </div> 

        <c:choose>
            <c:when test="${not empty reviewList}">
                <div class="container br-form">
                    <h3 style="text-align: center; ">Kiểm duyệt review</h3>
                    <ul class="nav nav-tabs" style="margin-bottom: 20px;">               
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="<c:url value="/admin/reviewAuthen.do?status=nary"/>">Chờ duyệt</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/admin/reviewAuthen.do?status=ar"/>">Đã duyệt</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/admin/reviewAuthen.do?status=nar"/>">Không được duyệt</a>
                        </li>
                    </ul>
                    <table class="table table-striped" id="review">
                        <thead style="background-color: #FFEFD5;">
                            <tr id="list-header">
                                <th class="col-1" scope="col">Ngày đăng</th>
                                <th class="col-1" scope="col">Người đăng</th>
                                <th style="width: 10%;" scope="col">Sản phẩm</th>
                                <th class="col-1" scope="col"></th>
                                <th class="col-5" scope="col">Đánh giá</th>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                                <th class="col-1" scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <h3 style="text-align: center; margin: 50px; ">Hiện không có review nào chờ duyệt</h3>
            </c:otherwise>
        </c:choose>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script>
            var table;
            var reviewList = ${reviewList};
            console.log(reviewList);
            var productName;
            function initTableData() {
                var modifiedUsers = reviewList.map(r => {
                    var option = `<button type="button" onclick="handleReview(` + r.reviewId + `, this, 'agree')" class="btn btn-success mb-3">Chấp nhận</button>
                                <button type="button" onclick="handleReview(` + r.reviewId + `, this, 'disagree')" class="btn btn-danger mb-3">Từ chối</button>`;
                    if (String('${status}') == 'nar') {
                        option = `<button type="button" onclick="handleReview(` + r.reviewId + `, this, 'agree')" class="btn btn-success mb-3">Chấp nhận</button>`;
                    } else if (String('${status}') == 'ar') {
                        option = `<button type="button" onclick="handleReview(` + r.reviewId + `, this, 'disagree')" class="btn btn-danger mb-3">Xóa</button>`;
                    }
                    return {
                        date: r.date,
                        seller: `<p class="font-a"><a href="#">` + r.userName + `</a></p>`,
                        productName: `<a href="/ProjectGroup6/home/productDetail.do?productId=` + r.productId + `"> 
                                <p class="tooltip-text hinden-text">` + r.productName + `<span>` + r.productName + `</span></p>`,
                        productImage: r.productImage,
                        review: `<p class="font-a" style="border-bottom: 1.5px solid rgba(0,0,0,.09);">Rating: ` + r.rating + `</p>` + r.comment,
                        image1: r.image0,
                        image2: r.image1,
                        image3: r.image2,
                        image4: r.image3,
                        image5: r.image4,
                        option: option,
                    };
                });
                console.log(modifiedUsers);
                table = $('#review').DataTable({
                    "processing": true,
                    data: modifiedUsers,
                    columns: [
                        {data: 'date'},
                        {data: 'seller'},
                        {data: 'productName'},
                        {data: 'productImage',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="75" width="75"/>';
                            }
                        },
                        {data: 'review'},
                        {
                            data: 'image1',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="75" width="75"/>';
                            }
                        }, {
                            data: 'image2',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="75" width="75"/>';
                            }
                        }, {
                            data: 'image3',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="75" width="75"/>';
                            }
                        }, {
                            data: 'image4',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="75" width="75"/>';
                            }
                        }, {
                            data: 'image5',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="75" width="75"/>';
                            }
                        },
                        {data: 'option'},
                    ]
                });
            }
            const handleReview = (rId, el, option) => {
                if (option == 'agree') {
                    text = 'Xác nhận duyệt sản phẩm !!!';
                } else if (option == 'disagree') {
                    text = 'Xác nhận từ chối sản phẩm !!!';
                }
                swal({
                    title: "",
                    text: text,
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((commit) => {
                            if (commit) {
                                $.ajax("<c:url value="/admin/reviewAuthen.do"/>", {
                                    data: {
                                        reviewId: rId,
                                        func: option,
                                    },
                                    success: function (data, textStatus, jqXHR) {
                                        swal("Duyệt thành công", {
                                            icon: "success",
                                        });
                                        const tableRow = el.parentElement.parentElement
                                        tableRow.remove()
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        swal("Duyệt thất bại!!!", {
                                            icon: "error",
                                        });
                                    }
                                })
                            }
                        });
            }
//            const pageSwitching = (option) => {
//            console.log(option);
//                $.ajax("<c:url value="/admin/reviewAuthen.do"/>", {
//                    data: {
//                        status: option
//                    }
//                })
//            }
            $(document).ready(function () {
                initTableData();

                //                $("#btnReloadData").on("click", function () {
                //                    //alert("reload data...")
                //                    table.ajax.reload();
                //                });
            });
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

            function setActive(el) {
                document.querySelectorAll(".nav-item").forEach(i => {
                    i.classList.remove("active")
                })
                el.classList.add("active")
            }
        </script>
    </body>
</html>