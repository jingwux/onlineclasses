<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE HTML>
<html lang="zxx">

<head>
    <title>Home</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8"/>
    <meta name="keywords" content=""/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control"    content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>

    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta-Tags -->
    <!-- Stylesheets -->
    <!--// Stylesheets -->
    <!--online fonts-->
    <link href="http://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <!--//online fonts-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/register.css" media="all">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/js/plugins/layui/css/layui.css"
          media="all"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/fonts/font-awesome/css/font-awesome.min.css"/>
    <style>
        body {
            font-family: 'Catamaran', sans-serif;
            font-size: 100%;
            background: linear-gradient(to left top, #0b5d75, #004d7a, #008793, #00bf72, #a8eb12);
            background-size: cover;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            -ms-background-size: cover;
            text-align: center;
            margin-top: 10vh;
        }

        h2 {
            margin: 10px 0;
        }

        .invalidInput {
            border: 1px solid #8c3a3a;
        }

        .validInput:before {
            content: '&#xf058;';
        }
    </style>
</head>

<body>
<%@include file="../common/header.jsp" %>
<h2>用户注册</h2>
<div class="w3ls-login box">
    <!-- form starts here -->
    <form class="layui-form" method="post" autocomplete="off" novalidate>
        <div class="agile-field-txt layui-form-item">
            <div class="input-wrapper">
                <div class="icon">
                    <i class="fa fa-user-circle fa-2x"></i>
                </div>
                <input type="text" name="name" id="uname" placeholder="请输入用户名(2-16位中英文、数字、下划线组合)"
                       lay-verify="username"/>
                <div class="input-msg">
                    <span></span>
                </div>
            </div>
            <%----%>
        </div>
        <div class="agile-field-txt  layui-form-item">
            <div class="input-wrapper">
                <div class="icon">
                    <i class="fa fa-envelope fa-2x"></i>
                </div>
                <input type="email" name="email" id="email" placeholder="请输入邮箱" lay-verify="email"/>
                <input type="hidden" id="type" name="type" value="email">
                <div class="input-msg">
                    <span></span>
                </div>
            </div>
        </div>
        <div class="agile-field-txt  layui-form-item">
            <div class="input-wrapper">
                <div class="icon">
                    <i class="fa fa-lock fa-2x"></i>
                </div>
                <input type="password" name="password" id="password" placeholder="请输入密码" lay-verify="password"/>
                <div class="input-msg">
                    <span class="fa fa-2x"></span>
                </div>
            </div>
        </div>
        <div class="agile-field-txt  layui-form-item">
            <div class="input-wrapper">
                <div class="icon">
                    <i class="fa fa-lock fa-2x"></i>
                </div>
                <input type="password" name="againpassword" id="againpassword" placeholder="确认密码"
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
            <input type="button" value="注册" id="register" lay-submit lay-filter="submit">
        </div>
        <div class="agile-field-txt" style="text-align: center;margin: 10px 0;">
            <a href="${pageContext.request.contextPath }/index">返回首页</a>
        </div>
    </form>
</div>
<!-- //form ends here -->
<!--copyright-->
<div class="copy-wthree">
    <p>Copyright &copy; 2019 lyl.com </p>
</div>
<!--//copyright-->
</body>

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
        $("#uname").blur(function () {
            if (isBlankValue($(this).val())) {
                $(this).parent().removeClass('invalidInput');
                $(this).next().children('span').addClass('fa fa-2x').empty();
                return;
            }

            if (!($(this).val().length>=2 && $(this).val().length<=16)) {
                invalidInputVerify($(this), '用户名长度为2-16位');
                $(this).focus();
                return;
            }
            validUname = verifyWithServer($(this));
        });

        $("#email").blur(function () {
            if (isBlankValue($(this).val())) {
                $(this).parent().removeClass('invalidInput');
                $(this).next().children('span').addClass('fa fa-2x').empty();
                return;
            }

            if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($(this).val())) {
                invalidInputVerify($(this), '邮箱格式不正确');
                $(this).focus();
                return;
            }

            validEmail = verifyWithServer($(this));

        });

        $("#password").blur(function () {
            if (isBlankValue($(this).val())) {
                $(this).parent().removeClass('invalidInput');
                $(this).next().children('span').addClass('fa fa-2x').empty()
                return;
            }

            if (!/^[\S]{6,12}$/.test($(this).val())) {
                invalidInputVerify($(this), '6到12位无空格');
                validPassword = false;
                return;
            }
            validInputVerify($(this))
            validPassword = true;
        });

        $("#againpassword").blur(function () {
            if (isBlankValue($(this).val())) {
                $(this).parent().removeClass('invalidInput');
                $(this).next().children('span').addClass('fa fa-2x').empty()
                return;
            }

            if (!validPassword) {
                invalidInputVerify($(this), '请先确认密码');
                return;
            }

            if ($(this).val() !== $('#password').val()) {
                invalidInputVerify($(this), '密码不一致');
                return;
            }

            validInputVerify($(this))
        });


        // 表单提交在进行一次校验
        // 自定义规则， 为 lay-verify 赋值属性即可
        form.verify({
            username: function (value, item) { //value：表单的值、item：表单的DOM对象
                if (value == null || value.length === 0) {
                    // $(item).addClass('invalidInput');
                    return '用户名不能空';
                }
                if (!(value.length >= 2 && value.length <= 16)) {
                    return '用户名长度必须在2-16位之间';
                }
                if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                    return '用户名不能有特殊字符';
                }

                if (/^\d+\d+\d$/.test(value)) {
                    return '用户名不能全为数字';
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
                if (value !== $('#password').val()) {
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
                        layer.alert("注册成功，点击关闭跳转至登陆页面！", {icon: 1}, function (index) {
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
                flag = data.success;
                if (data.success) {
                    validInputVerify(inputObj);
                } else {
                    invalidInputVerify(inputObj, data.message);
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
</html>