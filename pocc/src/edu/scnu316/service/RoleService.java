package edu.scnu316.service;

import java.util.List;

import edu.scnu316.entity.Role;

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

	List<Role> roleFilter(Role model);
}
