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
	background-color: #EBEAEB;
}
.row{
	padding-left:150px;
	padding-right:150px;
}
.left{
	padding-right:15px;
	padding-top:15px;
	padding-bottom:20px;
}
.container_left{
	background-color: white;
    min-height:390px;
    min-width: 250px;
}
.right{
	padding-top:15px;
	padding-bottom:20px;
}
.container_right{
	min-height:550px;
	background-color: white;
	min-width: 250px;
}
.user_Pic{
	text-align: center;
	padding-top:35px;
}
.user_message{
	padding-top:30px;
}
.user_info{
	width: 100%;
	height:30px;
	padding-left:10px;
	font:14px/1.4 "Microsoft Yahei", 
	"Hiragino Sans GB", Helvetica, 
	"Helvetica Neue", "微软雅黑", Tahoma, 
	Arial, sans-serif;
	color:#666;
}
.userName{
	font-size: 20px;
	font-weight: bold;
	color:#113965;
}
.userSetting{
	text-align: right;
	padding-top:5px;
}
.nav-tabs li{
	padding:0px !important;
	text-align: center;
	background-color: #F2F1F1;
 	font:15px/1.5 "Microsoft Yahei", 
 		"Hiragino Sans GB", Helvetica, 
 		"Helvetica Neue", "微软雅黑", Tahoma, 
 		 Arial, sans-serif;
}
.nav-tabs li a{
	color:#426878;
}
.media{
	padding-left:50px;
	padding-right:30px;
}
.media-body{
	padding-top:20px;
}
.media-middle{
	padding-top:30%;
}
.NotExist{
	color: #aaa;
	font-size: 14px;
}
.NotExist h1{
	font-size: 60px;
	color:#ddd;
}
</style>
<script type="text/javascript">
	$(function () {
		$("[data-toggle='tooltip']").tooltip(); 
		var select=GetQueryString("select");
		$("#myTabs li:eq("+select+") a").tab('show'); // Select third tab (0-indexed)
	});
	
	function GetQueryString(name)//获取地址栏参数
	{
	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	     var r = window.location.search.substr(1).match(reg);
	     if(r!=null)return  unescape(r[2]); return null;
	}
</script>
<body>
<!--导入头部导航条-->
<%@include file="header.jsp" %>
<div class="contain">
<div class="row">
<!-- 右边用户信息 -->
<div class="right col-md-9">
<div class="container_right">
	 <!-- Nav tabs -->
	  <ul id="myTabs" class="nav nav-tabs" role="tablist">
	    <li role="presentation" class="active col-md-6 col-xs-6"><a href="#Courses" aria-controls="Courses" role="tab" data-toggle="tab">课件视频</a></li>
	    <li role="presentation" class=" col-md-6 col-xs-6"><a href="#experiment" aria-controls="experiment" role="tab" data-toggle="tab">在线实验</a></li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div role="tabpanel" class="tab-pane active" id="Courses">
	    	<!-- 课件列表 -->
	    	<s:if test="false">
	    		<div class="NotExist">
			    	<h1 align="center">Σ(っ °Д °;)っ</h1>
			    	<p align="center">居然没有课件视频Σ(っ °Д °;)っ</p>
			    	<hr class="divider" width="95%" align="center"/>
		    	</div>
	    	</s:if>
	    	<s:else>
			<div class="media">
				<div class="col-md-3 col-sm-3">
				  <div class="media-left ">
				    <a href="#">
				      <img class="media-object" height="85px" src="image/thumbnail_Pic1.png" alt="...">
				    </a>
				  </div>
				 </div>
				 <div class="col-md-7 col-sm-6">
			  <div class="media-body">
			    <h4 class="media-heading">视频教程</h4>
			    <p>计算机组成原理实验视频教程</p>
			  </div>
			  </div>
			  <div class="col-md-2 col-sm-3">
				  <div class="media-right media-middle">
				      <a href="##" class="btn btn-primary" target="_blank">视频链接</a>
				  </div>
			  </div>
			</div>
			<hr class="divider" width="95%" align="center"/>
			</s:else>
			<!-- 课件列表END -->
		</div>
	    <div role="tabpanel" class="tab-pane" id="experiment">
	    	<!-- 个人实验历史记录 -->
	    	<s:if test="flase">
		    	<div class="NotExist">
			    	<h1 align="center">:(</h1>
			    	<p align="center">你太懒了~~还没保存过实验Σ(っ °Д °;)っ</p>
			    	<hr class="divider" width="95%" align="center"/>
		    	</div>
	    	</s:if>
	    	<s:else>
				<div class="media">
					<div class="col-md-3 col-sm-3">
					  <div class="media-left ">
					    <a href="#">
					      <img class="media-object" height="85px" src="image/thumbnail_Pic2.png" alt="...">
					    </a>
					  </div>
					 </div>
					 <div class="col-md-7 col-sm-6">
				  <div class="media-body">
				    <h4 class="media-heading">在线实验</h4>
				    <p>计算机组成原理仿真实验</p>
				  </div>
				  </div>
				  <div class="col-md-2 col-sm-3">
					  <div class="media-right media-middle">
					      <a href="beginTest.action" class="btn btn-success">开始实验</a>
					  </div>
				  </div>
				</div>
			</s:else>
			<hr class="divider" width="95%" align="center"/>
			<!-- 个人实验历史记录 END -->
		</div>

	  </div>	
</div>
</div>
<!-- 右边用户信息 ..-->
<!-- 左边用户信息 -->
<div class="col-md-3 left">
	<div class="container_left">
		<div class="user_Pic">
			<img alt="头像" src="${session.User.icon_url}" class="img-circle" width="120px;">
		</div>
		<div class="user_message">
			<div class="user_info">
				<div class="col-md-9 col-xs-8 userName"><s:property value="#session.User.username"/></div>
				<div class="col-md-3 col-xs-4"><a href="UserCenterShow.action" data-toggle="tooltip" data-placement="top" title="设置"><span class="glyphicon glyphicon-cog userSetting" aria-hidden=true></span></a></div>
			</div>
			<br/>
			<div class="user_info">
				<div class="col-md-5 col-xs-5">租期     </div>
				<div class="col-md-3 col-xs-3"><s:property value="#session.User.getRent_start('yy.MM.dd')"/>~</div>
				<div class="col-md-4 col-xs-4"><s:property value="#session.User.getRent_end('yy.MM.dd')"/></div>
				
			</div>
			<div class="user_info">
				<div class="col-md-5 col-xs-5">所属单位</div>
				<div class="col-md-7 col-xs-7"><s:property value="#session.User.unit_name"/></div>
			</div>
			<div class="user_info">
				<div class="col-md-5 col-xs-5">锁定状态</div>
				<div class="col-md-7 col-xs-7"><s:property value="#session.User.getLock_modeToCN()"/></div>
			</div>
			<div class="user_info">
				<div class="col-md-5 col-xs-5">上次登录</div>
				<div class="col-md-7 col-xs-7"><s:property value="#session.User.last_login"/></div>
			</div>
		</div>
	</div>
</div>
<!-- 左边用户信息 ..-->
</div>
<!--导入footer-->
<%@include file="footer.jsp" %>
</div>
</body>
</html>
