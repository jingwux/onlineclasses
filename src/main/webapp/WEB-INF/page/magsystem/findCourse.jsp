<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Table</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/global.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/table.css"/>

</head>

<body>
<div class="admin-main">

    <blockquote class="layui-elem-quote" style="padding: 5px">
        <form style="display: flex;flex-direction: row;align-items: center;justify-content: space-between;"
              class="layui-form">
            <div class="layui-form-item" style="margin-bottom: 0;width: 80%;">
                <input type="text" id="courseInfo" name="courseInfo" lay-verify="pass" placeholder="请输入课程编号或课程名"
                       autocomplete="off" class="layui-input">
            </div>
            <button class="layui-btn" lay-submit lay-filter="submit"><i class="layui-icon">&#xe615;</i> 搜索</button>

        </form>
    </blockquote>
    <table id="courseGrid" class="layui-table" lay-filter="courseGridOpt" style="margin-top: -5px;"></table>
</div>
<!--模板-->

<script type="text/html" id="operate">
    <a href="javascript:;" data-id="{{ d.uid }}" lay-event="del" class="layui-btn layui-btn-danger layui-btn-xs">删除</a>
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/layui/layui.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
<script>

    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            table = layui.table,
            layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer, //获取当前窗口的layer对象
            form = layui.form;

        table.render({
            elem: "#courseGrid",
            url: "${pageContext.request.contextPath }/courseManage/listCourse",
            // totalRow: true,
            page: true,
            height: "full-78",
            request: {
                pageName: "pageIndex",  // 自定义分页页码参数名称  默认：page
                limitName: "pageSize"   // 自定义分页大小参数名称  默认：limit
            },
            limit: 15,
            limits: [10, 15, 20, 30, 50],
            cols: [[
                {
                    field: 'index',
                    width: '5%',
                    title: '序号',
                    templet: "<div> {{ d.LAY_TABLE_INDEX+1 }}</div>"
                },
                {field: 'cid', width: '12%', title: '编号', sort: true},
                {field: 'cname', title: '课程名', edit: 'text'},
                {field: 'uname', width: '8%', title: '老师', edit: 'text', templet: "<div>{{ d.users[0].uname }}</div>"},
                {field: 'intro', width: 430, title: '介绍', edit: 'text'},
                // {field: 'startime', width: '12%', title: '开课时间', edit: 'text', sort: true},
                {field: 'total', width: '5%', title: '人数', edit: 'text', sort: true},
                {field: 'operate', width: '8%', title: '操作', templet: "#operate"}
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
            id: 'courseGridReload'
        });


        $('#search').on('click', function () {
            var info = $("#courseInfo").val();
            if (info === "") {
                info = '_';
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/courseManage/listCourse/" + info,
                type: "get",
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if (data.code !== 0) {
                        $("#content").html(data.message);
                        return;
                    }
                    let jsonData = data.data;
                    var obody = $("#content");
                    var trStr = "";
                    for (var i = 0; i < jsonData.length; i++) {
                        trStr += "<tr>" +
                            "<td>" + (i + 1) + "</td>" +
                            "<td>" + jsonData[i].cid + "</td>" +
                            "<td>" + jsonData[i].cname + "</td>" +
                            "<td>" + jsonData[i].users[0].uname + "</td>" +
                            "<td>" + jsonData[i].startime + "</td>" +
                            "<td>" + jsonData[i].total + "</td>" +
                            "<td>" +
                            "<a href=\"javascript:;\" data-name=\"" + jsonData[i].cid + "\" data-opt=\"edit\" class=\"layui-btn layui-btn-mini\" id=\"editBtn\" value=\"编辑\">编辑</a>" +
                            "<a href=\"javascript:;\" data-id=\"" + jsonData[i].cid + "\" data-opt=\"del\" class=\"layui-btn layui-btn-danger layui-btn-mini\">删除</a>" +
                            "</td>" +
                            "</tr>";
                    }
                    obody.html("");
                    obody.append(trStr);
                    //绑定所有编辑按钮事件
                    renderEditBtn();

                }
            });

        });

        // 监听删除操作
        //https://www.layui.com/doc/modules/table.html#ontoolCallback
        table.on("tool(courseGridOpt)", function (obj) {  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var currentRowData = obj.data;  //获得当前行数据
            var layEvent = obj.event;       //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr;                //获得当前行 tr 的DOM对象

            if (/del/.test(layEvent)) {
                layer.confirm('真的删除行么', function (index) {
                    //向服务端发送删除指令
                    $.ajax({
                        url: "${pageContext.request.contextPath}/courseManage/deleteCourse/" + currentRowData.uid,
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


        // 监听编辑操作
        table.on('edit(courseGridOpt)', function (obj) {
            var value = obj.value, //得到修改后的值
                data = obj.data, //得到所在行所有键值
                field = obj.field; //得到字段
            $.ajax({
                url: "${pageContext.request.contextPath}/courseManage/updateCourse",
                type: "get",
                data: "cid=" + data.cid + "&" + field + '=' + encodeURIComponent(value),
                dataType: "json",
                success: function (_data) {
                    if (_data.success) {
                        layer.msg('[ID: ' + data.cid + '] ' + field + ' 字段更改为：' + value);
                    } else {
                        layer.msg(field + ' 字段更改失败', {time: 3000});
                    }
                }
            });

        });

        //搜索按钮
        form.on('submit(submit)', function (data) {
            table.reload('courseGridReload', {
                url: '${pageContext.request.contextPath }/courseManage/listCourseByPage',
                where: {
                    courseInfo: data.field.courseInfo
                },
                page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });

    });


</script>
</body>

</html>