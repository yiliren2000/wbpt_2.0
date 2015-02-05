package com.lxq.platform.workflow;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.util.DateUtil;
import com.lxq.platform.workflow.pojo.FlowNode;
import com.lxq.platform.workflow.pojo.FlowRecord;

public class FlowEngine {

	public static FlowRecord initFlow(FlowNode flowNode,User user,String objectType,int objectUid){
		
		FlowRecord record = new FlowRecord();
		
		record.setUser(user);
		record.setFlowNode(flowNode);
		record.setObjectType(objectType);
		record.setObjectUid(objectUid);
		
		record.setStartTime(DateUtil.getNowTime());
		
		return record;
	}
	
	public static FlowRecord generateNode(FlowRecord curRecord,FlowNode nextNode,User user,Map<String,String> params) throws InstantiationException, IllegalAccessException, ClassNotFoundException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
		
		String nowTime = DateUtil.getNowTime();
		curRecord.setEndTime(nowTime);
		
		FlowRecord nextRecord = new FlowRecord();
		
		nextRecord.setUser(user);
		nextRecord.setFlowNode(nextNode);
		nextRecord.setObjectType(curRecord.getObjectType());
		nextRecord.setObjectUid(curRecord.getObjectUid());
		nextRecord.setStartTime(nowTime);
		nextRecord.setLastRecord(curRecord);
		
		return nextRecord;
	}
	
	public static FlowAction getFlowAction(FlowRecord curRecord,Map<String,String> params) throws InstantiationException, IllegalAccessException, ClassNotFoundException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
		
		if(curRecord.getFlowNode().getScript() == null || curRecord.getFlowNode().getScript().equals("")){
			return null;
		}
		
		FlowAction flowAction = executeScript(curRecord,params);
		
		return flowAction;
	}
	
	public static FlowAction executeScript(FlowRecord flowRecord,Map<String,String> params) throws InstantiationException, IllegalAccessException, ClassNotFoundException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException{
		
		String script = flowRecord.getFlowNode().getScript();
		
		FlowAction flowAction = new FlowAction();
		
		if(script.equals("")){
			flowAction.setUsers(null);
			flowAction.setFlowNode(null);
			
			return flowAction;
		}
		
		int position = script.lastIndexOf(".");
		
		String className = script.substring(0, position);
		String methodName = script.substring(position+1);
		
		Class<?> cla = Class.forName(className);
		
		Method method = cla.getMethod(methodName, FlowRecord.class,Map.class);
		
		flowAction = (FlowAction)method.invoke(cla.newInstance(), flowRecord,params);
		
		return flowAction;
		
	}
	
}