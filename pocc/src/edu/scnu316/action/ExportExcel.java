package edu.scnu316.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.scnu316.entity.User;
import edu.scnu316.service.UserService;
import edu.scnu316.service.impl.UserServiceImpl;

/**
 * 
 * @author liu
 * 用户列表导出Excel表
 */
public class ExportExcel extends ActionSupport {
	
	private String fileName;
	private String schoolName;
	
	private UserService userService;	
	private HttpServletRequest request; 
	
	public ExportExcel(){
		this.userService = new UserServiceImpl();
		this.request = ServletActionContext.getRequest();
	}
	
	public String exportExcel(){
        String name ="学生列表.xls";
        try {
        	fileName = java.net.URLEncoder.encode(name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("字符转码失败");
		}
        return SUCCESS;
	}
	
	@SuppressWarnings("deprecation")
	public InputStream getExcelFile()//getExcelFile()一定要与excelFile对应，否则会出现异常
    {
           //第一步：查询学生列表信息
		   schoolName = (String) request.getSession().getAttribute("schoolvalue");
		   //1)获取该学校的学生列表
           List<User> userList = new ArrayList<User>();
           userList=userService.getUserBySchool(schoolName);

           //第二步：构建excel表格,封装数据到excel                    
           HSSFWorkbook workbook = new HSSFWorkbook();
           HSSFSheet sheet = workbook.createSheet("sheet1");

           HSSFRow row = sheet.createRow(0);//创建第一行
           HSSFCell cell = row.createCell(0);//第一列
           if(schoolName.equals("不限")){
        	   cell.setCellValue("学生列表");
           }else{
        	   cell.setCellValue(schoolName+"学生列表"); //行内容
           }
           HSSFCellStyle style = workbook.createCellStyle(); //创建样式
           HSSFFont font = workbook.createFont(); //创建字体样式
                   font.setFontHeight((short)(20*20)); //字体
                   font.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL); //加粗
                   style.setAlignment(HSSFCellStyle.ALIGN_CENTER); //居中
           style.setFont(font); //设置字体样式  
           cell.setCellStyle(style); //设置样式
           sheet.addMergedRegion(new org.apache.poi.ss.util.Region(0,(short)0,0,(short)4)); //合并列
           
           //构造列表头
           row = sheet.createRow(1);//创建第一行
           cell = row.createCell(0); //创建第一列
           cell.setCellValue(new HSSFRichTextString("学生账号"));
           cell = row.createCell(1);//创建第二列
           cell.setCellValue(new HSSFRichTextString("姓名"));      
           cell = row.createCell(2);//创建第三列
           cell.setCellValue(new HSSFRichTextString("状态"));
           cell = row.createCell(3);//创建第四列
           cell.setCellValue(new HSSFRichTextString("租期开始时间"));
           cell = row.createCell(4);//创建第五列
           cell.setCellValue(new HSSFRichTextString("租期结束时间"));
           cell = row.createCell(5);//创建第六列
           cell.setCellValue(new HSSFRichTextString("租期费用"));
           cell = row.createCell(6);//创建第七列
           cell.setCellValue(new HSSFRichTextString("付费时间"));
           cell = row.createCell(7);//创建第八列
           cell.setCellValue(new HSSFRichTextString("上次登录时间"));
           //输出每个学生的信息
           for (int i = 0; i < userList.size(); i++) {
                   User user= userList.get(i);
                   row=sheet.createRow(i+2);//创建第i+1行                      
                  
                   cell = row.createCell(0); //创建第一列
                   cell.setCellValue(user.getUser_account());
                   cell = row.createCell(1);//创建第二列
                   cell.setCellValue(user.getUsername());      
                   cell = row.createCell(2);//创建第三列
                   cell.setCellValue(user.getLock_modeToCN());
                   cell = row.createCell(3);//创建第四列
                   cell.setCellValue(user.getRent_start("yyyy-MM-dd"));
                   cell = row.createCell(4);//创建第五列
                   cell.setCellValue(user.getRent_end("yyyy-MM-dd"));
                   cell = row.createCell(5);//创建第六列
                   cell.setCellValue(user.getPrice());
                   cell = row.createCell(6);//创建第七列
                   cell.setCellValue(user.getPay_date("yyyy-MM-dd"));
                   cell = row.createCell(7);//创建第八列
                   cell.setCellValue(user.getLast_login("yyyy-MM-dd")); 
           }
          
           //第三步：写入输出流
           ByteArrayOutputStream baos = new ByteArrayOutputStream();

           try {
                   workbook.write(baos);//写入
           } catch (IOException e) {
                   e.printStackTrace();
           }

           byte[] ba = baos.toByteArray(); 
           ByteArrayInputStream bais = new ByteArrayInputStream(ba); 
           return bais;
    }

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	
}
