<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--         Bootstrap CSS 
                <link rel="stylesheet" href="../css/bootstrap.css" />
                <link rel="stylesheet" href="../css/flaticon.css" />
                <link rel="stylesheet" href="../css/themify-icons.css" />
                <link rel="stylesheet" href="../vendors/owl-carousel/owl.carousel.min.css" />
                <link rel="stylesheet" href="../vendors/nice-select/css/nice-select.css" />-->
        <!-- main css -->
        <!--DataTables--> 
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <link href="../css/main.css" rel="stylesheet" type="text/css"/>
        <title>Document</title>
        <style>
            .btn {
                width: 110px;
                margin: 5px 5px 0 0 ;
            }
            canvas{
                width:  100% !important;
                /*height: 400px !important;*/

            }
            .canvas-container {
                width: 40% !important;
                margin-bottom: 40px;
            }
            h3 {
                margin-top: 60px; 
            }
        </style>
    </head>
    <body>
        <c:choose>
            <c:when test="${not empty productList}">
                <div class="container latest_blog_area" style="padding: 0;">
                    <h2 style="text-align: center; ">Quản lý cửa hàng</h2>
                    <ul class="nav nav-tabs registration_area" style="margin-bottom: 20px;">               
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
                            <a class="nav-link " href="<c:url value="/order/stored.do?status=dashboard"/>">Dashboard</a>
                        </li>
                    </ul>
                    <table class="table table-striped" id="productTable">
                        <thead style="background-color: #FFEFD5;">
                            <tr id="list-header">
                                <th class="col-2" scope="col">Ngày đăng</th>
                                <th class="col-2" scope="col">Sản phẩm</th>
                                <th scope="col" class="col-2">Hình ảnh</th>
                                <th class="col-2" scope="col">Giá</th>
                                <th class="col-1" scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>
                <div class="container-fluid" id="dashboard">
                    <div class="row justify-content-around">
                        <div class="canvas-container" style="position: relative">
                            <canvas id="totalReviewRating" width="200" height="200"></canvas>
                        </div>
                        <div class="canvas-container" style="position: relative">
                            <canvas id="top5Review" width="200" height="200"></canvas>
                        </div>
                        <div class="canvas-container" style="position: relative">
                            <canvas id="ordersByCate" width="200" height="200"></canvas>
                        </div>

                        <div class="canvas-container" style="position: relative">
                            <canvas id="ordersByPrice" width="200" height="200"></canvas>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <h3 style="text-align: center">Top 10 sản phẩm bán nhiều nhất</h3>
                            <table class="table table-striped table-hover" id="topSeller">
                                <thead>
                                    <tr>
                                        <th class="col-2" scope="col">ID</th>
                                        <th class="col-2" scope="col">Tên sản phẩm</th>
                                        <th></th>
                                        <th class="col-2" scope="col">Bán được</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <h3 style="text-align: center">Top 10 sản phẩm bán ít nhất</h3>
                            <table class="table table-striped  table-hover" id="leastSeller">
                                <thead>
                                    <tr>
                                        <th class="col-2" scope="col">ID</th>
                                        <th class="col-2" scope="col">Tên sản phẩm</th>
                                        <th></th>
                                        <th class="col-2" scope="col">Bán được</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <h3 style="text-align: center">Top 10 người dùng có lượt mua nhiều nhất</h3>
                            <table class="table table-striped table-hover" id="topBuyUserBySoldCount">
                                <thead>
                                    <tr>
                                        <th class="col-2" colspan="2" scope="col">Email người dùng</th>
                                        <th class="col-2" colspan="2" scope="col">Số lượt mua</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <h3 style="text-align: center">Top 10 người dùng chi nhiều nhất</h3>
                            <table class="table table-striped  table-hover" id="topBuyUserBySoldPrice">

                                <thead>
                                    <tr>
                                        <th class="col-2" colspan="2" scope="col">Email người dùng</th>
                                        <th class="col-2" colspan="2" scope="col">Số tiền đã chi</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Large modal -->
                <!--<button type="button" class="btn btn-primary" >Large modal</button>-->
                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="container">
                                <form class="product-form">
                                    <div class="row">
                                        <div class="col-lg-5 col-md-5 col-sm-5">
                                            ${productModal}
                                        </div>
                                        <div class="col-lg-7 col-md-7 col-sm-7">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">Tên sản Phẩm</span>
                                                </div>
                                                <input type="text" class="form-control product-name"
                                                       name="name"
                                                       placeholder="Tên sản Phẩm" aria-label="Tên sản Phẩm" aria-describedby="basic-addon1">
                                            </div>
                                            <h5>Danh mục sản phẩm</h5>
                                            <select class="select-category">
                                                <c:forEach items="${sessionScope.cateList}" var="i" >
                                                    <option value="${i.cateId}">${i.name}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="input-group mb-3 mt-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Giá sản phẩm</span>
                                                </div>
                                                <input type="text" id="formattedMoneyField"
                                                       name="price"
                                                       class="form-control" aria-label="Amount (to the nearest dollar)">
                                                <div class="input-group-append">
                                                    <span class="input-group-text">₫</span>
                                                </div>
                                            </div>
                                            <div class="input-group mb-3 mt-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Số lượng sản phẩm</span>
                                                </div>
                                                <input type="text"id="formattedNumberField"
                                                       name="quantity"
                                                       class="form-control" aria-label="Amount (to the nearest dollar)"
                                                       value="4">
                                            </div>
                                            <h5>Mô tả sản phẩm</h5>
                                            <div id="description">
                                            </div>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text" id="basic-addon1">@</span>
                                                </div>
                                                <input class="form-control seller-email"
                                                       name="sellerEmail"
                                                       type="email" placeholder="Email" readonly value="${sessionScope.user.email}">
                                            </div>
                                            <input class="description-hidden" 
                                                   name="descriptionHidden"
                                                   type="text" readonly hidden  >
                                            <input readonly 
                                                   name="cateId"
                                                   hidden class="category-hidden">
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-2">
                                            <input type="file" name="img" multiple accept="image/*"/>
                                        </div>

                                    </div>
                                    <a class="genric-btn success circle" onclick="handleProduct(${productModal.productId}, 'u', this)">Cập nhật</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <h3 style="text-align: center; margin: 50px; ">Hiện không có review nào chờ duyệt</h3>
            </c:otherwise>
        </c:choose>
        <!--        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
                <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>-->
        <!--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
                                        function formatPrice(price) {
                                            return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(parseInt(price));
                                        }
                                        const params = new Proxy(new URLSearchParams(window.location.search), {
                                            get: (searchParams, prop) => searchParams.get(prop),
                                        });
                                        var productList = ${productList};
                                        var newProductList = []

                                        productList.forEach(i => {
                                            newProductList.push({
                                                id: i.productId,
                                                name: i.name,
                                                soldCount: i.soldCount
                                            })
                                        })
                                        function filterArray(i) {
                                            return {
                                                id: i.productId, soldCount: i.soldCount, name: i.name,
                                            }
                                        }
                                        const navBars = document.querySelectorAll(".nav-item > a");
                                        const removeActiveClass = () => {
                                            navBars.forEach(i => {
                                                i.classList.remove("active");
                                            });
                                        }
                                        const getChartContext = (id) => {
                                            return document.getElementById(id).getContext('2d');
                                        }
                                        $(document).ready(function () {
                                            var activeIndex = 0;
                                            switch (params.status) {
                                                case "nary":
                                                {
                                                    activeIndex = 1;
                                                    break;
                                                }
                                                case "nar":
                                                {
                                                    activeIndex = 2;
                                                    break;
                                                }
                                                case "ss":
                                                {
                                                    activeIndex = 3;
                                                    break;
                                                }
                                                case "oos":
                                                {
                                                    activeIndex = 4;
                                                    break;
                                                }
                                            }
                                            removeActiveClass();
                                            navBars[activeIndex].classList.add("active");
                                            if (params.status != "dashboard") {
                                                document.querySelector("#dashboard").style.display = "none";
                                                initTableData();
                                            } else {
                                                removeActiveClass();
                                                navBars[5].classList.add("active");
                                                const tableHeader = document.querySelector("#list-header");
                                                while (tableHeader.hasChildNodes()) {
                                                    tableHeader.removeChild(tableHeader.firstChild);
                                                }
                                                const totalReviewRatingChart = new Chart(getChartContext('totalReviewRating'), {
                                                    type: 'doughnut',
                                                    data: {
                                                        labels: ['1⭐', '2⭐', '3⭐', '4⭐', '5⭐'],
                                                        datasets: [{
                                                                data: ${totalReviewRating == null ? [] : totalReviewRating},
                                                                backgroundColor: [
                                                                    'rgba(255, 99, 132, 0.2)',
                                                                    'rgba(54, 162, 235, 0.2)',
                                                                    'rgba(255, 206, 86, 0.2)',
                                                                    'rgba(75, 192, 192, 0.2)',
                                                                    'rgba(153, 102, 255, 0.2)',
                                                                ],
                                                                borderColor: [
                                                                    'rgba(255, 99, 132, 1)',
                                                                    'rgba(54, 162, 235, 1)',
                                                                    'rgba(255, 206, 86, 1)',
                                                                    'rgba(75, 192, 192, 1)',
                                                                    'rgba(153, 102, 255, 1)'],
                                                                borderWidth: 1
                                                            }]
                                                    },
                                                    options: {
                                                        responsive: true,
                                                        maintainAspectRatio: true,
                                                        scales: {
                                                            y: {
                                                                beginAtZero: true
                                                            }
                                                        },
                                                        plugins: {
                                                            title: {
                                                                display: true,
                                                                text: 'Tỉ lệ sao của các đánh giá'
                                                            }
                                                        }
                                                    }
                                                });
                                                const labels = []
                                                const data = []
                                                const obj = ${top5Review == null ? 1 : top5Review}
                                                if (obj != 1) {
                                                    for (const [key, value] of Object.entries(obj)) {
                                                        labels.push(key.replaceAll("@fpt.edu.vn", ""))
                                                        data.push(value)
                                                    }
                                                    console.log(labels)
                                                    console.log(data)
                                                    const top5ReviewChart = new Chart(getChartContext('top5Review'), {
                                                        type: 'doughnut',
                                                        data: {
                                                            labels: labels,
                                                            datasets: [{
                                                                    label: '# of Votes',
                                                                    data: data,
                                                                    backgroundColor: [
                                                                        'rgba(255, 99, 132, 0.2)',
                                                                        'rgba(54, 162, 235, 0.2)',
                                                                        'rgba(255, 206, 86, 0.2)',
                                                                        'rgba(75, 192, 192, 0.2)',
                                                                        'rgba(153, 102, 255, 0.2)',
                                                                    ],
                                                                    borderColor: [
                                                                        'rgba(255, 99, 132, 1)',
                                                                        'rgba(54, 162, 235, 1)',
                                                                        'rgba(255, 206, 86, 1)',
                                                                        'rgba(75, 192, 192, 1)',
                                                                        'rgba(153, 102, 255, 1)'],
                                                                    borderWidth: 1
                                                                }]
                                                        },
                                                        options: {
                                                            responsive: true,
                                                            maintainAspectRatio: true,
                                                            scales: {
                                                                y: {
                                                                    beginAtZero: true
                                                                }
                                                            },
                                                            plugins: {
                                                                title: {
                                                                    display: true,
                                                                    text: 'Top 5 người dùng mua nhiều nhất'
                                                                }
                                                            }
                                                        }
                                                    });
                                                }
                                                const ordersByCateChart = new Chart(getChartContext('ordersByCate'), {
                                                    type: 'doughnut',
                                                    data: {
                                                        labels: [
                                                            'Quần Áo',
                                                            'Thực Phẩm',
                                                            'Giày Dép',
                                                            'Đồ Gia Dụng',
                                                            'Trang Trí',
                                                            'Nước Hoa',
                                                            'Thú Cưng',
                                                            'Văn Phòng Phẩm',
                                                            'Sách',
                                                            'Khác'
                                                        ],
                                                        datasets: [{
                                                                data: ${ordersByCate == null ? [] : ordersByCate},
                                                                backgroundColor: [
                                                                    'rgba(47, 54, 64,0.2)',
                                                                    'rgba(255, 99, 132, 0.2)',
                                                                    'rgba(54, 162, 235, 0.2)',
                                                                    'rgba(255, 206, 86, 0.2)',
                                                                    'rgba(75, 192, 192, 0.2)',
                                                                    'rgba(153, 102, 255, 0.2)',
                                                                    'rgba(255, 159, 64, 0.2)',
                                                                    'rgba(232, 65, 24, 0.2)',
                                                                    'rgba(156, 136, 255,0.2)',
                                                                    'rgba(0, 168, 255,0.2)',
                                                                    'rgba(76, 209, 55,0.2)'

                                                                ],
                                                                borderColor: [
                                                                    'rgba(255, 99, 132, 1)',
                                                                    'rgba(54, 162, 235, 1)',
                                                                    'rgba(255, 206, 86, 1)',
                                                                    'rgba(75, 192, 192, 1)',
                                                                    'rgba(153, 102, 255, 1)',
                                                                    'rgba(255, 159, 64, 1)'
                                                                ],
                                                                borderWidth: 1
                                                            }]
                                                    },
                                                    options: {
                                                        responsive: true,
                                                        maintainAspectRatio: true,
                                                        scales: {
                                                            y: {
                                                                beginAtZero: true
                                                            }
                                                        },
                                                        plugins: {
                                                            title: {
                                                                display: true,
                                                                text: 'Tỉ lệ các đơn hàng theo danh mục'
                                                            }
                                                        }
                                                    }
                                                });
                                                const ordersByPriceChart = new Chart(getChartContext('ordersByPrice'), {
                                                    type: 'doughnut',
                                                    data: {
                                                        labels: [10000, 100000, 500000, 1000000, 2000000, 5000000],
                                                        datasets: [{
                                                                label: '# of Votes',
                                                                data: ${ordersByPrice == null ? [] : ordersByPrice},
                                                                backgroundColor: [
                                                                    'rgba(47, 54, 64,0.2)',
                                                                    'rgba(255, 99, 132, 0.2)',
                                                                    'rgba(54, 162, 235, 0.2)',
                                                                    'rgba(255, 206, 86, 0.2)',
                                                                    'rgba(75, 192, 192, 0.2)',
                                                                    'rgba(153, 102, 255, 0.2)',
                                                                    'rgba(255, 159, 64, 0.2)',
                                                                    'rgba(232, 65, 24, 0.2)',
                                                                    'rgba(156, 136, 255,0.2)',
                                                                    'rgba(0, 168, 255,0.2)',
                                                                    'rgba(76, 209, 55,0.2)'

                                                                ],
                                                                borderColor: [
                                                                    'rgba(255, 99, 132, 0.2)',
                                                                    'rgba(54, 162, 235, 0.2)',
                                                                    'rgba(255, 206, 86, 0.2)',
                                                                    'rgba(75, 192, 192, 0.2)',
                                                                    'rgba(153, 102, 255, 0.2)',
                                                                    'rgba(255, 159, 64, 0.2)'],
                                                                borderWidth: 1
                                                            }]
                                                    },
                                                    options: {
                                                        responsive: true,
                                                        maintainAspectRatio: true,
                                                        scales: {
                                                            y: {
                                                                beginAtZero: true,
                                                                ticks: {
                                                                    callback: function (value) {
                                                                        return formatPrice(value)
                                                                    }
                                                                }
                                                            }
                                                        },
                                                        plugins: {
                                                            title: {
                                                                display: true,
                                                                text: 'Tỉ lệ đơn hàng theo các mức giá'
                                                            }
                                                        }
                                                    }
                                                });





                                                var top10ProductLeastSell = ${top10ProductLeastSell == null ? [] : top10ProductLeastSell}.map(filterArray)
                                                var top10SoldPriceUser = ${top10SoldPriceUser == null ? [] : top10SoldPriceUser}

                                                var top10SoldCountUser = ${top10SoldCountUser == null ? [] : top10SoldCountUser}
                                                console.log(top10SoldCountUser)
                                                newProductList.forEach(i => {
                                                    document.querySelector("#topSeller").innerHTML +=
                                                            '<tr>' +
                                                            '<td >' + i.id + '</td>' +
                                                            '<td colspan="2">' + i.name + '</td>' +
                                                            '<td >' + i.soldCount + '</td>' +
                                                            '</tr>'
                                                });
                                                top10ProductLeastSell.forEach(i => {
                                                    document.querySelector("#leastSeller").innerHTML +=
                                                            '<tr>' +
                                                            '<td >' + i.id + '</td>' +
                                                            '<td colspan="2">' + i.name + '</td>' +
                                                            '<td >' + i.soldCount + '</td>' +
                                                            '</tr>'
                                                });

                                                var top10SoldPriceUserArr = []
                                                var top10SoldCountUserArr = []
                                                for (const [key, value] of Object.entries(top10SoldPriceUser)) {
                                                    top10SoldPriceUserArr.push({email: key, count: value})
                                                }
                                                top10SoldPriceUserArr.sort(function (a, b) {
                                                    return  parseInt(b.count) - parseInt(a.count);
                                                })
                                                console.log(top10SoldPriceUserArr)
                                                top10SoldPriceUserArr.forEach(i => {
                                                    document.querySelector("#topBuyUserBySoldPrice").innerHTML +=
                                                            '<tr>' +
                                                            '<td colspan="2">' + i.email + '</td>' +
                                                            '<td colspan="2">' + formatPrice(i.count) + '</td>' +
                                                            '</tr>'
                                                })

                                                for (const [key, value] of Object.entries(top10SoldCountUser)) {
                                                    top10SoldCountUserArr.push({key, value})
                                                    document.querySelector("#topBuyUserBySoldCount").innerHTML +=
                                                            '<tr>' +
                                                            '<td colspan="2">' + key + '</td>' +
                                                            '<td colspan="2">' + value + '</td>' +
                                                            '</tr>'
                                                }
                                            }
                                        })
        </script>

        <script>
            var table;
            console.log(params.status)
            function formatPrice(price) {
                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(parseInt(price));
            }
            function initTableData() {
                var modifiedUsers = productList.map(p => {
//                    onclick="handleProduct(' + p.productId + ', \'u\', this)
// data-toggle="modal" data-target=".bd-example-modal-lg"
                    const dt = '<a href="/ProjectGroup6/home/productDetail.do?productId=' + p.productId + '" target="_blank" class="btn btn-info">Chi tiết</a>';
                    const dta = '<button class="btn btn-info" onclick="handleProduct(' + 1 + ')" data-toggle="modal" data-target=".bd-example-modal-lg">Chi tiết</button>';
                    const ss = '<button class="btn btn-secondary" onclick="handleProduct(' + p.productId + ', \'ss\', this)">Ngừng bán</button>';
                    const as = '<button class="btn btn-success" onclick="handleProduct(' + p.productId + ', \'as\', this)">Bán lại</button>';
                    const d = '<button class="btn btn-danger" onclick="handleProduct(' + p.productId + ', \'d\', this)">Xóa</button>';
                    const u = '<a class="btn btn-primary" target="_blank" href="/ProjectGroup6/order/stored.do?pId=' + p.productId + '&func=u">Cập nhật</a>';
                    const b = '<div class="button-group-area mt-40" style="display: flex; flex-direction: column">';
                    const a = '</div>';
                    if (String('${status}') == 'ar') {
                        option = dt + u + ss
                    } else if (String('${status}') == 'nar') {
                        option = dta + u + d
                    } else if (String('${status}') == 'nary') {
                        option = dta + u + d
                    } else if (String('${status}') == 'ss') {
                        option = dt + as + d
                    } else if (String('${status}') == 'oos') {
                        option = dt + u + d
                    }
                    return {
                        id: p.productId,
                        date: p.date,
                        name: `<div class="product__item-name"><a href="/ProjectGroup6/home/productDetail.do?productId=` + p.productId + `"> 
                                  <p class="tooltip-text">` + p.name + `<span>` + p.name + `</span></p></div>`,
                        image: p.image,
                        price: `<div style="display: flex; justify-content: flex-start; padding-top: 5px; color: red;">` + formatPrice(p.price) +
                                `</div>`,
                        option: b + option + a,
                        description: p.description
                    }
                })
                table = $('#productTable').DataTable({
                    "processing": true,
                    "responsive": true,
                    data: modifiedUsers,
                    columns: [
                        {data: 'date'},
                        {data: 'name'},
                        {data: 'image',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="150" width="150"/>';
                            }
                        },
                        {data: 'price'},
                        {data: 'option'},
                    ]
                })
            }
            const getProduct = (pId, option) => {
                $.ajax('<c:url value="/GetProductAjax"/>', {
                    data: {
                        pId: pId,
                        func: "getProduct"
                    },
                    success: function (data) {
                        console.log("ok")
                        fetch('<c:url value="/FileProductHandle"/>', {
                            method: "POST",
                            body: formData,
                        })
                    }
                })
            }
            const handleProduct = (pId, option, el) => {
                if (option == 'ss' || option == 'as' || option == 'd') {
                    switch (option) {
                        case 'ss':
                            text = 'Xác nhận ngừng bán sản phẩm !!!';
                            break;
                        case 'as':
                            text = 'Xác nhận bán lại sản phẩm !!!';
                            break;
                        case 'd':
                            text = 'Xác nhận xóa sản phẩm !!!';
                            break;
                        default:
                            break;
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
                                    $.ajax("<c:url value="/order/stored.do"/>", {
                                        data: {
                                            pId: pId,
                                            func: option,
                                        },
                                        success: function (data, textStatus, jqXHR) {
                                            swal("Thành công", {
                                                icon: "success",
                                            });
                                            const tableRow = el.parentElement.parentElement.parentElement
                                            tableRow.remove()
                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {
                                            swal("Thất bại!!!", {
                                                icon: "error",
                                            });
                                        }
                                    })
                                }
                            });
                } else if (option == 'u') {
                    var objJson = {
                        pId: pId,
                        name: "a",
                        price: 2,
                        description: "description",
                        cateId: 1,
                        quantity: $("input[name='quantity']").val(),
                        img1: '1',
                        img2: '2',
                        img3: '3',
                        img4: '4',
                        img5: '5'
                    };
                    swal({
                        title: "",
                        text: 'Xác nhận cập nhật sản phẩm !!!',
                        icon: "warning",
                        buttons: true,
                        dangerMode: true,
                    })
                            .then((commit) => {
                                if (commit) {
                                    $.ajax("<c:url value="/order/stored.do"/>", {
                                        data: {
                                            pId: pId,
                                            func: option,
                                            product: JSON.stringify(objJson),
                                        },
                                        success: function (data, textStatus, jqXHR) {
                                            swal("Thành công", {
                                                icon: "success",
                                            });
                                            const tableRow = el.parentElement.parentElement
                                            tableRow.remove()
                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {
                                            swal("Thất bại!!!", {
                                                icon: "error",
                                            });
                                        }
                                    })
                                }
                            });
                }

            }

        </script>
    </body>
</html>
