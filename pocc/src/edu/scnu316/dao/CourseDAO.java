package edu.scnu316.dao;

import java.util.List;

import org.hibernate.Session;

import edu.scnu316.entity.Course;
import edu.scnu316.entity.Role;
import edu.scnu316.util.HibernateUtil;

/**
 * 课程DAO
 * */
public class CourseDAO implements BaseDAO<Course> {

	private static final Session sess = HibernateUtil.currentSession();
	
	public static final CourseDAO getInstance = new CourseDAO();
	
	@Override
	public boolean insert(Course t) {
		// TODO Auto-generated method stub
		System.out.println("方法未实现");
		return false;
	}

	@Override
	public boolean update(Course t) {
		// TODO Auto-generated method stub
		System.out.println("方法未实现");
		return false;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		System.out.println("方法未实现");
		return false;
	}

	@Override
	public Course queryByID(int id) {
		// TODO Auto-generated method stub
		Course c = (Course) sess.get(Course.class, id);
		return c;
	}

	@Override
	public List<Course> queryAll() {
		// TODO Auto-generated method stub
		System.out.println("方法未实现");
		return null;
	}

}
