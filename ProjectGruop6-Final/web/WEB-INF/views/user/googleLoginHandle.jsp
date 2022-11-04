<%-- 
    Document   : googleLoginHandle
    Created on : Nov 4, 2022, 7:58:37 AM
    Author     : 15tha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    let redirectUrl;
    const previousUrl = localStorage.getItem("previousUrl");
    redirectUrl = previousUrl === null ? "/ProjectGroup6/user/login.do" : previousUrl;
    localStorage.removeItem("previousUrl");
    window.location.href = redirectUrl;
</script>
