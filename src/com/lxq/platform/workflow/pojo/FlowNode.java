package com.lxq.platform.workflow.pojo;

public class FlowNode {

	/**主键*/
	private int uid;
	
	/**节点编号*/
	private String nodeNo;
	
	/**节点名称*/
	private String nodeName;
	
	/**节点脚本*/
	private String script;
	
	/**所属流程*/
	private FlowModel flowModel;
	
	/**备注*/
	private String remark;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getNodeNo() {
		return nodeNo;
	}

	public void setNodeNo(String nodeNo) {
		this.nodeNo = nodeNo;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public String getScript() {
		return script;
	}

	public void setScript(String script) {
		this.script = script;
	}

	public FlowModel getFlowModel() {
		return flowModel;
	}

	public void setFlowModel(FlowModel flowModel) {
		this.flowModel = flowModel;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
