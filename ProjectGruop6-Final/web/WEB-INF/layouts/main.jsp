<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Layout Demo</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
                      integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
                      crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="css/main.css" rel="stylesheet" type="text/css"/>
        <style>
            body {background-color: #F0F0F0 !important;}
            body {margin: 0;padding: 0;box-sizing: border-box;}
            header {padding-top: 5px;padding-right: 0px;background-color: #334F6C; margin-bottom: 10px;}
            header a:hover {text-decoration: none;}
            /*----------header--------------------------------------------------*/
            .br-form {background: #FFFFFF;padding: 10px;border-radius: 3px;margin-bottom: 10px;}
            .header{background-color: #334F6C;}
            .logo img {width: 85px;height: 85px;border-radius: 50%;padding: 10px;}
            .header__content {margin: 0px 0 8px 0;}
            header button {border:none;background-color: #334F6C}
            .header__content a{color: #FDC632;font-size: 16px;}
            .header__content a:hover {color: #FDC632;}
            i {font-size: 12px;padding-right: 6px;}
            .category{margin-top: 10px;padding-bottom: 5px;}
            .category a {color: #F0F0F0;font-size: 14px;}
            .category a:hover {color: #FDC632;}
            .product__item {
                transition: 0.5s;
            }
            .product__item:hover {
                transform: translateY(-5px);
                transition: 0.5s;
            }
            .search {
                display: flex;
                position: relative;
                width: 100%;
                height: 30px;
                background: #FFFFFF;
                border-radius: 60px;
                box-shadow: 0 0 0 3px #FDC632;
                border: none;
                outline: none;
            }
            .input-search{
                border-radius: 0 50% 50% 0;
                width: 680px;
                height: 100%;
            }
            .search input {
                border-radius: 0 50% 50% 0;
                position: absolute;
                width: 100%;
                height: 100%;
                border: none;
                outline: none;
                font-size: 14px;
            }
            .search-icon {
                background-color: #FFFFFF;
                padding: 1px 0 0 7px;
                border-radius: 50% 0 0 50%;
                hight: 36px;
                width: 36px;
                light: 0;
                top: 0;
                bottom: 0;
            }
            .search-result-layer {
                display: none;
                background-color: #fff;
                width: 80%;
                margin-top: 5px;
                z-index:5
            }
            .search-result-layer li {
                cursor: pointer;
                padding: 5px 10px;
            }
            .search-result-layer li:hover {
                background-color: #fafafa;
            }
            .flex-grow-2{
                width: 20%;
            }
            .flex-wrap{
                flex-wrap: wrap;
            }
            /*==============================================================================*/
            .container-account {
                display: inline; 
                position: relative;
            }
            .user-dropdown {
                position: absolute;
                display: none;
            }
            .container-account:hover .user-dropdown {
                display: block;

            }
            .account-link {
                display: flex;
                height: 40px;
                width: 40px;
                text-decoration: none;
            }
            .container-cart .cart-btn,
            .container-account {
                font-size: 20px;
                padding: 5px 5px 5px 15px;
            }
            .item-text {
                white-space: nowrap;
                display: flex;
                flex-direction: column;
                color: #F0F0F0;
            }
            .user-dropdown {
                position: absolute;
                border: 1px solid rgb(239, 239, 239);
                border-radius: 3px;
                padding: 0;
                box-shadow: rgb(0 0 0 / 18%) 0px 6px 12px 0px;
                background: rgb(255, 255, 255);
                top: 70px;
                left: -30px;
                z-index: 9;
            }
            .user-dropdown p:hover {
                background-color: rgb(245, 244, 245);
                color: rgb(0, 0, 0);
                font-size: 12px;
            }
            .user-dropdown p {
                cursor: pointer;
                /* display: flex; */
                /* align-items: center; */
                text-align: center;
                min-width: 200px;
                margin: 0;
                padding: 8px 20px;
                color: rgb(51, 51, 51);
                font-size: 12px;
                font-weight: 400;
                text-decoration: none;
            }
            .user-dropdown a:hover {
                opacity: 0.95;
            }
            .user-dropdown a {
                text-decoration: none;
                display: flex;
                color: rgb(51, 51, 51);
                font-size: 12px;
                font-weight: 400;
                align-items: center;
                cursor: pointer;
                padding: 10px 10px;
            }
            footer {
                background-color: #334F6C;
                margin-bottom: 0px;
                padding: 20px;
                margin-top: 20px; 
            }
            footer .container {background-color: #334F6C;}
            .txt_footer{line-height: 28px;text-align: center;color: #F0F0F0}
            footer .footer__right a {
                height: 30px;
                width: 30px;
                font-size: 13px;
                text-decoration: none;
                color: #000;
                cursor: pointer;
            }
            footer .footer__right i{
                font-size: 20px;
                height: 30px;
                width: 30px;
            }
            li a{
                color: black;
            }
            li a:hover{
                color: #FFA500;
            }
            /*==============================================================================*/
        </style>
    </head>
    <body>
        <!--header-->
        <!--<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js"></script>-->
        <!--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <header>
            <div class="container">
                <div class="row header">
                    <div class="col-md-1">
                        <a class="logo" href="<c:url value="/home/main.do"/>">
                            <img src="<c:url value="/images/FBT.jpg"/>" alt="">
                        </a>
                    </div>
                    <div class="col-md-10">
                        <div class="header__content d-flex justify-content-between">
                            <button ><a href="<c:url value="/home/main.do"/>"><i class="fas fa-home icon-header"></i>Trang chủ</a></button>
                            <button ><a href="<c:url value="/order/stored.do?status=ar"/>"><i class="fas fa-table"></i>Quản lý tin</a></button>
                            <button ><a href="<c:url value="/home/uploadProduct.do"/>"><i class="fa-sharp fa-solid fa-file-pen"></i>Đăng tin</a></button>
                            <button ><a href="<c:url value="/order/history.do"/>"><i class="fa-sharp fa-solid fa-clipboard"></i>Đơn hàng</a></button>

                            <button style="display: ${sessionScope.user.roleId== 1 or sessionScope.user.roleId== 2 ? "block":"none"}"><a href="<c:url value="/admin/productAuthen.do?status=nary"/>"><i class="fas fa-user-shield"></i>Duyệt</a></button>

                            <button ><a href="<c:url value="/cart/cart.do"/>"><i class="fa-solid fa-cart-shopping"></i>Giỏ hàng</a></button>
                            <c:if test ="${sessionScope.user == null}">
                                <button ><a href="<c:url value="/user/login.do"/>"><i class="fa-sharp fa-solid fa-right-to-bracket"></i>Đăng nhập</a></button>
                            </c:if>                            
                        </div>
                        <div class="search">
                            <div class="search-icon">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <form action="<c:url value="/home/searchProduct.do"/>"  class="input-search">
                                <input  class="position-relative" name="name" onclick="showLayer()" oninput="searchAjax(this)" type="text" placeholder="Tìm kiếm sản phẩm " id="searchInput">   
                                <div class="position-absolute search-result-layer">
                                </div>
                                <input type="submit" hidden>
                            </form>
                        </div>
                        <div class="category">
                            <div class="d-flex justify-content-between flex-wrap">
                                <c:forEach items="${sessionScope.cateList}" var="i">
                                    <a href="<c:url value="/home/productList.do?cateId=${i.cateId}"/>">
                                        <span>${i.name}</span>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <c:if test ="${sessionScope.user != null}">
                            <div class="container-account">
                                <div class="user-dropdown">
                                    <a href="<c:url value="/user/userInformation.do?id=${sessionScope.user.email}"/>">
                                        <p>Tài khoản của tôi</p
                                    </a>
                                    <a href="<c:url value="/user/logout.do"/>">
                                        <p>Đăng xuất</p>
                                    </a>
                                </div>
                                <div class="account-link">
                                    <a class="account-link" href="<c:url value="/user/shopInformation.do?seller=${user.email}"/>" >
                                        <img style="border-radius: 50%;" src="${sessionScope.user.avatarLink}" alt="">
                                    </a>
                                    <div class="account-btn">
                                        <div class="item-text">
                                            <span class="account-title" style="font-size: 80%; padding: 5px;">${sessionScope.user.firstName} ${sessionScope.user.lastName}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </header>
        <!--content-->
        <div>
            <!--Including view-->
            <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp"/>
        </div>
        <!--footer-->         
        <footer>
            <div class="container">
                <div class="row">
                    <div class="footer__left col-lg-10 col-md-9 col-sm-8">
                        <p class="txt_footer">
                            &copy; 2022 FPT University E-commerce Portal - FEP<br>
                            Địa chỉ: Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh<br>
                            Điện thoại: (+84) 936 999 999 | Email: info@fep.com.vn
                        </p>
                    </div>
                    <div style="width: " class="footer__right col-lg-2 col-md-3 col-sm-4">
                        <a style="color: white"  href="<c:url value="https://www.facebook.com/fptaround"/>" target="_blank"><i class="fa-brands fa-facebook"></i>18.595K Fans</a><br>
                        <a style="color: white"  href="<c:url value="https://www.instagram.com/fptuniversityhcm/"/>" target="_blank"><i class="fa-brands fa-instagram"></i>2.203K Followers</a><br>
                        <a style="color: white"  href="<c:url value="https://www.youtube.com/c/FPTUniversityHCM"/>" target="_blank"><i  class="fa-brands fa-youtube"></i>7.33K Subscribers</a>
                    </div>
                </div>
            </div>
        </footer>
    </body>
    <!--<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>-->
    <script>
                                    const searchResultLayer = document.querySelector(".search-result-layer");
                                    const searchBar = document.querySelector(".search");
                                    const showLayer = () => {
                                        searchResultLayer.style.display = "block";
                                        searchResultLayer.offsetWidth = searchBar.offsetWidth;
                                    }
                                    window.addEventListener("click", (e) => {
                                        if (searchResultLayer.style.display == "block" && e.target !== searchBar) {
                                            searchResultLayer.style.display = "none"
                                        }
                                    })
                                    const searchAjax = (el) => {
                                        const value = el.value
                                        if (value == "") {
                                            searchResultLayer.style.display = 'none'
                                        } else {
                                            searchResultLayer.style.display = 'block'
                                            $.ajax("/ProjectGroup6/GetProductAjax", {
                                                data: {
                                                    func: "getSearchResult",
                                                    productName: value
                                                },
                                                success: function (data) {
                                                    searchResultLayer.innerHTML = "";
                                                    console.log(data)
                                                    data.forEach(i => {
                                                        console.log("<li onclick='this.querySelector('a').click()'>" +
                                                                '<a href="/ProjectGroup6/home/productDetail.do?productId=' + i.productId + '">' + i.name + '</a>' +
                                                                '</li>')
                                                        console.log(${i.getMainImage().url});
                                                        searchResultLayer.innerHTML += "<li onclick='this.querySelector('a').click()'>" +
                                                                '<a href="/ProjectGroup6/home/productDetail.do?productId=' + i.productId + '"><img class="img-fluid" src="${i.getMainImage().url}" alt="">\n\
                                                                        ' + i.name + '</a>' +
                                                                '</li>'
                                                    })
                                                }
                                            })
                                        }
                                    }
    </script>
</html>