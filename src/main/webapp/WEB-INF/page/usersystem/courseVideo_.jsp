<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>课程视频</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_u4qz1594lnixusor.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css">
    <link href="https://vjs.zencdn.net/7.5.4/video-js.css" rel="stylesheet">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
    <script src="https://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
</head>
<body>
<%@include file="../../page/common/header.jsp" %>

<div class="player-video-wrapper">
    <video id='my-video' class='video-js' controls preload='auto' width='640' height='264'
           poster='${pageContext.request.contextPath }/static/video/m.jpg' data-setup='{}'>
        <source src='${pageContext.request.contextPath }/static/video/oceans.mp4' type='video/mp4'>
        <%--<source src='${pageContext.request.contextPath }/static/video/MY_VIDEO.webm' type='video/webm'>--%>
        <p class='vjs-no-js'>
            To view this video please enable JavaScript, and consider upgrading to a web browser that
            <a href='https://videojs.com/html5-video-support/' target='_blank'>supports HTML5 video</a>
        </p>
    </video>
</div>

<script src='https://vjs.zencdn.net/7.5.4/video.js'></script>
<script>

    $(function () {
        var player = videojs('my-video', {
            fluid: true
        });
    })
</script>
</body>
</html>