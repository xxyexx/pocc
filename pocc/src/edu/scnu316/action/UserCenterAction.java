package edu.scnu316.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.scnu316.util.CityUtil;

public class UserCenterAction extends ActionSupport {
	HttpServletRequest request;
	private String result;
	/**
	 * 构造方法
	 */
	public UserCenterAction(){
		request = ServletActionContext.getRequest();
	}
	/**
	 * 显示用户信息
	 * 设置城市列表
	 */
	public String Show(){
		Map<Integer,String> provinceMap = CityUtil.getProvince_all();
		request.setAttribute("ProvinceMap", provinceMap);
		return "UserCenter.jsp";
	}
}
