<%-- 
    Document   : login
    Created on : Sep 14, 2022, 3:20:01 AM
    Author     : ADmin
--%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <style>
        .logo_login{
            width: 350px;
            height:350px; 
            margin-bottom: 70px
        }
        .logo_google{
            width: 25px; 
            padding-bottom: 3px;           
        }
        .btn_login{
            margin-left: 10px;          
        }
        .text_1{
            font-size: 20px;          
        }
    </style>
    <body>
        <!-- container -->
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card my-5">
                        <form class="card-body cardbody-color p-lg-5">
                            <div class="text-center">
                                <img                                   
                                    class="rounded-circle logo_login"
                                    src="<c:url value="/images/FBT.jpg"/>"
                                    alt="Logo"
                                    />
                            </div>

                            <div class="text-center">
                                <span class="text_1">Login by FPT Email</span>
                                <button class="btn_login">
                                    <a href="<c:url value="/home/main.do"/>">

                                        <img class="logo_google"                                           
                                             src="<c:url value="/images/icon_google.png"/>"
                                             alt=""

                                             />
                                        Google
                                    </a>  
                                </button>
                            </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
