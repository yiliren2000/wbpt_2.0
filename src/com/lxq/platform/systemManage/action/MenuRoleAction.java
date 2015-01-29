package com.lxq.platform.systemManage.action;

import java.util.Iterator;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.exception.PrivilegeException;
import com.lxq.platform.systemManage.pojo.Menu;
import com.lxq.platform.systemManage.pojo.MenuRole;
import com.lxq.platform.userManage.pojo.Role;
import com.lxq.platform.util.ServletUtil;

@SuppressWarnings("serial")
public class MenuRoleAction extends BaseAction {
	
	/**
     * 获取json格式的分页数据
     * @return json格式的分页数据。
     *     例：{callback:"callback1001",totalCount:2,topics:[{"admin","系统管理员"},{"test","测试用户"}]}
     */
	public void jsonPage() {

		if(queryClause == null || queryClause.equals("")){
			ServletUtil.responseText("'totalCount':0,'topics':[]}");
		}else{
			Menu menu = (Menu) baseService.findUniqueBySql(Menu.class,"select * from basic_menu where "+queryClause);
			
			JSONArray topics = new JSONArray();
			
			JSONObject topic = new JSONObject();
			
			Set<Role> roles = menu.getRoles();
			Iterator<Role> it = roles.iterator();
			
			topic.put("menuId", menu.getUid());
			while(it.hasNext()){
				Role role = it.next();
				
				topic.put("roleUid", role.getUid());
				topic.put("roleId", role.getRoleId());
				topic.put("roleName", role.getRoleName());
				topic.put("status", role.getStatus().getText());
				
				topics.add(topic);
			}
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("totalCount", roles.size());
			jsonObject.put("topics", topics);
			
			String str_json = jsonObject.toString();
			
			ServletUtil.responseText(str_json);
		}
		
	}
	
	public void delete() throws PrivilegeException {
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		MenuRole menuRole = new MenuRole();
		menuRole.setMenu(jb.getInt("menuId"));
		menuRole.setRole(jb.getInt("roleUid"));
		
		baseService.delete(menuRole,"json:"+jsonObject);

		String str_json = "{'success':true,'msg':'删除成功'}";
		ServletUtil.responseText(str_json);
	}
	
	public void save() throws PrivilegeException {
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		MenuRole menuRole = new MenuRole();
		menuRole.setMenu(jb.getInt("menuId"));
		menuRole.setRole(jb.getInt("roleUid"));
		
		// 保存对象
		baseService.add(menuRole,"json:"+jsonObject);
		
		String str_json = "{'success':true,'msg':'保存成功'}";
		
		ServletUtil.responseText(str_json);
	}
}
