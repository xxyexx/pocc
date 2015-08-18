package edu.scnu316.util;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

/**
 * 城市工具类，包含所有id-城市-省份的转换方法
 * 
 * @author 小叶浪浪浪
 *	
 */
public class CityUtil {
	
	private static final Session sess = HibernateUtil.currentSession();
	private static String sql;
	
	/**
	 * 通过城市名获得城市id
	 * @param city_name 城市名，如 "广州市"
	 * @return 城市id
	 */
	public static int getCity_id(String city_name){
		sql = "select id from city where city='"+city_name+"'";		
		int res = Integer.parseInt(sess.createSQLQuery(sql).list().get(0).toString());
		return res;		
	}
	
	/**
	 * 通过城市id获得城市名
	 * @param city_id 城市id
	 * @return 城市名：如   "广州市" "怀化市"
	 */
	public static String getCity_name(int city_id){
		sql = "select city from city where id="+city_id;
		return (String) sess.createSQLQuery(sql).list().get(0);
	}
	
	/**
	 * 通过城市id获得省份名
	 * @param city_id 城市id
	 * @return 省份名：如   "广东省" "湖南省"
	 */
	public static String getProvince_name(int city_id){
		sql = "select p.province from city c,province p where c.id="+city_id+" and c.province_id=p.id;";
		return (String) sess.createSQLQuery(sql).list().get(0);
	}
	
	/**
	 * 通过省份名获得该省所有城市名
	 * @param province_name 省名，如  "广东省"
	 * @return	该省对应的所有城市名
	 */
	public static List<String> getCity_all(String province_name){
		List<String> list = new ArrayList<String>();
		list.clear();
		String sql1 = "select p.id from province p where p.province='"+province_name+"'";
		String pid = String.valueOf(sess.createSQLQuery(sql1).list().get(0));
//		System.out.println(pid);
		String sql2 = "SELECT city FROM city where province_id="+pid;
		list = (List<String>) sess.createSQLQuery(sql2).list();
		return list;
	}
	
	/**
	 * 返回所有国内所有省份
	 * @return 国内所有省份名
	 */
	public static List<String> getProvince_all(){
		List<String> list = new ArrayList<String>();
		list.clear();
		sql = "select p.province from province p";
		list = (List<String>) sess.createSQLQuery(sql).list();
		return list;
	}
}













