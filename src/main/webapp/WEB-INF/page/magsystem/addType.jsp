<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>添加资料</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/global.css" media="all">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/plugins/layui/css/layui.css"
          media="all"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/fonts/font-awesome/css/font-awesome.min.css">
</head>

<body>
<div class="admin-main">

    <div style="display: flex;justify-content: space-around;margin-bottom: -28px;">
        <div style="width:30%; ">
            <fieldset class="layui-elem-field layui-field-title" style="margin: 0 0 10px 0;">
                <legend>添加课程类型</legend>
            </fieldset>
            <a href="javascript:;" class="layui-btn layui-btn-small" id="add">
                <i class="layui-icon">&#xe608;</i> 添加课程方向
            </a>
            <a href="javascript:;" class="layui-btn layui-btn-small" id="addType">
                <i class="layui-icon">&#xe608;</i> 添加课程类型
            </a>
        </div>

        <div style="width:65%; " class="layui-form">
            <fieldset class="layui-elem-field layui-field-title" style="margin: 0 0 10px 0;">
                <legend>课程类型查询</legend>
            </fieldset>
            <div style="display: flex;justify-content: space-around;">
                <div class="layui-form-item">
                    <select name="courseDirectId" id="courseDirectId" lay-filter="courseDirectId">
                        <option value="">课程方向</option>
                    </select>
                </div>
                <div class="layui-form-item">
                    <input type="text" name="courseTypeName" id="info" lay-verify="pass" placeholder="请输入课程分类" autocomplete="off"
                           class="layui-input" style="width: 300px;">
                </div>
                <button class="layui-btn" lay-submit lay-filter="search"><i class="layui-icon">&#xe615;</i> 搜索
                </button>
            </div>


        </div>

    </div>
    <table id="typeDataGrid" class="layui-table" lay-filter="typeGridOpt"></table>

</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>

<script type="text/html" id="operate">
    <a href="javascript:;" data-id="{{ d.uid }}" lay-event="del" class="layui-btn layui-btn-danger layui-btn-xs">删除</a>
