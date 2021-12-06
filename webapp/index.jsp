<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1"%>
<html>
<head>
	<title>Antenna商城登录</title>
	<script src="webjars/jquery/3.5.1/jquery.js"></script>
	<script src="webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
	<link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.css"/>
	<link rel="stylesheet" href="webjars/font-awesome/4.7.0/css/font-awesome.css"/>

</head>
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
			.login,.register,.shopfont{
				float: right;
				font-size: 20px;
				color: #6c6c6c;
				padding-right: 35px;
			}
			.login:hover,.register:hover,.shopfont:hover{
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
			/*主题标签*/
			#shopitems{
				margin-left: 15%;
				float: left;
				width: 10%;
				height: 450px;
				color: #599a63;
				border: 1px solid #cccccc;
			}
			#shopitems ul{
				margin-top: 22px;
			}
			#shopitems ul li{
				padding-top:8%;
				margin-left: -28%;
				padding-left: 23%;
				height: 50px;
				list-style: none;
			}
			#shopitems ul li:hover{

				background-color: #aabb99;
			}
			#shopitems ul li a{
				color: #666666;
				font-size: 18px;
			}
			#shopitems ul li a:hover{
				color: #e9eee0;
			}
			/* 轮播主题 */
			#myCarousel{
				float: left;
				width: 65%;
			}
			.carousel-item img{
				width: 100%;
				height: 450px;
			}
			/* 热销商品和最新商品 */
			.shopping{
				padding-top: 2%;
				width: 80%;
				clear: both;
				margin-left: 15%;
				height: 380px;
			}
			.shopping p{
				font-size: 30px;
				margin-left: 1.5%;
			}
			.shop{
				width: 14%;
				height: 200px;
				float: left;
				margin-left: 0.25%;
				margin-right: 1.5%;
			}
			.shop a:hover{
				text-decoration: none;
			}
			.shop a:hover div{
				color: #66aa55;
			}
			.shop img{
				width: 100%;
				height: 200px;
				border-radius: 10px 10px 10px 10px;
			}
			.shopname{
				text-align: center;
			}
			.shopname{
				margin-top: 10px;
				color:#555555;
				font-size: 18px;
				height: 55px;
				text-overflow:ellipsis;
				display: -webkit-box;
				-webkit-box-orient: vertical;
				-webkit-line-clamp: 2;
				overflow: hidden;
			}
			.shopprice{
				color: #999999;
				height: 30px;
				text-align: center;
			}
			/* vip商品 */
			.vipshop1,.vipshop2{
				float: left;
				height: 280px;
				margin-top: 3%;
			}
			.vipshop1{
				width: 45%;
				margin-left: 15%;
			}
			.vipshop2{
				width: 30%;
			}
			.vipshop1 img,.vipshop2 img{
				width: 100%;
				height: 100%;
			}
			img:hover
			{
				opacity:0.8;
			}
			/* 随机商品 */
			.randshop-item{
				width: 80%;
				clear: both;
				margin-left: 15%;
				height: 1000px;
			}
			.randshop{
				width: 14%;
				height: 300px;
				float: left;
				margin-left: 0.25%;
				margin-right: 1.5%;
			}
			.randshop p{
				font-size: 30px;
				margin-left: 1.5%;
			}
			.randshop a:hover{
				text-decoration: none;
			}
			.randshop a:hover div{
				color: #66aa55;
			}
			.randshop img{
				width: 100%;
				height: 200px;
				border-radius: 10px 10px 10px 10px;
			}
			/*页尾*/
			#end{
				color: #888888;
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
				margin-left: 9.6%;
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
				<a href="Gologin.html" class="shopfont">
				<i class="fa fa-shopping-cart" aria-hidden="true"></i> 
				<span>购物车</span>
				</a>
				<a href="register.jsp" class="register">
				<i class="fa fa-user-plus" aria-hidden="true"></i>
				<span>注册</span>
				</a>
				<a href="Gologin.html" class="login">
				<i class="fa fa-user-circle" aria-hidden="true"></i>
				<span>登录</span>
				</a>
		</div>
		<div id="SearchDiv">
			<div class="Search">
				<input type="text" name="search" class="Search-text"></input>
				<a href="Gologin.html"><button type="button" class="btn btn-success">搜索</button></a>
			</div>
		</div>
		<!--导航-->
		<div id="shopitems">		
			<ul>
				<h3>主题市场</h3>
				<li><a href="Gologin.html">男装</a>/<a href="Gologin.html">女装</a>/<a href="Gologin.html">童衣</a></li>
				<li><a href="Gologin.html">手机</a>/<a href="Gologin.html">电脑</a>/<a href="Gologin.html">数码</a></li>
				<li><a href="Gologin.html">家居</a>/<a href="Gologin.html">家具</a>/<a href="Gologin.html">家装</a></li>
				<li><a href="Gologin.html">食品</a>/<a href="Gologin.html">酒类</a>/<a href="Gologin.html">生鲜</a></li>
				<li><a href="Gologin.html">运动</a>/<a href="Gologin.html">户外</a>/<a href="Gologin.html">箱包</a></li>
				<li><a href="Gologin.html">图书</a>/<a href="Gologin.html">教育</a>/<a href="Gologin.html">文娱</a></li>
				<li><a href="Gologin.html">艺术</a>/<a href="Gologin.html">工具</a>/<a href="Gologin.html">生活</a></li>
			</ul>
		</div>
		<!--轮播-->
		<div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
			<!-- 轮播图片下圆点图标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ol>   
			<!--轮播图片主体-->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="Gologin.html"><img src="./Front-resources/img/lun1.jpg" class="mx-auto d-block img-fluid"></a>
					<div class="carousel-caption">
					</div>
				</div>
				<div class="carousel-item">
					<a href="Gologin.html"><img src="./Front-resources/img/lun2.jpg" class="mx-auto d-block img-fluid"></a>
					<div class="carousel-caption">
					</div>
				</div>
				<div class="carousel-item">
					<a href="Gologin.html"><img src="./Front-resources/img/lun3.jpg" class="mx-auto d-block img-fluid"></a>
					<div class="carousel-caption">
					</div>
				</div>
				<div class="carousel-item">
					<a href="Gologin.html"><img src="./Front-resources/img/lun4.jpg" class="mx-auto d-block img-fluid"></a>
					<div class="carousel-caption">
					</div>
				</div>
				<div class="carousel-item">
					<a href="Gologin.html"><img src="./Front-resources/img/lun5.jpg" class="mx-auto d-block img-fluid"></a>
					<div class="carousel-caption">
					</div>
				</div>
			</div>
		    <!--左右切换按钮-->
			<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a>
			<a class="carousel-control-next" href="#myCarousel" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>

		<!--热销商品-->
		<div class="shopping">
			<div><p>热销商品</p></div>
			<c:forEach items="${requestScope.get('selecthotshop')}" var="hotshop">
				<div class="shop">
					<a href="Gologin.html">
						<img src="./Front-resources/shopimg/${hotshop.photo}"/>
						<div class="shopname">${hotshop.shopname}</div>
					</a>
					<div class="shopprice">＄${hotshop.price}</div>
				</div>
			</c:forEach>
		</div>

		<!--vip商品-->
		<a href="Gologin.html"><div class="vipshop1"><img src="Front-resources/img/vip1.jpg"></div></a>
		<a href="Gologin.html"><div class="vipshop2"><img src="Front-resources/img/vip2.jpg"></div></a>

		<!--最新商品-->
		<div class="shopping">
			<c:forEach items="${requestScope.get('selectnewshop')}" var="newshop">
				<div class="shop">
					<a href="Gologin.html">
						<img src="./Front-resources/shopimg/${newshop.photo}"/>
						<div class="shopname">${newshop.shopname}</div>
					</a>
					<div class="shopprice">＄${newshop.price}</div>
				</div>
			</c:forEach>
		</div>


		<div class="randshop-item">
			<c:forEach items="${requestScope.get('selectrandshop')}" var="randshop">
				<div class="randshop">
					<a href="Gologin.html">
						<img src="./Front-resources/shopimg/${randshop.photo}"/>
						<div class="shopname">${randshop.shopname}</div>
					</a>
					<div class="shopprice">＄${randshop.price}</div>
				</div>
			</c:forEach>
		</div>

		<div id="end" class="text-center">
			<h1>----END----</h1>
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
						<li><a href="GoShoperlogin.html">卖家中心</a></li>
						<li><a href="#">帮助</a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
