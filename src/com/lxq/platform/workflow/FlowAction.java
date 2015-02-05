package com.lxq.platform.workflow;

import java.util.List;

import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.workflow.pojo.FlowNode;

public class FlowAction {

	private List<User> users;
	
	private FlowNode flowNode;

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public FlowNode getFlowNode() {
		return flowNode;
	}

	public void setFlowNode(FlowNode flowNode) {
		this.flowNode = flowNode;
	}
	
}
