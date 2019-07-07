<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/header.css"/>
<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/header.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>

<!-- 头部开始 -->
<div id="header">
    <div style="width: 165px;">
        <img src="${pageContext.request.contextPath }/static/logo3.svg"/>

    </div>
    <!-- 头部导航开始 -->
    <div id="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath }/index">首页</a></li>
            <c:choose>
                <c:when test="${sessionScope.user.role eq 2}">
                    <li><a href="${pageContext.request.contextPath }/user/index/teacherCourse">我的课程</a></li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="${pageContext.request.contextPath }/user/index/myCourse">我的课程</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    <!-- 头部导航结束 -->

    <!-- 头部搜索框开始 -->
    <div class="search-wrapper">
        <form>
            <input type="text" name="info" placeholder="请输入您要搜索的内容..." >
            <button type="button" onclick="searchCourse(this)"></button>
        </form>
    </div>
    <!-- 头部搜索框结束 -->

    <!-- 头部登录/注册开始 -->
    <div id="login_register">
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <div class="login-box">
                    <a href="javascript:;"><img
                            src="${pageContext.request.contextPath }/static/img/${sessionScope.user.headimg}"
                            id="headimg"/></a>
                    <span id="logined">${sessionScope.user.uname}</span>
                </div>
                <span id="updownSpan"></span>

                <!-- 头部登录/注册结束 -->
                <div id="select_div">
                    <ul class="select_ul_class">
                        <c:choose>
                        <c:when test="${sessionScope.user.role eq 2}">
                        <a href="${pageContext.request.contextPath }/user/index/teacherCourse">
                            </c:when>
                            <c:otherwise>
                            <a href="${pageContext.request.contextPath }/user/index/myCourse">
                                </c:otherwise>
                                </c:choose>
                                <li class="select_li_class">
                                    <span class="font_position">我的主页</span>
                                </li>
                            </a>
                            <a href="${pageContext.request.contextPath}/user/index/setting">
                                <li class="select_li_class">
                                    <span class="font_position">个人资料</span>
                                </li>
                            </a>
                            <a href="${pageContext.request.contextPath}/user/index/setting">
                                <li class="select_li_class">
                                    <span class="font_position">修改密码 </span>
                                </li>
                            </a>
                            <a href="${pageContext.request.contextPath}/exit">
                                <li class="select_li_class">
                                    <span class="font_position">注销 </span>
                                </li>
                            </a>
                    </ul>
                </div>
            </c:when>
            <c:otherwise>
                <div class="login-box">
                    <div>
                        <a href="${pageContext.request.contextPath }/user/login/index" class="a-login">登录</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

</div>

<!-- 头部结束 -->
<script>
    //搜索框获取焦点事件
    $("#search").focus(function () {
        $(".remind_class").hide();
    });
    //搜索框失去焦点事件
    $("#search").blur(function () {
        $(this).css("border", "1px solid #e1fffd");
        $(".remind_class").show();
    });

    $("#login_btn").mouseover(function () {
        $(this).css("background-color", "#4e97db");
    });

    $("#login_btn").mouseout(function () {
        $(this).css("background-color", "#2273c2");
    });

    $("#headimg,#logined").mouseover(function () {
        $("#updownSpan").attr("class", "layui-nav-more layui-nav-mored");
        $("#select_div").show();
    });
    $("#select_div").mouseleave(function () {
        $("#updownSpan").attr("class", "layui-nav-more");
        $(this).hide();
    });

    $("#login_btn span").click(function () {
        with (document.getElementById("login_method")) {
            method = "get";
            action = "${pageContext.request.contextPath}/login?name=" + getElementById("name").value + "&pwd=" + getElementById("pwd");
            submit();
        }
    });

    <%--$("#search").keypress(function (event) {//中部搜索框回车事件--%>
        <%--if (event.which == '13') {--%>
            <%--var value = $("input[ name='search'] ").val();--%>
            <%--location.href = "${pageContext.request.contextPath}/course/search?info=" + value;--%>
        <%--}--%>

    <%--});--%>
   function searchCourse(that) {
       var value = $(that).prev().val();
       console.log(value);
       location.href = "${pageContext.request.contextPath}/course/search?info=" + value;
   }
</script>
