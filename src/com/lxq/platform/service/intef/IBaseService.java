package com.lxq.platform.service.intef;

import java.io.Serializable;
import java.util.List;

import net.sf.json.JSONObject;

import com.lxq.platform.exception.PrivilegeException;

/**
 * 基础通用服务
 * @author lixueqing
 *
 */
public interface IBaseService {
	/**
	 * 根据主键获取一条记录
	 * @param className 实体类名称
	 * @param id 主键
	 * @return 实体类
	 * @throws ClassNotFoundException
	 */
	public Object findById(Class<?> c , Serializable id);

	/**
	 * @param c 实体类名称
	 * @param jb json对象
	 * @return 完整实体类对象
	 */
	public Object findByObject(Class<?> c, JSONObject jb);
	
	/**
	 * 根据sql语句获取一条记录
	 * @param sql 查询语句
	 * @return 实体类
	 */
	public Object findUniqueBySql(Class<?> c , String sql);

	/**
	 * 根据sql获取记录集
	 * @param sql 查询语句
	 * @return 实体类集合
	 */
	public List<?> findBySql(Class<?> c , String sql);
	
	/**
	 * 根据sql获取分页记录集
	 * @param sql 查询语句
	 * @param firstResult 记录开始位置
	 * @param maxResults 最大的记录条数
	 * @return 实体类集合
	 */
    public List<?> findBySql(Class<?> c , String sql , int firstResult , int maxResults);
	
    /**
     * 根据sql获取记录总数
     * @param sql 查询语句
     * @return 记录总数
     */
	public int getCount(String sql);
		
	
	/**
	 * 保存实体对象
	 * @param entity 实体对象
	 * @param user 操作用户
	 * @param ipAddress 用户登录ip
	 * @param message 操作内容
	 * @throws Exception
	 */
	public void add(Object entity ,String message) throws PrivilegeException;
	
	
	/**
	 * 保存实体
	 * @param entity 实体类
	 * @throws Exception
	 */
	public void add(Object entity) throws PrivilegeException;
	
	/**
	 * 更新实体
	 * @param entity 实体对象
	 * @param user 操作用户
	 * @param ipAddress 用户登录ip
	 * @param message 操作内容
	 * @throws Exception
	 */
	public void update(Object entity , String message) throws PrivilegeException ;
	
	
	/**
	 * 更新实体
	 * @param entity 实体类
	 * @throws Exception
	 */
	public void update(Object entity) throws PrivilegeException;
	
	/**
	 * 删除实体对象
	 * @param entity 实体对象
	 * @param user 操作用户
	 * @param ipAddress 用户登录ip
	 * @param message 操作内容
	 * @throws Exception
	 */
	public void delete(Object entity, String message) throws PrivilegeException ;

	/**
	 * 删除实体
	 * @param entity 实体类
	 * @throws Exception
	 */
	public void delete(Object entity) throws PrivilegeException;
	
}
