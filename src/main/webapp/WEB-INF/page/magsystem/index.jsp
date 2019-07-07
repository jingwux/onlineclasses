<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>团子课堂后台管理系统</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon" />

		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/global.css" media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/fonts/font-awesome/css/font-awesome.min.css">

	</head>

	<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">团子课堂后台管理系统</div>
			
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
					<a href="javascript:;">
						<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
						${admin.aname}
					</a>
					<dl class="layui-nav-child">
						<dd><a href="">基本资料</a></dd>
						<dd><a href="">安全设置</a></dd>
						<dd><a href="${pageContext.request.contextPath}/exit">注销</a></dd>
					</dl>
				</li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side">

			</div>
		</div>
		<div class="layui-body" style="height: calc(100% - 60px);">
			<!-- 内容主体区域 -->
			<div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
				<div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
					<div class="layui-tab-item layui-show" style="height: 100%;">
						<iframe src="findCourse" id="iframe-box"></iframe>
					</div>
				</div>
			</div>
		</div>

		<%--<div class="layui-footer">
			<!-- 底部固定区域 -->
			© lyl.com - 底部固定区域
		</div>--%>
	</div>
		<%--<div class="layui-layout layui-layout-admin" style="border-bottom: solid 5px #3a9f05;">
			<div class="layui-header header header-demo">
				<div class="layui-main">
					<div class="admin-login-box">
						<a class="logo" style="left: 0;" href="index">
							<div >
								<img src="${pageContext.request.contextPath }/static/logo3.svg" style="width: 200px;height: 180px;margin-top: -82px;"/>
							</div>
						</a>
						<div class="admin-side-toggle">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>
						<div class="admin-side-full">
							<i class="fa fa-life-bouy" aria-hidden="true"></i>
						</div>
					</div>
					<ul class="layui-nav admin-header-item">
						&lt;%&ndash;<li class="layui-nav-item">
							<a href="javascript:;">清除缓存</a>
						</li>
						<li class="layui-nav-item">
							<a href="javascript:;">浏览网站</a>
						</li>
						<li class="layui-nav-item" id="video1">
							<a href="javascript:;">视频</a>
						</li>&ndash;%&gt;
						<li class="layui-nav-item">
							<c:choose>
						  		<c:when test="${admin ne null}">
						  			<a href="javascript:;" class="admin-header-user">
										<img src="${pageContext.request.contextPath}/static/img/${admin.headimg eq null ? "headimgs.jpg" : user.headimg}" />
										<span>${sessionScope.admin.aname}</span>
									</a>
						  		</c:when>
								<c:otherwise>
									<a href="javascript:;" class="admin-header-user">
										<img src="${pageContext.request.contextPath}/static/img/${user.headimg eq null ? "headimgs.jpg" : user.headimg}" />
										<span>${sessionScope.user.aname}</span>
									</a>
					    		</c:otherwise>
						    </c:choose>
							
							<dl class="layui-nav-child" style="left: 0px; width: 150px;">
								<dd style="margin-left: 0px">
									<a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
								</dd>
								<dd style="margin-left: 0px">
									<a href="javascript:;"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
								</dd>
								<dd id="lock" style="margin-left: 0px">
									<a href="javascript:;">
										<i class="fa fa-lock" aria-hidden="true" style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
									</a>
								</dd>
								<dd style="margin-left: 0px">
									<a href="${pageContext.request.contextPath}/exit"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
								</dd>
							</dl>
						</li>
					</ul>
					<ul class="layui-nav admin-header-item-mobile">
						<li class="layui-nav-item">
							<a href="login.html"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="layui-side layui-bg-black" id="admin-side">
				<div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>
			</div>
			<div class="layui-body" style="bottom: 0;border-left: solid 2px #3a9f05;" id="admin-body">
				<div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
					<ul class="layui-tab-title">
						<li class="layui-this">
							<i class="fa fa-dashboard" aria-hidden="true"></i>
							<cite>DashBoard</cite>
						</li>
					</ul>
					<div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
						<div class="layui-tab-item layui-show">
							<iframe src="findCourse"></iframe>
						</div>
					</div>
				</div>
			</div>

			<div class="site-tree-mobile layui-hide">
				<i class="layui-icon">&#xe602;</i>
			</div>
			<div class="site-mobile-shade"></div>
			
			<!--锁屏模板 start-->
			<script type="text/template" id="lock-temp">
				<div class="admin-header-lock" id="lock-box">
					<div class="admin-header-lock-img">
						<img src="${pageContext.request.contextPath}/static/img/0.jpg"/>
					</div>
					<div class="admin-header-lock-name" id="lockUserName">beginner</div>
					<input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd" />
					<button class="layui-btn layui-btn-small" id="unlock">解锁</button>
				</div>
			</script>
			<!--锁屏模板 end -->
			
			<script>
				layui.use('layer', function() {
					var $ = layui.jquery,
						layer = layui.layer;

					$('#video1').on('click', function() {
						layer.open({
							title: 'YouTube',
							maxmin: true,
							type: 2,
							content: 'video.html',
							area: ['800px', '500px']
						});
                    });
                    $('#pay').on('click', function () {
                        layer.open({
                            title: false,
                            type: 1,
                            content: '<img src="${pageContext.request.contextPath}/static/img/xx.png" />',
                            area: ['500px', '250px'],
                            shadeClose: true
                        });
                    });


				});
			</script>
		</div>--%>
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/layui/layui.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/index.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/datas/nav.js"></script>

</html>