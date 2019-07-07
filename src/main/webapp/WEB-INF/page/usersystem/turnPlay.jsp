 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link rel="stylesheet" href="static/js/plugins/bootstrap/css/bootstrap.min.css">
	<script src="static/js/plugins/jquery/jquery-3.2.1.min.js"></script>
	<script src="static/js/plugins/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<div id="myCarousel" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
		<li data-target="#myCarousel" data-slide-to="4"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner" >
		<div class="item active">
			<a href="${pageContext.request.contextPath }/course/view/1526285472042"><img src="${pageContext.request.contextPath }/static/img/slide1.jpg" alt="First slide" ></a>
		</div><!-- tid=55 --><!--  -->
		<div class="item">
			<a href="${pageContext.request.contextPath }/course/view/1526601415368"><img src="${pageContext.request.contextPath }/static/img/slide2.jpg" alt="Second slide"></a>
		</div><!-- tid=55 -->
		<div class="item">
			<a href="${pageContext.request.contextPath }/course/view/1526285560572"><img src="${pageContext.request.contextPath }/static/img/slide3.jpg" alt="Third slide"></a>
		</div><!-- tid=53 -->
		<div class="item">
			<a href="${pageContext.request.contextPath }/course/view/1526560766580"><img src="${pageContext.request.contextPath }/static/img/slide4.jpg" alt="Forth slide"></a>
		</div><!-- tid=52 -->
		<div class="item">
			<a href="${pageContext.request.contextPath }/course/view/1526285503832"><img src="${pageContext.request.contextPath }/static/img/slide5.jpg" alt="Fifth slide"></a>
		</div><!-- tid=51 -->
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="carousel-control left" href="#myCarousel" 
	   data-slide="prev"  style="">&lsaquo;</a>
	<a class="carousel-control right" href="#myCarousel" 
	   data-slide="next">&rsaquo;</a>
</div> 

</body>
<script type="text/javascript">
	$("#myCarousel").carousel("cycle");
</script>
</html> 