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
   	<li><a class="active" href="UserCenterShow.action">个人资料</a></li>
   	<li><a href="UserCenterPic.action">头像设置</a></li>
   	<li><a href="UserCenterPwd.action">修改密码</a></li>
   </ul>
	<div class="setting-right">
		<form class="user-info">
		<div class="info-group">
		    <label for="userName" class="control-label">用户名</label>
		    <input value="${session.User.username}" class="userinput form-control" type="text" placeholder="请输入用户名">
		</div>
		<div class="info-group">
		    <label class="control-label">所在城市</label>
			<s:select list="#request.ProvinceMap" headerKey="-1" headerValue="-请选择省份-"></s:select>
		    <select name="city"  class="form-control">
		    	<option value="0">广州</option>
		    	<option value="1">广州</option>
		    	<option value="2">广州</option>
		    	<option value="3">广州</option>
		    </select>
		</div>
		<div class="info-group">
		    <label for="school" class="control-label">所在学校</label>
		    <input value="${session.User.unit_name}" class="userinput form-control" type="text"  id="userName" placeholder="请输入学校（单位）全称">
		</div>
		<div class="info-group">
		    <label class="control-label">性别</label>
		    <label class="radiolabel"><input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">保密</label>
			<label class="radiolabel"><input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">男</label>
			<label class="radiolabel"><input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">女</label>
		</div>
		<div class="user-sign">
			 <label class="control-label">个性签名</label>
			 <textarea class="form-control" rows="5" placeholder="这家伙很懒，什么都没写。">${session.User.remark}</textarea>
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
