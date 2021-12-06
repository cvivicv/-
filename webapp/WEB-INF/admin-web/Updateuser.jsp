<%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/6/8
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<html>
<head>
    <title>修改用户信息</title>
    <script src="webjars/jquery/3.5.1/jquery.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <style>
        h1{
            padding-top: 20px;
            padding-left: 5%;
            height: 100px;
            color: #FFF;
            background-color: #406040;
        }
        .breadcrumb{
            margin-top: -8px;
        }
        #item{
            width: 100%;
            height: 200px;
        }
        #left-item{
            margin-left: 10%;
            float: left;
            width: 40%;
            height: 550px;
            background-color: #ccddcc;
        }
        h3{
            margin-left: 40%;
        }
        #left-item li{
            margin-left: 15%;
            padding-top: 2.5%;
            list-style-type: none;
        }
        .look{
            padding-left: 10%;
            list-style-type: none;
        }
        #right-item{
            padding-top: 20px;
            float: left;
            width: 40%;
            height: 550px;
            background-color: #ddeedd;
        }
        #button{
            margin-left: 60%;
        }
    </style>
</head>
<body>
    <h1>修改用户信息</h1>
    <nav class="breadcrumb">
        <a class="breadcrumb-item" href="UserDoing.html">用户信息查询</a>
        <span class="breadcrumb-item active">修改用户信息</span>
    </nav>
    <div id="item">
        <div id="left-item">
            <h3>原用户信息</h3>
                <ul>
                    <li>用户ID：</li>
                    <li class="look">${requestScope.oneuser.userid}</li>
                    <li>用户名：</li>
                    <li class="look">${requestScope.oneuser.username}</li>
                    <li>密码：</li>
                    <li class="look">${requestScope.oneuser.password}</li>
                    <li>邮箱：</li>
                    <li class="look">${requestScope.oneuser.email}</li>
                    <li>创建时间：</li>
                    <li class="look">${requestScope.oneuser.cometime}</li>
                    <li>用户金额</li>
                    <li class="look">${requestScope.oneuser.money}</li>
                </ul>
        </div>
        <div id="right-item">
            <form method="post" action="UpdateDoing.html?userid=${requestScope.oneuser.userid}&page=${requestScope.page}">
                <div id="login" class="login">;
                    <div class="form-group col-sm-9">
                        <label for="username">用户名:</label>
                        <input type="text" class="form-control" id="username" name="username" value="${requestScope.oneuser.userid}" maxlength="20"/>
                    </div>

                    <div class="form-group col-sm-9">
                        <label for="password">密码:</label>
                        <input type="text" class="form-control" id="password"  name="password" value="${requestScope.oneuser.password}" maxlength="60"/>
                    </div>

                    <div class="form-group col-sm-9">
                        <label for="email">邮箱:</label>
                        <input type="input" class="form-control" id="email" name="email" value="${requestScope.oneuser.email}" maxlength="30"/>
                    </div>

                    <div class="form-group col-sm-9">
                        <label for="email">用户金额:</label>
                        <input type="input" class="form-control" id="money" name="money" value="${requestScope.oneuser.money}" maxlength="30"/>
                    </div>

                    <div id="button" class="form-group">
                        <input type="submit" value="修改" class="btn-lg btn-primary"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
