package com.lxq.platform.workflow.pojo;

public class FlowRecord {

	/**主键*/
	private int uid;
	
	/**节点编号*/
	private FlowNode flowNode;
	
	/**对象类型*/
	private String objectType;
	
	/**对象主键*/
	private int objectUid;
	
	/**开始时间*/
	private String startTime;
	
	/**结束时间*/
	private String endTime;
	
	/**结束时间*/
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
