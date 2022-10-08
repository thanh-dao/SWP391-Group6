<%-- 
    Document   : productDetail
    Created on : Sep 14, 2022, 3:38:49 AM
    Author     : ADmin
--%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Product</title>
        <!-- Bootstrap CSS -->

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

            .dropdown button {
                min-width: 150px;
            }
        </style>
    </head>
    <body>

        <div class="product__details">
            <div class="container">
                <c:if test="${sessionScope.user.address.isNull() == true}">
                    <script>
                        window.location.href = "/ProjectGroup6/user/login.do";
                        localStorage.setItem("message", "you are not allowed to use this feature");
                    </script>
                </c:if>
                <div class="product__content">
                    <form action="<c:url value="/home"/>" onclick="handleSubmit()">
                        <div class="row ">
                            <div class="upload col-lg-5 col-md-5 col-sm-5">
                                <button class="upload-button" type="button" onclick="toggleFile()">
                                    <i class="fa-solid fa-camera"></i>
                                </button>
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

                                <h5>Tên sản Phẩm</h5><input name="name" type="text">
                                <h5>Giá sản phẩm</h5><input name="price" min="0" maxlength="12" type="number">
                                <h5>Số lượng sản phẩm</h5><input name="quantity" type="number" max="2147483000" min="0">
                                <h5>Mô tả sản phẩm</h5>
                                <div id="description">

                                </div>
                                <!--                                    <textarea  type="textarea"style="width: 100%;" required="true" name="address"
                                                                             placeholder="Ví dụ: Khách hàng có thể nhận hàng vào buổi sáng"
                                                                             class="input-form-item"></textarea>-->
                                <h5>Số điện thoại</h5>
                                <input type="text" name="phone">
                                <br />
                                <h5>Email</h5>
                                <input type="email" placeholder="Email" disabled>
                                <h5>Địa chỉ người bán</h5><input name="address" type="text" placeholder="số nhà, tên đường">
                                <div class="row justify-content-between">
                                    <div class="dropdown col-lg-3">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Thành phố
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <button type="button" data-id="79" class="dropdown-item" >Hồ Chí Minh</button>
                                        </div>
                                    </div>

                                    <div class="dropdown col-lg-3">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" disabled="" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Quận/Huyện
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <button type="button"  class="dropdown-item" >Action</button>
                                        </div>
                                    </div>

                                    <div class="dropdown col-lg-3">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" disabled="" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Phường/Xã
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <button type="button"  class="dropdown-item" >Action</button>
                                        </div>
                                    </div>
                                    <input class="address-hidden" type="text" name="address-hidden" hidden readonly>
                                    <input class="description-hidden" type="text" readonly hidden name="description-hidden" >
                                </div>
                                <div class="buy d-flex justify-content-around button_1">
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
                                        const indicatiors = document.querySelector(".carousel-indicators");
                                        const carouselInner = document.querySelector(".carousel-inner");
                                        const imageNameRegex = /\.(jpe?g|png|gif)$/i;
                                        function readAndPreview(files) {
                                            indicatiors.innerHTML = "";
                                            carouselInner.innerHTML = "";
                                            for (let i = 0; i < files.length; i++) {
//                                            console.log(imageNameRegex.test(i.result))
                                                const file = files[i];
                                                if (imageNameRegex.test(file.name)) {
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
                                                }
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
                                        const handleSubmit = () => {
                                            document.querySelector(".address-hidden").value = "54;555;22015"
                                            document.querySelector(".description-hidden").value = editor.getData();
                                            console.log(document.querySelector(".description-hidden").value)
                                            // reset form data
                                            formData.delete("image")
                                            if (arr.length > 0) {
                                                for (let i = 0; i < arr.length; i++) {
                                                    const element = arr[i];
                                                    formData.append("image", element)
                                                }
                                                const values = formData.getAll("image")
                                                fetch('<c:url value="/FileHandle"/>', {
                                                    method: "POST",
                                                    body: formData,
                                                    headers: new Headers()
                                                })
                                            }
                                            console.log(formData.getAll("image"))
                                        }
                                        const fileInput = document.querySelector('#file');
                                        const toggleFile = () => {
                                            fileInput.click()
                                        }

        </script>
        <script>
            var wordCountDescription = {
                showParagraphs: false,
                showWordCount: true,
                showCharCount: true,
                countSpacesAsChars: false,
                countHTML: false,
                maxWordCount: -1,
                maxCharCount: 2000
            }
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