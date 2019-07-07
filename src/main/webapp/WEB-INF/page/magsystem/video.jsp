<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style>
			.video{
				width: 70%;
				height: 40%;
				padding-bottom: 40px;
				z-index: 0;
				margin-left:200px;
			}
			.nv{
				display: block;
				height: 60px;
				line-height: 60px;
			}
			.ment{
				padding-right: 24px;
				color: black;
				position: relative;
				margin-left: 70px;
				font-size: larger;
				font-weight: inherit;
			}
			#header_class{
				width:100%;
				height:148px;
				background-color: #0d8ddb;
			}
		</style>
	</head>
	<body>
	<%@include file="../../page/common/header.jsp" %>
	<div id="header_class">
		<li class="nv ment"><span class="">${chapter.cpname } </span></li>
	</div>

		<video src="${pageContext.request.contextPath }/${chapter.filepath}" controls="controls" class="video" autoplay controls="controls">
		</video>
	</body>
</html>
