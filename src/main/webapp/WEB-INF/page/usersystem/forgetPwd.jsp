<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>忘记密码</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/gloab.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/register.css" rel="stylesheet">
    <link href="//at.alicdn.com/t/font_1172025_8r9l2z1oh7m.css" rel="stylesheet">

    <%--<script src="${pageContext.request.contextPath}/static/js/register.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>--%>
    <style>
        body {
            height: 100%;
            background: linear-gradient(to left top, #017e6d, #3a8e6e, #3cac7b, #88d2a9);
        }
    </style>
</head>
<body class="bgf4">
<%@include file="../common/header.jsp" %>
<h2>忘记密码</h2>
<div class="w3ls-login box">
    <!-- form starts here -->
    <form class="layui-form" method="post" autocomplete="off" novalidate>
        <div class="agile-field-txt layui-form-item">
            <div class="input-wrapper">
                <div class="icon">
                    <i class="fa fa-envelope fa-2x"></i>
                </div>
                <input type="text" name="email" id="email" placeholder="请输入邮箱账户"
                       lay-verify="email"/>
                <div class="input-msg">
                    <span></span>
                </div>
            </div>
            <%----%>
        </div>
        <div class="agile-field-txt  layui-form-item">
            <div class="input-wrapper">
                <div class="icon">
                    <i class="fa fa-lock fa-2x"></i>
                </div>
                <input type="password" name="newPassword" id="newPassword" placeholder="请输入新密码" lay-verify="password"/>
                <div class="input-msg">
                    <span class="fa fa-2x"></span>
                </div>
            </div>
        </div>
        <div class="agile-field-txt  layui-form-item">
            <div class="input-wrapper">
                <div class="icon">
                    <i class="iconfont icon-confirm-copy" style="font-size: 24px"></i>
                </div>
                <input type="password" name="againpassword" id="againpassword" placeholder="请确认新密码"
                       lay-verify="againpassword"/>
                <div class="input-msg">
                    <span class="fa fa-2x"></span>
                </div>
            </div>
        </div>
        <div class="agile-field-txt captcha-field  layui-form-item">
            <input type="text" name="captcha" placeholder="请输入验证码" lay-verify="required"/>
            <div class="captcha-img">
                <img src="${pageContext.request.contextPath}/captcha" title="点击更换验证码"
                     style="height: 48px;" onclick="reloadCaptcha(this);" id="captchaImg"/>
                <label class="focusa">看不清？
                    <a href="javascript:reloadCaptcha('#captchaImg');" class="c-blue">换一张</a></label>
            </div>
        </div>
        <div class="w3ls-bot  layui-form-item">
            <input type="button" value="提交" id="register" lay-submit lay-filter="submit">
        </div>

    </form>
</div>


<script type="text/javascript"
        src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/plugins/layui/layui.js"></script>

<script>

    layui.use(['layer', 'form'], function () { //独立版的layer无需执行这一句
        var $ = layui.jquery,
            form = layui.form,
            layer = layui.layer; //独立版的layer无需执行这一句

        var validUname = false;
        var validEmail = false;
        var validPassword = false;


        // 失去焦点校验文本框
        $("#email").blur(function () {
            if (isBlankValue($(this).val())) {
                $(this).parent().removeClass('invalidInput');
                $(this).next().children('span').addClass('fa fa-2x').empty()
                return;
            }

            if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($(this).val())) {
                invalidInputVerify($(this), '邮箱格式不正确');
                $(this).focus();
                return;
            }

            validEmail = verifyWithServer($(this));

        });


        $("#newPassword").blur(function () {
            if (isBlankValue($(this).val())) {
                $(this).parent().removeClass('invalidInput');
                $(this).next().children('span').addClass('fa fa-2x').empty();
                return;
            }

            if (!/^[\S]{6,12}$/.test($(this).val())) {
                invalidInputVerify($(this), '6到12位无空格');
                validPassword = false;
                return;
            }
            validInputVerify($(this));
            validPassword = true;
        });

        $("#againpassword").blur(function () {
            if (isBlankValue($(this).val())) {
                $(this).parent().removeClass('invalidInput');
                $(this).next().children('span').addClass('fa fa-2x').empty();
                return;
            }

            if (!validPassword) {
                invalidInputVerify($(this), '请先确认密码');
                return;
            }

            if ($(this).val() !== $('#newPassword').val()) {
                invalidInputVerify($(this), '密码不一致');
                return;
            }

            validInputVerify($(this))
        });

        // 表单提交在进行一次校验
        // 自定义规则， 为 lay-verify 赋值属性即可
        form.verify({
            email: function (value, item) { //value：表单的值、item：表单的DOM对象
                if (value == null || value.length === 0) {
                    // $(item).addClass('invalidInput');
                    return '邮箱不能空';
                }
                if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(value)) {
                    return '邮箱格式不正确';
                }

            }

            //我们既支持上述函数式的方式，也支持下述数组的形式
            //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
            , password: function (value, item) {
                if (value == null || value.length === 0) {
                    // $(item).addClass('invalidInput');
                    return '密码不能空';
                }
                if (!/^[\S]{6,12}$/.test(value)) {
                    return '密码必须6到12位，且不能出现空格';
                }

            },
            againpassword: function (value, item) {
                if (value == null || value.length === 0) {
                    // $(item).addClass('invalidInput');
                    return '请再次输入密码';
                }
                if (value !== $('#newPassword').val()) {
                    return '密码不一致';
                }
            }
        });

        form.on('submit(submit)', function (data) {
            console.log(validUname);
            console.log(validPassword);
            console.log(validEmail);
            if (!(validUname && validPassword && validEmail)) {
                layer.alert("请正确填写信息！", {icon: 0});
                return;
            }

            var id = 0;
            $.ajax({
                // 这里需要改成 找回密码的路径
                url: "${pageContext.request.contextPath}/user/register/register",
                type: "post",
                data: data.field,
                beforeSend: function () {
                    id = layer.load(1, {
                        shade: [0.5, '#000']
                    });
                },
                success: function (data) {
                    layer.close(id);
                    if (data.success) {
                        layer.alert("提交成功，请前往邮箱激活账户！", {icon: 1}, function (index) {
                            layer.close(index);
                            window.location.href = "../login/index";
                        });

                    } else {
                        $(".icon-sucessfill").hide();
                        $("#captchaImg").attr("src", "${pageContext.request.contextPath}/captcha?time=" + new Date().getTime());
                        layer.alert(data.message, {icon: 2});
                    }
                }

            });
        });


    });


    function verifyWithServer(inputObj) {
        var flag = false;
        $.ajax({
            url: "${pageContext.request.contextPath}/user/register/check",
            async: false,
            type: "post",
            data: inputObj.serialize(),
            success: function (data) {
                // debugger;
                flag = !data.success;
                if (!data.success) {
                    validInputVerify(inputObj);
                } else {
                    invalidInputVerify(inputObj, "账户不存在！");
                }
            }
        });
        return flag;
    }

    function reloadCaptcha(o) {
        $(o).attr('src', "${pageContext.request.contextPath}/captcha?time=" + new Date().getTime());
    }

    function invalidInputVerify(obj, msg) {
        obj.parent().addClass('invalidInput')
            .animate({left: "-10px"}, 50)
            .animate({left: "10px"}, 50)
            .animate({left: "-10px"}, 50)
            .animate({left: "10px"}, 50)
            .animate({left: "-10px"}, 50)
            .animate({left: "10px"}, 50)
            .animate({left: "0px"}, 50);
        obj.next().children('span').removeClass().empty().append(msg).css('color', 'red');
    }

    function validInputVerify(obj) {
        obj.parent().removeClass('invalidInput');
        obj.next().children('span').addClass('fa fa-2x').empty().append('&#xf058;').css('color', 'rgb(32, 202, 25)');
        obj.next().children('span').fadeIn(1000);
    }

    function isBlankValue(value) {
        return value == null || value.length === 0;
    }

</script>
</body>
</html>
