<%-- 
    Document   : shipInformation
    Created on : Sep 14, 2022, 4:14:30 AM
    Author     : ADmin
--%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông tin thanh toán</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            /* reset CSS */
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            html {
                scroll-behavior: smooth;
                font-family: Arial, Helvetica, sans-serif;
            }

            body {
                background: rgb(245, 245, 250);
                /*    overflow: hidden;*/
            }

            .br-form {
                height: auto;
                padding: 0;
                /* padding-bottom: 3%; */
                background: #F0F0F0;
                border-radius: 5px;
            }

            .form-container {
                font-family: Verdana, Geneva, Tahoma, sans-serif;
            }

            .form-item label {
                width: 40%;
                font-weight: 500;
                font-size: 16px;
            }

            .form-item1 label {
                width: 23.5%;
                font-weight: 500;
                font-size: 16px;
            }

            .input-form-item {
                margin-left: 10px;
            }

            .form-item input {
                padding: 7px 12px;
                width: 60%;
                border-radius: 10px;
                border: 1px solid aqua;
                font-size: 16px;
            }

            .form-item textarea {
                padding: 7px 12px;
                width: 100%;
                border-radius: 10px;
                border: 1px solid aqua;
                font-size: 16px;
            }

            .form-item {
                display: flex;
            }

            .form-item input:hover,
            .form-item textarea:hover {
                border: 1px solid;
            }

            .confirm-button {
                display: flex;
                justify-content: space-between;
            }

            .confirm-button button {
                width: 256px;
                padding: 10px 0;
                font-size: 13px;
            }

            .confirm-button .cancle {
                background: white;
                border-color: rgb(225, 225, 225);
            }

            .confirm-button .create {
                background: rgb(0, 182, 240);
                border-color: rgb(225, 225, 225);
                color: whitesmoke;
            }

            .btn-buy {
                background-color: aqua;
                /* margin-top: 20px; */
                width: 100%;
                padding: 10px;
                color: white;
                text-transform: uppercase;
                font-weight: 600;
                box-shadow: rgb(0 0 0 / 17%) 0px -23px 25px 0px inset, rgb(0 0 0 / 15%) 0px -36px 30px 0px inset, rgb(0 0 0 / 10%) 0px -79px 40px 0px inset, rgb(0 0 0 / 6%) 0px 2px 1px, rgb(0 0 0 / 9%) 0px 4px 2px;
                border-radius: 50px;
            }

            .btn-buy::after {
                position: relative;
                content: "\276f";
                padding: 0.5em;
                right: 0;
                transition: 0.5s;
            }

            .btn-buy:hover {
                background: #f69679;
            }

            .btn-buy:hover::after {
                right: -10px;
                transition: 0.15s linear;
            }

            .item-center {
                display: flex;
                height: 200px;
                align-items: center;
            }

            .input-form {
                display: flex;
                padding: 10px;
            }

            .font-bold {
                font-weight: 900;
            }
        </style>
    </head>

    <body>
        <form class="container br-form" style="padding:20px">
            <h3 style="margin-bottom: 20px;">Địa chỉ giao hàng</h3>

            <div class="form-container">
                <div class="container ">
                    <div class="row form-item">
                        <div class="col-md-6">
                            <div style=" display: flex;
                                 flex-direction: column;">
                                <div class="input-form">
                                    <label>Tên người dùng</label>
                                    <input type="text" required="true" name="firstName" placeholder="Nhập tên người dùng"
                                           maxlength="50" class="input-form-item">
                                </div>
                                <div class="input-form">
                                    <label>Số điện thoại</label>
                                    <input type="text" required="true" placeholder="Nhập số điện thoại" maxlength="50"
                                           class="input-form-item">
                                </div>
                                <div class="input-form">
                                    <label>Ngày/Tháng/Năm Sinh</label>
                                    <input required="true" type="date" maxlength="50" class="input-form-item">
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="input-form">
                                <label>Tỉnh/Thành phố</label>
                                <input required="true" type="text" maxlength="50" class="input-form-item" required="true"
                                       type="text" placeholder="Chọn Tỉnh/Thành Phố">
                            </div>
                            <div class="input-form">
                                <label>Quận/Huyện</label>
                                <input required="true" type="text" maxlength="50" class="input-form-item" required="true"
                                       type="text" placeholder="Nhập Quận/Huyện">
                            </div>
                            <div class="input-form">
                                <label>Phường/Xã</label>
                                <input required="true" type="text" maxlength="50" class="input-form-item" required="true"
                                       type="text" placeholder="Nhập Phường/Xã">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-item1 input-form" style="position: relative">
                                <label>Địa chỉ chi tiết</label><br>
                                <textarea type="textarea" required="true" name="address"
                                          placeholder="Ví dụ: 193/14/2, đường Đỗ Văn Thi" class="input-form-item"></textarea>
                            </div>
                            <div class="form-item1 input-form" style="position: relative">
                                <label style="top: 0;">Điều cần lưu ý</label>
                                <textarea type="textarea" required="true" name="address"
                                          placeholder="Ví dụ: Khách hàng có thể nhận hàng vào buổi sáng"
                                          class="input-form-item"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="confirm-button" style="display: flex; justify-content: center;">
                    <button class="btn-buy" onclick="window.location.href = '<c:url value="/cart/cart.do"/>'">Tiếp theo</button>
                </div>
            </div>
        </form>
    </body>

</html>