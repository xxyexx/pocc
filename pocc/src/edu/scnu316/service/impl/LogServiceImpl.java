package edu.scnu316.service.impl;

import edu.scnu316.entity.LogData;
import edu.scnu316.entity.Page;
import edu.scnu316.service.LogService;
import edu.scnu316.util.LogUtil;

public class LogServiceImpl implements  LogService {

	@Override
	public Page<LogData> getLogPage(int pageNo, int pageSize) {
		Page<LogData> page = new Page<LogData>(pageNo);
		page.setTotalItemNumber(LogUtil.gettotalNumber());
		page.setList(LogUtil.getLogPage((pageNo - 1)*pageSize, pageSize));
		return page;
	}
	
	
}
