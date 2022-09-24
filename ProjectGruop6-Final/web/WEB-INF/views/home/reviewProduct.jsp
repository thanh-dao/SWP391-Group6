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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            .star i{
                color: yellow;
                font-size: 20px;
            }

            .upload__image button {
                height: 200px;
                width: 200px;
            }

            .upload__image button i {
                font-size: 100px;
            }

            .review input {
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
                        <div class="upload__image row">
                            <div class="col-lg-4 col-md-4 col-sm-4"></div>
                            <button class="col-lg-4 col-md-4 col-sm-4">
                                <i class="fa-solid fa-camera text-center"></i>
                            </button>
                            <div class="col-lg-4 col-md-4 col-sm-4"></div>
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
