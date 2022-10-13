<%-- 
    Document   : productDetail
    Created on : Sep 14, 2022, 3:38:49 AM
    Author     : ADmin
--%>
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
        <style>
            .product__details {
                margin-bottom: 50px;
            }

            .buy a {
                color: white;
            }

            buy a:hover {
                text-decoration: none;
            }

            .buy button {
                background-image: linear-gradient(
                    to right,
                    #f55f8d 0%,
                    #f8ae56 51%,
                    #f55f8d 100%
                    );
                transition: 0.5s;
                background-size: 200%;
                color: white;
                box-shadow: 0 0 20px #eee;
                border-radius: 30px;
                border: #eee;
                height: 50px;
                width: 150px;
            }

            .buy button:hover {
                background-position: right center;
                color: #fff;
                text-decoration: none;
                cursor: pointer;
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

            .select-category {
                margin-bottom: 10px; 
            }
        </style>
    </head>
    <body>

        <div class="product__details">
            <div class="container">
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
                    <form  method="GET" class="product-form">
                        <div class="row ">
                            <div class="upload col-lg-5 col-md-5 col-sm-5">
                                <button class="upload-button" type="button" onclick="toggleFile()">
                                    <i class="fa-solid fa-camera"></i>
                                </button>
                                <p class="notification"></p>
                                <input id="file" onchange="handleFileChange(this)" class="input-image" type="file" multiple hidden accept="image/*">
                                <div class="bd-example">
                                    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">

                                        </ol>
                                        <div class="carousel-inner mt-5">

                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
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
                                       type="text" readonly hidden  >
                                <input readonly 
                                       name="cateId"
                                       hidden class="category-hidden">
                            </div>
                            <div class="buy d-flex justify-content-center button_1">
                                <button type="submit">Lưu</button>
                                <button onclick="previewProduct()">Xem trước</button>
                            </div>
                        </div>
                </div>
                </form>
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
        const indicatiors = document.querySelector(".carousel-indicators");
        const carouselInner = document.querySelector(".carousel-inner");
//        const imageNameRegex = /\.(gif|jpe?g|tiff?|png|webp|bmp)$/i;
        function readAndPreview(files) {
            indicatiors.innerHTML = "";
            carouselInner.innerHTML = "";
            for (let i = 0; i < files.length; i++) {
                const file = files[i];
                const reader = new FileReader();

                reader.addEventListener("load", () => {
                    indicatiors.innerHTML +=
                            '<li data-target="#carouselExampleCaptions" data-slide-to="' + i.toString() + '" class="' + (i == 0 ? "active" : "") + '"></li>';
                    carouselInner.innerHTML +=
                            '<div class="carousel-item ' + (i == 0 ? 'active' : '') + '" >' +
                            '<img src="' + reader.result + ' " class="d-block w-100" alt="">' +
                            '<div class="carousel-caption d-none d-md-block">' +
                            '<p>' + file.name + '</p>' +
                            `</div>
                                                </div>`
                }, false);
                reader.readAsDataURL(file);
//                }
            }
        }
        const arr = []
        const handleFileChange = (el) => {
            const fileCount = el.files.length;
            const files = el.files;
            if (fileCount > 0)
                document.querySelector(".bd-example").style.display = "block";
            for (var i = 0; i < files.length; i++) {
                if (arr.length >= 5) {
                    arr.shift()
                }
                const file = files[i]
                var path = (window.URL || window.webkitURL).createObjectURL(file);
                arr.push(file)
            }
            readAndPreview(arr);

        }
        const formData = new FormData()
        const form = document.querySelector(".product-form")
        form.addEventListener("submit", (event) => {
            event.preventDefault();
            if (arr.length == 0) {
                document.querySelector(".notification").innerHTML = "Bạn chưa đăng hình cho sản phẩm này!!";
                return false;
            }
            const categoryHidden = document.querySelector(".category-hidden");
            const descriptionHidden = document.querySelector(".description-hidden");
            categoryHidden.value = $(".select-category").val()
            descriptionHidden.value = editor.getData();
            console.log(document.querySelector(".description-hidden").value)
            formData.delete("image")
            if (arr.length > 0) {
                for (let i = 0; i < arr.length; i++) {
                    const element = arr[i];
                    formData.append("image", element)
                }
                form.submit();

                $.ajax('<c:url value="/GetProductAjax"/>', {
                    data: {
                        name: document.querySelector(".product-name").value,
                        func: "init productName"
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
            console.log(formData.getAll("image"))
        })
        function timeout(ms, promise) {
            return new Promise(function (resolve, reject) {
                setTimeout(function () {
                    reject(new Error("timeout"))
                }, ms)
                promise.then(resolve, reject)
            })
        }
        const fileInput = document.querySelector('#file');
        const toggleFile = () => {
            fileInput.click()
        }

    </script>
    <script>
        window.addEventListener("DOMContentLoaded", () => {
            ClassicEditor
                    .create(document.querySelector('#description'))
                    .then(newEditor => {
                        editor = newEditor;
                    })
                    .catch(error => {
                        console.error(error);
                    })
        });
//            console.log(editor);

    </script>

</body>
</html>