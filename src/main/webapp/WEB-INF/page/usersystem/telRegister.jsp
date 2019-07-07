<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>注册</title>
<link rel="icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon"/>
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/gloab.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/register.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/plugins/jquery/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/register.js"></script>
</head>
<body class="bgf4">
<%@include file="../../page/common/header.jsp" %>
<div class="login-box f-mt10 f-pb50">
	<div class="main bgf">    
    	<div class="reg-box-pan display-inline">  
        	<div class="step">        	
                <ul>
                    <li class="col-xs-4 on">
                        <span class="num"><em class="f-r5"></em><i>1</i></span>                	
                        <span class="line_bg lbg-r"></span>
                        <p class="lbg-txt">填写账户信息</p>
                    </li>
                    <li class="col-xs-4">
                        <span class="num"><em class="f-r5"></em><i>2</i></span>
                        <span class="line_bg lbg-l"></span>
                        <span class="line_bg lbg-r"></span>
                        <p class="lbg-txt">验证账户信息</p>
                    </li>
                    <li class="col-xs-4">
                        <span class="num"><em class="f-r5"></em><i>3</i></span>
                        <span class="line_bg lbg-l"></span>
                        <p class="lbg-txt">注册成功</p>
                    </li>
                </ul>
            </div>
            <form action="${pageContext.request.contextPath}/register?type=tel" method="post">
                <input type="hidden" id="type" name="type" value="tel">
                <div class="reg-box" id="verifyCheck" style="margin-top:20px;">
            	<div class="part1">                	
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>用户名：</span>    
                        <div class="f-fl item-ifo">
                            <input type="text" name="name" id="name" maxlength="20" class="txt03 f-r3 required" tabindex="1" data-valid="isNonEmpty||between:3-20||isUname" data-error="用户名不能为空||用户名长度3-20位||只能输入中文、字母、数字、下划线，且以中文或字母开头" />                            <span class="ie8 icon-close close hide"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus"><span>3-20位，中文、字母、数字、下划线的组合，以中文或字母开头</span></label>
                            <label class="focus valid" id="checkLbl"></label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>手机号：</span>    
                        <div class="f-fl item-ifo">
                            <input type="text" name="tel" id="tel"  class="txt03 f-r3 required" keycodes="tel" tabindex="2" data-valid="isNonEmpty||isPhone" data-error="手机号码不能为空||手机号码格式不正确" maxlength="11" /> 
                            <span class="ie8 icon-close close hide"></span>                           
                            <label class="icon-sucessfill blank hide" id="icon-sucessfill"></label>
                            <label class="focus">请填写11位有效的手机号码</label>
                            <label class="focus valid" id="checkLbl1"></label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>密码：</span>    
                        <div class="f-fl item-ifo">
                            <input type="password" name="password" id="password" maxlength="20" class="txt03 f-r3 required" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合" /> 
                            <span class="ie8 icon-close close hide" style="right:55px"></span>
                            <span class="showpwd" data-eye="password"></span>                        
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
                            <label class="focus valid"></label>
                            <span class="clearfix"></span>
                            <label class="strength">
                            	<span class="f-fl f-size12">安全程度：</span>
                            	<b><i>弱</i><i>中</i><i>强</i></b>
                            </label>    
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>确认密码：</span>    
                        <div class="f-fl item-ifo">
                            <input type="password"  name="againpassword" id="againpassword" maxlength="20" class="txt03 f-r3 required" tabindex="4" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-16||isRepeat:password" data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="rePassword" />
                            <span class="ie8 icon-close close hide" style="right:55px"></span>
                            <span class="showpwd" data-eye="rePassword"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">请再输入一遍上面的密码</label> 
                            <label class="focus valid"></label>                          
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>    
                        <div class="f-fl item-ifo">
                            <input type="text" maxlength="4" class="txt03 f-r3 f-fl required" tabindex="4" style="width:167px" id="randCode" data-valid="isNonEmpty" data-error="验证码不能为空" /> 
                            <span class="ie8 icon-close close hide"></span>
                            <label class="f-size12 c-999 f-fl f-pl10">
                            	<img src="${pageContext.request.contextPath}/static/img/yzm.jpg" />                               
                            </label>                        
                            <label class="icon-sucessfill blank hide" style="left:380px"></label>
                            <label class="focusa">看不清？<a href="javascript:;" class="c-blue">换一张</a></label>   
                            <label class="focus valid" style="left:370px"></label>                        
                        </div>
                    </div>
                    <div class="item col-xs-12" style="height:auto">
                        <span class="intelligent-label f-fl">&nbsp;</span>  
                        <p class="f-size14 required"  data-valid="isChecked" data-error="请先同意条款"> 
                        	<input type="checkbox" checked /><a href="javascript:showoutc();" class="f-ml5">我已阅读并同意条款</a>
                        </p>                       
                        <label class="focus valid"></label> 
                    </div> 
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl">&nbsp;</span>    
                        <div class="f-fl item-ifo">
                           <a href="javascript:;" class="btn btn-blue f-r3" id="btn_part1">下一步</a>                         
                        </div>
                    </div> 
                </div>
                <div class="part2" style="display:none">
                	<div class="alert alert-info" style="width:700px">短信已发送至您手机，请输入短信中的验证码，确保您的手机号真实有效。</div>                    
                    <div class="item col-xs-12 f-mb10" style="height:auto">
                        <span class="intelligent-label f-fl">手机号：</span>    
                        <div class="f-fl item-ifo c-blue" id="telInfo">
                            
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>    
                        <div class="f-fl item-ifo">
                            <input type="text" maxlength="6" id="verifyNo" class="txt03 f-r3 f-fl required" tabindex="4" style="width:167px" data-valid="isNonEmpty||isInt" data-error="验证码不能为空||请输入6位数字验证码" /> 
                           	<span class="btn btn-gray f-r3 f-ml5 f-size13" id="time_box" disabled style="width:92px;padding-left:8px;display:none;">发送验证码</span>
                            <span class="btn btn-gray f-r3 f-ml5 f-size13" id="verifyYz" style="width:97px;">发送验证码</span>
                            <span class="ie8 icon-close close hide" style="right:130px"></span>
                            <label class="icon-sucessfill blank hide" id="icon-sucessfill1"></label>
                            <label class="focus"><span>请查收手机短信，并填写短信中的验证码（此验证码3分钟内有效）</span></label>   
                            <label class="focus valid" id="checkLbl2"></label>                        
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <span class="intelligent-label f-fl">&nbsp;</span>    
                        <div class="f-fl item-ifo">
                           <a href="javascript:;" class="btn btn-blue f-r3" id="btn_part2">注册</a>                         
                        </div>
                    </div> 
                </div>
                </div>  
                <div class="part4 text-center" style="display:none">
                	<h4>您已注册成功，现在开始您的学习之旅吧！</h4>
                    <p class="c-666 f-mt30 f-mb50">页面将在 <strong id="times" class="f-size18">5</strong> 秒钟后，跳转到 <a href="http://localhost:8080/HL_Curriculum/page/login.jsp" class="c-blue">登录页面</a></p>
                </div> 
                </form>         
            </div>
        </div>
    </div>
