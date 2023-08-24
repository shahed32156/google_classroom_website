let themeIcon = document.querySelector('.theme .theme-icon');

themeIcon.addEventListener('click',()=>{
    document.body.classList.toggle("dark");
    if(document.body.classList.contains("dark")){
        localStorage.setItem("theme","dark");
    }else{
        localStorage.setItem("theme","light");
    }
    updateIcon();
})

function themeUpdate(){
    if(localStorage.getItem("theme")!==null){
        if(localStorage.getItem("theme") == "dark"){
            document.body.classList.add("dark");
        }else{
            document.body.classList.remove("dark");
        }
    }
    updateIcon();
}
themeUpdate();

function updateIcon(){
    if(localStorage.getItem("theme")!==null){
        if(localStorage.getItem("theme") == "dark"){
            themeIcon.querySelector('i').classList.remove("fa-moon");
            themeIcon.querySelector('i').classList.add("fa-sun");
        }else{
            themeIcon.querySelector('i').classList.remove("fa-sun");
            themeIcon.querySelector('i').classList.add("fa-moon");
        }
    }
}