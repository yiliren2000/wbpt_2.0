package com.lxq.platform.systemManage.pojo;

import com.lxq.platform.userManage.pojo.User;


/**
 * 系统通知
 * @author lixueqing
 * 
 */
public class Notice {
	
	/**菜单主键*/
	private int uid;

	/**标题*/
	private String title;
	
	/**通知部门*/
	private String noticeDeptsJson;

	/**附件路径*/
	private String filePath;
	
	/**开始日期*/
	private String startDate;
	
	/**开始日期*/
	private String endDate;
	
	/**发布人*/
	private User publishPerson;
	
	/**创建日期*/
	private String createDate;
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getNoticeDeptsJson() {
		return noticeDeptsJson;
	}

	public void setNoticeDeptsJson(String noticeDeptsJson) {
		this.noticeDeptsJson = noticeDeptsJson;
	}

	public User getPublishPerson() {
		return publishPerson;
	}

	public void setPublishPerson(User publishPerson) {
		this.publishPerson = publishPerson;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
}