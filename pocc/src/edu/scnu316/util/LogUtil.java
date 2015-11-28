package edu.scnu316.util;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import edu.scnu316.entity.LogData;

public class LogUtil {
	private static final Session sess = HibernateUtil.currentSession();
	private static Transaction t = null;
	public final static String OPER_LOGIN = "用户登录";
	public final static String ALLSCHOOL = "全部";
	public final static String FREEUSER = "临时用户";
	/**
	 * 保存日志到数据库
	 */
	public static boolean saveLog(LogData logdata){
		if(logdata!=null){
			t=sess.beginTransaction();
			sess.save(logdata);
			t.commit();
		}
		return true;
	}
	
	/**
	 * @param FirstResult 起始位置
	 * @param pageSize	显示条数
	 * @return	日志list
	 */
	public static List<LogData> getLogPage(int FirstResult,int pageSize){
		Query query = sess.createQuery("from log_inf");
		query.setFirstResult(FirstResult);
		query.setMaxResults(pageSize);
		List<LogData> logList = query.list();
		sess.flush();
		sess.clear();
		return logList;
	}
	
	/**
	 * 返回总记录数
	 */
	public static long gettotalNumber(){
		Query query = sess.createQuery("from log_inf");
		long count = (long)query.list().size();
		sess.flush();
		sess.clear();
		return count;
	}
	/**
	 * 获取全部记录
	 */
	public static List<LogData> getLogDataAll(){
		Query query = sess.createQuery("from log_inf");
		List<LogData> logList = query.list();
		sess.flush();
		sess.clear();
		return logList;
	}
	
	/**
	 * 传入每天起始时间和结束时间，返回这天登录的人数（重复不计）
	 */
	public static List<LogData> getLogBetween(String Oper_content,Timestamp ftime,Timestamp ltime){
		String sql="from log_inf WHERE operator_content =? AND operator_time > ? AND operator_time < ? GROUP BY(account)";
		Query query = sess.createQuery(sql);
		query.setParameter(0, Oper_content);
		query.setParameter(1, ftime);
		query.setParameter(2, ltime);
		List<LogData> logList = query.list();
		sess.flush();
		sess.clear();
		return logList;
	}
	/**
	 * 传入每天起始时间和结束时间，返回这天登录的人数（重复不计）
	 */
	public static List<LogData> getLogBetween(String Oper_content,Timestamp ftime,Timestamp ltime,String schoolName){
		String sql="from log_inf WHERE operator_content =? AND operator_time > ? AND operator_time < ? AND school =? GROUP BY(account)";
		Query query = sess.createQuery(sql);
		query.setParameter(0, Oper_content);
		query.setParameter(1, ftime);
		query.setParameter(2, ltime);
		query.setParameter(3, schoolName);
		List<LogData> logList = query.list();
		sess.flush();
		sess.clear();
		return logList;
	}

}
