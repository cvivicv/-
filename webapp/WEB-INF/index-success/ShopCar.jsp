<%@ page import="entities.Usermessage" %><%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/9/7
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<html>
<head>
    <%
        Usermessage usermessage=(Usermessage)session.getAttribute("usermessage");
        Integer userid=usermessage.getUserid();
        String username=usermessage.getUsername();
    %>
    <title><%=username%>的购物车</title>
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

        #useritem{
            width: 1280px;
            margin-left: 15%;
            height: 220px;
            background-color: #F9F9F9;
            border: 1px #CCCCCC solid;
        }
        #username,#phone,#address{
            margin-top: 25px;
            margin-left: 25px;
            font-size: 18px;
        }
        #none{
            padding-top:70px;
            padding-left:70px;
            font-size: 40px;
        }

        #shopcar{
            width: 1280px;
            margin-top: 1%;
            margin-left: 15%;
            background-color: #F9F9F9;
            border: 1px #CCCCCC solid;
        }
        #allmoney,#onemoney{
            background: none;
            outline: none;
            border: 0px;
        }
        #shopcar td{
            height: 50px;
        }
        #shopname{
            height: 50px;
        }
        #photo{
            width: 100px;
            height: 100px;
        }
        /**商品总额支付按钮**/
        #ready-buy{
            height: 100px;
            padding-top: 10px;
        }
        #shopmoneyitem{
            width: 65%;
            float: left;
            font-size: 36px;
            margin-left:2.5%;
        }
        #button_submit{
            width: 22%;
            float: left;
        }
        #button_reset{
            padding-top: 20px;
            width: 8%;
            float: left;
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
<body onload="sum()">
<div id="header-item">
    <img src="Front-resources/logo/logo200x200.png" width="40px" />
    <span>Antenna商城</span>
    <a href="SelectPurchase.html" class="shopfont">
        <i class="fa fa-list" aria-hidden="true"></i>
        <span>订单</span>
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
    <li class="breadcrumb-item active">购物车</li>
</ol>

<div id="useritem">
    <a href="#Contact_information" class="Item"  data-toggle="modal">
        <button class="btn btn-success" style="float: right; margin: 10px;">编辑</button>
    </a>
    <div class="modal fade" id="Contact_information">
        <div class="modal-dialog">
            <div class="modal-content" style="width:500px;height: 600px;">
                <div class="modal-header">
                    <h4 class="modal-title">联系方式</h4>
                    <button type="button" class="close" data-dismiss="modal">x</button>
                </div>
                <div class="modal-body">
                    <form action="UpDateContact.html" method="post">
                        <div class="form-group col-sm-12">
                            <label for="username">用户名:</label>
                            <input type="text" class="form-control" id="Contact_username" name="truename" placeholder="请输入真实姓名" maxlength="20"/>
                        </div>
                        <div class="form-group col-sm-12">
                            <label for="phone">手机:</label>
                            <input type="text" class="form-control" id="Contact_phone"  name="phone" placeholder="请输入手机号码" maxlength="60" onkeyup="this.value=this.value.replace(/\D/g,'')"/>
                        </div>
                        <div class="form-group col-sm-12">
                            <label for="address">地址:</label>
                            <input type="text" class="form-control" id="Contact_address"  name="address" placeholder="请输入送货地址"  maxlength="100"/>
                        </div>
                        <input type="submit" value="提交" style="width:350px;height: 40px; margin-top: 40px; margin-left: 15%;" class="btn btn-primary"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${requestScope.contactmessage.truename!=none}">
    <div id="username"><i class="fa fa-user fa-2x" aria-hidden="true" style="margin-right: 20px;"></i>用户：<span>${requestScope.contactmessage.truename}</span></div>
    <div id="phone"><i class="fa fa-mobile fa-2x" aria-hidden="true" style="margin-left: 3px;margin-right: 20px;"></i>手机：<span>${requestScope.contactmessage.phone}</span></div>
    <div id="address"><i class="fa fa-map-marker fa-2x" aria-hidden="true" style="margin-right: 20px;"></i>地址：<span>${requestScope.contactmessage.address}</span></div>
    </c:if>
    <c:if test="${requestScope.contactmessage.truename==none}">
        <div id="none">
            <i class="fa fa-exclamation-triangle" aria-hidden="true" style="margin-right: 20px;"></i>请填写用户联系方式
        </div>
    </c:if>
