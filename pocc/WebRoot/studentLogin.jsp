<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<link rel="icon" href="image/icon.png">
<title>华南师范大学计算机组成原理实验平台</title>
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.4-dist/css/bootstrap.min.css">
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap-3.3.4-dist/js/bootstrap.js"></script>
<!-- Bootstrap..-->
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="华南师范大学,实验平台,计算机组成原理">
<meta http-equiv="description" content="计算机组成原理实验平台">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
html{
	font:12px Helvetica,Arial,sans-serif;
	height: 100%;
}
body {
	height: 100%;
}
<%!int i=0;%>
.main{
	min-height:600px;
	height:100%;
	background-image: url("image/<%=i++%>.jpg");
	background-size:100% 100%;
}
<%i=i%5;%>
header{
	height:70px;
	padding-bottom:15px;
}
header .container{
	padding-top:15px;
}
form{
	width:300px;
	margin:6% auto;
}
label{
	font-size:14px;
	font-family: STHeiti,"Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;
	color:#888989;
}
input{
	width:285px !important;
	height:41px !important;
}
.form-control{
	background-color:transparent;
	color:white;
}
.row {
	margin-top:10px;
	margin-left:25px;
	width:300px;
	height:65px;
}
.row-box{
	margin-top:7px;
	margin-left:25px;
	width:300px;
	height:25px;
}
.row-box input{
	width:13px !important;
	height:13px !important;
}
.row-box span{
	display:block;
	font-family: STHeiti,"Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;
	color:#eeeeee;
	float:left;
}
.row-box a{
	display: inline-block;
	float:right;
	margin-right:10px;
	font-family: STHeiti,"Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei",sans-serif;
	text-decoration: none;
	color:#65C17A;
}
.btn-success{
	width:285px;
	height:41px;
	font-size: 16px;
}
.tips{
	color:red;
	margin-left:5px;
	visibility: hidden;
}
</style>
</head>

<body>
	<div class="main">
	<header>
		<div class="container">
			<img alt="" src="image/banner5.png" width="217" height="48">
		</div>
	</header>
		<form method="post" action="VerifyLoginServlet">
			<div class="row">
				<input class="form-control" type="text" id="userName" name="userName" placeholder="账号"  required="required" />
				<span class="tips">账号不存在</span>
			</div>
			<div class="row">
				<input class="form-control" type="password" id="password" name="password" placeholder="密码"   required="required" />
				<span class="tips">密码错误</span>
			</div>

			<%--Start  Code--%>
			<div class="row">
				<div id="div_geetest_lib"></div>
				<div id="div_id_embed"></div>
				<span class="tips">验证码错误</span>

				<%--End  Code--%>

				<script type="text/javascript">
				$(function(){
					$(":input").focus(function(){
			             resetCss();
			        });
		        	$(".form-control").focus(function(){//输入框聚焦
						$(this).css("background-color","white");
						$(this).css("color","black");
					});
					$(".form-control").blur(function(){//输入框失焦
						if($(this).val()==""){
							$(this).css("background-color","transparent");
						}
					});
				});
				function resetCss(){
					$(":input").css("border-color","");//清除边框样式
					$(".tips").css("visibility","hidden");
				}
				function geetest_ajax_results() {//先用ajax提交检测验证码
					//TODO, not necessory a geetest ajax demo,
					$.ajax({
						url : "VerifyLoginServlet",//todo:set the servelet of your own
						type : "post",
						data : gt_captcha_obj.getValidate(),//这个不知道是什么鬼，只能提交一个东西，然后检测到验证码。
						success : function(sdk_result) {
							if(sdk_result=="captchasCorrect"){//当验证码正确时，被迫再次提交一次信息。
								$(".tips:eq(2)").css("visibility","hidden");
								checkForm();
								gt_captcha_obj.refresh();
							}else{//验证码错误提示
								$(".tips:eq(2)").css("visibility","visible");
								gt_captcha_obj.refresh();
							}
						}
					});
				}
				function checkForm(){//再次使用ajax提交检测用户信息
					$.ajax({
						url : "User_Login.action",//todo:set the servelet of your own
						type : "post",
						data : {
							userName:$("#userName").val(),
							password:$("#password").val(),
						},
						success : function(data) {
							if(data.result=="User_NotFound"){//用户不存在
								$(".tips:eq(0)").css("visibility","visible");
								$("#userName").css("border-color","red");
							}else if(data.result=="Login_fall"){//密码错误
								$(".tips:eq(1)").css("visibility","visible");
								$("#password").css("border-color","red");
							}else{//登录成功
								window.location.href="stuIndex.action";
							}
						}
					});
				}
					var gtFailbackFrontInitial = function(result) {
						var s = document.createElement('script');
						s.id = 'gt_lib';
						s.src = 'http://static.geetest.com/static/js/geetest.0.0.0.js';
						s.charset = 'UTF-8';
						s.type = 'text/javascript';
						document.getElementsByTagName('head')[0].appendChild(s);
						var 
					loaded = false;
						s.onload = s.onreadystatechange = function() {
							if (!loaded
									&& (!this.readyState
											|| this.readyState === 'loaded' || this.readyState === 'complete')) {
								loadGeetest(result);
								loaded = true;
							}
						};
					}
					//get  geetest server status, use the failback solution
		
		
					var loadGeetest = function(config) {
		
						//1. use geetest capthca
						window.gt_captcha_obj = new window.Geetest({//初始化操作
							gt : config.gt,//用户在极验后台建立的检验模块id
							challenge : config.challenge,
							product : 'float',//浮动式
							offline : !config.success
						});
		
						gt_captcha_obj.appendTo("#div_id_embed");
						//Ajax request demo,if you use submit form ,then ignore it 
						gt_captcha_obj.onSuccess(function() {//当验证成功时调用callback函数
							//geetest_ajax_results();
						});
					}
		
					s = document.createElement('script');
					s.src = 'http://api.geetest.com/get.php?callback=gtcallback';
					$("#div_geetest_lib").append(s);
					
					var gtcallback =( function() {
						var status = 0, result, apiFail;
						return function(r) {
							status += 1;
							if (r) {
								result = r;
								setTimeout(function() {
									if (!window.Geetest) {
										apiFail = true;
										gtFailbackFrontInitial(result)
									}
								}, 1000)
							}
							else if(apiFail) {
								return
							}
							if (status == 2) {
								loadGeetest(result);
							}
						}
					})()
					$.ajax({
						url : "StartCapthcaServlet",
						type : "get",
						dataType : 'JSON',
						success : function(result) {
							gtcallback(result)
						}
					})
				</script>
			</div>
			<div class="row-box">
				<span><input type="checkbox">下次自动登录</span>
				<a href="##">忘记密码？</a>
			</div>			
			<div class="row">
				<input class="btn btn-success" type="button" onclick="geetest_ajax_results()" value="登&nbsp;&nbsp;录" id="submit-button" />
			</div>
		</form>	

	</div><!-- end main -->
</body>
</html>