</div>
<div class="m-sPopBg" style="z-index:998;"></div>
<div class="m-sPopCon regcon">
	<div class="m-sPopTitle"><strong>服务协议条款</strong><b id="sPopClose" class="m-sPopClose" onClick="closeClause()">×</b></div>
    <div class="apply_up_content">
    	<pre class="f-r0">
		<strong>同意以下服务条款，提交注册信息</strong>
        </pre>
    </div>
    <center><a class="btn btn-blue btn-lg f-size12 b-b0 b-l0 b-t0 b-r0 f-pl50 f-pr50 f-r3" href="javascript:closeClause();">已阅读并同意此条款</a></center>
</div>
<script>
$("#login_register").hide();

function createAjax(){
	var ajax = null;
	
	try{
		ajax = new ActiveXObject("microsoft.xmlhttp");
	} catch(e){
		ajax = new XMLHttpRequest();
	}
	return ajax;
};

$("#name").blur(function(){
	var ajax = createAjax();
		ajax.open("POST", "${pageContext.request.contextPath}/check?uname="+$(this).val());
		ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
		ajax.send();
		ajax.onreadystatechange = function(){
			if(ajax.readyState == 4 && ajax.status == 200){
				var msg = ajax.responseText;
				if(msg != ""){
					$("#checkLbl").html(msg);
					$(".icon-sucessfill").hide();
					$("#name").attr("class","txt03 f-r3 required v_error");
				}else{
					$(".icon-sucessfill").show();
					$("#name").attr("class","txt03 f-r3 required");
				}
			}
		};
});

