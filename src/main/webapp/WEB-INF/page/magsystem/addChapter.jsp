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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/plugins/layui/css/layui.css"
          media="all"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/fonts/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/global.css" media="all">

</head>

<body>
<div class="admin-main">

    <div style="display: flex;justify-content: space-around;margin-bottom: -32px;">
        <div style="width:45%; ">
            <fieldset class="layui-elem-field layui-field-title" style="margin: 0 0 10px 0;">
                <legend>课程章节信息录入</legend>
            </fieldset>

            <form class="layui-form" action="">
                <div class="layui-form-item" style="display: flex;justify-content: space-around;">
                    <div class="layui-input-inline">
                        <select id="course" name="quiz1" lay-filter="course" lay-search>
                            <option value="" selected="">请选择课程名称</option>
                        </select>
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <a href="javascript:;" class="layui-btn layui-btn-small" id="addOneChapter"
                           style="height:37px;position:relative;top:-7px;line-height:37px;">
                            <i class="layui-icon">&#xe608;</i> 添加一级章节信息
                        </a>
                        <a href="javascript:;" class="layui-btn layui-btn-small" id="addSecondChapter"
                           style="height:37px;position:relative;top:-7px;line-height:37px;">
                            <i class="layui-icon">&#xe608;</i> 添加二级章节信息
                        </a>
                    </div>
                </div>
            </form>
        </div>

        <div style="width:45%; ">
            <fieldset class="layui-elem-field layui-field-title" style="margin: 0 0 10px 0;">
                <legend>课程章节信息查询</legend>
            </fieldset>
            <form class="layui-form">
                <div style="display: flex;justify-content: space-around;">
                    <div class="layui-form-item">
                        <input type="text" name="info" id="info" placeholder="请输入课程名" autocomplete="off"
                               class="layui-input" style="width: 300px;">
                    </div>
                    <div class="layui-form-item">
                        <button class="layui-btn" lay-submit lay-filter="search"><i class="layui-icon">&#xe615;</i> 搜索
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <table id="chapterDataGrid" class="layui-table" lay-filter="chapterGridOpt"></table>
</div>

<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>


