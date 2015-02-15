package com.lxq.platform.workflow.pojo;

import com.lxq.platform.annotation.Describe;
import com.lxq.platform.systemManage.pojo.CodeLibrary;
import com.lxq.platform.userManage.pojo.User;

@Describe(describe="流程记录")
public class FlowRecord {

	@Describe(describe="主键")
	private int uid;
	
	@Describe(describe="节点编号")
	private FlowNode flowNode;
	
	@Describe(describe="对象类型")
	private String objectType;
	
	@Describe(describe="对象主键")
	private int objectUid;
	
	@Describe(describe="处理人")
	private User user;
	
	@Describe(describe="处理动作")
	private CodeLibrary action;
	
	@Describe(describe="开始时间")
	private String startTime;
	
	@Describe(describe="结束时间")
	private String endTime;
	
	@Describe(describe="结束时间")
	private FlowRecord lastRecord;
	

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public FlowNode getFlowNode() {
		return flowNode;
	}

	public void setFlowNode(FlowNode flowNode) {
		this.flowNode = flowNode;
	}

	public String getObjectType() {
		return objectType;
	}

	public void setObjectType(String objectType) {
		this.objectType = objectType;
	}

	public int getObjectUid() {
		return objectUid;
	}

	public void setObjectUid(int objectUid) {
		this.objectUid = objectUid;
	}

	public String getStartTime() {
		return startTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public FlowRecord getLastRecord() {
		return lastRecord;
	}

	public void setLastRecord(FlowRecord lastRecord) {
		this.lastRecord = lastRecord;
	}
	
}
