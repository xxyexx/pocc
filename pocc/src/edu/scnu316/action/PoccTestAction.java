package edu.scnu316.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.scnu316.entity.LogData;
import edu.scnu316.entity.PoccFile;
import edu.scnu316.entity.User;
import edu.scnu316.service.PoccFileService;
import edu.scnu316.service.impl.PoccFileServiceImpl;
import edu.scnu316.service.impl.UserServiceImpl;
import edu.scnu316.util.LogUtil;

/**
 * @author liu
 *进入实验和保存实验（.pocc）的action
 */
public class PoccTestAction extends ActionSupport {
	HttpServletRequest request;
	private PoccFileService poccfileService;
	
	private File pocc; //上传的文件
    private String poccFileName; //文件名称
    private String poccContentType; //文件类型
    private User user;
    
    public PoccTestAction(){
    	request = ServletActionContext.getRequest();
    	poccfileService = new PoccFileServiceImpl();
		user = (User) request.getSession().getAttribute("User");//该用户的原信息
    }
    
    /**
     * 保存.pocc文件
     */
    public String save(){
		String realpath = ServletActionContext.getServletContext().getRealPath("/poccFile");
		if (pocc != null) {
			//新文件
			PoccFile poccfile = new PoccFile();
			poccfile.setUser_id(user.getUser_id());//user_id
			poccfile.setFile_name(poccFileName);//文件名称
			poccfile.setSave_time(new Timestamp(System.currentTimeMillis()));
			poccfile.setSave_url("poccFile/"+poccfile.getSave_time()+poccFileName);
			//保存新文件到硬盘,为了防止文件名重复，保存时间+文件名称
			File savefile = new File(new File(realpath),poccfile.getSave_time()+poccFileName);
			if (!savefile.getParentFile().exists())
                savefile.getParentFile().mkdirs();
            try {
				FileUtils.copyFile(pocc, savefile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            //保存文件信息到数据库
            poccfileService.savePoccFile(poccfile);
            
          //日志记录
			LogData logdata=new LogData("student",user.getUser_account(),user.getUsername(),user.getUnit_name(),new Timestamp(System.currentTimeMillis()),"上传实验文件");
			LogUtil.saveLog(logdata);
		}
    	return "show";
    }
    
    /**
     * 显示文件
     */
    public String show(){
    	List<PoccFile> poccList = poccfileService.getPoccList(user.getUser_id());
    	request.setAttribute("poccfilelist", poccList);  	
    	return SUCCESS;
    }
    
    //getter,setter
	public File getPocc() {
		return pocc;
	}

	public void setPocc(File pocc) {
		this.pocc = pocc;
	}

	public String getPoccFileName() {
		return poccFileName;
	}

	public void setPoccFileName(String poccFileName) {
		this.poccFileName = poccFileName;
	}

	public String getPoccContentType() {
		return poccContentType;
	}

	public void setPoccContentType(String poccContentType) {
		this.poccContentType = poccContentType;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
}
