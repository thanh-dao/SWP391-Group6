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

            .upload button {
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
        </style>
    </head>
    <body>

        <div class="product__details">
            <div class="container">

                <div class="product__content">
                    <form onsubmit="handleSubmit()">
                        <div class="row">
                            <div class="upload col-lg-5 col-md-5 col-sm-5">
                                <button onclick="document.querySelector('.input-image').click()">
                                    <i class="fa-solid fa-camera"></i>

                                </button>
                                <input id="#file" onchange="handleFileChange(this)" class="input-image" type="file" multiple hidden accept="image/*">
                            </div>

                            <div class="col-lg-7 col-md-7 col-sm-7">

                                <h5>Tiêu đề</h5><input type="text" >
                                <h5>Tên sản Phẩm</h5><input type="text">
                                <h5>Giá sản phẩm</h5><input type="number">
                                <h5>Số lượng sản phẩm</h5><input type="number">
                                <h5>Mô tả sản phẩm</h5>
                                <textarea type="textarea"style="width: 100%;" required="true" name="address"
                                          placeholder="Ví dụ: Khách hàng có thể nhận hàng vào buổi sáng"
                                          class="input-form-item"></textarea>
                                <h5>Số điện thoại</h5>
                                <input type="text">
                                <br />
                                <h5>Email</h5>
                                <input type="text" placeholder="Email" disabled>
                                <h5>Địa chỉ người bán</h5><input type="text">
                                <div class="buy d-flex justify-content-around button_1">
                                    <button><a href="<c:url value="#"/>">Lưu</a></button>
                                    <button><a href="<c:url value="/home/checkProduct.do"/>">Xem trước</a></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            const arr = []
            const inputFile = document.querySelector("#file");
            const handleFileChange = (el) => {
                arr.forEach(i => {
                    console.log(i)
                })
                const fileCount = el.files.length;
                const files = el.files
                for (var i = 0; i < files.length; i++) {
                    if (arr.length >= 5) {
                        arr.shift()
                    }
                    const file = files[i]
                    var path = (window.URL || window.webkitURL).createObjectURL(file);
                    arr.push(file)
                }
            }
            const formData = new FormData()
            const handleSubmit = () => {
                for (let i = 0; i < arr.length; i++) {
                    const element = arr[i];
                    formData.append("image" + i.toString(), element)
                }
                fetch('FileHandle', {
                    method: "POST",
                    body: formData
                })
            }

        </script>
    </body>
</html>