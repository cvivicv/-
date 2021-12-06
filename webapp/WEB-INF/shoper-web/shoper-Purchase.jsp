<%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/11/19
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<html>
<head>
    <title>商户订单</title>
    <script src="webjars/jquery/3.5.1/jquery.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.bundle.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="stylesheet" href="webjars/font-awesome/4.7.0/css/font-awesome.css"/>
    <style>
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
    </style>
</head>
<body>
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
                    <td id="shopname1">${NotDelivered.shopname}</td>
                    <td id="onemoney1">${NotDelivered.price}</td>
                    <td id="shopcount1">${NotDelivered.sell}</td>
                    <td id="allmoney1">${NotDelivered.price*NotDelivered.sell}</td>
                    <td id="truename1">${NotDelivered.truename}</td>
                    <td id="address1">${NotDelivered.address}</td>
                    <td id="receiving1">未配送</td>
                    <td id="creation_time1">${NotDelivered.creation_time}</td>
                    <td>
                        <div style="margin-top: 5px;">
                            <button id="${NotDelivered.purid}" class="confirm1 btn btn-success">货已配送</button>
                        </div>
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
                    <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page1=1">首页</a></li>
                    <c:if test="${pageInfo1.hasPreviousPage}">
                        <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page1=${pageInfo1.pageNum-1}">上一页</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum>2&&pageInfo1.pages>3}">
                        <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page1=1">1</a></li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum>3}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum==pageInfo1.pages&&pageInfo1.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page1=${pageInfo1.pageNum-2}">${pageInfo1.pageNum-2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum>1}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page1=${pageInfo1.pageNum-1}">${pageInfo1.pageNum-1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum!=null}">
                        <li class="page-item active"><a class="page-link" href="#">${pageInfo1.pageNum}</a></li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum+1<=pageInfo1.pages}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page1=${pageInfo1.pageNum+1}">${pageInfo1.pageNum+1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum==1&&pageInfo1.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page1=${pageInfo1.pageNum+2}">${pageInfo1.pageNum+2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum+2<pageInfo1.pages}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo1.pageNum+1<pageInfo1.pages&&pageInfo1.pages>3}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page1=${pageInfo1.pages}">${pageInfo1.pages}</a></li>
                    </c:if>
                    <c:if test="${pageInfo1.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page1=${pageInfo1.pageNum+1}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page1=${pageInfo1.pages}">末页</a>
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
                    <td id="shopname2">${Delivering.shopname}</td>
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
                            <button id="confirm2" class="btn btn-success">货已送达</button>
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
                    <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page2=1">首页</a></li>
                    <c:if test="${pageInfo2.hasPreviousPage}">
                        <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page2=${pageInfo2.pageNum-1}">上一页</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum>2&&pageInfo2.pages>3}">
                        <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page2=1">1</a></li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum>3}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum==pageInfo2.pages&&pageInfo2.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page2=${pageInfo2.pageNum-2}">${pageInfo2.pageNum-2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum>1}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page2=${pageInfo2.pageNum-1}">${pageInfo2.pageNum-1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum!=null}">
                        <li class="page-item active"><a class="page-link" href="#">${pageInfo2.pageNum}</a></li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum+1<=pageInfo2.pages}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page2=${pageInfo2.pageNum+1}">${pageInfo2.pageNum+1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum==1&&pageInfo2.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page2=${pageInfo2.pageNum+2}">${pageInfo2.pageNum+2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum+2<pageInfo2.pages}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo2.pageNum+1<pageInfo2.pages&&pageInfo2.pages>3}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page2=${pageInfo2.pages}">${pageInfo2.pages}</a></li>
                    </c:if>
                    <c:if test="${pageInfo2.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page2=${pageInfo2.pageNum+1}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page2=${pageInfo2.pages}">末页</a>
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
                    <td id="shopname3">${Delivered.shopname}</td>
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
                        <c:if test="${Delivered.receiving==3}">
                            <div style="margin-top: 5px;">
                                <button id="givemoney" class="btn btn-success">收取商款</button>
                            </div>
                        </c:if>
                        <c:if test="${Delivered.receiving==4}">
                            <div style="margin-top: 5px;">
                                <button id="giveshop" class="btn btn-success">退款确认</button>
                            </div>
                            <div style="margin-top: 5px;">
                                <button id="giveshop2" class="btn btn-danger">退款申述</button>
                            </div>
                        </c:if>
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
                    <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page3=1">首页</a></li>
                    <c:if test="${pageInfo3.hasPreviousPage}">
                        <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page3=${pageInfo3.pageNum-1}">上一页</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum>2&&pageInfo3.pages>3}">
                        <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page3=1">1</a></li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum>3}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum==pageInfo3.pages&&pageInfo3.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page3=${pageInfo3.pageNum-2}">${pageInfo3.pageNum-2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum>1}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page3=${pageInfo3.pageNum-1}">${pageInfo3.pageNum-1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum!=null}">
                        <li class="page-item active"><a class="page-link" href="#">${pageInfo3.pageNum}</a></li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum+1<=pageInfo3.pages}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page3=${pageInfo3.pageNum+1}">${pageInfo3.pageNum+1}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum==1&&pageInfo3.pages>2}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page3=${pageInfo3.pageNum+2}">${pageInfo3.pageNum+2}</a>
                        </li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum+2<pageInfo3.pages}">
                        <li class="page-item"><a class="page-link" disabled>...</a></li>
                    </c:if>
                    <c:if test="${pageInfo3.pageNum+1<pageInfo3.pages&&pageInfo3.pages>3}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page3=${pageInfo3.pages}">${pageInfo3.pages}</a></li>
                    </c:if>
                    <c:if test="${pageInfo3.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="ShoperPurchase.html?page3=${pageInfo3.pageNum+1}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="ShoperPurchase.html?page3=${pageInfo3.pages}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
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

    $(function() {
        $(".confirm1").click(function () {
            if (confirm("该商品未配送-》配送中?")) {
                //获取到被删除商品pid
                var purid = this.id;
                window.location.href = "ShoperDeliveringPurchase.html?purid=" + purid;
            }
        });
    })
</script>
</html>
