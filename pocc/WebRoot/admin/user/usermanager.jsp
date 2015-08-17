<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%> 
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
	width: 100%;
	height: 100%;
	overflow: scroll;
}

.table{
	width: 100%;
	height: 100%;
	overflow: scroll;
}


</style>

<script>
	//初始函数
	function startfun(){
		<% User modal = (User) request.getAttribute("modalUser");
			if (modal != null) {%>
			//alert("startfun()");
			$('#modal').modal('show');
			
		<%}%>
	}
	//选择展示在表格中的用户
	function selectUser(){
		//alert("selectUser()");
		var form1=this.getElementById("selector");
		form1.submit();
	}
	
	
	//删除选中的单个用户
	function deleteUser(id){
		//TODO 询问是否确认删除
		
		//alert("function deleteUser()");
		//alert("deleteUse "+id);
		document.getElementById("user_id").value=id;
		document.getElementById("tableform").action="UserAction_Delete.action";
		document.getElementById("tableform").submit();
		//alert("after deleteUse "+id);
	}
	
	//TODO
	//批量删除选中用户
	function deleteSelectedUser(id){
	}
	
	//TODO
	//选中全部用户
	function selectAll(){
	}
	
	//用户新增、修改模态框
	//根据id选择用户，展示用户信息
	//see saveModal()
	function launchModal(id){
		document.getElementById("user_id").value=id;
		document.getElementById("tableform").action="UserAction_Show.action";
		document.getElementById("tableform").submit();
		//$('#modal').modal('show');
	}
	
	//保存模态框信息
	//若id为0，新建用户；若id不为0，更新用户信息
	function saveModal(){
	
	}
	
</script>

<body onload="startfun()">
</head>
<!--导入头部导航条-->
<%@include file="../header.jsp" %>

<%@page import="edu.scnu316.entity.User" %>
<%@page import="java.util.List" %>
<%
	//生成用户列表
	List<User> userList = null;
	//User user = new User();
	//user.setUser_account("test1230010");
	//pageContext.setAttribute("modalUser", user);
%>


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
	    
	    <!-- 用户查询框 -->
	    <div class="col-md-2" onload="selectUser()">
	    	<form action="UserAction_Select.action" class="form-horizontal" id="selector" method="post"
	    		style="">
	    		<div class="form-group">
	    			<label>单位：</label><br>
	   	 			<div class="col-md-11">
	    				<input class="form-control">
	    			</div>
	    		</div>
	    		<div class="form-group">
	    		<button class="btn btn-success" onclick="selectUser()">查询用户</button>
	    		</div>.
	    		<div class="form-group">
				<button class="btn btn-primary" type="button"
					onclick="window.location.href='CreateUser.action'">
   					新增用户
				</button>
				</div>
			</form>
	    </div>
	    <!-- 用户查询框 -->
	    
	    <!-- 用户列表框 -->	    
	    <div class="col-md-10">
	    <form id="tableform" method="post">
	    <table class="table table-striped table-responsive table-condensed" style="overflow:inherit;">
	    	<thead>
	    		<tr>
	    			<th>用户账号</th>
	    			<th>用户姓名</th>
	    			<th>所属单位</th>
	    			<th>锁定状态</th>
	    			<th>租期结束时间</th>
	    			<td>
						<a><span style="font-size: large;"></span></a>
						</td><td>
						<button class="btn btn-danger btn-sm"><span
						class="glyphicon glyphicon-trash"></span></button>
						</td><td>
						<input type="checkbox">
					</td>
	    		</tr>
	    	</thead>
			<tbody>
			<%  userList = (List<User>) session.getAttribute("userList");
				if (userList!=null)
				for (User u:userList){
			%>
				<tr>
					<td><%=u.getUser_account() %></td>
					<td><%=u.getUsername() %></td>
					<td><%=u.getUnit_name() %></td>
					<td><%=u.getLock_modeToCN() %></td>
					<td><%=u.getRent_end("yyyy-MM-dd") %></td>
					<td>
						<button class="btn btn-primary btn-sm" type="button"
							onclick="launchModal(<%=u.getUser_id()%>)">
						<span class="glyphicon glyphicon-edit"></span></button>
						</td><td>
						<button class="btn btn-danger btn-sm" onclick="deleteUser('<%=u.getUser_id()%>')">
						<span class="glyphicon glyphicon-trash"></span></button>
						</td><td>
						<input type="checkbox">
					</td>
				</tr>
			<%} %>
			</tbody>
		</table>
		<input id="user_id" name="user_id" type="hidden"/>
			<%if (session.getAttribute("userList")==null){%> <h4>请选择实验用户</h4>
			<%} %>
		</form>
  		<!-- 用户查询框 -->
	    </div>
	    </div>
	    <!--用户列表模块..-->
	</div>
	<!-- 右边内容区域..-->
	

