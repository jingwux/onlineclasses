<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>个人资料</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/plugins/layui/css/layui.css"
          media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/global.css" media="all">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/setting.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/css.css">
    <link href="${pageContext.request.contextPath}/static/css/gloab.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/register.css" rel="stylesheet">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/register.js"></script>
    <style>
        .focus {
            width: 200px;
            position: absolute;
            top: 10px;
            left: 101%;
        }

        .info-wrapper {
            width: 60%;
            margin: 50px auto;
        }

        .info-wrapper form {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
<!-- 引入头部页面 -->
<%@include file="../../page/common/header.jsp" %>
<div class="find_nav">
    <div class="find_nav_left">
        <div class="find_nav_list">
            <ul>
                <li class="find_nav_cur"><a href="javascript:void(0)">个人资料</a></li>
                <li class="modifyPwd"><a href="javascript:void(0)">修改密码</a></li>
                <li class="sideline"></li>
            </ul>
        </div>
    </div>

</div>
<div class="info-wrapper">
    <form class="layui-form" action="${pageContext.request.contextPath }/user/updateInfo" method="post"
          enctype="multipart/form-data">
        <div id="headImgDiv" class="layui-input-block">
            <div id="addCommodityIndex">
                <!--input-group start-->
                <div class="input-group row">
                    <%--<div class="col-sm-3">
                        <label>上传头像</label>
                    </div>--%>
                    <%-- <div class="col-sm-9 big-photo">
                         <div id="preview">
                             <img id="imghead" border="0"
                                  src="${pageContext.request.contextPath }/static/img/${user.headimg}" width="90"
                                  height="90">
                         </div>
                         <input type="file" id="imgId" name="filename" onchange="previewImage(this)" id="previewImg">
                     </div>--%>

                    <div class="layui-upload">
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="previewAvatar"
                                 width="160px" src="${pageContext.request.contextPath }/static/img/${user.headimg}">
                            <p id="demoText"></p>
                        </div>
                        <button type="button" class="layui-btn" id="uploadAvatar">上传头像</button>

                    </div>

                </div>
                <!--input-group end-->
            </div>
        </div>
        <div id="infoDiv" class="layui-input-block">
            <div class="layui-form-item">
                <label class="layui-form-label">昵称</label>
                <div class="layui-input-block">
                    <input type="hidden" name="uid" id="uid" value="${user.uid }"/>
                    <input type="hidden" name="password" id="pwd" value="${user.password }"/>
                    <input type="text" name="uname" value="${user.uname }" lay-verify="title" autocomplete="off"
                           placeholder="请输入昵称" class="layui-input">
                    <input type="hidden" name="headimg" id="headImg" value="document.getElementById('imgId').value"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <c:choose>
                        <c:when test="${user.gender eq '男' }">
                            <input type="radio" name="gender" value="男" title="男" checked="">
                            <input type="radio" name="gender" value="女" title="女">
                            <input type="radio" name="gender" value="禁" title="禁用" disabled="">
                        </c:when>
                        <c:otherwise>
                            <input type="radio" name="gender" value="男" title="男">
                            <input type="radio" name="gender" value="女" title="女" checked="">
                            <input type="radio" name="gender" value="禁" title="禁用" disabled="">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-block">
                    <input type="text" name="age" value="${user.age}" lay-verify="required" placeholder="请输入年龄"
                           autocomplete="off" class="layui-input"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机</label>
                <div class="layui-input-inline">
                    <input type="tel" name="tel" id="tel" value="${user.tel}" lay-verify="phone" placeholder="请输入手机号"
                           autocomplete="off" class="layui-input"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" name="email" id="email" value="${user.email}" lay-verify="email"
                           placeholder="请输入邮箱" autocomplete="off" class="layui-input"/>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">地区</label>
                <div class="layui-input-inline">
                    <select name="quiz1" id="provinceId" lay-filter="provinceId">
                        <option value="" selected="">请选择省</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="quiz2" id="cityId" lay-filter="cityId">
                        <option value="" selected="">请选择市</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">简介</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入简介" name="intro" id="intro"
                              class="layui-textarea">${user.intro}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="submit" value="立即提交" class="layui-btn" lay-submit="" lay-filter="demo1">
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </div>
    </form>

</div>
<div id="modifyPwdDiv">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>修改密码</legend>
    </fieldset>

    <form class="updatePwdForm" class="layui-form">
        <div class="layui-form-item">
            <span class="layui-form-label"><b class="ftx04">*</b>旧密码：</span>
            <div class="layui-input-block">
                <input type="password" name="oldPwd" id="oldpassword" lay-verify="required" class="layui-input"/>
                <span id="checkLbl" class="focus valid"></span>
            </div>
        </div>
        <div class="layui-form-item">
            <span class="layui-form-label"><b class="ftx04">*</b>新密码：</span>
            <div class="layui-input-block">
                <input type="password" id="newPwd" name="newPwd" maxlength="20" lay-verify="required"
                       class="layui-input"/>
                <span id="repwdErrorInfo" class="focus valid"></span>
            </div>
        </div>
        <div class="layui-form-item">
            <span class="layui-form-label"><b class="ftx04">*</b>确认密码：</span>
            <div class="layui-input-block">
                <input type="password" name="rePwd" lay-verify="required" id="rePassword" class="layui-input"/>
                <span id="pwdErrorInfo" class="focus valid"></span>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 210px;">
            <input type="submit" value="提交" id="submitBtn" class="layui-btn" lay-submit
                   lay-filter="updatePswd"/>
        </div>
    </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>

<script type="text/javascript">
    layui.use(['form', 'layer'], function () {
        var form = layui.form,
            layer = layui.layer;

        form.on('submit(updatePswd)', function (data) {

            if (/旧密码错误/.test($('#checkLbl').text())) {
                layer.alert('旧密码错误', {icon: 2});
                return false;
            }
            if ($('#newPwd').val() == null || $('#newPwd').val() == "") {
                layer.alert('新密码不能为空', {icon: 2});
                return false;
            }
            if ($('#rePassword').val() == null || $('#rePassword').val() == "") {
                layer.alert('确认密码不能为空', {icon: 2});
                return false;
            }
            if ($('#newPwd').val() == $('#oldpassword').val()) {
                layer.alert('新密码不能与原密码相同', {icon: 2});
                return false;
            }
            if ($('#newPwd').val() != $('#rePassword').val()) {
                layer.alert('密码不一致', {icon: 2});
                return false;
            }
            $.ajax({
                url: "${pageContext.request.contextPath }/user/setting/updatePwd?uid=" + $('#uid').val() + "&pwd=" + $('#rePassword').val(),
                data: "",
                success: function (data) {
                    console.log(data);
                    if (data.success) {
                        alert("密码修改成功！请重新登录");
                        window.location.href = "${pageContext.request.contextPath}/user/login/index";
                    }
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
    });

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/city.js"></script>
<script>
    //重新渲染表单
    function renderForm() {
        layui.use('form', function () {
            var form = layui.form;
            form.render();
        });
    }


    layui.use(['form', 'layedit', 'laydate', 'upload'], function () {
        var form = layui.form,
            upload = layui.upload,
            layer = layui.layer;

        initProvince();
        if ("${user.address}" != "") {
            var address = "${user.address}";
            var adr = address.split('&');
            // debugger;
            $("#provinceId").val(adr[0]);
            selectMenu(1);
            $("#cityId").val(adr[1]);
        }
        renderForm();//表单重新渲染，要不然添加完显示不出来新的option

        if ($("#tel").val() != "") {
            $("#tel").attr("readonly", "readonly");
        }
        if ($("#email").val() != "") {
            $("#email").attr("readonly", "readonly");
        }

        form.on('select(provinceId)', function (data) {
            selectMenu(1);
            renderForm();//表单重新渲染，要不然添加完显示不出来新的option
        });
        form.on('select(cityId)', function (data) {
            renderForm();//表单重新渲染，要不然添加完显示不出来新的option
        });


        //普通图片上传
        var uploadInst = upload.render({
            elem: '#uploadAvatar'
            , url: '${pageContext.request.contextPath }/user/updateAvatar'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#previewAvatar').attr('src', result); //图片链接（base64）
                });
            }
            , data: {
                uid: ${user.uid}
            }
            , done: function (res) {
                //如果上传失败
                if (!res.success) {
                    return layer.msg('上传失败');
                }
                //上传成功
                layer.msg('上传成功');
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;" style="position: relative;left: 50px;">上传失败</span>' +
                              '<a class="layui-btn  demo-reload" style="position: relative;top: 48px;left: 38px;">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

    });

    $(".find_nav_cur").click(function () {
        $("#modifyPwdDiv").hide();
        $(".info-wrapper").show();
    }); //点击个人资料
    $(".modifyPwd").click(function () {
        $("#modifyPwdDiv").show();
        $(".info-wrapper").hide();
    }); //点击修改密码

    $("#oldpassword").blur(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/user/setting/checkOldPwd?type=0&uid=${user.uid}&oldpassword=" + $("#oldpassword").val(),
            data: "post",
            success: function (data) {
                //debugger;
                if (data.success) {
                    $("#checkLbl").text(data.data);
                    $("#checkLbl").css({
                        "color": "#00ff00",
                        "width": "100px"
                    });
                } else {
                    $("#checkLbl").text(data.data);
                    $("#checkLbl").css({
                        "color": "red",
                        "width": "120px"
                    });
                    return false;
                }
            }
        })
    });
    $("#rePassword").blur(function () {
        console.log($('#password').val() != $('#rePassword').val());
        if ($('#rePassword').val() == null || $('#rePassword').val() == "") {
            $("#pwdErrorInfo").text("确认密码不能为空");
            $("#pwdErrorInfo").css("color", "red");
            return false;
        } else if ($('#newPwd').val() != $('#rePassword').val()) {
            $("#pwdErrorInfo").text("密码不一致");
            $("#pwdErrorInfo").css("color", "red");
            return false;
        } else {
            $("#pwdErrorInfo").text("验证通过");
            $("#pwdErrorInfo").css("color", "#00ff00");
        }
    });

    $("#newPwd").blur(function () {
        console.log($('#password').val() != $('#rePassword').val());
        if ($('#newPwd').val() == null || $('#newPwd').val() == "") {
            $("#repwdErrorInfo").text("新密码不能为空");
            $("#repwdErrorInfo").css("color", "red");
            return false;
        } else if ($('#newPwd').val() == $('#oldpassword').val()) {
            $("#repwdErrorInfo").text("新密码不能与原密码相同");
            $("#repwdErrorInfo").css("color", "red");
            return false;
        } else {
            $("#repwdErrorInfo").text("验证通过");
            $("#repwdErrorInfo").css("color", "#00ff00");
        }
    });
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

    //图片上传预览    IE是用了滤镜。
    function previewImage(file) {
        var MAXWIDTH = 90;
        var MAXHEIGHT = 90;
        var div = document.getElementById('preview');
        if (file.files && file.files[0]) {
            div.innerHTML = '<img id=imghead onclick=$("#previewImg").click()>';
            var img = document.getElementById('imghead');
            img.onload = function () {
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width = rect.width;
                img.height = rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top + 'px';
            }
            var reader = new FileReader();
            reader.onload = function (evt) {
                img.src = evt.target.result;
            }
            reader.readAsDataURL(file.files[0]);
        } else //兼容IE
        {
            var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
            div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
        }
    }

    function clacImgZoomParam(maxWidth, maxHeight, width, height) {
        var param = {top: 0, left: 0, width: width, height: height};
        if (width > maxWidth || height > maxHeight) {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if (rateWidth > rateHeight) {
                param.width = maxWidth;
                param.height = Math.round(height / rateWidth);
            } else {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }
</script>
</body>
</html>