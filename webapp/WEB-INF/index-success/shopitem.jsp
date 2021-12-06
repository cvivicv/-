<%@ page import="entities.Usermessage" %><%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/10/26
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<html>
    <head>
        <title>商品页面#${requestScope.event}</title>
        <script src="webjars/jquery/3.5.1/jquery.js"></script>
        <script src="webjars/bootstrap/4.5.3/js/bootstrap.bundle.js"></script>
        <script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
        <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
        <link rel="stylesheet" href="webjars/font-awesome/4.7.0/css/font-awesome.css"/>
        <style>
            #header-item {
                width: 100%;
                height: 40px;
                border: 1px solid #e3e3e3;
                background-color: #F5F5F5;
                font-weight: 500;
                font-size: 23px;
                color: #6c6c6c;
            }

            .user-hello, .user-leave, .shopfont {
                float: right;
                font-size: 20px;
                color: #6c6c6c;
                padding-right: 35px;
            }

            .user-hello:hover, .user-leave:hover, .shopfont:hover {
                color: #4a985c;
                text-decoration: none;
            }

            #SearchDiv {
                width: 100%;
                height: 60px;
                padding-top: 10px;
                background-color: #9daaa6;
            }

            .Search {
                width: 40%;
                height: 40px;
                margin-left: 35%;
                border-radius: 150px 150px 150px 150px;
                border: 1px solid #6aaa5f;
                background-color: #FFF;
            }

            .Search-text {
                width: 78%;
                height: 30px;
                margin-top: 5px;
                margin-left: 2%;
                border: none;
                border-radius: 150px 150px 150px 150px;
                outline: 0;
            }

            .Search button {
                float: right;
                width: 20%;
                border-radius: 150px 150px 150px 150px;
            }

            #SearchShop {
                height: 80px;
                padding-left: 10%;
                background-color: #F9F9F9;
            }

            #SearchShop button {
                margin-top: 1%;
                margin-left: 2%;
                margin-right: 2%;
            }

            #shop-items {
                width: 80%;
                height: 2200px;
                margin-left: 10%;
                margin-top: 1%;
                box-sizing: content-box;
                border: 1px solid #CCCCCC;
                background-color: #F9F9F9;
            }

            #shop-item {
                width: 20%;
                height: 500px;
                padding: 3.5%;
                background-color: #FFFFFF;
                float: left;
                text-decoration: none;
            }

            #shop-item:hover {
                background-color: #F8F8F8;
            }

            #shop-item:hover #shop-name {
                color: #494;
            }

            #shop-price {
                color: #676;
                font-weight: 600;
                font-size: 24px;
            }

            #shop-price:hover {
                text-decoration: none;
            }

            #shop-name {
                margin-top: 2.5%;
                width: 200px;
                height: 60px;
                color: #999;
                font-size: 18px;
                height: 55px;
                text-overflow:ellipsis;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;

            }

            #shopcar-btn {
                width: 200px;
            }

            .row {
                width: 80%;
                height: 200px;
                margin-bottom: 1%;
                background-color: #F6F6F6;
                margin-left: 10%;
                box-sizing: content-box;
                border-left: 1px solid #CCCCCC;
                border-right: 1px solid #CCCCCC;
                border-bottom: 1px solid #CCCCCC;
            }

            #footer {
                width: 100%;
                height: 300px;
                padding-top: 2%;
                background-color: #dddddd;

            }

            .footer-item {
                margin-left: 0;

            }

            .footer-item ul {
                list-style: none;
            }

            .footer-item1, .footer-item2, .footer-item3 {
                margin-left: 9.5%;
                float: left;
                width: 20%;
                text-align: center;
                color: #444444;
            }

            .footer-item a {
                font-size: 16px;
                color: #555555;
            }

            .footer-item a:hover {
                color: #999999;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div id="header-item">
            <img src="Front-resources/logo/logo200x200.png" width="40px"/>
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
                                    Usermessage usermessage = (Usermessage) session.getAttribute("usermessage");
                                    Integer userid = usermessage.getUserid();
                                    String username = usermessage.getUsername();
                                %>
                                <%=username%>
                        </span>
            </a>
        </div>

        <div id="SearchDiv">
            <div class="Search">
                <form method="get" action="Search.html">
                    <input type="text" name="event" class="Search-text" placeholder="${requestScope.event}"/>
                    <button type="submit" class="btn btn-success">搜索</button>
                </form>
            </div>
        </div>

        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="indexsuccess.html">首页</a></li>
            <li class="breadcrumb-item active">商品页</li>
        </ol>

        <div id="SearchShop">
            <a href="Search.html?event=${requestScope.event}">
                <button class="Searchbtn1 btn btn-success">热门 <i class="fa fa-arrow-down" aria-hidden="true"></i></button>
            </a>
            <a href="NewSearch.html?event=${requestScope.event}">
                <button class="Searchbtn2 btn btn-success">最新 <i class="fa fa-arrow-down" aria-hidden="true"></i></button>
            </a>
            <a href="MoneyUpSearch.html?event=${requestScope.event}">
                <button class="Searchbtn3 btn btn-success">价格 <i class="fa fa-caret-up" aria-hidden="true"></i></button>
            </a>
            <a href="MoneyDownSearch.html?event=${requestScope.event}">
                <button class="Searchbtn4 btn btn-success">价格 <i class="fa fa-caret-down" aria-hidden="true"></i></button>
            </a>
        </div>

        <div id="shop-items">
            <c:forEach items="${pageInfo.list}" var="searchshop">
                <div id="shop-item">
                    <a href="oneshop.html?sid=${searchshop.sid}">
                        <input hidden id="shoper" name="shoper" value="${searchshop.shoper}"/>
                        <input hidden id="shopid" name="shopid" value="${searchshop.sid}"/>
                        <img src="./Front-resources/shopimg/${searchshop.photo}" width="200px" height="200px"/><br/>
                        <a id="shop-price">$<span>${searchshop.price}</span></a><br/>
                        <a href="oneshop.html?sid=${searchshop.sid}" id="shop-name">${searchshop.shopname}</a><br/>
                        <a href="AddCar.html?sid=${searchshop.sid}">
                            <button id="shopcar-btn" class="btn btn-success">加入购物车</button>
                        </a>
                    </a>
                </div>
            </c:forEach>
        </div>

        <div class="row">
            <div class="col-md-6">
                第${pageInfo.pageNum}页，共${pageInfo.pages}页，共${pageInfo.total}条记录
            </div>
            <div class="col-md-6 offset-md-4" style="text-align: right">
                <nav aria-label="Page navigation example">
                    <ul class="pagination pagination-sm">
                        <li class="page-item"><a class="page-link" href="Search.html?page=1">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li class="page-item"><a class="page-link" href="Search.html?page=${pageInfo.pageNum-1}&&event=${requestScope.event}">上一页</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum>2&&pageInfo.pages>3}">
                            <li class="page-item"><a class="page-link" href="Search.html?page=1&&event=${requestScope.event}">1</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum>3}">
                            <li class="page-item"><a class="page-link" disabled>...</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum==pageInfo.pages&&pageInfo.pages>2}">
                            <li class="page-item"><a class="page-link"
                                                     href="Search.html?page=${pageInfo.pageNum-2}&&event=${requestScope.event}">${pageInfo.pageNum-2}</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum>1}">
                            <li class="page-item"><a class="page-link"
                                                     href="Search.html?page=${pageInfo.pageNum-1}&&event=${requestScope.event}">${pageInfo.pageNum-1}</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum!=null}">
                            <li class="page-item active"><a class="page-link" href="#">${pageInfo.pageNum}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum+1<=pageInfo.pages}">
                            <li class="page-item"><a class="page-link"
                                                     href="Search.html?page=${pageInfo.pageNum+1}&&event=${requestScope.event}">${pageInfo.pageNum+1}</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum==1&&pageInfo.pages>2}">
                            <li class="page-item"><a class="page-link"
                                                     href="Search.html?page=${pageInfo.pageNum+2}&&event=${requestScope.event}">${pageInfo.pageNum+2}</a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum+2<pageInfo.pages}">
                            <li class="page-item"><a class="page-link" disabled>...</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum+1<pageInfo.pages&&pageInfo.pages>3}">
                            <li class="page-item"><a class="page-link"
                                                     href="Search.html?page=${pageInfo.pages}&&event=${requestScope.event}">${pageInfo.pages}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li class="page-item"><a class="page-link"
                                                     href="Search.html?page=${pageInfo.pageNum+1}&&event=${requestScope.event}">下一页</a></li>
                        </c:if>
                        <li class="page-item"><a class="page-link" href="Search.html?page=${pageInfo.pages}&&event=${requestScope.event}">末页</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <hr/>

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
</html>
<script>
    $(function () {
        var btnActive =${requestScope.btnActive};
        if (btnActive == 1) {
            $(".Searchbtn1").addClass(" active");
        }
        if (btnActive == 2) {
            $(".Searchbtn2").addClass(" active");
        }
        if (btnActive == 3) {
            $(".Searchbtn3").addClass(" active");
        }
        if (btnActive == 4) {
            $(".Searchbtn4").addClass(" active");
        }
    });
</script>
