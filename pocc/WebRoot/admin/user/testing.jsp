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
<title>计算机组成原理实验后台管理</title>
<!-- Bootstrap -->
<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.4-dist/css/bootstrap.min.css">
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
<meta http-equiv="keywords" content="华南师范大学,实验平台,计算机组成原理">
<meta http-equiv="description" content="计算机组成原理实验平台">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
html,body{height:100%;}
body {
	background-color: #efefef;
	min-width:500px;
	display: block;
}
.container-fluid{
	padding-top:56px;
	height:100%;
}
.row{max-height:1000px !important;height:100%;}
.right-div{
	height:500px !important;
}
.right-div .title{
	width:100% !important;
	height:45px;
	background-color: white;
	padding-top:10px;
	padding-left:30px;
	margin-top:3px;
}
.title a{
	font-size:20px;
	color: #506470;
	text-decoration: none;
}
.title span{
	display: block;
	float:left;
}
.main{
	margin-top:20px;
	min-height:450px;
	background-color: white;
	max-height:500px;
	overflow: auto;
}
</style>
<body>
<!--导入头部导航条-->
<%@include file="../header.jsp" %>

<div class="container-fluid">
<div class="row">
	<!--导入左边导航条-->
	<%@include file="../left.jsp"%>
	<!-- 右边内容区域 -->
	<div class="col-md-10 col-sm-8 right-div">
	    <div class="title">
		    <a><span class="glyphicon glyphicon-blackboard"></span>
		       <span>计算机组成原理实验平台后台管理系统</span>
		    </a>
	    </div>
	    <!--用户列表模块-->
	    <div class="main">
	    	<table class="table table-hover">
	    	<caption>正在实验的用户列表</caption>
	    	<tr>
				<th>账号</th>
				<th>姓名</th>
				<th>学校</th>
				<th>租期开始时间</th>
				<th>租期结束时间</th>
			</tr>
			<s:iterator value="#request.studentList" var="student" >   
	  			<tr>
	  				<td>${student.user_account}</td>
	  				<td>${student.username}</td>
	  				<td>${student.unit_name}</td>
	  				<td>${student.rent_start}</td>
	  				<td>${student.rent_end}</td>
	  			</tr>
			</s:iterator>  
			</table>
	    </div>
	    <!--用户列表模块..-->
	</div>
	<!-- 右边内容区域..-->
</div>
</div>   
</body>
</html>
