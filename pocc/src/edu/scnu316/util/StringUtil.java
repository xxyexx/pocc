package edu.scnu316.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * @author 小叶浪浪浪
 *
 */
public class StringUtil {

	/**输入0~9999的整数，输出该整数用"0"填充后长度为4的字符串<p>
	 * Example:
	 * <blockqueto><pre>
	 * StringUtil.toString4(5) returns "0005"
	 * StringUtil.toString4(6580) returns "6580"
	 * </pre><blockqueto>
	 * @param i 输入整数
	 * @return 输出字符串
	 */
	public static String toString4(int i){
		
		if (i<0||i>9999){
			System.out.println("转换失败：请保证输入的数在[0-9999]间");
			return null;
		}
		StringBuffer sf = new StringBuffer();
		sf.append(i);
		while (sf.length()<4){
			sf.insert(0, '0');
		}
		return sf.toString();
		
	}
	
	/**
	 * 时间格式转换器，把Timestamp类型的日期转换为String类型<p>
	 * 本方法为 @小叶浪浪浪 所有，未见允许，其他人不得使用<p>
	 * Example:
	 * <blockqueto><pre>
	 * 输入：TimestampToString((Timestamp)Object,"yyyy-MM-dd");<br>
	 * 输出：2015-08-09<p>
	 * 输入：TimestampToString((Timestamp)Object,"yyyy/MM/dd hh:mm:ss");<br>
	 * 输出：2015/08/09 15:06:26
	 * </pre></blockqueto>
	 * @param time 时间
	 * @param formate 格式
	 * @return 格式化后的字符串
	 */
	public static String TimestampToString(Timestamp time, String formate){
		if (time==null) return "";
		SimpleDateFormat f = new SimpleDateFormat(formate);
		return f.format(time);
	}
	
	/**
	 * 时间格式转换器，把String类型的日期转换为Timestamp类型
	 * 输入：符合"yyyy-MM-dd"或"yyyy/MM/dd"字符串
	 * 输出：年月日为输入时间，时分秒为零的Timestamp对象
	 * @param time 输入时间，符合 "yyyy-MM-dd"或"yyyy/MM/dd"
	 * @return Timestamp对象
	 */
	public static Timestamp StringTOTimestamp(String time){
		String[] s = null;
		if (time.contains("-")){
			s = time.split("-");
		}else if(time.contains("/")){
			s = time.split("/");
		}else {
			System.out.println("转换日期失败：字符串格式错误");
			return null;
		}
		int year = Integer.parseInt(s[0]);
		int month = Integer.parseInt(s[1])-1;
		int date = Integer.parseInt(s[2]);
		Calendar c = Calendar.getInstance();
		c.set(year, month, date, 0, 0, 0);
		Timestamp t = new Timestamp(c.getTimeInMillis());
		return t;
		
	}
	
}




















