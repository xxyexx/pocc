package edu.scnu316.test;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.scnu316.util.CityUtil;
import edu.scnu316.util.HibernateUtil;
import edu.scnu316.dao.RoleDAO;
import edu.scnu316.dao.UnitDAO;
import edu.scnu316.dao.UserDAO;
import edu.scnu316.entity.*;

public class HibernateTest {

//	private static Session sess = HibernateUtil.currentSession();
	
	public static void main(String args[]){
		
//		new HibernateTest().UnitTest();
		new HibernateTest().UserTest();
//		new HibernateTest().RoleTest();
//		new HibernateTest().CityTest();
	}
	private void UserTest(){
		User u = UserDAO.getInstance.queryByID(1);
//		u.setUsername("小白");
		System.out.println(u.getUsername()); 
		System.out.println(u.getCity_name());
		System.out.println(u.getProvince_name());
		System.out.println(u.getRemark());
//		UserDAO.getInstance.update(u);
		

//		User u = new User();
//		u.setLast_ip("192.168.1.1");
//		u.setPrice(0);
//		u.setUser_account("scnu1230500");
//		u.setUsername("莫晓平1");
//		u.setSave_url("save_url1");
//		u.setPassword("123456");
//		UserDAO.getInstance.insert(u);
		
		
		
//		sess.update(u);
//		System.out.println(u.getUnit_id());
		
//		List<User> list = UserDAO.getInstance.queryByPrefix("scnu123");
		
//		List<User> list = UserDAO.getInstance.queryByAccount("scnu1230000", "scnu1230010");
//		for (User u:list){
//			System.out.println(u.getUser_account());
//		}
	}
	
	private void UnitTest(){
//		Unit u = new Unit();
//		u.setUnit_name("华东师范大学");
//		u.setLinkman("刘鸣");
//		UnitDAO.getInstance.insert(u);
		
//		UnitDAO.getInstance.delete(2);
		
//		Unit u = UnitDAO.getInstance.queryByID(3);
//		u.setEmail("liuming@scnu.edu.cn");
//		UnitDAO.getInstance.update(u);
		
	}
	
	private void RoleTest(){
////		增加
//		Role role = new Role();
//		role.setUser_account("ff1050");
//		role.setPassword("dfdf5555");
//		role.setRole("manager");
//		RoleDAO.getInstance.insert(role);
		
//		删除
//		RoleDAO.getInstance.delete(2);
		
//		查询
		Role r = RoleDAO.getInstance.queryByID(5);
		System.out.println(r.getUser_account());
		
//		修改
//		Role r = RoleDAO.getInstance.queryByID(1);
//		r.setRole("admin");
//		RoleDAO.getInstance.update(r);
	}
	
	private void CityTest(){
//		String s = CityUtil.getCity_name(200);
//		String s = CityUtil.getProvince_name(304);
//		System.out.println(s);
		
//		List<String> list = CityUtil.getCity_all("广东省");
//		for (String i : list){
//			System.out.println(i);
//		}
		
		int s =CityUtil.getCity_id("广州市");
		System.out.println(s);
	}
	

}
