package com.lxq.platform.goalManage.action;

import net.sf.json.JSONArray;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.userManage.pojo.TreeNode;
import com.lxq.platform.util.ServletUtil;

@SuppressWarnings("serial")
public class ReportAction extends BaseAction {
	
	/**报表主键*/
	private String uid;
	
	/**报表树节点链接*/
	private String link;
	
	/**
	 * 递归获取父报表下所有的报表，包括子报表、子子报表、等
	 * @return ext树节点集合
	 */
	public void getReportNodes(){
		
		TreeNode[] treeNodes = null;
		if (ServletUtil.getCurDept().getLevel().getValue().equals("1") || ServletUtil.getCurUser().hasRole("102")){
			treeNodes = new TreeNode[3];
			treeNodes[0] = new TreeNode();
			treeNodes[1] = new TreeNode();
			treeNodes[2] = new TreeNode();
		
			treeNodes[0].setId("report1");
			treeNodes[0].setText("部门汇总表");
			treeNodes[0].setCls("file");
			treeNodes[0].setLeaf(true);
			treeNodes[0].setUrl("/report/report1.jsp");
			
			treeNodes[1].setId("report2");
			treeNodes[1].setText("全局明细表");
			treeNodes[1].setCls("file");
			treeNodes[1].setLeaf(true);
			treeNodes[1].setUrl("/report/report2.jsp");

			treeNodes[2].setId("report3");
			treeNodes[2].setText("部门明细表");
			treeNodes[2].setCls("file");
			treeNodes[2].setLeaf(true);
			treeNodes[2].setUrl("/report/report3.jsp");
		} else {
			treeNodes = new TreeNode[1];
			
			treeNodes[0] = new TreeNode();
			treeNodes[0].setId("report3");
			treeNodes[0].setText("部门明细表");
			treeNodes[0].setCls("file");
			treeNodes[0].setLeaf(true);
			treeNodes[0].setUrl("/report/report3.jsp");
		}
		
		JSONArray jsonArray = JSONArray.fromObject(treeNodes);
		
		String str_json = jsonArray.toString();
		
		ServletUtil.responseText(str_json);
	}
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

}
