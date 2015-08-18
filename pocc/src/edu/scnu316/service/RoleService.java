package edu.scnu316.service;

import java.util.List;

import edu.scnu316.entity.Role;
import edu.scnu316.entity.User;

/**
 * @author 路上一坨翔
 * 管理员Service接口
 */

public interface RoleService {
	
	/**
	 * 管理员登录验证
	 * @param userName
	 * @param password
	 * @return 返回验证结果:
	 * User_NotFound(找不到用户)
	 * Login_success(登录成功)
	 * Login_fall(密码错误，登录失败)
	 */
	public abstract String CheckLogin(String user_account,String password);
	
	/**
	 * 获取管理员列表
	 * @return
	 */
	public abstract List<Role> getRoleList();
	/**
	 * 通过管理员id获取一个管理员
	 * @param role_id
	 * @return
	 */
	public abstract Role getRole(int role_id);
	/**
	 * 通过管理员账号获取一个管理员
	 * @param user_account
	 * @return
	 */
	public abstract Role getRole(String user_account);
	
	
	/**
	 * 根据筛选条件返回符合条件的用户<br>
	 * 返回用户符合以下条件：（当模板属性不为空时）
	 * <blockquote><pre>
	 * 1、管理员账号以模板账号为开头；<br>
	 * </pre></blockquote>
	 * @param model	管理员模板
	 * @return 符合条件的管理员列表
	 */
	public List<Role> roleFilter(Role model);
}
