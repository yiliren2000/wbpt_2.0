package com.lxq.platform.workflow.pojo;

import java.util.Set;

import com.lxq.platform.annotation.Describe;

@Describe(describe="流程模板")
public class FlowModel {
	
	@Describe(describe="主键")
	private int uid;
	
	@Describe(describe="流程编号")
	private String modelNo;
	
	@Describe(describe="流程名称")
	private String modelName;
	
	@Describe(describe="所属流程")
	private Set<FlowNode> flowNodes;
	
	@Describe(describe="备注")
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
