<%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/4/16
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Antenna商城登录</title>
    <script src="webjars/jquery/3.5.1/jquery.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="stylesheet" href="./css/login.css" />
</head>
<body>
<a href="index.html" id="logo-a">
    <div id="logo">
        <img src="./Front-resources/logo/logo200x200.png" width="100" height="100">
        <span id="logotext">Antenna</span>
    </div>
</a>
<div id="allbox">
    <!--用户登录信息-->
    <form method="post" action="login.html">
        <div id="login" class="login">
            <h1>登录</h1>
            <div class="form-group col-sm-9">
                <label for="username">账号:</label>
                <input id="username" name="username" type="text" class="form-control"/>
            </div>
            <div class="form-group col-sm-9">
                <label for="password">密码:</label>
                <input id="password" name="password" type="password" class="form-control" maxlength="60"/>
            </div>
            <div id="bottons">
                <input type="submit" value="登录" class="btn-lg btn-block btn-primary">
                <a href="register.jsp">注册</a>
            </div>
        </div>
    </form>
</div>
</body>

<script>
    $(function () {
        var error=${requestScope.error};
        if(error==1){
            alert("用户名或密码错误！");
        }
    });
</script>
</html>
