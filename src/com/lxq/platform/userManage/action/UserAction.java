package com.lxq.platform.userManage.action;

import java.io.IOException;

import net.sf.json.JSONObject;

import com.lxq.platform.action.BaseAction;
import com.lxq.platform.exception.PrivilegeException;
import com.lxq.platform.userManage.pojo.User;
import com.lxq.platform.util.MD5;
import com.lxq.platform.util.ServletUtil;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class UserAction extends BaseAction {
	
    /**
     * 修改密码
     * @throws Exception 
     */
	public void modifyPass() throws Exception {
		
		//获取当前登陆用户
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
	
		curUser = userService.findUserByUserId(curUser.getUserId());
		
		String old_md5_pass = curUser.getPassword();

		JSONObject json_pass = JSONObject.fromObject(jsonObject);
		
		String new_pass = json_pass.getString("newPass");
	
		if(new_pass == null || new_pass.length()==0){
			ServletUtil.responseText("{'success':false,'msg':'密码不能为空'}");
			return;
		}
		String new_md5_pass = MD5.encode(new_pass);
		curUser.setPassword(new_md5_pass);
		// 保存对象
		baseService.update(curUser,"json:{'原密码'"+old_md5_pass+":'新密码':"+new_md5_pass+"}");
		ServletUtil.responseText("{'success':true,'msg':'密码修改成功'}");
	}

	/**
	 * 重置用户密码
	 * @throws Exception 
	 */
	public void resetPass() throws Exception {
		
		User curUser = ServletUtil.getCurUser();
		
		if(!curUser.hasRight("update", User.class.getName())){
			String str_json = "{'success':false,'msg': '当前用户没有重置密码权限'}";
			ServletUtil.responseText(str_json);
			return;
		}
		
		JSONObject json_pass = JSONObject.fromObject(jsonObject);
		
		String user_uid = json_pass.getString("uid");
		
		User user = (User) baseService.findById(User.class, Integer.parseInt(user_uid));
		
		String old_md5_pass = user.getPassword();
		String new_md5_pass = "ef73781effc5774100f87fe2f437a435";//原始密码1234abcd
		
		user.setPassword(new_md5_pass);
		
		// 保存对象
		baseService.update(user,"json:{'原密码'"+old_md5_pass+":'新密码':"+new_md5_pass+"}");
		
		ServletUtil.responseText("{'success':true,'msg':'密码重置成功'}");
	}
	
	/**
	 * 新增用户
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws PrivilegeException 
	 * @throws Exception 
	 * @throws IOException response获取输出流失败
	 */
	public void save() throws ClassNotFoundException, PrivilegeException {
		
		JSONObject jb = JSONObject.fromObject(jsonObject);
		
		String keyValue = (String)jb.get(keyName);

		if(keyValue == null){//实体不存在，则新增
			
			User user = (User) JSONObject.toBean(jb, Class.forName(entityName));
			
			user.setPassword("ef73781effc5774100f87fe2f437a435");

			// 保存对象
			baseService.add(user,"json:"+jsonObject);
			
		}
		
		String str_json = "{'success':true,'msg':'保存成功'}";
		
		ServletUtil.responseText(str_json);
	}
}
