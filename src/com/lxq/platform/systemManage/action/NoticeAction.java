package com.lxq.platform.systemManage.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.exception.PrivilegeException;
import com.lxq.platform.systemManage.pojo.Notice;
import com.lxq.platform.userManage.pojo.Department;
import com.lxq.platform.util.DataConvert;
import com.lxq.platform.util.DateUtil;
import com.lxq.platform.util.ServletUtil;

@SuppressWarnings("serial")
public class NoticeAction extends BaseAction {
	
	private int uid;
	private File file;
	private String contentType;
	private String fileName;
	private String saveDir;
	
	
   /**
     * 获取json格式的分页数据
     * @return json格式的分页数据。
     *     例：{callback:"callback1001",totalCount:2,topics:[{"admin","系统管理员"},{"test","测试用户"}]}
     */
	public void jsonPage() {

		if(queryClause == null || queryClause.equals("")){
			queryClause = "1=1";
		}
		
		String Sql = " from basic_notice where "+queryClause+" and publishPerson= "+ServletUtil.getCurUser().getUid();
		
		int totalCount = baseService.getCount("select count(*)"+Sql);
		
		List<?> objects = baseService.findBySql(Notice.class,"select * "+Sql+" order by "+sort+" "+dir, start, limit);

		JSONArray topics = new JSONArray();

		for(int i = 0 ; i < objects.size() ; i++){
			Notice notice = (Notice) objects.get(i);
			
			JSONObject topic = new JSONObject();
			
			topic.put("uid", notice.getUid());
			topic.put("title", notice.getTitle());
			topic.put("filePath", notice.getFilePath() != null ? notice.getFilePath().substring(notice.getFilePath().lastIndexOf("/")+1):"");
			topic.put("startDate", notice.getStartDate());
			topic.put("endDate", notice.getEndDate());
			topic.put("createDate", notice.getCreateDate());

			String deptNames = "";
			if(notice.getNoticeDeptsJson() != null && notice.getNoticeDeptsJson().length() > 0){
				String[] deptUids = notice.getNoticeDeptsJson().split(",");
				
				for(int k = 0 ; k < deptUids.length ; k ++){
					Department department = (Department) baseService.findById(Department.class, deptUids[k]);
					
					deptNames = deptNames + "," +department.getDeptName();
				}
			}

			topic.put("noticeDeptsJson", deptNames.length()>1 ? deptNames.substring(1):"");
			
			topics.add(topic);
			
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("totalCount", totalCount);
		jsonObject.put("topics", topics);
		
		String str_json = jsonObject.toString();
		
		ServletUtil.responseText(str_json);
		
	}

	
	/**
     * 获取json格式数据
     */
	public void showNotice() {

		String today = DateUtil.getToday();
		List<?> objects = baseService.findBySql(Notice.class,
			"select * from basic_notice " +
			"where '"+today+"'>=startDate " +
			"and '"+today+"'<=endDate") ;

		JSONArray topics = new JSONArray();

		for(int i = 0 ; i < objects.size() ; i++){
			Notice notice = (Notice) objects.get(i);
			
			String noticeDeptsJson = DataConvert.toString(notice.getNoticeDeptsJson());

			if((","+noticeDeptsJson).indexOf(","+ServletUtil.getCurDept().getUid())>-1){
				
				JSONObject topic = new JSONObject();
				
				topic.put("title", DataConvert.toString(notice.getTitle()));
				topic.put("uid", DataConvert.toString(notice.getUid()));
				topic.put("filePath", DataConvert.toString(notice.getFilePath()));
				topic.put("publishDept", DataConvert.toString(notice.getPublishPerson().getBelongDept().getDeptName()));
				topic.put("publishPerson", DataConvert.toString(notice.getPublishPerson().getUserName()));
				
				topics.add(topic);
			}
			
		}
		
		ServletUtil.responseText("var notices = "+topics.toString());
	}
	
	public void upload() throws Exception {
		
		Notice notice = (Notice) baseService.findById(Notice.class, uid);
		
		String filePath = "/WEB-INF/data/notice/"+fileName;
		
		//如果有附件，则先删除附件
		if(notice.getFilePath()!=null && notice.getFilePath().length()>0){
			ServletUtil.deleteFile(ServletActionContext.getServletContext().getRealPath("")+notice.getFilePath());
		}
		//保存附件
		ServletUtil.saveFile(file,ServletActionContext.getServletContext().getRealPath("")+filePath);
		
		//保存附件路径
		notice.setFilePath(filePath);
		baseService.add(notice,"json:");
		
		String str_json = "{'success':true}";
		ServletUtil.responseText(str_json);
		
	}
	
	public void delete() throws PrivilegeException {
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		int keyValue = jb.getInt(keyName);
		
		Notice notice = (Notice) baseService.findById(Notice.class, keyValue);
		
		baseService.delete(notice,"json:"+jsonObject);
		
		try {
			ServletUtil.deleteFile(ServletActionContext.getServletContext().getRealPath("")+notice.getFilePath());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String str_json = "{'success':true,'msg':'删除成功'}";
		ServletUtil.responseText(str_json);
	}

	public void downloadFile() throws IOException{
		Notice notice = (Notice) baseService.findById(Notice.class, uid);
		
		if(notice.getFilePath() != null && notice.getFilePath().length()>0){
			ServletUtil.downLoadFile(ServletActionContext.getServletContext().getRealPath("")+notice.getFilePath());
		}
		
	}
	
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public void setUploadContentType(String contentType) {
		this.contentType = contentType;
	}

	public void setUpload(File file) {
		this.file = file;
	}

	public void setUploadFileName(String fileName) {
		this.fileName = fileName;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSaveDir() {
		return saveDir;
	}

	public void setSaveDir(String saveDir) {
		this.saveDir = saveDir;
	}
	
}
