<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >
<html>
<head>
    <base href="<%=basePath%>">

    <title>团子课堂</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/plugins/layui/css/layui.css"
          media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/index.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
</head>

<body>
<!-- 头部开始 -->
<%--<div id="header">
    <div style="width: 165px;">
        <img src="${pageContext.request.contextPath }/static/logo3.svg"/>

    </div>
    <!-- 头部导航开始 -->
    <div id="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath }/index">首页</a></li>
            <c:choose>
                <c:when test="${user.role eq 2}">
                    <li><a href="${pageContext.request.contextPath }/user/index/teacherCourse">我的课程</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath }/user/index/myCourse">我的课程</a></li>
                </c:otherwise>
            </c:choose>
            <li><a href="${pageContext.request.contextPath }/user/index/contactUs">联系我们</a></li>
        </ul>
    </div>
    <!-- 头部导航结束 -->

    <!-- 头部搜索框开始 -->
    <div>
        <input id="search" name="search" type="text"/>
        <span class="remind_class"><a href="/course/search">前端入门</a></span>
        <span class="remind_class"><a href="#">java小白入门</a></span>
    </div>
    <!-- 头部搜索框结束 -->

    <!-- 头部登录/注册开始 -->
    <div id="login_register">
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <a href="javascript:;"><img
                        src="${pageContext.request.contextPath}/static/img/${sessionScope.user.headimg}" id="headimg"/></a>
                <a><span class="login_class2">${sessionScope.user.uname}</span></a>
                <span id="updownSpan"></span>
                <a href="${pageContext.request.contextPath}/user/login/exit" class="login_class2">退出</a>
            </c:when>
            <c:otherwise>
                <a href="javascript:;"><img src="${pageContext.request.contextPath }/static/img/headimgs.jpg"
                                            id="headimg"/></a>
                <a href="user/login/index" class="login_class">登录/注册</a>
            </c:otherwise>
        </c:choose>
    </div>
    <!-- 头部登录/注册结束 -->
    <c:choose>
    <c:when test="${not empty sessionScope.user}">
    <div id="select_div">
        <ul class="select_ul_class">
            <c:choose>
                <c:when test="${user.role eq 2}">
                    <a href="${pageContext.request.contextPath }/user/index/teacherCourse">
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath }/user/index/myCourse">
                </c:otherwise>
            </c:choose>
                        <li class="select_li_class">
                            <span class="font_position"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp;我的主页</span>
                        </li>
                     </a>

                <a href="${pageContext.request.contextPath}/user/index/setting">
                    <li class="select_li_class">
                        <span class="font_position"><i class="fa fa-lock" aria-hidden="true"
                                                       style="padding-right: 3px;padding-left: 1px;"></i>&nbsp;&nbsp;个人资料</span>
                    </li>
                </a>
                <a href="${pageContext.request.contextPath}/user/index/setting">
                    <li class="select_li_class">
                        <span class="font_position"><i class="fa fa-gear"
                                                       aria-hidden="true"></i>&nbsp;&nbsp;修改密码 </span>
                    </li>
                </a>
                <a href="${pageContext.request.contextPath}/exit">
                    <li class="select_li_class">
                        <span class="font_position"><i class="fa fa-sign-out"
                                                       aria-hidden="true"></i>&nbsp;&nbsp;注销 </span>
                    </li>
                </a>
        </ul>
        </c:when>
        </c:choose>
    </div>
</div>--%>
<%@include file="common/header.jsp" %>

<!-- 头部结束 -->

