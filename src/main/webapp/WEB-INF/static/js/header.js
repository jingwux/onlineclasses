//搜索框获取焦点事件
$("input").focus(function() {
	$("input").css("border-bottom", "1px solid #f9a1a1");
	$(".remind_class").hide();
});
//搜索框失去焦点事件
$("input").blur(function() {
	$("input").css("border-bottom", "1px solid #d9dde1");
	$(".remind_class").show();
});