$("#tel").blur(function(){
	var ajax = createAjax();
		ajax.open("POST", "${pageContext.request.contextPath}/check?tel="+$(this).val());
		ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
		ajax.send();
		ajax.onreadystatechange = function(){
			if(ajax.readyState == 4 && ajax.status == 200){
				var msg = ajax.responseText;
				if(msg != ""){
					$("#checkLbl1").html(msg);
					$("#icon-sucessfill").hide();
					$("#email").attr("class","txt03 f-r3 required v_error");
				}else{
					$("#icon-sucessfill").show();
					$("#email").attr("class","txt03 f-r3 required");
				}
			}
		};
});

$("#verifyNo").blur(function(){
	var ajax = createAjax();
	ajax.open("POST", "${pageContext.request.contextPath}/checkVerifyNo?verifyNo="+$(this).val());
	ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
	ajax.send();
	ajax.onreadystatechange = function(){
		if(ajax.readyState == 4 && ajax.status == 200){
			var msg = ajax.responseText;
			if(msg != ""){
				$("#checkLbl2").html(msg);
				$("#icon-sucessfill1").hide();
				$("#verifyNo").attr("class","txt03 f-r3 required v_error");
			}else{
				$("#icon-sucessfill1").show();
				$("#verifyNo").attr("class","txt03 f-r3 required");
			}
		}
	};
});

$(function(){	
	//第一页的确定按钮
	$("#btn_part1").click(function(){						
		if(!verifyCheck._click()) return;
		$(".part1").hide();
		$(".part2").show();
		$(".step li").eq(1).addClass("on");
		$("#telInfo").html($("#tel").val());
	});
	//第二页的确定按钮
	$("#btn_part2").click(function(){			
		if(!verifyCheck._click()) return;
		$(".icon-sucessfill").each(function () {
            if($(this).attr("class") == "icon-sucessfill hide"){return;}
        });
		/* $("form").attr("action","${pageContext.request.contextPath}/register?type=tel");
		$("form").attr("method","post");
		$("form").submit(); */
		var ajax = createAjax();
		ajax.open("POST", "${pageContext.request.contextPath}/register?type=tel&name="+$("#name").val()+"&password="+$("#password").val()+"&tel="+$("#tel").val());
		ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
		ajax.send();
		ajax.onreadystatechange = function(){
			if(ajax.readyState == 4 && ajax.status == 200){
				var msg = ajax.responseText;
			}
		};
		
		$(".part2").hide();
		$(".part3").show();
		$(".part4").show();
		$(".step li").eq(2).addClass("on");
		countdown({
			maxTime:10,
			ing:function(c){
				$("#times").text(c);
			},
			after:function(){
				window.location.href="login.jsp";
			}
		});			
	});	
	//第三页的确定按钮
	$("#btn_part3").click(function(){			
		if(!verifyCheck._click()) return;
		$(".part3").hide();
		$(".part4").show();
		$(".step li").eq(2).addClass("on");
		countdown({
			maxTime:5,
			ing:function(c){
				$("#times").text(c);
			},
			after:function(){
				window.location.href="../..";
			}
		});		
	});	
});
function showoutc(){$(".m-sPopBg,.m-sPopCon").show();}
function closeClause(){
	$(".m-sPopBg,.m-sPopCon").hide();		
}

$(".alert-info").hide();
$("#verifyYz").click(function(){
	var ajax = createAjax();
	ajax.open("POST", "${pageContext.request.contextPath}/sendMsg?tel="+$("#telInfo").html());
	ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
	ajax.send();
	ajax.onreadystatechange = function(){
		if(ajax.readyState == 4 && ajax.status == 200){
			var msg = ajax.responseText;
		}
	};	
	$(".alert-info").show();
});
</script>
</body>
</html>
