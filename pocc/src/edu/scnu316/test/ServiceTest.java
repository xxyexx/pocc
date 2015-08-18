package edu.scnu316.test;

import java.sql.Timestamp;

import edu.scnu316.dao.UserDAO;
import edu.scnu316.entity.User;
import edu.scnu316.service.UserService;
import edu.scnu316.service.impl.UserServiceImpl;

public class ServiceTest {
	
	private static UserService cus = new UserServiceImpl();

	public void CreateUserServiceTest(){
		
//		boolean b = cus.check("scnu123", 90, 11);
//		System.out.println(b);
		
		User u = new User();
		u.setPassword("123");
		u.setRent_end(new Timestamp(System.currentTimeMillis()));
		u.setPrice(50);
		boolean b = cus.createUser("scau1234", 5, 10, u);
//		UserDAO.getInstance.insert(u);
		
	}

	public static void main(String[] args){
		new ServiceTest().CreateUserServiceTest();
	}
}
