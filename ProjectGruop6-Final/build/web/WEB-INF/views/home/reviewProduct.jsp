<%-- 
    Document   : reviewProduct
    Created on : Sep 14, 2022, 6:40:54 AM
    Author     : ADmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Bootstrap CSS -->

        <style>
            .star i{
                color: yellow;
                font-size: 20px;
            }

            .upload__image button {
                height: 50px;
                width: 50px;
            }

            input {
                height: 200px;
                width: 100%;
                padding-bottom: 170px;
            }
        </style>

    </head>
    <body>
        <div class="review">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-sm-2">
                    </div>
                    <div class="review__info__content col-lg-8 col-md-8 col-sm-8">
                        <div class="star d-flex justify-content-center">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                        </div>
                        <div class="upload__image d-flex justify-content-between">
                            <button>
                                <i class="fa-solid fa-camera"></i>
                            </button>
                        </div>
                        <p>Tên Khách Hàng   </p>
                        <p>Ngày đánh giá</p>
                        <p>Email</p>

                        <form action="">
                            <input type="text" placeholder="Đóng gói, Chất lượng, Giá thành ">
                        </form>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2">
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
