<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="author" content=""/>
    <title>登录</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>

    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-weight: 300;
        }

        body {
            font-family: 'Source Sans Pro', sans-serif;
            color: white;
            font-weight: 300;
        }

        body ::-webkit-input-placeholder {
            /* WebKit browsers */
            font-family: 'Source Sans Pro', sans-serif;
            color: white;
            font-weight: 300;
        }

        body :-moz-placeholder {
            /* Mozilla Firefox 4 to 18 */
            font-family: 'Source Sans Pro', sans-serif;
            color: white;
            opacity: 1;
            font-weight: 300;
        }

        body ::-moz-placeholder {
            /* Mozilla Firefox 19+ */
            font-family: 'Source Sans Pro', sans-serif;
            color: white;
            opacity: 1;
            font-weight: 300;
        }

        body :-ms-input-placeholder {
            /* Internet Explorer 10+ */
            font-family: 'Source Sans Pro', sans-serif;
            color: white;
            font-weight: 300;
        }

        .wrapper {
            background: #50a3a2;
            background: -webkit-linear-gradient(top left, #50a3a2 0%, #53e3a6 100%);
            background: linear-gradient(to bottom right, #50a3a2 0%, #53e3a6 100%);
            opacity: 0.8;
            position: absolute;
            /*top: 50%;*/
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;

        }

        .wrapper.form-success .container h1 {
            -webkit-transform: translateY(85px);
            -ms-transform: translateY(85px);
            transform: translateY(85px);
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 80px 0;
            height: 100%;
            text-align: center;
        }

        .container h1 {
            font-size: 40px;
            -webkit-transition-duration: 1s;
            transition-duration: 1s;
            -webkit-transition-timing-function: ease-in-put;
            transition-timing-function: ease-in-put;
            font-weight: 200;
        }

        form {
            margin-top: -50px;
            padding: 10px 0;
            position: relative;
            z-index: 2;
        }

        form input {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            outline: 0;
            border: 1px solid rgba(255, 255, 255, 0.4);
            background-color: rgba(255, 255, 255, 0.2);
            width: 250px;
            border-radius: 3px;
            padding: 10px 15px;
            margin: 0 auto 10px auto;
            display: block;
            text-align: center;
            font-size: 18px;
            color: white;
            -webkit-transition-duration: 0.25s;
            transition-duration: 0.25s;
            font-weight: 300;
        }

        form input:hover {
            background-color: rgba(255, 255, 255, 0.4);
        }

        form input:focus {
            background-color: white;
            width: 300px;
            color: #53e3a6;
        }

        form .captchaInput {
            width: 150px;
            margin: 0 10px 10px 0;
        }
        form .captchaInput:focus{
            background-color: white;
            width: 180px;
            color: #53e3a6;
            margin: 0 0 10px 0;

        }

        form button {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            outline: 0;
            background-color: white;
            border: 0;
            padding: 10px 15px;
            color: #53e3a6;
            border-radius: 3px;
            width: 250px;
            cursor: pointer;
            font-size: 18px;
            -webkit-transition-duration: 0.25s;
            transition-duration: 0.25s;
        }

        form button:hover {
            background-color: #f5f7f9;
        }

        .bg-bubbles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
        }

        .bg-bubbles li {
            position: absolute;
            list-style: none;
            display: block;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.15);
            bottom: -160px;
            -webkit-animation: square 10s infinite;
            animation: square 10s infinite;
            -webkit-transition-timing-function: linear;
            transition-timing-function: linear;
        }

        .bg-bubbles li:nth-child(1) {
            left: 10%;
        }

        .bg-bubbles li:nth-child(2) {
            left: 20%;
            width: 80px;
            height: 80px;
            -webkit-animation-delay: 2s;
            animation-delay: 2s;
            -webkit-animation-duration: 17s;
            animation-duration: 17s;
        }

        .bg-bubbles li:nth-child(3) {
            left: 25%;
            -webkit-animation-delay: 4s;
            animation-delay: 4s;
        }

        .bg-bubbles li:nth-child(4) {
            left: 40%;
            width: 60px;
            height: 60px;
            -webkit-animation-duration: 22s;
            animation-duration: 22s;
            background-color: rgba(255, 255, 255, 0.25);
        }

        .bg-bubbles li:nth-child(5) {
            left: 70%;
        }

        .bg-bubbles li:nth-child(6) {
            left: 80%;
            width: 120px;
            height: 120px;
            -webkit-animation-delay: 3s;
            animation-delay: 3s;
            background-color: rgba(255, 255, 255, 0.2);
        }

        .bg-bubbles li:nth-child(7) {
            left: 32%;
            width: 160px;
            height: 160px;
            -webkit-animation-delay: 7s;
            animation-delay: 7s;
        }

        .bg-bubbles li:nth-child(8) {
            left: 55%;
            width: 20px;
            height: 20px;
            -webkit-animation-delay: 15s;
            animation-delay: 15s;
            -webkit-animation-duration: 40s;
            animation-duration: 40s;
        }

        .bg-bubbles li:nth-child(9) {
            left: 25%;
            width: 10px;
            height: 10px;
            -webkit-animation-delay: 2s;
            animation-delay: 2s;
            -webkit-animation-duration: 40s;
            animation-duration: 40s;
            background-color: rgba(255, 255, 255, 0.3);
        }

        .bg-bubbles li:nth-child(10) {
            left: 90%;
            width: 160px;
            height: 160px;
            -webkit-animation-delay: 11s;
            animation-delay: 11s;
        }

        @-webkit-keyframes square {
            0% {
                -webkit-transform: translateY(0);
                transform: translateY(0);
            }
            100% {
                -webkit-transform: translateY(-700px) rotate(600deg);
                transform: translateY(-700px) rotate(600deg);
            }
        }

        @keyframes square {
            0% {
                -webkit-transform: translateY(0);
                transform: translateY(0);
            }
            100% {
                -webkit-transform: translateY(-700px) rotate(600deg);
                transform: translateY(-700px) rotate(600deg);
            }
        }

        .loginBar {
            height: 50px;
            line-height: 50px;
            margin: 5px auto;
            border-top: 1px solid #e7e7e7;
            width: 280px;
        }

        .loginBar a {
            margin-right: 10px;
            color: #f1e9e9;
        }

        .loginBar a:hover {
            color: snow;
        }

    </style>
    <script type="text/javascript">
        $(function () {
            //å¾å°ç¦ç¹
            $("#password").focus(function () {
                $("#left_hand").animate({
                    left: "150",
                    top: " -38"
                }, {
                    step: function () {
                        if (parseInt($("#left_hand").css("left")) > 140) {
                            $("#left_hand").attr("class", "left_hand");
                        }
                    }
                }, 2000);
                $("#right_hand").animate({
                    right: "-64",
                    top: "-38px"
                }, {
                    step: function () {
                        if (parseInt($("#right_hand").css("right")) > -70) {
                            $("#right_hand").attr("class", "right_hand");
                        }
                    }
                }, 2000);
            });
            //å¤±å»ç¦ç¹
            $("#password").blur(function () {
                $("#left_hand").attr("class", "initial_left_hand");
                $("#left_hand").attr("style", "left:100px;top:-12px;");
                $("#right_hand").attr("class", "initial_right_hand");
                $("#right_hand").attr("style", "right:-112px;top:-12px");
            });
        });
    </script>
    <script>
        function keyLogin(){
            if (event.keyCode===13){  //回车键的键值为13
                $("#loginForm").submit();
                //document.getElementById("loginForm").click(); //调用登录按钮的登录事件
            }
        }
    </script>
