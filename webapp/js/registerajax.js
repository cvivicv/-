    function createXmlHttpRequest() {
        if (window.ActiveXObject) {
            return new ActiveXObject("Microsoft.XMLHTTP");
        } else {
            return new XMLHttpRequest();
        }
    }

    $(document).ready(function(){
        Ajaxusername(),Ajaxpassword(),Ajaxagain(),Ajaxemail();
    });


//用户名设置
    function Ajaxusername(){
        $("#username").blur(function (){
            var username=document.getElementById("username");
            var usernamemsg=document.getElementById("usernamemsg");
            if(username.value==""){
                usernamemsg.innerText = "该用户不能为空";
            }else if (username.value.length < 4 || username.value.length >16){
                usernamemsg.innerText = "请输入4-16个字符";
            }else{
                //用户名重复验证参数
                var url="registeruser.html";
                var param="username="+encodeURIComponent(username.value);
                $.post(url,{username:encodeURIComponent(username.value)},function (data,status){
                    UserNameOnly(data,status);
                });
            }
        });
    }

//用户名重复验证处理
    function UserNameOnly(data,status) {
        var usernamemsg = document.getElementById("usernamemsg");
        if ("success" == status) {
            if ("success" == data) {
                usernamemsg.innerText = "该用户不能重复";
            }
            else {
                usernamemsg.innerText = "该用户可以注册";
            }
        }else {
            usernamemsg.innerText = "请稍后。。。。";
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

//邮箱设置
    function Ajaxemail() {
        $("#email").blur(function () {
            var email = document.getElementById("email");
            var emailmsg = document.getElementById("emailmsg");
            var emailreg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if(email.value==""){
                emailmsg.innerText = "邮箱不能为空";
            }else if(emailreg.test(email.value)==false){
                emailmsg.innerText = "邮箱格式错误";
            }else{
                //邮箱重复验证参数
                var url = "registeremail.html";
                var param = "email=" + encodeURIComponent(email.value);
                $.post(url, {email: encodeURIComponent(email.value)}, function (data, status) {
                    EmailOnly(data, status);
                });
            }
        });
    }

//邮箱重复验证处理
    function EmailOnly(data, status) {
        var emailmsg = document.getElementById("emailmsg");
        if ("success" == status) {
            if ("success" == data) {
                emailmsg.innerText = "邮箱不能重复";
            }
            else {
                emailmsg.innerText = "邮箱可以注册";
            }
        } else {
            emailmsg.innerText = "请稍后。。。。";
        }
}