<!-- 背景渐变div开始 -->
<div id="back_color">
    <div id="main">
       <%-- <div id="left_menu">
            <ul class="left_menu_ul">
                <li class="li_0">前沿技术
                    <img src="static/img/arrow.png" class="li_style1">
                    <div class="cates-box0">
                        <div class="fe-base-box clearfix">
                            <div class="banner-line">
                                <span class="bold mr10 l small-title">前沿技术</span>
                            </div>
                            <div class="tag-box l">
                                <a target="_blank" href="https://www.imooc.com/course/list?c=wff">微服务</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=blockchain">区块链</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=ethereum">以太坊</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=ai">人工智能</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=machine">机器学习</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=deep">深度学习</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=pcvision">计算机视觉</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=nlp">自然语言处理</a>
                                <a target="_blank"
                                   href="https://www.imooc.com/course/list?c=datafxwj">数据分析&amp;挖掘</a>
                            </div>
                        </div>
                    </div>
                </li>


                <li class="li_1">前端开发
                    <img src="static/img/arrow.png" class="li_style1">
                    <div class="cates-box1">
                        <div class="fe-base-box clearfix">
                            <div class="banner-line">
                                <span class="bold mr10 l small-title">前端开发</span>
                            </div>
                            <div class="tag-box l">
                                <a target="_blank" href="https://www.imooc.com/course/list?c=miniprogram">小程序</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=html">HTML/CSS</a>
                                <a target="_blank"
                                   href="https://www.imooc.com/course/list?c=javascript">JavaScript</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=vuejs">Vue.js</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=reactjs">React.JS</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=angular">Angular</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=nodejs">Node.js</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=jquery">jQuery</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=bootstrap">Bootstrap</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=sassless">Sass/Less</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=webapp">WebApp</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=fetool">前端工具</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=html5">Html5</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=css3">CSS3</a>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="li_2">后端开发
                    <img src="static/img/arrow.png" class="li_style1">
                    <div class="cates-box2">
                        <div class="fe-base-box clearfix">
                            <div class="banner-line">
                                <span class="bold mr10 l small-title">后端开发</span>
                            </div>
                            <div class="tag-box l">
                                <a target="_blank" href="https://www.imooc.com/course/list?c=java">Java</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=springboot">SpringBoot</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=python">Python</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=crawler">爬虫</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=django">Django</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=tornado">Tornado</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=go">Go</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=php">PHP</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=c">C</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=cplusplus">C++</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=csharp">C#</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=ruby">Ruby</a>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="li_3">移动开发
                    <img src="static/img/arrow.png" class="li_style1">
                    <div class="cates-box3">
                        <div class="fe-base-box clearfix">
                            <div class="banner-line">
                                <span class="bold mr10 l small-title">移动开发</span>
                            </div>
                            <div class="tag-box l">
                                <a target="_blank" href="https://www.imooc.com/course/list?c=android">Android</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=ios">iOS</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=reactnative">React
                                    native</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=weex">WEEX</a>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="li_4">云计算&大数据<img src="static/img/arrow.png" class="li_style3">
                    <div class="cates-box4">
                        <div class="fe-base-box clearfix">
                            <div class="banner-line">
                                <span class="bold mr10 l small-title">算法&amp;数学</span>
                            </div>
                            <div class="tag-box l">
                                <a target="_blank"
                                   href="https://www.imooc.com/course/list?c=algorithmds">算法与数据结构</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=maths">数学</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=suanfa">算法</a>
                            </div>
                        </div>
                        <div class="fe-base-box clearfix">
                            <div class="banner-line">
                                <span class="bold mr10 l small-title">云计算&amp;大数据</span>
                            </div>
                            <div class="tag-box l">
                                <a target="_blank" href="https://www.imooc.com/course/list?c=bigdata">大数据</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=hadoop">Hadoop</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=spark">Spark</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=hbase">Hbase</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=storm">Storm</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=cloudcomputing">云计算</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=aws">AWS</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=docker">Docker</a>
                                <a target="_blank"
                                   href="https://www.imooc.com/course/list?c=kubernetes">Kubernetes</a>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="li_5">运维&测试<img src="static/img/arrow.png" class="li_style4">
                    <div class="cates-box5">
                        <div class="fe-base-box clearfix">
                            <div class="banner-line">
                                <span class="bold mr10 l small-title">运维&amp;测试</span>
                            </div>
                            <div class="tag-box l">
                                <a target="_blank" href="https://www.imooc.com/course/list?c=dba">运维</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=oma">自动化运维</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=dbatool">运维工具</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=linux">Linux</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=test">测试</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=gntest">功能测试</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=xntest">性能测试</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=zdhtest">自动化测试</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=jktest">接口测试</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=aqtest">安全测试</a>
                            </div>
                        </div>
                        <div class="fe-base-box clearfix">
                            <div class="banner-line">
                                <span class="bold mr10 l small-title">数据库</span>
                            </div>
                            <div class="tag-box l">
                                <a target="_blank" href="https://www.imooc.com/course/list?c=mysql">MySQL</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=redis">Redis</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=mongodb">MongoDB</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=oracle">Oracle</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=sqlserver">SQL
                                    Server</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=nosql">NoSql</a>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="li_6">UI设计<img src="static/img/arrow.png" class="li_style5">
                    <div class="cates-box6">
                        <div class="fe-base-box clearfix">
                            <div class="banner-line">
                                <span class="bold mr10 l small-title">UI设计&amp;多媒体</span>
                            </div>
                            <div class="tag-box l">
                                <a target="_blank" href="https://www.imooc.com/course/list?c=modelmaking">模型制作</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=dxdh">动效动画</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=uijc">设计基础</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=uitool">设计工具</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=uiapp">APPUI设计</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=ixd">产品交互</a>
                            </div>
                        </div>
                        <div class="fe-base-box clearfix">
                            <div class="banner-line">
                                <span class="bold mr10 l small-title">游戏</span>
                            </div>
                            <div class="tag-box l">
                                <a target="_blank" href="https://www.imooc.com/course/list?c=unity3d">Unity 3D</a>
                                <a target="_blank" href="https://www.imooc.com/course/list?c=cocos2dx">Cocos2d-x</a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>


            <div id="menu_detail">
                <div id="content_up">
                    <span class="span_style">全部</span>
                    <div id="content_detail">
                        <ul class="content_ul">
                            <li><a href="" class="content_ul_a">HTML</a></li>
                            <li><a href="" class="content_ul_a">CSS</a></li>
                            <li><a href="" class="content_ul_a">JS</a></li>
                            <li><a href="" class="content_ul_a">Jquery</a></li>
                        </ul>
                    </div>
                </div>
                <div id="content_down">
                    <a href="">
                        <div class="content_down_1"><img src="static/img/pic1.png"/><span class="content_down_span1">Web自动化测试  Selenium基础到企业应用</span><span
                                class="content_down_span2">刘方</span></div>
                    </a>
                    <a href="">
                        <div class="content_down_1"><img src="static/img/pic2.png"/><span class="content_down_span1">Web自动化测试  Selenium基础到企业应用</span><span
                                class="content_down_span2">刘方</span></div>
                    </a>
                    <a href="">
                        <div class="content_down_1"><img src="static/img/pic3.png"/><span class="content_down_span1">Web自动化测试  Selenium基础到企业应用</span><span
                                class="content_down_span2">刘方</span></div>
                    </a>
                    <a href="">
                        <div class="content_down_1"><img src="static/img/pic4.png"/><span class="content_down_span1">Web自动化测试  Selenium基础到企业应用</span><span
                                class="content_down_span2">刘方</span></div>
                    </a>
                </div>
            </div>

        </div>
