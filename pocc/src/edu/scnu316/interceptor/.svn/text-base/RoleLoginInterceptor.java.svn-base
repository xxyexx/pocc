package edu.scnu316.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class RoleLoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String result=null;
		if(ServletActionContext.getRequest().getSession().getAttribute("Role")!=null){//已登录
			return invocation.invoke(); //执行Action的exceute等方法 
		}else{//未登录
			System.out.println("未登录,被拦截");
			result=Action.LOGIN;
		}
		return result;
	}

}