<script type="text/html" id="operate">

    {{# if(d.flag == 0) { }}
    <a href="javascript:;" data-id="{{ d.uid }}" lay-event="edit" class="layui-btn layui-btn-xs layui-btn-disabled">绑定视频</a>
    {{# } else { }}
    <a href="javascript:;" data-id="{{ d.uid }}" lay-event="edit" class="layui-btn layui-btn-xs">绑定视频</a>
    {{# } }}
    <a href="javascript:;" data-id="{{ d.uid }}" lay-event="del" class="layui-btn layui-btn-danger layui-btn-xs">删除</a>

</script>
<script>

    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            table = layui.table,
            layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer, //获取当前窗口的layer对象
            form = layui.form;

        table.render({
            elem: "#chapterDataGrid",
            url: "${pageContext.request.contextPath }/chapterManage/listChapter",
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
                {field: 'index', width: '5%', title: '序号', templet: "<div> {{ d.LAY_TABLE_INDEX+1 }}</div>"},
                {field: 'cpid', width: '12%', title: '编号', sort: true},
                {field: 'cpname', width: '16%', title: '章节名', edit: 'text', sort: true},
                {field: 'intro', title: '介绍', edit: 'text'},
                {field: 'cname', width: '16%', title: '课程名'},
                {field: 'filename', width: '20%', title: '文件名'},
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

        form.on('submit(search)', function (data) {
            table.reload('chapterDataGrid', {
                url: '${pageContext.request.contextPath }/chapterManage/findChapter',
                where: {
                    info: data.field.info
                }, //设定异步数据接口的额外参数
                page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        });

        table.on('edit(chapterGridOpt)', function (obj) {
            var value = obj.value, //得到修改后的值
                data = obj.data, //得到所在行所有键值
                field = obj.field; //得到字段
            $.ajax({
                url: "${pageContext.request.contextPath}/chapterManage/updateChapter",
                type: "get",
                data: "cpid=" + data.cpid + "&" + field + '=' + encodeURIComponent(value),
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        layer.msg('[ID: ' + data.cpid + '] ' + field + ' 字段更改为：' + value);
                    } else {
                        layer.msg(field + ' 字段更改失败', {time: 3000});
                    }
                }
            });

        });

        // 监听单元格操作
        //https://www.layui.com/doc/modules/table.html#ontoolCallback
        table.on("tool(chapterGridOpt)", function (obj) {  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var currentRowData = obj.data;  //获得当前行数据
            var layEvent = obj.event;       //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr;                //获得当前行 tr 的DOM对象

            if (/del/.test(layEvent)) {     // 删除
                layer.confirm('真的删除行么', function (index) {
                    //向服务端发送删除指令
                    $.ajax({
                        url: "${pageContext.request.contextPath}/chapterManage/deleteChapter/" + currentRowData.cpid,
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
            } else if (/edit/.test(layEvent)) {
                layer.open({
                    type: 2,
                    title: currentRowData.cname,
                    skin: 'layui-layer-rim', //加上边框
                    area: ['400px', '360px'], //宽高
                    btn: ["确定", "关闭"],
                    content: "${pageContext.request.contextPath}/static/temp/video.html",  //调到新增页面
                    success: function (layero, index) {
                        var videoList = $(layero).find("iframe").contents().find("#video");

                        $.ajax({
                            url: "${pageContext.request.contextPath}/chapterManage/bindVideo/" + currentRowData.cid,
                            type: "get",
                            success: function (data) {
                                if (data.success) {
                                    // layer.msg('绑定成功.');
                                    var d = data.data;
                                    for (var i = 0; i < d.length; i++) {
                                        var s = " <li><input type=\"radio\" name=\"video\" value='" + d[i] + "'> " + d[i] + "</li>";
                                        videoList.append(s);
                                    }

                                } else {
                                    videoList.append(data.message);
                                }
                            }
                        });

                    },
                    yes: function (index, layero) {
                        // 点击确定按钮的操作 -
                        var select = $(layero).find("iframe").contents().find("input[name='video']:checked").val();
                        
                        console.log(select);
                        if (select !== undefined){
                           $.ajax({
                               url: "${pageContext.request.contextPath}/chapterManage/updateChapter",
                               data: "cpid=" + currentRowData.cpid + "&filename=" + select,
                               success: function (data) {
                                   if (data.success) {
                                       layer.msg(select + currentRowData.cpid);
                                       // 更新单元格的值
                                       obj.update({
                                           filename: select
                                       });
                                       layer.close(index);
                                   } else {
                                       layer.alert("绑定失败", {icon: 2})
                                   }
                               }
                           });
                       } else {
                           layer.alert("请选择视频", {icon: 2});

                       }

                    }
                });


            }

        });


        var addBoxIndex = -1;
        $('#addOneChapter').on('click', function () {
            if ($("#course option:selected").val() == "") {
                alert("请选择一门课程！");
                return;
            }
            if (addBoxIndex !== -1)
                return;
            //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
            $.get('${pageContext.request.contextPath}/static/temp/edit-form.html', null, function (form) {
                addBoxIndex = layer.open({
                    type: 1,
                    title: '添加一级章节',
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
                                url: "${pageContext.request.contextPath}/chapterManage/addChapter?cid=" + $("#course option:selected").val() + "&cpname=" + data.field.cpname + "&intro=" + data.field.intro + "&flag=0",
                                data: "",
                                success: function (data) {
                                    if (data.success) {
                                        layerTips.msg('添加成功！');
                                        layerTips.close(index);
                                        location.reload(); //刷新
                                    } else {
                                        layerTips.msg(data.message);
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
        $('#addSecondChapter').on('click', function () {
            if ($("#course option:selected").val() == "") {
                alert("请选择一门课程！");
                return;
            }
            if (addBoxIndex !== -1)
                return;
            //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
            $.get('${pageContext.request.contextPath}/static/temp/chapter-form.html', null, function (form) {
                addBoxIndex = layer.open({
                    type: 1,
                    title: '添加二级章节',
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
                            //调用父窗口的layer对象

                            $.ajax({
                                url: "${pageContext.request.contextPath}/chapterManage/addChapter?cid=" + $("#cid").val() + "&cpname=" + data.field.cpname + "&intro=" + data.field.intro + "&flag=1",
                                data: "",
                                success: function (data) {
                                    if (data.success) {
                                        layerTips.msg('添加成功！');
                                        layerTips.close(index);
                                        location.reload(); //刷新
                                    } else {
                                        layerTips.msg(data.message);
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
                url: "${pageContext.request.contextPath}/chapterManage/listLv1Chapter/" + $("#course").val(),
                success: function (data) {
                    var jsonData = data.data;

                    var oselect = $("#cpid");
                    $('#cid').val(jsonData[0].cid);
                    var str = "<option value=\"\" selected=\"\">请选择章节</option>";
                    for (var i = 0; i < jsonData.length; i++) {
                        str += "<option value='" + jsonData[i].cpid + "'>" + jsonData[i].cpname + "</option>";
                    }
                    oselect.html("");
                    oselect.append(str);
                    renderForm();//表单重新渲染，要不然添加完显示不出来新的option
                }
            });

        });

    });

    //重新渲染表单
    function renderForm() {
        layui.use('form', function () {
            var form = layui.form;
            form.render();
        });
    }

    function initCourseSelect(pageIndex, pageSize = 10) {
        $.ajax({
            url: "${pageContext.request.contextPath}/courseManage/listCourse",
            async: false,
            data: "pageIndex=" + pageIndex + "&pageSize=" + pageSize,
            success: function (data) {
                if (data.success) {
                    var directId = $('#course');
                    var directs = data.data.list;
                    for (var i = 0, len = directs.length; i < len; i++) {
                        directId.append('<option value="' + directs[i].cid + '">' + directs[i].cname + '</option>');
                    }
                    renderForm();
                }
            }
        });
    }


    initCourseSelect(1, 100);

</script>
</body>
<script>
    layui.use(['form'], function () {
        var form = layui.form;
        $('#course').next().children('dl.layui-anim.layui-anim-upbit').on('scroll', function () {
            var pageIndex = 1;
            var scrollTop = this.scrollTop();
            var clientHeight = this.clientHeight;
            var scrollHeight = this.scrollHeight;
            debugger;
            if (scrollHeight - scrollTop - clientHeight <= 10) {
                initCourseSelect(++pageIndex);
            }


        });

    });
</script>
</html>