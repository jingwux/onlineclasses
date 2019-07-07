<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>
<%response.setStatus(HttpServletResponse.SC_OK);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>500</title>
<link href="${pageContext.request.contextPath}/static/css/404.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$("#login_register").hide();
	$(function() {
		var h = $(window).height();
		$('body').height(h);
		$('.mianBox').height(h);
		centerWindow(".tipInfo");
	});

	//2.将盒子方法放入这个方，方便法统一调用
	function centerWindow(a) {
		center(a);
		//自适应窗口
		$(window).bind('scroll resize',
				function() {
					center(a);
				});
	}

	//1.居中方法，传入需要剧中的标签
	function center(a) {
		var wWidth = $(window).width();
		var wHeight = $(window).height();
		var boxWidth = $(a).width();
		var boxHeight = $(a).height();
		var scrollTop = $(window).scrollTop();
		var scrollLeft = $(window).scrollLeft();
		var top = scrollTop + (wHeight - boxHeight) / 2;
		var left = scrollLeft + (wWidth - boxWidth) / 2;
		$(a).css({
			"top": top,
			"left": left
		});
	}
</script>
</head>
<body>
<%@include file="header.jsp" %>
<div class="mianBox">
	<img src="${pageContext.request.contextPath}/static/img/yun0.png" alt="" class="yun yun0" />
	<img src="${pageContext.request.contextPath}/static/img/yun1.png" alt="" class="yun yun1" />
	<img src="${pageContext.request.contextPath}/static/img/yun2.png" alt="" class="yun yun2" />
	<img src="${pageContext.request.contextPath}/static/img/bird.png" alt="" class="bird" />
	<img src="${pageContext.request.contextPath}/static/img/san.png" alt="" class="san" />
	<div class="tipInfo">
		<div class="in">
			<div class="textThis">
				<h2>出错啦500！</h2>
				<p><span>点击<a id="href" href="${pageContext.request.contextPath}/index">跳转</a></span></p>
				<%--<p><span>页面自动<a id="href" href="${pageContext.request.contextPath}/indexp">跳转</a></span><span>等待<b id="wait">6</b>秒</span></p>
                                <script type="text/javascript">                            (function() {
                                    let time = $('#wait').html(), href = $('#href').attr("href");
                                    let interval = setInterval(function () {
                                        $('#wait').html(--time);
                                        if (time <= 0) {
                                            clearInterval(interval);
                                            location.href = href;
                                        }
                                    }, 1000);
                                    })();
                                </script>--%>
			</div>
		</div>
	</div>
</div>

</body>
</html>
