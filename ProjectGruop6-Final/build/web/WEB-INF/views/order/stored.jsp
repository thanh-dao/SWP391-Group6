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
        <script src="https://unpkg.com/autonumeric"></script>
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
            .carousel-item{width: 540px; height: 540px;}
            .carousel-item img{width: 100%; height: 100%;}
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
                                        </div>
                                    </body>
                                </html>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="quantityModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Cập nhật số lượng sẩn phẩm</h5>
                                <button type="button" class="close-q" data-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="input-group mb-3 mt-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Số lượng sản phẩm</span>
                                    </div>
                                    <input type="text" id="formattedNumberField" name="quantity"
                                           class="form-control" aria-label="Amount (to the nearest dollar)" value="0">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a type="button" onclick="updateQuantity(this)" class="btn btn-primary">Cập nhật</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <h3 style="text-align: center; margin: 50px; ">Hiện không có sản phẩm nào</h3>
            </c:otherwise>
        </c:choose>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
                                    const quantity = new AutoNumeric('#formattedNumberField', {
                                        allowDecimalPadding: false,
                                        createLocalList: false,
                                        decimalPlaces: 0,
                                        maximumValue: "1000000000000",
                                        minimumValue: "0",
                                        onInvalidPaste: "replace"
                                    })
                                    const updateQuantity = (el) => {
                                        const quantity = document.querySelector('#formattedNumberField').value;
                                        $.ajax("<c:url value="/product"/>", {
                                            data: {
                                                pId: product.id,
                                                quan: quantity
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
                                    }
                                    function formatPrice(price) {
                                        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(parseInt(price));
                                    }
                                    const params = new Proxy(new URLSearchParams(window.location.search), {
                                        get: (searchParams, prop) => searchParams.get(prop),
                                    });
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
                                        document.querySelector(".product-quantity").innerHTML = product.quantity;
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
                                    }
                                    function  viewProductQuantity(index) {
                                        const product = modifiedUsers[index];
                                        const quantity = document.querySelector("#formattedNumberField");
//                                        quantity.value = product.quantity;
                                        document.querySelector(".modal-footer > .btn-primary").onclick = function () {
                                            console.log("//");
//                                            const quantity = document.querySelector("#formattedNumberField").value
                                            $.ajax("<c:url value="/product"/>", {
                                                data: {
                                                    pId: product.id,
                                                    quan: quantity.value,
                                                    func: "updateQuantity"
                                                },
                                                success: function (data, textStatus, jqXHR) {
                                                    swal("Cập nhật thành công", {
                                                        icon: "success",
                                                        buttons: false,
                                                        timer: 1000
                                                    });
                                                    tableRow.remove()
                                                    document.querySelector('.close-q').click()
                                                }
                                            })
                                        }
                                        console.log("--o--");
                                    }
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
//                    onclick="handleProduct(' + p.productId + ', \'u\', this)
// data-toggle="modal" data-target=".bd-example-modal-lg"
                    const dt = '<a href="/ProjectGroup6/home/productDetail.do?productId=' + p.productId + '" target="_blank" class="btn btn-info">Chi tiết</a>';
                    const dta = '<button type="button" class="btn btn-info" onclick="previewProduct(' + index + ')" data-toggle="modal" data-target="#exampleModalScrollable">Chi tiết</button>';
                    const ss = '<button class="btn btn-secondary" onclick="handleProduct(' + p.productId + ', \'ss\', this)">Ngừng bán</button>';
                    const as = '<button class="btn btn-success" onclick="handleProduct(' + p.productId + ', \'as\', this)">Bán lại</button>';
                    const d = '<button class="btn btn-danger" onclick="handleProduct(' + p.productId + ', \'d\', this)">Xóa</button>';
                    const u = '<a class="btn btn-primary" target="_blank" href="/ProjectGroup6/order/stored.do?pId=' + p.productId + '&func=u">Cập nhật</a>';
                    const uq = '<button type="button" class="btn btn-primary" onclick="viewProductQuantity(' + index + ')" data-toggle="modal" data-target="#quantityModal">Cập nhật</button>';
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
                        option = dt + uq + d
                    }
                    return {
                        id: p.productId,
                        date: formatDate(p.createAt),
                        name: `<div class="product__item-name"><a href="/ProjectGroup6/home/productDetail.do?productId=` + p.productId + `"> 
                                  <p class="tooltip-text">` + p.name + `<span>` + p.name + `</span></p></div>`,
                        image: p.imgList,
                        price: `<div style="display: flex; justify-content: flex-start; padding-top: 5px; color: red;">` + formatPrice(p.price) +
                                `</div>`,
                        quantity: p.quantity,
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
                                const mainImg = data.filter(i => i.isMainImg);
                                return '<img src="' + data[0].url + '"height="100" width="100"/>';
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
                }
            }
        </script>
    </body>
</html>