</div>



    <div id="shopcar">

        <div id="table">
            <table class="table table-bordered table-hover table-striped">
                <thead class="table-light">
                <tr>
                    <th><input type="checkbox" id="allchoose" name="allchoose" checked> 全选</th>
                    <th>商品</th>
                    <th></th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                    <c:if test="${not empty selectshopcar}" >
                        <c:forEach items="${requestScope.selectshopcar}" var="car">
                            <tr>
                                <input id="carid1" name="carid1" value="${car.carid}" hidden>
                                <td><input type="checkbox" name="choose" id="choose" checked></td>
                                <td><img src="Front-resources/shopimg/${car.photo}" id="photo"/></td>
                                <td><a href="oneshop.html?sid=${car.sid}" id="shopname">${car.shopname}</a></td>
                                <td><input type="text" readonly id="onemoney" name="onemoney" value="${car.price}"/></td>
                                <td>
                                    <input type="text" id="shopcount" name="shopcount" value="${car.sell}" onchange="change(this),SellUpdate(this)"/>
                                </td>
                                <td><input type="text" readonly id="allmoney" name="allmoney" value="${car.price*car.sell}"/></td>
                                <td><button id="${car.carid}" class="delete btn btn-danger">删除</button></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty selectshopcar}">
                        <tr>
                            <td colspan="7" style="text-align: center;height: 500px;padding-top: 200px;font-size:24px;">非常抱歉，您还没有加入任何商品至购物车<br/><a href="indexsuccess.html">点此返回首页</a></td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
            <div id="ready-buy">
                <div id="shopmoneyitem">
                商品总额：$ <span id="shopmoney">0</span>
                </div>
                <div id="button_submit">
                    <form method="post" action="AddPurchase.html" id="AddPurchase">
                        <c:if test="${not empty selectshopcar}">
                            <c:forEach items="${requestScope.selectshopcar}" var="car">
                                <input id="carid" name="carid" value="${car.carid}" hidden>
                            </c:forEach>
                        </c:if>
                        <button id="AddPurchaseBtn"  class="btn btn-success" style="width: 250px;height: 60px;font-size: 24px;">确认支付</button>
                    </form>
                </div>
                <div id="button_reset">
                    <button  class="reset_btn btn btn-danger">重置</button>
                </div>
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

