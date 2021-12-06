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
    <title>修改商品信息</title>
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
            height: 1200px;
            background-color: #ccddcc;
        }
        h3{
            margin-left: 40%;
        }
        #left-item li{
            margin-left: 20%;
            padding-top: 5.5%;
            list-style-type: none;
        }
        #right-item{
            padding-top: 5px;
            float: left;
            width: 40%;
            height: 1200px;
            background-color: #ddeedd;
        }
        #button{
            margin-left: 60%;
        }
    </style>
</head>
<body>
    <h1>修改商品信息</h1>
    <nav class="breadcrumb">
        <a class="breadcrumb-item" href="ShopDoing.html">商品信息查询</a>
        <span class="breadcrumb-item active">修改商品信息</span>
    </nav>
    <div id="item">
        <div id="left-item">
            <h3>原商品信息</h3>
                <ul>
                    <li>商品ID:${requestScope.oneshop.sid}</li>
                    <li>商品名称:${requestScope.oneshop.shopname}</li>
                    <li>商品标题:${requestScope.oneshop.title}</li>
                    <li>商品父类:${requestScope.oneshop.type1}</li>
                    <li>商品子类:${requestScope.oneshop.type2}</li>
                    <li>商品商户:${requestScope.oneshop.shoper}</li>
                    <li>商品价格:${requestScope.oneshop.price}</li>
                    <li>商品内容:<br/>${requestScope.oneshop.text}</li>
                    <li>商品库存:${requestScope.oneshop.stock}</li>
                    <li>商品热度:${requestScope.oneshop.hot}</li>
                    <li>商品图片:${requestScope.oneshop.photo}</li>
                </ul>
        </div>
        <div id="right-item">
            <form method="post" action="UpdateShopDoing.html?sid=${requestScope.oneshop.sid}&page=${requestScope.page}" enctype="multipart/form-data">
                    <div class="form-group col-sm-9">
                        <label for="shopname">商品名称:</label>
                        <input type="text" class="form-control" id="shopname" name="shopname" value="${requestScope.oneshop.shopname}" maxlength="20"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="title">商品标题:</label>
                        <input type="text" class="form-control" id="title" name="title" value="${requestScope.oneshop.title}" maxlength="40"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="type1">商品父类:</label>
                        <input type="text" class="form-control" id="type1" name="type1" value="${requestScope.oneshop.type1}"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="type2">商品子类:</label>
                        <input type="text" class="form-control" id="type2" name="type2" value="${requestScope.oneshop.type2}"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="shoper">商品商户:</label>
                        <input type="text" class="form-control" id="shoper" name="shoper" value="${requestScope.oneshop.shoper}"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="price">商品价格:</label>
                        <input type="text" class="form-control" id="price" name="price" value="${requestScope.oneshop.price}"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="text">商品内容:</label>
                        <textarea style="width: 75%;height: 200px" type="text" class="form-control" id="text" name="text">${requestScope.oneshop.text}</textarea>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="stock">商品库存:</label>
                        <input type="text" class="form-control" id="stock" name="stock" value="${requestScope.oneshop.stock}"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="hot">商品热度:</label>
                        <input type="text" class="form-control" id="hot" name="hot" value="${requestScope.oneshop.hot}"/>
                    </div>
                    <div class="form-group col-sm-9">
                        <label for="file">商品图片:</label>
                        <input type="file" class="form-control" id="file" name="file" value="${requestScope.oneshop.photo}"/>
                    </div>
                    <div id="button" class="form-group">
                        <input type="submit" value="修改" class="btn-lg btn-primary"/>
                    </div>
            </form>
        </div>
    </div>
</body>
</html>
