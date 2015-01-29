package com.lxq.platform.businessManage.pojo;

import com.lxq.platform.systemManage.pojo.CodeLibrary;

/***********************************************************************
 * Module:  ContracTask.java
 * Author:  Administrator
 * Purpose: Defines the Class ContracTask
 ***********************************************************************/

/**
 * 合同任务信息
 * 
 * @pdOid 9ede899d-50a3-48a9-a6dc-e5609f8ae6f7
 */
public class ContracTask {
	/**
	 * 主键
	 * 
	 * @pdOid 06657b1c-90ed-4ebc-9449-46eb8e0e9327
	 */
	private int uid;
	/**
	 * 合同编号
	 * 
	 * @pdOid e1173411-ac56-45de-9e34-fa282122b5e2
	 */
	private String contracNo;
	/**
	 * 任务类型
	 * 
	 * @pdOid d53f03f4-92aa-4501-91ad-e8f5e8f87390
	 */
	private CodeLibrary taskType;
	/**
	 * 任务状态
	 * 
	 * @pdOid df7103c4-af41-4467-8b2c-7bfba0435abd
	 */
	private CodeLibrary taskStatus;
	/**
	 * 执行人
	 * 
	 * @pdOid 11e01984-2227-4307-a98a-8c6ac97b63fe
	 */
	private String executePerson;
	/**
	 * 创建人
	 * 
	 * @pdOid c3f76bc7-1472-43a9-b061-794d9151f265
	 */
	private String createPerson;
	/**
	 * 开始时间
	 * 
	 * @pdOid 13cebfe9-1855-4bb5-be28-fd4bb7809b9f
	 */
	private String startTime;
	/**
	 * 结束时间
	 * 
	 * @pdOid 9500bb17-87f2-4181-bf6f-d116ce761219
	 */
	private String endTime;
	/**
	 * 任务内容
	 * 
	 * @pdOid 2fd3ab97-b1b7-4f9c-b527-8b03a3117073
	 */
	private String taskContent;
	/**
	 * 合同信息
	 * 
	 * @pdOid 2fd3ab97-b1b7-4f9c-b527-8b03a3117073
	 */
	private Contract contract;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getContracNo() {
		return contracNo;
	}

	public void setContracNo(String contracNo) {
		this.contracNo = contracNo;
	}

	public CodeLibrary getTaskType() {
		return taskType;
	}

	public void setTaskType(CodeLibrary taskType) {
		this.taskType = taskType;
	}

	public CodeLibrary getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(CodeLibrary taskStatus) {
		this.taskStatus = taskStatus;
	}

	public String getExecutePerson() {
		return executePerson;
	}

	public void setExecutePerson(String executePerson) {
		this.executePerson = executePerson;
	}

	public String getCreatePerson() {
		return createPerson;
	}

	public void setCreatePerson(String createPerson) {
		this.createPerson = createPerson;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getTaskContent() {
		return taskContent;
	}

	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}

	public Contract getContract() {
		return contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}
}