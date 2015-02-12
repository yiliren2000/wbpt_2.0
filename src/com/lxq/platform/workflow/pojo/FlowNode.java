package com.lxq.platform.workflow.pojo;

import com.lxq.platform.annotation.Describe;

@Describe(describe="流程节点")
public class FlowNode {

	@Describe(describe="主键")
	private int uid;
	
	@Describe(describe="节点编号")
	private String nodeNo;
	
	@Describe(describe="节点名称")
	private String nodeName;
	
	@Describe(describe="节点脚本")
	private String script;
	
	@Describe(describe="所属流程")
	private FlowModel flowModel;
	
	@Describe(describe="备注")
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
