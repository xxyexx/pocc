package edu.scnu316.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.scnu316.entity.User;
import edu.scnu316.service.UserService;
import edu.scnu316.service.impl.UserServiceImpl;

/**
 * @author liu
 *在线实验人数统计的action
 */
public class TestingListAction extends ActionSupport {
	private UserService userService;	
	private HttpServletRequest request; 
	
	public TestingListAction(){
		this.userService = new UserServiceImpl();
		this.request = ServletActionContext.getRequest();
	}
	
	/**
	 * 显示在线实验用户列表
	 */
	public String show(){
		List<User> studentList = new ArrayList<User>();
		if(request.getSession().getAttribute("testingStudentList")!=null){
			List <Integer> user_idlist = (List<Integer>) request.getSession().getAttribute("testingStudentList");
			for(int i=0;i<user_idlist.size();i++){
				User user = userService.getUserByID(user_idlist.get(i));
				studentList.add(user);
			}
		}else{
			System.out.println("testingStudentList为空");
		}
		request.setAttribute("studentList", studentList);
		return "show";
	}
}
