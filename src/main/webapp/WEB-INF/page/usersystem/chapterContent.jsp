<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${littleChapter } ${chapterName }</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/js/plugins/ckeditor/samples/sample.css">
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/chapterContent.css">
 	<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
 	
	<script src="${pageContext.request.contextPath }/static/js/plugins/ckeditor/ckeditor.js"></script>
  </head>
  
  <body>
    <div id="title_css">
    	<span class="img_span"><img src="${pageContext.request.contextPath }/static/img/leftarrow.png"/></span>
    	<span class="class_name">${chapterName }<span class="chapter_name">${littleChapter }</span></span>
    </div>
    
    <div id="main_content">
    	
    	<!-- 章节内容div开始 -->
    	<div id="chapter">
	    	<div id="chapter_content">
	    	<div id="chapter_title">${littleChapter }</div>
				<pre>
${chapterContent }
				</pre>
	    	</div>
	    </div>
    	<!-- 章节内容div结束 -->
	</div>
    
    
    <script>
    	$(".img_span img").mouseover(function(){
    		$(this).attr("src","${pageContext.request.contextPath }/static/img/leftarrow1.png");
    	});
    	
    	$(".img_span img").mouseout(function(){
    		$(this).attr("src","${pageContext.request.contextPath }/static/img/leftarrow.png");
    	});
    	
    	$(".img_span img").click(function(){
			history.back(-1);
    	});
    	
    	$(".start_exercise ul li:eq(3)").css("height","300px").css("width","1000px");
    	$(".start_exercise ul li:eq(4)").css("position","relative").css("top","50px");
    </script>
  </body>
</html>
