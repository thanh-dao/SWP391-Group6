<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Bootstrap CSS -->


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
        <div class="user__information">
            <div class="container">
                <div class="link">
                    <a href="<c:url value="/home/main.do"/>">Trang ch???</a> >>
                    <a href="<c:url value="/user/userInformation.do"/>">User name</a> 
                </div>

                <h1>H??? s?? c???a t??i</h1>
                <p>Qu???n l?? th??ng tin h??? s?? ????? b???o m???t t??i kho???n</p>

                <div class="row">  
                    <div class="form__img col-lg-3 col-md-3 col-sm-3">
                        <form id="img-form" method="POST" enctype='multipart/form-data' action="<c:url value="/FileHandle"/>">
                            <input type="file" accept="image/*" onchange='previewImage(this)' id="hidden-img" hidden name="file">
                            <label  id='image-label'>
                                <img class="img-fluid rounded-circle"  id='img' src="${sessionScope.user.avatarLink}" alt="" >
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
                                        <input type="text" class="input-form-item" value="${sessionScope.user.email == null ? "": sessionScope.user.email}">
                                    </div>
                                    <div class="input-form">
                                        <label>T??n</label>
                                        <input type="text" required="true" placeholder="Nh???p t??n ng?????i d??ng"
                                               maxlength="50" class="input-form-item"  name="firstName"  value="${sessionScope.user.firstName == null ? "": sessionScope.user.firstName}">
                                    </div>
                                    <div class="input-form">
                                        <label>H???</label>
                                        <input type="text" required="true" placeholder="Nh???p h??? ng?????i d??ng"
                                               maxlength="50" class="input-form-item"  name="lastName"  value="${sessionScope.user.lastName == null ? "": sessionScope.user.lastName}">
                                    </div>
                                    <div class="input-form">
                                        <label>S??? ??i???n tho???i</label>
                                        <input type="text" required="true" placeholder="Nh???p s??? ??i???n tho???i" maxlength="50"
                                               class="input-form-item" name="phone" value="${sessionScope.user.phone == null ? "": sessionScope.user.phone }" >
                                    </div>
                                    <div class="input-form">
                                        <label>Ng??y/Th??ng/N??m Sinh</label>
                                        <input required="true" type="date" maxlength="50" class="input-form-item" name="yob" value="${sessionScope.user.yob}">

                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="input-form">
                                        <label>T???nh/Th??nh ph???</label>

                                        <select class="city-picker" onchange="handleCityChange(this)" name="cityId">
                                        </select>
                                    </div>
                                    <div class="input-form">
                                        <label>Qu???n/Huy???n</label>
                                        <select class="district-picker" onchange="handleDistrictChange(this)" name="districtId">
                                        </select>
                                        
                                    </div>
                                    <div class="input-form">
                                        <label>Ph?????ng/X??</label>
                                        <select class="ward-picker" onchange="" name="wardId">
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-item1 input-form" style="position: relative">
                                <label>?????a ch??? chi ti???t</label><br>
                                <textarea type="textarea" required="true" name="houseNumber"
                                          placeholder="V?? d???: 193/14/2, ???????ng ????? V??n Thi" class="input-form-item" >${sessionScope.user.address.houseNumber == null ? "" : sessionScope.user.address.houseNumber}</textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div style="display: flex; justify-content: center;">
                    <button class="btn btn-primary" onclick="submit()" style="text-align: center;" type="button">C???p nh???t</button>
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
                            $.ajax("<c:url value="/AddressHandleAjax"/>", {
                                data: {
                                    param: "city",
                                },
                                success: function (data) {
                                    arr = JSON.parse(data)
                                    renderOption(selectCitySelector, arr, "city", "Ch???n t???nh/th??nh ph???")
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
                                renderWardOrDistrict(districtId, cityId, "district", "Ch???n qu???n/huy???n");
                                renderWardOrDistrict(wardId, districtId, "ward", "Ch???n ph?????ng/x??");
                            }
                            $(selectDistrictSelector).select2({disabled: isAddressNull})
                            $(selectWardSelector).select2({disabled: isAddressNull})
                        };

                        const handleCityChange = async (el) => {
                            const cityId = el.value;

                            console.log("1111" + cityId)
                            const wardId = $(selectWardSelector).value
                            const districtId = $(selectDistrictSelector).value
                            await renderWardOrDistrict(districtId, cityId, "district", "Ch???n qu???n/huy???n");
                            $(selectWardSelector).html("")
                            $(selectWardSelector).select2({disabled: true, data: []})

                        }

                        const handleDistrictChange = async (el) => {
                            const districtId = el.value;
                            const wardId = $(selectWardSelector).value;
                            const cityId = $(selectCitySelector).value;
                            console.log(districtId)
                            await renderWardOrDistrict(wardId, districtId, "ward", "Ch???n ph?????ng/x??");
                        }


                        const submit = () => {
                            console.log(1)
                            const formData = new FormData();
                            formData.append("image", document.querySelector("#hidden-img").files[0])
                            formData.append("func", "uploadAva")
                            console.log(formData)
                            fetch('<c:url value="/FileUserHandle"/>', {
                                method: "POST",
                                body: formData,
                            })
                            $("#text-form").submit();
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
