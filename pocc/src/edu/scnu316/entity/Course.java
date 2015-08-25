package edu.scnu316.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * 课程信息表
 * 本类展示不提供修改课程信息操作，若需要修改课程信息，要直接操作数据库
 * id 对应课程顺序，即 第一课程id=1，第二课程id=2
 * @author 小叶浪浪浪
 *
 */
@Entity(name="course_inf")
public class Course {

	@Id @Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String course_no;
	private String course_name;
	private String course_require;
	
	public int getId() {
		return id;
	}
	public String getCourse_no() {
		return course_no;
	}
	public String getCourse_name() {
		return course_name;
	}
	public String getCourse_require() {
		return course_require;
	}
	
	
	
}
