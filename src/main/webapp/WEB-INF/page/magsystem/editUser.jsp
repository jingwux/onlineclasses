<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>btable</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/plugins/layui/css/layui.css"
          media="all"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/btable.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
    <style>
        .user-table-head {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding: 0 50px;

        }
    </style>
</head>

<body >

<div style="margin:0px; background-color: white; margin:0 10px;padding-top: 5px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin: 0 0 10px 0;">
        <legend>用户信息管理</legend>
    </fieldset>
    <div class="user-table-head">
        <button type="button" id="add" class="layui-btn layui-btn-small" id="getAll">
            <i class="fa fa-plus" aria-hidden="true"></i> 添加老师
        </button>
        <form class="layui-form" style="float:right;">
            <div class="layui-form-item" style="margin:0;">
                <div class="layui-input-inline">
                    <select id="userRole" name="role" lay-filter="userRole">
                        <option value="0" selected="">请选用户角色</option>
                        <option value="1">学生</option>
                        <option value="2">老师</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="info" id="info" placeholder="支持模糊查询.." autocomplete="off"
                           class="layui-input">
                </div>
                <button class="layui-btn" lay-submit lay-filter="submit"><i class="layui-icon">&#xe615;</i> 搜索</button>
            </div>
        </form>
    </div>

    <table id="userGrid" class="layui-table" lay-filter="userGridOpt"></table>

</div>
<!--模板-->
<script type="text/html" id="operate">
    <a href="javascript:;" data-id="{{ d.uid }}" lay-event="del" class="layui-btn layui-btn-danger layui-btn-xs">删除</a>
</script>

<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
<script>

    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            table = layui.table,
            layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer,
            form = layui.form;

        var addBoxIndex = -1;
        $('#add').on('click', function () {
            if (addBoxIndex !== -1)
                return;
            //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
            $.get('${pageContext.request.contextPath}/static/temp/user-form.html', null, function (form) {
                addBoxIndex = layer.open({
                    type: 1,
                    title: '添加教师',
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
                            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                            //调用父窗口的layer对象
                            layerTips.open({
                                title: '这里面是表单的信息',
                                type: 1,
                                content: JSON.stringify(data.field),
                                area: ['500px', '300px'],
                                btn: ['关闭并刷新', '关闭'],
                                yes: function (index, layero) {
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/userManage/addTeacher/" + data.field.uid,
                                        success: function (data) {
                                            if (data.success) {
                                                layer.msg('添加成功！');
                                                layer.close(index);
                                                location.reload(); //刷新
                                            }
                                        }
                                    });
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

        // 加载用户数据列表
        table.render({
            elem: "#userGrid",
            url: "${pageContext.request.contextPath }/userManage/listUser",
            // totalRow: true,
            page: true,
            height: "full-110",
            request: {
                pageName: "pageIndex",  // 自定义分页页码参数名称  默认：page
                limitName: "pageSize"   // 自定义分页大小参数名称  默认：limit
            },
            limit: 15,
            limits: [15, 20, 30, 50],
            cols: [[
                {field: 'index', width: '6%', title: '序号', templet: "<div> {{ d.LAY_TABLE_INDEX+1 }}</div>"},
                {field: 'uid', width: '18%', title: '编号', sort: true},
                {field: 'uname', width: '18%', title: '昵称', edit: 'text'},
                {field: 'gender', width: '5%', title: '性别', edit: 'text'},
                {
                    field: 'role',
                    width: '5%',
                    title: '角色',
                    edit: 'text',
                    templet: "<div> {{ d.role === 1 ? '学生' : '老师' }} </div>"
                },
                {field: 'email', width: '18%', title: '邮箱', edit: 'text'},
                {field: 'tel', width: '18%', title: '电话', edit: 'text'},
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
            }
        });

        // 监听删除操作
        //https://www.layui.com/doc/modules/table.html#ontoolCallback
        table.on("tool(userGridOpt)", function (obj) {  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var currentRowData = obj.data;  //获得当前行数据
            var layEvent = obj.event;       //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr;                //获得当前行 tr 的DOM对象

            if (/del/.test(layEvent)) {
                layer.confirm('真的删除行么', function (index) {
                    //向服务端发送删除指令
                    $.ajax({
                        url: "${pageContext.request.contextPath}/userManage/deleteUser/" + currentRowData.uid,
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
        table.on('edit(userGridOpt)', function (obj) {
            var value = obj.value, //得到修改后的值
                data = obj.data, //得到所在行所有键值
                field = obj.field; //得到字段
            $.ajax({
                url: "${pageContext.request.contextPath}/userManage/updateUser",
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

        // 监听下拉选择则框的change事件，改变就异步加载数据
        form.on('select(userRole)', function (data) {
            table.reload('userGrid', {
                url: '${pageContext.request.contextPath }/userManage/listUserByCondition',
                where: {
                    role: data.value
                }, //设定异步数据接口的额外参数
                page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        });

        //搜索按钮
        form.on('submit(submit)', function (data) {
            table.reload('userGrid', {
                url: '${pageContext.request.contextPath }/userManage/listUserByCondition',
                where: {
                    role: data.field.role,
                    info: data.field.info
                }, //设定异步数据接口的额外参数
                page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        })


    });
</script>
</body>

</html>