<%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/11/16
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<html>
<head>
    <title>商户主页</title>
    <script src="webjars/jquery/3.5.1/jquery.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.bundle.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="stylesheet" href="webjars/font-awesome/4.7.0/css/font-awesome.css"/>
    <style>
        #item{
            width: 100%;
            height: 913px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #item img{
            margin-left: 50px;
            margin-top: -150px;
        }
        #item p{
            margin-left: 50px;
        }
        .givemoney{
            width: 400px;
            margin-left: 50px;
        }
    </style>
</head>
<body>
    <div id="item">
        <div>
            <img src="Front-resources/logo/logo400x400.png" />
            <h1>欢迎！商户用户：${requestScope.shopername}</h1>
            <p>当前商户所持金额：${requestScope.money}</p>
            <button type="button" class="givemoney btn btn-success btn-lg">提现</button>
        </div>
    </div>
</body>
</html>
