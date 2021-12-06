<%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/11/17
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<html>
<head>
    <title>${requestScope.shopername}的商品仓库</title>
    <script src="webjars/jquery/3.5.1/jquery.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.bundle.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <style>
        h1{
            padding-top: 20px;
            padding-left: 5%;
            height: 100px;
            color: #FFF;
            background-color: #608060;
        }
        #shop-site{
            margin-right: 1%;
            margin-top: 5px;
            float: right;
        }
        #ShopAdd{
            font-size:18px;
            font-weight: 0;
            color: #000000;
        }
        .table{
            margin-top: -10px;
            border: 0.5px solid #406040;
        }
        .table th{
            background-color: #608060;
            color: #BBCCBB;
            border: 0.5px solid #608060;
        }
        .table tr{
            height: 80px;
            border: 0.5px solid #AABBCC;
        }
        .table td{
            border: 0.5px solid #AABBCC;
        }
    </style>
</head>
<body>
<h1>${requestScope.shopername}的商品项
    <!--添加-->
    <a href="#ShopAdd" class="btn btn-success" data-toggle="modal" id="shop-site">添加</a>
    <!-- 商品添加框 -->
    <div class="modal fade" id="ShopAdd">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">商品添加</h4>
                    <button type="button" class="close" data-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form method="post" action="ShoperAddShop.html"  enctype="multipart/form-data">
                        <input type="text" class="form-control" id="page" name="page" value="${pageInfo.pageNum}" hidden/>
                        <!-- 添加信息 -->
                        <div class="form-group col-sm-9">
                            <label for="shopname">商品名称:</label>
                            <input type="text" class="form-control" id="shopname" name="shopname" maxlength="20"/>
                        </div>
                        <div class="form-group col-sm-9">
                            <label for="title">商品标题:</label>
                            <input type="text" class="form-control" id="title" name="title" maxlength="40"/>
                        </div>
                        <div class="form-group col-sm-9">
                            <label for="type1">商品父类:</label>
                            <input type="text" class="form-control" id="type1" name="type1"/>
                        </div>
                        <div class="form-group col-sm-9">
                            <label for="type2">商品子类:</label>
                            <input type="text" class="form-control" id="type2" name="type2"/>
                        </div>
                        <div class="form-group col-sm-9">
                            <label for="price">商品价格:</label>
                            <input type="text" class="form-control" id="price" name="price"/>
                        </div>
                        <div class="form-group col-sm-9">
                            <label for="text">商品内容:</label>
                            <textarea style="width: 100%;height: 200px" type="text" class="form-control" id="text" name="text"></textarea>
                        </div>
                        <div class="form-group col-sm-9">
                            <label for="stock">商品库存:</label>
                            <input type="text" class="form-control" id="stock" name="stock"/>
                        </div>
                        <div class="form-group col-sm-9">
                            <label for="file">商品图片:</label>
                            <input type="file" class="form-control" id="file" name="file"/>
                        </div>
                        <input type="submit" value="提交" class="btn-lg btn-primary"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</h1>

<table class="table table-hover">
    <thead class="table">
    <tr>
        <th style="width: 5%">商品ID</th>
        <th style="width: 10%">商品名称</th>
        <th style="width: 10%">商品标题</th>
        <th style="width: 5%">商品父类</th>
        <th style="width: 5%">商品子类</th>
        <th style="width: 5%">商品价格</th>
        <th style="width: 20%">商品内容</th>
        <th style="width: 5%">商品库存</th>
        <th style="width: 5%">商品热度</th>
        <th style="width: 10%">商品图片</th>
        <th style="width: 10%">商品操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageInfo.list}" var="shop">
        <tr>
            <td>${shop.sid}</td>
            <td>${shop.shopname}</td>
            <td>${shop.title}</td>
            <td>${shop.type1}</td>
            <td>${shop.type2}</td>
            <td>${shop.price}</td>
            <td>${shop.text}</td>
            <td>${shop.stock}</td>
            <td>${shop.hot}</td>
            <td><img src="./Front-resources/shopimg/${shop.photo}" width="150px" height="150px"/><br/><p style="text-align: center">${shop.photo}</p></td>
            <td>
                <a href="MoreShoperDoing.html?event=oneshop&sid=${shop.sid}&page=${requestScope.page}"><button class="btn btn-sm btn-primary">修改</button></a>
                <a href="MoreShoperDoing.html?event=deleteshop&sid=${shop.sid}&page=${requestScope.page}" onclick="return confirm('确定将此商品删除?')"><button class="btn btn-sm btn-danger">删除</button></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="row">
    <div class="col-md-6">
        第${pageInfo.pageNum}页，共${pageInfo.pages}页，共${pageInfo.total}条记录
    </div>
    <div class="col-md-6 offset-md-4" style="text-align: right">
        <nav aria-label="Page navigation example">
            <ul class="pagination pagination-sm">
                <li class="page-item"><a class="page-link" href="ShopDoing.html?page=1">首页</a></li>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li class="page-item"><a class="page-link" href="ShopDoing.html?page=${pageInfo.pageNum-1}">上一页</a></li>
                </c:if>
                <c:if test="${pageInfo.pageNum>2&&pageInfo.pages>3}">
                    <li class="page-item"><a class="page-link" href="ShopDoing.html?page=1">1</a></li>
                </c:if>
                <c:if test="${pageInfo.pageNum>3}">
                    <li class="page-item"><a class="page-link" disabled>...</a></li>
                </c:if>
                <c:if test="${pageInfo.pageNum==pageInfo.pages&&pageInfo.pages>2}">
                    <li class="page-item"><a class="page-link" href="ShopDoing.html?page=${pageInfo.pageNum-2}">${pageInfo.pageNum-2}</a></li>
                </c:if>
                <c:if test="${pageInfo.pageNum>1}">
                    <li class="page-item"><a class="page-link" href="ShopDoing.html?page=${pageInfo.pageNum-1}">${pageInfo.pageNum-1}</a></li>
                </c:if>
                <c:if test="${pageInfo.pageNum!=null}">
                    <li class="page-item active"><a class="page-link" href="#">${pageInfo.pageNum}</a></li>
                </c:if>
                <c:if test="${pageInfo.pageNum+1<=pageInfo.pages}">
                    <li class="page-item"><a class="page-link" href="ShopDoing.html?page=${pageInfo.pageNum+1}">${pageInfo.pageNum+1}</a></li>
                </c:if>
                <c:if test="${pageInfo.pageNum==1&&pageInfo.pages>2}">
                    <li class="page-item"><a class="page-link" href="ShopDoing.html?page=${pageInfo.pageNum+2}">${pageInfo.pageNum+2}</a></li>
                </c:if>
                <c:if test="${pageInfo.pageNum+2<pageInfo.pages}">
                    <li class="page-item"><a class="page-link" disabled>...</a></li>
                </c:if>
                <c:if test="${pageInfo.pageNum+1<pageInfo.pages&&pageInfo.pages>3}">
                    <li class="page-item"><a class="page-link" href="ShopDoing.html?page=${pageInfo.pages}">${pageInfo.pages}</a></li>
                </c:if>
                <c:if test="${pageInfo.hasNextPage}">
                    <li class="page-item"><a class="page-link"
                                             href="ShopDoing.html?page=${pageInfo.pageNum+1}">下一页</a></li>
                </c:if>
                <li class="page-item"><a class="page-link" href="ShopDoing.html?page=${pageInfo.pages}">末页</a>
                </li>
            </ul>
        </nav>
    </div>
</div>

</body>
</html>
