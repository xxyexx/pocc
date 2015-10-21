package edu.scnu316.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


import edu.scnu316.entity.User;
import edu.scnu316.util.HibernateUtil;

/**
 * 实验用户DAO
 * */
public class UserDAO implements BaseDAO<User>{

	private static final Session sess = HibernateUtil.currentSession();
	
	public static UserDAO getInstance = new UserDAO();
	
	private static Transaction t = null;
	
	@Override
	public boolean insert(User u){
		User test = this.queryByAccount(u.getUser_account());
		if (test == null){
		Transaction tx = sess.beginTransaction();
		sess.save(u);
		tx.commit();
		return true;
		}else{
			System.out.println("插入失败：该账号已存在");
			return false;
		}
	}
	
	//批量插入学生，当last==true时提交事务
	public void batchInsert(User u,boolean last){
		if (t==null) t = sess.beginTransaction();
		sess.save(u);
		if (last) {
			t.commit();
			t = null;
		}
	}
	
	@Override
	public boolean update(User u){
		if (u==null){
			System.out.println("更新失败：该用户不存在");
			return false;
		}
		Transaction tx = sess.beginTransaction();
		sess.update(u);
		tx.commit();
		return true;
	}
	
	@Override
	public boolean delete(int id){
		User u = this.queryByID(id);
		if (u != null){
			Transaction tx = sess.beginTransaction();
			sess.delete(u);
			tx.commit();
			return true;
		}else{
			System.out.println("删除失败：该账号不存在");
			return false;
		}
	}
	
	
//	/**
//	 * 通过账号前缀查找用户
//	 * @param prefix 前缀
//	 * @return 该账号前缀下所有用户
//	 */
//	public List<User> queryByPrefix1(String prefix){
//		String h1 = "'"+prefix+"____'";
//		String hql = "from user_inf where user_account like "+h1;
////		System.out.println(h1);
//		Query query = sess.createQuery(hql);
//		@SuppressWarnings("unchecked")
//		List<User> list = query.list();
//		if (list.isEmpty()) list = null;
//		return list;
//	}
	
	/**
	 * 通过账号查找用户
	 * @param user_account
	 * @return 该账号的用户
	 */
	public User queryByAccount(String user_account){
		String hql = "from user_inf where user_account='"+user_account+"'";
		Query query=sess.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<User> list=query.list();
		if (list.isEmpty()){
			System.out.println("查询失败：该账号不存在");
			return null;
		}
		else return list.get(0);
	}
	
	/**
	 * 查找同一前缀两个账号中的所有账号
	 * @param account1
	 * @param account2
	 * @return
	 */
	public List<User> queryByAccount(String account1, String account2){
		String prefix = account1.substring(0, account1.length()-4);
		if (!account2.startsWith(prefix)){
			System.out.println("查询失败：两个账号不是同一前缀");
			return null;
		}
		int a = Integer.parseInt(account1.substring(prefix.length()));
		int b = Integer.parseInt(account2.substring(prefix.length()));
		String h1 = "'"+prefix+"____'";
		String hql = "from user_inf ui where user_account like "+h1
				+" and seq >="+a+" and seq <="+b;
//		System.out.println(hql);
		Query query = sess.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<User> list = query.list();
		if (list.isEmpty()) list = null;
		return list;
		
	}
	
	@Override
	public User queryByID(int id){
		User u = (User)sess.get(User.class, id);
		if (u == null) System.out.println("查询失败：该ID不存在");
		return u;
		
	}

	@Override
	public List<User> queryAll() {
		String hql = "from user_inf";
		Query query = sess.createQuery(hql);    
	        @SuppressWarnings("unchecked")
			List<User> users = query.list();
		return users;
	}
	

	
	public List<User> queryByFilter(User user, int pageNo, int pageSize){
		//用户过滤功能待完成
		String hql = "from user_inf";
		Query query = sess.createQuery(hql);    
	    query.setFirstResult((pageNo-1)*pageSize);
	    query.setMaxResults(pageSize);
	    @SuppressWarnings("unchecked")
		List<User> users = query.list();
		return users;
	}
	
	public int getNumByFilter(User user){
		
		String hql = "select count(1) from user_inf";
		Query query = sess.createQuery(hql);
	    return  ((Number)(query.iterate().next())).intValue();
	}

}
