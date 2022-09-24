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
        <meta name="google-signin-client_id" content="361981052480-qtmvc9p7svp7ntdd7jcgd4goqu76gt72.apps.googleusercontent.com">
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
        span{
            font-size: 20px;          
        }
    </style>
    <body>
        <!-- container -->
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card my-5">
                        <div class="text-center">
                            <img                                   
                                class="rounded-circle logo_login"
                                src="<c:url value="/images/FBT.jpg"/>"
                                alt="Logo"
                                />
                        </div>

                        <div class="text-center">
                            <span>Login by FPT Email</span>
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid &redirect_uri=http://localhost:8084/ProjectGroup6/user/googleLoginHandle.do&response_type=code
                               &client_id=361981052480-8ke1bdjjdl3alh1o3f2mrm4osm4uo8bk.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
                            <c:if test="${sessionScope.errorLoginMessage != null}">
                                <p style="padding-top: 20px;color:blue">${sessionScope.errorLoginMessage}</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://accounts.google.com/gsi/client" async defer></script>
        <script src="https://apis.google.com/js/api.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script type="text/javascript">
            function onSignIn(googleUser) {
                var profile = googleUser.getBasicProfile();
                alert(profile)
                console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
                console.log('Name: ' + profile.getName());
                console.log('Image URL: ' + profile.getImageUrl());
                console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
            }
        </script>
    </body>
</html>
