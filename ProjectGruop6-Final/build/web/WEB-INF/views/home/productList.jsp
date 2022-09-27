<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <style>
            .product .container{
                margin-top: 50px;
            }

            .product__item {
                width: 100%;
                transition: 0.5s;
            }

            .product__item a {
                color: black;
                font-size: 18px;
            }

            .product__item img {
                transition: 0.5s;
            }

            .product__item img:hover {
                transform: translateY(-5px);
                transition: 0.5s;
            }

            .product__item a:hover {
                color:blue;
                text-decoration: none;
            }

            .product__item img {
                height: 230px;
            }

            .product__item span {
                font-size: 20px;
                color: red;
            }
            .next {
                margin-top: 50px;
            }
        </style>
    </head>
    <body>
        <div class="sort">
            <div class="container d-flex">
                <div class="dropdown">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                        Sắp xếp theo
                    </button>
                    <div class="dropdown-menu panel-collapse">
                        <button class="dropdown-item" onclick="sortAjax(1, this)">Giá tăng dần</button>
                        <button class="dropdown-item" onclick="sortAjax(2, this)">Giá giảm dần</button>
                        <button class="dropdown-item" onclick="sortAjax(3, this)">Từ a tới z</button>
                        <button class="dropdown-item" onclick="sortAjax(4, this)">Từ z tới a</button>
                        <button class="dropdown-item" onclick="sortAjax(5, this)">Bán chạy</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="product">
            <div class="container">

                <div class="product__content row">

                    <c:forEach items="${productList}" var="i">
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do?${i.productId}"/>">
                                <img class="img-fluid" src="<c:url value="${i.getMainImage().url}"/>" alt="">
                            </a>
                            <a href="<c:url value="/home/productDetail.do?${i.productId}"/>">${i.name}</a><br>
                            <fmt:setLocale value="vi_VN"/>
                            <span><fmt:formatNumber value="${i.price}" type="currency"/></span>
                        </div>
                    </c:forEach>

                </div>
                <nav class="next" aria-label="Page navigation example">
                    <ul class="pagination d-flex justify-content-center">
                        <li class="page-item"><button class="page-link" onclick="pagingAjax(this, event)">Trước</button></li>
                        <li class="page-item active"><button class="page-link" onclick="pagingAjax(this, event)">1</button></li>
                        <li class="page-item"><button class="page-link"  onclick="pagingAjax(this, event)">2</button></li>
                        <li class="page-item"><button class="page-link" onclick="pagingAjax(this, event)">3</button></li>
                        <li class="page-item"><button class="page-link" onclick="pagingAjax(this, event)">Sau</button></li>
                    </ul>
                </nav>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js" integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous"></script>
        <script>
            const parrentElement = document.querySelector(".product__content.row");
            const pageElements = document.querySelector(".pagination.d-flex.justify-content-center").querySelectorAll(".page-item");
            let getPageNumber = () => {
                
                let count = 0;
                for (var i = 0; i < pageElements.length; i++) {
                    if (pageElements[i].classList.contains("active"))
                        break;
                    else
                        count++;
                }
                return count;
            }
            const getCateId = () => {
                const queryString = window.location.search;
                const urlParams = new URLSearchParams(queryString);
                return urlParams.get("cateId");
            }
            const formatVND = (currency) => {
                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(currency);
            }
            const removeActiveClass = () => {
                document.querySelectorAll(".page-item.active").forEach(i => {
                    i.classList.remove("active")
                })
            }
            const renderData = (productData) => {
                parrentElement.innerHTML = ""
                let mainImgUrl = ""

                productData.forEach(i => {
                    i.imgList.forEach(img => {
                        if (img.isMainImg)
                            mainImgUrl = img.url;
                    });
                    parrentElement.innerHTML +=
                            '<div class="product__item col-lg-3 col-md-4 col-sm-6">' +
                            '<a href="productDetail.do?id=' + i.productId + '">' +
                            '<img class="img-fluid" src="' + mainImgUrl + '" alt="">' +
                            '</a>' +
                            '<a href="productDetail.do?id=' + i.productId + '">' + i.name + '</a><br>' +
                            '<span>' + formatVND(i.price) + '</span>' +
                            '</div>'
                })
            }
            const sortAjax = (id, el) => {
                document.querySelector(".btn.btn-primary.dropdown-toggle").innerHTML = el.innerHTML;
                $.ajax("/ProjectGroup6/GetProductAjax", {
                    data: {
                        option: id,
                        cateID: getCateId(),
                        pageNum: getPageNumber(),
                    },
                    success: function (data) {
                        renderData(data)
                    }
                })
            }
            const pagingAjax = (el, event) => {
//                event.preventDefault();
                let currentPageNum = getPageNumber();
                removeActiveClass()
                if(el.innerHTML === "Trước"){
                    if(currentPageNum == "1"){
                         event.preventDefault();
                         event.stopPropagation();
                    }else{
                        currentPageNum--;
                        pageElements[currentPageNum].classList.add("active")
                    }
                }else {
                    if(el.innerHTML === "Sau"){
                        if(currentPageNum == pageElements.length){
                            event.preventDefault();
                            event.stopPropagation();
                        }else {
                            
                            currentPageNum++;
                            pageElements[currentPageNum].classList.add("active")
                        }
                    }
                }
                
                
                 $.ajax("/ProjectGroup6/GetProductAjax", {
                    data: {
                        cateID: getCateId(),
                        pageNum: currentPageNum,
                    },
                    success: function (data) {
                        renderData(data)
                    }
                })
            }
        </script>
    </body>
</html>
