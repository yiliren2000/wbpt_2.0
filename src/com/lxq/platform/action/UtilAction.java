package com.lxq.platform.action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;

import com.lxq.platform.pto.SelectItem;
import com.lxq.platform.service.intef.IBaseService;
import com.lxq.platform.systemManage.pojo.CodeCatalog;
import com.lxq.platform.systemManage.pojo.CodeLibrary;
import com.lxq.platform.util.ServletUtil;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UtilAction extends ActionSupport{
	
	/**下载文件*/
	private String filePath; 

	/**数据字典*/
    private String codeNo; 
    /**代码查询语句*/
    private String codeSql; 
    /**业务处理*/
    private IBaseService baseService;
	
    /**
	 * 获取json格式的下拉框数据
	 * @return json格式的数据。例：{"Y":"是","N":"否"}
	 * @throws IOException reponse获取输出流失败
	 */
	public String getCodeLibrary() throws IOException{
		
		CodeCatalog codeCatalog = (CodeCatalog)baseService.findUniqueBySql(CodeCatalog.class , "select * from basic_code_catalog where codeNo='"+codeNo+"'");
		Set<CodeLibrary> codeLibrarys = codeCatalog.getCodeLibrarys();
		
		JsonConfig config = new JsonConfig();   
		config.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT); 
		
		JSONArray codelibrary_array = JSONArray.fromObject(codeLibrarys,config);
		
		ServletUtil.responseText(codelibrary_array.toString());
		
		return null;
		
	}
	
	/**
	 * 获取json格式的下拉框数据
	 * @return json格式的数据。例：{"Y":"是","N":"否"}
	 * @throws IOException reponse获取输出流失败
	 */
	public String getCodeLibraryBySql() throws IOException{
		
		JSONArray codelibrary_array = new JSONArray();
		
		List<?> list = baseService.findBySql(SelectItem.class,codeSql);
		
		for(int i = 0 ; i < list.size() ; i ++){
			SelectItem selectItem = (SelectItem)list.get(i);
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("uid", selectItem.getUid());
			jsonObject.put("text", selectItem.getText());
			
			codelibrary_array.add(jsonObject);
		}
		
		ServletUtil.responseText(codelibrary_array.toString());
		
		return null;
		
	}
	
	public void downloadFile() throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("application/octet-stream;charset=UTF-8");
		
		response.reset(); //清空输出流
		String fileName = filePath.substring(filePath.lastIndexOf("/")+1);
		
		fileName = new String(fileName.getBytes(), "ISO-8859-1");
		response.setHeader("Content-disposition", "attachment; filename="+fileName);  
		
		InputStream is = new FileInputStream(filePath); 
		OutputStream out = response.getOutputStream();
		
		byte[] b = new byte[1024];
		int len = 0;
		while((len = is.read(b)) > -1){
			out.write(b, 0, len);
		}
		
		out.flush();
		
		is.close();
		out.close();
	}


	public String getCodeNo() {
		return codeNo;
	}

	public void setCodeNo(String codeNo) {
		this.codeNo = codeNo;
	}

	public String getCodeSql() {
		return codeSql;
	}

	public void setCodeSql(String codeSql) {
		this.codeSql = codeSql;
	}

	public IBaseService getBaseService() {
		return baseService;
	}

	public void setBaseService(IBaseService baseService) {
		this.baseService = baseService;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
}
