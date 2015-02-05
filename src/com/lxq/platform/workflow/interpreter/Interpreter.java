package com.lxq.platform.workflow.interpreter;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.workflow.FlowAction;
import com.lxq.platform.workflow.FlowCatalog;
import com.lxq.platform.workflow.pojo.FlowNode;
import com.lxq.platform.workflow.pojo.FlowRecord;


public class Interpreter {
	
	public FlowAction nextNode(FlowRecord flowRecord,Map<String,String>params) throws Exception{
		
		FlowAction flowAction = new FlowAction();
		
		flowAction.setFlowNode(FlowCatalog.getFlowNodeByNo("test", "second"));
		
		User user1 = new User();
		user1.setUid(1);
		user1.setUserName("zhangsan");
		
		User user2 = new User();
		user2.setUid(2);
		user2.setUserName("lisi");
		
		List<User> users= new ArrayList<User>();
		
		flowAction.setUsers(users);
		
		return flowAction;
	}
	
	public FlowAction nextNode2(FlowRecord flowRecord,Map<String,String>params) throws Exception{
		
		
		FlowNode flowNode = FlowCatalog.getFlowNodeByNo("test", "end");
		
		FlowAction flowAction = new FlowAction();;
		
		flowAction.setFlowNode(flowNode);
		
		User user1 = new User();
		user1.setUid(1);
		user1.setUserName("zhangsan");
		
		User user2 = new User();
		user2.setUid(2);
		user2.setUserName("lisi");
		
		List<User> users= new ArrayList<User>();
		
		flowAction.setUsers(users);
		
		return flowAction;
	}
	
	
}
