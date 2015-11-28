package edu.scnu316.service;

import java.util.List;
import java.util.Map;

import edu.scnu316.entity.LogData;

/**
 * @author liu
 *流量统计
 */
public interface FlowService {
	/**
	 * 输入时间范围,返回流量统计横坐标（时间|日期）
	 */
	public abstract List<String> getFlowX_coor(int timeRange);
	/**
	 * 输入时间范围，返回流量统计纵坐标（人数）isfree:是否为临时用户。
	 */
	public abstract List<Integer> getFlowY_coor(int timeRange,String schoolName,boolean isfree);
}
