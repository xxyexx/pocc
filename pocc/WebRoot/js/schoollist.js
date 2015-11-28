//搜索条件，显示学校
function changeSchool(){//获取学校列表
	var provincename = $("#province option:selected").text();
	if(provincename!="-请选择省份-"){
		//通过省份ID获取city数据
		$.ajax({
			url : "UserAction_getSchool.action",
			type :"post",
			data :{provinceName:provincename,},
			success : function(data) {
				setSchoolList(data);
			}
		});
	}else{
		$("#school").empty();
		$("#school").append("<option value='全部'>全部</option>");
	}
}
function setSchoolList(schoolList){//设置学校列表
	var schoolname = sn;
	$("#school").empty();
	if(getJsonLength(schoolList)!=0){
		for(var schoolName in schoolList){
			if(schoolname==schoolList[schoolName]){
				$("#school").append("<option value='"+schoolName+"' selected='selected'>"+schoolList[schoolName]+"</option>");
			}else{
			$("#school").append("<option value='"+schoolName+"'>"+schoolList[schoolName]+"</option>");
			}
		}
	}else{
		$("#school").append("<option value='全部'>全部</option>");
	}
}
function getJsonLength(jsonData){//计算json长度
	var jsonLength = 0;
	for(var item in jsonData){
		jsonLength++;
	}
	return jsonLength;
}