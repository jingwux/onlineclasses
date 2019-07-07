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
    <div style="display: flex;justify-content: space-around;">


        <div style="width:85%; ">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>问答评论管理</legend>
            </fieldset>
            <div style="display: flex;justify-content: space-around;">
                <div class="layui-form-item">
                    <input type="text" name="info" id="info" placeholder="请输入评论内容" autocomplete="off" class="layui-input"
                           style="width: 300px;">
                </div>
                <button class="layui-btn" lay-submit lay-filter="search"><i class="layui-icon">&#xe615;</i> 搜索
                </button>
            </div>

        </div>
    </div>

    <table id="commentGrid" class="layui-table" lay-filter="commentGridOpt"></table>
</div>
<script type="text/html" id="operate">
    <a href="javascript:;" data-id="{{ d.uid }}" lay-event="del" class="layui-btn layui-btn-danger layui-btn-xs">删除</a>
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>

<script type="text/html" id="tpl">

</script>

<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            table = layui.table,
            layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer, //获取当前窗口的layer对象
            form = layui.form;

        table.render({
            elem: "#commentGrid",
            url: "${pageContext.request.contextPath }/manage/loadCommet",
            // totalRow: true,
            page: true,
            height: "full-148",
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
                {field: 'comid', title: '评论编号',width: '15%', sort: true},
                {field: 'content', title: '评论内容', width: '25%', edit: 'text'},
                {field: 'cname', title: '评论用户', edit: 'text',},
                {field: 'operate', title: '操作',width: '10%', templet: "#operate"}

            ]],
            response: {
                statusCode: 0 //规定成功的状态码，table 组件默认为 0
            },
            parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.data, //解析数据长度
                    "data": res.data //解析数据列表
                };
            },
            id: 'dataGridReload'
        });

        table.on("tool(commentGridOpt)", function (obj) {  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var currentRowData = obj.data;  //获得当前行数据
            var layEvent = obj.event;       //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr;                //获得当前行 tr 的DOM对象

            if (/del/.test(layEvent)) {
                layer.confirm('真的删除行么', function (index) {
                    //向服务端发送删除指令
                   /* $.ajax({
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
                    });*/
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    layer.msg('删除成功.');
                });
            }
        });

        // 监听编辑操作
        table.on('edit(commentGridOpt)', function (obj) {
            var value = obj.value, //得到修改后的值
                data = obj.data, //得到所在行所有键值
                field = obj.field; //得到字段
            $.ajax({
                url: "${pageContext.request.contextPath}/manage/updateComment",
                type: "get",
                data: "comid=" + data.comid + "&" + field + '=' + encodeURIComponent(value),
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        layer.msg('[ID: ' + data.comid + '] ' + field + ' 字段更改为：' + value);
                    } else {
                        layer.msg(field + ' 字段更改失败', {time: 3000});
                    }
                }
            });

        });

    });
</script>

</body>

</html>