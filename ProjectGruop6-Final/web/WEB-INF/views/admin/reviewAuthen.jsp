<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reviews</title>
        <style>
            a{text-decoration: none;}
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
            td {
                word-wrap: break-word;
                max-width: 200px;
            }
            .img-container {
                max-width: 350px !important;
            }
            .img-container>div {
                min-width: 300px;
                max-width: 90%;
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: space-around;
            }
            .product-img-review {
                width: 80px;
                height: 80px;
                padding-bottom: 10px;
                padding-right: 10px;
            }
            .product-img-review-active {
                margin-bottom: 10px;
                width: 100%;
                height: auto;
                max-height: 150px;
            }
            .search1 {
                margin-left: 80%;
                margin-bottom: 30px;
            }

            .font-a a{
                color: #FFA500;
                /*text-decoration: none;*/
            }

            .hinden-text {
                margin: 0;
                font-size: 16px;
                padding: 3px;
                width: 100%;
                overflow: hidden;
                white-space: nowrap; 
                text-overflow: ellipsis;
            }

            .tooltip-text {
                text-decoration:none;
                position:relative;
            }
            .tooltip-text span {
                display:none;
            }
            .tooltip-text:hover span {
                border-radius: 3px;
                font-size: 16px;
                padding: 1px 5px;
                display: block;
                position:fixed;
                overflow:hidden;
                background-color: #35363A;
                color: #CCC;
                z-index: 1000;
                white-space: nowrap;
            }

            a {
                color: black;
            }

            a:hover {
                color: none;
                text-decoration: none;
                color: #FFA500;
            }
        </style>
    </head>

    <body>
        <ul class="nav nav-tabs ">               
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="<c:url value="/admin/reviewAuthen.do?status=nary"/>">Chờ duyệt</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/admin/reviewAuthen.do?status=ar"/>">Đã duyệt</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/admin/reviewAuthen.do?status=nar"/>">Không được duyệt</a>
            </li>
        </ul>
        <c:choose>
            <c:when test="${not empty reviewList}">
                <div class="container-fluid">
                    <table class="table table-striped" id="review" style="width: 100%;">
                        <thead style="background-color: #FFEFD5;">
                            <tr id="list-header">
                                <th class="col-2" scope="col">Ngày đăng</th>
                                <th class="col-2" scope="col">Người đăng</th>
                                <th class="col-3" scope="col">Sản phẩm</th>
                                <th class="col-5" scope="col">Đánh giá</th>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <h3 style="text-align: center; margin: 50px; ">Hiện không có review nào chờ duyệt</h3>
            </c:otherwise>
        </c:choose>
        <script>
            var table;
            var reviewList = ${reviewList};
            console.log(reviewList);

            function initTableData() {
                var modifiedUsers = reviewList.map(r => {
                    var option = `<button type="button" onclick="handleReview(` + r.reviewId + `, this, 'agree')" class="btn btn-success mb-3">Chấp nhận</button>
                                <button type="button" onclick="handleReview(` + r.reviewId + `, this, 'disagree')" class="btn btn-danger mb-3">Từ chối</button>`;
                    if (String('${status}') == 'nar') {
                        option = `<button type="button" onclick="handleReview(` + r.reviewId + `, this, 'agree')" class="btn btn-success mb-3">Chấp nhận</button>`;
                    } else if (String('${status}') == 'ar') {
                        option = `<button type="button" onclick="handleReview(` + r.reviewId + `, this, 'disagree')" class="btn btn-danger mb-3">Xóa</button>`;
                    }
                    return {
                        date: r.date,
                        seller:
                                `<p class="font-a"><a href="#">` + r.nameUser + `</a></p>`,
                        product: `<a href="/ProjectGroup6/home/productDetail.do?productId=` + r.productId + `"> 
                                <p class="tooltip-text hinden-text">` + r.productName + `<span>` + r.productName + `</span></p>`,
                        review: `<p class="font-a" style="border-bottom: 1.5px solid rgba(0,0,0,.09);">Rating: ` + r.rating + `</p>` + r.comment,
                        image1: r.image0,
                        image2: r.image1,
                        image3: r.image2,
                        image4: r.image3,
                        image5: r.image4,
                        option: option,
                    };
                });
                console.log(modifiedUsers);
                table = $('#review').DataTable({
                    "processing": true,
                    data: modifiedUsers,
                    columns: [
                        {data: 'date'},
                        {data: 'seller'},
                        {data: 'product'},
                        {data: 'review'},
                        {
                            data: 'image1',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="100" width="100"/>';
                            }
                        }, {
                            data: 'image2',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="100" width="100"/>';
                            }
                        }, {
                            data: 'image3',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="100" width="100"/>';
                            }
                        }, {
                            data: 'image4',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="100" width="100"/>';
                            }
                        }, {
                            data: 'image5',
                            render: function (data) {
                                if (data == "" || data == null) {
                                    return null;
                                }
                                return '<img src="' + data + '" alt="' + data + '"height="100" width="100"/>';
                            }
                        },
                        {data: 'option'},
                    ]
                });
            }
            const handleReview = (rId, el, option) => {
                swal({
                    title: "",
                    text: "Bạn có muốn xóa sản phẩm này?",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((commit) => {
                            if (commit) {
                                $.ajax("<c:url value="/admin/reviewAuthen.do"/>", {
                                    data: {
                                        reviewId: rId,
                                        func: option,
                                    },
                                    success: function (data, textStatus, jqXHR) {
                                        swal("Duyệt thành công", {
                                            icon: "success",
                                        });
                                        const tableRow = el.parentElement.parentElement
                                        tableRow.remove()
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        swal("Duyệt thất bại!!!", {
                                            icon: "error",
                                        });
                                    }
                                })
                            }
                        });
            }
//            const pageSwitching = (option) => {
//            console.log(option);
//                $.ajax("<c:url value="/admin/reviewAuthen.do"/>", {
//                    data: {
//                        status: option
//                    }
//                })
//            }
            $(document).ready(function () {
                initTableData();
                //                $("#btnReloadData").on("click", function () {
                //                    //alert("reload data...")
                //                    table.ajax.reload();
                //                });
            });
            const tooltips = document.querySelectorAll('.tooltip-text span');
            window.onmousemove = function (e) {
                var x = (e.clientX + 20) + 'px',
                        y = (e.clientY + 20) + 'px';
                for (var i = 0; i < tooltips.length; i++) {
                    tooltips[i].style.top = y;
                    tooltips[i].style.left = x;
                }
            };
            const tabs = document.querySelectorAll(".nav-link")
            // console.log(tabs)
            const removeActiveClass = (elements) => {
                elements.forEach(i => {
                    i.classList.remove("active")
                })
            }
            tabs.forEach(i => {
                i.addEventListener("click", () => {
                    removeActiveClass(tabs);
                    i.classList.add("active");
                })
            });
        </script>
    </body>

</html>