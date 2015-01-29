package com.lxq.platform.userManage.pojo;


/**
 * 用户角色权限类
 * @author lixueqing
 *
 */
public class RolePrivilege {

	/**角色主键*/
	private int role;
	
	/**权限主键*/
	private int privilege;

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public int getPrivilege() {
		return privilege;
	}

	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}
	
}