--%>
           <div id="turnPlay">
               <jsp:include page="usersystem/turnPlay.jsp"/>
           </div>
       <%-- <div id="right_content">
            <!-- 轮播图div开始 -->

            <!-- 轮播图div结束 -->
           &lt;%&ndash; <div id="right_down">
                <a href="">
                    <div class="profess"><img src="static/img/web.png"/>
                        <div class="professName"><span class="professName">Web前端工程师</span><br/><span
                                class="professIntro">互联网时代最火爆的技术</span></div>
                    </div>
                </a>
                <a href="">
                    <div class="profess"><img src="static/img/java.png"/>
                        <div class="professName"><span class="professName">Java工程师</span><br/><span
                                class="professIntro">综合就业排名第一</span></div>
                    </div>
                </a>
                <a href="">
                    <div class="profess"><img src="static/img/ai.png"/>
                        <div class="professName"><span class="professName">人工智能</span><br/><span class="professIntro">移动设备市场份额第一</span>
                        </div>
                    </div>
                </a>
                <a href="">
                    <div class="profess"><img src="static/img/bd.png"/>
                        <div class="professName"><span class="professName">大数据分析</span><br/><span class="professIntro">世界上最好的语言：）</span>
                        </div>
                    </div>
                </a>
                <a href="">
                    <div class="profess"><img src="static/img/python.png"/>
                        <div class="professName"><span class="professName">Python工程师</span><br/><span
                                class="professIntro">可能是全球最好用的系统</span></div>
                    </div>
                </a>
            </div>&ndash;%&gt;
        </div>--%>
    </div>
</div>
<!-- 背景渐变div开始 -->

<!-- 精品课程推荐开始 -->
<div id="best_class">
    <div id="best_class_title">
        <span class="tit-icon icon-job-l tit-icon-l"></span>
        <em>热</em>／<em>门</em>／<em>课</em>／<em>程</em>
        <span class="tit-icon icon-job-r tit-icon-r"></span>
    </div>
    <div id="best_class_content">
        <%-- <div class="best_class_ctn"><img src="static/img/best1.jpg"/><a href=""><br/><span class="best_class_title">移动端自动化测试Appium 从入门到项目实战Python版</span></a>
         </div>
         <div class="best_class_ctn"><img src="static/img/best2.jpg"/><a href=""><br/><span class="best_class_title">移动端自动化测试Appium 从入门到项目实战Python版</span></a>
         </div>
         <div class="best_class_ctn"><img src="static/img/best3.jpg"/><a href=""><br/><span class="best_class_title">移动端自动化测试Appium 从入门到项目实战Python版</span></a>
         </div>
         <div class="best_class_ctn"><img src="static/img/best4.jpg"/><a href=""><br/><span class="best_class_title">移动端自动化测试Appium 从入门到项目实战Python版</span></a>
         </div>
         <div class="best_class_ctn"><img src="static/img/best5.jpg"/><a href=""><br/><span class="best_class_title">移动端自动化测试Appium 从入门到项目实战Python版</span></a>
         </div>--%>
    </div>
