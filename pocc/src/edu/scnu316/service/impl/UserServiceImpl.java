package edu.scnu316.service.impl;

import java.util.List;

import edu.scnu316.dao.UserDAO;
import edu.scnu316.entity.Role;
import edu.scnu316.entity.User;
import edu.scnu316.service.UserService;
import edu.scnu316.util.MD5Util;
import edu.scnu316.util.StringUtil;

public class UserServiceImpl implements UserService{

	@Override
	public boolean check(String prefix, int first, int number){
		
		if (first+number-1>9999){
			System.out.println("查询失败：账号越界");
			return false;
		}
		
		String account1 = prefix+StringUtil.toString4(first);
		String account2 = prefix+StringUtil.toString4(first+number-1);
		List<User> list = UserDAO.getInstance.queryByAccount(account1, account2);
		if (list == null){
			return true;
		}
		else return false;
		
	}

	@Override
	public boolean createUser(String prefix, int first, int number, User model){
		
		//检查用户账号
		if (model.getPassword()==null
				||model.getPassword().isEmpty()
				||model.getRent_end()==null){
			System.out.println("创建失败：用户模板不符合规范");
			return false;
		}
		
		//批量创建用户
		UserDAO ins = UserDAO.getInstance;
		if (check(prefix, first, number)){			
			for (int seq = first; seq<=first+number-1; seq++){
				User u = (User) model.clone();
				String account = prefix+StringUtil.toString4(seq);
				u.setUser_account(account);
				if (seq==first+number-1){
					ins.batchInsert(u, true);
				}else{
					ins.batchInsert(u, false);
				}
			}
		} else {
			System.out.println("创建失败：账号重复");
			return false;
		}
		return true;
	}

	


	@Override
	public boolean createUser(User model) {
		UserDAO ins = UserDAO.getInstance;
		User u = ins.queryByAccount(model.getUser_account());
		if (u != null){
			ins.insert(model);
			return true;
		}else return false;
	}

	@Override
	public List<User> userFilter(User model,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		
		return UserDAO.getInstance.queryByFilter(model, pageNo, pageSize);
	}
	
	


	@Override
	public boolean deleteUser(int user_id) {
		return UserDAO.getInstance.delete(user_id);
	}

	@Override
	public User getUserByID(int user_id) {
		
		if (user_id==0){
			User u = new User();
			//设置u属性
			return u;
		}
		
		return UserDAO.getInstance.queryByID(user_id);
	}
	
	
	@Override
	public User getUser(String user_account) {
		
		return UserDAO.getInstance.queryByAccount(user_account);
	}
	
	@Override
	public List<User> getUserBySchool(String schoolName) {
		
		return UserDAO.getInstance.queryBySchool(schoolName);
	}
	
	@Override
	public String CheckLogin(String user_account, String password) {
		User user = UserDAO.getInstance.queryByAccount(user_account);
		if(user==null){//找不到用户
			System.out.println("找不到用户");
			return "User_NotFound";
		}else if(MD5Util.md5Encode(password).equals(user.getPassword())){
			System.out.println("密码正确，登录成功");
			
			return "Login_success";
		}
		System.out.println("MD5:password"+MD5Util.md5Encode(password));
		System.out.println("password"+user.getPassword());
		
		return "Login_fall";
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		return UserDAO.getInstance.update(user);
	}

	@Override
	public int getNumByFilter(User model) {
		return UserDAO.getInstance.getNumByFilter(model);
		
	}
}




