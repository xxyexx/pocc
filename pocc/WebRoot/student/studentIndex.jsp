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
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
-->
<style type="text/css">
body{
	min-height:300px;
	overflow-x: hidden;
}
.contain{
	padding-top:55px;
}
.container_center{
	width: 100%  !important;
	background-image: url("image/4.jpg");
	height:580px !important;
	background-size:100% 100%;
	margin-bottom: 0 !important;
	padding-top: 150px;
}
.row{
	min-height:500px;
	background-color: #EBEAE9;
	padding-left:60px;
	padding-right:60px;
}
.container_center_pic{
	width: 40% !important;
	height:300px;
	margin:0 auto;
}
.thumbnail{
	background-color: #EBEAE9;
	text-align: center;
	border: 0px;
}
.thumbnail img{
	width: 150px;
}
.thumbnail a{
	text-decoration: none;
	color: #11364c;
}
.thumbnail a:HOVER{
	color:black;
}
.thumbnail a:HOVER img{
	 width: 160px;
}
h2{
height:120px;
padding-top:40px;
background-color: #EBEAE9;
text-align: center;
color:#11364c;
font-weight: bolder;
}
</style>
<body>
<!--导入头部导航条-->
<%@include file="header.jsp" %>
<div class="contain">
<div class="container_center">
	<div class="container_center_pic">
		<img alt="计算机组成原理实验平台" src="image/stuIndex_CenterPic.png" width="100%;" height="100%;">
	</div>
</div>
<!-- 功能介绍 -->
<div class="row">
  <h2>功能选择</h2>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <a href="student.action?select=0"><img class="img-responsive" src="image/thumbnail_Pic1.png" alt="课程信息"></a>
      <div class="caption">
        <h3><a href="student.action?select=0">课程信息</a></h3>
        </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <a href="student.action?select=1"><img class="img-responsive" src="image/thumbnail_Pic2.png" alt="在线实验"></a>
      <div class="caption">
        <h3><a href="student.action?select=1">在线实验</a></h3>
        </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <a href="student.action?select=3"><img class="img-responsive" src="image/thumbnail_Pic3.png" alt="资源共享"></a>
      <div class="caption">
        <h3><a href="student.action?select=3">资源共享</a></h3>
        </div>
    </div>
  </div>
</div>  
<!-- 功能介绍.. -->
<!--导入footer-->
<%@include file="footer.jsp" %>
</div>
</body>
</html>
