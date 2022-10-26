<%-- 
    Document   : index
    Created on : Jun 7, 2022, 7:33:02 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Title</title>
        <!-- Bootstrap CSS -->
        <style>
            .discount {
                position: relative;
                margin-top: 0px;
            }

            @media screen and (max-width: 1200px) {
                div.discount {
                    display: none;
                }
            }

            .discount .left, .discount .right {
                position: absolute;
                position: fixed;
                width: 190px;
                height: 300px;
                margin-bottom: 50px;
                margin-top: 100px;
                z-index: 1;
                margin-right: 5px;
                margin-left: 5px; 
            }

            .discount .right {
                right: 0;
            }

            .discount img {
                width: 300px;

            }

            .carousel-item img {
                width: 100%;
                height: 550px;
            }

            .product .container{
                margin-top: 50px;
            }

            .product__item {
                width: 100%;
                margin-top: 30px;
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

            .top__seller .container {
                margin-top: 50px;
            }
            .intro{
                margin-top: 50px;              
            }
            .purpose{
                font-size: 14px;
                font-family: Arial, Helvetica, sans-serif;
            }
        </style>
    </head>
    <body>
        <div class="discount">
            <img class="left img-fluid" src="<c:url value="${banner.url}"/>"  onclick="window.location.href = '#'">
            <img class="right img-fluid" src="<c:url value="${banner.url}"/>" onclick="window.location.href = '#'">
        </div>

        <div class="banner">
            <div class="container">
                <div id="demo" class="carousel slide" data-ride="carousel">

                    <!-- Indicators -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                        <li data-target="#demo" data-slide-to="3"></li>
                        <li data-target="#demo" data-slide-to="4"></li>
                    </ul>

                    <!-- The slideshow -->
                    <div class="carousel-inner">
                        <div class="carousel-item  active">
                            <img class="img-fluid" src="<c:url value="/images/sach.jpg"/>" onclick="window.location.href = '<c:url value="/home/productList.do?cateId=8"/>'">
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid" src="<c:url value="/images/nuocHoa.jpg"/>" onclick="window.location.href = '<c:url value="/home/productList.do?cateId=5"/>'">
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid" src="<c:url value="/images/doGiaDung.jpg"/>" onclick="window.location.href = '<c:url value="/home/productList.do?cateId=3"/>'">
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid" src="<c:url value="/images/thucAn.jpg"/>" onclick="window.location.href = '<c:url value="/home/productList.do?cateId=1"/>'">
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid" src="<c:url value="/images/thuCung.jpg"/>"  onclick="window.location.href = '<c:url value="/home/productList.do?cateId=6"/>'">
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                </div>
            </div>
        </div>






        <div class="product">
            <div class="container">
                <h3>SẢN PHẨM BÁN CHẠY</h3>
                <div class="product__content row">
                    <c:forEach items="${bestSellers}" var="i">
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do?productId=${i.productId}"/>">
                                <img class="img-fluid" src="${i.getMainImage().url}" alt="">
                                <p>${i.name}</p>
                                <fmt:setLocale value="vi_VN"/>
                                <span><fmt:formatNumber value="${i.price}" type="currency"/></span>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="top__seller">
            <div class="container">
                <h3>SẢN PHẨM BÁN CHẠY</h3>
                <div class="product__content row">
                    <c:forEach items="${newProducts}" var="i">
                        <div class="product__item col-lg-3 col-md-4 col-sm-6">
                            <a href="<c:url value="/home/productDetail.do?productId=${i.productId}"/>">
                                <img class="img-fluid" src="${i.getMainImage().url}" alt="">
                                <p>${i.name}</p>
                                <fmt:setLocale value="vi_VN"/>
                                <span><fmt:formatNumber value="${i.price}" type="currency"/></span>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="purpose">
            <div class="container intro">
                <h4  style="font-family: Arial, Helvetica, sans-serif;">TẦM NHÌN, SỨ MỆNH VÀ GIÁ TRỊ CỐT LỖI</h4>
                <h5>Tầm nhìn</h5>
                <p>FEP định hướng trở thành nền tảng giao dịch mua sắm trực tuyến hàng đầu tại Đại Học FPT, cung cấp trải nghiệm tuyệt vời<br>trên website để thỏa mãn mọi nhu cầu của khách hàng.</p>
                <h5>Sứ mệnh</h5>
                <p>Mang lại niềm vui mua sắm, hỗ trợ việc mua bán trở nên dễ dàng hơn.</p>
                <h5>Giá trị cốt lõi</h5>
                <div id="demo" class="collapse">
                    <q>TÍN - TÂM - TRÍ - NHÂN</q>
                    <p>Chúng tôi đặt chữ TÍN lên hàng đầu, lấy chữ TÍN để đặt ra quy tắc chung cho sự hợp tác giữa chúng tôi và khách hàng.<br>FEP luôn đặt ra những chuẩn mực cao đòi hỏi phải cần chuẩn bị đầy đủ năng lực
                        thực thi, nỗ lực hết mình để đảm bảo đúng<br>và cao hơn các cam kết với khách hàng, đặc biệt là cam kết về chất lượng sản phẩm - dịch vụ.<br>
                        <br>Chúng tôi coi trọng khách hàng và luôn lấy khách hàng làm trung tâm, đặt lợi ích và mong muốn của khách hàng lên hàng đầu.<br>Nỗ lực mang đến cho khách hàng những trải nghiệm về sản phẩm – dịch vụ hoàn hảo nhất.<br>Sự hài lòng của khách hàng là thước đo thành công của chúng tôi.
                        <br><br>FEP coi sáng tạo là sức sống, là đòn bẩy phát triển, nhằm tạo ra giá trị khác biệt và bản sắc riêng trong mỗi gói sản phẩm – dịch vụ.
                        <br><br>Chúng tôi xây dựng các mối quan hệ với khách hàng bằng sự thiện chí, tình thân ái, tinh thần nhân văn.<br>Xây dựng môi trường làm việc chuyên nghiệp, năng động, sáng tạo.<br>Tạo điều kiện thu nhập cao và cơ hội phát triển công bằng cho tất cả cán bộ nhân viên.
                    </p>
                    <p>Chân thành cảm ơn sự ủng hộ và chúc các bạn có trải nghiệm mua bán tuyệt vời tại FEP!</p>
                </div>
                <a onclick="showMore(this)" style="color: #FFA500;" data-toggle="collapse" data-target="#demo">Xem thêm <i class="fa-solid fa-angle-down"></i></a>
            </div>
        </div>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </body>
    <script>
                    function showMore(el) {
                        el.innerHTML = el.innerHTML == 'Xem thêm <i class="fa-solid fa-angle-down"></i>' ? 'Thu gọn <i class="fa-solid fa-angle-up"></i>' : 'Xem thêm <i class="fa-solid fa-angle-down"></i>';
                    }
    </script>
</html>