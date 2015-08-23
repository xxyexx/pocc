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
<script type="text/javascript">
	$(function(){
		//设置性别
		$("input[name='user.sex'][value=${session.User.sex}]").attr("checked",true);
		//获取城市列表
		changeCity();
	});
	function changeCity(){//获取城市列表
		var provincename = $("#province option:selected").text();
		if(provincename!="-请选择省份-"){
			//通过省份ID获取city数据
			$.ajax({
				url : "UserCenterChangeCity.action",
				type : "post",
				data :{provinceName:provincename,},
				success : function(data) {
					setCityList(data);
				}
			});
		}else{
			$("#city").empty();
			$("#city").append("<option value='"+-1+"'>(´･ω･`)</option>");
		}
	}
	function setCityList(cityList){//设置城市列表
		var cityname = "${session.User.city_name}";
		$("#city").empty();
		if(getJsonLength(cityList)!=0){
			for(var cityID in cityList){
				if(cityname==cityList[cityID]){
					$("#city").append("<option value='"+cityID+"' selected='selected'>"+cityList[cityID]+"</option>");
				}else{
					$("#city").append("<option value='"+cityID+"'>"+cityList[cityID]+"</option>");
				}
			}
		}else{
			$("#city").append("<option value='"+-1+"'>--</option>");
		}
	}
	function getJsonLength(jsonData){//计算json长度
		var jsonLength = 0;
		for(var item in jsonData){
			jsonLength++;
		}
		return jsonLength;
	}
	
</script>
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
		<form action="UserCenterChangeMessage.action" method="post" class="user-info">
		<div class="info-group">
		    <label for="userName" class="control-label">用户名</label>
		    <input name="user.username" value="${session.User.username}" class="userinput form-control" type="text" placeholder="请输入用户名">
		</div>
		<div class="info-group">
		    <label class="control-label">所在城市</label>
			<s:select id="province" list="#request.ProvinceMap" 
					  listKey="key" listValue="value" headerKey="-1" headerValue="-请选择省份-" 
					  value="%{#session.User.province_id}"  onchange="changeCity()" class="form-control">
			</s:select>
		    <select name="user.city_id" id="city" class="form-control">
		    	<option value="${session.User.city_id}">${session.User.city_name}</option>
		    </select>
		</div>
		<div class="info-group">
		    <label for="school" class="control-label">所在学校</label>
		    <input name="user.unit_name" value="${session.User.unit_name}" class="userinput form-control" type="text"  id="userName" placeholder="请输入学校（单位）全称">
		</div>
		
		<div class="info-group">
		    <label for="userName" class="control-label">年龄</label>
		    <input name="user.age" value="${session.User.age}" class="userinput form-control" type="number" min="0" max="150" placeholder="请输入年龄">
		</div>
		<div class="info-group">
		    <label class="control-label">性别</label>
		    <label class="radiolabel"><input type="radio" name="user.sex" id="inlineRadio1" value="保密">保密</label>
			<label class="radiolabel"><input type="radio" name="user.sex" id="inlineRadio2" value="男">男</label>
			<label class="radiolabel"><input type="radio" name="user.sex" id="inlineRadio3" value="女">女</label>
		</div>
		<div class="user-sign">
			 <label class="control-label">个性签名</label>
			 <textarea name="user.remark" class="form-control" rows="5" placeholder="这家伙很懒，什么都没写。">${session.User.remark}</textarea>
		</div>
		<input type="submit" class="btn btn-primary" value="保存"/>
		</form>
	</div>
</div>
</div>

<!--导入footer-->
<%@include file="footer.jsp" %>
</body>
</html>
