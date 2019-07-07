<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>添加作业</title>
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
<div>
   <div style="display: flex;justify-content: space-around;">


       <div style="display: flex;justify-content: space-around;">

           <form action="${pageContext.request.contextPath}/manage/findChapter" method="get">
               <div style="display: flex;justify-content: space-around;">
                   <div class="layui-form-item">
                       <input type="text" name="info" id="info" lay-verify="pass" placeholder="请输入章节编号或课程名" autocomplete="off"
                              class="layui-input">
                   </div>

                   <a href="javascript:;" class="layui-btn" id="search" style="margin: 0 15px;">
                       <i class="layui-icon">&#xe615;</i> 搜索
                   </a>
               </div>
           </form>
           <form class="layui-form" action="">
               <div class="layui-form-item">
                   <div class="layui-form-mid layui-word-aux">
                       <a href="javascript:;" class="layui-btn layui-btn-small" id="add"
                          style="height:37px;position:relative;top:-7px;line-height:37px;">
                           <i class="layui-icon">&#xe608;</i> 添加作业
                       </a>
                   </div>
               </div>
           </form>
       </div>
   </div>
    <fieldset class="layui-elem-field">
        <div class="layui-field-box layui-form">
            <table class="layui-table admin-table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>作业编号</th>
                    <th>作业名</th>
                    <th>学生学号</th>
                    <th>学生姓名</th>
                    <th>分数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="content">
                </tbody>
            </table>
        </div>
    </fieldset>
    <div class="admin-table-page">
        <div id="paged" class="page">
        </div>
    </div>