</head>
<body onkeydown="keyLogin()">
<div>

    <div class="wrapper">

        <div class="container">
            <h1>
                <img src="${pageContext.request.contextPath }/static/logo3.svg" width="300px" height="180px"/>
            </h1>
            <form action="${pageContext.request.contextPath}/user/login/login" method="post" id="loginForm"
                  class="form">
                <span id="remind" style="color: #ff3d00;font-weight: bold;margin: -3px 0 3px;display: inline-block;">${msg}</span>
                <div>
                    <span class="u_logo"></span>
                    <input name="name" id="name" type="text" placeholder="邮箱" value="${name}">
                </div>
                <div>
                    <span class="p_logo"></span>
                    <input id="password" value="" name="pwd" id="pwd" type="password" placeholder="请输入密码">
                </div>
                <div style="display: flex;justify-content: center;">
                    <input type="text" class="captchaInput" value="" name="captcha">
                    <img src="${pageContext.request.contextPath}/captcha"  title="点击更换验证码" style="height: 42px;" onclick="reloadCaptcha(this);">
                </div>
                <div>
                    <input type="button" id="login" value="Login"/>
                </div>
                <div class="loginBar">
                    <a href="${pageContext.request.contextPath }/index">返回首页 </a>

                    <a href="${pageContext.request.contextPath }/user/login/forgetPwd"
                    >忘记密码</a>
                    <a href="${pageContext.request.contextPath }/user/register/emailRegister"
                    >邮箱注册</a>
                    <%--<a href="${pageContext.request.contextPath }/user/register/telRegister"
                       style="color:#ccc;margin-right:10px;">手机号注册</a>--%>
                </div>
            </form>
        </div>

        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>

    </div>


</div>
</body>
<script type="text/javascript">
    $('#login').click(function (event) {
        event.preventDefault();
        $('form').fadeOut(500);
        $('.wrapper').addClass('form-success');
        setTimeout(function () {
            $('form').submit();
        }, 500);
    });

    function reloadCaptcha(o) {
        o.src = "${pageContext.request.contextPath}/captcha?time=" + new Date().getTime();
    }
</script>
</html>