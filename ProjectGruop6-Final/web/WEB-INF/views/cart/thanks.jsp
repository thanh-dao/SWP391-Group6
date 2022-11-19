<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .letter {
                background-color: #f48221;
            }
            .thank__left {
                width: 70%;
            }
            .thank__left img {
                width: 100%;
                border-radius: 50%;
            }
            .thank__left h1 {
                font-family: 'Brush Script MT';
                font-size: 55px;
            }
            .thank__right img {
                width: 100%;
            }
            .thank__right {
                width: 30%;
            }
            .thank__right img {
                width: 100%;
            }
            .letter p {
                margin-top: 20px;
                background-color: white;
                border-radius: 20px;
                padding-left: 20px;
                padding-right: 20px;
                font-size: 20px;
            }
            .gift {
                width: 40%;
            }
            .content .logo {
                display: flex;
            }
            .content img {
                color: rgb(67, 223, 0);
                /*height: 250px;*/
                align-items: center;
                text-align: center;
                margin: 0 auto;
            }
            .btn{margin: 5px 5px 0 0;}
        </style>
    </head>
    <body>
        <div class="content">
            <div class="container">
                <div class="logo">
                    <!-- <i class="fa-solid fa-circle-check"></i> -->
                    <img src="https://cdn.dribbble.com/users/1751799/screenshots/5512482/media/1cbd3594bb5e8d90924a105d4aae924c.gif" alt="">
                </div>
                <h1 class="text-center text-success">Đặt hàng thành công</h1>
                <div class="d-flex justify-content-center" style="margin-top: 20px;">
                    <a href="<c:url value="/home/main.do"/>" class="btn btn-primary">Trang chủ</a>
                    <a href="<c:url value="/order/history.do"/>" class="btn btn-secondary">Lịch sử đơn hàng</a>
                </div>
            </div>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    </body>
</html>