</div>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/js/plugins/plugins/layui/layui.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
<script type="text/html" id="tpl">
    {{# layui.each(d.list, function(index, item){ }}
    <tr>
        <td>1</td>
        <td>{{ item.name }}</td>
        <td>{{ item.age }}</td>
        <td>{{ item.age }}</td>
        <td>{{ item.createtime }}</td>
        <td>{{ item.age }}</td>
        <td>
            <a href="javascript:;" data-name="{{ item.name }}" data-opt="edit" class="layui-btn layui-btn-mini"
               id="editBtn" value="批改">批改</a>
            <a href="javascript:;" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">退回</a>
        </td>
    </tr>
    {{# }); }}
</script>
<script>
    function createAjax() {
        var ajax = null;

        try {
            ajax = new ActiveXObject("microsoft.xmlhttp");
        } catch (e) {
            ajax = new XMLHttpRequest();
        }
        return ajax;
    };

    //重新渲染表单
    function renderForm() {
        layui.use('form', function () {
            var form = layui.form;
            form.render();
        });
    }

    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

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
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });
</script>

<script>
    var dataInfo = "";

    layui.config({
        base: 'js/'
    });

    layui.use(['paging', 'form'], function () {
        var $ = layui.jquery,
            paging = layui.paging(),
            layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer, //获取当前窗口的layer对象
            form = layui.form;

        paging.init({
            openWait: true,
            url: 'datas/laytpl_laypage_data.json?v=' + new Date().getTime(), //地址
            elem: '#content', //内容容器
            params: { //发送到服务端的参数
            },
            type: 'GET',
            tempElem: '#tpl', //模块容器
            pageConfig: { //分页参数配置
                elem: '#paged', //分页容器
                pageSize: 3 //分页大小
            },
            success: function () { //渲染成功的回调
                //alert('渲染成功');
            },
            fail: function (msg) { //获取数据失败的回调
                //alert('获取数据失败')
            },
            complate: function () { //完成的回调
                //alert('处理完成');
                //重新渲染复选框
                form.render('checkbox');
                form.on('checkbox(allselector)', function (data) {
                    var elem = data.elem;

                    $('#content').children('tr').each(function () {
                        var $that = $(this);
                        //全选或反选
                        $that.children('td').eq(0).children('input[type=checkbox]')[0].checked = elem.checked;
                        form.render('checkbox');
                    });
                });

                //绑定所有编辑按钮事件
                $('#content').children('tr').each(function () {
                    var $that = $(this);
                    $that.children('td:last-child').children('a[data-opt=edit]').on('click', function () {

                        var toEdit = this.innerHTML == '编辑';
                        this.innerHTML = toEdit ? '确定' : '编辑';
                        $(this).closest('tr').find('td').not(':last,:first').each(function () {
                            if (toEdit) this.innerHTML = '<input type="text" name="email" value="' + this.innerHTML.replace(/"/g, '&quot;') + '" lay-verify="email" autocomplete="off" class="layui-input">';
                            else this.innerHTML = this.firstChild.value.replace(/</g, '&lt;').replace(/>/g, '&gt;');
                        });
                    });

                });

            },
        });

        $('#search').on('click', function () {
            var ajax = createAjax();
            ajax.open("get", "${pageContext.request.contextPath}/manage/findExercise?info=" + $("#info").val());
            ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
            ajax.send();
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4 && ajax.status == 200) {
                    var javaJson = ajax.responseText;
                    var jsonData = eval("(" + javaJson + ")");

                    var obody = $("#content");
                    var trStr = "";
                    for (var i = 0; i < jsonData.length; i++) {
                        trStr += "<tr>" +
                            "<td>" + (i + 1) + "</td>" +
                            "<td>" + jsonData[i].eid + "</td>" +
                            "<td>" + jsonData[i].ename + "</td>" +
                            "<td>" + jsonData[i].uid + "</td>" +
                            "<td>" + jsonData[i].remark + "</td>" +
                            "<td>" + jsonData[i].score + "</td>" +
                            "<td>" +
                            "<a href=\"javascript:;\" data-name=\"{{ item.name }}\" data-opt=\"edit\" class=\"layui-btn layui-btn-mini\" id=\"editBtn\" value=\"批改\">批改</a>" +
                            "<a href=\"javascript:;\" data-id=\"1\" data-opt=\"del\" class=\"layui-btn layui-btn-danger layui-btn-mini\">退回</a>" +
                            "</td>" +
                            "</tr>";
                    }
                    obody.html("");
                    obody.append(trStr);
                    //绑定所有编辑按钮事件

                    $("#content").children("tr").each(function () {
                        var $that = $(this);
                        var eid = $that.children("td:eq(1)").text();
                        var ename = $that.children("td:eq(2)").text();
                        $that.children("td").eq(3).on("change", function () {
                            alert(111);
                        });

                        $that.children("td:last-child").children("a[data-opt=del]").on("click", function () {
                            var name = $that.children("td:eq(4)").text() + "的" + ename;
                            //询问框
                            layerTips.confirm('确定要退回[ <span style="color:red;">' + name + '</span> ] ？', {
                                icon: 3,
                                title: '系统提示'
                            }, function (index) {
                                var ajax = createAjax();
                                alert("${pageContext.request.contextPath}/manage/backExercise?eid=" + $that.children("td:eq(1)").text());
                                ajax.open("get", "${pageContext.request.contextPath}/manage/backExercise?eid=" + $that.children("td:eq(1)").text());
                                ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
                                ajax.send();
                                ajax.onreadystatechange = function () {
                                    if (ajax.readyState == 4 && ajax.status == 200) {
                                        $that.remove();
                                        layerTips.msg('退回成功.');
                                    }
                                }
                            });
                        });

                        $that.children("td:last-child").children("a[data-opt=edit]").on("click", function () {
                            if (addBoxIndex !== -1)
                                return;
                            //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
                            $.get('temp/checkExercise-form.html', null, function (form) {
                                var ajax = createAjax();
                                ajax.open("get", "${pageContext.request.contextPath}/manage//findExercise?info=" + $that.children("td:eq(1)").text());
                                ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
                                ajax.send();
                                ajax.onreadystatechange = function () {
                                    if (ajax.readyState == 4 && ajax.status == 200) {
                                        var javaJson = ajax.responseText;
                                        var jsonData = eval("(" + javaJson + ")");

                                        $("#ename").val(jsonData[0].ename);
                                        $("#demand").val(jsonData[0].demand);
                                        $("#attachment").html(jsonData[0].attachment);
                                        $("#exerContent").val(jsonData[0].content);
                                        $("#score").val(jsonData[0].score);
                                    }
                                }
                                addBoxIndex = layer.open({
                                    type: 1,
                                    title: '批改作业',
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
                                            console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                                            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                                            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                                            //调用父窗口的layer对象
                                            layerTips.open({
                                                title: '这里面是表单的信息',
                                                type: 1,
                                                content: JSON.stringify(data.field),
                                                area: ['500px', '300px'],
                                                btn: ['关闭并刷新', '关闭'],
                                                yes: function (index, layero) {
                                                    var ajax = createAjax();
                                                    ajax.open("get", "${pageContext.request.contextPath}/manage/updateExercise?info=" + JSON.stringify(data.field) + "&content=" + $("#exerContent").val() + "&eid=" + eid);
                                                    ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
                                                    ajax.send();
                                                    ajax.onreadystatechange = function () {
                                                        if (ajax.readyState == 4 && ajax.status == 200) {
                                                            layerTips.msg('你点击了关闭并刷新');
                                                            layerTips.close(index);
                                                            location.reload(); //刷新
                                                        }
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

                    });
                }
            };
        });


        var addBoxIndex = -1;
        $('#add').on('click', function () {
            if ($("#course option:selected").val() == "") {
                alert("请选择一门课程！");
                return;
            }
            if (addBoxIndex !== -1)
                return;
            //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
            $.get('temp/exercise-form.html', null, function (form) {
                addBoxIndex = layer.open({
                    type: 1,
                    title: '添加作业',
                    content: form,
                    /* btn: ['保存', '取消'], */
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
                            console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                            //调用父窗口的layer对象
                            layerTips.open({
                                title: '这里面是表单的信息',
                                type: 1,
                                content: JSON.stringify(data.field),
                                area: ['500px', '300px'],
                                btn: ['关闭并刷新', '关闭'],
                                yes: function (index, layero) {
                                    /* var ajax = createAjax();
                                       ajax.open("get", "
                                    ${pageContext.request.contextPath}/addExercise?cid="+$("#course option:selected").val()+"&info="+JSON.stringify(data.field));
									   		ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
									   		ajax.send();
									   		ajax.onreadystatechange = function(){
								   				if(ajax.readyState == 4 && ajax.status == 200){
								   					layerTips.msg('你点击了关闭并刷新');
													layerTips.close(index);
									   				location.reload(); //刷新
									   			}
									   		} */
                                    layerTips.close(index);
                                    location.reload(); //刷新
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
            var ajax = createAjax();
            ajax.open("get", "${pageContext.request.contextPath}/manage/getCourse");
            ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
            ajax.send();
            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4 && ajax.status == 200) {
                    var javaJson = ajax.responseText;
                    var jsonData = eval("(" + javaJson + ")");
                    var oselect = $("#course");

                    var str = "<option value=\"\" selected=\"\">请选择课程名称</option>";
                    for (var i = 0; i < jsonData.length; i++) {
                        str += "<option value='" + jsonData[i].cid + "'>" + jsonData[i].cname + "</option>";
                    }
                    oselect.html("");
                    oselect.append(str);
                    renderForm();//表单重新渲染，要不然添加完显示不出来新的option
                }
            };
        });

        $('#import').on('click', function () {
            var that = this;
            var index = layer.tips('只想提示地精准些', that, {tips: [1, 'white']});
            $('#layui-layer' + index).children('div.layui-layer-content').css('color', '#000000');
        });
    });
</script>
</body>

</html>