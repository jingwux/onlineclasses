<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>教师详情</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/myCourse.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/css.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/plugins/layui/css/layui.css"
          media="all"/>
    <style>
        .file {
            float: right;
            position: relative;
            top: -70px;
            left: 250px;
            right: 80px;
            height: 24px;
            filter: alpha(opacity:0);
            opacity: 0;
            width: 260px
        }
    </style>
</head>

<body>
<%@include file="../common/header.jsp" %>
<div id="header_class">
    <img src="${pageContext.request.contextPath }/image/${user.headimg}" id="headImg"/>
    <span id="name">${user.uname }</span>
    <span class="info" id="age">${user.age }</span>
    <span class="info" id="gender">${user.gender }</span>
    <span class="info" id="address">${user.address }</span>
    <span class="info" id="profess">${user.profess }</span>
    <a href=""><span class="more_info info">  >更多信息</span></a>
    <a href="${pageContext.request.contextPath}/user/index/setting" class="set-btn"><i class="icon-set"></i>个人设置</a>
</div>

<div id="myclass">
    <div class="find_nav">
        <div class="find_nav_left">
            <div class="find_nav_list">
                <ul>
                    <li class="find_nav_cur" id="listCourse"><a href="javascript:void(0)">我的课程</a></li>
                    <li class="find_nav_cur" id="applyCourse"><a href="javascript:void(0)">申请开课</a></li>
                    <li class="sideline"></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="best_class">
        <div id="best_class_content">
        </div>
    </div>
    <div id="apply_wrapper" style="display: none;">
        <div style="width: 60%; margin: 50px auto; padding-bottom: 20px">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>课程信息录入</legend>
            </fieldset>

            <form action="" method="post" class="layui-form" enctype="multipart/form-data" id="addCourseForm">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 120px;">课程名</label>
                    <div class="layui-input-block">
                        <input type="text" name="cname" lay-verify="title" autocomplete="off" placeholder="请输入课程名"
                               class="layui-input" style="max-width: 60%;">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 120px;">课程类型</label>
                    <div class="layui-input-inline" style="float:left;">
                        <select name="type1" id="type1" lay-filter="type1">
                            <option value="" selected="">请选择课程方向</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="typeid" id="type2">
                            <option value="" selected="">请选择课程分类</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 120px;">课程封面</label>
                    <div class="layui-input-inline layui-upload">
                        <input type="text" name="courseimg" id="courseimg" autocomplete="off" class="layui-input"/>
                        <button class="layui-btn" style="float:left;position:relative;left:200px;top:-38px;" id="upPic">
                            <i
                                    class="layui-icon"></i> 图文
                        </button>
                        <input type="file" name="file" class="file" id="fileField" size="28"
                               onchange="document.getElementById('courseimg').value=this.value"/>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label" style="width: 120px;">课程简介</label>
                    <div class="layui-input-block">
                <textarea class="layui-textarea " name="intro" lay-verify="content"
                          id="LAY_demo_editor" style="max-width: 60%;"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="goDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>

            <div style="width: 100%;margin-top: 100px;">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 60px;">
                    <legend>课程申请记录</legend>
                </fieldset>
                <table id="courseApplyGrid" class="layui-table" lay-filter="courseApplyGridOpt"></table>
            </div>

        </div>
    </div>

    <script>

        loadCourse(1); //进入页面加载用户当前所学课程

        function loadCourse(status) {
            //debugger;

            $.ajax({
                url: "${pageContext.request.contextPath}/user/index/teacher/myCourse",
                async: false,
                success: function (data) {
                    if (data.success) {
                        var jsonData = data.data;
                        var odiv = $("#best_class_content");
                        var divStr = "";
                        for (var i = 0; i < jsonData.length; i++) {
                            divStr += " <div class=\"best_class_ctn\">\n" +
                                "     <div class=\"class_img\">\n" +
                                "         <a href='${pageContext.request.contextPath}/course/teacher/detail?cid=" + jsonData[i].cid + "'><img src=\"${pageContext.request.contextPath}/static/img/course/" + jsonData[i].courseimg + "\"></a>\n" +
                                "     </div>\n" +
                                "     <div class=\"class_detail\">\n" +
                                "         <div class=\"layui-elip\"><span title='" + jsonData[i].cname + "'>" + jsonData[i].cname + "</span></div>\n" +
                                "         <div><span>" + jsonData[i].uname + "</span></div>\n" +
                                "         <div><span>更新：" + jsonData[i].updatetime + "</span></div>\n" +
                                "         <div><span>访问：" + jsonData[i].total + "</span></div>\n" +
                                "         <div><a href='${pageContext.request.contextPath}/course/teacher/detail?cid=" + jsonData[i].cid + "' class=\"layui-btn layui-btn-normal layui-btn-sm\"><span>查看详情</span></a></div>\n" +
                                "     </div>\n" +
                                " </div>";
                        }
                        odiv.html("");
                        odiv.append(divStr);
                    }
                }
            });

        }


    </script>
