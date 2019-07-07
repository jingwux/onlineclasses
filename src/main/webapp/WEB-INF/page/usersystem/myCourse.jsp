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


    <div id="myclass" style="min-height: 800px;">
    	<div class="find_nav">
		    <div class="find_nav_left">
		        <div class="find_nav_list">
		            <ul>
		                <li class="find_nav_cur"><a href="javascript:void(0)">我的课程</a></li>
		                <li class="sideline"></li>
		            </ul>
		        </div>
		    </div>
		</div>
    	<div id="best_class">
	    	<div id="best_class_content">
				<c:forEach var="coursevo" items="${list}" varStatus="count">
	    		<div class="best_class_ctn">
					<div class="class_img">
						<img src="../static/img/best1.jpg" />
						<a href="${pageContext.request.contextPath }/course/courseDetail?cid=${coursevo.cid}"></a>
					</div>
					<div class="class_detail">
						<div><span class="" >${coursevo.cname}</span></div>
						<div><span class="">${coursevo.uname}</span></div>
						<div><span class="">更新：${coursevo.updatetime}</span></div>
						<div><span class="">访问：${coursevo.total}</span></div>
						<a href=""><span class="layui-btn layui-btn-normal layui-btn-sm">课程详情</span></a>
					</div>
				</div>
	    		<%--<div class="best_class_ctn"><img src="../static/img/best2.jpg"/><span class="class_name">数据库原理</span><span class="teacher_name">李昊昱</span><br/><span class="update_time">更新：2018-03-12</span><span class="total_num">访问：326</span><a href=""><span class="enter_class">课程互动</span></a></div>--%>
	    		<%--<div class="best_class_ctn"><img src="../static/img/best3.jpg"/><span class="class_name">数据库原理</span><span class="teacher_name">李昊昱</span><br/><span class="update_time">更新：2018-03-12</span><span class="total_num">访问：326</span><a href=""><span class="enter_class">课程互动</span></a></div>--%>
	    		<%--<div class="best_class_ctn"><img src="../static/img/best4.jpg"/><span class="class_name">数据库原理</span><span class="teacher_name">李昊昱</span><br/><span class="update_time">更新：2018-03-12</span><span class="total_num">访问：326</span><a href=""><span class="enter_class">课程互动</span></a></div>--%>
	    		<%--<div class="best_class_ctn"><img src="../static/img/best5.jpg"/><span class="class_name">数据库原理</span><span class="teacher_name">李昊昱</span><br/><span class="update_time">更新：2018-03-12</span><span class="total_num">访问：326</span><a href=""><span class="enter_class">课程互动</span></a></div>--%>
	    		<%--<div class="best_class_ctn"><img src="../static/img/best1.jpg"/><span class="class_name">数据库原理</span><span class="teacher_name">李昊昱</span><br/><span class="update_time">更新：2018-03-12</span><span class="total_num">访问：326</span><a href=""><span class="enter_class">课程互动</span></a></div>--%>
	    		<%--<div class="best_class_ctn"><img src="../static/img/best2.jpg"/><span class="class_name">数据库原理</span><span class="teacher_name">李昊昱</span><br/><span class="update_time">更新：2018-03-12</span><span class="total_num">访问：326</span><a href=""><span class="enter_class">课程互动</span></a></div>--%>
	    		<%--<div class="best_class_ctn"><img src="../static/img/best3.jpg"/><span class="class_name">数据库原理</span><span class="teacher_name">李昊昱</span><br/><span class="update_time">更新：2018-03-12</span><span class="total_num">访问：326</span><a href=""><span class="enter_class">课程互动</span></a></div>--%>
	    		<%--<div class="best_class_ctn"><img src="../static/img/best4.jpg"/><span class="class_name">数据库原理</span><span class="teacher_name">李昊昱</span><br/><span class="update_time">更新：2018-03-12</span><span class="total_num">访问：326</span><a href=""><span class="enter_class">课程互动</span></a></div>--%>
				</c:forEach>
	    	</div>
	    </div>

	   <%--  <div id="page">
			当前${requestScope.pageBean.currentPage }/${requestScope.pageBean.totalPage }页     &nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/music?musicName=${requestScope.music.musicName}&currentPage=1">首页</a>
			<a href="${pageContext.request.contextPath }/music?musicName=${requestScope.music.musicName}&currentPage=${requestScope.pageBean.currentPage-1}">上一页 </a>
			<a href="${pageContext.request.contextPath }/music?musicName=${requestScope.music.musicName}&currentPage=${requestScope.pageBean.currentPage+1}">下一页 </a>
			<a href="${pageContext.request.contextPath }/music?musicName=${requestScope.music.musicName}&currentPage=${requestScope.pageBean.totalPage}">末页</a>
  		</div> --%>
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
		function navName(c_nav) {
		    switch (c_nav) {
		        case "资讯":
		            sessionStorage.pagecount = "资讯";
		            break;
		        case "分析":
		            sessionStorage.pagecount = "分析";
		            break;
		        case "黄页":
		            sessionStorage.pagecount = "黄页";
		            break;
		        case "技术":
		            sessionStorage.pagecount = "技术";
		            break;
		        case "项目":
		            sessionStorage.pagecount = "项目";
		            break;
		        case "股市":
		            sessionStorage.pagecount = "股市";
		            break;
		        case "原创":
		            sessionStorage.pagecount = "原创";
		            break;
		        case "经济":
		            sessionStorage.pagecount = "经济";
		            break;
		        case "评论":
		            sessionStorage.pagecount = "评论";
		            break;
		    }
		}
		
		function createAjax(){
	   		var ajax = null;
	   		
	   		try{
	   			ajax = new ActiveXObject("microsoft.xmlhttp");
	   		} catch(e){
	   			ajax = new XMLHttpRequest();
	   		}
	   		return ajax;
	   	
	   	};
	   	
		onload = loadCourse(1); //进入页面加载用户当前所学课程
		$(".find_nav_cur").click(function(){loadCourse(1);}); //点击我的课程方法

        function loadCourse(status){

			$.ajax({
				url: "${pageContext.request.contextPath}/user/index/myIndex",
				success: function (data) {
					if (data.success) {
						var jsonData = data.data;
						var odiv = $("#best_class_content");
						var divStr = "";
						for (var i = 0; i < jsonData.length; i++) {
							divStr += " <div class=\"best_class_ctn\">\n" +
									"     <div class=\"class_img\">\n" +
									"         <a href='${pageContext.request.contextPath}/course/courseDetail?cid=" + jsonData[i].cid + "'><img src=\"${pageContext.request.contextPath}/static/img/course/" + jsonData[i].courseimg + "\"></a>\n" +
									"     </div>\n" +
									"     <div class=\"class_detail\">\n" +
									"         <div class=\"layui-elip\"><span title='" + jsonData[i].cname + "'>" + jsonData[i].cname + "</span></div>\n" +
									"         <div><span>" + jsonData[i].uname + "</span></div>\n" +
									"         <div><span>更新：" + jsonData[i].updatetime + "</span></div>\n" +
									"         <div><span>访问：" + (jsonData[i].total==null?0:jsonData[i].total) + "</span></div>\n" +
									"         <div><a href='${pageContext.request.contextPath}/course/courseDetail?cid=" + jsonData[i].cid + "' class=\"layui-btn layui-btn-normal layui-btn-sm\"><span>查看详情</span></a></div>\n" +
									"     </div>\n" +
									" </div>";
						}
						odiv.html("");
						odiv.append(divStr);
					}
				}
			});

        }
    </script>
  </body>
</html>
