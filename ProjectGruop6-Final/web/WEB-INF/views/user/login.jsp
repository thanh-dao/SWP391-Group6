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
                                <button class="btn_login" type="button" onclick="googleLoginURL()">
                                    <img class="logo_google"                                           
                                         src="<c:url value="/images/icon_google.png"/>"
                                         alt=""

                                         />
                                    Login With Google

                                </button>
                                <p style="padding-top: 20px;color:blue">
                                    <c:if test="${sessionScope.errorLoginMessage != null}">
                                        ${sessionScope.errorLoginMessage}
                                    </c:if>
                                </p>

                            </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            
            const googleLoginURL = () => {
                const loginUrl = "https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid &redirect_uri=http://localhost:8084/ProjectGroup6/user/googleLoginHandle.do&response_type=code&client_id=361981052480-8ke1bdjjdl3alh1o3f2mrm4osm4uo8bk.apps.googleusercontent.com&approval_prompt=force";
                window.location.href = loginUrl;
            }
        </script>
    </body>
</html>
