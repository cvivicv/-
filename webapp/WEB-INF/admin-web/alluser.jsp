<%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/6/7
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<html>
<head>
    <title>用户信息查询</title>
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
            background-color: #406040;
        }
        #user-site{
            margin-right: 1%;
            margin-top: 5px;
            float: right;
        }
        #UserAdd{
            font-size:18px;
            font-weight: 0;
            color: #000000;
        }
        .table{
            margin-top: -8px;
        }
        .table tr{
            height: 80px;
        }
        .row{
            height: 100px;
        }
    </style>
</head>
<body>
    <h1>用户信息查询
        <!--添加-->
        <a href="#UserAdd" class="btn btn-success" data-toggle="modal" id="user-site">添加</a>
            <!-- 用户添加框 -->
            <div class="modal fade" id="UserAdd">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">用户添加</h4>
                            <button type="button" class="close" data-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="UserAdd.html">
                                <input type="text" class="form-control" id="page" name="page" value="${pageInfo.pageNum}" hidden/>
                                    <!-- 添加信息 -->
                                    <div class="form-group col-sm-9">
                                        <label for="userid">用户ID:</label>
                                        <input type="text" class="form-control" id="userid" name="userid"/>
                                    </div>
                                    <div class="form-group col-sm-9">
                                        <label for="username">用户名:</label>
                                        <input type="text" class="form-control" id="username" name="username" maxlength="20"/>
                                    </div>
                                    <div class="form-group col-sm-9">
                                        <label for="password">密码:</label>
                                        <input type="password" class="form-control" id="password"  name="password" maxlength="60"/>
                                    </div>
                                    <div class="form-group col-sm-9">
                                        <label for="email">邮箱:</label>
                                        <input type="input" class="form-control" id="email" name="email" maxlength="30"/>
                                    </div>
                                    <input type="submit" value="提交" class="btn-lg btn-primary"/>
                             </form>
                        </div>
                    </div>
                </div>
            </div>
    </h1>

    <table class="table table-bordered table-hover">
        <thead class="table-success">
        <tr>
            <th>用户ID</th>
            <th>用户名</th>
            <th>密码</th>
            <th>邮箱</th>
            <th>创建时间</th>
            <th>用户金额</th>
            <th>用户操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="user">
            <tr>
                <td>${user.userid}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.email}</td>
                <td>${user.cometime}</td>
                <td>${user.money}</td>
                <td>
                    <a href="MoreUserDoing.html?event=oneuser&userid=${user.userid}&page=${requestScope.page}"><button class="btn btn-sm btn-primary">修改</button></a>
                    <a href="MoreUserDoing.html?event=deleteuser&userid=${user.userid}&page=${requestScope.page}" onclick="return confirm('确定将此用户删除?')"><button class="btn btn-sm btn-danger">删除</button></a>
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
