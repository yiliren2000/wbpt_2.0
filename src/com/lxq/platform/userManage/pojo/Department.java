package com.lxq.platform.userManage.pojo;

import java.util.Set;
import java.util.TreeSet;

import com.lxq.platform.systemManage.pojo.CodeLibrary;

/**
 * 部门实体类
 * @author lixueqing
 * 
 */
public class Department implements Comparable<Department>{
	
	/**主键*/
	private int uid;

	/**部门编号*/
	private String deptId;
	
	/**部门名称*/
	private String deptName;
	
	/**上级部门编号*/
	private Department parentDept;

	/**直接下级部门编号*/
	private TreeSet<Department> childDepts;
	
	/**机构级别*/
	private CodeLibrary level;
	
	/**直属领导*/
	private User directLeader;
	
	/**部门人员集合*/
	private Set<User> users;
	
	/**部门状态*/
	private CodeLibrary status;

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public CodeLibrary getLevel() {
		return level;
	}

	public void setLevel(CodeLibrary level) {
		this.level = level;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Department getParentDept() {
		return parentDept;
	}

	public void setParentDept(Department parentDept) {
		this.parentDept = parentDept;
	}

	public CodeLibrary getStatus() {
		return status;
	}

	public void setStatus(CodeLibrary status) {
		this.status = status;
	}

	public User getDirectLeader() {
		return directLeader;
	}

	public void setDirectLeader(User directLeader) {
		this.directLeader = directLeader;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public TreeSet<Department> getChildDepts() {
		return childDepts;
	}

	public void setChildDepts(TreeSet<Department> childDepts) {
		this.childDepts = childDepts;
	}

	public int compareTo(Department dept) {
		if(this.uid > dept.getUid()){
			return 1;
		} else if(this.uid > dept.getUid()){
			return -1;
		}
		return 0;
	}

}