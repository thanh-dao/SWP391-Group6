<%-- 
    Document   : dashboard.jsp
    Created on : Nov 2, 2022, 5:01:58 AM
    Author     : kanek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2 style="text-align: center; ">Duyệt sản phẩm</h2>
        <ul class="nav nav-tabs registration_area" style="margin-bottom: 20px;">               
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="<c:url value="/order/stored.do?status=ar"/>">Đang bán</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="<c:url value="/order/stored.do?status=nary"/>">Đang chờ duyệt</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="<c:url value="/order/stored.do?status=nar"/>">Không được duyệt</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="<c:url value="/order/stored.do?status=ss"/>">Ngừng bán</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="<c:url value="/order/stored.do?status=oos"/>">Hết hàng</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="#">Dashboard</a>
            </li>
        </ul>
    </body>
</html>
