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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/htmleaf-demo.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/comment.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/detail_p.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
    <style>
        div#header{
            box-shadow: none;
        }
        .player-header {
            position: relative;
            display: flex;
            justify-content: space-between;
        }

        .player-header-left, .player-header-right {
            position: relative;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .player-header span {
            display: inline-block;
        }
    </style>
</head>
<body>
<%@include file="../../page/common/header.jsp" %>

<div class="player-video-wrapper">
    <%--<div class="player-header">
        &lt;%&ndash;<div id="title_css" style="display: flex;justify-content: space-between;">&ndash;%&gt;
        <div class="player-header-left">
            <span class="img_span"><img src="${pageContext.request.contextPath }/static/img/leftarrow.png"/></span>
            <span>
                <a href="${pageContext.request.contextPath}/course/video?cpid=${item.cpid}"><span
                        class="chapter_name">${chapter.cpname}</span></a>
            </span>
        </div>
        <div class="player-header-right">
            <span class="img_span"><img src="${pageContext.request.contextPath }/static/img/leftarrow.png"
                                        style="transform: rotate(180deg)"/></span>
            <span>
                <a href="${pageContext.request.contextPath}/course/video?cpid=${item.cpid}"><span
                        class="chapter_name">${chapter.cpname}</span></a>
            </span>
        </div>
    </div>--%>
    <div class="htmleaf-container">
        <div class="videos">
            <!--bottom-->
            <div class="video_b" style="margin-top:0">
                <div class="video_b_in">
                    <div class="video_ls">
                        <video id='my-video' class='video-js' controls preload='auto' width='100%'
                               poster='${pageContext.request.contextPath }/static/img/course/${course.courseimg}' data-setup='{}'>
                            <source src='${pageContext.request.contextPath }/static/video/${chapter.cid}/${chapter.filename}' type='video/mp4'>
                            <%--<source src='${pageContext.request.contextPath }/static/video/MY_VIDEO.webm' type='video/webm'>--%>
                            <p class='vjs-no-js'>
                                To view this video please enable JavaScript, and consider upgrading to a web browser that
                                <a href='https://videojs.com/html5-video-support/' target='_blank'>supports HTML5 video</a>
                            </p>
                        </video>
                        <!--标题-->
                        <div class="title_top">
                            ${chapter.cpname}
                        </div>
                        <!--列表菜单-->
                        <div class="list_right">
                            <a href="javascript:void(0)" id="like"><i class="iconfont icon-xinxing2"></i></a>
                            <a href="javascript:void(0)" id="zan"><i class="iconfont icon-dianzan"></i></a>
                            <a href="javascript:void(0)"><i class="iconfont icon-pinglun"></i></a>
                            <a href="javascript:void(0)"><i class="iconfont icon-zhuanfa"></i></a>
                            <a href="javascript:void(0)"><i class="iconfont icon-gerenyetianjiajiaguanzhu"></i></a>
                        </div>
                        <!--暂停-->
                       <%-- <div id="pass">
                            <img src="${pageContext.request.contextPath }/static/img/zt.png">
                        </div>--%>
                        <!--控制器-->
                       <%-- <div class="controls">
                            <!--进度条容器-->
                            <div id="pBar">
                                <!--进度条底色-->
                                <div class="pBar_bj">
                                    <!--缓冲的进度条-->
                                    <div id="buff"></div>
                                    <!--进度条动态-->
                                    <div id="pBar_move">
                                        <!--进度条按钮-->
                                        <div id="pBtn"></div>
                                    </div>
                                </div>
                            </div>
                            <!--展厅播放快进快退音量全屏-->
                            <div class="trol_list">
                                <!--暂停和快进快退-->
                                <div class="list_1">
                                    <i class="iconfont icon-kuaitui-copy" onClick="ktui()"></i>
                                    <i class="iconfont icon-zanting2" id="ztbf"></i>
                                    <i class="iconfont icon-kuaijin" onClick="kjin()"></i>
                                </div>
                                <!--音量-->
                                <div class="voice">
                                    <i class="iconfont icon-yinliang" style="float:left;"></i>
                                    <div class="voicep">
                                        <div id="vBar">
                                            <div id="vBar_in"></div>
                                        </div>
                                        <div id="vBtn"></div>
                                    </div>
                                </div>
                                <!--时间-->
                                <div class="vtime">
                                    <font id="nTime">00:00:00</font>/<em id="aTime">00:00:00</em>
                                </div>
                                <!--全屏-->
                                <i id="qp" class="iconfont icon-quanping"></i>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="down_div">
        <div id="directory">
            <ul>
                <li><a href="javascript:void(0)" style="color:#f20d0d;">问答评论</a></li>
                <li><a href="javascript:void(0)">同学笔记</a></li>
            </ul>
        </div>
        <!-- 答疑评论div开始 -->
        <div id="question_comment">
            <div class="course_style1">
                <!--发表问题区域 begin-->
                <div class="commentAll" style="border:0px;">
                    <div class="reviewArea clearfix">
                        <textarea id="questionContent" class="content comment-input"
                                  placeholder="Please enter a question&hellip;" onkeyup="keyUP(this)"></textarea>
                        <a href="javascript:;" class="plBtn" id="myQuestion">发表问题</a>
                    </div>
                </div>
                <!--发表问题区域 end-->
            </div>
            <c:forEach var="question" items="${question}" varStatus="count">
                <div class="course_style">
                    <div class="div_display_none">
                        <!-- 问题区域begin -->
                        <div class="question">
                            <div class="comment-show-con-img pull-left"><img
                                    src="${pageContext.request.contextPath }/static/img/header-img-comment_03.png"
                                    alt="">
                            </div>
                            <div class="comment-show-con-list pull-left clearfix">
                                <div class="pl-text clearfix">
                                    <a href="#" class="comment-size-name">${question.remark} : </a>
                                    <span class="my-pl-con">&nbsp;${question.qname }</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 问题区域end -->
                    <div class="commentAll">
                        <!--评论区域 begin-->
                        <div class="reviewArea clearfix">
                            <textarea class="content comment-input" placeholder="Please enter a comment&hellip;"
                                      onkeyup="keyUP(this)"></textarea>
                            <a href="javascript:;" class="plBtn">评论</a>
                        </div>
                        <!--评论区域 end-->
                        <!--回复区域 begin-->
                        <div class="comment-show">
                            <div class="comment-show-con clearfix">
                                <div class="comment-show-con-img pull-left"><img
                                        src="${pageContext.request.contextPath }/static/img/header-img-comment_03.png"
                                        alt=""></div>
                                <div class="comment-show-con-list pull-left clearfix">
                                    <c:forEach var="comment" items="${comment}" varStatus="count">
                                        <c:if test="${comment.qid eq question.qid}">
                                            <div class="pl-text clearfix">
                                                <a href="#" class="comment-size-name">${comment.comid} : </a>
                                                <span class="my-pl-con">&nbsp;${comment.content }</span>
                                            </div>
                                            <div class="date-dz">
                                                <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                                <div class="date-dz-right pull-right comment-pl-block">
                                                    <a href="javascript:;" class="removeBlock">删除</a>
                                                    <a href="javascript:;"
                                                       class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                    <span class="pull-left date-dz-line">|</span>
                                                    <a href="javascript:;" class="date-dz-z pull-left"><i
                                                            class="date-dz-z-click-red"></i>赞 (<i
                                                            class="z-num">${comment.likenum }</i>)</a>
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="hf-list-con" style="display:block;">
                                                <%--<c:forEach var="replay" items="${}" varStatus="count">
                                                    <c:if test="${comment.comid }">
                                                        <div class="all-pl-con">
                                                            <div class="pl-text hfpl-text clearfix">
                                                                <a href="#" class="comment-size-name">${replay.uid} : </a>
                                                                <span class="my-pl-con">回复
                                                                <a href="#" class="atName">@${} </a> :  ${}</span></div><div class="date-dz">
                                                                <span class="date-dz-left pull-left comment-time">2018-5-11 9:11:54</span>
                                                                <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a>
                                                                    <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                                                    <span class="pull-left date-dz-line">|</span>
                                                                    <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">${replay.likenum }</i>)</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>--%>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!--回复区域 end-->
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- 答疑评论div结束 -->

        <div id="relate_class">
            <span class="remind_span">推荐课程</span>
           <%-- <div class="remind_class">
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
            </div>--%>
        </div>
    </div>

</div>

<script src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery.min.js"
        type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/vedio.js"></script>

<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/js/plugins/jquery-ui/jquery.flexText.js"></script>

<!--textarea高度自适应-->
<script type="text/javascript">
    $(function () {
        $('.content').flexText();
    });

    $(".remind_class ul li").mouseover(function () {
        $(this).find("img").css("box-shadow", "0px 5px 10px 5px #b7babc");
        $(this).find(".class_title").css("color", "#cc1500");
    });

    $(".remind_class ul li").mouseout(function () {
        $(this).find("img").css("box-shadow", "0px 5px 10px 5px #f8fafc");
        $(this).find(".class_title").css("color", "#000");
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
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        console.log(oSize);
        //动态创建评论模块
        oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="${pageContext.request.contextPath }/image/${user.headimg}" style="width:48px;height:48px;border-radius:25px;" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">David Beckham : </a> <span class="my-pl-con">&nbsp;' + oSize + '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">' + now + '</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
        if (oSize.replace(/(^\s*)|(\s*$)/g, "") != '') {
            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value', '').siblings('pre').find('span').text('');
        }
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
</body>
</html>