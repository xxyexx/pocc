package edu.scnu316.action;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.scnu316.entity.LogData;
import edu.scnu316.entity.User;
import edu.scnu316.service.UserService;
import edu.scnu316.service.impl.UserServiceImpl;
import edu.scnu316.util.CityUtil;
import edu.scnu316.util.LogUtil;
import edu.scnu316.util.MD5Util;
import edu.scnu316.util.StringUtil;

public class UserAction extends ActionSupport {

	private static final long serialVersionUID = 6627432641184163195L;
	
	//每页显示数据
	private static final int pageSize = 12;

	//用户访问DAO层
	private UserService userService;	
	private HttpServletRequest request; 	
	
	//用户id，用户展示用户、删除用户
	private int user_id;
	private int next_user_id;
	
	//用户生成信息：包括账号、租期、费用等
	private String prefix;	
	private int first;	
	private int number;	
	private Timestamp rent_start;
	private Timestamp rent_end;	
	private String userName;
	private String password;
	private String result;
	private double price;
	private String password1;
	private String operator;
	private String unit;
	
	
	//用户删除列表，用户删除用户
	private String deleteList;

	//当前显示的页码
	private int pageNo;
	private String schoolName;//当前学校的名字
	
	private String provinceName;//ajax传入的省份
	private Map<String,String> schoolMap;//ajax返回的学校列表
	
	/**
	 * 构造方法
	 * @throws UnsupportedEncodingException 
	 */
	public UserAction() throws UnsupportedEncodingException{
		this.userService = new UserServiceImpl();
		this.request = ServletActionContext.getRequest();
		request.setCharacterEncoding("utf-8");
		request.getSession().setAttribute("provincevalue", -1);//默认省份
		
	}
	/**
	 * 一开始加载界面就要保存Province到request
	 */
	public String ShowProvince(){
		//设置城市列表
		Map<Integer,String> provinceMap = CityUtil.getProvince_all();
		request.setAttribute("ProvinceMap", provinceMap);
		return "usermanager.jsp";
	}
	/**
	 * Ajax传入provinceName获取school列表
	 */
	public String getSchool(){
		schoolMap = CityUtil.getSchool_all(provinceName);
		return "getSchoolAjax";
	}
	
	/**
	 * 选择展示列表中的用户
	 */
	public String Select(){
		
//		System.out.println("enter Select()");
//		System.out.println(userService.getNumByFilter(null));
		Integer page = getPageNo();
		request.getSession().setAttribute("pageNo", page);
		User model= new User();
		model.setUnit_name(schoolName);//学校
		request.getSession().setAttribute("userList", 
				userService.userFilter(model, getPageNo(), pageSize));
		request.getSession().setAttribute("schoolvalue", schoolName);//保存学校
		//保存省份id
		if(!schoolName.equals("不限")){
			request.getSession().setAttribute("provincevalue", CityUtil.getProvince_idBySchoolName(schoolName));
		}else{
			request.getSession().setAttribute("provincevalue", -1);
		}
		ShowProvince();
		return "usermanager.jsp";
	}
	
	/**
	 * 使用弹出框展示用户
	 */
	public String Show(){
		//System.out.println("enter Show()");
		//System.out.println("nextUserID:"+getNext_user_id());
		request.setAttribute("modalUser", userService.getUserByID(getUser_id()));
		request.setAttribute("nextUserID",String.valueOf(getNext_user_id()));
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
			
			//日志记录
			LogData logdata=new LogData("student",user.getUser_account(),user.getUsername(),user.getUnit_name(),new Timestamp(System.currentTimeMillis()),"用户登录");
			LogUtil.saveLog(logdata);
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
//		System.out.println("Select()后返回到Delete()");
		return Select();
	}
	

	/**
	 * 批量删除用户，输入格式：
	 * 若设置deleteList="1;3;5;7;9;"则删除id为1,3,5,7,9的用户
	 */
	public String batchDelete(){
		
		//System.out.println("enter batchDelete()");
		String[] list=getDeleteList().split(";");
		//System.out.println(getDeleteList());
		//System.out.println(list);
		for (String i:list){
			//System.out.println(i);
			//System.out.println(userService.deleteUser(Integer.valueOf(i)));
			userService.deleteUser(Integer.valueOf(i));
		}
		
		return Select();
		
	}
	
	
	/**
	 * 批量创建用户,完成后转到用户管理页面可直接查询到已创建用户<br>
	 * 需要在输入页面保证用户信息符合规范，
	 */
	public String Create(){

		//System.out.println("enter BatchCreate()");
		User model = new User();
		//System.out.println("unit="+getUnit());
		model.setUnit_name(getUnit());
		model.setPassword(MD5Util.md5Encode(getPassword1()));
		model.setRent_start(getRent_start());
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

	public Timestamp getRent_start() {
		return rent_start;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}



	public void setRent_end(String str_rent_end) {		
		this.rent_end = StringUtil.StringToTimestamp(str_rent_end);		
	}
	


	public void setRent_start(String str_rent_start) {
		this.rent_start = StringUtil.StringToTimestamp(str_rent_start);
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


	public int getNext_user_id() {
		return next_user_id;
	}


	public void setNext_user_id(int next_user_id) {
		this.next_user_id = next_user_id;
	}


	public String getDeleteList() {
		return deleteList;
	}


	public void setDeleteList(String deleteList) {
		this.deleteList = deleteList;
	}


	public int getPageNo() {
		return pageNo;
	}


	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}


	public String getUnit() {
		return unit;
	}


	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public Map<String, String> getSchoolMap() {
		return schoolMap;
	}
	public void setSchoolMap(Map<String, String> schoolMap) {
		this.schoolMap = schoolMap;
	}





}
