<%@ page import="entities.Usermessage" %><%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/10/10
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<html>
<head>
    <%
        Usermessage usermessage=(Usermessage)session.getAttribute("usermessage");
        Integer userid=usermessage.getUserid();
        String username=usermessage.getUsername();
    %>
    <title><%=username%>的用户订单</title>
    <script src="webjars/jquery/3.5.1/jquery.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.bundle.js"></script>
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




    /* 选项卡代码 */
    .tabcontent{
    width: 1300px;
    margin-top: 1%;
    margin-left: 15%;
    height: 1000px;
    background-color: #F9F9F9;
    border: 1px #CCCCCC solid;
    }
    table td{
        width: 9%;
        height: 150px ;

    }

    .ele{
    width: 1280px;
    height: 50px;
    margin-left: 15%;

    }
    .ele ul{
    list-style: none;
    }
    .ele ul li {
    width: 400px;
    height: 50px;
    background-color: #F7F7F7;
    padding-top: 5px;
    text-align: center;
    font-size: 18px;
    border: 1px #CCC solid;
    float: left;
    }
    .ele ul li a.active{
    border-bottom: 4px solid #ABA;
    color: #565;
    }
    .ele a{
    text-decoration: none;
    color: #777;
    }
    a:hover{
    color: #898;
    }


    #shopimg1,#shopimg2,#shopimg3{
    width: 100px;
    height: 100px;
    }
    .row{
        width: 1300px;
        height: 180px;
        margin-left: 1%;

    }

    #footer{
    width: 100%;
    height: 300px;
    padding-top: 2%;
    background-color: #dddddd;

    }
    .footer-item{
    margin-left: 0%;

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
    <a href="ShopCar.html" class="shopfont">
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
    <li class="breadcrumb-item"><a href="ShopCar.html">购物车</a></li>
    <li class="breadcrumb-item active">订单页</li>
</ol>


<div class="ele">
    <ul>
        <li><a href="#" class="tablinks  active" onclick="openCity(event, 'purchase-item1')">未送达订单</a></li>
        <li><a href="#" class="tablinks" onclick="openCity(event, 'purchase-item2')">配送中订单</a></li>
        <li><a href="#" class="tablinks" onclick="openCity(event, 'purchase-item3')">已完成订单</a></li>
    </ul>
</div>



<div id="purchase-item1" class="tabcontent" style="display: block;">
    <div id="table1">
        <table class="table table-bordered table-hover table-striped">
            <thead class="table-light">
            <tr>
                <th>订单号</th>
                <th>商品</th>
                <th></th>
                <th>单价</th>
                <th>数量</th>
                <th>小计</th>
                <th>接收人</th>
                <th>接收地址</th>
                <th>状态</th>
                <th>下单时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo1.list}" var="NotDelivered">
            <tr>
                <td>${NotDelivered.purid}</td>
                <td><img src="./Front-resources/shopimg/${NotDelivered.photo}" id="shopimg1"/></td>
                <td id="shopname1"><a href="oneshop.html?sid=${NotDelivered.sid}">${NotDelivered.shopname}</a></td>
                <td id="onemoney1">${NotDelivered.price}</td>
                <td id="shopcount1">${NotDelivered.sell}</td>
                <td id="allmoney1">${NotDelivered.price*NotDelivered.sell}</td>
                <td id="truename1">${NotDelivered.truename}</td>
                <td id="address1">${NotDelivered.address}</td>
                <td id="receiving1">未配送</td>
                <td id="creation_time1">${NotDelivered.creation_time}</td>
                <td>
                    <div style="margin-top: 5px;">
                        <button id="refund1" class="btn btn-danger">取消订单</button>
                    </div>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <hr/>
    <div class="row">
        <div class="col-md-6">
            第${pageInfo1.pageNum}页，共${pageInfo1.pages}页，共${pageInfo1.total}条记录
        </div>
        <div class="col-md-6 offset-md-4" style="text-align: right">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="SelectPurchase.html?page1=1">首页</a></li>
                    <c:if test="${pageInfo1.hasPreviousPage}">
                        <li class="page-item"><a class="page-link" href="SelectPurchase.html?page1=${pageInfo1.pageNum-1}">上一页</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum>2&&pageInfo1.pages>3}">
                        <li class="page-item"><a class="page-link" href="SelectPurchase.html?page1=1">1</a></li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum>3}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum==pageInfo1.pages&&pageInfo1.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page1=${pageInfo1.pageNum-2}">${pageInfo1.pageNum-2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum>1}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page1=${pageInfo1.pageNum-1}">${pageInfo1.pageNum-1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum!=null}">
                        <li class="page-item active"><a class="page-link" href="#">${pageInfo1.pageNum}</a></li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum+1<=pageInfo1.pages}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page1=${pageInfo1.pageNum+1}">${pageInfo1.pageNum+1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum==1&&pageInfo1.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page1=${pageInfo1.pageNum+2}">${pageInfo1.pageNum+2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum+2<pageInfo1.pages}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum+1<pageInfo1.pages&&pageInfo1.pages>3}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page1=${pageInfo1.pages}">${pageInfo1.pages}</a></li>
                    </c:if>
                    <c:if test="${pageInfo1.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page1=${pageInfo1.pageNum+1}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="SelectPurchase.html?page1=${pageInfo1.pages}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<div id="purchase-item2" class="tabcontent" style="display: none;">
    <div id="table2">
        <table class="table table-bordered table-hover table-striped">
            <thead class="table-light">
            <tr>
                <th>订单号</th>
                <th>商品</th>
                <th></th>
                <th>单价</th>
                <th>数量</th>
                <th>小计</th>
                <th>接收人</th>
                <th>接收地址</th>
                <th>状态</th>
                <th>下单时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
        <c:forEach items="${pageInfo2.list}" var="Delivering">
            <tr>
                <td>${Delivering.purid}</td>
                <td><img src="./Front-resources/shopimg/${Delivering.photo}" id="shopimg2"/></td>
                <td id="shopname2"><a href="oneshop.html?sid=${Delivering.sid}">${Delivering.shopname}</a></td>
                <td id="onemoney2">${Delivering.price}</td>
                <td id="shopcount2">${Delivering.sell}</td>
                <td id="allmoney2">${Delivering.price*Delivering.sell}</td>
                <td id="truename2">${Delivering.truename}</td>
                <td id="address2">${Delivering.address}</td>
                <td id="receiving2">
                    <c:if test="${Delivering.receiving==1}">
                        配送中
                    </c:if>
                    <c:if test="${Delivering.receiving==2}">
                        已送达
                    </c:if>
                </td>
                <td id="creation_time2">${Delivering.creation_time}</td>
                <td>
                    <div style="margin-top: 5px;">
                        <button id="confirm" class="btn btn-success">确认送达</button>
                    </div>
                    <div style="margin-top: 5px;">
                        <button id="refund2" class="btn btn-danger">申请退款</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
            </tbody>
        </table>
    </div>
    <hr/>
    <div class="row">
        <div class="col-md-6">
            第${pageInfo2.pageNum}页，共${pageInfo2.pages}页，共${pageInfo2.total}条记录
        </div>
        <div class="col-md-6 offset-md-4" style="text-align: right">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="SelectPurchase.html?page2=1">首页</a></li>
                    <c:if test="${pageInfo2.hasPreviousPage}">
                        <li class="page-item"><a class="page-link" href="SelectPurchase.html?page2=${pageInfo2.pageNum-1}">上一页</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum>2&&pageInfo2.pages>3}">
                        <li class="page-item"><a class="page-link" href="SelectPurchase.html?page2=1">1</a></li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum>3}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum==pageInfo2.pages&&pageInfo2.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page2=${pageInfo2.pageNum-2}">${pageInfo2.pageNum-2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum>1}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page2=${pageInfo2.pageNum-1}">${pageInfo2.pageNum-1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum!=null}">
                        <li class="page-item active"><a class="page-link" href="#">${pageInfo2.pageNum}</a></li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum+1<=pageInfo2.pages}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page2=${pageInfo2.pageNum+1}">${pageInfo2.pageNum+1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum==1&&pageInfo2.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page2=${pageInfo2.pageNum+2}">${pageInfo2.pageNum+2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum+2<pageInfo2.pages}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum+1<pageInfo2.pages&&pageInfo2.pages>3}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page2=${pageInfo2.pages}">${pageInfo2.pages}</a></li>
                    </c:if>
                    <c:if test="${pageInfo2.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page2=${pageInfo2.pageNum+1}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="SelectPurchase.html?page2=${pageInfo2.pages}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<div id="purchase-item3" class="tabcontent" style="display: none;">
    <div id="table3">
        <table class="table table-bordered table-hover table-striped">
            <thead class="table-light">
            <tr >
                <th>订单号</th>
                <th>商品</th>
                <th></th>
                <th>单价</th>
                <th>数量</th>
                <th>小计</th>
                <th>接收人</th>
                <th>接收地址</th>
                <th>状态</th>
                <th>下单时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo3.list}" var="Delivered">
            <tr>
                <td>${Delivered.purid}</td>
                <td><img src="./Front-resources/shopimg/${Delivered.photo}" id="shopimg3"/></td>
                <td id="shopname3"><a href="oneshop.html?sid=${Delivered.sid}">${Delivered.shopname}</a></td>
                <td id="onemoney3">${Delivered.price}</td>
                <td id="shopcount3">${Delivered.sell}</td>
                <td id="allmoney3">${Delivered.price*Delivered.sell}</td>
                <td id="truename3">${Delivered.truename}</td>
                <td id="address3">${Delivered.address}</td>
                <td id="receiving3">
                    <c:if test="${Delivered.receiving==3}">
                        已送达
                    </c:if>
                    <c:if test="${Delivered.receiving==4}">
                        已退款
                    </c:if>
                </td>
                <td id="creation_time3">${Delivered.creation_time}</td>
                <td>
                    <div style="margin-top: 5px;">
                        <button id="delivered" class="btn btn-success">进行评价</button>
                    </div>
                    <div style="margin-top: 5px;">
                        <button id="refund3" class="btn btn-danger">申请退款</button>
                    </div>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <hr/>
    <div class="row">
        <div class="col-md-6">
            第${pageInfo3.pageNum}页，共${pageInfo3.pages}页，共${pageInfo3.total}条记录
        </div>
        <div class="col-md-6 offset-md-4" style="text-align: right">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="SelectPurchase.html?page3=1">首页</a></li>
                    <c:if test="${pageInfo3.hasPreviousPage}">
                        <li class="page-item"><a class="page-link" href="SelectPurchase.html?page3=${pageInfo3.pageNum-1}">上一页</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum>2&&pageInfo3.pages>3}">
                        <li class="page-item"><a class="page-link" href="SelectPurchase.html?page3=1">1</a></li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum>3}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum==pageInfo3.pages&&pageInfo3.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page3=${pageInfo3.pageNum-2}">${pageInfo3.pageNum-2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum>1}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page3=${pageInfo3.pageNum-1}">${pageInfo3.pageNum-1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum!=null}">
                        <li class="page-item active"><a class="page-link" href="#">${pageInfo3.pageNum}</a></li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum+1<=pageInfo3.pages}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page3=${pageInfo3.pageNum+1}">${pageInfo3.pageNum+1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum==1&&pageInfo3.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page3=${pageInfo3.pageNum+2}">${pageInfo3.pageNum+2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum+2<pageInfo3.pages}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum+1<pageInfo3.pages&&pageInfo3.pages>3}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page3=${pageInfo3.pages}">${pageInfo3.pages}</a></li>
                    </c:if>
                    <c:if test="${pageInfo3.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="SelectPurchase.html?page3=${pageInfo3.pageNum+1}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="SelectPurchase.html?page3=${pageInfo3.pages}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<br/>
<div id="footer">
    <hr />
    <div class="footer-item">
        <div class="footer-item1">
            <ul>
                <li>
                    <h2>CATEGORIES</h2>
                </li>
                <li><a href="#">热门交易</a></li>
                <li><a href="#">最新商品</a></li>
                <li><a href="#">最新优惠</a></li>
                <li><a href="#">购物推荐</a></li>
            </ul>
        </div>

        <div class="footer-item2">
            <ul>
                <li>
                    <h2>INFORMATION</h2>
                </li>
                <li><a href="#">关于我们</a></li>
                <li><a href="#">联系我们</a></li>
                <li><a href="#">隐私政策</a></li>
                <li><a href="#">条款与条件</a></li>
            </ul>
        </div>

        <div class="footer-item3">
            <ul>
                <li>
                    <h2>USERSERVICE</h2>
                </li>
                <li><a href="#">我的帐户</a></li>
                <li><a href="#">查看购物车</a></li>
                <li><a href="#">卖家中心</a></li>
                <li><a href="#">帮助</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
<script>
    function openCity(event, Name) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(Name).style.display = "block";
        event.currentTarget.className += " active";
    }
</script>