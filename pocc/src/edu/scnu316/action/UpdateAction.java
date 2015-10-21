package edu.scnu316.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.scnu316.entity.User;
import edu.scnu316.service.UserService;
import edu.scnu316.service.impl.UserServiceImpl;
import edu.scnu316.util.StringUtil;


/**
 * 专门负责更新用户信息
 * @author 小叶浪浪浪
 *
 */
public class UpdateAction extends ActionSupport {

	
	private static final long serialVersionUID = -5369514622776675684L;

	private UserService userService;	
	private HttpServletRequest request; 	
	
	private int user_id; //用户账号
	private String m_username;//用户名
	private String m_lock_mode;//账号锁定状态
	private String m_unit_name;//组织名
	private Timestamp m_rent_start;//租期开始时间
	private Timestamp m_rent_end;//租期结束时间
	private double m_price;//租金价格
	private Timestamp m_pay_date;//缴费日期
	private String m_operator;//操作人姓名
	
	public UpdateAction(){
		this.userService = new UserServiceImpl();
		this.request = ServletActionContext.getRequest();
	}
	
	public String Update(){
//		System.out.println("enter Update()");
		User u = userService.getUserByID(getUser_id());
		u.setUsername(getM_username());
		u.setUnit_name(getM_unit_name());
		u.setLock_mode(getM_lock_mode());
		u.setUnit_name(getM_unit_name());
		u.setRent_start(getM_rent_start());
		u.setRent_end(getM_rent_end());
		u.setPrice(getM_price());
		u.setPay_date(getM_pay_date());
		u.setOperator(getM_operator());
		userService.updateUser(u);
		return "usermanager.jsp";
		
	}

	public String getM_username() {
		return m_username;
	}

	public void setM_username(String m_username) {
		this.m_username = m_username;
	}

	public String getM_lock_mode() {
		return m_lock_mode;
	}

	public void setM_lock_mode(String m_lock_mode) {
		this.m_lock_mode = m_lock_mode;
	}

	public String getM_unit_name() {
		return m_unit_name;
	}

	public void setM_unit_name(String m_unit_name) {
		this.m_unit_name = m_unit_name;
	}

	public Timestamp getM_rent_start() {
		return m_rent_start;
	}

	public void setM_rent_start(String str_rent_start) {
		this.m_rent_start = StringUtil.StringToTimestamp(str_rent_start);
	}

	public Timestamp getM_rent_end() {
		return m_rent_end;
	}

	public void setM_rent_end(String str_rent_end) {
		this.m_rent_end = StringUtil.StringToTimestamp(str_rent_end);
	}

	public double getM_price() {
		return m_price;
	}

	public void setM_price(double m_price) {
		this.m_price = m_price;
	}

	public Timestamp getM_pay_date() {
		return m_pay_date;
	}

	public void setM_pay_date(String str_pay_date) {
		this.m_pay_date = StringUtil.StringToTimestamp(str_pay_date);
	}

	public String getM_operator() {
		return m_operator;
	}

	public void setM_operator(String m_operator) {
		this.m_operator = m_operator;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	
	
	
	
	
	
	
	
}
