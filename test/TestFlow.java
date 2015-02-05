import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.lxq.platform.workflow.FlowCatalog;
import com.lxq.platform.workflow.FlowEngine;
import com.lxq.platform.workflow.pojo.FlowModel;
import com.lxq.platform.workflow.pojo.FlowNode;
import com.lxq.platform.workflow.pojo.FlowRecord;

public class TestFlow {

	public static void main(String[] args) throws Exception{
		
		initFlowCatalog();
		
		FlowNode firstNode = FlowCatalog.getFlowNodeByNo("test", "start");
		
		FlowRecord record1 = FlowEngine.initFlow(firstNode, "apply", 110);
		
		while(true){
			System.out.println(record1.getFlowNode().getNodeName()+"----");
			
			record1 = FlowEngine.nextNode(record1, null);
			if(record1 == null){
				break;
			}
		
		}
	}
	
	public static void initFlowCatalog() throws IOException{
		
		Map<String,FlowNode> nodes = new HashMap<String,FlowNode>();
		
		FlowModel flowModel = new FlowModel();
		flowModel.setUid(1);
		flowModel.setModelNo("test");
		flowModel.setModelName("test");
		
		FlowNode node1 = new FlowNode();
		node1.setUid(1);
		node1.setNodeNo("start");
		node1.setNodeName("开始");
		node1.setFlowModel(flowModel);
		node1.setScript("com.lxq.platform.workflow.interpreter.Interpreter.nextNode");
		
		FlowNode node2 = new FlowNode();
		node2.setUid(2);
		node2.setNodeNo("second");
		node2.setNodeName("第二次");
		node2.setFlowModel(flowModel);
		node2.setScript("com.lxq.platform.workflow.interpreter.Interpreter.nextNode2");

		FlowNode node3 = new FlowNode();
		node3.setUid(2);
		node3.setNodeNo("end");
		node3.setNodeName("结束");
		node3.setFlowModel(flowModel);
		node3.setScript(null);
		
		nodes.put(node1.getFlowModel().getModelNo()+"_"+node1.getNodeNo(), node1);
		nodes.put(node1.getFlowModel().getModelNo()+"_"+node2.getNodeNo(), node2);
		nodes.put(node1.getFlowModel().getModelNo()+"_"+node3.getNodeNo(), node3);
		
		FlowCatalog.flowNodes = nodes ;
		
	}
}