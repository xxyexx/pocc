package edu.scnu316.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.scnu316.entity.User;
import edu.scnu316.service.UserService;
import edu.scnu316.service.impl.UserServiceImpl;
import edu.scnu316.util.MD5Util;
import edu.scnu316.util.StringUtil;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 6627432641184163195L;

	
	private UserService userService;	
	private HttpServletRequest request; 	
	
	private int user_id;
	
	private String prefix;	
	private int first;	
	private int number;	
	
	private Timestamp rent_end;	
	private String userName;
	private String password;
	private String result;
	private double price;
	private String password1;
	private String operator;
	

	/**
	 * 构造方法
	 */
	public UserAction(){
		this.userService = new UserServiceImpl();
		this.request = ServletActionContext.getRequest();
	}
	
	
	/**
	 * 选择展示列表中的用户
	 */
	public String Select(){
		
//		System.out.println("enter Select()");
		request.getSession().setAttribute("userList", 
				userService.userFilter(null));
		return "usermanager.jsp";
		
	}
	
	/**
	 * 使用弹出框展示用户
	 */
	public String Show(){
		System.out.println("enter Show()");
		//System.out.println("request:"+ServletActionContext.getRequest().getParameter("user_id"));
		
		//System.out.println(getUser_id());
		//int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("user_id"));
		request.setAttribute("modalUser", userService.getUserByID(getUser_id()));
		return "usermanager.jsp";
		
	}
	/**
	 * 登录账号密码验证
	 */
	public String LoginAjax(){
		setResult(userService.CheckLogin(userName, password));
		if(getResult().equals("Login_success")){//登录成功保存session
			User user=userService.getUser(userName);
			request.getSession().setAttribute("User", user);
		}
		return SUCCESS;
	}
	
	/**
	 * 用户退出
	 * @return
	 */
	public String LogoutAjax(){
		User user = (User) request.getSession().getAttribute("User");
		System.out.println(user.getUsername()+"退出了系统");
		request.getSession().invalidate();
		return "Logout";
	}	
	
	/**
	 * 删除用户，返回boolean型结果：<br>
	 * session.getAttribute("deleteuser");
	 * @return true 删除成功；<br>
	 * 		   false 删除失败；
	 */
	public String Delete(){
		//System.out.println("enter Delete()");
//		System.out.println(getUser_id());
		boolean deleteuser = userService.deleteUser(getUser_id());
		request.getSession().setAttribute("deleteuser",deleteuser);
		
		//更新用户列表
		this.Select();
//		System.out.println("Select()后返回到Delete()");
		return "usermanager.jsp";
	}
	
	/**
	 * 批量创建用户,完成后转到用户管理页面可直接查询到已创建用户<br>
	 * 需要在输入页面保证用户信息符合规范，
	 */
	public String Create(){

//		System.out.println("enter BatchCreate()");
		User model = new User();
		model.setPassword(MD5Util.md5Encode(getPassword1()));
		model.setRent_end(getRent_end());
		model.setPrice(getPrice());
		model.setOperator(getOperator());
		boolean createuser = userService.createUser(prefix, first, number, model);
		request.getSession().setAttribute("createuser", createuser);
		return "usermanager.jsp";
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Timestamp getRent_end() {
		return rent_end;
	}

//	public String getUser_id() {
//		return  user_id;
//	}

//	public void setUser_id(int user_id) {
//		System.out.println("enter setUser_id");
//		System.out.println(user_id);
//		this.user_id = user_id;
//	}
//	public void setUser_id(String str_id){
//		
//		System.out.println("enter setUser_id string");
//		this.user_id=str_id;
//	}

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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}



	public void setRent_end(String str_rent_end) {		
		this.rent_end = StringUtil.StringTOTimestamp(str_rent_end);		
	}

		
	public String getPassword1() {
		return password1;
	}
	
	public void setPassword1(String password1) {
		this.password1 = password1;
	}


	public String getOperator() {
		return operator;
	}


	public void setOperator(String operator) {
		this.operator = operator;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}



}
