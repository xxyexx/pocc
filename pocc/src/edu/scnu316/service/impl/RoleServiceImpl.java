package edu.scnu316.service.impl;

import java.util.List;

import edu.scnu316.dao.RoleDAO;
import edu.scnu316.entity.Role;
import edu.scnu316.entity.User;
import edu.scnu316.service.RoleService;
import edu.scnu316.util.MD5Util;

/**
 * 
 * @author liu
 * 管理员Service实现类
 */
public class RoleServiceImpl implements RoleService{
	private RoleDAO Roledao;//管理员DAO
	
	public RoleServiceImpl(){
		Roledao = RoleDAO.getInstance;
	}
	@Override
	public String CheckLogin(String user_account, String password) {
		Role role = Roledao.queryByAccount(user_account);
		if(role==null){//找不到用户
			System.out.println("找不到用户");
			return "User_NotFound";
		}else if(MD5Util.md5Encode(password).equals(role.getPassword())){
			System.out.println("密码正确，登录成功");
			
			return "Login_success";
		}
		System.out.println("MD5:password"+MD5Util.md5Encode(password));
		System.out.println("password"+role.getPassword());
		
		return "Login_fall";
	}

	@Override
	public List<Role> getRoleList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Role getRole(int role_id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Role getRole(String user_account) {
		Role role = Roledao.queryByAccount(user_account);
		return role;
	}
	@Override
	public List<Role> roleFilter(Role model) {
		// TODO Auto-generated method stub
		return RoleDAO.getInstance.queryAll(); 
	}

}
