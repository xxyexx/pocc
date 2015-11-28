package edu.scnu316.interceptor;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import edu.scnu316.entity.User;

/**
 * @author liu
 *1.学生登录拦截器
 *2.记录正在实验的学生
 */
public class UserInterceptor extends AbstractInterceptor {
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String result=null;
//		System.out.println("request:"+ServletActionContext.getRequest().getParameter("user_id"));
		if(ServletActionContext.getRequest().getSession().getAttribute("User")!=null){//已登录
			User user = (User) ServletActionContext.getRequest().getSession().getAttribute("User");
			// 获取请求的action名称  
	        String actionName = invocation.getInvocationContext().getName();  
			
	        System.out.println("actionName="+actionName);
			if(actionName.equals("beginTest")||actionName.equals("showPoccFile")){//正在实验
				System.out.println("正在实验");
				if(ServletActionContext.getRequest().getSession().getAttribute("testingStudentList")==null){//空
					List<Integer> studentList = new ArrayList<Integer>();
		    		studentList.add(user.getUser_id());
		    		ServletActionContext.getRequest().getSession().setAttribute("testingStudentList", studentList);
				}else{//加入实验列表
					List<Integer> studentList = (List<Integer>) ServletActionContext.getRequest().getSession().getAttribute("testingStudentList");
					if(studentList.contains(user.getUser_id())){//已存在
					}else{//不存在
						studentList.add(user.getUser_id());
					}
				}
			}else{//不在实验
				if(ServletActionContext.getRequest().getSession().getAttribute("testingStudentList")!=null){//空
					List<Integer> studentList = (List<Integer>) ServletActionContext.getRequest().getSession().getAttribute("testingStudentList");
					if(studentList.contains(user.getUser_id())){//存在
						studentList.remove(new Integer(user.getUser_id()));
					}
				}
			}
			result = invocation.invoke(); //执行Action的exceute等方法 
		}else{//未登录
			result=Action.LOGIN;
		}
		return result;
	}

}
