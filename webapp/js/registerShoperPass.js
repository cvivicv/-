function PassSubmit(){
    function UserFlag(){
        var usernamemsg=document.getElementById("usernamemsg").innerText;
        var passwordmsg=document.getElementById("passwordmsg").innerText;
        var againmsg=document.getElementById("againmsg").innerText;
        if(usernamemsg=="该用户可以注册"&passwordmsg=="密码合法"&againmsg=="密码一致") {
            return true;
        }else{
            alert("用户信息有误");
            return false;
        }
    }
    if(doVerification()&&UserFlag()==true){
        console.log("true");
        alert("注册成功！");
        return true;
    }else{
        console.log("false");
        return false;
    }
}