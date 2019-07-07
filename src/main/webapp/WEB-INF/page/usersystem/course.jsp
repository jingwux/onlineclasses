<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE>
<html>
<head>
    <title>课程详情</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/course.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/comment.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/plugins/layui/css/layui.css"
          media="all"/>
    <style>
        .data-down-wrapper {
            padding: 20px;
        }

        .data-down-wrapper .data-down-head {
            margin: 20px;
        }

        .data-down-head p {
            margin: 5px;
        }

        .data-down-wrapper input {
            position: initial;
        }
    </style>
</head>

<body>
<%@include file="../../page/common/header.jsp" %>

<div class="course-wrapper">
    <div class="course-nav">
        <a href="${pageContext.request.contextPath }/index">首页</a> > <a href="">${course.typeDirection}</a>
    </div>

    <div id="courseTitle">

        <div class="course-info">
            <img src="${pageContext.request.contextPath}/static/img/course/${course.courseimg}"/>

        </div>

        <div class="course-name">
            <span class="course_title">${course.cname }</span>
            <span class="teacher_name">${course.teacherName }</span>
            <span class="">难度：${course.content }</span>
            <span class="">学习人数：${course.accessnum }</span>
        </div>
    </div>

    <div id="directory">
        <ul>
            <li><a href="javascript:void(0)" style="color:#17b39f;border-bottom: 4px solid #17b39f">课程章节</a>
            </li>
            <li><a href="javascript:void(0)" onclick="">资料下载</a></li>
            <li><a href="javascript:void(0)" onclick="exercise()">作业</a></li>
            <li><a href="javascript:void(0)">问答评论</a></li>
        </ul>
    </div>

    <div class="course-detail">

        <!-- 课程章节div开始 -->
        <div id="course_detail">
            <div id="course_intro">
                <div>简介：${course.intro }</div>
            </div>

            <c:forEach var="chapter" items="${chapter}" varStatus="count">
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
        <!-- 课程章节div结束 -->

        <!-- 资料下载div开始 -->
        <div id="data_down">
            <div class="course_style" id="dataDiv">
                <div class="div_display_none">
                    <div class="data-down-wrapper">
                        <div class="data-down-head">
                            <p><span style="font-weight: bold;font-size: 20px">资料下载 </span></p>
                            <p><span>通过学习本课程，可免费下载你所需要的课件，巩固课程的学习,点击即可下载！</span></p>
                        </div>
                        <div style="margin-top: 20px;">
                            <c:choose>
                                <c:when test="${not empty data}">
                                    <ul>
                                        <c:forEach var="data" items="${data}" varStatus="count">
                                            <a href="${pageContext.request.contextPath }/courseData/download?filename=${data.dname}"><span
                                                    class="down">下载</span>
                                                <li style="text-decoration: underline;">${data.dname}</li>
                                            </a>
                                        </c:forEach>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <ul>
                                        <span style="color:red">暂无资料下载！</span>
                                    </ul>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                </div>
                <span class="nocontent">暂无资料下载！</span>
            </div>
        </div>
        <!-- 资料下载div结束 -->

        <!-- 作业div开始 -->
        <div id="work">
            <div class="course_style" id="exerciseDiv">
                <div class="div_display_none">
                    <div class="data-down-wrapper">
                        <div class="data-down-head">
                            <span style="font-weight: bold;font-size: 20px">课程作业 </span>
                            <br>
                            <c:choose>
                                <c:when test="${not empty exerciseInfo}">
                                    <c:forEach var="exercise" items="${exerciseInfo}" varStatus="count">
                                        <div style="margin-top: 10px;display: flex;justify-content: space-between;align-items: center;">
                                            <div style="width:150px;font-weight: bold;font-size: 18;">${exercise.ename}</div>
                                            <div><span style="color:red;">
                                            截止时间：<fmt:formatDate value="${exercise.endtime}"
                                                                 pattern="yyyy-MM-dd HH:mm:ss"/></span></div>
                                            <input type="hidden" id="exercise"
                                                   value="<fmt:formatDate value="${exercise.endtime}" pattern="yyyy-MM-dd HH:mm:ss" />"/>
                                        </div>
                                        <p><span>${exercise.content}</span></p>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <span style="color:red">暂无作业！</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="layui-upload" style="margin-left:200px;">
                            <button type="button" class="layui-btn layui-btn-normal" id="chooseFile">选择文件</button>
                            <button type="button" class="layui-btn" id="uploadData">开始上传</button>
                        </div>
                        <div style="margin-top: 20px;">
                            <ul class="score-wrapper">
                                <div class="layui-upload">

                                </div>
                            </ul>
                        </div>
                    </div>
                </div>
                <span class="nocontent">暂无作业！</span>
            </div>
        </div>

        <script type="text/javascript">
            function exercise() {
                $.ajax({
                    url: "${pageContext.request.contextPath}/student/score?cid=${course.cid}&uid=${user.uid}",
                    data: "",
                    success: function (data) {
                        if (data.success) {
                            debugger;
                            var jsonData = data.data;
                            console.log(jsonData != null);
                            if (jsonData != null) {
                                var odiv = $("#exerciseDiv ul");
                                var liStr = '';
                                liStr += '<span class="chapter" style="font-size:20px;font-weight:bold;">作业成绩 </span>' +
                                    '<span class="down" style="font-size:25;margin-top:-3px">' + jsonData + '</span>';
                                odiv.html("");
                                odiv.append(liStr);
                            }
                        }
                    }
                });
            }
        </script>
        <!-- 作业div结束 -->


        <!-- 答疑评论div开始 -->
        <div id="question_comment">
            <div class="course_style">
                <!--发表问题区域 begin-->
                <div class="commentAll" style="border:0px;">
                    <div class="reviewArea clearfix">
                <textarea id="questionContent" class="content comment-input"
                          placeholder="Please enter a question&hellip;" onkeyup="keyUP(this)"
                          style="padding: 10px"></textarea>
                        <a href="javascript:;" class="plBtn" id="myQuestion">提问</a>
                    </div>
                </div>
                <script type="text/javascript">
                    function jump() {
                        var var1 = $("#questionContent").val();
                        location.href = "/course/question?uid=${user.uid}&cid=${course.cid}" + "&info=" + var1;
                    }
                </script>
                <!--发表问题区域 end-->
            </div>
            <c:forEach var="_question" items="${question}" varStatus="count">
                <div class="course_style">
                    <div class="div_display_none">
                        <!-- 问题区域begin -->
                        <div class="question">
                            <div class="comment-show-con-img pull-left"><img
                                    src="${pageContext.request.contextPath }/static/img/${user.headimg}"
                                    alt="" width="48">
                            </div>
                            <div class="comment-show-con-list pull-left clearfix">
                                <div class="pl-text clearfix">
                                    <span class="my-pl-con">&nbsp;${_question.qname }:</span>
                                    <a href="#" class="comment-size-name">${_question.content} </a>
                                    <input type="hidden" name="qid" value=${_question.qid}>
                                </div>
                            </div>


                        </div>
                    </div>
                    <!-- 问题区域end -->
                    <div class="commentAll">
                        <!--评论区域 begin-->
                        <div class="reviewArea clearfix">
                    <textarea class="content comment-input" placeholder="Please enter a comment&hellip;"
                              onkeyup="keyUP(this)" style="padding: 10px"></textarea>
                            <a href="javascript:;" class="plBtn">评论</a>
                        </div>
                        <!--评论区域 end-->
                        <!--回复区域 begin-->
                        <div class="comment-show">
                            <div class="comment-show-con clearfix">
                                <div class="comment-show-con-list pull-left clearfix">
                                    <c:forEach var="comment" items="${_question.comments}" varStatus="count">
                                        <c:if test="${comment.qid eq _question.qid}">
                                            <div class="pl-text clearfix">
                                                <span class="my-pl-con">&nbsp;${comment.uname }:</span>
                                                <a href="#" class="comment-size-name">${comment.content} </a>
                                            </div>
                                            <div class="date-dz">
                                                    <%--<span class="date-dz-left pull-left comment-time">2019-5-2 11:11:39</span>--%>
                                                <div class="date-dz-right pull-right comment-pl-block">
                                                        <%--<a href="javascript:;" class="removeBlock">删除</a>--%>
                                                    <a href="javascript:;"
                                                       class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                    <%--<span class="pull-left date-dz-line">|</span>--%>
                                                        <%-- <a href="javascript:;" class="date-dz-z pull-left"><i
                                                                 class="date-dz-z-click-red"></i>赞 (<i
                                                                 class="z-num">${comment.likenum }</i>)</a>--%>
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="hf-list-con" style="display:block;">
                                            <c:forEach var="replay" items="${replay}" varStatus="count">
                                                <c:if test="${comment.comid eq relay.qid}">
                                                    <div class="all-pl-con">
                                                        <div class="pl-text hfpl-text clearfix">
                                                            <a href="#" class="comment-size-name">${replay.uid} : </a>
                                                            <span class="my-pl-con">回复
									                		<a href="#"
                                                               class="atName">@${replay.reuid} </a> : ${replay.content}</span>
                                                        </div>
                                                        <div class="date-dz">
                                                                <%--<span class="date-dz-left pull-left comment-time">2018-5-11 9:11:54</span>--%>
                                                            <div class="date-dz-right pull-right comment-pl-block">
                                                                    <%--<a href="javascript:;" class="removeBlock">删除</a>--%>
                                                                <a href="javascript:;"
                                                                   class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                                <%--<span class="pull-left date-dz-line">|</span>--%>
                                                              <%--  <a href="javascript:;" class="date-dz-z pull-left"><i
                                                                        class="date-dz-z-click-red"></i>赞 (<i
                                                                        class="z-num">${replay.likenum }</i>)</a>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!--回复区域 end-->
                    </div>
                </div>
                <span class="nocontent">暂无问答！</span>
            </c:forEach>
        </div>
        <!-- 答疑评论div结束 -->

        <div id="relate_class">
            <h3><span class="remind_span">推荐课程</span></h3>
            <div class="remind_class">
                <ul>
                    <li>
                        <img src="${pageContext.request.contextPath }/image/fdda64581a284227aadde0e529ce8cfb_10.jpg"/>
                        <div>
                            <p><span class="class_title">C#轻松入门</span></p>
                            <br>
                            <p><span class="access_num">访问人数：2580</span></p>
                        </div>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath }/image/fdda64581a284227aadde0e529ce8cfb_10.jpg"/>
                        <div>
                            <p><span class="class_title">C++远征之多态篇</span></p>
                            <br>
                            <p><span class="access_num">访问人数：180</span></p>
                        </div>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath }/image/fdda64581a284227aadde0e529ce8cfb_10.jpg"/>
                        <div>
                            <p><span class="class_title">JS实现京东无延迟菜单效果</span></p>
                            <br>
                            <p><span class="access_num">访问人数：336</span></p>
                        </div>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath }/image/fdda64581a284227aadde0e529ce8cfb_10.jpg"/>
                        <div>
                            <p><span class="class_title">Python操作MySQL数据库</span></p>
                            <br>
                            <p><span class="access_num">访问人数：1280</span></p>
                        </div>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath }/image/fdda64581a284227aadde0e529ce8cfb_10.jpg"/>
                        <div>
                            <p><span class="class_title">Python-走进Requests库</span></p>
                            <br>
                            <p><span class="access_num">访问人数：33215</span></p>
                        </div>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath }/image/fdda64581a284227aadde0e529ce8cfb_10.jpg"/>
                        <div>
                            <p><span class="class_title">初识Java微信公众号开发</span></p>
                            <br>
                            <p><span class="access_num">访问人数：3569</span></p>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</div>
