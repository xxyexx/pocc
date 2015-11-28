package edu.scnu316.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.scnu316.entity.LogData;
import edu.scnu316.entity.Page;
import edu.scnu316.service.LogService;
import edu.scnu316.service.impl.LogServiceImpl;
import edu.scnu316.util.LogUtil;

/**
 * @author liu
 *系统日志的action
 */
public class LogAction extends ActionSupport {
	HttpServletRequest request;
	LogService logService;
	//输入条件
	private int pageNo;
	
	
	
	public LogAction(){
		request = ServletActionContext.getRequest();
		logService = new LogServiceImpl();
		pageNo = 1;//默认第一页
	}
	
	public String show(){
		List<LogData> LogList = new ArrayList<LogData>();
		LogList=LogUtil.getLogDataAll();
		request.setAttribute("LogList", LogList);
		
		
		Page<LogData> logPage = new Page<LogData>(pageNo);
		logPage = logService.getLogPage(pageNo, 8);//每页显示8条
		request.setAttribute("logPage", logPage);
		
		return SUCCESS;
	}
	
	
}
