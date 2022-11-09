<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="../css/main.css" rel="stylesheet" type="text/css"/>
        <style>
            .button-22 {
                /* display: inline-block; */
                align-items: center;
                appearance: button;
                background-color: #0276FF;
                border-radius: 8px;
                border-style: none;
                box-shadow: rgba(255, 255, 255, 0.26) 0 1px 2px inset;
                box-sizing: border-box;
                color: #fff;
                cursor: pointer;
                display: flex;
                flex-direction: row;
                flex-shrink: 0;
                font-family: "RM Neue", sans-serif;
                font-size: 1;
                /* line-height: 1.15; */
                /* padding: 10px 21px; */
                text-align: center;
                text-transform: none;
                transition: color .13s ease-in-out, background .13s ease-in-out, opacity .13s ease-in-out, box-shadow .13s ease-in-out;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                max-width: 85px;
                /* height: 20px; */
                margin: 5px;
            }

            .button-22:active {
                background-color: #006AE8;
            }

            .button-22:hover {
                background-color: #1C84FF;
            }

            .font-bold {
                font-weight: 500;
            }

            .product-img {
                width: 100px;
                height: 100px;
                padding: 0;
                margin: 0;
            }

            .product-img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .style-product-cart {
                display: flex;
                align-items: center;

            }

            .product-content {
                font-weight: 500;
            }

            .product-content a {
                font-weight: 400;
                text-decoration: none;
                color: rgb(17, 16, 16);
            }

            .product-content:hover a {
                color: #308DFC;
            }

            .txt-style {
                padding: 0 0 8px 8px;
            }

            .title-style {
                font-weight: bold;
                padding: 8px
            }
            i {
                font-size: 15px;
                width: 16px;
                margin-right: 12px; 
                padding: 6px;
            }
            .info_user p {
                margin-bottom: 2px;
            }

            .br-form {
                background: #F1F9FF;
                padding: 10px;
                border-radius: 3px;
                margin-bottom: 20px;
            }

            .br-od{
                padding-bottom: 20px;
                margin-top: 15px;
                border-bottom: 1.5px solid rgba(0,0,0,.09);
            }
            .fa-star {
                margin:0px ;
                font-size: 15px;
                width: 30px;
                color: RGB(51, 79, 108);
                cursor: pointer;
            }
        </style>
    </head>

    <body>
        <div class="container ">
            <h4 class="title_header">Thông tin đơn hàng</h4>
            <div class="row">
                <!--                <div class="col-md-3">
                                    <h6 class="d-flex justify-content-between">Thông tin khách hàng
                                        <a href="<c:url value="/user/userInformation.do"/>">Thay đổi</a>
                                    </h6>
                                    <div class="info_user">
                                        <div class="d-flex">
                                            <i class="fa-regular fa-user"></i>
                                            <p>${user.firstName} ${user.lastName}</p>
                                        </div>
                                        <div class="d-flex">
                                            <i class="fa-regular fa-envelope"></i>
                                            <p>${user.email}</p>
                                        </div>
                                        <div class="d-flex">
                                            <i class="fa-solid fa-mobile-screen-button"></i>
                                            <p>${user.phone}</p>
                                        </div>
                                        <div class="d-flex"><i class="fa-regular fa-address-book"></i><p>${user.address.houseNumber} -
                ${user.address.wardName} -
                ${user.address.districtName} -
                ${user.address.cityName}
            </p>
        </div>
    </div>