</div>


<div id="best_category">
    <div id="best_category_title">
        <span class="tit-icon icon-job-l tit-icon-l"></span>
        <em>热</em>／<em>门</em>／<em>方</em>／<em>向</em>
        <span class="tit-icon icon-job-r tit-icon-r"></span>
    </div>
    <div id="best_category_content">
        <%-- <div class="best_class_ctn"><img src="static/img/best1.jpg"/><a href=""><br/><span class="best_class_title">移动端自动化测试Appium 从入门到项目实战Python版</span></a>
         </div>
         <div class="best_class_ctn"><img src="static/img/best2.jpg"/><a href=""><br/><span class="best_class_title">移动端自动化测试Appium 从入门到项目实战Python版</span></a>
         </div>
         <div class="best_class_ctn"><img src="static/img/best3.jpg"/><a href=""><br/><span class="best_class_title">移动端自动化测试Appium 从入门到项目实战Python版</span></a>
         </div>
         <div class="best_class_ctn"><img src="static/img/best4.jpg"/><a href=""><br/><span class="best_class_title">移动端自动化测试Appium 从入门到项目实战Python版</span></a>
         </div>
         <div class="best_class_ctn"><img src="static/img/best5.jpg"/><a href=""><br/><span class="best_class_title">移动端自动化测试Appium 从入门到项目实战Python版</span></a>
         </div>--%>
    </div>
</div>


<%@include file="common/footer.jsp" %>

<!-- 底部结束 -->
</body>

<script type="text/javascript">
    setInterval(back_change, 3150);

    var i = 1;

    function back_change() {
        if (i == 5) {
            i = 0;
        }

        var back1 = "-moz-linear-gradient(top, #d9f2e0, rgba(241, 250, 244, 0.5))";//绿
        var back2 = "-moz-linear-gradient(top, #d9d9d5, rgba(241, 241, 240, 0.5))";//紫
        var back3 = "-moz-linear-gradient(top, #fae0d2, rgba(255, 249, 246, 0.5))";//粉
        var back4 = "-moz-linear-gradient(top, #d8d8d8, rgba(250, 250, 251, 0.5))";//灰

        switch (i) {
            case 1:
                $("#back_color").css("background", back1);
                break;
            case 2:
                $("#back_color").css("background", back2);
                break;
            case 3:
                $("#back_color").css("background", back3);
                break;
            case 4:
                $("#back_color").css("background", back4);
                break;
        }
        i++;
    }


    onload = function () {
        var ajax = createAjax();
        ajax.open("POST", "${pageContext.request.contextPath}/load?type=0");
        ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        ajax.send();
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4 && ajax.status == 200) {
                var javaJson = ajax.responseText;
                var jsonData = eval("(" + javaJson + ")");
                //<li>前端开发<img src="static/img/arrow.png" class="li_style1"/></li>
                var oul = $(".left_menu_ul");
                var htmlStr = "";

                for (var i = 0; i < jsonData[0].length; i++) {
                    htmlStr += "<li>" + jsonData[0][i].ctname + "<img src=\"static/img/arrow.png\" class=\"li_style1\"/></li>";
                }

                oul.append(htmlStr);
                for (var j = 0; j < jsonData.length; j++) {
                    //左部菜单鼠标滑过事件
                    $(".left_menu_ul li:eq(" + j + ")").mouseover(function () {
                        $(this).css("background-color", "#6b7176").css("color", "#fff");
                        $(this).children("img").attr("src", "static/img/arrow1.png");

                        var ocontentul = $(".content_ul");
                        //
                        var liStr = "";
                        var index = $(this).index();
                        for (var m = 0; m < jsonData[index + 1].length; m++) {
                            var name = jsonData[index + 1][m].ctname;
                            liStr += "<li><a  target=\"_blank\" href=\"${pageContext.request.contextPath}/chooseClass?typeId=" + jsonData[index + 1][m].typeId + "&flag=0\" class=\"content_ul_a\">" + name + "</a></li>";
                        }
                        ocontentul.html(""); //清空
                        ocontentul.append(liStr);
                        $("#menu_detail").show();
                    });
                    //左部菜单鼠标滑出事件
                    $(".left_menu_ul li:eq(" + j + ")").mouseout(function () {
                        $(this).css("background-color", "#2b333b").css("color", "#abaeb1");
                        $(this).children("img").attr("src", "static/img/arrow.png");
                    });
                }

                //<div class="best_class_ctn"><img src="static/img/best1.jpg"/><a href=""><br/><span class="best_class_title">移动端自动化测试Appium 从入门到项目实战Python版</span></a></div>
                var oclassDiv = $("#best_class_content");
                var classStr = "";
                for (var n = 0; n < jsonData[8].length; n++) {
                    classStr += "<a  target=\"_blank\" href=\"${pageContext.request.contextPath}/course?cid=" + jsonData[8][n].cid + "\"><div class=\"best_class_ctn\"><img src=\"${pageContext.request.contextPath}/image/" + jsonData[8][n].courseImg + "\"/><a href=\"${pageContext.request.contextPath }/course?cid=" + jsonData[8][n].cid + "\"><br/><span class=\"best_class_title\">" + jsonData[8][n].cname + "</span></a></div></a>";
                }
                oclassDiv.append(classStr);

                var oclassDiv = $("#best_teacher_content"); //推荐教师
                var classStr = "";
                for (var p = 0; p < jsonData[9].length; p++) {
                    classStr += "<a  target=\"_blank\" href=\"${pageContext.request.contextPath}/page/usersystem/teacherCourse.jsp?uid=" + jsonData[9][p].uid + "&role=2\"><div class=\"best_teacher_ctn\"><img src=\"${pageContext.request.contextPath}/image/" + jsonData[9][p].headImg + "\"/><div class=\"best_teacher_intro\"><span class=\"teacher_name\">" + jsonData[9][p].uname + "</span><br/><span class=\"teacher_position\">" + jsonData[9][p].profess + "</span><span class=\"teacher_instr_detail\">" + jsonData[9][p].intro + "</span></div></div></a>";
                }
                oclassDiv.append(classStr);
                $(".best_teacher_ctn").mouseover(function () {
                    $(this).css("background-color", "#fff");
                });

                $(".best_teacher_ctn").mouseout(function () {
                    $(this).css("background-color", "#d3d5db");
                });
            }

        };
    };

    $(".layui-nav-child dd").mouseover(function () {
        $(this).css("background-color", "#f2f2f2");
    });

    $(".layui-nav-child dd").mouseout(function () {
        $(this).css("background-color", "#fff");
    });

    function createAjax() {
        var ajax = null;

        try {
            ajax = new ActiveXObject("microsoft.xmlhttp");
        } catch (e) {
            ajax = new XMLHttpRequest();
        }
        return ajax;

    }

