<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông tin thanh toán</title>
        <style>
            a{text-decoration: none;}
            a:hover {color: none;text-decoration: none;}
            /* reset CSS */
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
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
                background-color: #EAF1FB;
                /* margin-top: 20px; */
                width: 100%;
                padding: 10px;
                color: white;
                text-transform: uppercase;
                font-weight: 600;
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
                opacity: 0.8;
                color: white;
                /*background: #f69679;*/
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
            <div class="d-flex justify-content-between">
                <h3 style="margin-bottom: 20px;">Địa chỉ giao hàng </h3>
                <a class="d-flex justify-content-end" href="<c:url value="/user/userInformation.do"/>">Thay đổi thông tin tài khoản >></a>
            </div>
            <div class="form-container">
                <div class="container ">
                    <div class="row form-item">
                        <div class="col-md-6">
                            <div style=" display: flex; flex-direction: column;">
                                ${order==order?"order":"cart"}
                                <div class="input-form">
                                    <label>Tên người dùng</label>
                                    <input type="text" required="true" name="userName" placeholder="Nhập tên người dùng"
                                           maxlength="30" class="input-form-item" 
                                           value="${empty order.userName ? cart.userName : order.userName}">
                                </div>
                                <div class="input-form">
                                    <label>Số điện thoại</label>
                                    <input type="text" required="true" placeholder="Nhập số điện thoại" maxlength="15"
                                           class="input-form-item" value="${empty order.phone ? cart.phone : order.phone}" name="phone">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-form">
                                <label>Tỉnh/Thành phố</label><select class="city-picker input-form-item" required="true" name="cityId"
                                                                     placeholder="Chọn Tỉnh/Thành Phố" onchange="handleCityChange(this)" >
                                </select>
                            </div>
                            <div class="input-form">
                                <label>Quận/Huyện</label><select class="district-picker" name="districtId" required="true"
                                                                 placeholder="Nhập Quận/Huyện" onchange="handleDistrictChange(this)">
                                </select>
                            </div>
                            <div class="input-form">
                                <label>Phường/Xã</label><select class="ward-picker" name="wardId" required="true" onchange="">
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-item1 input-form" style="position: relative">
                                <label>Địa chỉ chi tiết</label><br>
                                <!--k ấn enter cho nay-->
                                <textarea type="textarea" required="true" name="houseNumber"
                                          placeholder="Ví dụ: 193/14/2, đường Đỗ Văn Thi" class="input-form-item">${empty order.address.houseNumber ? cart.address.houseNumber : order.address.houseNumber}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="confirm-button" style="display: flex; justify-content: center;">
                    <button type="submit" class="btn-buy" href="<c:url value="/cart/shipInformation.do"/>">Tiếp theo</button>
                </div>
            </div>
        </form>
        <script>
            const selectCitySelector = ".city-picker";
            const selectWardSelector = ".ward-picker";
            const selectDistrictSelector = ".district-picker";
            const renderOption = (selector, arr, option) => {
                const el = document.querySelector(selector)
                el.innerHTML = "";
                let userAddress; // holds city or district or ward of user
                if (option === "city") {
                    userAddress = "${sessionScope.user.address.cityName}".normalize('NFC');
                } else if (option === "district") {
                    userAddress = "${sessionScope.user.address.districtName}".normalize('NFC');
                } else {
                    userAddress = "${sessionScope.user.address.wardName}".normalize('NFC');
                }
                let selected = ""
                for (var i = 0; i < arr.length; i++) {
                    const item = arr[i]
                    if (userAddress.normalize('NFC') == item.name.normalize('NFC') || i == 0) {
                        selected = "selected";
                    } else {
                        selected = ""
                    }
                    el.innerHTML += "<option  " + selected + " value= " + item.id + " >" + item.name + "</option>";
                }
                $(selector).select2({disabled: false})
//                                                return selected
            }

            const renderCity = () => {
                $.ajax("<c:url value="/AddressHandleAjax"/>", {
                    data: {
                        param: "city",
                    },
                    success: function (data) {
                        arr = JSON.parse(data)
                        renderOption(selectCitySelector, arr, "city", "Chọn tỉnh/thành phố")
                        return arr;
                    }
                });
            }
            const renderWardOrDistrict = (unitId, parentUnitId, unit, placeHolderMsg) => {
                $.ajax("<c:url value="/AddressHandleAjax"/>", {
                    data: {
                        param: unit,
                        [unit == "district" ? "cityId" : "districtId"]: parentUnitId
                    },
                    success: function (data) {
                        arr = JSON.parse(data)
                        renderOption(unit === "district" ? selectDistrictSelector : selectWardSelector, arr, unit, placeHolderMsg)
                    }
                });
            }
            window.onload = () => {
                $(selectCitySelector).select2()
//                            document.querySelector("#img-form").addEventListener('click', (e) => {
//                                e.preventDefault();
//                            })
                const isAddressNull = ${sessionScope.user == null ? true : sessionScope.user.address.hasIdNull()}
                if (isAddressNull) {

                    renderCity();
                } else {
                    const cityId = ${sessionScope.user == null ? 1 : sessionScope.user.address.cityId == null ? 1 : sessionScope.user.address.cityId};
                    const districtId = ${sessionScope.user == null ? 1 : sessionScope.user.address.districtId == null ? 1 : sessionScope.user.address.districtId};
                    const wardId = ${sessionScope.user == null ? 1 : sessionScope.user.address.wardId == null ? 1 : sessionScope.user.address.wardId};
                    renderCity()
                    renderWardOrDistrict(districtId, cityId, "district", "Chọn quận/huyện");
                    renderWardOrDistrict(wardId, districtId, "ward", "Chọn phường/xã");
                }
                $(selectDistrictSelector).select2({disabled: isAddressNull})
                $(selectWardSelector).select2({disabled: isAddressNull})
            };

            const handleCityChange = async (el) => {
                const cityId = el.value;

                console.log("1111" + cityId)
                const wardId = $(selectWardSelector).value
                const districtId = $(selectDistrictSelector).value
                await renderWardOrDistrict(districtId, cityId, "district", "Chọn quận/huyện");
                $(selectWardSelector).html("")
                $(selectWardSelector).select2({disabled: true, data: []})

            }

            const handleDistrictChange = async (el) => {
                const districtId = el.value;
                const wardId = $(selectWardSelector).value;
                const cityId = $(selectCitySelector).value;
                console.log(districtId)
                await renderWardOrDistrict(wardId, districtId, "ward", "Chọn phường/xã");
            }
        </script>
    </body>
</html>