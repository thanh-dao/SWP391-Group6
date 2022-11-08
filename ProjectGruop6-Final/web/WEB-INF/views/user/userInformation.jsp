<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
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

            .form-item label {
                width: 40%;
                font-weight: 500;
                font-size: 16px;
            }

            .input-form {
                display: flex;
                padding: 10px;
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
                /*display: flex;*/
            }

            .form-item input:hover,
            .form-item textarea:hover {
                border: 1px solid;
            }

            .form__img img {
                height: 200px;
                width: 200px;
            }

            .form-item1 label {
                width: 23%;
                font-weight: 500;
                font-size: 16px;
            }

            a {
                color: #FFA500;
                text-decoration: none;
            }

            a:hover {
                color: #4D8FFF;
                text-decoration: none;
            }

            #image-label {
                cursor: pointer;
            }


            .product .container {
                margin-top: 50px;
            }

            .product__item {
                width: 100%;
                transition: 0.5s;
            }

            .product__item a {
                color: black;
                font-size: 18px;
            }

            .product__item img {
                transition: 0.5s;
            }

            .product__item img:hover {
                transform: translateY(-5px);
                transition: 0.5s;
            }

            .product__item a:hover {
                color: blue;
                text-decoration: none;
            }

            .product__item img {
                height: 230px;
            }

            .product__item span {
                font-size: 20px;
                color: red;
            }

            .next {
                margin-top: 50px;
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.user == null}">
            <script>
                localStorage.setItem('previousUrl', window.location.href);
                window.location.href = '/ProjectGroup6/user/login.do'
                localStorage.setItem('message', 'Please login to use this feature');
            </script>
        </c:if>

        <!--thong tin user-->
        <div>
            <div class="user__information">
                <div class="container">

                    <h1>Hồ sơ của tôi</h1>
                    <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>

                    <div class="row">
                        <div class="form__img col-lg-3 col-md-3 col-sm-3">
                            <form id="img-form" method="POST" enctype='multipart/form-data'
                                  action="<c:url value=" /FileHandle" />">
                                <input type="file" accept="image/*" onchange='previewImage(this)' id="hidden-img"
                                       hidden name="file">
                                <label id='image-label'>
                                    <img class="img-fluid rounded-circle" id='img'
                                         src="${sessionScope.user.avatarLink}" alt="">
                                </label>
                                <input type="text" name='func' value="uploadAva" hidden>
                            </form>
                        </div>
                        <form action="updateInformation.do" id="text-form">
                            <div class="form-item col-lg-9 col-md-9 col-sm-9">

                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="input-form">
                                            <label>Email</label>
                                            <input type="text" class="input-form-item"
                                                   value="${sessionScope.user.email == null ? "": sessionScope.user.email}">
                                        </div>
                                        <div class="input-form">
                                            <label>Tên</label>
                                            <input type="text" required="true" placeholder="Nhập tên người dùng"
                                                   maxlength="50" class="input-form-item" name="firstName"
                                                   value="${sessionScope.user.firstName == null ? "": sessionScope.user.firstName}">
                                        </div>
                                        <div class="input-form">
                                            <label>Họ</label>
                                            <input type="text" required="true" placeholder="Nhập họ người dùng"
                                                   maxlength="50" class="input-form-item" name="lastName"
                                                   value="${sessionScope.user.lastName == null ? "": sessionScope.user.lastName}">
                                        </div>
                                        <div class="input-form">
                                            <label>Số điện thoại</label>
                                            <input type="text" required="true" placeholder="Nhập số điện thoại"
                                                   maxlength="50" class="input-form-item" name="phone"
                                                   value="${sessionScope.user.phone == null ? "": sessionScope.user.phone }">
                                        </div>
                                        <div class="input-form">
                                            <label>Ngày/Tháng/Năm Sinh</label>
                                            <input required="true" type="date" maxlength="50"
                                                   class="input-form-item" name="yob"
                                                   value="${sessionScope.user.yob}">

                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="input-form">
                                            <label>Tỉnh/Thành phố</label>

                                            <select class="city-picker" onchange="handleCityChange(this)"
                                                    name="cityId">
                                            </select>
                                        </div>
                                        <div class="input-form">
                                            <label>Quận/Huyện</label>
                                            <select class="district-picker"
                                                    onchange="handleDistrictChange(this)" name="districtId">
                                            </select>

                                        </div>
                                        <div class="input-form">
                                            <label>Phường/Xã</label>
                                            <select class="ward-picker" onchange="" name="wardId">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-item1 input-form" style="position: relative">
                                    <label>Địa chỉ chi tiết</label><br>
                                    <textarea type="textarea" required="true" name="houseNumber"
                                              placeholder="Ví dụ: 193/14/2, đường Đỗ Văn Thi"
                                              class="input-form-item">${sessionScope.user.address.houseNumber == null ? "" : sessionScope.user.address.houseNumber}</textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <button class="btn btn-primary" onclick="submit()" style="text-align: center;"
                                type="button">Cập nhật</button>
                    </div>
                </div>
            </div>
        </div>


        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
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
                                //                return selected 
                            }

                            const renderCity = () => {
                                console.log(1)
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
                                const isAddressNull = ${ sessionScope.user == null ? true : sessionScope.user.address.hasIdNull()}
                                renderCity()
                                if (!isAddressNull) {
                                    const cityId = ${ sessionScope.user == null ? 1 : sessionScope.user.address.cityId == null ? 1 : sessionScope.user.address.cityId };
                                    const districtId = ${ sessionScope.user == null ? 1 : sessionScope.user.address.districtId == null ? 1 : sessionScope.user.address.districtId };
                                    const wardId = ${ sessionScope.user == null ? 1 : sessionScope.user.address.wardId == null ? 1 : sessionScope.user.address.wardId};
                                    renderWardOrDistrict(districtId, cityId, "district", "Chọn quận/huyện");
                                    renderWardOrDistrict(wardId, districtId, "ward", "Chọn phường/xã");
                                }
                                $(selectDistrictSelector).select2({disabled: isAddressNull})
                                $(selectWardSelector).select2({disabled: isAddressNull})

                            };

                            const handleCityChange = async (el) => {
                                const cityId = el.value;
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


                            const submit = () => {
                                const formData = new FormData();
                                formData.append("image", document.querySelector("#hidden-img").files[0])

                                let isEmpty = false;
                                document.querySelectorAll("#text-form input").forEach(i => {
                                    if (i.value === "") {
                                        isEmpty = true;
                                    }
                                })
                                document.querySelectorAll("select").forEach(i => {
                                    if (i.value === "") {
                                        isEmpty = true;
                                    }
                                })
                                fetch('<c:url value="/FileUserHandle"/>', {
                                    method: "POST",
                                    body: formData,
                                })
                                if (isEmpty) {
                                    swal("Oops", "Bạn phải điền vào tất cả các ô trống", "error")
                                } else {
                                    $("#text-form").submit();

                                    setTimeout(alert("Done", "success"), 10000);
                                }

                            }
                            document.querySelector("#image-label").addEventListener("click", (e) => {
                                document.querySelector("#hidden-img").click()
                            })
                            const previewImage = (el) => {
                                const reader = new FileReader();
                                console.log(el.files)
                                document.querySelector("#img").src = URL.createObjectURL(el.files[0])
                                //                            reader.addEventListener("load", () => {
                                //                                el.src = URL.createObjectURL(file)
                                //                                
                                //                            }, false);
                                //                            reader.readAsDataURL(el.files[0]);
                            }
        </script>
    </body>

</html>