<!-- 用户修改、增加模态框 -->
<s:if test="#request.modalUser!=null">
 
<form action="UpdateAction.action" method="post" class="form-horizontal">
<div class="modal fade" id="modal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">用户账号：<em><s:property value="#request.modalUser.user_account"/></em></h4>
	 </div>
      <div class="modal-body container">
      <!-- 用户信息表单 -->
        	<div class="col-md-6">
        		<div class="form-group">
   					<label class="col-md-4 control-label"><small>用户姓名：</small></label>
   					<div class="col-md-8">
    					<input type="text" class="form-control" name="m_username" 
    					value=<s:property value="#request.modalUser.username"/>>
    				</div>
    			</div>
    			<div class="form-group">
   					<label class="col-md-4 control-label"><small>所属单位：</small></label>
   					<div class="col-md-8">
    					<input type="text" class="form-control" name="m_unit_name" 
    					value=<s:property value="#request.modalUser.unit_name"/>>
    				</div>
    			</div>
    			<div class="form-group">
   					<label class="col-md-4 control-label"><small>缴费日期：</small></label>
   					<div class="col-md-8">
    					<input type="date" class="form-control" name="m_pay_date"
    					value=<s:property value="#request.modalUser.getPay_date('yyyy-MM-dd')"/>>
    				</div>
    			</div>
    			<div class="form-group">
   					<label class="col-md-4 control-label"><small>租金：</small></label>
   					<div class="col-md-8">
    					<input type="text" class="form-control" name="m_price" 
    					value=<s:property value="#request.modalUser.price"/>>
    				</div>
    			</div>
  			</div>
        	<div class="col-md-6">
        		<div class="form-group">
   					<label class="col-md-4 control-label"><small>租期开始：</small></label>
   					<div class="col-md-8">
    					<input type="date" class="form-control" name="m_rent_start" 
						value=<s:property value="#request.modalUser.getRent_start('yyyy-MM-dd')"/>>
    				</div>
    			</div>
    			<div class="form-group">
   					<label class="col-md-4 control-label"><small>租期结束：</small></label>
   					<div class="col-md-8">
    					<input type="date" class="form-control" name="m_rent_end"
    					value=<s:property value="#request.modalUser.getRent_end('yyyy-MM-dd')"/>>
    				</div>
    			</div>    			
    			<div class="form-group">
    				<label class="col-md-4 control-label"><small>锁定状态：</small></label>
   					<div class="col-md-8">
 						<select class="form-control" name="m_lock_mode">
 							<option value="UNLOCK"    <s:if test="#request.modalUser.lock_mode.equals('UNLOCK')">selected</s:if>>有效</option>
 							<option value="LOCK_TEMP" <s:if test="#request.modalUser.lock_mode.equals('LOCK_TEMP')">selected</s:if>>暂时锁定</option>
 							<option value="LOCK_EVER" <s:if test="#request.modalUser.lock_mode.equals('LOCK_EVER')">selected</s:if>>永久锁定</option>
 						</select>
					</div>
    			</div>
    			<input name="m_operator" type="hidden" 
    				value=<s:property value="#session.Role.user_account"/> >
    			<input name="user_id" type="hidden"
    				value=<s:property value="#request.modalUser.user_id"/> >
    			<div class="form-group">
   					<label class="col-md-4 control-label"><small>密码：</small></label>
   					<div class="col-md-8">
    					<input class="btn btn-default" type="button" value="重设密码" 
    					style="width:100%; text-align: left; color: #555;">
    				</div>
    			</div>
        	</div>
        	<!-- 备注项先预留
        	<div class="col-md-12">
        		<div class="col-md-2">
  					<label><small>备注：</small></label>
  				</div>	
  				<div class="col-md-10">
  					<input type="text" class="form-control">
				</div>
        	</div> 
        	-->
	
      </div>
      <div class="modal-footer" style="text-align: rigth;">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button  class="btn btn-info">保存</button>
        <button type="button" class="btn btn-primary">下一条</button>
      </div>
    </div>
  </div>
</div>
</form>
</s:if>
<!-- 用户修改、增加模态框 -->
</div>
</div>   
</body>
</html>
