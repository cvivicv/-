function createXmlHttpRequest() {
    if (window.ActiveXObject) {
        return new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        return new XMLHttpRequest();
    }
}

$(document).ready(function(){
    Ajaxshopername(),Ajaxpassword(),Ajaxagain();
});


//用户名设置
function Ajaxshopername(){
    $("#shopername").blur(function (){
        var shopername=document.getElementById("shopername");
        var shopernamemsg=document.getElementById("shopernamemsg");
        if(shopername.value==""){
            shopernamemsg.innerText = "该用户不能为空";
        }else if (shopername.value.length < 4 || shopername.value.length >16){
            shopernamemsg.innerText = "请输入4-16个字符";
        }else{
            //用户名重复验证参数
            var url="ajaxshoper.html";
            var param="username="+encodeURIComponent(shopername.value);
            $.post(url,{username:encodeURIComponent(shopername.value)},function (data,status){
                ShoperNameOnly(data,status);
            });
        }
    });
}

//用户名重复验证处理
function ShoperNameOnly(data,status) {
    var shopernamemsg = document.getElementById("shopernamemsg");
    if ("success" == status) {
        if ("success" == data) {
            shopernamemsg.innerText = "该用户不能重复";
        }
        else {
            shopernamemsg.innerText = "该用户可以注册";
        }
    }else {
        shopernamemsg.innerText = "请稍后。。。。";
    }
}

//密码设置
function Ajaxpassword() {
    $("#password").blur(function () {
        var password = document.getElementById("password");
        var passwordmsg = document.getElementById("passwordmsg");
        if (password.value == "") {
            passwordmsg.innerText = "密码不能为空";
        } else if (password.value.length < 6 || password.value.length >20){
            passwordmsg.innerText = "请输入6-20个字符";
        }
        else {
            passwordmsg.innerText = "密码合法";
        }
    });
}

//二次密码设置
function Ajaxagain() {
    $("#again").blur(function () {
        var again = document.getElementById("again");
        var password = document.getElementById("password");
        var againmsg = document.getElementById("againmsg");
        if (again.value == "") {
            againmsg.innerText = "再次输入密码不能为空";
        } else if (again.value != password.value) {
            againmsg.innerText = "当前输入的密码不一致";
        } else {
            againmsg.innerText = "密码一致";
        }
    });
}