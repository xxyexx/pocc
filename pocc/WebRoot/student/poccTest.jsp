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
	background-color: #EBEAEB;
}
.row{
	margin-top:60px;
	padding-left:10px;
}
.left{
	min-height:300px;
}
.right{
	min-height:300px;
}
.btn-div{
	padding-top: 18px;
	padding-bottom:10px;
	background-color:rgba(7,26,36,0.8);
}

</style>
<script type="text/javascript">

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
<div class="row">
<!-- 左边实验提示 -->
<div class="col-md-2 left">
	<div class="panel panel-primary">
	  <div class="panel-heading">实验(一)</div>
	  <div class="panel-body">
	    带中断处理能力的模型机设计实验
	  </div>
	</div>
	<div class="panel panel-primary">
	  <div class="panel-heading">实验要求</div>
	  <div class="panel-body">
	    每项研究工作必须聘任专题负责人。专题负责人职责为：
	（一）全面负责该项研究工作的运行管理；
	（二）制定实验方案，严格执行实验方案，分析研究结果，撰写总结报告；
	（三）执行标准操作规程的规定，及时提出修订或补充相应的标准操作规程的建议；
	（四）确保参与研究的工作人员明确所承担的工作，并掌握相应的标准操作规程；
	（五）掌握研究工作的进展，检查各种实验记录，确保其及时、直接、准确和清楚；
	（六）详细记录实验中出现的意外情况和采取的措施；
	（七）实验结束后，将实验方案、原始资料、应保存的标本、各种有关记录文件和总结报告等归档保存；
	（八）及时处理质量保证部门提出的问题，确保研究工作各环节符合要求。
	  </div>
	</div>

</div>
<!-- 左边实验提示 ..-->
<!-- 右边实验仿真软件 -->
<div class="col-md-10 right">
	<!-- 16:9 aspect ratio -->
	<div class="embed-responsive embed-responsive-4by3">
	  <embed class="embed-responsive-item" allowFullScreen="true" src="swf/pocc.swf"></embed>
	</div>
	<div class="btn-div col-md-12">
		<div class="col-md-offset-6">
		<a class="btn btn-primary col-md-4">提交</a>
		<a class="btn btn-success col-md-4 col-md-offset-1">保存</a>
		</div>
	</div>
</div>
<!-- 右边实验仿真软件 ..-->
</div>
</body>
</html>
