package edu.scnu316.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
/**
 * @author liu
 *日志类，保存用户登录，操作时间，操作内容信息
 */
@Entity(name="log_inf")
public class LogData {
	@Id @Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String role;//student|manager|admin
	private String account;//账号
	private String name;//用户名
	private String school;
	private Timestamp operator_time;//操作时间
	private String operator_content;//操作内容
	public LogData(){}
	public LogData(String role, String account, String name, String school,
			Timestamp operator_time, String operator_content) {
		super();
		this.role = role;
		this.account = account;
		this.name = name;
		this.school = school;
		this.operator_time = operator_time;
		this.operator_content = operator_content;
	}
	//getter , setter
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public Timestamp getOperator_time() {
		return operator_time;
	}
	public void setOperator_time(Timestamp operator_time) {
		this.operator_time = operator_time;
	}
	public String getOperator_content() {
		return operator_content;
	}
	public void setOperator_content(String operator_content) {
		this.operator_content = operator_content;
	}
	@Override
	public String toString() {
		return "LogData [id=" + id + ", role=" + role + ", account=" + account
				+ ", name=" + name + ", school=" + school + ", operator_time="
				+ operator_time + ", operator_content=" + operator_content
				+ "]";
	}
	
	
	
}
