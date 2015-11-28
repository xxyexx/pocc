package edu.scnu316.test;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Test;

import edu.scnu316.entity.LogData;
import edu.scnu316.entity.Page;
import edu.scnu316.service.FlowService;
import edu.scnu316.service.LogService;
import edu.scnu316.service.impl.FlowServiceImpl;
import edu.scnu316.service.impl.LogServiceImpl;

public class TestFlowService {

	@Test
	public void test() {
		FlowService flowservice=new	FlowServiceImpl();
		List<String> flow_x=flowservice.getFlowX_coor(7);
		List<Integer> flow_y=flowservice.getFlowY_coor(7,null,true);
		for(int i=0;i<flow_x.size();i++){
			System.out.println(flow_x.get(i)+flow_y.get(i));
		}
	}
	
	@Test
	public void test2(){
		LogService LogServiceImpl = new LogServiceImpl();
		Page<LogData> page = LogServiceImpl.getLogPage(8, 10);
		for (LogData data : page.getList()) {
			System.out.println(data.getName());
		}
		System.out.println(page.getTotalPageNumber());
	}

}
