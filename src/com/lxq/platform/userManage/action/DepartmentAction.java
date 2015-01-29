package com.lxq.platform.userManage.action;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.userManage.pojo.Department;
import com.lxq.platform.userManage.pojo.TreeNode;
import com.lxq.platform.util.ServletUtil;

@SuppressWarnings("serial")
public class DepartmentAction extends BaseAction {
	
	/**机构主键*/
	private String uid;
	
	/**机构树节点链接*/
	private String link;
	
	/**
	 * 根据机构主键获取机构名称
	 * @return
	 */
	public String getNodeText() {
		
		String nodeText = "";
		//如果父机构uid不存在，或者root，则查找根机构，否则查找下级机构
		if(uid != null && !uid.equals("")){
			Department dept = (Department) baseService.findById(Department.class, uid);
			nodeText = dept.getDeptName();
		}
		
		ServletUtil.responseText(nodeText);
		
		return null;
	}
	
	/**
	 * 获取父机构的子机构
	 * @return
	 */
	public void getChildNodes() {
		
		TreeNode[] array_childDepts = null;

		//如果父机构uid不存在，或者root，则查找根机构，否则查找下级机构
		if(uid == null || uid.equals("root")){
			List<?> l_depts = baseService.findBySql(Department.class,"selec * from basic_department where parentDept is null");
			
			array_childDepts = new TreeNode[l_depts.size()];
			
			for(int i = 0 ; i < l_depts.size() ; i ++){
				array_childDepts[i] = getTreeNode((Department)l_depts.get(i));
			}
			
			
		}else{
			
			Department dept = (Department) baseService.findById(Department.class, Integer.parseInt(uid));

			Set<Department> s_depts = dept.getChildDepts();
			
			array_childDepts = new TreeNode[s_depts.size()];
			
			Iterator<Department> it = s_depts.iterator();

			int i = 0;
			while(it.hasNext()){
				array_childDepts[i++] = getTreeNode(it.next());
			}
		}
		
		JsonConfig config = new JsonConfig();
		
		config.setExcludes(new String[]{"children"});
		
		JSONArray jsonArray = JSONArray.fromObject(array_childDepts,config);
		
		String str_json = jsonArray.toString();
		
		ServletUtil.responseText(str_json);
	}

	/**
	 * 获取所有机构
	 * @return
	 */
	public void getAllNodes() {
		TreeNode[] array_childDepts = null;
		
		List<?> l_depts = baseService.findBySql(Department.class,"select * from basic_department where parentDept is null");
		
		array_childDepts = new TreeNode[l_depts.size()];
		
		for(int i = 0 ; i < l_depts.size() ; i ++){
			
			Department child = (Department)l_depts.get(i);
			
			array_childDepts[i] = getTreeNode(child);
			
			array_childDepts[i].setChildren(getChildNodes(child));
			
			
		}		
		
		JSONArray jsonArray = JSONArray.fromObject(array_childDepts);
		
		String str_json = jsonArray.toString();
		
		ServletUtil.responseText(str_json);
	}
	
	/**
	 * 递归获取父机构下所有的机构，包括子机构、子子机构、等
	 * @return ext树节点集合
	 */
	public TreeNode[] getChildNodes(Department parentDept){
		
		Set<Department> childDepts = parentDept.getChildDepts();
		
		if(childDepts.size() == 0){
			return null;
		}
		
		TreeNode[] array_childDepts = new TreeNode[childDepts.size()];
		Iterator<Department> it = childDepts.iterator();

		int i = 0;
		while(it.hasNext()){
			
			Department child = it.next();
			TreeNode treeNode = getTreeNode(child);
			
			if(child.getChildDepts().size() != 0){
				treeNode.setChildren(getChildNodes(child));
			}
			
			array_childDepts[i++] = treeNode;
		}
		
		return array_childDepts;
	}
	
	public TreeNode getTreeNode(Department dept){
		
		TreeNode treeNode = new TreeNode();
		
		treeNode.setId(String.valueOf(dept.getUid()));
		treeNode.setText(dept.getDeptName());
		treeNode.setCls(dept.getChildDepts().size() == 0 ? "file":"folder");
		treeNode.setLeaf(dept.getChildDepts().size() == 0 ? true:false);
		treeNode.setUrl(link);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("level", dept.getLevel().getValue());
		
		treeNode.setJsonObject(jsonObject.toString());
		
		return treeNode;
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
