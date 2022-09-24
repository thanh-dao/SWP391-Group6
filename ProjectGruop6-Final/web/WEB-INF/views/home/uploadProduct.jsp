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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            .product__details {
                margin-bottom: 50px;
            }
            
            .product__details h1 {
                margin-bottom: 30px;
            }
            
            .buy a {
                color: white;
            }
            
            buy a:hover {
                text-decoration: none;
            }
            
            .buy button {
                background-color: orange;
                border-radius: 30px;
                border: #eee;
                height: 50px;
                width: 150px;
                border-radius: 30px;
                border: #eee;
                height: 50px;
                width: 150px;
            }

            .buy button:hover {
                background-color: orangered;
                text-decoration: none;
                cursor: pointer;
            } 
            
            .buy a:hover {
                text-decoration: none;
            }
            
            .upload button {
                height: 200px;
                width: 200px;
            }
            
            .upload button i {
                font-size: 100px;
            }
            
            .describe {
                height: 200px;
                padding-bottom: 175px;
            }
            
            input {
                width: 100%;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>

        <div class="product__details">
            <div class="container">
                <h1>Đang bán sản phẩm</h1>
                <div class="product__content">

                    <div class="row">
                        <div class="upload col-lg-5 col-md-5 col-sm-5">
                            <button>
                                <i class="fa-solid fa-camera"></i>
                            </button>
                        </div>

                        <div class="col-lg-7 col-md-7 col-sm-7">
                            <h5>Tiêu đề</h5><input type="text" >
                            <h5>Tên sản Phẩm</h5><input type="text">
                            <h5>Giá sản phẩm</h5><input type="number">
                            <h5>Mô tả sản phẩm</h5><input class="describe" type="text">
                            <h5>Số điện thoại</h5><input type="text">
                            <br />
                            <h5>Email</h5><input type="text" placeholder="Email" disabled>
                            <h5>Địa chỉ người bán</h5><input type="text">
                            <div class="buy d-flex justify-content-around">
                                <button><a href="<c:url value="#"/>">Lưu</a></button>
                                <button><a href="<c:url value="/home/checkProduct.do"/>">Xem trước</a></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>