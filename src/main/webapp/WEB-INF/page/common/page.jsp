<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<script src="${pageContext.request.contextPath}/static/js/pagination.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/page.css">
	<style>
		.page{
			width:1000px;
			margin:0 auto;
			overflow: hidden;
		}
		#d4,#d3{
			height:400px;
			width:500px;
			float:left;
			border:1px solid #efefef;
			box-sizing:border-box;
		}
		h3{
			text-align: center;
		}
		pre i{
			color:#999;
		}
	</style>
</head>
<body>
<div class="page">
	<div id="d2"><div class="page-contain"><a href="javascript:void(0);" class="goPre">&lt;</a><div class="page-box"><a href="javascript:void(0);" class="active ">1</a><a href="javascript:void(0);" class=" ">2</a><a href="javascript:void(0);" class=" ">3</a><a href="javascript:void(0);" class=" ">4</a><a href="javascript:void(0);" class=" ">5</a><a href="javascript:void(0);" class=" ">6</a><a href="javascript:void(0);" class=" ">7</a><a href="javascript:void(0);" class=" ">8</a><a href="javascript:void(0);" class=" page-next">9</a></div><a href="javascript:void(0);" class="goNext">&gt;</a></div></div>
</div>

<script>
	page({
		box:'d1',//存放分页的容器
		href:'#?page=',//跳转连接
		page:10,//当前页码 
		count:30,//总页数
		num:5,//页面展示的页码个数
	})
	document.getElementById('on').addEventListener('click',function(){
		var n = Number(document.getElementById('n').value);
		var m = Number(document.getElementById('m').value);
		var id = Number(document.getElementById('id').value);
		if(m<id){alert('当前页不能大于总页数')}
		else{
			page({
				box:'d1',//存放分页的容器
				href:'#?page=',//跳转连接
				page:id,//当前页码 
				count:m,//总页数
				num:n,//页面展示的页码个数
			})
		}	
	})
	page({
		box:'d2',//存放分页的容器
		count:20,//总页数
		num:9,//页面展示的页码个数
		step:6,//每次更新页码个数
		callBack:function(i){
			console.log(i);
			//点击页码的按钮发生回调函数一般都是操作ajax
		},
		pre:function(p){
			alert(p)
		},
		next:function(p){
			alert(p)
		}
	})
	page({
		box:'dd',//存放分页的容器
		count:20,//总页数
		num:6,//页面展示的页码个数
		step:4,//每次更新页码个数
		callBack:function(i){
			console.log(i);
			//点击页码的按钮发生回调函数一般都是操作ajax
		}
	})
	page({
		box:'dt',//存放分页的容器
		count:22,//总页数
		num:5,//页面展示的页码个数
		step:3,//每次更新页码个数
		callBack:function(i){
			console.log(i);
			//点击页码的按钮发生回调函数一般都是操作ajax
		}
	})
</script>	
</body>
</html>
