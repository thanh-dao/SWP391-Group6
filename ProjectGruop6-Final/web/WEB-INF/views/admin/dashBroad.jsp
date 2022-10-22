<%-- 
    Document   : dashBoard
    Created on : Sep 14, 2022, 4:37:06 AM
    Author     : ADmin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dash board</title>
        <style>
            a {
                text-decoration: none;
            }
            body {
                height: 100vh;
            }

            .card {
                max-width: 200px;
                max-height: 100px;
                background-color: #ccc;
                margin-bottom: 20px;    
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
                z-index: 1;
            }




            .row-custom{
                display: flex;
                justify-content: center;
            }
            .row-custom canvas {
                display: flex;
                justify-content: center;
                width: 75% !important;
                height: 20% !important;
            }

            /* add responsive for chart */

        </style>
    </head>
    <body>
        <div class="d-flex flex-column position-fixed text-white bg-dark pt-3 nav-menu">
            <a href="#" class="d-flex align-items-center mb-3 mb-md-0 overflow-hidden  text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32">
                git      <use xlink:href="#bootstrap"></use>
                </svg>
                <span class="fs-4 text-align">Home</span>
            </a>
            <button class="navigate-button position-absolute" type="button">
                <ion-icon name="menu-outline"></ion-icon>
            </button>
            <hr>
            <ul class="nav nav-pills flex-column overflow-hidden mb-auto ">
                <li class="nav-item">
                    <a href="<c:url value="/admin/productAuthen.do?status=nary"/>" class="nav-link text-white">
                        <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#grid"></use>
                        </svg>
                        Sản phẩm
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
                    <a href="<c:url value="/admin/reviewAuthen.do?status=nary"/>" class="nav-link text-white">
                        <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#people-circle"></use>
                        </svg>
                        Đánh giá
                    </a>
                </li>
                <li class="nav-item" style="display: ${sessionScope.user.roleId == 1 ? "block":"none"}">
                    <a href="<c:url value="/admin/adminAuthen.do?status=user"/>" class="nav-link text-white">
                        <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#people-circle"></use>
                        </svg>
                        Admin
                    </a>
                </li>
            </ul>
            <hr>
        </div>
        <div class=" pt-3 container-fluid">
            <div class="row d-flex pb-5 gap-3 w-100 justify-content-around">
                <div class="card col-sm-12 col-md-6 col-lg-3">
                    <div class="card-body d-flex justify-content-between">
                        <div class="card-body-left">
                            <h3 class="card-title">${userCount}</h3>
                            <p class="counter">1200</p>
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
                            <h3 class="card-title">${totalOrder}</h3>
                            <p>Đơn hàng</p>
                        </div>
                        <div class="card-body-right d-flex mb-3 align-items-center">
                            <i class="fa-solid fa-bag-shopping"></i>
                        </div>
                    </div>
                </div>
                <div class="card col-sm-12 col-md-6 col-lg-3">
                    <div class="card-body d-flex justify-content-between">
                        <div class="card-body-left">
                            <fmt:setLocale value="vi-VN"/>
                            <h3 class="card-title"><fmt:formatNumber  value="${totalIncome}" type="currency"/></h3>
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
                            <h3 class="card-title">${totalReview}</h3>
                            <p>Đánh giá</p>
                        </div>
                        <div class="card-body-right d-flex mb-3 align-items-center">
                            <i class="fa-solid fa-comments"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row-custom">
                <canvas class="" id="chart0"></canvas>

            </div>

            <!--<div class="container">-->
            <br>
            <br>
            <div class="row d-flex justify-content-center">
                <div class="col-md-8">
                    <table class="table  table-responsive  table-hover">
                        <h4 style="display: inline-block;">Top 10 sản phẩm bán chạy</h4>
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Số lượng đã bán</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${top10Product}" var="i" varStatus="loop">
                                <tr>
                                    <th scope="row">${loop.count}</th>
                                    <td>${i.name}</td>
                                    <td>${i.quantity}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>


                <div class="col-md-3">
                    <h4>Top 10 shop bán chạy</h4>
                    <table class="table table-responsive table-hover caption-top">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Email người bán</th>
                                <th scope="col">Đã bán</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${top10Seller}" var="i" varStatus="loop">
                                <tr>
                                    <td>${loop.count}</td>
                                    <td>${i.key}</td>
                                    <td>${i.value}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table> 
                </div>
            </div>   


            <!--
                         new table
                        <div class="summary">
                            <div class="container">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Số lượng đã bán</th>
                                                <th>Email đã bán</th>
                                                <th>Người bán</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Anna</td>
                                                <td>Pitt</td>
                                                <td>35</td>
                                                <td>New York</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>            -->


        </div>

    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
            integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!--counting up-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"
            integrity="sha512-ZKNVEa7gi0Dz4Rq9jXcySgcPiK+5f01CqW+ZoKLLKr9VMXuCsw3RjWiv8ZpIOa0hxO79np7Ec8DDWALM0bDOaQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="/Counting-Up-To-Numerical-Values-On-Scroll-jQuery-Countup-js/jquery.countup.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- add ionicons  -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <!-- add bootstrap -->
    <!--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>-->

    <script>
        const navElements = document.querySelectorAll(".nav-item");
        const removeActiveClass = (elements) => {
            elements.forEach(item => {
                console.log("childNodes: ");
                console.log(item.childNodes);
                item.childNodes[1].classList.remove("active");
            })
        }
        navElements.forEach(i => {
            i.addEventListener("click", () => {
                removeActiveClass(navElements)
                i.childNodes[1].classList.add("active");
            })
        })
        const navBtn = document.querySelector(".navigate-button")
        let opened = false;
        const navMenu = document.querySelector(".nav-menu");
        navBtn.addEventListener("click", () => {
            console.log(1);
            opened = !opened;
            const navMenuStyle = navMenu.style
            if (opened) {

                navBtn.innerHTML = '<ion-icon name="close-outline"></ion-icon>'
                document.addEventListener("click", (e) => {
                    const classList = e.target.classList
                    if (!classList.contains("nav-menu") && !classList.contains("hydrated")) {
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

        function setActive(el) {
            document.querySelectorAll(".nav-item").forEach(i => {
                i.classList.remove("active")
            })
            el.classList.add("active")
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>

        const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        const curMonth = new Date().getMonth() + 1;



        const labels = [];
        for (let i = curMonth - 1; i >= curMonth - 6; i--) {
            labels.push(months[i]);
        }
        console.log(labels)
        console.log(${totalReviewCurrentMonths})
        console.log(${totalIncomeCurrentMonths})
        console.log(${totalOrderCurrentMonth})
        const data = {
            labels: labels.reverse(),
            datasets: [
                {
                    label: 'Đơn hàng',
                    backgroundColor: 'rgb(255, 99, 132)',
                    borderColor: 'rgb(255, 99, 132)',
                    data: ${totalOrderCurrentMonth}.reverse(),
                },
                {
                    label: 'Doanh số',
                    backgroundColor: '#429ef5',
                    borderColor: '#429ef5',
                    data: ${totalIncomeCurrentMonths}.reverse(),
                },
                {
                    label: 'Đánh giá',
                    backgroundColor: '#c242f5',
                    borderColor: '#c242f5',
                    data: ${totalReviewCurrentMonths}.reverse(),
                },
            ]
        };
        const config = {
            type: 'line',
            data: data,
            options: {
                responsive: true,
                interaction: {
                    mode: 'index',
                    intersect: false,
                }
            },
            plugins: {
                title: {
                    display: true,
                    text: 'Chart.js Line Chart - Multi Axis'
                }
            },
            scales: {
                y: {
                    type: 'linear',
                    display: true,
                    position: 'left',
                },
            }
        };
        const myChart = new Chart(
                document.getElementById('chart0'),
                config
                );

    </script>
    <script>
        $('.counter').countUp();
    </script>


</body>

</html>