</script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>
<script>

    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            table = layui.table,
            layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer, //获取当前窗口的layer对象
            form = layui.form;

        table.render({
            elem: "#typeDataGrid",
            url: "${pageContext.request.contextPath }/courseTypeManage/listCourseType",
            // totalRow: true,
            page: true,
            height: "full-110",
            request: {
                pageName: "pageIndex",  // 自定义分页页码参数名称  默认：page
                limitName: "pageSize"   // 自定义分页大小参数名称  默认：limit
            },
            limit: 15,
            limits: [12, 15, 20, 30, 50],
            cols: [[
                {field: 'index', width: '6%', title: '序号', templet: "<div> {{ d.LAY_TABLE_INDEX+1 }}</div>"},
                {field: 'courseTypeId', width: '16%', title: '编号', sort: true},
                {field: 'courseTypeName', width: '16%', title: '课程类型', edit: 'text'},
                {field: 'courseDirectionName', title: '课程方向', edit: 'text'},
                {field: 'operate', width: '12%', title: '操作', templet: "#operate"}
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
            },
            done: function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/courseTypeManage/getCourseType/0/1",
                    success: function (data) {
                        if (data.success) {
                            var directId = $('#courseDirectId');
                            var directs = data.data;
                            for (var i = 0, len = directs.length; i < len; i++) {
                                directId.append('<option value="' + directs[i].typeid + '">' + directs[i].ctname + '</option>');
                            }
                            renderForm();
                        }
                    }
                });

            }
        });

        form.on('submit(search)', function (data) {
            if ((data.field.courseDirectId == null || data.field.courseDirectId === '')
                && (data.field.courseTypeName == null || data.field.courseTypeName === '')){
                return;
            }
            table.reload('typeDataGrid', {
                url: '${pageContext.request.contextPath }/courseTypeManage/list',
                where: {
                    courseDirectId: data.field.courseDirectId,
                    courseTypeName: data.field.courseTypeName
                }, //设定异步数据接口的额外参数
                page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });

        table.on('edit(typeGridOpt)', function (obj) {
            var value = obj.value, //得到修改后的值
                data = obj.data, //得到所在行所有键值
                field = obj.field; //得到字段
            $.ajax({
                url: "${pageContext.request.contextPath}/courseTypeManage/updateUser",
                type: "get",
                data: "uid=" + data.uid + "&" + field + '=' + encodeURIComponent(value),
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        layer.msg('[ID: ' + data.uid + '] ' + field + ' 字段更改为：' + value);
                    } else {
                        layer.msg(field + ' 字段更改失败', {time: 3000});
                    }
                }
            });

        });
        // 监听删除操作
        //https://www.layui.com/doc/modules/table.html#ontoolCallback
        table.on("tool(typeGridOpt)", function (obj) {  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var currentRowData = obj.data;  //获得当前行数据
            var layEvent = obj.event;       //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr;                //获得当前行 tr 的DOM对象

            if (/del/.test(layEvent)) {
                layer.confirm('真的删除行么', function (index) {
                    //向服务端发送删除指令
                    $.ajax({
                        url: "${pageContext.request.contextPath}/courseTypeManage/deleteCourseType/" + currentRowData.uid,
                        type: "get",
                        success: function (data) {
                            if (data.success) {
                                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                layer.close(index);
                                layer.msg('删除成功.');
                            } else {
                                layer.msg('删除失败', {time: 3000});
                            }
                        }
                    });
                });
            }
        });

        // 监听下拉选择则框的change事件，改变就异步加载数据
        form.on('select(courseDirectId)', function (data) {
            
            if (data.value === null || data.value === ''){
                table.reload('typeDataGrid', {
                    url: '${pageContext.request.contextPath }/courseTypeManage/listCourseType',//设定异步数据接口的额外参数
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });
            } else {

                table.reload('typeDataGrid', {
                    url: '${pageContext.request.contextPath }/courseTypeManage/list',
                    where: {
                        courseTypeName: '',
                        courseDirectId: data.value
                    }, //设定异步数据接口的额外参数
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });
            }

        });
    });

    //重新渲染表单
    function renderForm() {
        layui.use('form', function () {
            var form = layui.form;
            form.render();
        });
    }

    layui.use(['form'], function () {
        var $ = layui.jquery,
            layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer, //获取当前窗口的layer对象
            form = layui.form;



        var addBoxIndex = -1;
        $('#add').on('click', function () {
            if (addBoxIndex !== -1)
                return;
            $.get('${pageContext.request.contextPath}/static/temp/directory-form.html', null, function (form) {
                addBoxIndex = layer.open({
                    type: 1,
                    title: '添加课程方向',
                    content: form,
                    btn: ['保存', '取消'],
                    shade: false,
                    offset: ['100px', '30%'],
                    area: ['600px', '400px'],
                    zIndex: 19950924,
                    maxmin: true,
                    yes: function (index) {
                        //触发表单的提交事件
                        $('form.layui-form').find('button[lay-filter=edit]').click();
                    },
                    full: function (elem) {
                        var win = window.top === window.self ? window : parent.window;
                        $(win).on('resize', function () {
                            var $this = $(this);
                            elem.width($this.width()).height($this.height()).css({
                                top: 0,
                                left: 0
                            });
                            elem.children('div.layui-layer-content').height($this.height() - 95);
                        });
                    },
                    success: function (layero, index) {
                        //弹出窗口成功后渲染表单
                        var form = layui.form;
                        form.render();
                        form.on('submit(edit)', function (data) {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/courseTypeManage/addCourseType",
                                data: data.field,
                                success: function (data) {
                                    layerTips.msg(data.message);
                                    if (!data.success) {
                                        layerTips.close(index);
                                        location.reload(); //刷新
                                    }
                                }
                            });
                            //这里可以写ajax方法提交表单
                            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                        });
                        //console.log(layero, index);
                    },
                    end: function () {
                        addBoxIndex = -1;
                    }
                });
            });
        });

        var addBoxIndex = -1;
        $('#addType').on('click', function () {
            if (addBoxIndex !== -1)
                return;
            //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
            $.get('${pageContext.request.contextPath}/static/temp/type-form.html', null, function (form) {
                addBoxIndex = layer.open({
                    type: 1,
                    title: '添加课程类型',
                    content: form,
                    btn: ['保存', '取消'],
                    shade: false,
                    offset: ['100px', '30%'],
                    area: ['600px', '400px'],
                    zIndex: 19950924,
                    maxmin: true,
                    yes: function (index) {
                        //触发表单的提交事件
                        $('form.layui-form').find('button[lay-filter=edit]').click();
                    },
                    full: function (elem) {
                        var win = window.top === window.self ? window : parent.window;
                        $(win).on('resize', function () {
                            var $this = $(this);
                            elem.width($this.width()).height($this.height()).css({
                                top: 0,
                                left: 0
                            });
                            elem.children('div.layui-layer-content').height($this.height() - 95);
                        });
                    },
                    success: function (layero, index) {
                        //弹出窗口成功后渲染表单
                        var form = layui.form;
                        form.render();
                        form.on('submit(edit)', function (data) {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/courseTypeManage/addCourseType",
                                data: data.field,
                                success: function (data) {
                                    layerTips.msg(data.message);
                                    if (!data.success) {
                                        layerTips.close(index);
                                        location.reload(); //刷新
                                    }
                                }
                            });
                            //这里可以写ajax方法提交表单
                            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                        });
                        //console.log(layero, index);
                    },
                    end: function () {
                        addBoxIndex = -1;
                    }
                });
            });
            $.ajax({
                url: "${pageContext.request.contextPath}/courseTypeManage/getCourseType/0/1",
                success: function (data) {
                    var oselect = $("#partype");
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


    });
</script>
</body>

</html>