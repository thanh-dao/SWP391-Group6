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
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <title>Document</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${not empty productList}">
                <div class="container latest_blog_area" style="padding: 0;">
                    <h2 style="text-align: center; ">Duyệt sản phẩm</h2>
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
                            <a class="nav-link " href="#">Dashboard</a>
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
                <!-- Large modal -->
                <!--                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button>
                
                                <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="container">
                                                <div class="link font-a">
                                                    <a href="<c:url value="/home/main.do"/>">Trang chủ</a> >>
                <%--<c:forEach items="${sessionScope.cateList}" var="i">--%>
                <%--<c:if test ="${i.cateId == product.cateId}">--%>
                <a href="<c:url value="/home/productList.do?cateId=${product.cateId}"/>">
                ${i.name}
            </a> >>
                <%--</c:if>--%>
                <%--</c:forEach>--%>
                <a href="<c:url value="/home/productDetail.do?productId=${product.productId}"/>">${product.name}</a>
            </div>
            <div class="product__content">
                <div class="row">
                    <div id="demo" class="carousel slide col-lg-6 col-md-6 col-sm-6" data-ride="carousel">
                        The slideshow 
                        <div class="carousel-inner">
                <c:forEach items="${product.imgList}" varStatus="count" var="i">
                    <c:if test ="${count.index == 0}">
                        <div class="carousel-item active">
                            <img class="img-fluid" src="<c:url value="${i.url}"/>">
                        </div>
                    </c:if>
                    <div class="carousel-item">
                        <img class="img-fluid" src="<c:url value="${i.url}"/>">
                    </div>
                </c:forEach>
                <ul class="carousel-indicators" style="bottom: 0; margin: 0;background-color: #FFA500;width: 100%;">
                <c:forEach items="${product.imgList}" varStatus="count" var="i">
                    <script>
console.log(${count.index})
                    </script>
                    <li data-target="#demo" data-slide-to="${count.index } " class="${count.index  == 0 ? "active" : ""}"></li>
                </c:forEach>
        </ul>
        Left and right controls 
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <div class="d-flex justify-content-center align-items-center img-nav-btn">
                <i class="m-0 fa-solid fa-chevron-left "></i>
            </div>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <div class="d-flex justify-content-center align-items-center img-nav-btn" >
                <i class="m-0 fa-solid fa-chevron-right "></i>
            </div>
        </a>
    </div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6">
    <h3>${product.name}</h3>
    <div style="margin: 10px 0; font-size: 20px; ">
                ${rating}
                <c:if test ="${rating == 0}"><span class="fa fa-star-o star"></span></c:if>
                <c:if test ="${rating > 0 && rating <= 0.5}"><span class="fa fa-star-half-o star"></span></c:if>
                <c:if test ="${rating > 0.5 }"><span class="fa fa-star star"></span></c:if>
                <c:if test ="${rating <= 1}"><span class="fa fa-star-o star"></span></c:if>
                <c:if test ="${rating > 1 && rating <= 1.5}"><span class="fa fa-star-half-o star"></span></c:if>
                <c:if test ="${rating > 1.5}"><span class="fa fa-star star"></span></c:if>
                <c:if test ="${rating <= 2}"><span class="fa fa-star-o star"></span></c:if>
                <c:if test ="${rating > 2 && rating <=2.5}"><span class="fa fa-star-half-o star"></span></c:if>
                <c:if test ="${rating > 2.5}"><span class="fa fa-star star"></span></c:if>
                <c:if test ="${rating <= 3}"><span class="fa fa-star-o star"></span></c:if>
                <c:if test ="${rating > 3 && rating <= 3.5}"><span class="fa fa-star-half-o star"></span></c:if>
                <c:if test ="${rating > 3.5}"><span class="fa fa-star star"></span></c:if>
                <c:if test ="${rating <= 4}"><span class="fa fa-star-o star"></span></c:if>
                <c:if test ="${rating > 4 && rating <= 4.5}"><span class="fa fa-star-half-o star"></span></c:if>
                <c:if test ="${rating > 4.5}"><span class="fa fa-star star"></span></c:if>
                </div>
                <div style="display: flex;">
                    <p style="margin-right: 30%">Đã bán: <span class="font-bold">${product.soldCount}</span></p>
                <p>Đánh giá: <span class="font-bold">${reviewer.size()}</span></p>

            </div>
            <p>Sản phẩm có sẵn: <span class="font-bold">${product.quantity}</span><p/>
            <h2 style="color: #E72425; text-align: right; margin-right: 20px;">
                <fmt:setLocale value="vi_VN"/>
                <fmt:formatNumber  type = "currency" value="${product.price}"/></h2>
            <script>
                var isNullUser = true
                <c:if test="${user != null}">
                isNullUser = false
                </c:if>
            </script>

            <div class="buy d-flex justify-content-around" style="margin: 50px 0 20px 0;">
                <button onclick="addOrder(${product.productId})">Mua</button>
            </div>
        </div>
    </div>
</div>
</div>
<div class="br-form">
<h5>Thông tin người bán</h5>
<div style="display: flex">
    <div class="col-md-5 col-sm-5 font-a" style="display: flex">
        <a href="<c:url value="/home/main.do"/>" class="avatar">
            <img src="<c:url value="${seller.avatarLink}"/>" alt="">
        </a>
        <p><a href="#">${seller.firstName} ${seller.lastName}</a></p>
    </div>
    <div class="col-md-7 col-sm-7">
        <p>Số điện thoại: <span>${seller.phone}</span></p>
    </div>

