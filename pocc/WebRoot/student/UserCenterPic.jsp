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
   		background-color: #EDEFF0;
   	}
   	.userPic{
   		width:500px;
   		height:200px;
   		margin-left:100px;
   		margin-top:40px;
   	}
   	.userPic img{
   		width:200px;
   		height:200px;
   		float:left;
   	}
   	.avator-btn-fake{
   		display:block;
		width:150px;
		height: 35px;
		color: #fff;
		line-height: 30px;
		background: #363d40;
		text-align: center;
		margin-left:30px;
		margin-top:160px;
		float:left;
	}
	#picInput{
		visibility: hidden;
	}
  </style>
  <script type="text/javascript">
	  function changePic(){//打开文件的输入框
	  	 $("#picInput").click();
	  };
  </script>
<!--导入头部导航条-->
<%@include file="header.jsp" %>   
<body>
<div class="main">
<div class="wcontainer">
   <ul class="setting-left">
   	<li><a href="UserCenterShow.action">个人资料</a></li>
   	<li><a class="active" href="UserCenterPic.action">头像设置</a></li>
   	<li><a href="UserCenterPwd.action">修改密码</a></li>
   </ul>
	<div class="setting-right">
		<div class="userPic">
		<img alt="用户头像" src="${session.User.icon_url}"/>
		<form action="UserCenterChangePic.action"  enctype="multipart/form-data" method="post">
			<!-- 这个按钮不能用button,不然一点就已经提交了,我也不知道为什么。 -->
			<input onclick="changePic()" type="button" value="上传头像" class="avator-btn-fake" />
			<input name="image" id="picInput" title="上传头像" type="file" accept="image/*" onchange="this.form.submit()" />
		</form>
		</div>
	</div>
</div>
</div>
<!--导入footer-->
<%@include file="footer.jsp" %>
  </body>
</html>
