package edu.scnu316.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.scnu316.entity.Course;
import edu.scnu316.entity.PoccFile;
import edu.scnu316.util.HibernateUtil;

/**
 * @author liu
 *实验文件DAO
 */
public class PoccFileDAO implements BaseDAO<PoccFile>{
	private static final Session sess = HibernateUtil.currentSession();
	public static PoccFileDAO getInstance = new PoccFileDAO();
	private static Transaction t = null;
	
	@Override
	public boolean insert(PoccFile poccFile) {//插入新文件
		if(poccFile!=null){
			t=sess.beginTransaction();
			sess.merge(poccFile);
			t.commit();
		}
		return true;
	}
	@Override
	public boolean update(PoccFile poccFile) {
		if(poccFile!=null){
			t=sess.beginTransaction();
			sess.merge(poccFile);
			t.commit();
		}
		return true;
	}
	@Override
	public boolean delete(int id) {
		PoccFile poccFile = queryByID(id);
		if(poccFile!=null){
			t=sess.beginTransaction();
			sess.delete(poccFile);
			t.commit();
		}
		return true;
	}
	/**
	 * 删除文件
	 */
	public boolean delete(PoccFile poccFile){
		if(poccFile==null){return false;}
		else{
			t=sess.beginTransaction();
			sess.delete(poccFile);
			t.commit();
		}
		return true;
	}
	@Override
	public PoccFile queryByID(int id) {
		PoccFile poccFile = (PoccFile) sess.get(PoccFile.class, id);
		return poccFile;
	}
	
	/**
	 * 根据User_id查询该用户的所有文件
	 */
	public List<PoccFile> queryList(int User_id) {
		t=sess.beginTransaction();
		Query query = sess.createQuery("select p from poccfile p where user_id = ?");
		query.setParameter(0, User_id);
		List <PoccFile> poccList = query.list();
		t.commit();
		sess.flush();
		sess.clear();
		return poccList;
	}
	
	@Override
	public List<PoccFile> queryAll() {
		t=sess.beginTransaction();
		Query query = sess.createQuery("from poccfile");
		List <PoccFile> poccList = query.list();
		t.commit();
		return poccList;
	}
	
}
