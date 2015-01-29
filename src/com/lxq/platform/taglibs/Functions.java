package com.lxq.platform.taglibs;

import com.lxq.platform.util.ServletUtil;


public class Functions
{
    public static boolean hasRight(com.lxq.platform.userManage.pojo.User user , String operate, String className)
    {
		return user.hasRight(operate, className);
    }

    public static boolean hasRole(com.lxq.platform.userManage.pojo.User user , String roleId)
    {
    	return user.hasRole(roleId);
    }

    
    public static String getValue(String value)
    {
    	return value;
    }
    
    public static String getAllRoleUidToString(){
    	return ServletUtil.getCurUser().getAllRoleUidToString();
    }
}
