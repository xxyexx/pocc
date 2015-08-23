package edu.scnu316.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * 校外单位
 */
@Entity(name="unit_inf")
public class Unit {

	@Id @Column(name="unit_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int unit_id;
	private String unit_name;
	private String linkman;
	private String phone;
	private String email;
	private String remark;
	
	public Unit(){
		
		//默认属性
		unit_id = 0;
	}
	
	public int getUnit_id() {
		return unit_id;
	}
//	public void setUnit_id(int unit_id) {
//		this.unit_id = unit_id;
//	}
	public String getUnit_name() {
		return unit_name;
	}
	public void setUnit_name(String unit_name) {
		this.unit_name = unit_name;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
