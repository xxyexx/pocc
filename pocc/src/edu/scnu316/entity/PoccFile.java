package edu.scnu316.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import edu.scnu316.util.StringUtil;

/**
 * @author liu
 *实验文件类
 */
@Entity(name="poccfile")
public class PoccFile {
	@Id @Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private int user_id;
	private String file_name;
	private String save_url;
	private Timestamp save_time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getSave_url() {
		return save_url;
	}
	public void setSave_url(String save_url) {
		this.save_url = save_url;
	}
	public String getSave_time() {
		return StringUtil.TimestampToString(save_time, "yyyy-MM-dd hh-mm-ss");
	}
	public void setSave_time(Timestamp save_time) {
		this.save_time = save_time;
	}
	@Override
	public String toString() {
		return "PoccFile [id=" + id + ", user_id=" + user_id + ", file_name="
				+ file_name + ", save_url=" + save_url + ", save_time="
				+ save_time + "]";
	}
}	
