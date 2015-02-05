package com.lxq.platform.workflow;

import java.util.Map;

import com.lxq.platform.workflow.pojo.FlowNode;

public class FlowCatalog {

	public static Map<String,FlowNode> flowNodes;
	
	public static FlowNode getFlowNodeByNo(String modelNo,String nodeNo) throws Exception{
		
		FlowNode flowNode = flowNodes.get(modelNo+"_"+nodeNo);
		
		if(flowNode == null){
			throw new Exception("流程号:"+modelNo+",节点号:"+nodeNo+" 不存在");
		}
				
		return flowNode;
	}
	
}
