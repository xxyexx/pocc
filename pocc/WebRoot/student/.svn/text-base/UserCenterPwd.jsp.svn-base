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
</style>   
<body>
<!--导入头部导航条-->
<%@include file="header.jsp" %>
<div class="main">
<div class="wcontainer">
   <ul class="setting-left">
   	<li><a href="UserCenter.action">个人资料</a></li>
   	<li><a href="UserCenterPic.action">头像设置</a></li>
   	<li><a class="active" href="UserCenterPwd.action">修改密码</a></li>
   </ul>
	<div class="setting-right">
		<form class="user-info">
		<div class="info-group">
		    <label for="password" class="control-label">当前密码</label>
		    <input class="userinput form-control" type="password"  id="password" placeholder="请输入当前密码">
		</div>
		<div class="info-group">
		    <label for="newpassword" class="control-label">新密码</label>
		    <input class="userinput form-control" type="password"  id="newpassword" placeholder="请输入密码">
		</div>
		<div class="info-group">
		    <label for="newpassword" class="control-label">确认密码</label>
		    <input class="userinput form-control" type="password"  id="newpassword" placeholder="请输入密码">
		</div>
		<button type="submit" class="btn btn-primary">保存</button>
		</form>
	</div>
</div>
</div>
<!--导入footer-->
<%@include file="footer.jsp" %>
  </body>
</html>