<script>
    //购物车总数以及总价计算
        function sum(){
            var shopmoney=0;
            var choosepass;
            var all=true;
            for(var i=0;i<document.getElementsByName("choose").length;i++){
                choosepass=document.getElementsByName("choose")[i].checked;
                if(choosepass==true){
                    document.getElementsByName("carid")[i].disabled=false;
                    shopmoney=shopmoney+parseFloat(document.getElementsByName("allmoney")[i].value);
                }
                else{
                    document.getElementsByName("carid")[i].disabled=true;
                    all=false;
                }
                document.getElementById("shopmoney").innerHTML=shopmoney;
                if(all==true){
                    document.getElementById("allchoose").checked=true;
                }
                else{
                    document.getElementById("allchoose").checked=false;
                }
            }
        }

        //全选操作
        //侦听allchoose全选复选框，如果勾选全选则下面的choose复选框也全打勾，并且执行sum（）函数
        var allchoosepass;
        document.getElementById("allchoose").onclick=function(){
            allchoosepass=document.getElementById("allchoose").checked;
            if(allchoosepass==true){
                for(var i=0;i<document.getElementsByName("choose").length;i++){
                    document.getElementsByName("choose")[i].checked=true;
                    document.getElementsByName("carid")[i].disabled=false;
                    console.log(document.getElementsByName("carid")[i]);
                    sum();
                }
            }
            else{
                for(var i=0;i<document.getElementsByName("choose").length;i++){
                    document.getElementsByName("choose")[i].checked=false;
                    document.getElementsByName("carid")[i].disabled=true;
                    console.log(document.getElementsByName("carid")[i]);
                    sum();
                }
            }
        }

        //单选操作
        // 重新执行sum函数
        for(var i=0;i<document.getElementsByName("choose").length;i++){
            document.getElementsByName("choose")[i].onclick=function(){
                sum();
            }
        }

        //修改购买数量操作
        function change(one){
            var sellone=-1;//记住被修改的下标
            for(var i=0;i<document.getElementsByName("shopcount").length;i++){
                if(document.getElementsByName("shopcount")[i]==one){
                    sellone=i;
                    break;
                }
            }
            document.getElementsByName("allmoney")[sellone].value=document.getElementsByName("shopcount")[sellone].value*document.getElementsByName("onemoney")[sellone].value;
            sum();
        }


        $(function(){

            $(".delete").click(function(){
                if(confirm("确认删除商品?")){
                    //获取到被删除商品pid
                    var carid=this.id;
                    window.location.href="DelectCar.html?carid="+carid;
                }
            });
            $(".reset_btn").click(function(){
                if(confirm("确认重置全部商品?")){
                    window.location.href="DelectAllCar.html";
                }
            });
            $('#AddPurchaseBtn').click(function () {
                if (confirm("确认支付？")) {
                    $('#AddPurchase').submit();
                }
            });
            //余额库存判断
            var pass=${requestScope.pass};
            if(pass==1){
                alert("用户余额不足！");
            }else if(pass==2){
                alert("商品库存不足！");
            }else if(pass==3) {
                alert("购物车为空！");
            }
        });


    function SellUpdate(one){
        var sellone=-1;//记住被修改的下标
               for(var i=0;i<document.getElementsByName("shopcount").length;i++){
                   if(document.getElementsByName("shopcount")[i]==one){
                       sellone=i;
                       break;
                   }
               }
        $.ajax({
            url:"UpdateSellCar.html",
            type:"get",
            dataType:"text",//json,text,html
            data:{
                "carid":encodeURIComponent(document.getElementsByName("carid1")[sellone].value),
                // "sell":encodeURIComponent(document.getElementsByName("shopcount")[sellone].value)
                "sell":encodeURIComponent($("[name=shopcount]")[sellone].value)
            },

            success:function (data,status){
                console.log("ok");
            },
            error:function (data,status){
                console.log("error");
            }

        })
    }

    // function createXmlHttpRequest() {
    //     if (window.ActiveXObject) {
    //         return new ActiveXObject("Microsoft.XMLHTTP");
    //     } else {
    //         return new XMLHttpRequest();
    //     }
    // }
        //    function SellUpdate(one){
        //        var sellone=-1;//记住被修改的下标
        //        for(var i=0;i<document.getElementsByName("shopcount").length;i++){
        //            if(document.getElementsByName("shopcount")[i]==one){
        //                sellone=i;
        //                break;
        //            }
        //        }
        //        var carid=document.getElementsByName("carid1")[sellone].value;
        //        var sell=document.getElementsByName("shopcount")[sellone].value;
        //             //ajax修改购买数
        //             var url="UpdateSellCar.html";
        //             var param="carid="+encodeURIComponent(carid)+"&&"+"sell="+encodeURIComponent(sell);
        //             $.post(url,{carid:encodeURIComponent(carid),sell:encodeURIComponent(sell)},function (data,status){
        //                 Updatesuccess(data,status);
        //             });
        //         }
        //
        //
        // function Updatesuccess(data,status) {
        //     if ("success" == status) {
        //         if ("success" == data) {
        //             console.log("ok");
        //         }
        //         else {
        //             console.log("error");
        //         }
        //     }else {
        //         shopernamemsg.innerText = "请稍后。。。。";
        //     }
        // }
</script>
</html>
