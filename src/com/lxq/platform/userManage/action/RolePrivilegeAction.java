package com.lxq.platform.userManage.action;

import java.util.Iterator;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.exception.PrivilegeException;
import com.lxq.platform.userManage.pojo.Privilege;
import com.lxq.platform.userManage.pojo.Role;
import com.lxq.platform.userManage.pojo.RolePrivilege;
import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.util.ServletUtil;

@SuppressWarnings("serial")
public class RolePrivilegeAction extends BaseAction {
	
	/**
     * 获取json格式的分页数据
     * @return json格式的分页数据。
     *     例：{callback:"callback1001",totalCount:2,topics:[{"admin","系统管理员"},{"test","测试用户"}]}
     */
	public void jsonPage() {

		if(queryClause == null || queryClause.equals("")){
			ServletUtil.responseText("'totalCount':0,'topics':[]}");
		}else{
		
			Role role = (Role)baseService.findUniqueBySql(Role.class,"select * from basic_role where "+queryClause);
	
			JSONArray topics = new JSONArray();
	
			JSONObject topic = new JSONObject();
			
			Set<Privilege> privileges = role.getPrivileges();
			Iterator<Privilege> it = privileges.iterator();
			
			topic.put("roleUid", role.getUid());
			while(it.hasNext()){
				Privilege privilege = it.next();
				
				topic.put("privilegeUid", privilege.getUid());
				topic.put("name", privilege.getName());
				topic.put("operate", privilege.getOperate());
				topic.put("className", privilege.getClassName());
				
				topics.add(topic);
			}
				
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("totalCount", privileges.size());
			jsonObject.put("topics", topics);
			
			String str_json = jsonObject.toString();
			
			ServletUtil.responseText(str_json);
	
		}
	}
	/**
	 * 加载表单数据
	 * @return json格式数据。
	 *     例：{success:true,info:["userId":"admin","userName":"系统管理员"]}
	 */
	public void find(){
		
		User user = ServletUtil.getCurUser();
		
		if(!user.hasRight("info", entityName)){
			String str_json = "{'success':false,'info': {'msg':'当前用户没有查看权限'}}";
			ServletUtil.responseText(str_json);
			return;
		}		
		JSONObject o_whereClause = JSONObject.fromObject(whereClause);
		
		int roleUid = o_whereClause.getInt("roleUid");
		int privilegeUid = o_whereClause.getInt("privilegeUid");
		
		JSONObject info = new JSONObject();
		
		info.put("roleUid", roleUid);
		info.put("privilegeUid", privilegeUid);
		
		JSONArray jsonArray = new JSONArray();
		jsonArray.add(info);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("success", true);
		jsonObject.put("info",jsonArray );
		
		String str_json = jsonObject.toString();
		
		ServletUtil.responseText(str_json);
	}
	
	public void delete() throws PrivilegeException {
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		RolePrivilege rolePrivilege = new RolePrivilege();
		rolePrivilege.setRole(jb.getInt("roleUid"));
		rolePrivilege.setPrivilege(jb.getInt("privilegeUid"));
		
		baseService.delete(rolePrivilege,"json:"+jsonObject);

		String str_json = "{'success':true,'msg':'删除成功'}";
		ServletUtil.responseText(str_json);
		
	}
	
	public void save() throws PrivilegeException {
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		RolePrivilege rolePrivilege = new RolePrivilege();
		rolePrivilege.setRole(jb.getInt("roleUid"));
		rolePrivilege.setPrivilege(jb.getInt("privilegeUid"));
		
		// 保存对象
		baseService.add(rolePrivilege,"json:"+jsonObject);
		
		String str_json = "{'success':true,'msg':'保存成功'}";
		
		ServletUtil.responseText(str_json);
	}
}