</div>-->
                <!-- san pham -->
                <div class="col-md-9 col-sm-9 col-xs-12">
                    <c:forEach items="${order.orderByShopList}" var="obs">
                        <c:if test="${obs.orderByShopId == osId}">
                            <div class="br-form">
                                <h6 class="d-flex">
                                    <div class="mr-auto ">
                                        <span style="margin-right: 10px;">${obs.name}</span>
                                        <a href="#">
                                            Xem shop >>
                                        </a>
                                    </div>
                                    <!--                                <div class="">
                                    <c:choose>
                                        <c:when test = "${obs.status == 0}">
                                            <div style="color: red;">
                                                Đã hủy
                                            </div>
                                        </c:when>
                                        <c:when test = "${obs.status == 1}">
                                            <div style="color: green;">
                                                Giao hàng thành công
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div style="color: red;">
                                                Đang giao hàng
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>                                    
                                <a class="" href="<c:url value="/cart/billInformation.do?os=${obs.orderByShopId}"/>">Xem chi tiết >></a>-->
                                </h6>
                                <c:forEach items="${obs.orderDetailList}" var="od">
                                    <!--<tr class="order-link" href="<c:url value="/cart/billInformation.do"/>">-->
                                    <div class="d-flex br-od justify-content-between">
                                        <div class="d-flex">
                                            <div class="product-img ">
                                                <img src="<c:url value="${od.product.getMainImage().url}"/>" alt="">
                                            </div>
                                            <div class="d-flex flex-column ">
                                                <a href="<c:url value="/home/productDetail.do?productId=${od.product.productId}"/>">
                                                    <p class="tooltip-text hinden-text">
                                                        ${od.product.name}
                                                        <!--<span>${od.product.name}</span>-->
                                                    </p></a>
                                                x${od.quantity}
                                            </div>
                                        </div>
                                        <div>
                                            <p class=" d-flex justify-content-center align-items-center text-right ml-auto ">${od.price}</p>  
                                            <c:if test="${obs.status == 1}">
                                                <div class="d-flex justify-content-center align-items-center m0-auto">
                                                    <!-- Button trigger modal -->
                                                    <button type="button" onclick="toggleModal('${od.product.name}', this, '${od.product.productId}', '${od.orderDetailId}')" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal">
                                                        Đánh giá
                                                    </button>

                                                    <!-- Modal -->
                                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="d-flex align-items-center justify-content-center">
                                                                        <i class="fa-regular fa-star"></i>
                                                                        <i class="fa-regular fa-star"></i>
                                                                        <i class="fa-regular fa-star"></i>
                                                                        <i class="fa-regular fa-star"></i>
                                                                        <i class="fa-regular fa-star"></i>
                                                                    </div>
                                                                    <textarea id="comment" class="form-control" style="width: 100%;" ></textarea>
                                                                    <div class="images"></div>
                                                                </div>
                                                                <input type="text" id="productId" hidden>
                                                                <input type="file" accept="image/*" onchange="handleFileChange(this)" hidden multiple>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" onclick="toggleFile()">Thêm ảnh</button>
                                                                    <button type="button" onclick="handleSubmit(this)" class="btn btn-primary">Gửi đánh giá</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>

                                        </div>

                                    </div>
                                </c:forEach>
                                <input type="text" hidden id="odid">
                                <p class="d-flex justify-content-end" 
                                   style="padding: 20px 10px; margin: 0; color: red; font-weight: bold;">
                                    Tổng tiền: ${obs.total}
                                </p>
                                <div class="d-flex justify-content-end">
                                    <button type="button" class="btn btn-primary">Mua lại</button>
                                    <c:if test = "${empty obs.status}">
                                        <button type="button" onclick="handleOrder()" class="btn btn-danger">Hủy</button>
                                    </c:if>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-2" style="padding-left: 0;">
                    <div class="br-form" style="padding: 0;">
                        <h6 class="title-style">Chi tiết đơn hàng: </h6>
                        <div class="info_user">
                            <div class="d-flex">
                                <i class="fa-regular fa-user"></i>
                                <p>${order.userName}</p>
                            </div>
                            <div class="d-flex">
                                <i class="fa-regular fa-envelope"></i>
                                <p>${user.email}</p>
                            </div>
                            <div class="d-flex">
                                <i class="fa-solid fa-mobile-screen-button"></i>
                                <p>${order.phone}</p>
                            </div>
                            <div class="d-flex"><i class="fa-regular fa-address-book"></i><p>${order.address.houseNumber} -
                                    ${order.address.wardName} -
                                    ${order.address.districtName} -
                                    ${order.address.cityName}
                                </p>
                            </div>
                            <div class="txt-style">
                                <i class="fa-solid fa-truck-fast"></i><span>Đơn vị vận chuyển</span><br>
                                <i class="fa-regular fa-credit-card"></i><span>Phương thức thanh toán</span><br>
                                <h6 style="color:green; text-align:center; font-weight: 700; padding-top: 5px;">Trạng thái đơn hàng
                                </h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--        <div type="button" style="margin:1%; display:block; text-align: center;">
                        <button type="button" class="btn btn-primary" onclick="window.location.href = '<c:url value="/home/main.do"/>'">Trang chủ</button>
                    </div>-->
    </body>
    <script>
