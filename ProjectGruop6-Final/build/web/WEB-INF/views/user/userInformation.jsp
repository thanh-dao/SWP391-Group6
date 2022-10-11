<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Bootstrap CSS -->


        <style>
            .link {
                margin-bottom: 30px;
            }

            .link a {
                font-size: 18px;
            }

            .user__information {
                height: 800px;
            }

            .form-item label {
                width: 40%;
                font-weight: 500;
                font-size: 16px;
            }

            .input-form {
                display: flex;
                padding: 10px;
            }

            .input-form-item {
                margin-left: 10px;
            }

            .form-item input {
                padding: 7px 12px;
                width: 60%;
                border-radius: 10px;
                border: 1px solid #FFA500;
                font-size: 16px;
            }

            .form-item textarea {
                padding: 7px 12px;
                width: 100%;
                border-radius: 10px;
                border: 1px solid #FFA500;
                font-size: 16px;
            }

            .form-item {
                /*display: flex;*/
            }

            .form-item input:hover,
            .form-item textarea:hover {
                border: 1px solid;
            }

            .form__img img {
                height: 200px;
                width: 200px;
            }

            .form-item1 label {
                width: 23%;
                font-weight: 500;
                font-size: 16px;
            }
            a {
                color: #FFA500;
                text-decoration: none;
            }

            a:hover {
                color: #4D8FFF;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="user__information">
            <div class="container">
                <div class="link">
                    <a href="<c:url value="/home/main.do"/>">Trang chủ</a> >>
                    <a href="<c:url value="/user/userInformation.do"/>">User name</a> 
                </div>

                <h1>Hồ sơ của tôi</h1>
                <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>
                <form action="updateInformation.do">
                    <div class="row">  
                        <div class="form-item col-lg-9 col-md-9 col-sm-9">

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="input-form">
                                        <label>Email</label>
                                        <input type="text" class="input-form-item" name="email" value="${sessionScope.user.email == null ? "": sessionScope.user.email}">
                                    </div>
                                    <div class="input-form">
                                        <label>Tên</label>
                                        <input type="text" required="true" placeholder="Nhập tên người dùng"
                                               maxlength="50" class="input-form-item"  name="firstName"  value="${sessionScope.user.firstName == null ? "": sessionScope.user.firstName}">
                                    </div>
                                    <div class="input-form">
                                        <label>Họ</label>
                                        <input type="text" required="true" placeholder="Nhập họ người dùng"
                                               maxlength="50" class="input-form-item"  name="lastName"  value="${sessionScope.user.lastName == null ? "": sessionScope.user.lastName}">
                                    </div>
                                    <div class="input-form">
                                        <label>Số điện thoại</label>
                                        <input type="text" required="true" placeholder="Nhập số điện thoại" maxlength="50"
                                               class="input-form-item" name="phone" value="${sessionScope.user.phone == null ? "": sessionScope.user.phone }" >
                                    </div>
                                    <div class="input-form">
                                        <label>Ngày/Tháng/Năm Sinh</label>
                                        <input required="true" type="date" maxlength="50" class="input-form-item" name="yob" value="${sessionScope.user.yob == null ? "": sessionScope.user.yob}">
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="input-form">
                                        <label>Tỉnh/Thành phố</label>
                                        <input required="true" type="text" maxlength="50" class="input-form-item" required="true"
                                               type="text" placeholder="Chọn Tỉnh/Thành Phố" name="cityName" value="${sessionScope.user.address.cityName == null ? "" : sessionScope.user.address.city}">
                                    </div>
                                    <div class="input-form">
                                        <label>Quận/Huyện</label>
                                        <input required="true" type="text" maxlength="50" class="input-form-item" required="true"
                                               type="text" placeholder="Nhập Quận/Huyện" name="districtName" value="${sessionScope.user.address.districtName == null ? "" : sessionScope.user.address.districtName}">
                                    </div>
                                    <div class="input-form">
                                        <label>Phường/Xã</label>
                                        <input required="true" type="text" maxlength="50" class="input-form-item" required="true"
                                               type="text" placeholder="Nhập Phường/Xã" name="wardName" value="${sessionScope.user.address.wardName == null ? "" : sessionScope.user.address.wardName}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-item1 input-form" style="position: relative">
                                <label>Địa chỉ chi tiết</label><br>
                                <textarea type="textarea" required="true" name="houseNumber"
                                          placeholder="Ví dụ: 193/14/2, đường Đỗ Văn Thi" class="input-form-item" value="${sessionScope.user.address.houseNumber == null ? "" : sessionScope.user.address.houseNumber}"></textarea>
                            </div>
                        </div>
                        <div class="form__img col-lg-3 col-md-3 col-sm-3">
                            <img class="img-fluid rounded-circle" src="<c:url value="${sessionScope.user.avatarLink}"/>" alt="" name="avatarLink">
                        </div>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <button class="btn btn-primary" style="text-align: center;" type="submit">Cập nhật</button>
                    </div>
                </form>
            </div>
        </div>





    </body>
</html>
