package edu.scnu316.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import edu.scnu316.entity.Role;

public class AdminInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String result=null;
		if(ServletActionContext.getRequest().getSession().getAttribute("Role")!=null){//已登录
			if(((Role) ServletActionContext.getRequest().getSession().getAttribute("Role")).getRole().equals("ADMIN")){
				result = invocation.invoke(); //执行Action的exceute等方法 
			}else{//不是系统管理员
				System.out.println("不是系统管理员,被拦截");
				result = "NoPermission";
			}
		}else{//未登录
			System.out.println("未登录,被拦截");
			result=Action.LOGIN;
		}
		return result;
	}

}
