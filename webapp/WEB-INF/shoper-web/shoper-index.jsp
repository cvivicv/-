<%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/11/15
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商户页</title>
    <script src="webjars/jquery/3.5.1/jquery.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.bundle.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="stylesheet" href="webjars/font-awesome/4.7.0/css/font-awesome.css"/>
    <style>
        nav{
            background-color: #406040;
        }
        #Item{
            height: 913px;

        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark">
    <a class="navbar-brand" href="#">商户界面</a>
    <span style="float: end">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="shoper-first.html"  target="if"><i class="fa fa-home" aria-hidden="true"></i> 主页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ShoperSelectShop.html"  target="if"><i class="fa fa-shopping-bag" aria-hidden="true"></i> 商品</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ShoperPurchase.html"  target="if"><i class="fa fa-briefcase" aria-hidden="true"></i> 订单</a>
            </li>
        </ul>
    </span>
</nav>
<div id="Item">
    <iframe class="if" name="if" width="100%" height="100%"  frameBorder="0" src="shoper-first.html"></iframe>
</div>
</body>
</html>
