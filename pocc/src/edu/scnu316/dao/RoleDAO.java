package edu.scnu316.dao;


//import java.util.List;
//
//import org.hibernate.Query;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.scnu316.entity.Role;
import edu.scnu316.util.HibernateUtil;
/**
 * 管理员账号DAO
 * */
public class RoleDAO implements BaseDAO<Role> {
	
	private static final Role ADMIN = RoleDAO.getADMIN();

	private static final Session sess = HibernateUtil.currentSession();
	
	public static final RoleDAO getInstance = new RoleDAO();
	
	
	private static final Role getADMIN(){
		Role admin = new Role();
		admin.setPassword("21232f297a57a5a743894a0e4a801fc3");
		admin.setRole("ADMIN");
		admin.setRemark("默认管理员账号，无法被修改");
		admin.setUser_account("admin");
		return admin;
	}
	@Override
	public boolean insert(Role r){
		if ("admin".equals(r.getUser_account())){
			System.out.println("插入失败：无法修改系统管理员账号(admin)");
			return false;
		}
		Transaction tx = sess.beginTransaction();
		r.setPassword(r.getPassword().toLowerCase());
		sess.save(r);
		tx.commit();
		return true;
	}
	@Override
	public boolean update(Role r){
		if (r == null || "admin".equals(r.getUser_account())){
			System.out.println("更新失败：无法修改系统管理员账号(admin)");
			return false;
		}
		Transaction tx = sess.beginTransaction();
		r.setPassword(r.getPassword().toLowerCase());
		sess.update(r);
		tx.commit();
		return true;
	}
	
	public Role queryByAccount(String user_account){
		if ("admin".equals(user_account)){
			return RoleDAO.ADMIN;
		}
		String hql = "from role_inf where user_account='"+user_account+"'";
		Query query=sess.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Role> list=query.list();
		if (list.isEmpty()){
			System.out.println("查询失败：该账号不存在");
			return null;
		}
		else return list.get(0);
	}
	@Override
	public boolean delete(int id){
		
		Role r = this.queryByID(id);
		if (r != null){
			Transaction tx = sess.beginTransaction();
			sess.delete(r);
			tx.commit();
			return true;
		}else{
			System.out.println("删除失败:角色不存在");
			return false;
		}
	}
	

	@Override
	public Role queryByID(int id){
		Role u = (Role)sess.get(Role.class, id);
		if (u == null) System.out.println("该ID不存在");
		return u;
	}

	@Override
	public List<Role> queryAll() {
		String hql = "from role_inf";
		Query query = sess.createQuery(hql);    
	        @SuppressWarnings("unchecked")
			List<Role> list = query.list();
		return list;
	}
}
