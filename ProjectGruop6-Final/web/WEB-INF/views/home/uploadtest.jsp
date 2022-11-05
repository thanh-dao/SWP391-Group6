<%-- 
    Document   : uploadtest
    Created on : Nov 4, 2022, 11:30:55 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="POST" enctype="multipart/form-data" class="product-form">
            <div class="row ">
                <div class="col-lg-2 col-md-2 col-sm-2 box-img">
                    <input id="img1" name="img1" class="input-image" type="file" accept="image/*">
                    <!--<img src="../images/plus.png" alt=""/>-->
                    <a>Thêm ảnh</a>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 box-img"">
                    <input id="img2" name="img2" class="input-image" type="file"  accept="image/*">
                    <img src="../images/plus.png" alt=""/>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 box-img"">
                    <input id="img2" name="img3" class="input-image" type="file"  accept="image/*">
                    <img src="../images/plus.png" alt=""/>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 box-img"">
                    <input id="img2" name="img4" class="input-image" type="file"  accept="image/*">
                    <img src="../images/plus.png" alt=""/>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-2 box-img"">
                    <input id="img2" name="img5" class="input-image" type="file"  accept="image/*">
                    <img src="../images/plus.png" alt=""/>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <input id="img0" name="img0" class="input-image" type="file" accept="image/*">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">Tên sản Phẩm</span>
                    </div>
                    <input type="text" class="form-control product-name" name="name"
                           placeholder="Tên sản Phẩm" aria-label="Tên sản Phẩm" aria-describedby="basic-addon1">
                </div>
                <div class="input-group mb-3 mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Giá sản phẩm</span>
                    </div>
                    <input type="text" id="formattedMoneyField" name="price"
                           class="form-control" aria-label="Amount (to the nearest dollar)">
                    <div class="input-group-append">
                        <span class="input-group-text">₫</span>
                    </div>
                </div>
                <div class="input-group mb-3 mt-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Số lượng sản phẩm</span>
                    </div>
                    <input type="text"id="formattedNumberField" name="quantity"
                           class="form-control" aria-label="Amount (to the nearest dollar)">
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 d-flex justify-content-end">
                <!--<input type="submit" value="ADD"/>-->
                <button type="submit" formaction="/ProjectGroup6/create" action ="uploadtest" >GO</button>
            </div>
        </form>
    </body>
</html>