</div><p>Địa chỉ: <span>${seller.address.houseNumber} ${seller.address.wardName}
                ${seller.address.districtName} ${seller.address.cityName}</span></p>
    </div>
    <div class="br-form">
        <h5>Mô tả chi tiết: </h5>
        <p style="padding: 10px 0 10px 0;">${product.description}</p>
    </div>
    <div class="br-form">
        <h5 style="margin-top: 5px;">Đánh giá sản phẩm</h5>
        <div class="review">
                <c:if test="${empty reviewer}">
                    <p style="text-align: center;">Hiện chưa có đánh giá nào</p>
                </c:if>
                <c:forEach items="${reviewer}" var="i">
                    <div class="font-a" style="display: flex">
                        <a href="<c:url value="/home/main.do"/>" class="reviewer">
                            <img src="<c:url value="${i.avatarLink}"/>" alt="">
                        </a>
                        <p>
                            <a href="#" style="margin-right: 20px;">${i.name}</a>
                    <c:if test ="${i.rating == 0}"><span class="fa fa-star-o star-s"></span></c:if>
                    <c:if test ="${i.rating > 0 && i.rating <= 0.5}"><span class="fa fa-star-half-o star-s"></span></c:if>
                    <c:if test ="${i.rating > 0.5 }"><span class="fa fa-star star-s"></span></c:if>
                    <c:if test ="${i.rating <= 1}"><span class="fa fa-star-o star-s"></span></c:if>
                    <c:if test ="${i.rating > 1 && i.rating <= 1.5}"><span class="fa fa-star-half-o star-s"></span></c:if>
                    <c:if test ="${i.rating > 1.5}"><span class="fa fa-star star-s"></span></c:if>
                    <c:if test ="${i.rating <= 2}"><span class="fa fa-star-o star-s"></span></c:if>
                    <c:if test ="${i.rating > 2 && i.rating <=2.5}"><span class="fa fa-star-half-o star-s"></span></c:if>
                    <c:if test ="${i.rating > 2.5}"><span class="fa fa-star star-s"></span></c:if>
                    <c:if test ="${i.rating <= 3}"><span class="fa fa-star-o star-s"></span></c:if>
                    <c:if test ="${i.rating > 3 && i.rating <= 3.5}"><span class="fa fa-star-half-o star-s"></span></c:if>
                    <c:if test ="${i.rating > 3.5}"><span class="fa fa-star star-s"></span></c:if>
                    <c:if test ="${i.rating <= 4}"><span class="fa fa-star-o star-s"></span></c:if>
                    <c:if test ="${i.rating > 4 && i.rating <= 4.5}"><span class="fa fa-star-half-o star-s"></span></c:if>
                    <c:if test ="${i.rating > 4.5}"><span class="fa fa-star star-s"></span></c:if>
                    </p>
                </div>
                <p>${i.comment}</p>
            <span style="display: flex; justify-content: flex-end;">${i.date}</span>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</div>-->
            </c:when>
            <c:otherwise>
                <h3 style="text-align: center; margin: 50px; ">Hiện không có review nào chờ duyệt</h3>
            </c:otherwise>
        </c:choose>
        <!--        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
                <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script>
            var table;
            var productList = ${productList};
            function formatPrice(price) {
                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(parseInt(price));
            }
            function initTableData() {
                var modifiedUsers = productList.map(p => {
                    const dt = '<a href="/ProjectGroup6/home/productDetail.do?productId=' + p.productId + '" target="_blank" class="genric-btn info circle">Chi tiết</a>';
                    const dta = '<a class="genric-btn info circle" onclick="handleProduct(' + 1 + ')" data-toggle="modal" data-target=".bd-example-modal-lg">Chi tiết</a>';
                    const ss = '<a class="genric-btn warning circle" onclick="handleProduct(' + p.productId + ', \'ss\', this)">Ngừng bán</a>';
                    const as = '<a class="genric-btn primary circle" onclick="handleProduct(' + p.productId + ', \'as\', this)">Bán lại</a>';
                    const d = '<a class="genric-btn danger circle" onclick="handleProduct(' + p.productId + ', \'d\', this)">Xóa</a>';
                    const u = '<a class="genric-btn success circle" onclick="handleProduct(' + p.productId + ', \'u\', this)">Cập nhật</a>';
                    const b = '<div class="button-group-area mt-40" style="display: flex; flex-direction: column">';
                    const a = '</div>';
                    if (String('${status}') == 'ar') {
                        option = dt + u + ss
                    } else if (String('${status}') == 'nar') {
                        option = dt + u + d
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
                        name: `<a href="/ProjectGroup6/home/productDetail.do?productId=` + p.productId + `"> 
                                  <p class="tooltip-text">` + p.name + `<span>` + p.name + `</span></p>`,
                        image: p.image,
                        price: `<div style="display: flex; justify-content: flex-end; padding-top: 5px; color: red;">` + formatPrice(p.price) +
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
                    text = 'Xác nhận xóa sản phẩm !!!';
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
            $(document).ready(function () {
                initTableData();
            });
        </script>
    </body>
</html>
