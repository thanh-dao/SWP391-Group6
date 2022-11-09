<%@page import="java.util.ArrayList"%>
<%@page import="dto.CategoryDTO"%>
<%@page import="com.google.gson.Gson"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Product</title>
        <!-- Bootstrap CSS -->
        <!--<script src="https://cdn.jsdelivr.net/npm/autonumeric@4.5.4"></script>-->
        <script src="https://unpkg.com/autonumeric"></script>
        <link href="../css/main.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <style>
            .product__details {
                margin-bottom: 50px;
            }
            .upload-button {
                height: 200px;
                width: 200px;
            }
            .upload button i {
                font-size: 100px;
            }
            /*            .describe {
                            height: 200px;
                        }*/
            input {
                width: 100%;
                margin-bottom: 10px;
            }
            .button_1{
                margin-top: 20px;
            }
            .bd-example {
                display: none;
            }
            .carousel-caption, .carousel-caption p {
                padding: 0;
                margin-bottom: 0;
            }
            .carousel-indicators {
                margin-bottom: 0;
            }
            .box-img{
                width: 100px;
                height: 100px;
                border: 1px dashed #334F6C;
                margin: 5px;
                /*padding: 0;*/
            }
            .box-img img{
                width: 100%;
                height: 100%;
            }
            .box-img + a {
                padding: 10px;
                color: #FDC632 !important;
            }
            .review-image{
                display: none;
                width: 540px;
                height: 540px;
            }
            .review-image img{
                width: 100%;
                height: 100%;
            }
            .icon {top:4px;right:0;font-size:20px;position:absolute;color:#CD5C05;display:none;}
            .select2 {height: 100%;}
            .select2{
                height: 100% !important;
            }
        </style>
    </head>
    <body>
        <div class="product__details">
            <div class="container">
                <h2 style="text-align: left; margin-bottom: 12px;">
                    ${product == null ? "Đăng sản phẩm mới" : "Cập nhật sản phẩm"}
                </h2>
                <c:if test="${sessionScope.user == null}">
                    <script>
                        window.location.href = "/ProjectGroup6/user/login.do";
                        localStorage.setItem("message", "you must login to use this feature");
                    </script>
                </c:if>
                <c:if test="${sessionScope.user.address.isNull() == true}">
                    <script>
                        window.location.href = "/ProjectGroup6/user/userInformation.do";
                        localStorage.setItem("message", "you are not allowed to use this feature");
                    </script>
                </c:if>
                <div class="product__content">
                    <form method="POST" enctype="multipart/form-data" class="product-form">
                        <div class="row ">
                            <div class="upload col-lg-6 col-md-6 col-sm-6">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="review-image">
                                            <img src=""/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <p style="margin: 0 0 0 10px;">Ảnh bìa <span style="color: red;">*</span></p>
                                        <input id="img0" name="img0" onchange="getImage(this)"
                                               type="file" hidden accept="image/*">
                                        <div class="box-img" style="position: relative;"
                                             onclick="showImage(this)">
                                            <i class="fa-regular fa-circle-xmark icon" onclick="deleteImage(this)"></i>
                                            <img src="../images/plus.png" alt=""/>
                                        </div>
                                        <a onclick="togFile('#img0')">Thêm ảnh bìa</a>
                                    </div>
                                    <div class="d-flex col-lg-12 col-md-12 col-sm-12">
                                        <div class="col-lg-3" style="padding: 0;">
                                            <input id="img1" name="img1" onchange="getImage(this)"
                                                   type="file" hidden accept="image/*">
                                            <div class="box-img" style="position: relative;"
                                                 onclick="showImage(this)">
                                                <i class="fa-regular fa-circle-xmark icon" onclick="deleteImage(this)"></i>
                                                <img src="../images/plus.png" alt=""/>
                                            </div>
                                            <a onclick="togFile('#img1')">Thêm ảnh</a>
                                        </div>
                                        <div class="col-lg-3" style="padding: 0;">
                                            <input id="img2" name="img2" onchange="getImage(this)"
                                                   type="file" hidden accept="image/*">
                                            <div class="box-img" style="position: relative;"
                                                 onclick="showImage(this)">
                                                <i class="fa-regular fa-circle-xmark icon" onclick="deleteImage(this)"></i>
                                                <img src="../images/plus.png" alt=""/>
                                            </div>
                                            <a onclick="togFile('#img2')">Thêm ảnh</a>
                                        </div>
                                        <div class="col-lg-3" style="padding: 0;">
                                            <input id="img3" name="img3" onchange="getImage(this)"
                                                   type="file" hidden accept="image/*">
                                            <div class="box-img" style="position: relative;"
                                                 onclick="showImage(this)">
                                                <i class="fa-regular fa-circle-xmark icon" onclick="deleteImage(this)"></i>
                                                <img src="../images/plus.png" alt=""/>
                                            </div>
                                            <a onclick="togFile('#img3')">Thêm ảnh</a>
                                        </div>
                                        <div class="col-lg-3" style="padding: 0;">
                                            <input id="img4" name="img4" onchange="getImage(this)"
                                                   type="file" hidden accept="image/*">
                                            <div class="box-img" style="position: relative;"
                                                 onclick="showImage(this)">
                                                <i class="fa-regular fa-circle-xmark icon" onclick="deleteImage(this)"></i>
                                                <img src="../images/plus.png" alt=""/>
                                            </div>
                                            <a onclick="togFile('#img4')">Thêm ảnh</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <input name="pId" value="${product.productId}" hidden/>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Tên sản Phẩm</span>
                                    </div>
                                    <input type="text" class="form-control product-name"
                                           name="name" value="${product.name}" required=""
                                           placeholder="Tên sản Phẩm" aria-label="Tên sản Phẩm" aria-describedby="basic-addon1">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Danh mục sản phẩm</span>
                                    </div>
                                    <select class="select-category form-control">
                                        <c:forEach items="${sessionScope.cateList}" var="i" >
                                            <option value="${i.cateId}">${i.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="input-group mb-3 mt-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Giá sản phẩm</span>
                                    </div>
                                    <input type="text" id="formattedMoneyField" required=""
                                           name="price" value="${product.price}"
                                           class="form-control" aria-label="Amount (to the nearest dollar)">
                                    <div class="input-group-append">
                                        <span class="input-group-text">₫</span>
                                    </div>
                                </div>
                                <div class="input-group mb-3 mt-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Số lượng sản phẩm</span>
                                    </div>
                                    <input type="text"id="formattedNumberField" required=""
                                           name="quantity" value="${product.quantity}"
                                           class="form-control" aria-label="Amount (to the nearest dollar)">
                                </div>
                                <h5>Mô tả sản phẩm</h5>
                                <div id="description">
                                </div>
                                <!--                                    <textarea  type="textarea"style="width: 100%;" required="true" name="address"
                                                                             placeholder="Ví dụ: Khách hàng có thể nhận hàng vào buổi sáng"
                                                                             class="input-form-item"></textarea>-->

                                <br />
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
                                       type="text" readonly hidden >
                                <input name="cateId" readonly hidden 
                                       class="category-hidden">
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 d-flex justify-content-between">
                                <div>
                                    <a href="<c:url value="/order/stored.do?status=ar"/>" class="btn btn-secondary">Quay lại</a>
                                </div>
                                <div class="d-flex justify-content-end">
                                    <input name="option" hidden readonly value="${product == null ? "create" : "update"}">
                                    <button type="submit" formaction="/ProjectGroup6/product" 
                                            class="btn btn-success">GO</button>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalScrollable" onclick="previewProduct()" data-toggle="modal" data-target=".bd-example-modal-xl">Xem trước</button>
                                </div>
                            </div>
                        </div>
                    </form>     
                    <!-- Modal -->
                    <div class="modal fade bd-example-modal-xl" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable  modal-xl" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalScrollableTitle">Xem trước sản phẩm</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                                    <html>
                                        <head>
                                            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                                            <title>Product Detail</title>
                                            <link href="../css/main.css" rel="stylesheet" type="text/css"/>
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
                                                                        <div class="carousel-inner-modal">

                                                                        </div>
                                                                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                                            <span class="sr-only">Previous</span>
                                                                        </a>
                                                                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
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
                                                                <img src="<c:url value="${sessionScope.user.avatarLink}"/>" alt="">
                                                            </a>
                                                            <p><a href="#">${sessionScope.user.firstName} ${sessionScope.user.lastName}</a></p>
                                                        </div>
                                                        <div class="col-md-7 col-sm-7">
                                                            <p>Số điện thoại: <span>${sessionScope.user.phone}</span></p>
                                                        </div>
                                                    </div><p>Địa chỉ: <span>${sessionScope.user.address.houseNumber} ${sessionScope.user.address.wardName}
                                                            ${sessionScope.user.address.districtName} ${sessionScope.user.address.cityName}</span></p>
                                                </div>
                                                <div class="br-form">
                                                    <h5>Mô tả chi tiết: </h5>
                                                    <p id="description-preview"style="padding: 10px 0 10px 0;">${product.description}</p>
                                                </div>
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
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                    <button type="button" class="btn btn-success">Lưu</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="<c:url value="/ckeditor5/ckeditor_build/ckeditor.js" />" type="text/javascript"></script>
        <script>
                                            $(".select-category").select2()
                                            const currency = new AutoNumeric('#formattedMoneyField', {
                                                allowDecimalPadding: false,
                                                createLocalList: false,
                                                decimalPlaces: 0,
                                                maximumValue: "1000000000000",
                                                minimumValue: "0",
                                                onInvalidPaste: "replace"
                                            });
                                            const quantity = new AutoNumeric('#formattedNumberField', {
                                                allowDecimalPadding: false,
                                                createLocalList: false,
                                                decimalPlaces: 0,
                                                maximumValue: "1000000000000",
                                                minimumValue: "0",
                                                onInvalidPaste: "replace"
                                            })
        </script>
        <script>

            //        const imageNameRegex = /\.(gif|jpe?g|tiff?|png|webp|bmp)$/i;
            function readAndPreview(files, indicatior, carousel) {
                indicatior.innerHTML = "";
                carousel.innerHTML = "";
                for (let i = 0; i < files.length; i++) {
                    const file = files[i];
                    const reader = new FileReader();
                    console.log(carousel)
                    reader.addEventListener("load", () => {
                        indicatior.innerHTML +=
                                '<li data-target="#carouselExampleCaptions2" data-slide-to="' + i.toString() + '" class="' + (i == 0 ? "active" : "") + '"></li>';
                        carousel.innerHTML +=
                                '<div class="carousel-item ' + (i == 0 ? 'active' : '') + '" >' +
                                '<img src="' + reader.result + ' " class="d-block w-100" alt="">' +
                                '<div class="carousel-caption d-none d-md-block">' +
                                '<p>' + file.name + '</p>' +
                                `</div>
                                                    </div>`
                    }, false);
                    reader.readAsDataURL(file);
                }
            }
            const hindenIconDelete = () => {
                document.querySelectorAll('.icon').forEach(i => {
                    const checked = i.parentElement.querySelector('img').getAttribute('src') == '../images/plus.png';
                    if (!checked) {
                        i.style.display = "block";
                    } else if (checked) {
                        i.style.display = "none";
                    }
                })
            }
            const deleteImage = (el) => {
                const input = el.parentElement.parentElement.querySelector('input');
                clearInputFile(input);
                el.parentElement.querySelector('img').src = '../images/plus.png';
                hindenIconDelete();
            }
            const resetReviewImage = () => {
                const reviewImg = document.querySelector('.review-image').querySelector("img");
                reviewImg.src = '';
                document.querySelector('.review-image').style.display = "none";
            }
            function clearInputFile(f) {
                if (f.value) {
                    try {
                        f.value = ''; //for IE11, latest Chrome/Firefox/Opera...
                    } catch (err) {
                    }
                    if (f.value) { //for IE5 ~ IE10
                        var form = document.createElement('form'), ref = f.nextSibling;
                        form.appendChild(f);
                        form.reset();
                        ref.parentNode.insertBefore(f, ref);
                    }
                }
            }
            const togFile = (id) => {
                const fi = document.querySelector(id);
                fi.click()
            }
            const showImage = (el) => {
                if (el.querySelector("img").getAttribute('src') == '../images/plus.png') {
                    togFile('#' + el.parentElement.querySelector('input').id);
                } else {
                    const reviewImg = document.querySelector('.review-image').querySelector("img");
                    const img = el.querySelector("img");
                    if (img.getAttribute('src') != '../images/plus.png') {
                        const reader = new FileReader();
                        reviewImg.src = img.src;
                        document.querySelector('.review-image').style.display = "block";
                    } else {
                        resetReviewImage();
                    }
                    hindenIconDelete();
                }
            }
            const getImage = (el) => {
                const file = el.files[0];
                const img = el.parentElement.querySelector("img");
                if (file == null) {
                    resetReviewImage();
                    img.src = '../images/plus.png';
                    hindenIconDelete();
                } else {
                    const reader = new FileReader();
                    reader.addEventListener("load", () => {
                        img.src = reader.result;
                        const reviewImg = document.querySelector('.review-image').querySelector("img");
                        if (reviewImg.getAttribute('src') != '') {
                            reviewImg.src = img.src;
                        }
                        hindenIconDelete();
                    }, false);
                    if (file) {
                        reader.readAsDataURL(file);
                    }
                }
            }
            const createListImg = () => {
                const listImg = new Set();
                list.forEach(l => {
                    listImg.add(l.imageID);
                    for (var i = 0; i < 5; i++) {
                        const img = document.querySelector('#img' + i).parentElement.querySelector("img");
                        if (l.url == img.getAttribute('src')) {
                            listImg.delete(l.imageID);
                        }
                    }
                    if (l.url.split('/').length == 3) {
                        const index = l.url.split('/')[2].split('_img')[1].substring(0, 1);
                        const img = document.querySelector('#img' + index).parentElement.querySelector("img");
                        if (img.getAttribute('src') != '../images/plus.png') {
                            listImg.delete(l.imageID);
                        }
                    }
                })
                return listImg;
            }
            const form = document.querySelector(".product-form");
            form.addEventListener("submit", (event) => {
                if (document.querySelector('#img0').files[0] == null
                        && document.querySelector('#img0').parentElement.
                        querySelector("img").getAttribute('src') == '../images/plus.png') {
                    event.preventDefault();
                    swal("Sản phẩm chưa có ảnh bìa !!!", {
                        buttons: false,
                        timer: 2000
                    });
                } else if (editor.getData() == '') {
                    event.preventDefault();
                    swal("Mô tả chi tiết còn còn trống !!!", {
                        buttons: false,
                        timer: 2000
                    });
                } else {
                    var categoryHidden = document.querySelector(".category-hidden");
                    var descriptionHidden = document.querySelector(".description-hidden");
                    categoryHidden.value = $(".select-category").val();
                    descriptionHidden.value = editor.getData();
                    if (${!empty product}) {
                        $.ajax('<c:url value="/product"/>', {
                            data: {
                                pId: '${product.productId}',
                                listId: JSON.stringify(Array.from(createListImg())),
                                func: 'delete'
                            }
                        })
                    }
                }
            })
            const initImages = () => {
                const listImg = new Set();
                list.forEach(i => {
                    if (i.isMainImg) {
                        const img = document.querySelector('#img0').parentElement.querySelector("img");
                        img.src = i.url;
                    } else {
                        if (i.url.split('/').length == 3) {
                            const index = i.url.split('/')[2].split('_img')[1].substring(0, 1);
                            const img = document.querySelector('#img' + index).parentElement.querySelector("img");
                            img.src = i.url;
                        } else {
                            listImg.add(i.url);
                        }
                    }
                })
                listImg.forEach(i => {
                    for (var j = 1; j < 5; j++) {
                        const img = document.querySelector('#img' + j).parentElement.querySelector("img");
                        if (img.getAttribute('src') == '../images/plus.png') {
                            img.src = i;
                            break;
                        }
                    }
                })
                hindenIconDelete();
            }
            var list = ${imgList}
            $(document).ready(function () {
                if (${!empty imgList}) {
                    initImages();
                }
            });
//            var arr = []
//            const handleFileChange = (el) => {
//                const fileCount = el.files.length;
//                const files = el.files;
//                if (fileCount > 0)
//                    document.querySelector(".bd-example").style.display = "block";
//                for (var i = 0; i < files.length; i++) {
//                    if (arr.length >= 5) {
//                        arr.shift()
//                    }
//                    const file = files[i]
//                    var path = (window.URL || window.webkitURL).createObjectURL(file);
//                    arr.push(file)
//                }
//                const indicatiors = document.querySelector(".carousel-indicators");
//                const carouselInners = document.querySelector(".carousel-inner");
//                readAndPreview(arr, indicatiors, carouselInners);
//            }
//            const formData = new FormData()
//            const form = document.querySelector(".product-form")
//            form.addEventListener("submit", (event) => {
//                event.preventDefault();
//                let isEmpty = false;
//                document.querySelectorAll(".product-form input").forEach(i => {
//                    if (i.value === "")
//                        isEmpty = true;
//                })
//                if (arr.length == 0) {
//                    document.querySelector(".notification").innerHTML = "Bạn chưa đăng hình cho sản phẩm này!!";
//                    return false;
//                }
//                if (isEmpty)
//                    swal("Oops", "Hãy điền vào các ô còn trống", "error");
//                const categoryHidden = document.querySelector(".category-hidden");
//                const descriptionHidden = document.querySelector(".description-hidden");
//                categoryHidden.value = $(".select-category").val()
//                descriptionHidden.value = editor.getData();
//                console.log(document.querySelector(".description-hidden").value)
//                formData.delete("image")
//                if (arr.length > 0) {
//                    for (let i = 0; i < arr.length; i++) {
//                        const element = arr[i];
//                        formData.append("image", element)
//                    }
//                    form.submit();
//                    $.ajax('<c:url value="/GetProductAjax"/>', {
//                        data: {
//                            name: document.querySelector(".product-name").value,
//                            func: "init productName"
//                        },
//                        success: function (data) {
//                            console.log("ok")
//                            fetch('<c:url value="/FileProductHandle"/>', {
//                                method: "POST",
//                                body: formData,
//                            })
//                        }
//                    })
//
//                }
//                console.log(formData.getAll("image"))
//            })
//            const fileInput = document.querySelector('#file');
//            const toggleFile = () => {
//                fileInput.click()
//            }

        </script>
        <script>
//            editor.setData = ${product.description}
            window.addEventListener("DOMContentLoaded", () => {
                ClassicEditor
                        .create(document.querySelector('#description'))
                        .then(newEditor => {
                            editor = newEditor;
                        })
                        .catch(error => {
                            console.error(error);
                        })
            }
            );
        </script>
        <script>
            function  previewProduct() {
                const category = $(".select-category").find(':selected')[0].innerHTML;
                document.querySelector("#description-preview").innerHTML = editor.getData();
                const quantity = document.querySelector("#formattedNumberField").value
                document.querySelector(".product-quantity").innerHTML = quantity
                const productName = document.querySelector(".product-name").value
                document.querySelector(".product-name-modal").innerHTML = productName
                const indicatiorModal = document.querySelector(".carousel-indicators-modal");
                const carouselInnerModal = document.querySelector(".carousel-inner-modal");
                console.log(indicatiorModal)
                console.log(carouselInnerModal)
                readAndPreview(arr, indicatiorModal, carouselInnerModal);
            }

        </script>
    </body>
</html>