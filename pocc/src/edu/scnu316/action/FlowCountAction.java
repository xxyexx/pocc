package edu.scnu316.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import edu.scnu316.service.FlowService;
import edu.scnu316.service.impl.FlowServiceImpl;
import edu.scnu316.util.CityUtil;
import edu.scnu316.util.LogUtil;

/**
 * @author liu
 *  流量统计
 *  统计免费流量和付费流量
 */
public class FlowCountAction extends ActionSupport {
	HttpServletRequest request;
	private FlowService flowService;
	//输入条件
	private String schoolName;//查询条件中学校的名字
	private int timeRange;//时间范围1:今天 ;2:昨天;7:7天;30:30天;
	//输出
	private List<String> flowx;//横坐标（时间|日期）
	private List<Integer> flowy;//纵坐标（人）付费
	private List<Integer> freeflowy;//纵坐标（人）免费
	
	public FlowCountAction(){
		request = ServletActionContext.getRequest();
		flowService = new FlowServiceImpl();
		timeRange=1;//默认为今天
		schoolName="全部";//默认为全部
		request.setAttribute("provincevalue", -1);//默认省份
		request.setAttribute("schoolvalue", "全部");//默认学校
	}
	/**
	 * 统计并显示流量信息
	 */
	public String show(){
		//获取流量list
		flowx=flowService.getFlowX_coor(timeRange);
		flowy=flowService.getFlowY_coor(timeRange,schoolName,false);//付费流量
		freeflowy=flowService.getFlowY_coor(timeRange, schoolName, true);//免费流量
		int totalnum=0;//总流量
		int freenum=0;//免费
		int nfreenum=0;//收费
		
		//数组保存信息
		String[] flowxarr = new String[flowx.size()];
		int[] flowyarr = new int[flowy.size()];
		int[] freeflowyarr =  new int[freeflowy.size()];
		for(int i=0;i<flowx.size();i++){
			flowxarr[i]=flowx.get(flowx.size()-1-i);
		}
		for(int i=0;i<flowy.size();i++){
			flowyarr[i]=flowy.get(flowx.size()-1-i);
		}
		for(int i=0;i<freeflowy.size();i++){
			freeflowyarr[i]=freeflowy.get(flowx.size()-1-i);
		}
		//计算总流量信息
		for(int i=0;i<flowy.size();i++){
			totalnum=totalnum+flowy.get(i)+freeflowy.get(i);
			nfreenum=nfreenum+flowy.get(i);
			freenum=freenum+freeflowy.get(i);
		}
		
		Gson gson =new Gson();
		
		//设置城市列表
		Map<Integer,String> provinceMap = CityUtil.getProvince_all();
		request.setAttribute("ProvinceMap", provinceMap);
		//保存查询的日期
		if(flowxarr.length==24){
			Calendar calendar = new GregorianCalendar();
			calendar.add(calendar.DATE,1-timeRange);//
			DateFormat sdf = new SimpleDateFormat("MM-dd");
			request.setAttribute("flowdate", sdf.format(calendar.getTime()));
		}
		//保存查询的省份、学校id、时间
		request.setAttribute("tR", timeRange);
		if(!schoolName.equals("全部")){
			request.setAttribute("provincevalue", CityUtil.getProvince_idBySchoolName(schoolName));
			request.setAttribute("schoolvalue", schoolName);
		}else{
			request.setAttribute("provincevalue", -1);
			request.setAttribute("schoolvalue", "全部");
		}
		//总流量信息
		request.setAttribute("totalnum", totalnum);//总流量
		request.setAttribute("freenum", freenum);//免费流量
		request.setAttribute("nfreenum", nfreenum);//付费流量
		//图标xy坐标数组
		request.setAttribute("flowx", gson.toJson(flowxarr));//x坐标
		request.setAttribute("flowy",  gson.toJson(flowyarr));
		request.setAttribute("freeflowy",  gson.toJson(freeflowyarr));
		return SUCCESS;
	}
	
	//getter & setter
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public int getTimeRange() {
		return timeRange;
	}
	public void setTimeRange(int timeRange) {
		this.timeRange = timeRange;
	}
	public List<String> getFlowx() {
		return flowx;
	}
	public void setFlowx(List<String> flowx) {
		this.flowx = flowx;
	}
	public List<Integer> getFlowy() {
		return flowy;
	}
	public void setFlowy(List<Integer> flowy) {
		this.flowy = flowy;
	}
	public List<Integer> getFreeflowy() {
		return freeflowy;
	}
	public void setFreeflowy(List<Integer> freeflowy) {
		this.freeflowy = freeflowy;
	}

}
