<%-- 
    Document   : googleLoginHandle
    Created on : Oct 18, 2022, 9:00:03 PM
    Author     : kanek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    const message = localStorage.getItem("message")
    if (message != null && message != undefined) {
//        document.querySelector(".text-center p").innerHTML = message;
        redirectUrl = localStorage.getItem("previousUrl");
        console.log(redirectUrl)
        localStorage.removeItem("message")
    }else {
        redirectUrl = '/ProjectGroup6/home/main.do'
    }
    document.location.href = redirectUrl
</script>
