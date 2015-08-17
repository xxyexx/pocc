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
	//step1 账号前缀
	function funStep1(){
		var v=document.getElementById("step1").value;
		var reg=/^[a-zA-Z0-9_]{5,8}$/;
		var tip=document.getElementById("tip1");
		tip.style.color="red";
		if (v==""){ tip.innerHTML=""; return false;}
		if (reg.test(v)){
			tip.innerHTML="";
			return true;
		}else{
			tip.innerHTML="请输入5~8个字符，可包含字母、数字或下划线";
			return false;
		}
	}
	
	//step2 开始序号
	function funStep2a(){
		var v=document.getElementById("step2a").value;
		var reg=/^[0-9]{1,4}$/;
		var tip=document.getElementById("tip2a");
		if (v==""){ tip.innerHTML=""; return false;}
		tip.style.color="red";
		if (reg.test(v)&&parseInt(v,10)>=0&&parseInt(v,10)<=9999){
			//序号没问题，输入符合要求
			tip.innerHTML="";
			//funStep2b();
			return true;
		}else{
			tip.innerHTML="请输入为0~9999的整数";
			return false;
		}
	}//step2 生成数量
	function funStep2b(){
		if (!funStep2a()){
			return false;
		}
		var v=document.getElementById("step2b").value;
		var reg=/^[0-9]{1,4}$/;
		var tip=document.getElementById("tip2b");
		if (v==""){ tip.innerHTML=""; return false;}
		tip.style.color="red";
		if (reg.test(v)&&parseInt(v,10)>=1&&parseInt(v,10)<=1000){
			var s=new Number;
			s=parseInt(v,10)+parseInt(document.getElementById("step2a").value,10);
			//alert(s);
			if (s>9999){
				tip.innerHTML="开始序号和生成数量的和不能大于9999";
				return false;
			}else{
				//输入符合要求
				document.getElementById("step2bRes").value=s;
				tip.innerHTML="";
				return true;
			}
		}else{
			tip.innerHTML="请输入1~1000的整数";
			return false;
		}		
	}
	//step2 提示先输入开始序号
	function funStep2c(){
		if (!funStep2a()){
			//alert("请先填写开始序号！");
			return false;
		}
	}
	//合并前缀和序号
	function merge(p,n){
		var num=String(n);
		while (num.length<4){
			num="0"+num;
		}
		//alert(p+num);
		return (p+num);
	}
	
	//预览生成账号
	function funDisplay(){
		if (funStep1()&&funStep2a()&&funStep2b()){
			var d1=document.getElementById("display1");	
			var d2=document.getElementById("display2");	
			var d3=document.getElementById("display3");
			d1.innerHTML=merge(document.getElementById("step1").value
						,document.getElementById("step2a").value);
			d2.innerHTML="&nbsp;&nbsp;~&nbsp;&nbsp;";
			d3.innerHTML=merge(document.getElementById("step1").value
						,document.getElementById("step2bRes").value);
			
			//d1.innerHTML="test";
			return;
		}else{
			return;
		}	
	}
	
	//检查后台是否有重复账号
	function checkAccount(){
		//使用AJAX检查后台是否有重复账号
		//alert("checkAccount");
	}
	//step 3 检查租期
	function funStep3a(){
		var v=document.getElementById("step3a").value;
		var tip=document.getElementById("tip3a");
		var reg=/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
		tip.style.color="red";
		if (reg.test(v)){
			tip.innerHTML="";
			return true;
		}else{
			tip.innerHTML="无效的日期";
			return false;
		}
	}
	
	//step 3  检查租期内费用
	function funStep3b(){
		var v=document.getElementById("step3b").value;
		var reg=/^[0-9]{1,}(.[0-9]{1,})?$/;
		var tip=document.getElementById("tip3b");
		if (v==""){ tip.innerHTML=""; return false;}
		tip.style.color="red";
		if (reg.test(v)){
			tip.innerHTML="";
			return true;
		}else{
			tip.innerHTML="输入大于0的小数或整数";
			return false;
		}
	}
	
	function funStep3c(){
		var v=document.getElementById("step3c").value;
		var reg=/^[0-9a-zA-Z_]{6,25}$/;
		var tip=document.getElementById("tip3c");
		if (v==""){ tip.innerHTML=""; return false;}
		tip.style.color="red";
		if (reg.test(v)){
			tip.innerHTML="";
			return true;
		}else{
			tip.innerHTML="长度为6~25，可使用字母、数字或下划线";
			return false;
		}
	}
	//step3 确认密码
	function funStep3d(){
		var tip=document.getElementById("tip3d");
		var v=document.getElementById("step3d").value;
		if (v==""||!funStep3c()){ tip.innerHTML=""; return false;}
		tip.style.color="red";
		if (v==document.getElementById("step3c").value){
			tip.innerHTML="";
			return true;
		}else{
			tip.innerHTML="两次填写的密码需要一致";
			return false;
		}
	}
	
	
	
	function formsubmit(){
		//确认所有用户信息都按需要填写
		//alert(document.getElementsByName("rent_end").item(0).value);
		if (funStep1()&&
		funStep2a()&&funStep2b()&&
		funStep3a()&&funStep3b()&&funStep3c()&&funStep3d()){
			//提交
			var f=document.getElementById("form");
			f.action="UserAction_Create.action";
			f.submit();
		}else{
			alert("提交失败，请检查输入信息！");
		}
	}
	
	function cleanAll(){
		document.getElementById("step1").value="";
		document.getElementById("step2a").value="";
		document.getElementById("step2b").value="";
		document.getElementById("step3a").value="";
		document.getElementById("step3b").value="";
		document.getElementById("step3c").value="";
		document.getElementById("step3d").value="";
		document.getElementById("display1").innerHTML="";
		document.getElementById("display2").innerHTML="";
		document.getElementById("display3").innerHTML="";
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
   	 					<input id="step1" name="prefix" type="text" placeholder="输入5~8个字母或数字" class="form-control" onblur="funStep1()">
   	 					<small id="tip1"></small>
   	 				</div>
   	 			</div>
   	 			<label><h3>第二步&nbsp;&nbsp;<small>账号开始序号及生成数量：</small></h3></label><br>
  				<div class="form-group">
  					<label style="text-align: right;" class="col-md-3 control-label"><h5><small><em>开始序号：</em></small></h5></label>
  					<div class="col-md-6">
   	 					<input id="step2a" name="first"type="text" placeholder="0~9999的整数" class="form-control" 
   	 					onblur="funStep2a()">
   	 					<small id="tip2a"></small>
   	 				</div>
   	 			</div>
   	 			<div class="form-group" onfocus="step2c">
   	 				<label style="text-align: right;" class="col-md-3 control-label"><h5><small><em>生成数量：</em></small></h5></label>
   	 				<div class="col-md-6">
   	 					<input id="step2b" name="number"type="text" class="form-control" placeholder="1~1000的整数"
   	 					onblur="funStep2b();funDisplay()" onfocus="funStep2c()">
   	 					<small id="tip2b"></small>
   	 					<input id="step2bRes" type="hidden">
   	 				</div>
   	 			</div>
   	 			<div class="form-group">
   	 				<h5>生成的账号为：</h5>
   	 				<div style="margin-left: 10">
   	 				<h4><em style="margin-left: 10%;">
   	 					<b id="display1"></b>
   	 					<b id="display2"></b>
   	 					<b id="display3"></b>
   	 				</em></h4>
   	 				</div>
   	 				<button class="btn btn-default btn-sm" type="button"
   	 				onclick="funDisplay();checkAccount()">检查</button>
   	 			</div>
  			</div>
  			
  			<!--第三步-->
  			<div class="col-md-5">
  					<h3>第三步&nbsp;&nbsp;<small>账号初始信息：</small></h3><br>
  				<div class="col-md-offset-1">
  				<div class="form-group">
  					<label>到期时间<small><em>（允许登录并做实验的期限）</em></small></label>
  					<br><div class="col-md-8">
  						<input id="step3a" name="rent_end" type="date" class="form-control" value="2015-11-01" data-date-format="yyyy/mm/dd"
  						onblur="funStep3a()">
  						<small id="tip3a"></small>
  					</div>	
  				</div>
   	 			<div class="form-group">
   	 				<label>租期内费用<small><em>（单位：元）</em></small></label>
   	 				<br><div class="col-md-8">
   	 					<input id="step3b" name="price" type="text" class="form-control" placeholder="大于0"
   	 					onblur="funStep3b()">
   	 					<small id="tip3b"></small>
  					</div>	
  				</div>	
  				<div class="form-group">
  					<label>初始密码：</label>
   	 				<br><div class="col-md-8">
   	 					<input id="step3c" name="password1" type="text" class="form-control" placeholder="6~25个字母、数字或下划线"
   	 					onblur="funStep3c()">
   	 					<small id="tip3c"></small>
  					</div>	
  				</div>
  				
  				<div class="form-group">	
  					<label>确认密码：</label>
   	 				<br><div class="col-md-8">	
   	 					<input id="step3d" name="password2" type="text" class="form-control" placeholder="再次输入密码"
   	 					onblur="funStep3d()">
   	 					<small id="tip3d"></small>
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
  				<button class="btn btn-warning col-md-2 col-md-offset-3"
  					type="button" onclick="cleanAll()">全部清空</button>
  				<span class="col-md-1"></span>
  				<button onclick="formsubmit()" type="button"
  				class="btn btn-success col-md-2">批量生成</button>
  					
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
