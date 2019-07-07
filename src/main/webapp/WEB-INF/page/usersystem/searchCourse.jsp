<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人主页</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/favicon.ico" type="image/x-icon"/>
  	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/myCourse.css">
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/css.css">
 	<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
	  <script type="text/javascript"
			  src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/plugins/layui/css/layui.css"
			media="all"/>
  </head>
  
  <body>
    <%@include file="../../page/common/header.jsp" %>

    <div id="myclass">
    	<div class="find_nav">
		    <div class="find_nav_left">
		        <div class="find_nav_list">
		            <ul>
		                <li class="find_nav_cur"><a href="javascript:void(0)">搜索结果</a></li>
		                <li class="sideline"></li>
		            </ul>
		        </div>
		    </div>
		</div>
    	<div id="best_class">
	    	<div id="best_class_content">
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach var="coursevo" items="${list}" varStatus="count">
							<div class="best_class_ctn">
								<div class="class_img">
									<img src="${pageContext.request.contextPath }/static/img/course/${coursevo.courseimg}" />
									<a href="${pageContext.request.contextPath }/course/courseDetail?cid=${coursevo.cid}"></a>
								</div>
								<div class="class_detail">
									<div><span class="" >${coursevo.cname}</span></div>
									<div><span class="">${coursevo.uname}</span></div>
									<div><span class="">更新：${coursevo.updatetime}</span></div>
									<div><span class="">访问：${coursevo.total}</span></div>
									<a href="${pageContext.request.contextPath }/course/view/${coursevo.cid}"><span class="layui-btn layui-btn-normal layui-btn-sm">课程详情</span></a>
								</div>
							</div>

						</c:forEach>
					</c:when>
					<c:otherwise>
						<div style="height:400px;width:600px">
							<span style="color:red;font-size:30">抱歉，未找到相关课程</span>
						</div>

					</c:otherwise>
				</c:choose>

	    	</div>
	    </div>


    </div>
    
    <%@include file="../../page/common/footer.jsp"%>
    <script>
    	$(".class_name").text().slice(0,5)+"...";
    	
    	$(function(){
		    $(".find_nav_list").css("left",sessionStorage.left+"px");
		    $(".find_nav_list li").each(function(){
		        if($(this).find("a").text()==sessionStorage.pagecount){
		            $(".sideline").css({left:$(this).position().left});
		            $(".sideline").css({width:$(this).outerWidth()});
		            $(this).addClass("find_nav_cur").siblings().removeClass("find_nav_cur");
		            navName(sessionStorage.pagecount);
		            return false
		        }
		        else{
		            $(".sideline").css({left:0});
		            $(".find_nav_list li").eq(0).addClass("find_nav_cur").siblings().removeClass("find_nav_cur");
		        }
		    });
		    var nav_w=$(".find_nav_list li").first().width();
		    $(".sideline").width(nav_w);
		    $(".find_nav_list li").on('click', function(){
		        nav_w=$(this).width();
		        $(".sideline").stop(true);
		        $(".sideline").animate({left:$(this).position().left},300);
		        $(".sideline").animate({width:nav_w});
		        $(this).addClass("find_nav_cur").siblings().removeClass("find_nav_cur");
		        var fn_w = ($(".find_nav").width() - nav_w) / 2;
		        var fnl_l;
		        var fnl_x = parseInt($(this).position().left);
		        if (fnl_x <= fn_w) {
		            fnl_l = 0;
		        } else if (fn_w - fnl_x <= flb_w - fl_w) {
		            fnl_l = flb_w - fl_w;
		        } else {
		            fnl_l = fn_w - fnl_x;
		        }
		        $(".find_nav_list").animate({
		            "left" : fnl_l
		        }, 300);
		        sessionStorage.left=fnl_l;
		        var c_nav=$(this).find("a").text();
		        navName(c_nav);
		    });
		    var fl_w=$(".find_nav_list").width();
		    var flb_w=$(".find_nav_left").width();
		    $(".find_nav_list").on('touchstart', function (e) {
		        var touch1 = e.originalEvent.targetTouches[0];
		        x1 = touch1.pageX;
		        y1 = touch1.pageY;
		        ty_left = parseInt($(this).css("left"));
		    });
		    $(".find_nav_list").on('touchmove', function (e) {
		        var touch2 = e.originalEvent.targetTouches[0];
		        var x2 = touch2.pageX;
		        var y2 = touch2.pageY;
		        if(ty_left + x2 - x1>=0){
		            $(this).css("left", 0);
		        }else if(ty_left + x2 - x1<=flb_w-fl_w){
		            $(this).css("left", flb_w-fl_w);
		        }else{
		            $(this).css("left", ty_left + x2 - x1);
		        }
		        if(Math.abs(y2-y1)>0){
		            e.preventDefault();
		        }
		    });
		});

		
		function createAjax(){
	   		var ajax = null;
	   		
	   		try{
	   			ajax = new ActiveXObject("microsoft.xmlhttp");
	   		} catch(e){
	   			ajax = new XMLHttpRequest();
	   		}
	   		return ajax;
	   	
	   	};
	   	
		//onload = loadCourse(1); //进入页面加载用户当前所学课程
		$("#historyCourse").click(function(){loadCourse(0);}); //点击历史课程方法
		$(".find_nav_cur").click(function(){loadCourse(1);}); //点击我的课程方法

    </script>
  </body>
</html>
