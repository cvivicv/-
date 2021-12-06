<%@ page import="entities.Usermessage" %><%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/8/11
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<html>
<head>
    <title>商品详情页-${requestScope.oneshop.shopname}</title>
    <script src="webjars/jquery/3.5.1/jquery.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="stylesheet" href="webjars/font-awesome/4.7.0/css/font-awesome.css"/>
    <style>
        #header-item{
            width: 100%;
            height: 40px;
            border: 1px solid #e3e3e3;
            background-color: #F5F5F5;
            font-weight: 500;
            font-size: 23px;
            color: #6c6c6c;
        }
        .user-hello,.user-leave,.shopfont{
            float: right;
            font-size: 20px;
            color: #6c6c6c;
            padding-right: 35px;
        }
        .user-hello:hover,.user-leave:hover,.shopfont:hover{
            color: #4a985c;
            text-decoration: none;
        }
        #SearchDiv{
            width: 100%;
            height: 60px;
            padding-top: 10px;
            background-color: #9daaa6;
        }
        .Search{
            width: 40%;
            height: 40px;
            margin-left: 35%;
            border-radius: 150px 150px 150px 150px;
            border: 1px solid #6aaa5f;
            background-color: #FFF;
        }
        .Search-text{
            width: 78%;
            height: 30px;
            margin-top: 5px;
            margin-left: 2%;
            border:none;
            border-radius: 150px 150px 150px 150px;
            outline: 0;
        }
        .Search button{
            float: right;
            width: 20%;
            border-radius: 150px 150px 150px 150px;
        }

        #oneshopitem{
            width: 80%;
            height: 600px;
            margin-left: 10%;
        }
        #shop-photo{
            width: 40%;
            height: 100%;
            float: left;
        }
        #shopimg{
            width: 500px;
            height: 500px;
            margin-left: 15%;
            margin-top: 5%;
            border: 2px solid #CCCCCC;
        }
        #shop-message{
            width: 60%;
            height: 100%;
            float: left;
        }
        #message{
            width: 80%;
            height: 80%;
            padding-top: 0.5%;
            padding-left: 8%;
            font-size: 24px;
        }
        #shopname{
            height: 15%;
            font-size: 36px;
            font-weight: bolder;
        }
        #title{
            height: 15%;
            font-size: 24px;
        }
        #lookmoney{
            height: 80px;
            padding-left: 10px;
            padding-top: 10px;
            background-color: #e9e9e9;
            font-size: 24px;
            color: #646464;
        }
        #i-money,#money{
            width: 50%;
            border:none;
            font-size: 36px;
            font-weight: bolder;
            color: #FF0036;
        }
        #count-item{
            height: 60px;
        }
        #buy-count{
            width: 150px;
            height: 60px;
            border-radius: 5px 5px 5px 5px;
        }
        #addcar{
            width: 600px;
            margin-top: 55px;
            padding-top: 10px;
            height: 80px;
        }
        #shoptext-item{
            width: 80%;
            margin-left: 10%;
            height:200px;
            background-color: #F9F9F9;
            border:1px solid #F2F2F2;
        }
        #shoptext{
            margin-left: 5%;
            margin-right: 5%;
            font-size: 18px;
        }

        /* 类似商品 */
        #likeshop-item{
            margin-top: 2%;
            width: 80%;
            margin-left: 10%;
            height: 380px;

        }
        #likeshop-item p{
            font-size: 30px;
            text-align: center;
        }
        #likeshop{
            margin-left: 6%;
            width: 200px;
            height: 200px;
            float: left;
            text-align: center;
        }
        #likeshop img{
            width: 200px;
            height: 200px;
            border: 1px solid #CCCCCC;
            margin-left: 10%;
        }

        #footer{
            width: 100%;
            height: 300px;
            padding-top: 2%;
            background-color: #dddddd;

        }
        .footer-item{
            margin-left: 0;

        }
        .footer-item ul{
            list-style: none;
        }
        .footer-item1,.footer-item2,.footer-item3{
            margin-left: 9.5%;
            float: left;
            width: 20%;
            text-align: center;
            color: #444444;
        }
        .footer-item a{
            font-size: 16px;
            color: #555555;
        }
        .footer-item a:hover{
            color: #999999;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div id="header-item">
        <img src="Front-resources/logo/logo200x200.png" width="40px" />
        <span>Antenna商城</span>
        <a href="#" class="shopfont">
            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
            <span>购物车</span>
        </a>
        <a href="index.html" class="user-leave">
            <i class="fa fa-user-times" aria-hidden="true"></i>
            <span>登出</span>
        </a>
        <a class="user-hello">
            <i class="fa fa-user-circle" aria-hidden="true"></i>
            <span>
                <%
                    Usermessage usermessage=(Usermessage)session.getAttribute("usermessage");
                    Integer userid=usermessage.getUserid();
                    String username=usermessage.getUsername();
                %>
                <%=username%>
            </span>
        </a>
    </div>
    <div id="SearchDiv">
        <div class="Search">
            <input type="text" name="search" class="Search-text"/>
            <button type="button" class="btn btn-success">搜索</button>
        </div>
    </div>

    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="indexsuccess.html">首页</a></li>
        <li class="breadcrumb-item"><a href="Search.html?event=${requestScope.oneshop.type1}">${requestScope.oneshop.type1}</a></li>
        <li class="breadcrumb-item"><a href="Search.html?event=${requestScope.oneshop.type2}">${requestScope.oneshop.type2}</a></li>
        <li class="breadcrumb-item active">${requestScope.oneshop.shopname}</li>
    </ol>

    <br/>
        <div id="oneshopitem">
            <div id="shop-photo">
                <img src="./Front-resources/shopimg/${requestScope.oneshop.photo}" id="shopimg"/>
            </div>
            <div id="shop-message">
                <div id="message">
                    <br/>
                    <div id="shopname">${requestScope.oneshop.shopname}</div>
                    <div id="title">${requestScope.oneshop.title}</div>
                    <br/>
                    <div id="lookmoney">价格：<a id="i-money">$</a><a id="money" value="${requestScope.oneshop.price}">${requestScope.oneshop.price}</a></div>
                    <br/>
                    <div id="count-item">
                        选择数量：
                        <button onclick="buyadd()" class="btn btn-success btn-lg">&nbsp&nbsp;+ &nbsp&nbsp;</button>
                        <input type="text" id="buy-count" value="1"/>
                        <button onclick="buysubtract()" class="btn btn-success btn-lg">&nbsp&nbsp; - &nbsp&nbsp;</button>
                    </div>
                    <!--购物车表单-->
                    <form method="post" action="AddCar.html">
                        <input type="text" name="sid" value="${requestScope.oneshop.sid}" hidden/>
                        <input type="text" id="sell" name="sell" value="1" hidden/>
                        <input type="submit" id="addcar" class="btn btn-success btn-lg" value="加入购物车"/>
                    </form>
                </div>
            </div>
        </div>

    <div id="shoptext-item">
        <h2 style="text-align: center">商品详情</h2>
        <div id="shoptext">${requestScope.oneshop.text}</div>
    </div>
    <hr/>

    <div id="likeshop-item">
        <div><p>类似商品</p></div>
        <br/>
        <c:forEach items="${requestScope.get('oneshopDown')}" var="shop">
        <div id="likeshop">
                <a href="oneshop.html?sid=${shop.sid}"><img src="./Front-resources/shopimg/${shop.photo}"/></a>
                <div id="likeshop-name" style="margin-left: 40px"><a href="oneshop.html?sid=${shop.sid}">${shop.shopname}</a></div>
            </a>
            <div id="likeshop-price" style="margin-left: 20px">${shop.price}</div>
        </div>
        </c:forEach>
    </div>

    <div id="footer">
        <hr/>
        <div class="footer-item">
            <div class="footer-item1">
                <ul>
                    <li><h2>CATEGORIES</h2></li>
                    <li><a href="#">热门交易</a></li>
                    <li><a href="#">最新商品</a></li>
                    <li><a href="#">最新优惠</a></li>
                    <li><a href="#">购物推荐</a></li>
                </ul>
            </div>

            <div class="footer-item2">
                <ul>
                    <li><h2>INFORMATION</h2></li>
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">联系我们</a></li>
                    <li><a href="#">隐私政策</a></li>
                    <li><a href="#">条款与条件</a></li>
                </ul>
            </div>

            <div class="footer-item3">
                <ul>
                    <li><h2>USERSERVICE</h2></li>
                    <li><a href="#">我的帐户</a></li>
                    <li><a href="#">查看购物车</a></li>
                    <li><a href="#">卖家中心</a></li>
                    <li><a href="#">帮助</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>

<script>
    var value=document.getElementById("buy-count").value;
    function buyadd(){
        value=Number(value)+1;
        document.getElementById("buy-count").value=value;
        document.getElementById("sell").value=value;
    }
    function buysubtract(){
        if(value>1){
            value=Number(value)-1;
        }else{
            value=1;
        }
        document.getElementById("buy-count").value=value;
        document.getElementById("sell").value=value;
    }
</script>
</html>
