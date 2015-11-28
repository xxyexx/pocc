package edu.scnu316.service;

import edu.scnu316.entity.LogData;
import edu.scnu316.entity.Page;

public interface LogService {
	/**
	 * 获取当前日志分页
	 */
	public abstract Page<LogData> getLogPage(int pageNo,int pageSize);
}
