package edu.scnu316.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.scnu316.entity.User;
import edu.scnu316.service.UserService;
import edu.scnu316.service.impl.UserServiceImpl;
import edu.scnu316.util.CityUtil;
import edu.scnu316.util.MD5Util;

/**
 * @author 路上一坨翔
 * 学生信息的修改
 * 学生用户中心的所有action
 */
public class UserCenterAction extends ActionSupport {
	HttpServletRequest request;
	private UserService userService;
	private String provinceName;
	private Map<Integer,String> cityMap;//ajax返回的城市列表
	private String Pwd;//旧密码
	private String oldPwdResult; //ajax返回旧密码对比结果
	public User user;
	
	private File image; //上传的文件
    private String imageFileName; //文件名称
    private String imageContentType; //文件类型
	/**
	 * 构造方法
	 */
	public UserCenterAction(){
		request = ServletActionContext.getRequest();
		userService = new UserServiceImpl();
		user = (User) request.getSession().getAttribute("User");//该用户的原信息
	}
	
	//跳转显示界面的action
	/**
	 * 显示用户信息
	 * 设置城市列表
	 */
	public String Show(){
		Map<Integer,String> provinceMap = CityUtil.getProvince_all();
		request.setAttribute("ProvinceMap", provinceMap);
		return "UserCenter.jsp";
	}
	/**
	 * 显示用户头像页面
	 */
	public String Pic(){
		return "UserCenterPic.jsp";
	}
	/**
	 * 显示用户密码修改界面
	 */
	public String Pwd(){
		return "UserCenterPwd.jsp";
	}
	
	//修改信息的action
	/**
	 * 修改用户中心的用户信息
	 */
	public String ChangeMessage(){
		userService.updateUser(user);
		System.out.println(user.getUsername()+"修改个人信息成功");
		return "ChangeUserMess";
	}
	/**
	 * 修改用户头像
	 */
	public String ChangePic(){
		String realpath = ServletActionContext.getServletContext().getRealPath("/image/userPic");
		//D:/apache-tomcat-6.0.18/webapps/pocc/image/userPic
		if (image != null) {//先删除旧头像
			File f = new File(ServletActionContext.getServletContext().getRealPath("/")+user.getIcon_url());
			if(f.exists())
			f.delete();
			//再写入新头像,为了防止名字重复，账户+图片名称
			File savefile = new File(new File(realpath), user.getUser_account()+imageFileName);
			if (!savefile.getParentFile().exists())
                savefile.getParentFile().mkdirs();
            try {
				FileUtils.copyFile(image, savefile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            user.setIcon_url("image/userPic/"+user.getUser_account()+imageFileName);
            userService.updateUser(user);//更新数据库头像url
            System.out.println(user.getUsername()+"修改头像成功");
		}    
		return "ChangePic";
	}
	/**
	 * 检验旧密码的ajax
	 */
	public String CheckPwd(){
		if(user.getPassword().equals(MD5Util.md5Encode(Pwd))){
			oldPwdResult = "pwdCorrect";//密码正确
		}else{
			oldPwdResult = "pwdWrong";//密码错误
		}
		
		return "CheckPwd";
	}
	/**
	 * 修改密码
	 */
	public String ChangePwd(){
		userService.updateUser(user);//更新密码
		return "ChangePwd";
	}
	
	/**
	 * Ajax传入provinceName改变City列表
	 */
	public String ChangeCity(){
		cityMap = CityUtil.getCity_all(provinceName);
		return "ChangeCityAjax";
	}
	
	
	//getters,setters
	
	public Map<Integer, String> getCityMap() {
		return cityMap;
	}
	public void setCityMap(Map<Integer, String> cityMap) {
		this.cityMap = cityMap;
	}	
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	public String getOldPwdResult() {
		return oldPwdResult;
	}
	public void setOldPwdResult(String oldPwdResult) {
		this.oldPwdResult = oldPwdResult;
	}
	public String getPwd() {
		return Pwd;
	}
	public void setPwd(String pwd) {
		Pwd = pwd;
	}
	
	
}
