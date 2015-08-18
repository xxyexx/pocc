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
	height:100% !important;
}
.row{height:100% !important;}
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
		       <span>&nbsp;&nbsp;实验用户管理</span>
		    </a>
	    </div>
	    <!--用户列表模块-->
	    <div class="main">
	    	<div class="col-md-2">
	    	</div>
	    	<div class="col-md-10"> 
	    	<table class="table table-striped table-responsive table-condensed" style="overflow:inherit;">
	    		<thead>
	    	 		<tr>
	    	 			<th>账号</th>
	    	 			<th>角色</th>
	    	 			<th>备注</th>
	    	 			<th>操作</th>
	    	 			<th>
						<a><span style="font-size: large;"></span></a>
						</th><th>
						<button class="btn btn-danger btn-xs"><span
						class="glyphicon glyphicon-trash"></span></button>
						</th><th>
						<input type="checkbox">
					</th>
	    	 		</tr>
	    	 	</thead>
	    	 	<tbody>
	    	 		<tr>
	    	 			<td>fs1001</td>
	    	 			<td>系统管理员</td>
	    	 			<td>属于华南师范大学</td>
	    	 			<td>重设密码</td>	
	    	 			<td>
						<button class="btn btn-primary btn-xs" type="button">							
						<span class="glyphicon glyphicon-edit"></span></button>
						</td><td>
						<button class="btn btn-danger btn-xs" type="button">
						<span class="glyphicon glyphicon-trash"></span></button>
						</td><td>
						<input type="checkbox">
						</td>   	 			
	    	 		</tr>
	    	 	</tbody>
	    	 </table>
	    	 </div>
	    </div>
	    <!--用户列表模块..-->
	</div>
	<!-- 右边内容区域..-->
</div>
</div>   
</body>
</html>
