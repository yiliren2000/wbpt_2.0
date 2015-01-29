package com.lxq.platform.userManage.action;

import java.io.IOException;
import java.util.Iterator;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.exception.PrivilegeException;
import com.lxq.platform.userManage.pojo.Role;
import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.userManage.pojo.UserRole;
import com.lxq.platform.util.ServletUtil;

@SuppressWarnings("serial")
public class UserRoleAction extends BaseAction {
	
	/**
     * 获取json格式的分页数据
     * @return json格式的分页数据。
     *     例：{callback:"callback1001",totalCount:2,topics:[{"admin","系统管理员"},{"test","测试用户"}]}
     * @throws IOException response获取输出流失败
     */
	public void jsonPage() {

		if(queryClause == null || queryClause.equals("")){
			ServletUtil.responseText("'totalCount':0,'topics':[]}");
		}else{
		
			User user = (User) baseService.findUniqueBySql(User.class,"select * from basic_user where "+queryClause);
	
			JSONArray topics = new JSONArray();
			
			JSONObject topic = new JSONObject();
			
			Set<Role> roles = user.getRoles();
			Iterator<Role> it = roles.iterator();
			
			topic.put("userUid", user.getUid());
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
	
	/**
	 * 加载表单数据
	 * @return json格式数据。
	 *     例：{success:true,info:["userId":"admin","userName":"系统管理员"]}
	 * @throws IOException
	 */
	public void find(){
		
		JSONObject o_whereClause = JSONObject.fromObject(whereClause);
		
		int userUid = o_whereClause.getInt("userUid");
		int roleUid = o_whereClause.getInt("roleUid");
		
		JSONObject info = new JSONObject();
		
		info.put("userUid", userUid);
		info.put("roleUid", roleUid);
		
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
		
		UserRole userRole = new UserRole();
		userRole.setUser(jb.getInt("userUid"));
		userRole.setRole(jb.getInt("roleUid"));
		
		baseService.delete(userRole,"json:"+jsonObject);

		String str_json = "{'success':true,'msg':'删除成功'}";
		ServletUtil.responseText(str_json);
	}
	
	public void save() throws PrivilegeException {
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		UserRole userRole = new UserRole();
		userRole.setUser(jb.getInt("userUid"));
		userRole.setRole(jb.getInt("roleUid"));
		
		// 保存对象
		baseService.add(userRole,"json:"+jsonObject);
		
		String str_json = "{'success':true,'msg':'保存成功'}";
		
		ServletUtil.responseText(str_json);		
	}
}
