package edu.scnu316.dao;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.scnu316.entity.Unit;
import edu.scnu316.util.HibernateUtil;

/**
 *  校外单位DAO
*/
public class UnitDAO implements BaseDAO<Unit>{

	private static final Session sess = HibernateUtil.currentSession();
	
	public static UnitDAO getInstance = new UnitDAO();
	
	@Override
	public boolean insert(Unit unit){
		Transaction tx = sess.beginTransaction();
		sess.save(unit);
		tx.commit();
		return true;
	}
	@Override
	public boolean update(Unit u){
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
		Transaction tx = sess.beginTransaction();
		Unit u = this.queryByID(id);
		if (u != null){
			sess.delete(u);
			tx.commit();
			return true;
		}else{
			System.out.println("删除失败");
			return false;
		}
	}
	

	@Override
	public Unit queryByID(int id){
		Unit u = (Unit)sess.get(Unit.class, id);
		if (u == null) System.out.println("该ID不存在");
		return u;
		
	}

	@Override
	public List<Unit> queryAll() {
		String hql = "from unit_inf";
		Query query = sess.createQuery(hql);    
	        @SuppressWarnings("unchecked")
			List<Unit> list = query.list();
		return list;
	}
}
