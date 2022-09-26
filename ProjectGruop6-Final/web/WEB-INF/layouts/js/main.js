/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


 
            // Sticky menu khi scrolling
const header = document.querySelector('.header')
const sticky = header.offsetTop;
const icon = document.querySelector(".icon")
const search = document.querySelector(".search")
const closeInput = document.querySelector(".close-search")
const searchInput = document.getElementById("searchInput")
const admin = document.querySelector('.admin-box')
const logo = document.querySelector('.logo-content')
const logoContainer = document.querySelector('.logo-container')

window.onscroll = () => {
    srollSticky();

}
console.log(header.classList)
function srollSticky() {

    if (window.pageYOffset > sticky) {
        header.classList.add("sticky")
        logoContainer.style.visibility = 'visible'
        logoContainer.style.width = '20%'
        logoContainer.style.transition = 'width 1.5s'
        logoContainer.style.opacity = '1'

    } else {
        header.classList.remove("sticky")
        logoContainer.style.visibility = 'hidden'
        logoContainer.style.width = '0px'
        logoContainer.style.opacity = '0'
        

    }
}


// function showIcon() {
//     const icon = document.createElement('div')
//     const option = document.querySelector('.options-header')
//     icon.className = "col-md logo-container show"
//     icon.innerHTML = `<a href="#home">
//         <div class="logo-content">
//             <img src="assets/images/logo_goodMarket.png" id="myImage" alt="Trang chủ">
//         </div>
//     </a>`
//     if (header.classList.contains('sticky')) {
//         console.log('st')

//         console.log(icon)
//         // icon.style.transition = 'all 1.5s'
//         document.querySelector('.options-header').appendChild(icon)
//     }
//     else {

//         document.querySelector('.options-header').removeChild(option.lastChild)
//     }


// }


// Check có là ADMIN không
const isAdmin = document.querySelector(".admin")
// console.log(isAdmin.textContent == 'ADMIN')
console.log(isAdmin != 'ADMIN')
if (isAdmin.textContent != 'ADMIN') {
    admin.style.display = 'none'
}
// console.log(typeof 'ADMIn')
// active => show thanh search input + tìm item cho bọn PRO BE
icon.onclick = () => {
    search.classList.toggle("active")
}

// xóa trên search input
closeInput.onclick = () => {
    searchInput.value = ''
}

