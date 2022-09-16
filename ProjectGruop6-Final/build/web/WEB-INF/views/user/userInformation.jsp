<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

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
            
            .form__title {
                font-size: 18px;
                line-height: 50px;
            }

            .form input {
                width: 80%;
                margin-bottom: 20px;
                height: 40px;
                font-size: 18px;
            }

            .form .gender {
                width: 50%;
                font-size: 20px;
            }

            .form__img img {
                height: 200px;
                width: 200px;
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
                <p>Quản lý thông tin hồ sơ đẻ bảo mật tài khoản</p>
                <div class="form row">            
                    <div class="form__title col-lg-2 col-md-2 col-sm-2">
                        <label>Tên đăng nhập</label>
                        <label>Username</label><br>
                        <label>Email</label><br>
                        <label>Số điện thoại</label>
                        <label>Giới tính</label><br>
                        <label>Ngày sinh</label>
                    </div>
                    <form class="col-lg-6 col-md-6 col-sm-6">                       
                        <input type="text"  placeholder="Tên đăng nhập" disabled><br>                        
                        <input type="text"  placeholder="Username" disabled><br>                        
                        <input type="text"  placeholder="Email" disabled><br>                        
                        <input type="text"  placeholder="Số điện thoại" value="0912345678"><br>
                        <div class="gender d-flex justify-content-start pl-0">
                            <input type="radio" name="gender" value="female" checked disabled/> Nam
                            <input type="radio" name="gender" value="male" disabled/> Nữ
                        </div>
                        
                        <input type="date"  placeholder="birthday" disabled><br>
                    </form>
                    <div class="form__img col-lg-4 col-md-4 col-sm-4">
                        <img class="img-fluid rounded-circle" src="<c:url value="/images/690x400.png"/>" alt="">
                    </div>   
                    <button class="btn btn-primary" type="submit" onclick="window.location.href = '<c:url value="/user/userInformation.do"/>'">Lưu</button>
                </div>
            </div>
        </div>





    </body>
</html>
