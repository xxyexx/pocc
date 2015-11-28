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
	max-height:1000px;
	display: block;
}
.container-fluid{
	padding-top:56px;
	height:100% !important;
}
.row{height:100% !important;}
.right-div{
	min-height:450px !important;
	max-height:550px;
	overflow-y:auto; 
}
.right-div .title{
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
.choose_div{
	margin-top:20px;
	padding-top:8px;
	min-height:50px;
	background-color: white;
	color: gray;
}
.card span{
	font-size: 16px;
}
.chart{
	padding:25px;
	margin-top:10px;
	min-height:450px;
	background-color: white !important;
	overflow: auto;
}

</style>
<body>
<!--导入头部导航条-->
<%@include file="header.jsp" %>

<div class="container-fluid">
<div class="row">
	<!--导入左边导航条-->
	<%@include file="left.jsp"%>
	<!-- 右边内容区域 -->
	<div class="col-md-10 col-sm-8 right-div">
	    <div class="title">
		    <a><span class="glyphicon glyphicon-blackboard"></span>
		       <span>计算机组成原理实验平台后台管理系统</span>
		    </a>
	    </div>
<!--用户列表模块-->
	<div class="choose_div">
		<div class="col-md-7">
		<form action="RoleLogin.action" method="post">
			<div class="col-md-3">
				<s:select id="province" cssClass="form-control" list="#request.ProvinceMap" 
							  listKey="key" listValue="value" headerKey="-1" headerValue="-请选择省份-" 
							  value="%{#request.provincevalue}" onchange="changeSchool()">
				</s:select>	
			</div>
			<div class="col-md-3">
				<select name="schoolName" id="school" class="form-control">
					<option value="全部">全部</option>
				</select>
			</div>
			<div class="col-md-3">
				<select name="timeRange" id="timeRange" class="form-control">
					<option value="1">今天</option>
					<option value="2">昨天</option>
					<option value="7">7天</option>
					<option value="30">30天</option>
				</select>
			</div>
			<div class="col-md-3">
				<input class="btn btn-success " type="submit" value="流量查询">
			</div>
			</form>
		</div>
		<div class="col-md-5">
		<div class="card col-md-4">
			<span class="glyphicon glyphicon-signal" aria-hidden="true"></span>
			<span>总流量</span>
			<span><strong>${request.totalnum}</strong></span>
		</div>
		<div class="card col-md-4">
			<span class="glyphicon glyphicon-education" aria-hidden="true"></span>
			<span>计费流量</span>
			<span><strong>${request.nfreenum}</strong></span>
		</div>
		<div class="card col-md-4">
			<span class="glyphicon glyphicon-leaf" aria-hidden="true"></span>
			<span>免费流量</span>
			<span><strong>${request.freenum}</strong></span>
		</div>
		</div>
	</div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="flow" class="chart "></div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="pipe" class="chart"></div>
    <!-- ECharts单文件引入 -->
    <script src="js/echarts-all.js"></script>
    <script src="js/schoollist.js"  type="text/javascript"></script>
    <script type="text/javascript">
    	var sn="${request.schoolvalue}";
	    $(function(){
	    	var tR ="${request.tR}";
	    	$("#timeRange").find("option[value='"+tR+"']").attr("selected",true); 
			//获取学校列表
			changeSchool();
		});
        // 基于准备好的dom，初始化echarts图表
        var flowChart = echarts.init(document.getElementById("flow")); //流量折线
        var pipeChart = echarts.init(document.getElementById("pipe")); //流量饼状
		//option
		var flowx=JSON.parse('${request.flowx}');
		var flowy=JSON.parse('${request.flowy}');
		var freeflowy=JSON.parse('${request.freeflowy}');
		flowoption = {
		    title : {
		        text: '流量统计',
		        subtext: sn
		    },
		    tooltip : {
		        trigger: "axis"
		    },
		    legend: {
		        data:['付费','免费']
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data :flowx
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel : {
		                formatter: '{value} (人)'
		            }
		        }
		    ],
		    series : [
		        {
		            name:'付费',
		            type:'line',
		            data:flowy,
		            markPoint : {
		                data : [
		                    {type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name: '平均值'}
		                ]
		            }
		        },
		        {
		            name:'免费',
		            type:'line',
		            data:freeflowy,
		            markPoint : {
		                data : [
		                	{type : 'max', name: '最大值'},
		                    {type : 'min', name: '最小值'}
		                ]
		            },
		            markLine : {
		                data : [
		                    {type : 'average', name : '平均值'}
		                ]
		            }
		        }
		    ]
		};
		//饼状图
       	var idx = 1;
       	var Sflowx=new Array();
       	var Sflowy=new Array();
       	var Sfreeflowy=new Array();
       	var str="";
       	if(flowx.length==24){
			Sflowx[0]='${request.flowdate}';
			Sflowy[0]='${request.nfreenum}';
			Sfreeflowy[0]='${request.freenum}';
       	}else{
       		for(var i=0;i<flowx.length;i++){
       			Sflowx[i]=flowx[i];
       			Sflowy[i]=flowy[i];
       			Sfreeflowy[i]=freeflowy[i];
       		}
       	}
		pipeoption = {
		    timeline : {
		        data : Sflowx,
		        autoPlay :true,
		        label : {
		            formatter : function(s) {
		                return s.slice(0, 7);
		            }
		        }
		    },
		    options : [
		        {
		            title : {
		                text: '流量统计',
		                subtext: sn
		            },
		            tooltip : {
		                trigger: 'item',
		                formatter: "{a} <br/>{b} : {c} ({d}%)"
		            },
		            legend: {
		                data:['付费','免费']
		            },
		            toolbox: {
		                show : true,
		                feature : {
		                    mark : {show: true},
		                    dataView : {show: true, readOnly: false},
		                    magicType : {
		                        show: true, 
		                        type: ['pie', 'funnel'],
		                        option: {
		                            funnel: {
		                                x: '25%',
		                                width: '50%',
		                                funnelAlign: 'left',
		                                max: 1700
		                            }
		                        }
		                    },
		                    restore : {show: true},
		                    saveAsImage : {show: true}
		                }
		            },
		            calculable : true,
		            series : [
		                {
		                    name:'流量统计',
		                    type:'pie',
		                    data:[
		                        {value:Sflowy[0],  name:'付费'},
		                        {value:Sfreeflowy[0],  name:'免费'}
		                    ]
		                }
		            ]   
		        },
		    ]
		};
		if(flowx.length!=24)
		for(var i=1;i<flowx.length;i++){
			var newoption = {
			 series : [
		                {
		                    name:'流量统计',
		                    type:'pie',
		                    data:[
		                        {value:Sflowy[i],  name:'付费'},
		                        {value:Sfreeflowy[i],  name:'免费'}
		                    ]
		                }
		            ]
			};
			pipeoption.options.push(newoption);
		}
		// 为echarts对象加载数据 
       	pipeChart.setOption(pipeoption); 
        // 为echarts对象加载数据 
       	flowChart.setOption(flowoption); 
    </script>

<!--用户列表模块..-->
	<!-- 右边内容区域..-->
</div>
</div>
</div>   
</body>
</html>
