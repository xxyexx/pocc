package edu.scnu316.test;

import static org.junit.Assert.*;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.junit.Test;

import edu.scnu316.entity.LogData;
import edu.scnu316.util.LogUtil;

/**
 * @author liu
 *
 */
public class TestLogUtil {

	@Test
	public void test() {
		Timestamp ftime,ltime;
		Date date = new Date();
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00"); 
		ftime = Timestamp.valueOf(sdf.format(date));
		Calendar   calendar   =   new   GregorianCalendar(); 
		calendar.setTime(date); 
		calendar.add(calendar.DATE,1);//把日期往后增加一天.整数往后推,负数往前移动 
		date=calendar.getTime();   //这个时间就是日期往后推一天的结果 
		ltime = Timestamp.valueOf(sdf.format(date));
		List<LogData> LogList= LogUtil.getLogBetween("用户登录", ftime, ltime);
		System.out.println(LogList.size());
		for(int i=0;i<LogList.size();i++){
			System.out.println(LogList.get(i).getOperator_time());
		}
	}

}
