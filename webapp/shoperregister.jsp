<%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/4/16
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>商户注册</title>
    <script src="webjars/jquery/3.5.1/jquery.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="stylesheet" href="./css/register.css" />
    <script src="./js/VerificationCode.js"></script>
    <script src="./js/registerShoperAjax.js"></script>
    <script src="./js/registerShoperPass.js"></script>
</head>
<body onload="dj()">
<a href="index.html" id="logo-a">
    <div id="logo">
        <img src="./Front-resources/logo/logo200x200.png" width="100" height="100">
        <span id="logotext">Antenna</span>
    </div>
</a>

<div id="allbox" style="background-image: url(./Front-resources/img/shoperlogin.jpg); ">
    <!--用户注册信息-->
    <form method="post" action="registershoper.html" onsubmit="return PassSubmit()">
        <div id="login" class="login">
            <div class="form-group col-sm-9">
                <label for="shopername">商户名称:</label>
                <input type="text" class="form-control" id="shopername" name="shopername" maxlength="40"/>
                <span id="shopernamemsg">&nbsp</span>
            </div>

            <div class="form-group col-sm-9">
                <label for="password">密码:</label>
                <input type="password" class="form-control" id="password"  name="password" maxlength="60"/>
                <span id="passwordmsg">&nbsp</span>
            </div>

            <div class="form-group col-sm-9">
                <label for="again">确认密码:</label>
                <input type="password" class="form-control" id="again" name="again" maxlength="60"/>
                <span id="againmsg">&nbsp</span>
            </div>

            <div class="form-group col-sm-9">
                <label for="text">验证码:</label>
                <input type="text" class="form-control" id="text" value="" placeholder="请输入验证码（区分大小写）"/>
                <canvas id="canvas" width="100" height="50"></canvas>
                <a onclick="dj()" href="">看不清?换一张</a>
            </div>
            <div id="bottons" class="form-group">
                <input type="submit" value="注册" class="btn-lg btn-primary"/>
                <input type="reset" value="重置" class="btn-lg btn-primary"/>
            </div>
        </div>
    </form>
</div>
</body>
</html>
