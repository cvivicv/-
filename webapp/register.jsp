<%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/4/16
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Antenna商城注册</title>
    <script src="webjars/jquery/3.5.1/jquery.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="stylesheet" href="./css/register.css" />
    <script src="./js/VerificationCode.js"></script>
    <script src="./js/registerajax.js"></script>
    <script src="./js/registerPass.js"></script>
</head>
<body onload="dj()">
<a href="index.html" id="logo-a">
    <div id="logo">
        <img src="./Front-resources/logo/logo200x200.png" width="100" height="100">
        <span id="logotext">Antenna</span>
    </div>
</a>

<div id="allbox">
    <!--用户注册信息-->
    <form method="post" action="register.html" onsubmit="return PassSubmit()">
        <div id="login" class="login">
            <div class="form-group col-sm-9">
                <label for="username">用户名:</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="昵称为4-16个字符" maxlength="20"/>
                <span id="usernamemsg">&nbsp</span>
            </div>

            <div class="form-group col-sm-9">
                <label for="password">密码:</label>
                <input type="password" class="form-control" id="password"  name="password" placeholder="密码为6-20字符" maxlength="60"/>
                <span id="passwordmsg">&nbsp</span>
            </div>

            <div class="form-group col-sm-9">
                <label for="again">确认密码:</label>
                <input type="password" class="form-control" id="again" name="again" maxlength="60"/>
                <span id="againmsg">&nbsp</span>
            </div>

            <div class="form-group col-sm-9">
                <label for="email">邮箱:</label>
                <input type="input" class="form-control" id="email" name="email" maxlength="30"/>
                <span id="emailmsg">&nbsp</span>
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
