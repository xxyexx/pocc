package edu.scnu316.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.scnu316.entity.LogData;
import edu.scnu316.entity.Role;
import edu.scnu316.service.RoleService;
import edu.scnu316.service.impl.RoleServiceImpl;
import edu.scnu316.util.LogUtil;

public class RoleAction extends ActionSupport {
	private String userName;
	private String password;
	HttpServletRequest request;
	private String result;
	private RoleService Roleservice;
	public RoleAction(){
		request = ServletActionContext.getRequest();
		Roleservice = new RoleServiceImpl();
	}
	
	
	
	/**
	 * 登录账号密码验证
	 * @param
	 */
	public String LoginAjax(){
		System.out.println("账号："+userName);
		System.out.println("密码："+password);
		setResult(Roleservice.CheckLogin(userName, password));
		if(getResult().equals("Login_success")){//登录成功保存session
			Role role=Roleservice.getRole(userName);
			request.getSession().setAttribute("Role", role);
			
			//日志记录
			String identity="role";
			if(role.getUser_account().equals("admin")){identity="admin";}
			LogData logdata=new LogData(identity,role.getUser_account(),"",role.getRemark(),new Timestamp(System.currentTimeMillis()),"管理员登录");
			LogUtil.saveLog(logdata);
		}
		System.out.println("result="+getResult());
		return SUCCESS;
	}
	
	/**
	 * 管理员退出
	 * @return
	 */
	public String LogoutAjax(){
		System.out.println("管理员退出系统");
		request.getSession().invalidate();
		return "Logout";
	}
	
	public String Select(){
		System.out.println("enter RoleAction Select()");
		
		request.getSession().setAttribute("roleList",
				Roleservice.roleFilter(null));
		
		return "rolemanager.jsp";		
	}
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
}
