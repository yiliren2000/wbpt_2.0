package com.lxq.platform.workflow.pojo;

import java.util.Set;

public class FlowModel {
	/**主键*/
	private int uid;
	
	/**节点编号*/
	private String modelNo;
	
	/**节点名称*/
	private String modelName;
	
	/**所属流程*/
	private Set<FlowNode> flowNodes;
	
	private String remark;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getModelNo() {
		return modelNo;
	}

	public void setModelNo(String modelNo) {
		this.modelNo = modelNo;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public Set<FlowNode> getFlowNodes() {
		return flowNodes;
	}

	public void setFlowNodes(Set<FlowNode> flowNodes) {
		this.flowNodes = flowNodes;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