</div>

<%@include file="../common/footer.jsp" %>
<script type="text/html" id="operate">
    {{# if(d.status === 2) { }}
    <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-disabled">已拒绝</a>
    {{# } else { }}
    <a href="javascript:;" class="layui-btn layui-btn-normal layui-btn-xs">审批中</a>
    {{# } }}
</script>
<script>
    $(".class_name").text().slice(0, 5) + "...";

    $(function () {
        $(".find_nav_list").css("left", sessionStorage.left + "px");
        $(".find_nav_list li").each(function () {
            if ($(this).find("a").text() == sessionStorage.pagecount) {
                $(".sideline").css({left: $(this).position().left});
                $(".sideline").css({width: $(this).outerWidth()});
                $(this).addClass("find_nav_cur").siblings().removeClass("find_nav_cur");
                navName(sessionStorage.pagecount);
                return false
            } else {
                $(".sideline").css({left: 0});
                $(".find_nav_list li").eq(0).addClass("find_nav_cur").siblings().removeClass("find_nav_cur");
            }
        });
        var nav_w = $(".find_nav_list li").first().width();
        $(".sideline").width(nav_w);
        $(".find_nav_list li").on('click', function () {
            nav_w = $(this).width();
            $(".sideline").stop(true);
            $(".sideline").animate({left: $(this).position().left}, 300);
            $(".sideline").animate({width: nav_w});
            $(this).addClass("find_nav_cur").siblings().removeClass("find_nav_cur");
            var fn_w = ($(".find_nav").width() - nav_w) / 2;
            var fnl_l;
            var fnl_x = parseInt($(this).position().left);
            if (fnl_x <= fn_w) {
                fnl_l = 0;
            } else if (fn_w - fnl_x <= flb_w - fl_w) {
                fnl_l = flb_w - fl_w;
            } else {
                fnl_l = fn_w - fnl_x;
            }
            $(".find_nav_list").animate({
                "left": fnl_l
            }, 300);
            sessionStorage.left = fnl_l;
            var c_nav = $(this).find("a").text();
            navName(c_nav);
        });
        var fl_w = $(".find_nav_list").width();
        var flb_w = $(".find_nav_left").width();
        $(".find_nav_list").on('touchstart', function (e) {
            var touch1 = e.originalEvent.targetTouches[0];
            x1 = touch1.pageX;
            y1 = touch1.pageY;
            ty_left = parseInt($(this).css("left"));
        });
        $(".find_nav_list").on('touchmove', function (e) {
            var touch2 = e.originalEvent.targetTouches[0];
            var x2 = touch2.pageX;
            var y2 = touch2.pageY;
            if (ty_left + x2 - x1 >= 0) {
                $(this).css("left", 0);
            } else if (ty_left + x2 - x1 <= flb_w - fl_w) {
                $(this).css("left", flb_w - fl_w);
            } else {
                $(this).css("left", ty_left + x2 - x1);
            }
            if (Math.abs(y2 - y1) > 0) {
                e.preventDefault();
            }
        });
        $('#apply_wrapper').hide();

        $('#listCourse').on('click', function () {
            $('#best_class').show();
            $('#apply_wrapper').hide();
        });


        $('#applyCourse').on('click', function () {
            $('#best_class').hide();
            $('#apply_wrapper').show();

        });
    });

    function navName(c_nav) {
        switch (c_nav) {
            case "资讯":
                sessionStorage.pagecount = "资讯";
                break;
            case "分析":
                sessionStorage.pagecount = "分析";
                break;
            case "黄页":
                sessionStorage.pagecount = "黄页";
                break;
            case "技术":
                sessionStorage.pagecount = "技术";
                break;
            case "项目":
                sessionStorage.pagecount = "项目";
                break;
            case "股市":
                sessionStorage.pagecount = "股市";
                break;
            case "原创":
                sessionStorage.pagecount = "原创";
                break;
            case "经济":
                sessionStorage.pagecount = "经济";
                break;
            case "评论":
                sessionStorage.pagecount = "评论";
                break;
        }
    }

</script>

<script>
    //重新渲染表单
    function renderForm() {
        layui.use('form', function () {
            var form = layui.form;
            form.render();
        });
    }

    $.ajax({
        url: "${pageContext.request.contextPath}/courseTypeManage/getCourseType/0/0",
        success: function (data) {
            var oselect = $("#type1");
            var str = "";
            var courseDirection = data.data;
            for (var i = 0, len = courseDirection.length; i < len; i++) {
                str += "<option value='" + courseDirection[i].typeid + "'>" + courseDirection[i].ctname + "</option>";
            }
            oselect.append(str);
            renderForm();//表单重新渲染，要不然添加完显示不出来新的option

        }
    });

    layui.use(['form', 'layedit', 'laydate', 'upload', 'table'], function () {
        var form = layui.form,
            layer = layui.layer,
            table = layui.table,
            layedit = layui.layedit;

        form.on('select(type1)', function (data) {
            $.ajax({
                url: "${pageContext.request.contextPath}/courseTypeManage/getCourseType/1/" + data.value,
                success: function (data) {
                    var oselect = $("#type2");
                    var courseType = data.data;
                    var str = "<option value=\"\" selected=\"\">请选择课程分类</option>";
                    for (var i = 0, len = courseType.length; i < len; i++) {
                        str += "<option value='" + courseType[i].typeid + "'>" + courseType[i].ctname + "</option>";
                    }
                    oselect.html("");
                    oselect.append(str);
                    renderForm();//表单重新渲染，要不然添加完显示不出来新的option
                }
            });

        });
        form.on('submit(goDemo)', function (data) {
            let formData = new FormData(document.getElementById("addCourseForm"));
            $.ajax({
                url: "${pageContext.request.contextPath}/courseManage/addCourse",
                data: formData,
                type: "post",
                contentType: false,
                processData: false,
                success: function (result) {
                    if (result.success) {
                        layer.msg('提交成功.');

                    } else {
                        layer.alert("提交失败！", {icon: 0});
                    }
                }
            });

            return false;
        });

        table.render({
            elem: "#courseApplyGrid",
            url: "${pageContext.request.contextPath }/course/approveRecords/${user.uid}",
            // totalRow: true,
            page: true,
            // height: "full-135",
            request: {
                pageName: "pageIndex",  // 自定义分页页码参数名称  默认：page
                limitName: "pageSize"   // 自定义分页大小参数名称  默认：limit
            },
            limit: 10,
            limits: [10, 15, 20, 30, 50],
            cols: [[
                {
                    field: 'index',
                    title: '序号',
                    width: 100,
                    templet: "<div> {{ d.LAY_TABLE_INDEX+1 }}</div>"
                },
                {field: 'cid', title: '编号', sort: true},
                {field: 'cname', title: '课程名',width:250},
                {field: 'uname', title: '老师', templet: "<div>{{ d.users[0].uname }}</div>"},
                {field: 'startime', title: '计划开课时间', sort: true},
                {field: 'status', title: '申请状态',width:120, templet: "#operate"},
            ]],
            response: {
                statusCode: 0 //规定成功的状态码，table 组件默认为 0
            },
            parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.data.total, //解析数据长度
                    "data": res.data.list //解析数据列表
                };
            }
        });


    });
</script>
</body>
</html>