</script>
<script type="text/javascript">
    function listHotCourse() {
        $.ajax({
            url: "${pageContext.request.contextPath}/course/hotCourse",
            success: function (data) {
                if (data.success) {
                    buildCourseCard(data.data);
                }
            }
        });
    }
    function listCourseType() {
        $.ajax({
            url: "${pageContext.request.contextPath}/getCourseTypeByDirection",
            success: function (data) {
                if (data.success) {
                    buildCourseTypeCard(data.data);
                }
            }
        });
    }

    function buildCourseCard(_data) {
        var str = "";
        for (var i = 0, len = _data.length; i < len; i++) {
            var pic = "${pageContext.request.contextPath}/static/img/";
            // course
            pic += _data[i].courseimg === null ? "best1.jpg" : "course/" + _data[i].courseimg;

            str = "<div class=\"best_class_ctn\">" +
                "<a href=\"${pageContext.request.contextPath}/course/view/" + _data[i].cid + "\">" +
                "<img src='" + pic + "' title='" + _data[i].cname + "' /><br/>" +
                "    <span class=\"best_class_title\">" + _data[i].cname + "</span>" +
                "</a>\n" +
                " </div>";
            $('#best_class_content').append(str);
        }
    }
    function buildCourseTypeCard(_data) {
        var str = "";
        for (var i = 0, len = _data.length; i < len; i++) {
            var pic = "${pageContext.request.contextPath}/static/img/";
            // course
            pic += _data[i].typeid + ".jpg";

            str = "<div class=\"best_category_card\">" +
                "<a href='${pageContext.request.contextPath}/course/search?info=" +_data[i].ctname + "'"  + ">" +
                "<img src='" + pic + "' title='" + _data[i].ctname + "' /><br/>" +
                // "    <span class=\"\">" + _data[i].ctname + "</span>" +
                "</a>\n" +
                " </div>";
            $('#best_category_content').append(str);
        }
    }
    listHotCourse();
    listCourseType();
</script>
</html>
