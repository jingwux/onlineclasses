<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>作业详情</title>
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
    	<span class="class_name">${exercise.ename}</span>
    </div>
    
    <div id="main_content">
    	
    	<!-- 作业div开始 -->
	    <div id="exercise_div">
	    	<div class="start_exercise">
	    		<form action="${pageContext.request.contextPath }/singleExercise?eid=${eid}&type=1&status=0&cid=${courseid}"  method="post" enctype="multipart/form-data">
		    		<ul>
		    			<input type="hidden" value="${eid}" id="eid"/>
		    			<li><span class="font_css">题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 目：</span><span class="font_css">${exercise.ename }</span><br/></li>
		    			<li><span class="font_css">截止时间：</span><span class="font_css">${exercise.endTime }</span><br/></li>
		    			<li><span class="font_css">作业要求：</span><span class="font_css">${exercise.demand }</span><br/></li>
		    			<li><span class="font_css">作业附件：</span><a href="${pageContext.request.contextPath }/download?fileName=${exercise.attachment }" class="a_css">${fn:split(exercise.attachment, "_")[1]} </a><br/></li>
		    			<c:choose>
	  						<c:when test="${exercise.status eq 1}">
	  							<li><textarea class="ckeditor" name="msg">${exercise.content }</textarea></li>
		    					<li><span class="font_css">上传附件：</span><input type="file" name="file" value="选择文件"/><br/>
		    					<a href=""><input type="submit" id="tempSave" value="暂存" class="finish"/></a><a href=""><input type="submit" id="save" value="提交" class="finish"/></a>
		    				</c:when>
							<c:otherwise>
								<li><textarea class="ckeditor" name="msg">${exercise.content }</textarea></li>
		    					<li><span class="font_css">附件：</span><a href="${pageContext.request.contextPath }/download?fileName=${exercise.attachment }" class="a_css">${exercisename}</a><br/></li>
							</c:otherwise>
						</c:choose>
		    		</ul>
	    		</form>
	    	</div>
	    </div>
	    <!-- 作业div结束 -->
	</div>
    
    
    <script>
    	$("#tempSave").click(function(){
			$("form").attr("action","${pageContext.request.contextPath }/singleExercise?type=1&status=1&eid="+$("#eid").val()+"&cid=${courseid}");
			$("form").attr("method","post");
			$("form").submit();
			alert("作业暂存成功！");
		});
		
		$("#save").click(function(){alert("作业提交成功！");});
    
    	$(".img_span img").mouseover(function(){
    		$(this).attr("src","${pageContext.request.contextPath }/static/img/leftarrow1.png");
    	});
    	
    	$(".img_span img").mouseout(function(){
    		$(this).attr("src","${pageContext.request.contextPath }/static/img/leftarrow.png");
    	});
    	
    	$(".img_span img").click(function(){
			history.back(-1);
    	});
    	
    	$(".start_exercise ul li:eq(4)").css("height","300px").css("width","1000px");
    	$(".start_exercise ul li:eq(5)").css("position","relative").css("top","50px");
    </script>
  </body>
</html>
