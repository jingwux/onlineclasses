<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>全部课程</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/chooseClass.css">
 	<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
  </head>
  
  <body>
    <%@include file="../../page/common/header.jsp"%>
    <!-- 菜单开始 -->
    <div id="class_kind">
    	<div class="class_kind_class">
    		<span class="kind_span_class" id="class_kind_class1">方向：</span>
    		<div class="classification">
	    		<ul>
	    			<li><a href="#" id="0">全部</a></li>
	    			<c:forEach var="parType"   items="${parTypeList}"   varStatus="count">
						<li><a href="javascript:void(0);" id="${parType.typeId}">${parType.ctname}</a></li>
	    			</c:forEach>
	    		</ul>
    		</div>
    	</div>
    	<div class="class_kind_class"><span class="kind_span_class1">分类：</span>
    		<div class="classification1">
	    		<ul>
	    			<li><a href="#" id="0">全部</a></li>
	    			<c:forEach var="typeList"   items="${typeList}"   varStatus="count">
						<li><a href="#" id="${typeList.typeId}">${typeList.ctname}</a></li>
	    			</c:forEach>
	    		</ul>
    		</div>
    	</div>
    	<!-- <div class="class_kind_class" id="class_kind_class3"><span class="kind_span_class1">类型：</span>
    		<div class="classification">
	    		<ul>
	    			<li><a href="#">全部</a></li>
	    			<li><a href="#">前端开发</a></li>
	    			<li><a href="#">后端开发</a></li>
	    			<li><a href="#">移动开发</a></li>
	    		</ul>
    		</div>
    	</div> -->
    </div>
    <!-- 菜单结束 -->
    
    <div id="title_btn">
   		<ul>
   			<li><a href="" id="new">最新</a></li>
   			<li><a href="" id="hot">最热</a></li>
   		</ul>
   	</div>
    <div id="class_div">
    	<!-- 精品课程开始 -->
	    <div id="best_class">
	    	<div id="best_class_content">
	    		<c:forEach var="course" items="${courseList}" varStatus="count">
	    			<div class="best_class_ctn"><img src="${pageContext.request.contextPath }/image/${course.courseImg }"/><a href="${pageContext.request.contextPath }/course?cid=${course.cid}"><br/><span class="class_title">${course.cname }</span></a><br/><span class="best_class_title">${course.intro }</span></div>
	    		</c:forEach>
	    	</div>
	    	<%-- <div id="pageDiv">
				当前${requestScope.pageBean.currentPage }/${requestScope.pageBean.totalPage }页     &nbsp;&nbsp;
				<a href="${pageContext.request.contextPath }/music?musicName=${requestScope.music.musicName}&currentPage=1">首页</a>
				<a href="${pageContext.request.contextPath }/music?musicName=${requestScope.music.musicName}&currentPage=${requestScope.pageBean.currentPage-1}">上一页 </a>
				<a href="${pageContext.request.contextPath }/music?musicName=${requestScope.music.musicName}&currentPage=${requestScope.pageBean.currentPage+1}">下一页 </a>
				<a href="${pageContext.request.contextPath }/music?musicName=${requestScope.music.musicName}&currentPage=${requestScope.pageBean.totalPage}">末页</a>
  				<%@include file="../page/common/page.jsp" %>
  			</div> --%>
	    </div>
	    <!-- 精品课程结束 -->
    </div>
    
    <div id="footer">
    	<%@include file="../../page/common/footer.jsp"%>
    </div>
    <script>
    	/* $(".classification ul li:eq(0),.classification1 ul li:eq(0)").css("background-color", "#2b333b");
    	$(".classification ul li:eq(0) a,.classification1 ul li:eq(0) a").css("color","#fff"); */
    	$(".classification ul li").click(function(){
    		//if($(this).index() != 0){
    			var ajax = createAjax();
		   		ajax.open("POST", "${pageContext.request.contextPath}/chooseClass?typeId="+$(this).find("a").attr("id")+"&flag=1");
		   		ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
		   		ajax.send();
		   		ajax.onreadystatechange = function(){
	   				if(ajax.readyState == 4 && ajax.status == 200){
		   				var javaJson = ajax.responseText;
		   				var jsonData = eval("("+javaJson+")");
		   				
		   				var oul = $(".classification1 ul");
		   				var liStr = "<li><a href=\"#\">全部</a></li>";
		   				
		   				for(var h=0; h<jsonData[0].length; h++){
		   					liStr += "<li><a href=\"javascript:void(0)\" id=\""+jsonData[0][h].typeId+"\">"+jsonData[0][h].ctname+"</a></li>";
		   				}
		   				oul.html("");
		   				oul.append(liStr);
		   				
		   				$(".classification1 ul li:eq(0)").css("background-color", "#2b333b");
		   				$(".classification1 ul li:eq(0) a").css("color","#fff");
		   				$(".classification1 ul li").click(function(){
				    		for(var i=0; i<$(".classification1 ul li").length; i++){
				    			if($(this).index() == i){
				    				$(".classification1 ul li:eq("+i+")").css("background-color", "#2b333b");
				    				$(".classification1 ul li:eq("+i+")").find("a").css("color","#fff");
				    			}else{
				    				$(".classification1 ul li:eq("+i+")").css("background-color", "#fff");
				    				$(".classification1 ul li:eq("+i+")").find("a").css("color","#2b333b");
				    			}
				    		}
						});
						
	   				}
	   			};
	    		
	    		for(var i=0; i<$(".classification ul li").length; i++){
	    			if($(this).index() == i){
	    				$(".classification ul li:eq("+i+")").css("background-color", "#2b333b");
	    				$(".classification ul li:eq("+i+")").find("a").css("color","#fff");
	    			}else{
	    				$(".classification ul li:eq("+i+")").css("background-color", "#fff");
	    				$(".classification ul li:eq("+i+")").find("a").css("color","#2b333b");
	    			}
	    		}
	    		
    		//}
		});
		
		function typeClick1(obj){
			for(var i=0; i<$(".classification ul li").length; i++){
    			if(obj == i){
    				$(".classification ul li:eq("+i+")").css("background-color", "#2b333b");
    				$(".classification ul li:eq("+i+")").find("a").css("color","#fff");
    			}else{
    				$(".classification ul li:eq("+i+")").css("background-color", "#fff");
    				$(".classification ul li:eq("+i+")").find("a").css("color","#2b333b");
    			}
    		}
		};
		
		$(".classification1 ul li").click(function(){
			var ajax = createAjax();
	   		ajax.open("POST", "${pageContext.request.contextPath}/chooseClass?typeId="+$(this).find("a").attr("id")+"&flag=2");
	   		ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
	   		ajax.send();
	   		ajax.onreadystatechange = function(){
   				if(ajax.readyState == 4 && ajax.status == 200){
	   				var javaJson = ajax.responseText;
	   				var jsonData = eval("("+javaJson+")");
	   				
	   				var odiv = $("#best_class_content");
	   				var divStr = "";
	   				for(var h=0; h<jsonData[0].length; h++){
		   				divStr += "<div class=\"best_class_ctn\"><img src=\"${pageContext.request.contextPath }/image/"+jsonData[0][h].courseImg+"\"/><a href=\"${pageContext.request.contextPath }/course?cid="+jsonData[0][h].cid+"\"><br/><span class=\"class_title\">"+jsonData[0][h].cname+"</span></a><br/><span class=\"best_class_title\">"+jsonData[0][h].intro+"</span></div>";
		   			}
		   			odiv.html("");
		   			odiv.append(divStr);
		   			$(".best_class_title").text().slice(0,5)+"...";
	   			}
	   		};
			
    		for(var i=0; i<$(".classification1 ul li").length; i++){
    			if($(this).index() == i){
    				$(".classification1 ul li:eq("+i+")").css("background-color", "#2b333b");
    				$(".classification1 ul li:eq("+i+")").find("a").css("color","#fff");
    			}else{
    				$(".classification1 ul li:eq("+i+")").css("background-color", "#fff");
    				$(".classification1 ul li:eq("+i+")").find("a").css("color","#2b333b");
    			}
    		}
		});
		
		function typeClick(obj){
			for(var i=0; i<$(".classification1 ul li").length; i++){
    			if(obj == i){
    				$(".classification1 ul li:eq("+i+")").css("background-color", "#2b333b");
    				$(".classification1 ul li:eq("+i+")").find("a").css("color","#fff");
    			}else{
    				$(".classification1 ul li:eq("+i+")").css("background-color", "#fff");
    				$(".classification1 ul li:eq("+i+")").find("a").css("color","#2b333b");
    			}
    		}
		}
		
		onload = function(){
			var type = ${type};
			var parType = ${parType};
			typeClick($("a[id='"+type+"'").parent().index());
			typeClick1($("a[id='"+parType+"'").parent().index());
			if(window.location.search.indexOf("info") == -1){
				var ajax = createAjax();
		   		ajax.open("POST", "${pageContext.request.contextPath}/chooseClass?typeId="+type+"&flag=2");
		   		ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
		   		ajax.send();
		   		ajax.onreadystatechange = function(){
	   				if(ajax.readyState == 4 && ajax.status == 200){
		   				var javaJson = ajax.responseText;
		   				var jsonData = eval("("+javaJson+")");
		   				
		   				var odiv = $("#best_class_content");
		   				var divStr = "";
		   				for(var h=0; h<jsonData[0].length; h++){
			   				divStr += "<div class=\"best_class_ctn\"><img src=\"${pageContext.request.contextPath }/image/"+jsonData[0][h].courseImg+"\"/><a href=\"${pageContext.request.contextPath }/course?cid="+jsonData[0][h].cid+"\"><br/><span class=\"class_title\">"+jsonData[0][h].cname+"</span></a><br/><span class=\"best_class_title\">"+jsonData[0][h].intro+"</span></div>";
			   			}
			   			odiv.html("");
			   			odiv.append(divStr);
		   			}
		   		};
			}
		};
		
		function createAjax(){
	   		var ajax = null;
	   		
	   		try{
	   			ajax = new ActiveXObject("microsoft.xmlhttp");
	   		} catch(e){
	   			ajax = new XMLHttpRequest();
	   		}
	   		return ajax;
   		};
   		
    </script>
  </body>
</html>
