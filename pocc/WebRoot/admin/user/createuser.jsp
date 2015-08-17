<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="edu.scnu316.entity.Role" %>
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

<!-- Bootstrap datetimepicker -->
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.4-dist/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
<script src="bootstrap-3.3.4-dist/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="bootstrap-3.3.4-dist/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.fr.js"></script>


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
	height:100%;
	margin-top:20px;
	min-height:450px;
	background-color: white;
	overflow: scroll;
}
.mainleft{
	height:100%;
	margin-top:20px;
	min-height:450px;
	background-color: white;
	overflow: scroll;
}
</style>

<script>
	//step1
	function step1(x){
		var v=x.value;
		var reg=/[a-zA-Z0-9_]{5,}/;
		var tip=document.getElementById("tip1");
		tip.style.color="red";
		if (v==""){ tip.innerHTML=""; return false;}
		if (reg.test(v)&&v.length<=8){
			tip.innerHTML="";
			return true;
		}else{
			tip.innerHTML="请输入5~8个字符，可包含字母、数字或下划线";
			return false;
		}
	}
	
	//step2
	function step2a(x){
		var v=x.value;
		alert(v);
		alert("step2");
	}
	
	function step22(x){
		if (!step21){
			alert("请先填写开始序号！");
			return false;
		}
		var v=x.value;
		var reg=/[0-9]/;
		var tip=document.getElementById("tip22");
		if (v==""){ tip.innerHTML=""; return false;}
		tip.style.color="red";
		if (reg.test(v)&&parseInt(v,10)>=1&&parseInt(v,10)<=1000){
			var s=new Number;
			s=parseInt(v,10)+parseInt(document.getElementById("step21").value,10);
			if (s>9999){
				tip.innerHTML="开始序号和生成数量的和不能大于9999";
				return false;
			}else{
				tip.innerHTML="";
				return true;
			}
		}else{
			tip.innerHTML="请输入1~1000的整数";
			return false;
		}
		
	}

	
	function formsubmit(){
		//确认所有用户信息都按需要填写
		//alert(document.getElementsByName("rent_end").item(0).value);
		
		//提交
		var f=document.getElementById("form");
		f.action="UserAction_Create.action";
		f.submit();
	}
	
	
	
	
	
</script>
<body>
<!--导入头部导航条-->
<%@include file="../header.jsp" %>

<div class="container-fluid">
<div class="row">
	<!--导入左边导航条-->
	<%@include file="../left.jsp" %>
	<!-- 右边内容区域 -->
	<div class="col-md-10 col-sm-8 right-div">
	    <div class="title">
		    <a><span class="glyphicon glyphicon-blackboard"></span>
		       <span>&nbsp;&nbsp;用户批量生成</span>
		    </a>
	    </div>
	    <!--用户列表模块-->
	    <div class="main">
	    <div class="container">
	    	<form id="form" class="form-horizontal" method="post">
	    	<!--第一步及第二步-->
	    	<div class="col-md-5 col-md-offset-1">
	    		
	    		<label><h3>第一步&nbsp;&nbsp;<small>输入用户账号前缀：</small></h3></label><br>
	    		<div class="form-group">
  					<label style="text-align: right;" class="col-md-3 control-label"><h5><small><em>账号前缀：</em></small></h5></label>
  					<div class="col-md-6">
   	 					<input name="prefix" type="text" placeholder="输入5~8个字母或数字" class="form-control" onblur="step1(this)">
   	 					<small id="tip1"></small>
   	 				</div>
   	 			</div>
   	 			<label><h3>第二步&nbsp;&nbsp;<small>账号开始序号及生成数量：</small></h3></label><br>
  				<div class="form-group">
  					<label style="text-align: right;" class="col-md-3 control-label"><h5><small><em>开始序号：</em></small></h5></label>
  					<div class="col-md-6">
   	 					<input id="step21" name="first"type="text" placeholder="0~9999的整数" class="form-control" 
   	 					onblur="step2a(this)">
   	 					<small id="tip21"></small>
   	 				</div>
   	 			</div>
   	 			<div class="form-group">
   	 				<label style="text-align: right;" class="col-md-3 control-label"><h5><small><em>生成数量：</em></small></h5></label>
   	 				<div class="col-md-6">
   	 					<input name="number"type="text" class="form-control" placeholder="1~1000的整数">
   	 				</div>
   	 			</div>
   	 			<div class="form-group">
   	 				<h5>生成的账号为：</h5>
   	 				<div style="margin-left: 10">
   	 				<h4><em style="margin-left: 10%;"><b>scnu1230001&nbsp;&nbsp;~&nbsp;&nbsp;scnu1230050</b></em></h4>
   	 				</div>
   	 				<button class="btn btn-default btn-sm">检查</button>
   	 			</div>
  			</div>
  			
  			<!--第三步-->
  			<div class="col-md-5">
  					<h3>第三步&nbsp;&nbsp;<small>账号初始信息：</small></h3><br>
  				<div class="col-md-offset-1">
  				<div class="form-group">
  					<label>租期<small><em>（允许登录并做实验的期限）</em></small></label>
  					<br><div class="col-md-8">
  						<input name="rent_end" type="date" class="form-control" value="2015-11-01" data-date-format="yyyy/mm/dd">
  					</div>	
  				</div>
   	 			<div class="form-group">
   	 				<label>租期内费用<small><em>（单位：元）</em></small></label>
   	 				<br><div class="col-md-8">
   	 					<input name="price" type="text" class="form-control" placeholder="大于0的小数或整数">
   	 					
  					</div>	
  				</div>	
  				<div class="form-group">
  					<label>初始密码：</label>
   	 				<br><div class="col-md-8">
   	 					<input name="password1" type="text" class="form-control" placeholder="6~20个字母、数字或下划线">
  					</div>	
  				</div>
  				
  				<div class="form-group">	
  					<label>确认密码：</label>
   	 				<br><div class="col-md-8">	
   	 					<input name="password2" type="text" class="form-control" placeholder="再次输入密码">
					</div>	
				</div>
				<%Role r = (Role) session.getAttribute("Role");
					if (r==null) System.out.println("r is null"); 
				%>
				<input type="hidden" name="m_operator" value="<%=r.getUser_account()%>">
				</div>
			</div>
			
			<!--清空、确认-->
			<div align="center" class="col-md-12">
  				<button class="btn btn-warning col-md-2 col-md-offset-3">全部清空</button>
  				<span class="col-md-1"></span>
  			<button onclick="formsubmit()" class="btn btn-success col-md-2">批量生成</button>
  					
  			</div>
  			</form>
		</div>

	    </div>	
	    
	    </div>
	    <!--用户列表模块..-->
	</div>
	<!-- 右边内容区域..-->
</div>   
</body>
</html>
