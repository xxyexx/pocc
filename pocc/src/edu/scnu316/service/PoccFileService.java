package edu.scnu316.service;

import java.util.List;

import edu.scnu316.entity.PoccFile;

/**
 * @author liu
 *
 */
public interface PoccFileService {
	/**
	 * 根据user_id获取该用户所有的文件
	 */
	public abstract List<PoccFile> getPoccList(int user_id);
	/**
	 * 保存文件
	 */
	public abstract boolean savePoccFile(PoccFile poccfile);
	
}
