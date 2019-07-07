<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="author" content=""/>
    <title>课程介绍</title>
    <%--<link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/course.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .course-detail-wrapper {
        }

        .detail {
            width: 80%;
            min-height: 800px;

            border: 1px solid silver;
            margin: 0 auto;
        }

        .detail-course-title {
            height: 300px;
            position: relative;

        }

        .detail-course-title .bg {
            width: 100%;
            height: 100%;
            overflow: hidden;
            position: absolute;
        }

        .bg:after {
            content: "";
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            background: #696263 url("${pageContext.request.contextPath}/static/img/course/${course.courseimg}") no-repeat;
            background-size: cover;
            overflow: hidden;
            filter: blur(10px);

        }

        .detail-course-title h1 {
            width: 30%;
            position: relative;
            top: 50%;
            left: 10%;
            transform: translateY(-50%);
            color: #fff;

        }

        .detail-course-teacher {
            position: absolute;
            top: 60%;
            left: 10%;
            color: #fff;
            font-weight: bold;
        }

        .course-operate {
            position: absolute;
            right: 20%;
            top: 50%;
            transform: translateY(-50%);

        }

        .chapter-list ul {
            width: 80%;
            margin: 0 auto;
        }

        .chapter-list li {
            margin: 10px 0;
            padding: 10px;
            border: 1px solid silver;
            border-radius: 5px;
            box-shadow: 0 2px 4px silver;
        }

        .chapter-list li:hover {
            transform: scale(1.05, 1.1);
            transition: 0.5s;
        }

        .chapter-list li a {
            height: 32px;
            line-height: 32px;
            width: 95%;
            padding: 2px 10px;
            border-radius: 5px;
            display: inline-block;
        }

        .chapter-list li a:hover {
            color: red;
            background-color: #fff5ee;
        }

        .detail h3 {
            height: 40px;
            margin-left: 10px;
            line-height: 40px;
            font-size: 20px;
            font-weight: bold;
        }

        .course-intro {
            width: 80%;
            margin: 40px auto;
        }

        .course-intro-inline {
            padding: 20px;
            border: 1px solid silver;
            border-radius: 10px;
            box-shadow: 0 2px 3px silver;

        }
    </style>
</head>
<body>
<%@include file="../common/header.jsp" %>

<div class="course-detail-wrapper">
    <div class="detail-course-title">
        <div class="bg"></div>
        <h1>${course.cname}</h1>
        <div class="detail-course-teacher">${course.teacherName}</div>
        <div class="course-operate">

            <c:choose>
                <c:when test="${user.role == 1}">
                    <c:choose>
                        <c:when test="${hasCourse}">
                            <input type="hidden" value="${course.cid}" name="cid">
                            <a class="layui-btn layui-btn-normal" onclick="continueStudy(this)">继续学习</a>
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" value="${course.cid}" name="cid">
                            <a class="layui-btn layui-btn-warm" onclick="joinCourse(this)">加入课程</a>
                        </c:otherwise>
                    </c:choose>
                </c:when>
            </c:choose>
        </div>
    </div>
    <div class="detail">
        <div class="course-intro">
            <h3>课程介绍</h3>
            <div class="course-intro-inline">
                ${course.intro}
            </div>
        </div>

        <div class="chapter-list">
            <h3 style="margin-left: 10%;">章节列表</h3>
            <c:forEach var="chapter" items="${chapter}">
                <div class="course_style1">

                    <c:choose>
                        <c:when test="${chapter.flag eq '0'}">
                            <p><span class="chapter chapter_title_lv1">${chapter.cpname } </span></p>
                            <p><span class="chapter_description">&emsp;${chapter.intro}</span></p>
                        </c:when>
                        <c:otherwise>
                            <div class="chapter-video-link">
                                <a href="${pageContext.request.contextPath }/course/video?cpid=${chapter.cpid}">
                                    <span class="chapter">${chapter.cpname } </span></a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<script type="text/javascript">
    function joinCourse(that) {
        var v = $(that).prev().val();
        console.log(v);
        alert("加入成功,为您跳转到您的课程页面");
        location.href = "${pageContext.request.contextPath}/join/course?cid=" + v;
    }

    function continueStudy(that) {
        var v = $(that).prev().val();
        console.log(v);
        location.href = "${pageContext.request.contextPath}/course/courseDetail?cid="+v;
    }
</script>

<%@include file="../../page/common/footer.jsp" %>

</body>
</html>