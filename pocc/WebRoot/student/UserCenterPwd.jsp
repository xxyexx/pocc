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
<title>计算机组成原理实验平台</title>
<!-- Bootstrap -->
<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.4-dist/css/bootstrap.min.css">
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="bootstrap-3.3.4-dist/js/bootstrap.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="../../assets/js/ie8-responsive-file-warning.js"></script>
  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- Bootstrap..-->
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="华南师范大学,计算机组成原理实验平台,计算机组成原理">
<meta http-equiv="description" content="计算机组成原理实验平台">
<link rel="stylesheet" type="text/css" href="css/UserCenter.css">
<style type="text/css">
body{
	padding-top:50px;
	background-color: #EBEAEB;
}
.info-group span{
	padding-top:10px;
}
.tipsWrong{
	color:#E15857;
	visibility: hidden;
	padding-left:15px;
}
.tipsCorrect{
	color:#4DB849;
	visibility: hidden;
	margin-left:-18px;
}
</style>  
<script type="text/javascript">
	var checked0=false;
	var checked1=false;
	var checked2=false;
	function checkPwd(){//检测旧密码
		var password = $("#password0").val();
		if(password !=""){
			$.ajax({
				url : "UserCenterCheckPwd.action",
				type : "post",
				data :{Pwd:password,},
				success : function(data) {
					if(data=="pwdWrong"){//密码错误
						checked0=false;
						setCss(0,"Wrong");
					}else{
						checked0=true;
						setCss(0,"Correct");
					}
				}
			});
		}else{//密码为空，错误
			setCss(0,"Wrong");
		}
	}
	function checkNewPwd(){//检测新密码规则
		var reg = /^[\w]{6,12}$/;//这个是正则表达式
		if($("#password1").val().match(reg)){//正确
			checked1=true;
		    setCss(1,"Correct");
		}else{//错误
			checked1=false;
			setCss(1,"Wrong");
		}
	}
	function checkensurePwd(){//再次输入密码
		if($("#password1").val()==$("#password2").val()&&$("#password1").val()!=""){//正确
			checked2=true;
			setCss(2,"Correct");
		}else{
			checked2=false;
			setCss(2,"Wrong");
		}
	}
	function setCss(i,type){//设置第i个，样式
		if(type=="Correct"){
			$(".tipsWrong:eq("+i+")").css("visibility","hidden");
			$(".tipsCorrect:eq("+i+")").css("visibility","visible");
			$("#password"+i).css("border-color","#4DB849");
		}else{
			$(".tipsWrong:eq("+i+")").css("visibility","visible");
			$(".tipsCorrect:eq("+i+")").css("visibility","hidden");
			$("#password"+i).css("border-color","#E15857");
		}
	}
	function submitForm(){
		if(checked0==false){checkPwd();}
		if(checked1==false){checkNewPwd();}
		if(checked2==false){checkensurePwd();}
		if(checked0&&checked1&&checked2){
			alert("密码修改成功");
			pwdForm.submit();
		}else{
			alert("请正确填写要修改的密码信息");
		}
	}
</script> 
<body>
<!--导入头部导航条-->
<%@include file="header.jsp" %>
<div class="main">
<div class="wcontainer">
   <ul class="setting-left">
   	<li><a href="UserCenterShow.action">个人资料</a></li>
   	<li><a href="UserCenterPic.action">头像设置</a></li>
   	<li><a class="active" href="UserCenterPwd.action">修改密码</a></li>
   </ul>
	<div class="setting-right">
		<form name="pwdForm" action="UserCenterChangePwd.action" class="user-info" method="post">
		<div class="info-group">
		    <label for="password0" class="control-label">当前密码</label>
		    <input id="password0" onblur="checkPwd()" class="userinput form-control" type="password" placeholder="请输入当前密码">
			<span class="tipsWrong glyphicon glyphicon-remove"></span>
			<span class="tipsCorrect glyphicon glyphicon-ok"></span>
		</div>
		<div class="info-group">
		    <label for="password1" class="control-label">新密码</label>
		    <input id="password1" onblur="checkNewPwd()" class="userinput form-control" type="password" placeholder="请输入密码">
			<span class="tipsWrong glyphicon glyphicon-remove"></span>
			<span class="tipsCorrect glyphicon glyphicon-ok"></span>
		</div>
		<div class="info-group">
		    <label for="password2" class="control-label">确认密码</label>
		    <input id="password2" onblur="checkensurePwd()"  name="user.password" class="userinput form-control" type="password" placeholder="请输入密码">
			<span class="tipsWrong glyphicon glyphicon-remove"></span>
			<span class="tipsCorrect glyphicon glyphicon-ok"></span>
		</div>
		<input onclick="submitForm()" type="button" class="btn btn-primary" value="保存"/>
		</form>
	</div>
</div>
</div>
<!--导入footer-->
<%@include file="footer.jsp" %>
  </body>
</html>