//        const handleOrder = (el) => {
//            swal({
//                text: "Xác nhận hủy đơn hàng?",
//                icon: "warning",
//                buttons: true,
//                dangerMode: true,
//            })
//                    .then((willDelete) => {
//                        if (willDelete) {
//                            $.ajax("<c:url value="/order/history"/>", {
//                                data: {
//                                    obsId: obsId,
//                                    func: "cancel",
//                                },
//                                success: function (data, textStatus, jqXHR) {
//                                    swal("Đã xóa thành công", {
//                                        icon: "success",
//                                    });
//                                    const tableRow = el.parentElement.parentElement
//                                    tableRow.remove()
//                                },
//                                error: function (jqXHR, textStatus, errorThrown) {
//                                    swal("Xóa thất bại!!!", {
//                                        icon: "error",
//                                    });
//                                }
//                            })
//                        }
//                    });
//        }
        function toggleFile() {
            document.querySelector("input[type=file]").click();
        }
        const imgComtainer = document.querySelector('.images');
        const productIdHiddenEl = document.querySelector("#productId");
        let index = 0;
        var stars = Array.prototype.slice.call(document.querySelectorAll(".fa-star"))
        let arr = []
        const handleStarHover = (e) => {
            stars.forEach(i => {
                i.style.color = "RGB(51, 79, 108)";
            })
            index = stars.indexOf(e.path[0]);
            for (var i = 0; i <= index; i++) {
                stars[i].style.color = "red";
            }

        }
        stars.forEach(i => {
            i.addEventListener("mouseover", handleStarHover)
            i.addEventListener("click", (e) => {
                stars.forEach(item => item.removeEventListener("mouseover", handleStarHover));
                console.log("index")
            })
        })

        function toggleModal(productName, el, productId, odid) {
            console.log(document.querySelector("#exampleModalLabel"))
            document.querySelector("#exampleModalLabel").innerHTML = productName;
            document.querySelector("#productId").value = productId;
            document.querySelector("#odid").value = odid;
            console.log(odid)
        }
        function closeModal() {
            document.querySelector(".close").click();
            imgComtainer.innerHTML = "";
        }

        $('.modal').on('hidden.bs.modal', function (e) {
            closeModal()
        })
        function handleFileChange(el) {
            const files = el.files;

            imgComtainer.innerHTML = "";
            if (files.length > 4) {
                arr = []
            } else {
//                files.forEach(i => {
//                    
//                })
                for (var index = 0; index < files.length; index++) {
                    const file = files[index];
                    arr.push(file)
                    imgComtainer.innerHTML += '<img style="width:50px;height:50px;" src="' + URL.createObjectURL(file) + '" alt="..." class="img-thumbnail">'
                }

            }

        }
        function handleSubmit(el) {
            console.log(arr)
            const rating = index + 1;
            const formData = new FormData()
            for (let i = 0; i < arr.length; i++) {
                const element = arr[i];
                formData.append("image", element)
            }
            fetch("<c:url value="/FileReviewHandle"/>?func=uploadReviewText&odid="
                    + document.querySelector("#odid").value +
                    "&rating=" + rating + "&productId=" + productIdHiddenEl.value +
                    "&comment=" + document.querySelector("#comment").value, {
                method: "GET",
            }).then(res => {
                fetch("<c:url value="/FileReviewHandle"/>?func=uploadReviewImage", {
                    method: "POST",
                    body: formData,
                }).then(res => {
                    swal("", "Đánh giá thành công", "success").then((value) => {

                    });
                })
            })


        }
    </script>
</html>