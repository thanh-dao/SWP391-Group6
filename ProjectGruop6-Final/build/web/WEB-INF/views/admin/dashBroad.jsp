<%-- 
    Document   : dashBoard
    Created on : Sep 14, 2022, 4:37:06 AM
    Author     : ADmin
--%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            a{text-decoration: none;}
            body {
                height: 100vh;
            }

            .card {

                max-width: 200px;
                max-height: 100px;
                background-color: #ccc;
            }

            .card-body {
                padding: 0;
                padding-top: 10px;
            }

            .card-body-right i {
                font-size: 2rem;
            }

            .card-body-left h3 {
                font-size: 1.8rem;
            }

            .card-body-left p {
                font-size: 1.2rem;
            }

            .nav-menu {
                z-index: 10000;
            }

            .navigate-button {
                width: 30px;
                height: 30px;
                font-size: 1.5rem;
                display: flex;
                justify-content: center;
                align-items: center;
                border: none;
                margin: 0;
                box-sizing: content-box;
            }

            .nav-menu {
                transition: 0.3s;
                height: 100vh;
                width: 0;
            }

            canvas {
                box-sizing: border-box;
                width: 100%;
                height: 100%;
                display: block;
            }



            .row-custom {
                display: flex;
                flex-wrap: wrap;
                margin-top: calc(var(--bs-gutter-y) * -1);
                margin-right: calc(var(--bs-gutter-x) * -.5);
                margin-left: calc(var(--bs-gutter-x) * -.5);
                justify-content: center;
                width: 100%;
            }

            /* add responsive for chart */
            @media (min-width: 991.98px) {
                .row-custom canvas {
                    width: 41.6666667% !important;
                    height: auto !important;
                }
            }

            @media (max-width: 652px) {
                .row-custom canvas {
                    width: 100% !important;
                }
            }
        </style>
        <title>Document</title>
    </head>
    <body>
        <div class="d-flex flex-column position-fixed text-white bg-dark pt-3 nav-menu">
            <a href="#" class="d-flex align-items-center mb-3 mb-md-0 overflow-hidden  text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32">
                <use xlink:href="#bootstrap"></use>
                </svg>
                <span class="fs-4 text-align">Home</span>
            </a>
            <button class="navigate-button position-absolute" type="button">
                <ion-icon name="menu-outline"></ion-icon>
            </button>
            <hr>
            <ul class="nav nav-pills flex-column overflow-hidden mb-auto ">
                <li class="nav-item">
                    <a href="<c:url value="/admin/productAuthen.do"/>" class="nav-link text-white">
                        <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#grid"></use>
                        </svg>
                        Sản phẩm
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="/admin/deleteProduct.do"/>" class="nav-link text-white">
                        <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#grid"></use>
                        </svg>
                        Xóa sản phẩm
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="/admin/dashBroad.do"/>" class="nav-link active text-white">
                        <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#table"></use>
                        </svg>
                        Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a href="<c:url value="/admin/reviewAuthen.do"/>" class="nav-link text-white">
                        <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#people-circle"></use>
                        </svg>
                        Đánh giá
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="/admin/adminAuthen.do"/>" class="nav-link text-white">
                        <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#people-circle"></use>
                        </svg>
                        Admin
                    </a>
                </li>
            </ul>
            <hr>
            <div class="dropdown p-3">
                <a href="#"
                   class="d-flex align-items-center overflow-hidden text-white text-decoration-none dropdown-toggle"
                   id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
                    <strong>mdo</strong>
                </a>
                <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                    <li><a class="dropdown-item" href="<c:url value="/user/userInformaion.do"/>">Trang</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href="#">Đăng Xuất</a></li>
                </ul>
            </div>
        </div>
        <div class=" pt-3 container">
            <div class="row d-flex pb-5 gap-3 w-100 justify-content-center">
                <div class="card col-sm-12 col-md-6 col-lg-3">
                    <div class="card-body d-flex justify-content-between">
                        <div class="card-body-left">
                            <h3 class="card-title">123</h3>
                            <p>Người dùng</p>
                        </div>
                        <div class="card-body-right d-flex mb-3 align-items-center">
                            <i class="fa-solid fa-user-group"></i>
                        </div>
                    </div>
                </div>
                <div class="card col-sm-12 col-md-6 col-lg-3">
                    <div class="card-body d-flex justify-content-between">
                        <div class="card-body-left">
                            <h3 class="card-title">123</h3>
                            <p>Đon hàng</p>
                        </div>
                        <div class="card-body-right d-flex mb-3 align-items-center">
                            <i class="fa-solid fa-bag-shopping"></i>
                        </div>
                    </div>
                </div>
                <div class="card col-sm-12 col-md-6 col-lg-3">
                    <div class="card-body d-flex justify-content-between">
                        <div class="card-body-left">
                            <h3 class="card-title">123</h3>
                            <p>Lợi nhuận</p>
                        </div>
                        <div class="card-body-right d-flex mb-3 align-items-center">
                            <i class="fa-regular fa-credit-card"></i>
                        </div>
                    </div>
                </div>
                <div class="card col-sm-12 col-md-6 col-lg-3">
                    <div class="card-body d-flex justify-content-between">
                        <div class="card-body-left">
                            <h3 class="card-title">123</h3>
                            <p>Đánh giá</p>
                        </div>
                        <div class="card-body-right d-flex mb-3 align-items-center">
                            <i class="fa-solid fa-comments"></i>
                            </i>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row-custom">
            <!-- <div class="col-sm-12 col-md-6" id="user-chart"></div>
            <div class="col-sm-12 col-md-6" id="order-chart"></div>
            <div class="col-sm-12 col-md-6" id="feedback-chart"></div>
            <div class="col-sm-12 col-md-6" id="profit-chart"></div> -->
            <canvas class="col-sm-12 col-md-6" id="chart0"></canvas>
            <canvas class="col-sm-12 col-md-6" id="chart1"></canvas>
            <canvas class="col-sm-12 col-md-6" id="chart2"></canvas>


        </div>
        <!-- add ionicons  -->
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <!-- add bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

        <script>
            const navElements = document.querySelectorAll(".nav-item");
            const removeActiveClass = () => {
                navElements.forEach(item => {
                    item.childNodes[1].classList.remove("active");
                })
            }
            navElements.forEach(i => {
                i.addEventListener("click", () => {
                    removeActiveClass()
                    i.childNodes[1].classList.add("active");
                })
            })
            const navBtn = document.querySelector(".navigate-button")
            let opened = false;
            const navMenu = document.querySelector(".nav-menu");

            navBtn.addEventListener("click", () => {
                opened = !opened;
                const navMenuStyle = navMenu.style
                if (opened) {
                    navBtn.innerHTML = '<ion-icon name="close-outline"></ion-icon>'
                    document.addEventListener("click", (e) => {
                        if (!navMenu.contains(e.target)) {
                            navMenuStyle.width = "0"
                            opened = false;
                            navBtn.innerHTML = '<ion-icon name="menu-outline"></ion-icon>'
                        }
                    })
                    navMenuStyle.width = "300px";
                } else {
                    navBtn.innerHTML = '<ion-icon name="menu-outline"></ion-icon>'
                    navMenuStyle.width = "0"
                }
            })

        </script>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            const labels = [
                'January',
                'February',
                'March',
                'April',
                'May',
                'June',
            ];

            const data = {
                labels: labels,
                datasets: [{
                        label: 'My First dataset',
                        backgroundColor: 'rgb(255, 99, 132)',
                        borderColor: 'rgb(255, 99, 132)',
                        data: [0, 10, 5, 2, 20, 30, 45],
                    }]
            };

            const config = {
                type: 'line',
                data: data,
                options: {
                    responsive: false
                }
            };
        </script>
        <script>
            const myChart = new Chart(
                    document.getElementById('chart0'),
                    config
                    );
            const a = new Chart(
                    document.querySelector("#chart1"),
                    config
                    );
            const b = new Chart(
                    document.querySelector("#chart2"),
                    config
                    );
        </script>


    </body>

</html>
