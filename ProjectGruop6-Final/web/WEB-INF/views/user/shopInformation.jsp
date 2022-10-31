<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link href="../css/main.css" rel="stylesheet" type="text/css"/>
        <style>
            .shop__background {
                /*background-color: red;*/
                /*background-color: #F1F9FF;*/
                /*background-color: #DCEDFC;*/
                /*background-color: #EAF1FB;*/
                background-image: linear-gradient(to bottom right, #002347, #F1F9FF);
                display: flex;
            }
            .shop__ava img {
                width: 30%;
            }

            /*            .shop__name {
                            margin-top: 30px;
                            margin-left: 30px;
                        }
            
                        .shop__name .name {
                            font-size: 40px;
                            font-weight: bold;
                        }*/

            .shop__button {
                display: flex;
                justify-content: space-around;
                margin-top: 20px;
            }

            .shop__info {
                padding-left: 30px;
                padding-top: 30px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="shop__content row">
                <div class="left col-6 shop__background">
                    <div class="d-flex">
                        <div class="avatar">
                            <img src="<c:url value="${seller.avatarLink}"/>" alt="">
                        </div>
                        <p class="avatar-name">${seller.firstName} ${seller.lastName}</p>
                    </div>
                </div>
                <div class="shop__info col-6">
                    <p>San pham</p>
                    <p>Danh gia</p>
                </div>
            </div>
            <div class="shop__content row">

            </div>
        </div>
        <div class="related">
            <div class="container">
                <div class="related__content row">
                    <div class="product__item col-2">
                        <img src="" alt="">
                        <p>Ao hoodie form rong</p>
                        <p>13000 - 65000</p>
                        <p>Da ban 3.3k</p>
                        <p>Ha noi</p>
                    </div>
                    <div class="product__item col-2">
                        <img src="" alt="">
                        <p>Ao hoodie form rong</p>
                        <p>13000 - 65000</p>
                        <p>Da ban 3.3k</p>
                        <p>Ha noi</p>
                    </div>
                    <div class="product__item col-2">
                        <img src="" alt="">
                        <p>Ao hoodie form rong</p>
                        <p>13000 - 65000</p>
                        <p>Da ban 3.3k</p>
                        <p>Ha noi</p>
                    </div>
                    <div class="product__item col-2">
                        <img src="" alt="">
                        <p>Ao hoodie form rong</p>
                        <p>13000 - 65000</p>
                        <p>Da ban 3.3k</p>
                        <p>Ha noi</p>
                    </div>
                    <div class="product__item col-2">
                        <img src="" alt="">
                        <p>Ao hoodie form rong</p>
                        <p>13000 - 65000</p>
                        <p>Da ban 3.3k</p>
                        <p>Ha noi</p>
                    </div>
                    <div class="product__item col-2">
                        <img src="" alt="">
                        <p>Ao hoodie form rong</p>
                        <p>13000 - 65000</p>
                        <p>Da ban 3.3k</p>
                        <p>Ha noi</p>
                    </div>
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
