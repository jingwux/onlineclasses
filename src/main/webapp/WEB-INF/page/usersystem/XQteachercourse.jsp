<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
    <title>课程详情</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/course.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/comment.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/plugins/layui/css/layui.css"
          media="all"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>

    <style>
        .score-wrapper {
            margin: 40px 0px;
        }

        .score-wrapper li {
            padding: 1px 10px;
            line-height: initial !important;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid rgba(211, 211, 211, 0.51);
        }

        .score-wrapper li span {
            width: 100px;
            overflow-x: hidden;
        }

        .score-wrapper li input {
            position: inherit;
        }

        .score-course span {
            display: inline-block;
            width: 20px;
            position: relative;
            left: 10px;
        }

        .score-course-operate .down {
            clear: none;
            float: none;
        }


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

    <div id="courseTitle">
        <div class="course-info">
            <img src="${pageContext.request.contextPath}/static/img/course/${course.courseimg}"/>

        </div>

        <div class="course-name">
            <span class="course_title">${course.cname }</span>
            <%--<span class="teacher_name">${ }</span>--%>
            <span class="">难度：${course.content }</span>
            <span class="">学习人数：${course.accessnum }</span>
        </div>
    </div>

    <div id="directory">
        <ul>
            <li><a href="javascript:void(0)" style="color:rgb(77, 213, 163);border-bottom: 4px solid rgb(77, 213, 163)">目录</a>
            </li>
            <li><a href="javascript:void(0)" onclick="">资料上传</a></li>
            <li><a href="javascript:void(0)" onclick="checkExercise()">作业</a></li>
            <%--<li><a href="javascript:void(0)">申请开课</a></li>--%>
            <li><a href="javascript:void(0)">评论</a></li>
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
                    <a href="${pageContext.request.contextPath }/course/video?cpid=${chapter.cpid}"><span
                            class="chapter">${chapter.cpname } </span></a>
                    <br>
                    <span class="chapter_description">${chapter.intro}</span>
                    <ul class="chapterUl">
                        <c:forEach var="littleChapter" items="${littleChapterList}" varStatus="count">
                            <c:if test="${littleChapter.cid eq chapter.cpid}">
                                <c:choose>
                                    <c:when test="${littleChapter.flag eq '0'}">
                                        <a href="${pageContext.request.contextPath }/chapterContent?intro=${littleChapter.intro}&chapterName=${chapter.cpname }&littleChapter=${littleChapter.cpname}">
                                            <li>${littleChapter.cpname }</li>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath }/course/video?cpid=${littleChapter.cpid }">
                                            <li>${littleChapter.cpname }</li>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:forEach>
                    </ul>
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
                            <p><span style="font-weight: bold;font-size: 20px">资料上传 </span></p>
                            <p><span>您是该门课的教师，可为该门课上传相关资料!</span></p>
                        </div>
                        <!-- <a href=""><span class="upload">上传资料</span></a> -->
                        <%--<input type="file" name="fileField" id="fileField" size="28"--%>
                        <%--onchange="document.getElementById('textfield').value=this.value"/>--%>
                        <div style="text-align: center;margin-top: 20px;">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn layui-btn-normal" id="chooseFile">选择文件</button>
                                <button type="button" class="layui-btn" id="uploadData">开始上传</button>
                            </div>
                        </div>
                        <ul>
                            <c:forEach var="data" items="${data}" varStatus="count">
                                <a href="${pageContext.request.contextPath }/courseData/download?filename=${data.dname}"
                                   target="_blank"><span
                                        class="down">下载</span>
                                    <li style="text-decoration: underline;">${data.dname}</li>
                                </a>
                            </c:forEach>
                        </ul>
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
                            <div style="display: flex;justify-content: space-between;align-items: center;padding: 10px;margin-top: 20px;">
                                <span style="font-weight: bold;font-size: 20px">课程作业 </span>
                                <button class="layui-btn" onclick="newExer(this)">发布新作业</button>
                            </div>
                            <c:forEach var="exercise" items="${exerciseInfo}" varStatus="count">
                                <div style="margin: 10px;padding: 10px;">
                                    <div style="font-weight: bold;font-size: 18;">
                                        <h3>${exercise.ename}</h3>
                                    </div>
                                    <div>
                                        <p><strong> 内容：</strong>${exercise.content}</p>
                                    </div>
                                    <div>
                                        <p><strong>作业要求：</strong><span>${exercise.demand}</span></p>
                                    </div>
                                    <%--<div>
                                        <p><strong>附件：</strong><a href="${pageContext.request.contextPath }/">${exercise.attachment}</a></p>
                                    </div>--%>
                                </div>


                            </c:forEach>


                        </div>
                        <p><span
                                style="font-weight: bold;font-size: 20px;margin-left: 25px;position: relative;bottom: 10px;">作业上交情况 </span>
                        </p>
                        <!-- <a href="javascript:void(0)"><span class="make_work">布置作业</span></a> -->
                        <ul class="score-wrapper" style="position: relative;bottom: 65px;">
                            <c:forEach var="work" items="${workInfo}">
                                <span>${work.wname}</span>
                                <%--<input name="exercise" value="${exer.content }">--%>
                            </c:forEach>
                        </ul>
                    </div>

                </div>

                <span class="nocontent">暂无作业！</span>
            </div>
            <script type="text/javascript">

                function newExer(that) {
                    layer.open({
                        type: 2,
                        title: false,
                        offset: '100px',
                        scrollbar: false,
                        area: ['500px', '580px'],
                        content: '${pageContext.request.contextPath}/static/temp/exercise-form.html',
                        success: function (layero, index) {
                            var addExerciseForm = $(layero).find("iframe").contents().find("#addExercise");
                            addExerciseForm.find('#cid').val('${course.cid}');
                            addExerciseForm.find('#cname').val('${course.cname}');
                        },
                        yes: function (layero, index) {
                            var addExerciseForm = $(layero).find("iframe").contents().find("#addExercise");
                            addExerciseForm.submit();
                        }
                    });

                }

            </script>
        </div>

        <!-- 作业div结束 -->

        <!-- 申请开课 -->
        <%--<div id="exam">

        </div>--%>
        <!-- 考试div结束 -->

        <!-- 答疑评论div开始 -->
        <div id="question_comment">
            <div class="course_style">
            </div>
            <c:forEach var="question" items="${question}" varStatus="count">
                <div class="course_style">
                    <div class="div_display_none">
                        <!-- 问题区域begin -->
                        <div class="question">
                            <div class="comment-show-con-img pull-left"><img
                                    src="${pageContext.request.contextPath }/static/img/header-img-comment_03.png"
                                    alt=""></div>
                            <div class="comment-show-con-list pull-left clearfix">
                                <div class="pl-text clearfix">
                                    <span class="my-pl-con">&nbsp;${question.qname }:</span>
                                    <a href="#" class="comment-size-name">${question.content} </a>
                                    <input type="hidden" id="qid" value=${question.qid}>
                                    <input type="hidden" id="cid" value=${course.cid}>
                                    <input type="hidden" id="uid" value=${user.uid}>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 问题区域end -->
                    <div class="commentAll">
                        <!--评论区域 begin-->
                        <div class="reviewArea clearfix">
                    <textarea id="commetContent" class="content comment-input" style="padding: 10px;"
                              placeholder="Please enter a comment&hellip;"
                              onkeyup="keyUP(this)"></textarea>
                            <a href="javascript:;" class="plBtn"
                                <%--onclick="jump('${user.uid}', '${course.cid}', '${question.qid}', this)"--%>>回复</a>

                        </div>


                        <!--评论区域 end-->
                        <!--回复区域 begin-->
                        <div class="comment-show">
                            <c:forEach var="comment" items="${comment}" varStatus="count" >
                                <div class="comment-show-con clearfix">
                                    <div class="comment-show-con-img pull-left">
                                        <img src="${pageContext.request.contextPath }/static/img/${user.headimg}"
                                             style="width:48px;height:48px;border-radius:25px;" alt="">
                                    </div>
                                    <div class="comment-show-con-list pull-left clearfix">
                                        <div class="pl-text clearfix"><a href="#"
                                                                         class="comment-size-name">${comment.comid} </a>
                                            <span
                                                    class="my-pl-con"> ${comment.content } </span></div>
                                        <div class="date-dz"><span class="date-dz-left pull-left comment-time">2019-04-20 11:11:11</span>
                                            <div class="date-dz-right pull-right comment-pl-block">
                                                <a href="javascript:;" class="removeBlock">删除</a>
                                                <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                <span class="pull-left date-dz-line">|</span>
                                                <a href="javascript:;" class="date-dz-z pull-left">
                                                    <i class="date-dz-z-click-red"></i>赞 (<i
                                                        class="z-num">${comment.likenum }</i>)
                                                </a>
                                            </div>
                                        </div>
                                        <div class="hf-list-con">

                                        </div>
                                    </div>
                                </div>

                            </c:forEach>

                        </div>
                        <!--回复区域 end-->
                    </div>
                </div>
                <span class="nocontent">暂无问答！</span>
            </c:forEach>
        </div>
        <!-- 答疑评论div结束 -->
        <c:if test="${user.role == 1}">

            <div id="right_content">
                <span class="already_learn">已学 30%</span>
                <div id="progress"></div>
                <div id="progress1"></div>
                <c:choose>
                    <c:when test="${status eq -1}">
                        <a href="javascript:void(0)" class="continue_learn">
                            <div id="continue" class="changeColor startLearn"><span>开始学习</span></div>
                        </a>
                    </c:when>
                    <c:when test="${status eq 0}">
                        <div id="continue" style="background-color:#545C63;"><span>已完成</span></div>
                    </c:when>
                    <c:otherwise>
                        <a href="" class="continue_learn">
                            <div id="continue" class="changeColor"><span>继续学习</span></div>
                        </a>
                    </c:otherwise>
                </c:choose>

                <div class="course_info_tip">
                    <dl class="first">
                        <dt>课程须知</dt>
                        <dd class="autowrap">没有任何C语言经验的应用程序开发者及对C语言技术兴趣的用户。（即使你是完全的新手）</dd>
                    </dl>
                    <dl>
                        <dt>老师告诉你能学到什么？</dt>
                        <dd class="autowrap">1、通过教程学习可以了解C中的变量、变量的类型、常量等概念 2、认识C中的运算符，掌握C中顺序结构、条件结构、循环结构语句。</dd>
                    </dl>
                </div>
            </div>


        </c:if>
        <div id="relate_class">
            <span class="remind_span">推荐课程</span>
            <div class="remind_class">
                <ul>
                    <li><img
                            src="${pageContext.request.contextPath }/image/fdda64581a284227aadde0e529ce8cfb_10.jpg"/><span
                            class="class_title">C#轻松入门</span><br/><span class="access_num">访问人数：2580</span></li>
                    <li><img src="${pageContext.request.contextPath }/image/b8c9e2eecb30428a8bc5b288d9cb4c5e.jpg"/><span
                            class="class_title">C++远征之多态篇</span><br/><span class="access_num">访问人数：180</span></li>
                    <li><img
                            src="${pageContext.request.contextPath }/image/bef881c26975460eb06ae91fe3a0ed4e_21.jpg"/><span
                            class="class_title">JS实现京东无延迟菜单效果</span><br/><span class="access_num">访问人数：336</span></li>
                    <li><img
                            src="${pageContext.request.contextPath }/image/2a5375b29bea461aacc79f628bfb112a_18.jpg"/><span
                            class="class_title">Python操作MySQL数据库</span><br/><span class="access_num">访问人数：1280</span>
                    </li>
                    <li><img
                            src="${pageContext.request.contextPath }/image/c10326d8a9964d1ea64e8c24f69d9f6d_17.jpg"/><span
                            class="class_title">Python-走进Requests库</span><br/><span class="access_num">访问人数：33215</span>
                    </li>
                    <li><img
                            src="${pageContext.request.contextPath }/image/5a32e7bda23c40ebbcd2548f05b3c0cb_7.jpg"/><span
                            class="class_title">初识Java微信公众号开发</span><br/><span class="access_num">访问人数：3569</span></li>
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

    //box-shadow: 2px 4px 6px #e5e5e6;
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
                    "color": "rgb(77, 213, 163)",
                    "border-bottom": "4px solid rgb(77, 213, 163)"
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
//        else if (index == 3) {
//            $("#course_detail").css("display", "none");
//            $("#data_down").css("display", "none");
//            $("#work").css("display", "none");
//            $("#exam").css("display", "block");
//            $("#question_comment").css("display", "none");
        //}
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


    layui.use(['layer', 'upload'], function () {
        var upload = layui.upload;

        var uploadInst = upload.render({
            elem: '#chooseFile'
            , auto: false
            , accept: 'file' //普通文件
            , bindAction: '#uploadData'
            , url: "${pageContext.request.contextPath}/data/upload"     // 上传路径
            , data: {
                cid: ${course.cid}
            }
            , done: function (res) {
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


    function dataClick() {
        var ajax = createAjax();
        let formData = new FormData(document.getElementById("addDataForm"));
        $.ajax({
            url: "${pageContext.request.contextPath}/data/upload",
            data: formData,
            type: "post",
            contentType: false,
            processData: false,
            success: function (result) {
                debugger;
                alert("提交成功");
                console.log("success");
                //window.location.reload();

            },
            error: function (result) {
                debugger;
                console.log("--")
            }
        });
    }

    function checkExercise() {
        // debugger;
        $.ajax({
            url: "${pageContext.request.contextPath}/teacher/course/checkWork?cid=${course.cid}",
            data: "",
            success: function (data) {
                if (data.success) {
                    $('input[name=score]')
                    var jsonData = data.data;
                    var odiv = $("#exerciseDiv ul");
                    var liStr = '';
                    for (var i = 0; i < jsonData.length; i++) {
                        liStr += '<li>' +
                            '<span>' + jsonData[i].uname + '</span>' +
                            '<span class="score-course-name" title="' + jsonData[i].wname + '">' + jsonData[i].wname + '</span>' +
                            '<div class=""><input name="score" style="height: 30px;" id="exId' + jsonData[i].wid + '" value="'+(jsonData[i].data == null ?  " " : jsonData[i].data)+'"><span></span></div>' +    //  用 'exId' + eid 作为 分数框的 id
                            '<div class="score-course-operate" style="width:130px;">' +
                            // 绑定一个onclick事件 setScore(uid, scoreInput),传入uid 跟分数框 节点,点击触发事件，然后异步更新数据
                            '<a href="javascript:;" onclick="setScore( ' + jsonData[i].cid + ',' + jsonData[i].uid + ', exId' + jsonData[i].wid + ' )" ><span class="down">打分</a>' +
                            '<a href="${pageContext.request.contextPath}/teacher/workDownload?filename=' + jsonData[i].wname + '"><span class="down">下载</span></a>' +
                            '</div></li>';
                    }
                    odiv.html("");
                    odiv.append(liStr);
                }
            }
        });
    }

    /**
     * 评分
     * @param uid  学生id
     * @param scoreInput
     */
    //  学生的哪一门课程， 课程id不要嘛
    function setScore(cid, uid, scoreInput) {
        if (scoreInput.value) {
            $.ajax({
                url: "${pageContext.request.contextPath}/teacher/score?uid=" + uid + "&score=" +scoreInput.value + "&cid=" + cid,
                success: function (data) {
                    if (data.success) {
                        scoreInput.nextSibling.innerHTML = "OK";
                    } else {
                        scoreInput.nextSibling.innerHTML = "No";
                    }
                }
            });
        } else {
            // layer.alert("请输入分数",{icon: 3,offset:"auto"});
            alert("请输入分数");
        }
    }

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
<script type="text/javascript">
    function jump(uid, cid, qid, that) {

        var cm = $(that).prev().val();
        // debugger;
        console.log(cm);
        // location.href="/question/commet?uid=" +uid+ "&cid="+cid+"&qid="+ qid + "&info="+var1;
        var url = "${pageContext.request.contextPath}/question/commet?uid=" + uid + "&cid=" + cid + "&qid=" + qid + "&info=" + ($(that).prev().val()) + "1"
        $.ajax({
            url: url,
            success: function (data) {
                // debugger;
                if (data.success) {
                    console.log(data);
                } else {

                }
            }
        });
    }

</script>
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
<!--点击评论创建评论条-->
<script type="text/javascript">
    $('.commentAll').on('click', '.plBtn', function () {
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
        var commentInfo = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        var qid = $('#qid').val();
        var uid = $('#uid').val();
        var cid = $('#cid').val();
        // console.log(commentInfo);
        var that = $(this);
        var url = "${pageContext.request.contextPath}/question/commet?uid=" + uid + "&cid=" + cid + "&qid=" + qid + "&info=" + commentInfo;
        $.ajax({
            url: url,
            success: function (data) {
                // debugger;
                if (data.success) {
                    //动态创建评论模块
                    // debugger;
                    var commentBox = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left">' +
                        '<img src="${pageContext.request.contextPath }/static/img/${user.headimg}" style="width:48px;height:48px;border-radius:25px;" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">${user.uname} </a> <span class="my-pl-con">&nbsp;' +
                        commentInfo + '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">' + now + '</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
                    if (commentInfo.replace(/(^\s*)|(\s*$)/g, "") != '') {
                        that.parents('.reviewArea ').siblings('.comment-show').prepend(commentBox);
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
    $('.comment-show').on('click', '.pl-hf', function () {
        //获取回复人的名字
        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
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
            $(this).addClass('hf-con-block');
            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
        }
    });
</script>
<script type="text/javascript">

</script>
<!--评论回复块创建-->
<script type="text/javascript">
    $('.comment-show').on('click', '.hf-pl', function () {
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
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
        console.log(oHfVal)
        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        var oAllVal = '回复@' + oHfName;
        if (oHfVal.replace(/^ +| +$/g, '') == '' || oHfVal == oAllVal) {

        } else {
            $.getJSON("${pageContext.request.contextPath }/json/pl.json", function (data) {
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
                        oAt = '回复<a href="#" class="atName">@' + data.atName + '</a> : ' + data.hfContent;
                    }
                    oHf = data.hfName;
                });

                var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">' + oAt + '</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">' + now + '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>';
                oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display', 'block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
            });
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
    layui.use(['form', 'laydate', 'upload'], function () {
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
