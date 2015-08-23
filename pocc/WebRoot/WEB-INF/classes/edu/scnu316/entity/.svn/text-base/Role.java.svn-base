package edu.scnu316.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 管理员账号
 */
@Entity(name="role_inf")
public class Role {

	@Id @Column(name="role_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int role_id;
	private String user_account;
	private String password;
	private String role;  //普通管理员：MANAGER 或 系统管理员：ADMIN
	private String remark;
	
	public Role(){
		//默认初始值为0
		role_id = 0;  
	}
	
	public int getRole_id() {
		return role_id;
	}
//	public void setRole_id(int role_id) {
//		this.role_id = role_id;
//	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		if ("MANAGER".equals(role.toUpperCase())){
			role = "MANAGER";
		}else if ("ADMIN".equals(role.toUpperCase())){
			role = "ADMIN";
		}else{
			System.out.println("设置权限出错：管理员权限必须为：\"MANAGER\"或\"ADMIN\"");
			role = "MANAGER";
		}
		
		this.role = role;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	
	
	
}
