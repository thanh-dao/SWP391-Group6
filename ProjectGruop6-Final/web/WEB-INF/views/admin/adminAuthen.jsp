<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--DataTables--> 
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <!-- Bootstrap CSS -->
        <style>
            body{
                background: #F0F0F0;
            }
            a{text-decoration: none;}
            .col {
                margin-bottom: 100px;
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

            td {
                word-wrap: break-word;
                max-width: 200px;
            }

            .product-img {
                width: 200px;
                height: 200px;
            }

            .search1 {
                margin-left: 80%;
                margin-bottom: 30px;
            }

            .avatar {
                height: 50px;
                width: 50px;
                border-radius: 50%;
            }

            .avatar img{
                height: 50px;
                width: 50px;
                border-radius: 50%;
            }
            .font-a a{
                color: #FFA500;
                margin: 0;
            }

            a {
                color: black;
            }

            a:hover {
                color: none;
                text-decoration: none;
                color: #FFA500;
            }

            .br-form {
                background: #FFF;
                padding: 10px;
                border-radius: 3px;
                margin-bottom: 10px;
            }
        </style>
        <title>Hello, world!</title>
    </head>

    <!--Load the AJAX API-->


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
                <li class="nav-item" onclick="setActive(this)">
                    <a href="<c:url value="/admin/productAuthen.do?status=nary"/>" class="nav-link text-white">
                        <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#grid"></use>
                        </svg>
                        Sản phẩm
                    </a>
                </li>
                <li class="nav-item" onclick="setActive(this)">
                    <a href="<c:url value="/admin/dashBroad.do"/>" class="nav-link text-white">
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
                    <a href="<c:url value="/admin/adminAuthen.do?status=user"/>" class="active nav-link text-white">
                        <svg class="bi me-2" width="16" height="16">
                        <use xlink:href="#people-circle"></use>
                        </svg>
                        Admin
                    </a>
                </li>
            </ul>
            <hr>
        </div>
        <div class="col d-flex">
            <!--            Div that will hold the pie chart-->

        </div>  
        <div class="container br-form">

            <c:choose>
                <c:when test="${not empty userList}">
                    <div class="container-fluid br-form">
                        <h3 style="text-align: center; ">Phân quyền tài khoản</h3>
                        <ul class="nav nav-tabs" style="margin-bottom: 20px;">               
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="<c:url value="/admin/adminAuthen.do?status=user"/>">User</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value="/admin/adminAuthen.do?status=subAdmin"/>">Sub admin</a>
                            </li>
                        </ul>
                        <table class="table table-striped" id="admin" style="width: 100%;">
                            <thead style="background-color: #FFEFD5;">
                                <tr id="list-header">
                                    <th class="col-4" scope="col">Email</th>
                                    <th class="col-2" scope="col">Người dùng</th>
                                    <th class="col-1" scope="col"></th>
                                    <th class="col-3" scope="col">Số điện thoại</th>
                                    <th class="col-1" scope="col">Vai trò</th>
                                    <th class="col-1" scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <jsp:include page="/WEB-INF/views/error/index.jsp"/>
                </c:otherwise>
            </c:choose>
        </div>


        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script>
                        var table;
                        var reviewList = ${userList};
                        console.log(reviewList);
                        function initTableData() {
                            var modifiedUsers = reviewList.map(u => {
                                if (u.roleId == 1) {
                                    option = "";
                                    role = 'Admin'
                                } else if (u.roleId == 2) {
                                    role = 'Sub admin';
                                    option = `<button type="button" onclick="handleAdmin('` + u.email + `', this, 'disagree')" class="btn btn-danger mb-3">Hạ chức</button>`;
                                } else {
                                    role = 'User';
                                    option = `<button type="button" onclick="handleAdmin('` + u.email + `', this, 'agree')" class="btn btn-success mb-3">Bổ nhiệm</button>`;
                                }
                                return {
                                    email: u.email,
                                    user: `<p class="font-a"><a href="#">` + u.name + `</a></p>`,
                                    avatar: u.avatar,
                                    phone: u.phone,
                                    role: role,
                                    option: option,
                                };
                            });
                            console.log(modifiedUsers);
                            table = $('#admin').DataTable({
                                "processing": true,
                                data: modifiedUsers,
                                columns: [
                                    {data: 'email'},
                                    {data: 'user'},
                                    {data: 'avatar',
                                        render: function (data) {
                                            if (data == "" || data == null) {
                                                return null;
                                            }
                                            return '<a class="avatar"><img src="' + data + '" alt="' + data + '"height="100" width="100"/></a>';
                                        }
                                    },
                                    {data: 'phone'},
                                    {data: 'role'},
                                    {data: 'option'},
                                ]});
                        }
                        const handleAdmin = (email, el, option) => {
                            if (option == 'agree') {
                                text = 'Xác nhận bổ nhiệm người dùng !!!';
                            } else if (option == 'disagree') {
                                text = 'Xác nhận hạ chức của sub admin !!!';
                            }
                            swal({
                                title: "",
                                text: text,
                                icon: "warning",
                                buttons: true,
                                dangerMode: true,
                            })
                                    .then((commit) => {
                                        if (commit) {
                                            $.ajax("<c:url value="/admin/adminAuthen.do"/>", {
                                                data: {
                                                    email: email,
                                                    func: option,
                                                },
                                                success: function (data, textStatus, jqXHR) {
                                                    swal("Thao tác thành công", {
                                                        icon: "success",
                                                    });
                                                    const tableRow = el.parentElement.parentElement
                                                    tableRow.remove()
                                                },
                                                error: function (jqXHR, textStatus, errorThrown) {
                                                    swal("Thao tác thất bại!!!", {
                                                        icon: "error",
                                                    });
                                                }
                                            })
                                        }
                                    });
                        }
                        $(document).ready(function () {
                            initTableData();
                        });
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

    </body>
</html>