<%@include file="../../page/common/footer.jsp" %>
<script>
    $(".changeColor").mouseover(function () {
        $(this).css("background-color", "#c20a0a");
    });

    $(".changeColor").mouseout(function () {
        $(this).css("background-color", "#f20d0d");
    });

    $(".startLearn").click(function () {
        var ajax = createAjax();
        ajax.open("POST", "${pageContext.request.contextPath}/selectCourse?cid=${courseid}");
        ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        ajax.send();
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4 && ajax.status == 200) {
                var javaJson = ajax.responseText;

                $("#continue span").html("继续学习");
            }
        };
    });

    $(".remind_class ul li").mouseover(function () {
        $(this).find("img").css("box-shadow", "0px 5px 10px 5px #b7babc");
        $(this).find(".class_title").css("color", "#cc1500");
    });

    $(".remind_class ul li").mouseout(function () {
        $(this).find("img").css("box-shadow", "0px 5px 10px 5px #f8fafc");
        $(this).find(".class_title").css("color", "#000");
    });

    $("#directory ul li").click(function () {
        for (var i = 0; i < 5; i++) {
            if ($(this).index() != i) {
                $("#directory ul li:eq(" + i + ") a").css({"color": "#000", "border-bottom": "none"});
            } else {
                $("#directory ul li:eq(" + i + ") a").css({
                    "color": "#17b39f",
                    "border-bottom": "4px solid #17b39f"
                });
            }
        }
        var index = $(this).index();
        if (index == 0) {
            $("#course_detail").css("display", "block");
            $("#data_down").css("display", "none");
            $("#work").css("display", "none");
            $("#exam").css("display", "none");
            $("#question_comment").css("display", "none");
        } else if (index == 1) {
            $("#course_detail").css("display", "none");
            $("#data_down").css("display", "block");
            $("#work").css("display", "none");
            $("#exam").css("display", "none");
            $("#question_comment").css("display", "none");
        } else if (index == 2) {
            $("#course_detail").css("display", "none");
            $("#data_down").css("display", "none");
            $("#work").css("display", "block");
            $("#exam").css("display", "none");
            $("#question_comment").css("display", "none");
        }
//        } else if (index == 3) {
//            $("#course_detail").css("display", "none");
//            $("#data_down").css("display", "none");
//            $("#work").css("display", "none");
//            $("#exam").css("display", "block");
//            $("#question_comment").css("display", "none");
//        }
        else if (index == 3) {
            $("#course_detail").css("display", "none");
            $("#data_down").css("display", "none");
            $("#work").css("display", "none");
            $("#exam").css("display", "none");
            $("#question_comment").css("display", "block");
        }
    });

    $(".make_work").click(function () {
        $(".start_exercise").fadeIn();
    });

    $(".close").click(function () {
        $(".start_exercise").fadeOut();
    });

    $(".start_exercise ul li:eq(2)").css("height", "100px");

    function dataClick() {
        var ajax = createAjax();
        ajax.open("POST", "${pageContext.request.contextPath}/data?cid=1526282010211");
        ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        ajax.send();
        ajax.onreadystatechange = function () {
            if (ajax.readyState == 4 && ajax.status == 200) {
                var javaJson = ajax.responseText;
                var jsonData = eval("(" + javaJson + ")");
                var odiv = $("#dataDiv ul");
                var liStr = "";
                for (var i = 0; i < jsonData.length; i++) {
                    liStr += '<a href="${pageContext.request.contextPath}/download?fileName=' + jsonData[i].dname + '"><span class="down">下载</span><li>' + (jsonData[i].dname).split("_")[1] + '</li></a>';
                }

                odiv.html("");
                odiv.append(liStr);
                $("#dataDiv ul li").mouseover(function () {
                    $(this).css("background-color", "#fef3f3").css("color", "#cc1500");
                });

                $("#dataDiv ul li").mouseout(function () {
                    $(this).css("background-color", "#fff").css("color", "#1c1f21");
                });
            }
        };
    };


    layui.use(['form', 'layer', 'table', 'upload'], function () {
        var upload = layui.upload;
        var uploadInst = upload.render({
            elem: '#chooseFile'
            , auto: false
            , accept: 'file' //普通文件
            , bindAction: '#uploadData'
            , url: "${pageContext.request.contextPath}/course/work"    // 上传路径
            , data: {       // 额外参数
                cid: ${course.cid}
            }
            , done: function (res) {
                //如果上传失败
                if (res.success) {
                    return layer.msg('上传成功');
                } else {
                    return layer.msg('上传失败');
                }
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

    });

    function exerciseClick() {
        //debugger;
        var ajax = createAjax();
        let formData = new FormData(document.getElementById("addExerciseForm"));
        $.ajax({
            url: "${pageContext.request.contextPath}/course/exercise",
            data: formData,
            type: "post",
            //async:"false",
            contentType: false,
            processData: false,
            success: function (result) {
                debugger;
                alert("提交成功");
                console.log("success");
                window.location.reload();

            },
            error: function (result) {
                console.log("--")
            }
        });
    };

    $(".chapterUl li").mouseover(function () {
        $(this).css("background-color", "#fef3f3").css("color", "#cc1500");
    });
    $(".chapterUl li").mouseleave(function () {
        $(this).css("background-color", "#fff").css("color", "#1c1f21");
    });

    function createAjax() {
        var ajax = null;

        try {
            ajax = new ActiveXObject("microsoft.xmlhttp");
        } catch (e) {
            ajax = new XMLHttpRequest();
        }
        return ajax;

    };

</script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/js/plugins/jquery-ui/jquery.flexText.js"></script>

<!--textarea高度自适应-->
<script type="text/javascript">
    $(function () {
        $('.content').flexText();
    });
</script>
<!--textarea限制字数-->
<script type="text/javascript">
    function keyUP(t) {
        var len = $(t).val().length;
        if (len > 139) {
            $(t).val($(t).val().substring(0, 140));
        }
    }
</script>
<!--创建问题-->
<script type="text/javascript">
    $('#myQuestion').on('click', function () {
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        if (oSize === "") alert("请输入问题内容");
        var myDate = new Date();
        //获取当前年
        var year = myDate.getFullYear();
        //获取当前月
        var month = myDate.getMonth() + 1;
        //获取当前日
        var date = myDate.getDate();
        var h = myDate.getHours();       //获取当前小时数(0-23)
        var m = myDate.getMinutes();     //获取当前分钟数(0-59)
        if (m < 10) m = '0' + m;
        var s = myDate.getSeconds();
        if (s < 10) s = '0' + s;
        var now = year + '-' + month + "-" + date + " " + h + ':' + m + ":" + s;
        //获取输入内容
        var that = $(this);
        var url = "${pageContext.request.contextPath}/question/add?uid=${user.uid}&cid=${course.cid}&qname=${user.uname }&content=" + oSize;
        //动态创建问题
        $.ajax({
            url: url,
            success: function (data) {
                // debugger;
                if (data.success) {
                    //动态创建评论模块
                    var commentBox = "<div class=\"course_style\">\n" +
                        "    <div class=\"div_display_none\">\n" +
                        "        <!-- 问题区域begin -->\n" +
                        "        <div class=\"question\">\n" +
                        "            <div class=\"comment-show-con-img pull-left\"><img src=\"${pageContext.request.contextPath}/static/img/${user.headimg}\" alt=\"\" width=\"48\"></div>\n" +
                        "            <div class=\"comment-show-con-list pull-left clearfix\">\n" +
                        "                <div class=\"pl-text clearfix\">\n" +
                        "                    <span class=\"my-pl-con\">&nbsp;${user.uname}:</span>\n" +
                        "                    <a href=\"#\" class=\"comment-size-name\">" + oSize + "</a>\n" +
                        "                    <input type=\"hidden\" name=\"qid\" value=\"1555416738621\">\n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "    </div>\n" +
                        "    <!-- 问题区域end -->\n" +
                        "    <div class=\"commentAll\">\n" +
                        "        <!--评论区域 begin-->\n" +
                        "        <div class=\"reviewArea clearfix\">\n" +
                        "            <div class=\"flex-text-wrap\"><pre class=\"pre\"><span></span><br></pre><textarea class=\"content comment-input\" placeholder=\"Please enter a comment…\" onkeyup=\"keyUP(this)\" style=\"padding: 10px\"></textarea></div>\n" +
                        "            <a href=\"javascript:;\" class=\"plBtn\">评论</a>\n" +
                        "        </div>\n" +
                        "        <!--评论区域 end-->\n" +
                        "        <!--回复区域 begin-->\n" +
                        "        <div class=\"comment-show\">\n" +
                        "            <div class=\"comment-show-con clearfix\">\n" +
                        "                <div class=\"comment-show-con-list pull-left clearfix\">\n" +
                        "                    \n" +
                        "                </div>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "        <!--回复区域 end-->\n" +
                        "    </div>\n" +
                        "</div>";
                    if (oSize.replace(/(^\s*)|(\s*$)/g, "") != '') {
                        that.parents('.course_style').after(commentBox);
                        that.siblings('.flex-text-wrap').find('.comment-input').prop('value', '').siblings('pre').find('span').text('');
                    }
                } else {
                    layer.alert("评论失败", {icon: 1});

                }
            }
        });
    });
</script>
<!--点击回复动态创建回复块-->
<script type="text/javascript">
    $('.commentAll').on('click', '.plBtn', function () {
        //获取回复人的名字
        var fhName =$(this).parents('.course_style').find('.my-pl-con').html();
        var pingLun = $(this).siblings('.flex-text-wrap').find('.comment-input');
        var oHfVal = pingLun.val();
        //回复@
        var fhN = '回复@' + fhName;
        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
        //显示回复
        if ($(this).is('.hf-con-block')) {
            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
            $(this).removeClass('hf-con-block');
            $('.content').flexText();
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding', '6px 15px');
            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
            //input框自动聚焦
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
        } else {

            var str = '<div class="pl-text clearfix">\n' +
                '                                                <span class="my-pl-con">&nbsp;${user.uname}:</span>\n' +
                '                                                <a href="#" class="comment-size-name">' + oHfVal + '</a>\n' +
                '                                            </div>\n' +
                '                                            <div class="date-dz">\n' +
                '                                                    \n' +
                '                                                <div class="date-dz-right pull-right comment-pl-block">\n' +
                '                                                        \n' +
                '                                                    <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>\n' +
                '                                                    \n' +
                '                                                        \n' +
                '                                                </div>\n' +
                '                                            </div>\n' +
                '                                        \n' +
                '                                        <div class="hf-list-con" style="display:block;">\n' +
                '                                            \n' +
                '                                        </div> ';
            $(this).parents('.commentAll').find('.comment-show-con-list').append(str);
            pingLun.val('');
        }
    });
</script>
<!--评论回复块创建-->
<script type="text/javascript">
    $('.commentAll').on('click', '.pl-hf', function () {
        var oThis = $(this);
        var myDate = new Date();
        //获取当前年
        var year = myDate.getFullYear();
        //获取当前月
        var month = myDate.getMonth() + 1;
        //获取当前日
        var date = myDate.getDate();
        var h = myDate.getHours();       //获取当前小时数(0-23)
        var m = myDate.getMinutes();     //获取当前分钟数(0-59)
        if (m < 10) m = '0' + m;
        var s = myDate.getSeconds();
        if (s < 10) s = '0' + s;
        var now = year + '-' + month + "-" + date + " " + h + ':' + m + ":" + s;
        //获取输入内容
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.comment-input').val();

        console.log(oHfVal);

        var oHfName = $(this).parentsUntil('.course_style').find('.my-pl-con').html();
        var oAllVal = '回复@' + oHfName;
        debugger;
        if (oHfVal.replace(/^ +| +$/g, '') === '' || oHfVal === oAllVal) {

        } else {
           /* $.getJSON("${pageContext.request.contextPath }/json/pl.json", function (data) {
                var oAt = '';
                var oHf = '';
                $.each(data, function (n, v) {
                    delete v.hfContent;
                    delete v.atName;
                    var arr;
                    var ohfNameArr;
                    if (oHfVal.indexOf("@") == -1) {
                        data['atName'] = '';
                        data['hfContent'] = oHfVal;
                    } else {
                        arr = oHfVal.split(':');
                        ohfNameArr = arr[0].split('@');
                        data['hfContent'] = arr[1];
                        data['atName'] = ohfNameArr[1];
                    }

                    if (data.atName == '') {
                        oAt = data.hfContent;
                    } else {

                    }
                    oHf = data.hfName;
                });

               });*/
            var oAt = '回复<a href="#" class="atName">@' + data.atName + '</a> : ' + data.hfContent;
            var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">' + oAt + '</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">' + now + '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>';
            oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display', 'block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();


        }
    });
</script>
<!--删除评论块-->
<script type="text/javascript">
    $('.commentAll').on('click', '.removeBlock', function () {
        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
        if (oT.siblings('.all-pl-con').length >= 1) {
            oT.remove();
        } else {
            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display', 'none')
            oT.remove();
        }
        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

    })
</script>
<!--点赞-->
<script type="text/javascript">
    $('.comment-show').on('click', '.date-dz-z', function () {
        var zNum = $(this).find('.z-num').html();
        if ($(this).is('.date-dz-z-click')) {
            zNum--;
            $(this).removeClass('date-dz-z-click red');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').removeClass('red');
        } else {
            zNum++;
            $(this).addClass('date-dz-z-click');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').addClass('red');
        }
    })
</script>
<script>
    layui.use(['form', 'layedit', 'laydate', 'upload'], function () {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate,
            upload = layui.upload;
        //监听提交
        form.on('submit(formDemo)', function (data) {
            debugger;
            console.log(1111);

            let formData = new FormData(document.getElementById("addExerciseForm"));
            $.ajax({
                url: "${pageContext.request.contextPath}/course/exercise",
                data: formData,
                type: "post",
                contentType: false,
                processData: false,
                success: function (result) {
                    console.log(result);
                    window.location.reload();

                }
            });
            return false;
        });
    });
</script>
</body>
</html>
