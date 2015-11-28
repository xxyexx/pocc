package edu.scnu316.service.impl;

import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import edu.scnu316.dao.PoccFileDAO;
import edu.scnu316.entity.PoccFile;
import edu.scnu316.service.PoccFileService;
/**
 * @author liu
 *实验文件Service
 */
public class PoccFileServiceImpl implements PoccFileService{
	private PoccFileDAO poccfiledao;
	public PoccFileServiceImpl(){
		poccfiledao = PoccFileDAO.getInstance;
	}
	
	@Override
	public List<PoccFile> getPoccList(int user_id) {
		System.out.println("getPoccList()");
		List<PoccFile> poccList = poccfiledao.queryList(user_id);
		return poccList;
	}

	@Override
	public boolean savePoccFile(PoccFile poccfile) {
		String realpath = ServletActionContext.getServletContext().getRealPath("/poccFile");
		List<PoccFile> poccList = poccfiledao.queryList(poccfile.getUser_id());
		if(poccList.size()<5||poccList==null){//限制5个文件
			poccfiledao.insert(poccfile);
		}else{//删除最早的一个
			PoccFile oldpoccfile = poccList.get(0);
			//从磁盘中删除
			File f = new File(ServletActionContext.getServletContext().getRealPath("/")+oldpoccfile.getSave_url());
			if(f.exists())
			f.delete();
			//删除数据库记录
			poccfiledao.delete(oldpoccfile);
			//保存新文件
			poccfiledao.insert(poccfile);
		}
		return true;
	}

}
