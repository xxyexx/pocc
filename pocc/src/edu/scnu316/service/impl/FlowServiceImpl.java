package edu.scnu316.service.impl;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.scnu316.entity.LogData;
import edu.scnu316.service.FlowService;
import edu.scnu316.util.LogUtil;

public class FlowServiceImpl implements FlowService{
	
	@Override
	public List<String> getFlowX_coor(int timeRange) {
		List<String> flow_x=new ArrayList<String>();
		if(timeRange==1||timeRange==2){//一天的返回0~23点
			for(int i=23;i>=0;i--){
				flow_x.add(i+"");
			}
		}else{//日期
			Calendar calendar = new GregorianCalendar();
			DateFormat sdf = new SimpleDateFormat("MM-dd"); 
			for(int i=0;i<timeRange;i++){
				calendar.setTime(new Date());//当前日期
				calendar.add(calendar.DATE,0-i);//明天
				flow_x.add(sdf.format(calendar.getTime()));
			}
		}
		return flow_x;
	}

	@Override
	public List<Integer> getFlowY_coor(int timeRange,String schoolName,boolean isfree) {
		Timestamp ftime,ltime;//开始.结束时间
		List<Integer> flow_Y=new ArrayList<Integer>();
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
		if(timeRange==1){//今天
			ftime = Timestamp.valueOf(sdf.format(new Date()));//今天的0点
			Calendar calendar = new GregorianCalendar();
			calendar.add(calendar.DATE,1);//明天
			ltime = Timestamp.valueOf(sdf.format(calendar.getTime()));//明天的0点
			List<LogData> ListLog;
			if(schoolName==null||schoolName.equals(LogUtil.ALLSCHOOL)){
				ListLog = LogUtil.getLogBetween(LogUtil.OPER_LOGIN, ftime, ltime);
			}else{
				ListLog = LogUtil.getLogBetween(LogUtil.OPER_LOGIN, ftime, ltime,schoolName);
			}
			for(int i=23;i>=0;i--){//24个小时
				int num=0;
				for(int j=0;j<ListLog.size();j++){
					Date d = new Date();
					d=ListLog.get(j).getOperator_time();
					calendar.setTime(d); 
					if(calendar.get(calendar.HOUR_OF_DAY)==i){
						if(isfree){//免费用户才统计
							if(ListLog.get(j).getName().equals(LogUtil.FREEUSER)){num++;}
						}else{
							num++;
						}
					}
				}
				flow_Y.add(num);
			}
		}else if(timeRange==2){//昨天
			ltime = Timestamp.valueOf(sdf.format(new Date()));//今天的0点
			Calendar calendar = new GregorianCalendar();
			calendar.add(calendar.DATE,-1);//昨天
			ftime = Timestamp.valueOf(sdf.format(calendar.getTime()));//昨天的0点
			List<LogData> ListLog;
			if(schoolName==null||schoolName.equals(LogUtil.ALLSCHOOL)){
				ListLog = LogUtil.getLogBetween(LogUtil.OPER_LOGIN, ftime, ltime);
			}else{
				ListLog = LogUtil.getLogBetween(LogUtil.OPER_LOGIN, ftime, ltime,schoolName);
			}
			for(int i=23;i>=0;i--){//24个小时
				int num=0;
				for(int j=0;j<ListLog.size();j++){
					Date d = new Date();
					d=ListLog.get(j).getOperator_time();
					calendar.setTime(d); 
					if(calendar.get(calendar.HOUR_OF_DAY)==i){
						if(isfree){//免费用户才统计
							if(ListLog.get(j).getName().equals(LogUtil.FREEUSER)){num++;}
						}else{//付费用户统计
							num++;
						}
					}
				}
				flow_Y.add(num);
			}
		}else{//统计每天的流量
			Calendar calendar = new GregorianCalendar();
			for(int i=0;i<timeRange;i++){
				calendar.setTime(new Date());
				calendar.add(calendar.DATE,1-i);//明天
				ltime = Timestamp.valueOf(sdf.format(calendar.getTime()));//明天的0点
				calendar.setTime(new Date());//当前日期
				calendar.add(calendar.DATE,-i);//timeRange天前
				ftime = Timestamp.valueOf(sdf.format(calendar.getTime()));//timeRange天前的0点
	
				List<LogData> ListLog;
				if(schoolName==null||schoolName.equals(LogUtil.ALLSCHOOL)){
					ListLog = LogUtil.getLogBetween(LogUtil.OPER_LOGIN, ftime, ltime);
				}else{
					ListLog = LogUtil.getLogBetween(LogUtil.OPER_LOGIN, ftime, ltime,schoolName);
				}
				int num=0;
				for(int j=0;j<ListLog.size();j++){
					if(isfree){//免费用户才统计
						if(ListLog.get(j).getName().equals(LogUtil.FREEUSER)){num++;}
					}else{//付费用户统计
						num++;
					}
				}
				flow_Y.add(num);
			}
			
		}
		return flow_Y;
	}

}
