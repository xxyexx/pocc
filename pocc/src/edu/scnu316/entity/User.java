package edu.scnu316.entity;

import java.sql.Timestamp;

import javax.persistence.*;

import edu.scnu316.util.CityUtil;
import edu.scnu316.util.StringUtil;


/**
 * 实验用户
 */
@Entity(name="user_inf")
public class User implements Cloneable{

	@Id @Column(name="user_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int user_id;
	
	private String user_account;//账号
	private String username;//用户名
	private String password;//密码
	private String lock_mode;//账号锁定状态
	private String unit_name;//组织名
	private Timestamp rent_start;//租期开始时间
	private Timestamp rent_end;//租期结束时间
	private double price;//租金价格
	private Timestamp pay_date;//缴费日期
	private String operator;//操作人姓名
	private String save_url;//实验保存路径
	private Timestamp last_login;//最后登录时间
	private String last_ip;//最后登录IP
	private String remark;//备注
	/**
	* 用户账号中的序号（后四位数字的值），方便后台操作
	* 如账号为scnu1230010，序号为10 
	*/
	private int seq;
	private String sex;
	private String age;
	private int city_id;
	private String icon_url;

	
	
	
	
	public User(){
		//默认属性
		//TODO
		this.user_id = 0;
		this.price = 0;
		this.seq = 0;
		this.sex = "保密";
		this.age = "保密";
		this.city_id = 0;
		this.icon_url = "在实体类中设置默认头像路径";
	}



	public int getUser_id() {
		return user_id;
	}


	public String getUser_account() {
		return user_account;
	}



	public void setUser_account(String user_account) {
		this.seq = Integer.parseInt(user_account.substring(user_account.length()-4));
		this.user_account = user_account;
	}



	public String getUsername() {
		if (username == null) return "";
		return username;
	}



	public void setUsername(String username) {
		if (username==null) username = "";
		this.username = username;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getLock_mode() {
		return lock_mode;
	}

	/**
	 * 返回锁定状态对应的中文
	 * @return 有效、临时锁定或永久锁定
	 */
	public String getLock_modeToCN() {
		if ("LOCK_TEMP".equals(this.lock_mode)) return "临时锁定";
		if ("LOCK_EVER".equals(this.lock_mode)) return "永久锁定";
		return "有效";
	}
	
	/**
	 * 锁定状态
	 * @param lock_mode 锁定状态:<p>
	 * 允许值：<br>
	 * <blockqueto><pre>
	 * 1、  UNLOCK	  (有效)<br>
	 * 2、  LOCK_TEMP	  (临时锁定)<br>
	 * 3、  LOCK_EVER	  (永久锁定)<br>
	 * </pre></blockqueto>
	 */
	public void setLock_mode(String lock_mode) {
		String mode ="UNLOCK";
		if ("LOCK_TEMP".equals(lock_mode.toUpperCase())) mode="LOCK_TEMP";
		if ("LOCK_EVER".equals(lock_mode.toUpperCase())) mode="LOCK_EVER";
		this.lock_mode = mode;
	}
	



	/**
	 * @return 单位名称
	 */
	public String getUnit_name() {
		if (unit_name == null) return "";
		return unit_name;
	}



	public void setUnit_name(String unit_name) {
		if (unit_name==null) unit_name = "";
		this.unit_name = unit_name;
	}



	public Timestamp getRent_start() {
		return rent_start;
	}
	public String getRent_start(String formate){
		return StringUtil.TimestampToString(rent_start, formate);
	}


	public void setRent_start(Timestamp rent_start) {
		this.rent_start = rent_start;
	}



	public Timestamp getRent_end() {
		return rent_end;
	}
	public String getRent_end(String formate){
		return StringUtil.TimestampToString(rent_end, formate);
	}
	

	public void setRent_end(Timestamp rent_end) {
		this.rent_end = rent_end;
	}


	public double getPrice() {
		return price;
	}



	public void setPrice(double price) {
		this.price = price;
	}



	public Timestamp getPay_date() {
		return pay_date;
	}
	public String getPay_date(String formate){
		return StringUtil.TimestampToString(pay_date, formate);
	}



	public void setPay_date(Timestamp pay_date) {
		this.pay_date = pay_date;
	}



	public String getOperator() {
		return operator;
	}



	public void setOperator(String operator) {
		this.operator = operator;
	}



	public String getSave_url() {
		return save_url;
	}



	public void setSave_url(String save_url) {
		this.save_url = save_url;
	}



	public Timestamp getLast_login() {
		return last_login;
	}
	public String getLast_login(String formate) {
		return StringUtil.TimestampToString(last_login, formate);
	}



	public void setLast_login(Timestamp last_login) {
		this.last_login = last_login;
	}



	public String getLast_ip() {
		return last_ip;
	}



	public void setLast_ip(String last_ip) {
		this.last_ip = last_ip;
	}



	public String getRemark() {
		return remark;
	}



	public void setRemark(String remark) {
		this.remark = remark;
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
	}

	
	
	
	@Override
	public Object clone(){
		User u = null;
		try {
			u = (User) super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return u;
	}



	public String getSex() {
		return sex;
	}



	public void setSex(String sex) {
		
		this.sex = sex;
	}



	public String getAge() {
		return age;
	}



	public void setAge(String age) {
		this.age = age;
	}



	public int getCity_id() {
		return city_id;
	}
	
	public String getCity_name(){		
		return CityUtil.getCity_name(this.city_id);
	}
	
	public String getProvince_name(){
		return CityUtil.getProvince_name(this.city_id);
	}



	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}



	public String getIcon_url() {
		return icon_url;
	}



	public void setIcon_url(String icon_url) {
		this.icon_url = icon_url;
	}



	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


}
