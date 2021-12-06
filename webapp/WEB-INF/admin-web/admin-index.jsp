<%--
  Created by IntelliJ IDEA.
  User: 86188
  Date: 2021/5/2
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <title>后台管理系统</title>
    <script src="webjars/jquery/3.5.1/jquery.js"></script>
    <script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <style type="text/css">
        *{
            margin: 0 auto;
            padding: 0;
        }
        .items{
            height:180px;
            font-size:30px;
            font-weight:bold;
            color:#FFF;
            background-color:#406040;
            padding-top:50px;
            padding-left: 80px;
        }
        #adminitems{
            width: 100%;
            height: 968px;
            border-top: 1px solid #406040;
            border-bottom: 1px solid #406040;
        }
        #adminitem{
            width:20%;
            height:100%;
            float:left;
            background-color:#809080;
        }
        #adminitem ul{
            margin-top: -16px;
        }
        #adminitem ul li{
            font-size:20px;
            color:#FFF;
            padding-top: 25px;
            padding-bottom:30px;
            padding-left: 80px;
            list-style: none;
        }
        #adminitem ul li:hover{
            background-color: #607060;
        }
        #adminitem a{
            text-decoration:none;
            color:#FFF;
        }
        #itemuse{
            width:80%;
            height: 100%;
            background-color: #FFFFFF;
            float:left;
        }
    </style>
</head>
<body>
<div id="adminitems">
    <div id="adminitem">
        <p class="items">后台管理系统</p>

        <ul>
            <a href="UserDoing.html" target="if"><li>用户管理</li></a>
            <a href="ShopDoing.html" target="if"><li>商品管理</li></a>
            <a href="alluser.jsp" target="if"><li>交易管理</li></a>
            <a href="http://www.baidu.com" target="if"><li>百度一下</li></a>
        </ul>
    </div>
    <div id="itemuse">
        <iframe class="if" name="if" width="100%" height="100%"  frameBorder="0" src="UserDoing.html">

        </iframe>
    </div>
</div>
</body>
</html>
