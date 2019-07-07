<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>添加课程</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js">
    </script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/plugins/layui/css/layui.css"
          media="all"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/fonts/font-awesome/css/font-awesome.min.css">
</head>
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
<body>
<div style="margin: 15px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>课程信息录入</legend>
    </fieldset>

    <form action="" method="post" class="layui-form" enctype="multipart/form-data" id="addCourseForm">
        <div class="layui-form-item">
            <label class="layui-form-label">课程名</label>
            <div class="layui-input-block">
                <input type="text" name="cname" lay-verify="title" autocomplete="off" placeholder="请输入课程名"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程类型</label>
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
            <label class="layui-form-label">课程封面</label>
            <div class="layui-input-inline layui-upload">
                <input type="text" name="courseimg" id="courseimg" autocomplete="off" class="layui-input"/>
                <button class="layui-btn" style="float:left;position:relative;left:200px;top:-38px;" id="upPic"><i
                        class="layui-icon"></i> 图文
                </button>
                <input type="file" name="file" class="file" id="fileField" size="28"
                       onchange="document.getElementById('courseimg').value=this.value"/>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">课程简介</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="intro" lay-verify="content"
                          id="LAY_demo_editor"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>

<script>
    //重新渲染表单
    function renderForm() {
        layui.use('form', function () {
            var form = layui.form;
            form.render();
        });
    }

    $("#input").blur(function () {
        $.ajax({
            url: "请求路径",
            data: "请求方法  get  或者 post",
            success: function (data) {
                //data  后台返回的数据  xml/json/string/html 。。。。。 一半是json
                console.log(data);

            }
        });
    });


    onload = function () {

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

    };

    layui.use(['form', 'layedit', 'laydate', 'upload'], function () {
        var form = layui.form,
            layedit = layui.layedit;
        //监听提交按钮
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

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(formDemo)', function (data) {
            console.log(1111);

            let formData = new FormData(document.getElementById("addCourseForm"));
            $.ajax({
                url: "${pageContext.request.contextPath}/courseManage/addCourse",
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

        //
        /* layui.upload({
             elem: '#upPic',
             url: '
        ${pageContext.request.contextPath}/courseManage/addCourse',
            multiple: true,
            before: function () {
                obj.preview(function (index, file, result) {
                    $('#courseimg').attr('src', result); //图片链接（base64）
                });
            },
            done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
            },
            error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    // uploadInst.layui.upload();
                });
            }
        });*/
    });
</script>
</body>

</html>